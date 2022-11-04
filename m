Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD24DBA34
	for <llvm@lists.linux.dev>; Fri,  4 Nov 2022 23:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667606364; x=1699142364;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hbMbA2gtORlmZXrbEO3nvATlX8xycbXUes0wIx18t3s=;
  b=CW18EgI9otytfue6OMiFIbx32E9WIYOpY+Wv//GsD6M3Wr7LhYeVEOQ0
   j/o3XAzfhncp+GsPryZXe+lQ2+Xyryzdih6Kmmn4KfhiFaKbGVnNL/7MT
   j1B4Cs87qsnPiBbZV4l3Jq4PfOVJ98tYNYk9ux04ymUmFqNECKaVUl77c
   c8wwcZfDDCPlLLptZrE3ys903bbA6GH2DL9maps89eXcS2gtlP52XXebk
   jZ088BMoY9/PjklETP3eAHWjVGMSIz2W89a4TPm0+6Jk2dtvn8OejPhTa
   u3e+vFv8GtSIFNPPkcxcY6yJWynEIdts0thCntc2ot+784WVQIVTr/5Ir
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="289827750"
X-IronPort-AV: E=Sophos;i="5.96,139,1665471600"; 
   d="scan'208";a="289827750"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2022 16:59:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="880470963"
X-IronPort-AV: E=Sophos;i="5.96,139,1665471600"; 
   d="scan'208";a="880470963"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 04 Nov 2022 16:59:21 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C79D6F7; Sat,  5 Nov 2022 01:59:44 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vincent Knecht <vincent.knecht@mailoo.org>,
	Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v1 1/1] leds: is31fl319x: Wrap mutex_destroy() for devm_add_action_or_rest()
Date: Sat,  5 Nov 2022 01:59:40 +0200
Message-Id: <20221104235940.74044-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang complains that devm_add_action() takes a parameter with a wrong type:

warning: cast from 'void (*)(struct mutex *)' to 'void (*)(void *)' converts to incompatible function type [-Wcast-function-type-strict]
    err = devm_add_action(dev, (void (*)(void *))mutex_destroy, &is31->lock);
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1 warning generated.

It appears that the commit e1af5c815586 ("leds: is31fl319x: Fix devm vs.
non-devm ordering") missed two things:
- while mention devm_add_action_or_reset() the actual change got
  devm_add_action() call by unknown reason
- strictly speaking the parameter is not compatible by type

Fix both issues by switching to devm_add_action_or_reset() and adding a
wrapper for mutex_destroy() call.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: e1af5c815586 ("leds: is31fl319x: Fix devm vs. non-devm ordering")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/leds-is31fl319x.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319x.c
index 52b59b62f437..6f94ad83e066 100644
--- a/drivers/leds/leds-is31fl319x.c
+++ b/drivers/leds/leds-is31fl319x.c
@@ -494,6 +494,11 @@ static inline int is31fl3196_db_to_gain(u32 dezibel)
 	return dezibel / IS31FL3196_AUDIO_GAIN_DB_STEP;
 }
 
+static void is31f1319x_mutex_destroy(void *lock)
+{
+	mutex_destroy(lock);
+}
+
 static int is31fl319x_probe(struct i2c_client *client)
 {
 	struct is31fl319x_chip *is31;
@@ -510,7 +515,7 @@ static int is31fl319x_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	mutex_init(&is31->lock);
-	err = devm_add_action(dev, (void (*)(void *))mutex_destroy, &is31->lock);
+	err = devm_add_action_or_reset(dev, is31f1319x_mutex_destroy, &is31->lock);
 	if (err)
 		return err;
 
-- 
2.35.1

