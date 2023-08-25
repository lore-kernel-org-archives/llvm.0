Received: from 69-171-232-180.mail-mxout.facebook.com (69-171-232-180.mail-mxout.facebook.com [69.171.232.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952E31803F
	for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 20:20:59 +0000 (UTC)
Received: by devbig309.ftw3.facebook.com (Postfix, from userid 128203)
	id 06E272565E783; Fri, 25 Aug 2023 13:20:37 -0700 (PDT)
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
	llvm@lists.linux.dev
Subject: [PATCH] kallsyms: Change func signature for cleanup_symbol_name()
Date: Fri, 25 Aug 2023 13:20:36 -0700
Message-Id: <20230825202036.441212-1-yonghong.song@linux.dev>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

All users of cleanup_symbol_name() do not use the return value.
So let us change the return value of cleanup_symbol_name() to
'void' to reflect its usage pattern.

Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Yonghong Song <yonghong.song@linux.dev>
---
 kernel/kallsyms.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

NOTE:
This patch needs to be applied after the following patch:
https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?id=
=3D33f0467fe069

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index e12d26c10dba..18edd57b5fe8 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -163,12 +163,12 @@ unsigned long kallsyms_sym_address(int idx)
 	return kallsyms_relative_base - 1 - kallsyms_offsets[idx];
 }
=20
-static bool cleanup_symbol_name(char *s)
+static void cleanup_symbol_name(char *s)
 {
 	char *res;
=20
 	if (!IS_ENABLED(CONFIG_LTO_CLANG))
-		return false;
+		return;
=20
 	/*
 	 * LLVM appends various suffixes for local functions and variables that
@@ -178,12 +178,10 @@ static bool cleanup_symbol_name(char *s)
 	 * - foo.llvm.[0-9a-f]+
 	 */
 	res =3D strstr(s, ".llvm.");
-	if (res) {
+	if (res)
 		*res =3D '\0';
-		return true;
-	}
=20
-	return false;
+	return;
 }
=20
 static int compare_symbol_name(const char *name, char *namebuf)
--=20
2.34.1

