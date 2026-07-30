Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF1F40244D;
	Thu, 30 Jul 2026 10:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785407148; cv=none; b=h5YQicpP4jOR6E/0DzsNBlREdAnLaC2s/+MlDidRCg8KnDgNfhFqQ6DzkGDl7V/TVUwupWF2V/cy+6cB2Z26mgsSM5tWhAQsOAkqDgq9eBVwoTViF7wxTNFJANdowOgvJhdtp8pnx4BhYPIo0URJOiO34M3fPjaEowpXZ3T6X0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785407148; c=relaxed/simple;
	bh=YLu1OmXmOLxasB9Y9fG74RIP2RaBxn+NOB2o3PCyFBY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dqK9/tEloORMB3SovkLRtmmXElaVCAlO5qBXvvpC1uUd4EVVc9qL8IoHu5+HosETxqhwxTMnxVFRAfNZ8p6/aQy/HzTr5t/wO1UzYJ4L5Gd4qQEEd9xQeNIKHBFWdwVgtIxaGqAN+GTH4hMOOoH8u6rC6+Cmd36ZXsxJ4oHOeKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CxQxW6S5; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CxQxW6S5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785407145; x=1816943145;
  h=date:from:to:cc:subject:message-id;
  bh=YLu1OmXmOLxasB9Y9fG74RIP2RaBxn+NOB2o3PCyFBY=;
  b=CxQxW6S5+GCxG4973pGtMW6O8vu+13KJSY6Kr+79AhTVP5OBZayKstpf
   p2/QBdIWpccqRsbydKBNpws8+seblFMzNp/l/WRie8KcCXS8Ss/Jxo+FI
   xpD8emTafrpGkrC4QKXQ/Z+W76v80ScNCbjpgP8NMG2RFa6FEEB5zAnS3
   TCaSjdVcKnXvcK75sXEAwcNKJ2jAtTZ1WyhXhgi6CH0Swez+aR8Tz5shO
   7AI12VzsnCm2BL9r53NJYuk/n+mnf/TpVQuvA8IzKnqPmb7qfgaMyCoH3
   19fj14LEZYZ+BATPo1bgsCTkZh1GS8Zjt92T6khqSv+gra9O+PNUSsq1t
   g==;
X-CSE-ConnectionGUID: Zs6tlRSzRwy1vAV5BwhQrQ==
X-CSE-MsgGUID: q19K3gMMShWX2z/coLPm+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85786756"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="85786756"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 03:25:44 -0700
X-CSE-ConnectionGUID: s4rQs0YiQ5eJNZkveKVJ2Q==
X-CSE-MsgGUID: 39eOkAAzQJmVSdL1adQarQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="263746785"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 30 Jul 2026 03:25:43 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpNxM-00000000gPe-2SAe;
	Thu, 30 Jul 2026 10:25:40 +0000
Date: Thu, 30 Jul 2026 18:24:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Ethan Nelson-Moore" <enelsonmoore@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Ulf Hansson <ulfh@kernel.org>
Subject: [linux-next:master 2795/10444]
 arch/arm/mach-pxa/generic.c:55:6: error: expected ';' after expression
Message-ID: <202607301822.cl0lEkQt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   78bc8af4affb9a732504eb22eeac7d1e50883853
commit: ab9c44bbf6d7df22518ea66329595023c00be1bc [2795/10444] ARM: PXA: remove remnants of PXA93x support
config: arm-pxa3xx_defconfig (https://download.01.org/0day-ci/archive/20260730/202607301822.cl0lEkQt-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607301822.cl0lEkQt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607301822.cl0lEkQt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm/mach-pxa/generic.c:55:6: error: expected ';' after expression
      55 |         if (cpu_is_pxa3xx())
         |             ^
   include/linux/soc/pxa/cpu.h:193:3: note: expanded from macro 'cpu_is_pxa3xx'
     193 |                 __cpu_is_pxa3xx(read_cpuid_id());       \
         |                 ^
   include/linux/soc/pxa/cpu.h:181:3: note: expanded from macro '__cpu_is_pxa3xx'
     181 |          })
         |          ^
   1 error generated.
--
>> arch/arm/mach-pxa/pxa3xx.c:402:6: error: expected ';' after expression
     402 |         if (cpu_is_pxa3xx()) {
         |             ^
   include/linux/soc/pxa/cpu.h:193:3: note: expanded from macro 'cpu_is_pxa3xx'
     193 |                 __cpu_is_pxa3xx(read_cpuid_id());       \
         |                 ^
   include/linux/soc/pxa/cpu.h:181:3: note: expanded from macro '__cpu_is_pxa3xx'
     181 |          })
         |          ^
   1 error generated.
--
>> arch/arm/mach-pxa/smemc.c:60:6: error: expected ';' after expression
      60 |         if (cpu_is_pxa3xx()) {
         |             ^
   include/linux/soc/pxa/cpu.h:193:3: note: expanded from macro 'cpu_is_pxa3xx'
     193 |                 __cpu_is_pxa3xx(read_cpuid_id());       \
         |                 ^
   include/linux/soc/pxa/cpu.h:181:3: note: expanded from macro '__cpu_is_pxa3xx'
     181 |          })
         |          ^
   1 error generated.
--
>> drivers/video/fbdev/pxafb.c:2270:6: error: expected ';' after expression
    2270 |         if (cpu_is_pxa3xx() && inf->acceleration_enabled)
         |             ^
   include/linux/soc/pxa/cpu.h:193:3: note: expanded from macro 'cpu_is_pxa3xx'
     193 |                 __cpu_is_pxa3xx(read_cpuid_id());       \
         |                 ^
   include/linux/soc/pxa/cpu.h:181:3: note: expanded from macro '__cpu_is_pxa3xx'
     181 |          })
         |          ^
   1 error generated.


vim +55 arch/arm/mach-pxa/generic.c

04fef228fb00dd Eric Miao      2008-07-29  45  
a38b1f60b5245a Robert Jarzmik 2014-07-14  46  /*
a38b1f60b5245a Robert Jarzmik 2014-07-14  47   * For non device-tree builds, keep legacy timer init
a38b1f60b5245a Robert Jarzmik 2014-07-14  48   */
3d3c6a5f3de2c7 Arnd Bergmann  2014-07-26  49  void __init pxa_timer_init(void)
a38b1f60b5245a Robert Jarzmik 2014-07-14  50  {
5e1d01285140a8 Robert Jarzmik 2014-12-27  51  	if (cpu_is_pxa25x())
3c816d950a494a Arnd Bergmann  2019-09-18  52  		pxa25x_clocks_init(io_p2v(0x41300000));
5e1d01285140a8 Robert Jarzmik 2014-12-27  53  	if (cpu_is_pxa27x())
3c816d950a494a Arnd Bergmann  2019-09-18  54  		pxa27x_clocks_init(io_p2v(0x41300000));
a1c0a6adbc705a Robert Jarzmik 2015-02-07 @55  	if (cpu_is_pxa3xx())
3c816d950a494a Arnd Bergmann  2019-09-18  56  		pxa3xx_clocks_init(io_p2v(0x41340000), io_p2v(0x41350000));
f4e14edf25661f Robert Jarzmik 2016-09-19  57  	pxa_timer_nodt_init(IRQ_OST0, io_p2v(0x40a00000));
a38b1f60b5245a Robert Jarzmik 2014-07-14  58  }
a38b1f60b5245a Robert Jarzmik 2014-07-14  59  

:::::: The code at line 55 was first introduced by commit
:::::: a1c0a6adbc705a9a760416796ce9cb3349fd476f ARM: pxa: Transition pxa25x, pxa27x, pxa3xx to clk framework

:::::: TO: Robert Jarzmik <robert.jarzmik@free.fr>
:::::: CC: Robert Jarzmik <robert.jarzmik@free.fr>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
