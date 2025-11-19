Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033FB369993;
	Wed, 19 Nov 2025 19:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763580699; cv=none; b=ZrXjzHmYp/36JsYs3xSnwSHsa6wyL5CNjnoh+UMhD0kzg63diWVudhgW8Y8TJnqZDeJO4M3lCIy2MVjqRZPcVWI27I9qWNK19PnZij1KkEt1gR8/9djY+fpleczz1pdOp+kZY30AcY69UphY0E9uahLN6cepr+84dkEYaYKCsr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763580699; c=relaxed/simple;
	bh=4owaXmo1ljMNA6yxWgtt+Y65ANtqtqpLXb7bzq7aZ30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/ZaNe3JzfYhn7bAGXGkBiJbyaPG7BgeLHDzY15s6OPiFIf1a3Rk+pkiF2CiYYbZg6cHXdncwROoa/sLB8WY/fRmgGEO+kVhxdPHeRxEH1lg6lOVzaK/bgf9dQrjmpJVFtAj0++SCEhMI8KIK1iigFyvpV9TO1VFAdH8xCo1k9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hFecOsxU; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hFecOsxU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763580694; x=1795116694;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4owaXmo1ljMNA6yxWgtt+Y65ANtqtqpLXb7bzq7aZ30=;
  b=hFecOsxUZfLkWKz2Fz95SGMiUNSyqA8gPGpbIxN5zE55b1kSOL1J99/l
   C3OOdwXCvtWq+N/0XWAk2vb3KDY2f8RdWtYhX4y0Ds2lQhpOyA5DVy7HO
   wHuS4Es24XNZRh2gyRmZazOXyLlaFhcUWm3zOeTXk7FJoOGXZbUOGyrMP
   4QUTduXmuMMs+Uh8Qmfe0WLQnOJWfmyYhcz9j/wPR55Ntdgh+ud5iVXE6
   BSUPYMQBE+wZwtSxHhgvCH4kWLH7hzHaFEzmqZFeoI5mGVmmgz8Z3kjuY
   hAgaEC2A84aVmrR1Mug2fEngs/m3hKAlIIrbh8l+Nj7NV9FAHHSMyJwYP
   Q==;
X-CSE-ConnectionGUID: t/3RAD0hRh+h/5JUDSOfyw==
X-CSE-MsgGUID: ERF86WP0ShKPE/0n1V1aGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="88293524"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="88293524"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 11:31:30 -0800
X-CSE-ConnectionGUID: 6zn3dqT1SxiBHkD+OToAMw==
X-CSE-MsgGUID: 7XKP0P9zSIa+2OeMYwkSMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="191584116"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Nov 2025 11:31:29 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLntn-0003E7-21;
	Wed, 19 Nov 2025 19:31:27 +0000
Date: Thu, 20 Nov 2025 03:30:43 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFT/RFC 1/2] gpiolib: support "undefined" GPIO machine
 lookup
Message-ID: <202511200320.9ITKS8Am-lkp@intel.com>
References: <20251119-cs42l43-gpio-lookup-v1-1-029b1d9e1843@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119-cs42l43-gpio-lookup-v1-1-029b1d9e1843@linaro.org>

Hi Bartosz,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on fe4d0dea039f2befb93f27569593ec209843b0f5]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/gpiolib-support-undefined-GPIO-machine-lookup/20251119-233054
base:   fe4d0dea039f2befb93f27569593ec209843b0f5
patch link:    https://lore.kernel.org/r/20251119-cs42l43-gpio-lookup-v1-1-029b1d9e1843%40linaro.org
patch subject: [PATCH RFT/RFC 1/2] gpiolib: support "undefined" GPIO machine lookup
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20251120/202511200320.9ITKS8Am-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511200320.9ITKS8Am-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511200320.9ITKS8Am-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/gpio/gpiolib.c:4560:25: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const void *' [-Wint-conversion]
    4560 |                 if (p->key == PTR_ERR(-ENOENT))
         |                                       ^~~~~~~
   include/linux/err.h:63:61: note: passing argument to parameter 'ptr' here
      63 | static inline long __must_check PTR_ERR(__force const void *ptr)
         |                                                             ^
>> drivers/gpio/gpiolib.c:4560:14: warning: comparison between pointer and integer ('const char *' and 'long') [-Wpointer-integer-compare]
    4560 |                 if (p->key == PTR_ERR(-ENOENT))
         |                     ~~~~~~ ^  ~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +4560 drivers/gpio/gpiolib.c

  4536	
  4537	static struct gpio_desc *gpiod_find(struct device *dev, const char *con_id,
  4538					    unsigned int idx, unsigned long *flags)
  4539	{
  4540		struct gpio_desc *desc = ERR_PTR(-ENOENT);
  4541		struct gpiod_lookup_table *table;
  4542		struct gpiod_lookup *p;
  4543		struct gpio_chip *gc;
  4544	
  4545		guard(mutex)(&gpio_lookup_lock);
  4546	
  4547		table = gpiod_find_lookup_table(dev);
  4548		if (!table)
  4549			return desc;
  4550	
  4551		for (p = &table->table[0]; p->key; p++) {
  4552			/* idx must always match exactly */
  4553			if (p->idx != idx)
  4554				continue;
  4555	
  4556			/* If the lookup entry has a con_id, require exact match */
  4557			if (p->con_id && (!con_id || strcmp(p->con_id, con_id)))
  4558				continue;
  4559	
> 4560			if (p->key == PTR_ERR(-ENOENT))
  4561				return ERR_PTR(-ENOENT);
  4562	
  4563			if (p->chip_hwnum == U16_MAX) {
  4564				desc = gpio_name_to_desc(p->key);
  4565				if (desc) {
  4566					*flags = p->flags;
  4567					return desc;
  4568				}
  4569	
  4570				dev_warn(dev, "cannot find GPIO line %s, deferring\n",
  4571					 p->key);
  4572				return ERR_PTR(-EPROBE_DEFER);
  4573			}
  4574	
  4575			struct gpio_device *gdev __free(gpio_device_put) =
  4576						gpio_device_find_by_label(p->key);
  4577			if (!gdev) {
  4578				/*
  4579				 * As the lookup table indicates a chip with
  4580				 * p->key should exist, assume it may
  4581				 * still appear later and let the interested
  4582				 * consumer be probed again or let the Deferred
  4583				 * Probe infrastructure handle the error.
  4584				 */
  4585				dev_warn(dev, "cannot find GPIO chip %s, deferring\n",
  4586					 p->key);
  4587				return ERR_PTR(-EPROBE_DEFER);
  4588			}
  4589	
  4590			gc = gpio_device_get_chip(gdev);
  4591	
  4592			if (gc->ngpio <= p->chip_hwnum) {
  4593				dev_err(dev,
  4594					"requested GPIO %u (%u) is out of range [0..%u] for chip %s\n",
  4595					idx, p->chip_hwnum, gc->ngpio - 1,
  4596					gc->label);
  4597				return ERR_PTR(-EINVAL);
  4598			}
  4599	
  4600			desc = gpio_device_get_desc(gdev, p->chip_hwnum);
  4601			*flags = p->flags;
  4602	
  4603			return desc;
  4604		}
  4605	
  4606		return desc;
  4607	}
  4608	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
