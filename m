Received: from 66-220-155-179.mail-mxout.facebook.com (66-220-155-179.mail-mxout.facebook.com [66.220.155.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE9D7E0
	for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 03:49:20 +0000 (UTC)
Received: by devbig309.ftw3.facebook.com (Postfix, from userid 128203)
	id 8190E255BDB3C; Thu, 24 Aug 2023 20:46:59 -0700 (PDT)
From: Yonghong Song <yonghong.song@linux.dev>
To: Kees Cook <keescook@chromium.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Petr Mladek <pmladek@suse.com>,
	Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: Fangrui Song <maskray@google.com>,
	kernel-team@fb.com,
	Leizhen <thunder.leizhen@huawei.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel test robot <oliver.sang@intel.com>
Subject: [PATCH] kallsyms: Fix kallsyms_selftest failure
Date: Thu, 24 Aug 2023 20:46:59 -0700
Message-Id: <20230825034659.1037627-1-yonghong.song@linux.dev>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Kernel test robot reported a kallsyms_test failure when clang lto is
enabled (thin or full) and CONFIG_KALLSYMS_SELFTEST is also enabled.
I can reproduce in my local environment with the following error message
with thin lto:
  [    1.877897] kallsyms_selftest: Test for 1750th symbol failed: (tsc_c=
s_mark_unstable) addr=3Dffffffff81038090
  [    1.877901] kallsyms_selftest: abort

It appears that commit 8cc32a9bbf29 ("kallsyms: strip LTO-only suffixes
from promoted global functions") caused the failure. Commit 8cc32a9bbf29
changed cleanup_symbol_name() based on ".llvm." instead of '.' where
".llvm." is appended to a before-lto-optimization local symbol name.
We need to propagate such knowledge in kallsyms_selftest.c as well.

Further more, compare_symbol_name() in kallsyms.c needs change as well.
In scripts/kallsyms.c, kallsyms_names and kallsyms_seqs_of_names are used
to record symbol names themselves and index to symbol names respectively.
For example:
  kallsyms_names:
    ...
    __amd_smn_rw._entry       <=3D=3D seq 1000
    __amd_smn_rw._entry.5     <=3D=3D seq 1001
    __amd_smn_rw.llvm.<hash>  <=3D=3D seq 1002
    ...

kallsyms_seqs_of_names are sorted based on cleanup_symbol_name() through,=
 so
the order in kallsyms_seqs_of_names actually has

  index 1000:   seq 1002   <=3D=3D __amd_smn_rw.llvm.<hash> (actual symbo=
l comparison using '__amd_smn_rw')
  index 1001:   seq 1000   <=3D=3D __amd_smn_rw._entry
  index 1002:   seq 1001   <=3D=3D __amd_smn_rw._entry.5

Let us say at a particular point, at index 1000, symbol '__amd_smn_rw.llv=
m.<hash>'
is comparing to '__amd_smn_rw._entry' where '__amd_smn_rw._entry' is the =
one to
search e.g., with function kallsyms_on_each_match_symbol(). The current i=
mplementation
will find out '__amd_smn_rw._entry' is less than '__amd_smn_rw.llvm.<hash=
>' and
then continue to search e.g., index 999 and never found a match although =
the actual
index 1001 is a match.

To fix this issue, let us do cleanup_symbol_name() first and then do comp=
arison.
In the above case, comparing '__amd_smn_rw' vs '__amd_smn_rw._entry' and
'__amd_smn_rw._entry' being greater than '__amd_smn_rw', the next compari=
son will
be > index 1000 and eventually index 1001 will be hit an a match is found=
.

For any symbols not having '.llvm.' substr, there is no functionality cha=
nge
for compare_symbol_name().

Fixes: 8cc32a9bbf29 ("kallsyms: strip LTO-only suffixes from promoted glo=
bal functions")
Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202308232200.1c932a90-oliver.sang@=
intel.com
Signed-off-by: Yonghong Song <yonghong.song@linux.dev>
---
 kernel/kallsyms.c          | 17 +++++++----------
 kernel/kallsyms_selftest.c | 23 +----------------------
 2 files changed, 8 insertions(+), 32 deletions(-)

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index 016d997131d4..e12d26c10dba 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -188,16 +188,13 @@ static bool cleanup_symbol_name(char *s)
=20
 static int compare_symbol_name(const char *name, char *namebuf)
 {
-	int ret;
-
-	ret =3D strcmp(name, namebuf);
-	if (!ret)
-		return ret;
-
-	if (cleanup_symbol_name(namebuf) && !strcmp(name, namebuf))
-		return 0;
-
-	return ret;
+	/* The kallsyms_seqs_of_names is sorted based on names after
+	 * cleanup_symbol_name() (see scripts/kallsyms.c) if clang lto is enabl=
ed.
+	 * To ensure correct bisection in kallsyms_lookup_names(), do
+	 * cleanup_symbol_name(namebuf) before comparing name and namebuf.
+	 */
+	cleanup_symbol_name(namebuf);
+	return strcmp(name, namebuf);
 }
=20
 static unsigned int get_symbol_seq(int index)
diff --git a/kernel/kallsyms_selftest.c b/kernel/kallsyms_selftest.c
index a2e3745d15c4..e05ddc33a752 100644
--- a/kernel/kallsyms_selftest.c
+++ b/kernel/kallsyms_selftest.c
@@ -196,7 +196,7 @@ static bool match_cleanup_name(const char *s, const c=
har *name)
 	if (!IS_ENABLED(CONFIG_LTO_CLANG))
 		return false;
=20
-	p =3D strchr(s, '.');
+	p =3D strstr(s, ".llvm.");
 	if (!p)
 		return false;
=20
@@ -344,27 +344,6 @@ static int test_kallsyms_basic_function(void)
 			goto failed;
 		}
=20
-		/*
-		 * The first '.' may be the initial letter, in which case the
-		 * entire symbol name will be truncated to an empty string in
-		 * cleanup_symbol_name(). Do not test these symbols.
-		 *
-		 * For example:
-		 * cat /proc/kallsyms | awk '{print $3}' | grep -E "^\." | head
-		 * .E_read_words
-		 * .E_leading_bytes
-		 * .E_trailing_bytes
-		 * .E_write_words
-		 * .E_copy
-		 * .str.292.llvm.12122243386960820698
-		 * .str.24.llvm.12122243386960820698
-		 * .str.29.llvm.12122243386960820698
-		 * .str.75.llvm.12122243386960820698
-		 * .str.99.llvm.12122243386960820698
-		 */
-		if (IS_ENABLED(CONFIG_LTO_CLANG) && !namebuf[0])
-			continue;
-
 		lookup_addr =3D kallsyms_lookup_name(namebuf);
=20
 		memset(stat, 0, sizeof(*stat));
--=20
2.34.1

