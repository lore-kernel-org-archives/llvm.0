Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45902103
	for <llvm@lists.linux.dev>; Wed, 28 Jun 2023 06:45:04 +0000 (UTC)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
	by m0089730.ppops.net (8.17.1.19/8.17.1.19) with ESMTP id 35S1R5ri018088
	for <llvm@lists.linux.dev>; Tue, 27 Jun 2023 23:45:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=facebook; bh=/1iNjEhSI1x//A140OvaC7WQBC5Y/8Enz6JnfFqod+s=;
 b=TJtVZKmhMRM2FZRHTG94BmIMi40TlUcDt5UoFXsyAkCBlnoAJgzVZoY9AM+d/9eurVTF
 jxP5zyzg94dF9UnEC5zGq3Pde3rd2MEurD1EEbu2ah93ZOmKp0zG74UpwjHB9UlR9Kr6
 QBcT8E5s4Y1PE+9s5qcbW95lPaVrW99WT40= 
Received: from maileast.thefacebook.com ([163.114.130.16])
	by m0089730.ppops.net (PPS) with ESMTPS id 3rfp4gcbjc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 27 Jun 2023 23:44:54 -0700
Received: from twshared18891.17.frc2.facebook.com (2620:10d:c0a8:1c::1b) by
 mail.thefacebook.com (2620:10d:c0a8:82::e) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 27 Jun 2023 23:44:52 -0700
Received: by devbig309.ftw3.facebook.com (Postfix, from userid 128203)
	id 0F701220F0921; Tue, 27 Jun 2023 23:44:33 -0700 (PDT)
From: Yonghong Song <yhs@fb.com>
To: Nick Desaulniers <ndesaulniers@google.com>,
        Petr Mladek
	<pmladek@suse.com>, Song Liu <song@kernel.org>
CC: Fangrui Song <maskray@google.com>, <kernel-team@fb.com>,
        Leizhen
	<thunder.leizhen@huawei.com>, <linux-kernel@vger.kernel.org>,
        <llvm@lists.linux.dev>
Subject: [PATCH] kallsyms: strip LTO-only suffixes from promoted global functions
Date: Tue, 27 Jun 2023 23:44:33 -0700
Message-ID: <20230628064433.2859335-1-yhs@fb.com>
X-Mailer: git-send-email 2.34.1
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: LtCYgY6WJXKVUaQ77bLG4HBaHnocPaoM
X-Proofpoint-GUID: LtCYgY6WJXKVUaQ77bLG4HBaHnocPaoM
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
 definitions=2023-06-28_03,2023-06-27_01,2023-05-22_02

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

 [1] https://lore.kernel.org/live-patching/20230615170048.2382735-1-song@ke=
rnel.org/T/#u

Fixes: 6eb4bd92c1ce ("kallsyms: strip LTO suffixes from static functions")
Signed-off-by: Yonghong Song <yhs@fb.com>
---
 kernel/kallsyms.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

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
--=20
2.34.1

