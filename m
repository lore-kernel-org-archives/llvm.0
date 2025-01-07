Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748901DFE25;
	Tue,  7 Jan 2025 21:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736285861; cv=none; b=WqIDlxsPC+/La5D1rEKBpuobwdgeC/exs9Iy18eTBOBD07HjklGYvdgvryaMVX0bOBm+FpKgYrHPsn3VumwmxFyTYsDDohUVQIPyRSOIyAiHVTAEBDCVk0rJ2pfXfUpfP+ST4GEITxDjwj4/JmBgEwPPK7YygH6lUQZeaZf+g3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736285861; c=relaxed/simple;
	bh=kYCbp/CNVkebZZ+uod3hukYTWN4A72b6Ll94sL9u74c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iD70fcnOTi4YBOz5nLzw7UDiQ2UVxm+3ByDc4TwL1Uz4ZNiZK5bKl3yPmRpn0E/9hBHsWsrvd6p0HP8R83u+YpANyh1Xo1wls5hbzHIYLhHqt+vomqQD/spbjUWcr8rn1AOKcr/mUJhy0jVGnuT0KjxS84HKvD6fVA+EkUl5yAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mFBCgw9p; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mFBCgw9p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736285859; x=1767821859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kYCbp/CNVkebZZ+uod3hukYTWN4A72b6Ll94sL9u74c=;
  b=mFBCgw9ps4d7RH+U0Q8ug4yX8DLPb0ei+q9VaQHdeSeey1r/TS1eZAiF
   5CFwzU82bFVIVuD74w24NDkkhH8MBPG27m6r2u6Drgx/ezOLi7/lKLKCL
   6WJajQTeXlYm7zmZWX0ldeqbG94Tn3LqFzAoSlSyokHmhFfZJPqRC8k59
   maJF0V4kGuz6zUEotd/96Bh9DKei3+PayZG0KvxJnyWh8c+2Jztx/xVO4
   JUYVsbKRC3k7XrwcKH0wUcvDYP0vSIndfvQXpvd69Oms5762pCz2IHSPM
   ZIPcWjk7y3ZZaYTZKnwe4YXaLC6HfDe4ZsPeAZC6IaiSRp5CQo4aIe1Y3
   g==;
X-CSE-ConnectionGUID: BgFfY9PwS86Yq/OrrSOrZw==
X-CSE-MsgGUID: 61DzdLAeSpymNh1KwUd4LA==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36710623"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="36710623"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 13:37:33 -0800
X-CSE-ConnectionGUID: NWTEVg7BTG22xKdGUlKrjA==
X-CSE-MsgGUID: /0IBWi/wSqOdfPZSdO5XrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="102803658"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Jan 2025 13:37:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVHGU-000FFT-0I;
	Tue, 07 Jan 2025 21:37:30 +0000
Date: Wed, 8 Jan 2025 05:36:30 +0800
From: kernel test robot <lkp@intel.com>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [char-misc:char-misc-testing 34/74]
 drivers/pps/clients/pps-gpio.c:66:24: error: passing 'struct device' to
 parameter of incompatible type 'const struct device *'; take the address
 with &
Message-ID: <202501080532.9Txj1W30-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-testing
head:   1ec8487e879dc872c506483553c376be2a556463
commit: 8aa0545f419e5bffbb27354e0221997cb6e87cbd [34/74] pps: clients: gpio: Bypass edge's direction check when not needed
config: i386-buildonly-randconfig-001-20250108 (https://download.01.org/0day-ci/archive/20250108/202501080532.9Txj1W30-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501080532.9Txj1W30-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501080532.9Txj1W30-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pps/clients/pps-gpio.c:66:24: error: passing 'struct device' to parameter of incompatible type 'const struct device *'; take the address with &
      66 |                 dev_warn_ratelimited(info->pps->dev, "IRQ did not trigger any PPS event\n");
         |                                      ^~~~~~~~~~~~~~
         |                                      &
   include/linux/dev_printk.h:227:34: note: expanded from macro 'dev_warn_ratelimited'
     227 |         dev_level_ratelimited(dev_warn, dev, fmt, ##__VA_ARGS__)
         |                                         ^~~
   include/linux/dev_printk.h:215:13: note: expanded from macro 'dev_level_ratelimited'
     215 |                 dev_level(dev, fmt, ##__VA_ARGS__);                     \
         |                           ^~~
   include/linux/dev_printk.h:156:49: note: expanded from macro 'dev_warn'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   include/linux/dev_printk.h:52:37: note: passing argument to parameter 'dev' here
      52 | void _dev_warn(const struct device *dev, const char *fmt, ...);
         |                                     ^
   1 error generated.


vim +66 drivers/pps/clients/pps-gpio.c

    39	
    40	/*
    41	 * Report the PPS event
    42	 */
    43	
    44	static irqreturn_t pps_gpio_irq_handler(int irq, void *data)
    45	{
    46		const struct pps_gpio_device_data *info;
    47		struct pps_event_time ts;
    48		int rising_edge;
    49	
    50		/* Get the time stamp first */
    51		pps_get_ts(&ts);
    52	
    53		info = data;
    54	
    55		/* Small trick to bypass the check on edge's direction when capture_clear is unset */
    56		rising_edge = info->capture_clear ?
    57			      gpiod_get_value(info->gpio_pin) : !info->assert_falling_edge;
    58		if ((rising_edge && !info->assert_falling_edge) ||
    59				(!rising_edge && info->assert_falling_edge))
    60			pps_event(info->pps, &ts, PPS_CAPTUREASSERT, data);
    61		else if (info->capture_clear &&
    62				((rising_edge && info->assert_falling_edge) ||
    63				(!rising_edge && !info->assert_falling_edge)))
    64			pps_event(info->pps, &ts, PPS_CAPTURECLEAR, data);
    65		else
  > 66			dev_warn_ratelimited(info->pps->dev, "IRQ did not trigger any PPS event\n");
    67	
    68		return IRQ_HANDLED;
    69	}
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
