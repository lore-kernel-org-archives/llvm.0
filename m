Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001ED1FB2;
	Tue, 17 Jan 2023 08:03:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64F5CC433EF;
	Tue, 17 Jan 2023 08:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673942602;
	bh=mXWwdlqjrMqIueWHc+cPhSiiJN4N+NZbzWaDf42Wsf4=;
	h=From:To:Cc:Subject:Date:From;
	b=PS3gX6Cs9BJTUAQzYo2aM3rmQIQdfmF0gCZVbVrCwxBAVmAC96XfSltjZ40F9jk/4
	 E0fKduH+Wqe64q6zX+MHOsxv2iK8ADO7DiOKJE4/qnJhnXFu14+RVeHchPZhStSUoX
	 Dnxwov6Hzd7uxg1bQaYyV+r6rSsy6vXTtBOhoYE9EyCPvz8JUiQRbz/tYfjA2S7hEP
	 aEN0wDsUcu3mwEXWzvglrJpEkGBAIUPQrUJiUpBzai+CI2ag6TlKmzVkJJ1bhUI7gg
	 GISRn4JPYkQgoxjomMJ9v3bnTNVeDvTnNLSRHJhAbjmydJZ28wYIGGT9mUgnVQQt37
	 fplKd1mmiZdoA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: tzungbi@kernel.org,
	chrome-platform@lists.linux.dev,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] platform/chrome: cros_ec_proto: remove big stub objects from stack
Date: Tue, 17 Jan 2023 16:02:54 +0800
Message-Id: <20230117080254.2725536-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.39.0.246.g2a6d74b583-goog
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sizeof(struct device) = 680
sizeof(struct cros_ec_dev) = 720

They tend to exceed the stack frame size limit in some specific
environment which results in the following compilation error:

>> drivers/platform/chrome/cros_ec_proto_test.c:2530:13: error: stack
frame size (2128) exceeds limit (2048) in
'cros_ec_proto_test_get_sensor_count_legacy'

Remove the big stub objects from stack.

This is:
$ sed -i 's/struct cros_ec_dev /static struct cros_ec_dev /' \
    drivers/platform/chrome/cros_ec_proto_test.c

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_proto_test.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
index 08c58d031593..5b9748e0463b 100644
--- a/drivers/platform/chrome/cros_ec_proto_test.c
+++ b/drivers/platform/chrome/cros_ec_proto_test.c
@@ -2371,7 +2371,7 @@ static void cros_ec_proto_test_get_host_event_normal(struct kunit *test)
 static void cros_ec_proto_test_check_features_cached(struct kunit *test)
 {
 	int ret, i;
-	struct cros_ec_dev ec;
+	static struct cros_ec_dev ec;
 
 	ec.features.flags[0] = EC_FEATURE_MASK_0(EC_FEATURE_FINGERPRINT);
 	ec.features.flags[1] = EC_FEATURE_MASK_0(EC_FEATURE_SCP);
@@ -2396,7 +2396,7 @@ static void cros_ec_proto_test_check_features_not_cached(struct kunit *test)
 	struct cros_ec_device *ec_dev = &priv->ec_dev;
 	struct ec_xfer_mock *mock;
 	int ret, i;
-	struct cros_ec_dev ec;
+	static struct cros_ec_dev ec;
 
 	ec_dev->max_request = 0xff;
 	ec_dev->max_response = 0xee;
@@ -2449,7 +2449,7 @@ static void cros_ec_proto_test_get_sensor_count_normal(struct kunit *test)
 	struct cros_ec_device *ec_dev = &priv->ec_dev;
 	struct ec_xfer_mock *mock;
 	int ret;
-	struct cros_ec_dev ec;
+	static struct cros_ec_dev ec;
 
 	ec_dev->max_request = 0xff;
 	ec_dev->max_response = 0xee;
@@ -2494,7 +2494,7 @@ static void cros_ec_proto_test_get_sensor_count_xfer_error(struct kunit *test)
 	struct cros_ec_device *ec_dev = &priv->ec_dev;
 	struct ec_xfer_mock *mock;
 	int ret;
-	struct cros_ec_dev ec;
+	static struct cros_ec_dev ec;
 
 	ec_dev->max_request = 0xff;
 	ec_dev->max_response = 0xee;
@@ -2534,7 +2534,7 @@ static void cros_ec_proto_test_get_sensor_count_legacy(struct kunit *test)
 	struct cros_ec_device *ec_dev = &priv->ec_dev;
 	struct ec_xfer_mock *mock;
 	int ret, i;
-	struct cros_ec_dev ec;
+	static struct cros_ec_dev ec;
 	struct {
 		u8 readmem_data;
 		int expected_result;
-- 
2.39.0.246.g2a6d74b583-goog

