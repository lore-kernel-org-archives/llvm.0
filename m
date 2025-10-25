Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA8B27E056;
	Sat, 25 Oct 2025 06:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761374638; cv=none; b=KD6DAWo40P9Yil/fwcmQUjnvradcVDtNSPbjUjje/w4Q9EzLLnma24Qoys6zJHEGJAq/49uXigwkAFFAG1Y/i8l2lBPjas/m7NJTEv7jTktpsiaJeJ58V83m1HH5xDQbkO6dAeWs6elGyU7QTbQfoa1hhjyhr76NHlofAmP5aSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761374638; c=relaxed/simple;
	bh=5Xd2T2aNTl8c9Ga1fQDjXYNrqheu8xPazvqz7CR1xeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ckfyJJOtk8BowizVcPH/JvusieNR7vJzSuPxePA5vUqitfJnHv2XIbQ0l7wci2OhLOxR79PoaV1cQ2LIUm2M02/+KxXQVphq+pPEdpGTCvOMOeHcBgDTQ7Fjja1xB6O4WWNFbDmmeZ0Y6oZkYmANfSDOAjCSevzQujMmX03/CMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fhY4Z2QQ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fhY4Z2QQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761374636; x=1792910636;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5Xd2T2aNTl8c9Ga1fQDjXYNrqheu8xPazvqz7CR1xeE=;
  b=fhY4Z2QQ+OTMBrkdcP91zEF9RU2+fSNE2Z1fnYZgCuaN6ISU5WNRCCrX
   6nqMek41uyzi7toJ7Qokt3cCrWqvk8DwzsBFLB0+ZrvQWBmuv1ql811RD
   gox52+XHbjDaBAYbVdL2WIfzsFjCaj78p+do+QfWAqLEnhpLIonux6ogE
   jWY0sAyZ15z7QTQgK1vvX5pi9AB7QpXBsfanpuw72e3jk5oCM6+ZySRRr
   4MMTT41yGSo8cE9JVuU1Df7ltKHEjUU2wMPinqb0HGiYpd8u115MtZJza
   MzCyyoDa57V8ked2YoLoLYDXEIW/76nxlS6fEWJVDGsbV38mjQfqZLGcs
   A==;
X-CSE-ConnectionGUID: kKAwCFJ4QoG7rG4PuSdHFg==
X-CSE-MsgGUID: mk0KzeEZQbOxaMuRFZfg/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63445720"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63445720"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 23:43:56 -0700
X-CSE-ConnectionGUID: GPcfqCRKSqWteCHwySs0PA==
X-CSE-MsgGUID: y5IAKaXKSUOW6cbBl86z4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="184671266"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 24 Oct 2025 23:43:53 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCY0F-000F9d-1c;
	Sat, 25 Oct 2025 06:43:51 +0000
Date: Sat, 25 Oct 2025 14:42:56 +0800
From: kernel test robot <lkp@intel.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: Re: [PATCH 6/6] drm/sitronix/st7571-spi: add support for SPI
 interface
Message-ID: <202510251430.rl42LCVH-lkp@intel.com>
References: <20251024-st7571-split-v1-6-d3092b98130f@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024-st7571-split-v1-6-d3092b98130f@gmail.com>

Hi Marcus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7e73cefd2bede5408d1aeb6145261b62d85d23be]

url:    https://github.com/intel-lab-lkp/linux/commits/Marcus-Folkesson/drm-sitronix-st7571-i2c-rename-struct-drm_device-in-st7571_device/20251024-192347
base:   7e73cefd2bede5408d1aeb6145261b62d85d23be
patch link:    https://lore.kernel.org/r/20251024-st7571-split-v1-6-d3092b98130f%40gmail.com
patch subject: [PATCH 6/6] drm/sitronix/st7571-spi: add support for SPI interface
config: x86_64-randconfig-005-20251025 (https://download.01.org/0day-ci/archive/20251025/202510251430.rl42LCVH-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510251430.rl42LCVH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510251430.rl42LCVH-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: module st7571-i2c uses symbol st7567_config from namespace DRM_ST7571, but does not import it.
WARNING: modpost: module st7571-i2c uses symbol st7571_config from namespace DRM_ST7571, but does not import it.
>> WARNING: modpost: module st7571-spi uses symbol st7567_config from namespace DRM_ST7571, but does not import it.
>> WARNING: modpost: module st7571-spi uses symbol st7571_config from namespace DRM_ST7571, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
