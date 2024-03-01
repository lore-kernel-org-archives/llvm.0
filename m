Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C553A8CF;
	Fri,  1 Mar 2024 02:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709261211; cv=none; b=nXeWXRGuXBMmHT6o5+0dv/L2F7ZqdM7zcvF4hLcsk3RDRudjOfwuK0MIRkDHbg4UIrYUR9J+KUM1jZW+b8pE6Ub36kjZAnRUMJHssz18Sr2SbW738GjT+p+HJllcDzNIM9hRoJOywjlSkYoLjkfrRxClILYSSTauLI9Vq+9EA+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709261211; c=relaxed/simple;
	bh=hDtVieXhB+qZYYUka7fqbcj6BoL4w++U3/2RLOvpv0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R0ephPYyupumDah3YVDiv6n6JnqM+YluMCJLXIJWD3MtycBg5mvHGYbRVnuOaqOZ5PPUd0ETcRxyZfp2Dxq9dWyx24/3KrK8xAxAEslX15tszEeNJajMmjKuvn3gvSQvUoudlHS2D7IO9rrcHpw1u8YsANYEJXu10d/ClFEjo8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ArwjUQlx; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ArwjUQlx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709261209; x=1740797209;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hDtVieXhB+qZYYUka7fqbcj6BoL4w++U3/2RLOvpv0c=;
  b=ArwjUQlxblUnpVaix4GyFVTCIc67sY7UuZeJ2qRIs4KcSEFnrkd1vkzl
   NmWUw+FsWhJF9wCa2Q2g0u3RK/cV+nTJkGi81hFClCIlM9KLlQBVfsSvy
   gF97BHRkijSJxilfzNNBj9sWGj6Eur8XjebaQ5tebZY0la62AEbHncViF
   k8lRcDMBpTsdRBF18RNzEGP7y7wKKVQ/P73CeQQQQ/LqTQDReAbWEBkFU
   stI9D9aBI/fe0734BKeS+0nY1xm4eqkVD6fkWIJ/DrKBIz2BC13RD2gjb
   dqJobdH5ICjQdUoQK9gA/OXVxfEevElj+t/4U4DuyeBsnDWiZKhRg6n8P
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3954318"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3954318"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 18:46:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="12646393"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 29 Feb 2024 18:46:43 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfsut-000DTv-13;
	Fri, 01 Mar 2024 02:46:38 +0000
Date: Fri, 1 Mar 2024 10:46:31 +0800
From: kernel test robot <lkp@intel.com>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <daniel.thompson@linaro.org>
Subject: [linux-next:master 9077/11156]
 drivers/leds/leds-gpio-register.c:23:32: error: redefinition of
 'gpio_led_register_device'
Message-ID: <202403011013.7cDG1rwi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Duje,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f303a3e2bcfba900efb5aee55236d17030e9f882
commit: 7a28f9cf6b7c8cad760b4d4ee7f53231cd76d8e4 [9077/11156] Revert "leds: Only descend into leds directory when CONFIG_NEW_LEDS is set"
config: mips-bcm47xx_defconfig (https://download.01.org/0day-ci/archive/20240301/202403011013.7cDG1rwi-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403011013.7cDG1rwi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403011013.7cDG1rwi-lkp@intel.com/

Note: the linux-next/master HEAD f303a3e2bcfba900efb5aee55236d17030e9f882 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   drivers/leds/leds-gpio-register.c:23:25: warning: attribute declaration must precede definition [-Wignored-attributes]
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
   drivers/leds/leds-gpio-register.c:23:25: warning: attribute declaration must precede definition [-Wignored-attributes]
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
>> drivers/leds/leds-gpio-register.c:23:32: error: redefinition of 'gpio_led_register_device'
   struct platform_device *__init gpio_led_register_device(
                                  ^
   include/linux/leds.h:646:39: note: previous definition is here
   static inline struct platform_device *gpio_led_register_device(
                                         ^
   2 warnings and 1 error generated.


vim +/gpio_led_register_device +23 drivers/leds/leds-gpio-register.c

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
