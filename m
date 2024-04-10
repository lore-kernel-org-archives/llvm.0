Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D8A1802C8
	for <llvm@lists.linux.dev>; Wed, 10 Apr 2024 20:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712780572; cv=none; b=lpZCSPj/sE7KDdjYYI4xbL17hPIe85w9NLbWp6gBbXvjMehZiKRl84TcANhB0b4mbqcVZM75cg9y5TtSGy99u5OKb/RQOS0vc0BiBea3RBWTj8hfPMwJ4dtRpVA3/r8luKUWecQMhVgRxEVJ7UW5UqMzsWhXRz0Wra0X8Os6pgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712780572; c=relaxed/simple;
	bh=+2HZiSpbT1DVyz7ooUfdwbZ8UU3WoCwyFIEyBe958GA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sgA9DK9hAeFDvYooaEYXW5YwpBlpSwjGgekxRGR/JdMBlgcPpLbvv9ZKz4UTBhWqdFBSekg6ZY3wO9zW3jEG/B0ohC4xLlyG/PEMKxu0HLqhRxwS4BHEYOi5l9ljdN326Ez8w8hLFfzTQ3TuZyLNhu76UwNCWeLojjvtmpPUHXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gXAx8KkK; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gXAx8KkK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712780571; x=1744316571;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+2HZiSpbT1DVyz7ooUfdwbZ8UU3WoCwyFIEyBe958GA=;
  b=gXAx8KkKtXsM9jcSezVR0Rif24S2hHLjN5rQwgCUW0usBppQayRnlEi2
   N9Nowl5tTp6w2te6U5Ya46s4WBpZnL5M5rIx8BzTEERXxS1oZ9A2pdMpk
   BLfyGkOGuiMvhTCeYmYd55Ihx4Wygz0B4ADGeetiFyG9NP2DDJydUaork
   3Jtrx2DjI9l5Y0zOlDPImb2y2guW6KMvk3KLbKHNaDR7x5yNjVyV126S5
   GrLZCw2MJKJ/rv3HgrMKddRcuYyE+l2F383makMHvroKyZapyTpHDIlRr
   i06ikZcbeASlM48qCsMQOuBCljYEizm7zR0xLWLzV423JMdToCC9BqsPh
   A==;
X-CSE-ConnectionGUID: NK5BBvYzQ32sh9Lvq+BRhw==
X-CSE-MsgGUID: Xv+kXy+vSVi0cCClm1zD8A==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11960665"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="11960665"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 13:22:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="937095429"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="937095429"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 10 Apr 2024 13:22:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 14B151A6; Wed, 10 Apr 2024 23:22:45 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: [PATCH v1 1/2] gpiolib: acpi: Remove never true check in acpi_get_gpiod_by_index()
Date: Wed, 10 Apr 2024 23:21:46 +0300
Message-ID: <20240410202243.1658129-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240410202243.1658129-1-andriy.shevchenko@linux.intel.com>
References: <20240410202243.1658129-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The acpi_get_gpiod_by_index() never is called with adev being NULL.
Remove the redundant check.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-acpi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 7f140df40f35..f596edf89451 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -873,9 +873,6 @@ static struct gpio_desc *acpi_get_gpiod_by_index(struct acpi_device *adev,
 	struct acpi_gpio_lookup lookup;
 	int ret;
 
-	if (!adev)
-		return ERR_PTR(-ENODEV);
-
 	memset(&lookup, 0, sizeof(lookup));
 	lookup.index = index;
 
-- 
2.43.0.rc1.1336.g36b5255a03ac

