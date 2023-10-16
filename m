Received: from cmccmta1.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0C36620
	for <llvm@lists.linux.dev>; Mon, 16 Oct 2023 02:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee4652ca502bbb-fe48b;
	Mon, 16 Oct 2023 10:50:42 +0800 (CST)
X-RM-TRANSID:2ee4652ca502bbb-fe48b
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from ubuntu.localdomain (unknown[10.54.5.252])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee2652ca500a2c-27a95;
	Mon, 16 Oct 2023 10:50:41 +0800 (CST)
X-RM-TRANSID:2ee2652ca500a2c-27a95
From: zhujun2 <zhujun2@cmss.chinamobile.com>
To: shuah@kernel.org
Cc: nathan@kernel.org,
	ndesaulniers@google.com,
	trix@redhat.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	zhujun2@cmss.chinamobile.com
Subject: [PATCH] selftests:modify the incorrect print format
Date: Sun, 15 Oct 2023 19:50:38 -0700
Message-Id: <20231016025038.1677-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

printf %d in format string requires 'int' but the argument type is 'unsigned int'

Signed-off-by: zhujun2 <zhujun2@cmss.chinamobile.com>
---
 tools/testing/selftests/kselftest.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selftests/kselftest.h
index 529d29a35..bec2fae58 100644
--- a/tools/testing/selftests/kselftest.h
+++ b/tools/testing/selftests/kselftest.h
@@ -129,7 +129,7 @@ static inline void ksft_print_header(void)
 static inline void ksft_set_plan(unsigned int plan)
 {
 	ksft_plan = plan;
-	printf("1..%d\n", ksft_plan);
+	printf("1..%u\n", ksft_plan);
 }
 
 static inline void ksft_print_cnts(void)
@@ -137,7 +137,7 @@ static inline void ksft_print_cnts(void)
 	if (ksft_plan != ksft_test_num())
 		printf("# Planned tests != run tests (%u != %u)\n",
 			ksft_plan, ksft_test_num());
-	printf("# Totals: pass:%d fail:%d xfail:%d xpass:%d skip:%d error:%d\n",
+	printf("# Totals: pass:%u fail:%u xfail:%u xpass:%u skip:%u error:%u\n",
 		ksft_cnt.ksft_pass, ksft_cnt.ksft_fail,
 		ksft_cnt.ksft_xfail, ksft_cnt.ksft_xpass,
 		ksft_cnt.ksft_xskip, ksft_cnt.ksft_error);
@@ -163,7 +163,7 @@ static inline void ksft_test_result_pass(const char *msg, ...)
 	ksft_cnt.ksft_pass++;
 
 	va_start(args, msg);
-	printf("ok %d ", ksft_test_num());
+	printf("ok %u ", ksft_test_num());
 	errno = saved_errno;
 	vprintf(msg, args);
 	va_end(args);
@@ -177,7 +177,7 @@ static inline void ksft_test_result_fail(const char *msg, ...)
 	ksft_cnt.ksft_fail++;
 
 	va_start(args, msg);
-	printf("not ok %d ", ksft_test_num());
+	printf("not ok %u ", ksft_test_num());
 	errno = saved_errno;
 	vprintf(msg, args);
 	va_end(args);
@@ -203,7 +203,7 @@ static inline void ksft_test_result_xfail(const char *msg, ...)
 	ksft_cnt.ksft_xfail++;
 
 	va_start(args, msg);
-	printf("ok %d # XFAIL ", ksft_test_num());
+	printf("ok %u # XFAIL ", ksft_test_num());
 	errno = saved_errno;
 	vprintf(msg, args);
 	va_end(args);
@@ -217,7 +217,7 @@ static inline void ksft_test_result_skip(const char *msg, ...)
 	ksft_cnt.ksft_xskip++;
 
 	va_start(args, msg);
-	printf("ok %d # SKIP ", ksft_test_num());
+	printf("ok %u # SKIP ", ksft_test_num());
 	errno = saved_errno;
 	vprintf(msg, args);
 	va_end(args);
@@ -232,7 +232,7 @@ static inline void ksft_test_result_error(const char *msg, ...)
 	ksft_cnt.ksft_error++;
 
 	va_start(args, msg);
-	printf("not ok %d # error ", ksft_test_num());
+	printf("not ok %u # error ", ksft_test_num());
 	errno = saved_errno;
 	vprintf(msg, args);
 	va_end(args);
-- 
2.17.1



