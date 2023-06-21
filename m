Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BBBC8E2;
	Wed, 21 Jun 2023 09:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687340069; x=1718876069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5SD7Jpxt5xIT/ETfZCzwbjc8uwve0GImOGM1e0tLvpg=;
  b=G3Mi/0McdctnOM/WDwuU8xbSZlWx2rw4ntYCJUCGkvktio6RPXIFFTfR
   e0jvK5/cxOAHeDafyLFxu8T8fWiJORlScnahKE860aQFDNfGn7iqFepBc
   aMe+YIw2WP0pP4OZaqkcr4fmODYhVDeVRzcSbOwrd0GdO/nRngGbj4bi5
   GXoY8QCpodt5M7lVqZDLa0WWCowmoY7pStUAf5r7pt+jzB47S4Z4jQKva
   HSFFiT1i9vqotNC/guIkTJ8ODHtgDXU+sEwmwkxCPfZ7T4VFBLdzp943g
   taV72aMW7DvD8Vk68ofwWMRZLs67m0PFS0RHGWOz86uHMTudYOn7Y1PQd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="426075908"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="426075908"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 02:34:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="664585733"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="664585733"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 21 Jun 2023 02:34:03 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBuDz-0006jb-0Q;
	Wed, 21 Jun 2023 09:34:03 +0000
Date: Wed, 21 Jun 2023 17:32:51 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 11012/11071] drivers/irqchip/irq-mxs.c:12:10:
 fatal error: 'linux/irqchip/mxs.h' file not found
Message-ID: <202306211736.SNdmUKzi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   15e71592dbae49a674429c618a10401d7f992ac3
commit: 4e96d4b02cf0aa1dd1c7f0fe2c2dc43dec9f03ec [11012/11071] Merge branch 'irq/irqchip-next' of git://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
config: arm-randconfig-r016-20230620 (https://download.01.org/0day-ci/archive/20230621/202306211736.SNdmUKzi-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306211736.SNdmUKzi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306211736.SNdmUKzi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/irqchip/irq-mxs.c:12:10: fatal error: 'linux/irqchip/mxs.h' file not found
      12 | #include <linux/irqchip/mxs.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +12 drivers/irqchip/irq-mxs.c

5b7e5676209120 drivers/irqchip/irq-mxs.c Arnd Bergmann 2023-05-16 @12  #include <linux/irqchip/mxs.h>
83a84efcefe8d7 arch/arm/mach-mxs/icoll.c Shawn Guo     2012-08-20  13  #include <linux/irqdomain.h>
289569f902dc70 arch/arm/mach-mxs/icoll.c Shawn Guo     2010-12-18  14  #include <linux/io.h>
83a84efcefe8d7 arch/arm/mach-mxs/icoll.c Shawn Guo     2012-08-20  15  #include <linux/of.h>
8256aa7129f5d0 arch/arm/mach-mxs/icoll.c Shawn Guo     2013-03-25  16  #include <linux/of_address.h>
83a84efcefe8d7 arch/arm/mach-mxs/icoll.c Shawn Guo     2012-08-20  17  #include <linux/of_irq.h>
cec6bae8ca0417 arch/arm/mach-mxs/icoll.c Shawn Guo     2013-03-25  18  #include <linux/stmp_device.h>
4e0a1b8c070fe2 arch/arm/mach-mxs/icoll.c Shawn Guo     2012-08-20  19  #include <asm/exception.h>
289569f902dc70 arch/arm/mach-mxs/icoll.c Shawn Guo     2010-12-18  20  

:::::: The code at line 12 was first introduced by commit
:::::: 5b7e5676209120814dbb9fec8bc3769f0f7a7958 irqchip/mxs: Include linux/irqchip/mxs.h

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
