Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD5CD513
	for <llvm@lists.linux.dev>; Wed, 28 Jun 2023 18:19:44 +0000 (UTC)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35SHwYmn020828
	for <llvm@lists.linux.dev>; Wed, 28 Jun 2023 11:19:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=facebook; bh=z0e8QttLPh/Q/9kNelSZTNeMoB4d8XPy6uAeGGRHDJE=;
 b=Sk8OibaWF5PZvTwQEeOU/jmAzItcoR2TAgesKoUjwVBC+85zto95Om++ikJz3cA2/BBK
 nIGDZSWDXULhMZdTIDaqi90Cxvv0uNTKgDCze4dYyKcwCjznKmYJoYLBJuwhnHyzMDLq
 Rq015CyZFnx3lOu1nhhIE9yrgPdpNY0gGGo= 
Received: from mail.thefacebook.com ([163.114.132.120])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3rgreh0xr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 28 Jun 2023 11:19:43 -0700
Received: from twshared18891.17.frc2.facebook.com (2620:10d:c085:208::11) by
 mail.thefacebook.com (2620:10d:c085:11d::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 28 Jun 2023 11:19:42 -0700
Received: by devbig309.ftw3.facebook.com (Postfix, from userid 128203)
	id 994FE22169B1E; Wed, 28 Jun 2023 11:19:26 -0700 (PDT)
From: Yonghong Song <yhs@fb.com>
To: Nick Desaulniers <ndesaulniers@google.com>,
        Petr Mladek
	<pmladek@suse.com>, Song Liu <song@kernel.org>,
        Steven Rostedt
	<rostedt@goodmis.org>
CC: Fangrui Song <maskray@google.com>, <kernel-team@fb.com>,
        Leizhen
	<thunder.leizhen@huawei.com>, <linux-kernel@vger.kernel.org>,
        <llvm@lists.linux.dev>
Subject: [PATCH v2] kallsyms: strip LTO-only suffixes from promoted global functions
Date: Wed, 28 Jun 2023 11:19:26 -0700
Message-ID: <20230628181926.4102448-1-yhs@fb.com>
X-Mailer: git-send-email 2.34.1
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: sBGkioak1AVTJw7gYa4prUETlvR1iWpT
X-Proofpoint-ORIG-GUID: sBGkioak1AVTJw7gYa4prUETlvR1iWpT
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-28_13,2023-06-27_01,2023-05-22_02

Commit 6eb4bd92c1ce ("kallsyms: strip LTO suffixes from static functions")
stripped all function/variable suffixes started with '.' regardless
of whether those suffixes are generated at LTO mode or not. In fact,
as far as I know, in LTO mode, when a static function/variable is
promoted to the global scope, '.llvm.<...>' suffix is added.

The existing mechanism breaks live patch for a LTO kernel even if
no <symbol>.llvm.<...> symbols are involved. For example, for the following
kernel symbols:
  $ grep bpf_verifier_vlog /proc/kallsyms
  ffffffff81549f60 t bpf_verifier_vlog
  ffffffff8268b430 d bpf_verifier_vlog._entry
  ffffffff8282a958 d bpf_verifier_vlog._entry_ptr
  ffffffff82e12a1f d bpf_verifier_vlog.__already_done
'bpf_verifier_vlog' is a static function. '_entry', '_entry_ptr' and
'__already_done' are static variables used inside 'bpf_verifier_vlog',
so llvm promotes them to file-level static with prefix 'bpf_verifier_vlog.'.
Note that the func-level to file-level static function promotion also
happens without LTO.

Given a symbol name 'bpf_verifier_vlog', with LTO kernel, current mechanism=
 will
return 4 symbols to live patch subsystem which current live patching
subsystem cannot handle it. With non-LTO kernel, only one symbol
is returned.

In [1], we have a lengthy discussion, the suggestion is to separate two
cases:
  (1). new symbols with suffix which are generated regardless of whether
       LTO is enabled or not, and
  (2). new symbols with suffix generated only when LTO is enabled.

The cleanup_symbol_name() should only remove suffixes for case (2).
Case (1) should not be changed so it can work uniformly with or without LTO.

This patch removed LTO-only suffix '.llvm.<...>' so live patching and
tracing should work the same way for non-LTO kernel.
The cleanup_symbol_name() in scripts/kallsyms.c is also changed to have the=
 same
filtering pattern so both kernel and kallsyms tool have the same
expectation on the order of symbols.

 [1] https://lore.kernel.org/live-patching/20230615170048.2382735-1-song@ke=
rnel.org/T/#u

Fixes: 6eb4bd92c1ce ("kallsyms: strip LTO suffixes from static functions")
Reported-by: Song Liu <song@kernel.org>
Signed-off-by: Yonghong Song <yhs@fb.com>
---
 kernel/kallsyms.c  | 5 ++---
 scripts/kallsyms.c | 6 +++---
 2 files changed, 5 insertions(+), 6 deletions(-)

Changelogs:
  v1 -> v2:
    . add 'Reported-by: Song Liu <song@kernel.org>'
    . also fix in scripts/kallsyms.c.

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index 77747391f49b..4874508bb950 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -174,11 +174,10 @@ static bool cleanup_symbol_name(char *s)
 	 * LLVM appends various suffixes for local functions and variables that
 	 * must be promoted to global scope as part of LTO.  This can break
 	 * hooking of static functions with kprobes. '.' is not a valid
-	 * character in an identifier in C. Suffixes observed:
+	 * character in an identifier in C. Suffixes only in LLVM LTO observed:
 	 * - foo.llvm.[0-9a-f]+
-	 * - foo.[0-9a-f]+
 	 */
-	res =3D strchr(s, '.');
+	res =3D strstr(s, ".llvm.");
 	if (res) {
 		*res =3D '\0';
 		return true;
diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 0d2db41177b2..13af6d0ff845 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -346,10 +346,10 @@ static void cleanup_symbol_name(char *s)
 	 * ASCII[_]   =3D 5f
 	 * ASCII[a-z] =3D 61,7a
 	 *
-	 * As above, replacing '.' with '\0' does not affect the main sorting,
-	 * but it helps us with subsorting.
+	 * As above, replacing the first '.' in ".llvm." with '\0' does not
+	 * affect the main sorting, but it helps us with subsorting.
 	 */
-	p =3D strchr(s, '.');
+	p =3D strstr(s, ".llvm.");
 	if (p)
 		*p =3D '\0';
 }
--=20
2.34.1

