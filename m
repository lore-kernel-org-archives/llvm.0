Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2953B1E878;
	Mon, 26 Feb 2024 22:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708988372; cv=none; b=Fed0H6AYzJN/z01rtg1to+KIAqFnnXpNIggLzaYVDDd1JWkaG23KFQl4b1pUj/0NqAN+90RMHqIWEEYqYn9C6ZibZ3ih1+WwvfS2lP+iyY3LZUEvnOAS5W+Eew2ZI5IQpMvyBdf8jgfk9KD+dLWFdi4FpuUGnXZosDTGaUAnkjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708988372; c=relaxed/simple;
	bh=AB6wH6fh3xUjGCcELHUEz8Vc9UGxsP93pfzxD8ptCDg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EDgzvBQ0Bgo+IUvw+QUHG4rzSnajQVR0u7vTVcYY3J++jX+lOYPKIYCMancugiZzYkdTvxltwaK8b7waP0is1WX7MGXS76exuxIqbec7iyuJ77l9esKLILSPP9iOnUKNltmSvLtQm0Aix/LjLawhdAGtX6rbuNRvy6qWGFfWcN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VEebdeIM; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VEebdeIM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708988370; x=1740524370;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AB6wH6fh3xUjGCcELHUEz8Vc9UGxsP93pfzxD8ptCDg=;
  b=VEebdeIMRRWHnDOb0D6vfxMAl0h4NG8BZ9U3esn8tYT4GTU2oQekfifq
   7QAjTFNPHKOX9ULEN5ytq6t1HbTS5STSS/qQ8M/Bq4eEVpOBmd6H/rYy+
   6Sh1HxWZgG5OTz7DVIpzCGwE59Dsp+qSEVS9G/c6lvwcxu8ZJfzs3OMhE
   mxR8GKgzHymSTNADPQweHMn7WiHWMWRmLE/NnIrAXY7/NuVVDGAa9Shoo
   ZBhos5e3tKSsbcredQc36d3FGOtvqC8TuUuBc2tTBWzu8TrggxY/Whisd
   3uzDTXaBsk+JywA8UgOd4dmgWkjFmeHy9gU/REYPqE8ksjNy7CT4tIIPA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="6256402"
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; 
   d="scan'208";a="6256402"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 14:59:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; 
   d="scan'208";a="11605294"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 26 Feb 2024 14:59:25 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rejwL-000AkZ-0T;
	Mon, 26 Feb 2024 22:59:19 +0000
Date: Tue, 27 Feb 2024 06:58:59 +0800
From: kernel test robot <lkp@intel.com>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <daniel.thompson@linaro.org>
Subject: [linux-next:master 9208/10236]
 drivers/leds/leds-gpio-register.c:23:25: warning: attribute declaration must
 precede definition
Message-ID: <202402270609.79kfRDFE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8552c902efe7ef670b6961fb8885b67961aeb629
commit: 7a28f9cf6b7c8cad760b4d4ee7f53231cd76d8e4 [9208/10236] Revert "leds: Only descend into leds directory when CONFIG_NEW_LEDS is set"
config: mips-bcm47xx_defconfig (https://download.01.org/0day-ci/archive/20240227/202402270609.79kfRDFE-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240227/202402270609.79kfRDFE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402270609.79kfRDFE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/leds/leds-gpio-register.c:23:25: warning: attribute declaration must precede definition [-Wignored-attributes]
   struct platform_device *__init gpio_led_register_device(
                           ^
   include/linux/init.h:52:17: note: expanded from macro '__init'
   #define __init          __section(".init.text") __cold  __latent_entropy __noinitretpoline
                           ^
   include/linux/compiler_attributes.h:334:56: note: expanded from macro '__section'
   #define __section(section)              __attribute__((__section__(section)))
                                                          ^
   include/linux/leds.h:646:39: note: previous definition is here
   static inline struct platform_device *gpio_led_register_device(
                                         ^
>> drivers/leds/leds-gpio-register.c:23:25: warning: attribute declaration must precede definition [-Wignored-attributes]
   struct platform_device *__init gpio_led_register_device(
                           ^
   include/linux/init.h:52:41: note: expanded from macro '__init'
   #define __init          __section(".init.text") __cold  __latent_entropy __noinitretpoline
                                                   ^
   include/linux/compiler_types.h:113:34: note: expanded from macro '__cold'
   #define __cold                          __attribute__((__cold__))
                                                          ^
   include/linux/leds.h:646:39: note: previous definition is here
   static inline struct platform_device *gpio_led_register_device(
                                         ^
   drivers/leds/leds-gpio-register.c:23:32: error: redefinition of 'gpio_led_register_device'
   struct platform_device *__init gpio_led_register_device(
                                  ^
   include/linux/leds.h:646:39: note: previous definition is here
   static inline struct platform_device *gpio_led_register_device(
                                         ^
   2 warnings and 1 error generated.


vim +23 drivers/leds/leds-gpio-register.c

4440673a95e63a Uwe Kleine-König 2011-05-24  10  
4440673a95e63a Uwe Kleine-König 2011-05-24  11  /**
4440673a95e63a Uwe Kleine-König 2011-05-24  12   * gpio_led_register_device - register a gpio-led device
4440673a95e63a Uwe Kleine-König 2011-05-24  13   * @pdata: the platform data used for the new device
c5a87a4ac2bfec Lee Jones        2021-05-28  14   * @id: platform ID
4440673a95e63a Uwe Kleine-König 2011-05-24  15   *
4440673a95e63a Uwe Kleine-König 2011-05-24  16   * Makes a copy of pdata and pdata->leds and registers a new leds-gpio device
4440673a95e63a Uwe Kleine-König 2011-05-24  17   * with the result. This allows to have pdata and pdata-leds in .init.rodata
4440673a95e63a Uwe Kleine-König 2011-05-24  18   * and so saves some bytes compared to a static struct platform_device with
4440673a95e63a Uwe Kleine-König 2011-05-24  19   * static platform data.
4440673a95e63a Uwe Kleine-König 2011-05-24  20   *
4440673a95e63a Uwe Kleine-König 2011-05-24  21   * Returns the registered device or an error pointer.
4440673a95e63a Uwe Kleine-König 2011-05-24  22   */
4440673a95e63a Uwe Kleine-König 2011-05-24 @23  struct platform_device *__init gpio_led_register_device(

:::::: The code at line 23 was first introduced by commit
:::::: 4440673a95e63ad888a41db596edaa0c55d3a332 leds: provide helper to register "leds-gpio" devices

:::::: TO: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
