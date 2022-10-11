Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
	(using TLSv1.2 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8011B3D7A
	for <llvm@lists.linux.dev>; Tue, 11 Oct 2022 19:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1665515296; x=1697051296;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=ILP6lC9qOdbFL3ALxKp8xEJRrZpkoLP2MTnKGw5NKRM=;
  b=WWLb0BfWdORnWtRkIv7FcHXjBbdUIQ8AXQsernDG98Cdz9vsKvj2HwXs
   4kUfC1R0VeWYcYymMmNkby21YkSeSThvG/13o6/PCixuuFlbtVOZqDke8
   dhHZNn4WQpQtHWVbtz/QOO40LR+BxGNoXznGRh5uZ9jDfM+jayIqprm4h
   U=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 11 Oct 2022 12:06:07 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2022 12:06:07 -0700
Received: from hu-gurus-sd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 11 Oct 2022 12:06:06 -0700
From: Guru Das Srinagesh <quic_gurus@quicinc.com>
To: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
	<ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
CC: Elliot Berman <quic_eberman@quicinc.com>, John Moon
	<quic_johmoo@quicinc.com>, <llvm@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Guru Das Srinagesh <quic_gurus@quicinc.com>
Subject: [PATCH 1/1] scripts/clang-tools: Convert clang-tidy args to list
Date: Tue, 11 Oct 2022 12:06:00 -0700
Message-ID: <a10e25f13205cb96e1ad63f1b1371a76f37af549.1665515051.git.quic_gurus@quicinc.com>
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

Convert list of clang-tidy arguments to a list for ease of adding to
them and extending them as required.

Signed-off-by: Guru Das Srinagesh <quic_gurus@quicinc.com>
Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
---
 scripts/clang-tools/run-clang-tools.py | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
index bb78c9b..56f2ec8 100755
--- a/scripts/clang-tools/run-clang-tools.py
+++ b/scripts/clang-tools/run-clang-tools.py
@@ -45,13 +45,14 @@ def init(l, a):
 
 def run_analysis(entry):
     # Disable all checks, then re-enable the ones we want
-    checks = "-checks=-*,"
+    checks = []
+    checks.append("-checks=-*")
     if args.type == "clang-tidy":
-        checks += "linuxkernel-*"
+        checks.append("linuxkernel-*")
     else:
-        checks += "clang-analyzer-*"
-        checks += ",-clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling"
-    p = subprocess.run(["clang-tidy", "-p", args.path, checks, entry["file"]],
+        checks.append("clang-analyzer-*")
+        checks.append("-clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling")
+    p = subprocess.run(["clang-tidy", "-p", args.path, ",".join(checks), entry["file"]],
                        stdout=subprocess.PIPE,
                        stderr=subprocess.STDOUT,
                        cwd=entry["directory"])
-- 
2.7.4

