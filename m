Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C261224AF7;
	Thu,  2 Jul 2026 03:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782962357; cv=none; b=sO+Hw5x7lQs8MmsHU+iSBVhmRbCjKVfjYFH3bx8SDc2EueLCBZ/l8FP/YFL0w2eAXn54TR4VE9WfqYnKDNw3F3JezF+vGS+jI5bDP5oeSpJF74zxTIIaPo6BQwh3fKeNGY+91hmGHV3vWGNN3fvUb5JNv6nxKwobIw3vYdTGkRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782962357; c=relaxed/simple;
	bh=sEkB6sTk3wznEloKphhnt2a2yV6Q319Lau3vc8PyQaw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dc/jAbgDDC2KKu0tezvhiEaHHpDmb36ku7nW3NCvVEoOUg8flPiywr3rsSz+MfgKYoStAO01w71V73YlB5sxLWYo0Md8vhT3Q6AsAPsMXVd3nY9v82+NGS5DvpExe27Irg015grZ7O2suXFLRC9JO5kVZ3VoLvaQT9nsMTiKkAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nkrDphsW; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nkrDphsW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782962355; x=1814498355;
  h=date:from:to:cc:subject:message-id;
  bh=sEkB6sTk3wznEloKphhnt2a2yV6Q319Lau3vc8PyQaw=;
  b=nkrDphsW5dc3pIQzTNehV3uAuTFbvAvNTUxOfux/m33UxUqDoy7rDiMv
   pd3SOWOJJQQzP3/PCOdNEacSZO1zdiEXSKjt9+yRusv6JhMyPHaIhqVIb
   s05W2of6i1jDXDhsfWBd5a0uJMynxSV+x2BSSmRCIDYdbC+WOvpVaoxde
   IM1bVIPpwcf28sTPdWIM6Tp2iSP5ur7zd/XkgHnnCj+6HDKu0H66VVvhD
   mGfaX+pafnDnPgyOIS0nRQqCz64CZGyEXBtaUwWAXa502cpRwpLZrU4ZZ
   lR/zV3/kzLaU9TpC4H8wHzo+b+/m/OjcPNX6WjBB8CyJQkkRGOl8CcM/b
   g==;
X-CSE-ConnectionGUID: BrgiNZhpS46+7iLmhjdvrg==
X-CSE-MsgGUID: URrQkAQmTdC1IPpl2NcXsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="101128071"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="101128071"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 20:19:13 -0700
X-CSE-ConnectionGUID: XnpyupdYR4+CR0PlOufz9w==
X-CSE-MsgGUID: SgwBoTPCRuGz/rUN7f9QMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="290858159"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 01 Jul 2026 20:19:11 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf7xE-000000009w3-26OG;
	Thu, 02 Jul 2026 03:19:08 +0000
Date: Thu, 02 Jul 2026 11:18:17 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Vivchar <rva333@protonmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jonathan Cameron <jic23@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 David Lechner <dlechner@baylibre.com>
Subject: [jic23-iio:testing 86/95]
 drivers/iio/adc/mt6323-auxadc.c:25:10: fatal error:
 'dt-bindings/iio/adc/mediatek,mt6323-auxadc.h' file not found
Message-ID: <202607021105.uE58NqHz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   2bf164847e2e83599b4c2454e301a3aff92fddfc
commit: 022cc99d5d1cdc76b09b424a769c3cfea3812378 [86/95] iio: adc: mt6323-auxadc: add mt6323 PMIC AUXADC driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260702/202607021105.uE58NqHz-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021105.uE58NqHz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021105.uE58NqHz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iio/adc/mt6323-auxadc.c:25:10: fatal error: 'dt-bindings/iio/adc/mediatek,mt6323-auxadc.h' file not found
      25 | #include <dt-bindings/iio/adc/mediatek,mt6323-auxadc.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +25 drivers/iio/adc/mt6323-auxadc.c

    24	
  > 25	#include <dt-bindings/iio/adc/mediatek,mt6323-auxadc.h>
    26	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
