Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2653EBF0E;
	Thu, 19 Feb 2026 00:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771459398; cv=none; b=USTALCE1IzBSxn1LHJ+4ODIQDI+LXhHNlqFvFNKC81mqzUNZuEPF3sLhYzBS60drAs+vN4qiyfwGk8FIMjHIFdTG9+kb0OJNgAiS54qPXR0bAzKPqfmdnvcDFOmrwh7/5JRbtYeqgHI/WSmTqi1ItwbtKEd5mD8ytZmPjhNu8Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771459398; c=relaxed/simple;
	bh=yR4TzLEZp88brrZRUGNWEnXcVuEizkSGJ9isozb7jeM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jE8jzVfihvXtY7icDfiFnE456Ol7m9ijO3a3W3+qvkyr/ZgtispISlG3TNhkoDL7zcaxBn3zwINLWdYaHuUmUJSgqQ8nkMJpHBlic+aBOECkBp/PJOFjREZMV2lkiaO/B38JiUCeq8ZEjdZN9rvDSv/3T8cK8M63MD3+N1sZk6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nl/xqxft; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nl/xqxft"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771459395; x=1802995395;
  h=date:from:to:cc:subject:message-id;
  bh=yR4TzLEZp88brrZRUGNWEnXcVuEizkSGJ9isozb7jeM=;
  b=nl/xqxftz0UqriyOb8U/k2XlQK7q4jMBaR1Xdg93AS/Cbc+fSDIUby3a
   KBswMqaZaSVoY2aARX6azDQKDY/GYCW5AgalwpQ4gItkekSqLuEE0wlcS
   M69bt1QD5+BWnnV67sZqNeblOvw4C5V5wi4XByG7+jNz+fA6KWaYw/bfl
   3r5wHtgO5/6rYfrEmlHhhFCr/V2ZGvw9CzRC2jgGROa+MKpt4ZsnYLykc
   VgUYW68nbGthYyvHBSIaWvFiVxSBuwryvUM2XIAbtNiO1cEo3Kl3B/S4n
   N/Wm84BbwE4FZKv6pIhXKwpO1fNupEAZ7r/LFeTja34/UKTkBWqJ39zLg
   w==;
X-CSE-ConnectionGUID: FWBm4K4YQf2WPwe1Xx1iOw==
X-CSE-MsgGUID: NTEaADytTKWibdT7Uwzf+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="76380308"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="76380308"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 16:03:15 -0800
X-CSE-ConnectionGUID: oUAdWAUzTwCXxdUv7HqZiA==
X-CSE-MsgGUID: sY1QR5bhT3agSbyp2mMMjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="212648267"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Feb 2026 16:03:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsrVf-000000012pC-1tJx;
	Thu, 19 Feb 2026 00:03:11 +0000
Date: Thu, 19 Feb 2026 08:02:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 9/27]
 drivers/input/touchscreen/wdt87xx_i2c.c:40:9: warning: 'PG_SIZE' macro
 redefined
Message-ID: <202602190741.2IS0uErT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   1903e57e83c0c0526b0ee193ce32e6aac90863af
commit: 87ea5e388f0115d9a2ba856cf4d2fecb9880a845 [9/27] mm: Introduce PG_SIZE, PG_SHIFT and PG_MASK
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260219/202602190741.2IS0uErT-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260219/202602190741.2IS0uErT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602190741.2IS0uErT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/touchscreen/wdt87xx_i2c.c:40:9: warning: 'PG_SIZE' macro redefined [-Wmacro-redefined]
      40 | #define PG_SIZE                         0x1000
         |         ^
   include/vdso/page.h:34:9: note: previous definition is here
      34 | #define PG_SIZE         (_AC(1,UL) << CONFIG_PG_SHIFT)
         |         ^
   1 warning generated.


vim +/PG_SIZE +40 drivers/input/touchscreen/wdt87xx_i2c.c

3e30c11c8a902de HungNien Chen 2015-06-15  39  
3e30c11c8a902de HungNien Chen 2015-06-15 @40  #define PG_SIZE				0x1000
3e30c11c8a902de HungNien Chen 2015-06-15  41  #define MAX_RETRIES			3
3e30c11c8a902de HungNien Chen 2015-06-15  42  

:::::: The code at line 40 was first introduced by commit
:::::: 3e30c11c8a902de350281a0d821e17cdb45ef156 Input: add a driver for wdt87xx touchscreen controller

:::::: TO: HungNien Chen <hn.chen@weidahitech.com>
:::::: CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
