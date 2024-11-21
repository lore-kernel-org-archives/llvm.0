Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEA814BF87
	for <llvm@lists.linux.dev>; Thu, 21 Nov 2024 10:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732186727; cv=none; b=DagST46RTTCIyMD68iE42FGssqvHQ9k7ktaghYggSsqqfHMgIDX4R8YrljavKd6zA5s4901p6dtxCfbTpkKFgckQb10JO7I9tHsw9NsRiCy38NKmAgBHsoKwFq+KObEiD9C5pUHu9YvmLSQAVMYUmMaS2FpdpenPfyTtt5AV6gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732186727; c=relaxed/simple;
	bh=DiJr9F7ZvlRiG1g4l7rc4I2mcQHoRxGjdHwnfO15tcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YTryZ+AbKFVbPDtREnKHvWtzUj8DeWs4KTVr7TDCg4a/u6dp+xZ66gbNAkaHGlqhlTCSpvWYQI79JnJhb9d5x/7n+XMQEF0yYGeMuhtg/DxhC8gRioG85VBx13tyFtyEYbmNydeJb8kFnz8un8TUCwQuPqzyRaS0esOIFJpT0YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aV/xTwmI; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aV/xTwmI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732186725; x=1763722725;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DiJr9F7ZvlRiG1g4l7rc4I2mcQHoRxGjdHwnfO15tcA=;
  b=aV/xTwmI5403TxjGtOFySxVsM+UNkjhfhbYYQ7eMS/xV3FQDbmEwwfCG
   vvhRela/HWBJYcM8d30FlXw4sblozwQrUQoDGbRIGdn6b11ZK4aRLjTgB
   M2OjJpdJaR9FNxPGb6YGvDmHblosVfljJt0C49m6T9Hy5iu7WhIv7uPlQ
   Y9iZhLo0FiXK+kbuz0zh1f44RZFAxYRRNWI1pm0LXeVJ7N0p1WiZdEx10
   i/lSmuMHQ12lhsKv+fJ/A3ujKT0QWLZH2ytUXUMr9Ces8lA21bb5RvbZ6
   xUE/CpeWGgZy4fNshhD06z6GkdwOJYlChYNJ8LuIvq19gRXBw7VDAIwPN
   g==;
X-CSE-ConnectionGUID: 4/8JFtawSmW4Aj3IY5NuHA==
X-CSE-MsgGUID: I3CHvGvYQpCcHDf46RB6PQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="43687808"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="43687808"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 02:58:45 -0800
X-CSE-ConnectionGUID: 5/897DWJQI+aZte+TmtA3Q==
X-CSE-MsgGUID: TSIQEdXdTzqHqTLp2LgDgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="90623761"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 21 Nov 2024 02:58:42 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 2CF8E18E; Thu, 21 Nov 2024 12:58:41 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/3] regmap: cache: Use BITS_TO_BYTES()
Date: Thu, 21 Nov 2024 12:57:21 +0200
Message-ID: <20241121105838.4073659-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20241121105838.4073659-1-andriy.shevchenko@linux.intel.com>
References: <20241121105838.4073659-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BITS_TO_BYTES() is the existing macro which takes care about full
bytes that may fully hold the given amount of bits. Use it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/base/regmap/regcache.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index d3659ba3cc11..b1f8508c3966 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -154,7 +154,7 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 	map->num_reg_defaults = config->num_reg_defaults;
 	map->num_reg_defaults_raw = config->num_reg_defaults_raw;
 	map->reg_defaults_raw = config->reg_defaults_raw;
-	map->cache_word_size = DIV_ROUND_UP(config->val_bits, 8);
+	map->cache_word_size = BITS_TO_BYTES(config->val_bits);
 	map->cache_size_raw = map->cache_word_size * config->num_reg_defaults_raw;
 
 	map->cache = NULL;
-- 
2.43.0.rc1.1336.g36b5255a03ac

