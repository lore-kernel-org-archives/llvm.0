Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
	(using TLSv1.2 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093657C
	for <llvm@lists.linux.dev>; Thu,  4 Aug 2022 17:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1659635317; x=1691171317;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=I5D1a4UZV44LwqUu3iIdrVtuXEKbxqsE2BElo/08fM4=;
  b=F36vV1lmoLdZiTpYO0nBsq1Bu9829M3hLELk5qqNhvOSPOCc8dKMvXKn
   olAiOFZZLWdWe3YiKol9MXzcokrBXoJgtM9NbhDVJxHsY/amLF0vywdwL
   SQwNKSG9c3lw7j6AIm6j26VgeMm9+v7kHZUDcuMFWa/GEOlTv+bfutjj0
   0=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 04 Aug 2022 10:46:28 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2022 10:46:28 -0700
Received: from hu-gurus-sd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 4 Aug 2022 10:46:28 -0700
From: Guru Das Srinagesh <quic_gurus@quicinc.com>
To: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
	<ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
CC: Elliot Berman <quic_eberman@quicinc.com>, <llvm@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Guru Das Srinagesh <quic_gurus@quicinc.com>
Subject: [PATCH] scripts/clang-tools: Remove DeprecatedOrUnsafeBufferHandling check
Date: Thu, 4 Aug 2022 10:46:14 -0700
Message-ID: <1659635174-2376-1-git-send-email-quic_gurus@quicinc.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)

This `clang-analyzer` check flags the use of memset(), suggesting a more
secure version of the API, such as memset_s(), which does not exist in
the kernel:

  warning: Call to function 'memset' is insecure as it does not provide
  security checks introduced in the C11 standard. Replace with analogous
  functions that support length arguments or provides boundary checks such
  as 'memset_s' in case of C11
  [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]

Signed-off-by: Guru Das Srinagesh <quic_gurus@quicinc.com>
---
 scripts/clang-tools/run-clang-tools.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
index f754415a..1337ced 100755
--- a/scripts/clang-tools/run-clang-tools.py
+++ b/scripts/clang-tools/run-clang-tools.py
@@ -51,6 +51,7 @@ def run_analysis(entry):
         checks += "linuxkernel-*"
     else:
         checks += "clang-analyzer-*"
+        checks += ",-clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling"
     p = subprocess.run(["clang-tidy", "-p", args.path, checks, entry["file"]],
                        stdout=subprocess.PIPE,
                        stderr=subprocess.STDOUT,
-- 
2.7.4

