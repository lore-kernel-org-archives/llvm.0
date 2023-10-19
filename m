Received: from cmccmta1.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBEDF38C
	for <llvm@lists.linux.dev>; Thu, 19 Oct 2023 01:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee165308384a14-122e2;
	Thu, 19 Oct 2023 09:16:55 +0800 (CST)
X-RM-TRANSID:2ee165308384a14-122e2
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from ubuntu.localdomain (unknown[10.54.5.255])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee665308385d83-50e4c;
	Thu, 19 Oct 2023 09:16:54 +0800 (CST)
X-RM-TRANSID:2ee665308385d83-50e4c
From: zhujun2 <zhujun2@cmss.chinamobile.com>
To: skhan@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev,
	nathan@kernel.org,
	ndesaulniers@google.com,
	shuah@kernel.org,
	trix@redhat.com,
	zhujun2@cmss.chinamobile.com
Subject: [PATCH] selftests:modify the incorrect print format
Date: Wed, 18 Oct 2023 18:16:52 -0700
Message-Id: <20231019011652.20343-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <d686781f-9594-4a57-ba59-9ad26532fd3e@linuxfoundation.org>
References: <d686781f-9594-4a57-ba59-9ad26532fd3e@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

when the argument type is 'unsigned int',printf '%u'
in format string that this problem was discovered 
by code reading

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



