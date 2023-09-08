Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E62A6FD0
	for <llvm@lists.linux.dev>; Fri,  8 Sep 2023 23:13:05 +0000 (UTC)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 388HqD5F030687
	for <llvm@lists.linux.dev>; Fri, 8 Sep 2023 16:13:04 -0700
Received: from mail.thefacebook.com ([163.114.132.120])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3t06jvvkdt-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Fri, 08 Sep 2023 16:13:04 -0700
Received: from twshared52565.14.frc2.facebook.com (2620:10d:c085:208::11) by
 mail.thefacebook.com (2620:10d:c085:21d::8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 8 Sep 2023 16:13:01 -0700
Received: by devbig932.frc1.facebook.com (Postfix, from userid 4523)
	id 01CBF24087ED5; Fri,  8 Sep 2023 16:12:48 -0700 (PDT)
From: Song Liu <song@kernel.org>
To: <linux-kernel@vger.kernel.org>
CC: <ndesaulniers@google.com>, Song Liu <song@kernel.org>,
        Ricardo Ribalda
	<ribalda@chromium.org>,
        Sami Tolvanen <samitolvanen@google.com>, <kexec@lists.infradead.org>,
        <x86@kernel.org>, <llvm@lists.linux.dev>
Subject: [PATCH v2] x86/purgatory: Remove LTO flags
Date: Fri, 8 Sep 2023 16:12:44 -0700
Message-ID: <20230908231244.1092614-1-song@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: bMJrZCuQPwxkV4xW8nbyWnvtNtaWehqN
X-Proofpoint-ORIG-GUID: bMJrZCuQPwxkV4xW8nbyWnvtNtaWehqN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-08_18,2023-09-05_01,2023-05-22_02

With LTO enabled, ld.lld generates multiple .text sections for
purgatory.ro:

$ readelf -S purgatory.ro  | grep " .text"
  [ 1] .text             PROGBITS         0000000000000000  00000040
  [ 7] .text.purgatory   PROGBITS         0000000000000000  000020e0
  [ 9] .text.warn        PROGBITS         0000000000000000  000021c0
  [13] .text.sha256_upda PROGBITS         0000000000000000  000022f0
  [15] .text.sha224_upda PROGBITS         0000000000000000  00002be0
  [17] .text.sha256_fina PROGBITS         0000000000000000  00002bf0
  [19] .text.sha224_fina PROGBITS         0000000000000000  00002cc0

This cause WARNING from kexec_purgatory_setup_sechdrs():

WARNING: CPU: 26 PID: 110894 at kernel/kexec_file.c:919
kexec_load_purgatory+0x37f/0x390

Fix this by disabling LTO for purgatory.

Fixes: 8652d44f466a ("kexec: support purgatories with .text.hot sections"=
)
Cc: Ricardo Ribalda <ribalda@chromium.org>
Cc: Sami Tolvanen <samitolvanen@google.com>
Cc: kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: x86@kernel.org
Cc: llvm@lists.linux.dev
Signed-off-by: Song Liu <song@kernel.org>

---
AFAICT, x86 is the only arch that supports LTO and purgatory.

Changes in v2:
1. Use CC_FLAGS_LTO instead of hardcode -flto. (Nick Desaulniers)
---
 arch/x86/purgatory/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/purgatory/Makefile b/arch/x86/purgatory/Makefile
index c2a29be35c01..08aa0f25f12a 100644
--- a/arch/x86/purgatory/Makefile
+++ b/arch/x86/purgatory/Makefile
@@ -19,6 +19,10 @@ CFLAGS_sha256.o :=3D -D__DISABLE_EXPORTS -D__NO_FORTIF=
Y
 # optimization flags.
 KBUILD_CFLAGS :=3D $(filter-out -fprofile-sample-use=3D% -fprofile-use=3D=
%,$(KBUILD_CFLAGS))
=20
+# When LTO is enabled, llvm emits many text sections, which is not suppo=
rted
+# by kexec. Remove -flto=3D* flags.
+KBUILD_CFLAGS :=3D $(filter-out $(CC_FLAGS_LTO),$(KBUILD_CFLAGS))
+
 # When linking purgatory.ro with -r unresolved symbols are not checked,
 # also link a purgatory.chk binary without -r to check for unresolved sy=
mbols.
 PURGATORY_LDFLAGS :=3D -e purgatory_start -z nodefaultlib
--=20
2.34.1

