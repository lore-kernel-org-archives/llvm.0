Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5BC7F
	for <llvm@lists.linux.dev>; Sat,  7 May 2022 03:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651892923; x=1683428923;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xg/+15Z6oUDHgf/80gewwBoPHGeXBM6xzdqhzC2o6ng=;
  b=HQoK8KD+0aTy5YGUl4oJ5SXMvXfpulstqZ+QmUiFp5KJLK+yYnNebyFn
   q+pMCoRg7HsDIm2f2+jcPiMavl9Lvlkr9b1tIyVvIaezUP3sGEUA52+Z3
   h/CTsUhcN9LEciVucRSJgxwPeIlVG89iwG/GlTQrWaA/fYXMju2yHCO9H
   Li/8K9VETdH6H10r3QUL1fkM6i38a+2f3jGM0Hnx1Tn+ZQGyb+0QS5FQg
   xBLgFxmh03Ek2SBf189qsimw5J1X47hC1ac0j83nzwI7tYOu03HAULSmQ
   yRKEOg29tGz0aems1Go/o3/jdznN+WFKNRoZSL9wzfLncJNF9+PMsQn1u
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="267478689"
X-IronPort-AV: E=Sophos;i="5.91,205,1647327600"; 
   d="scan'208";a="267478689"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2022 20:08:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,205,1647327600"; 
   d="scan'208";a="695459926"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 06 May 2022 20:08:41 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nnAoC-000EA6-GT;
	Sat, 07 May 2022 03:08:40 +0000
Date: Sat, 7 May 2022 11:07:47 +0800
From: kernel test robot <lkp@intel.com>
To: Horatiu Vultur <horatiu.vultur@microchip.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 6350/9759]
 drivers/net/ethernet/microchip/lan966x/lan966x_ptp.c:342:9: error: call to
 undeclared function 'ptp_find_pin_unlocked'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202205071105.X9CbIhTA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   38a288f5941ef03752887ad86f2d85442358c99a
commit: f3d8e0a9c28ba0bb3716dd5e8697a075ea36fdd8 [6350/9759] net: lan966x: Add support for PTP_PF_EXTTS
config: arm64-randconfig-r011-20220506 (https://download.01.org/0day-ci/archive/20220507/202205071105.X9CbIhTA-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004fb787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=f3d8e0a9c28ba0bb3716dd5e8697a075ea36fdd8
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout f3d8e0a9c28ba0bb3716dd5e8697a075ea36fdd8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/net/ethernet/microchip/lan966x/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the linux-next/master HEAD 38a288f5941ef03752887ad86f2d85442358c99a builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/microchip/lan966x/lan966x_ptp.c:342:9: error: call to undeclared function 'ptp_find_pin_unlocked'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   pin = ptp_find_pin_unlocked(phc->clock, PTP_PF_EXTTS, 0);
                         ^
   1 error generated.


vim +/ptp_find_pin_unlocked +342 drivers/net/ethernet/microchip/lan966x/lan966x_ptp.c

   323	
   324	irqreturn_t lan966x_ptp_ext_irq_handler(int irq, void *args)
   325	{
   326		struct lan966x *lan966x = args;
   327		struct lan966x_phc *phc;
   328		unsigned long flags;
   329		u64 time = 0;
   330		time64_t s;
   331		int pin, i;
   332		s64 ns;
   333	
   334		if (!(lan_rd(lan966x, PTP_PIN_INTR)))
   335			return IRQ_NONE;
   336	
   337		/* Go through all domains and see which pin generated the interrupt */
   338		for (i = 0; i < LAN966X_PHC_COUNT; ++i) {
   339			struct ptp_clock_event ptp_event = {0};
   340	
   341			phc = &lan966x->phc[i];
 > 342			pin = ptp_find_pin_unlocked(phc->clock, PTP_PF_EXTTS, 0);
   343			if (pin == -1)
   344				continue;
   345	
   346			if (!(lan_rd(lan966x, PTP_PIN_INTR) & BIT(pin)))
   347				continue;
   348	
   349			spin_lock_irqsave(&lan966x->ptp_clock_lock, flags);
   350	
   351			/* Enable to get the new interrupt.
   352			 * By writing 1 it clears the bit
   353			 */
   354			lan_wr(BIT(pin), lan966x, PTP_PIN_INTR);
   355	
   356			/* Get current time */
   357			s = lan_rd(lan966x, PTP_TOD_SEC_MSB(pin));
   358			s <<= 32;
   359			s |= lan_rd(lan966x, PTP_TOD_SEC_LSB(pin));
   360			ns = lan_rd(lan966x, PTP_TOD_NSEC(pin));
   361			ns &= PTP_TOD_NSEC_TOD_NSEC;
   362	
   363			spin_unlock_irqrestore(&lan966x->ptp_clock_lock, flags);
   364	
   365			if ((ns & 0xFFFFFFF0) == 0x3FFFFFF0) {
   366				s--;
   367				ns &= 0xf;
   368				ns += 999999984;
   369			}
   370			time = ktime_set(s, ns);
   371	
   372			ptp_event.index = pin;
   373			ptp_event.timestamp = time;
   374			ptp_event.type = PTP_CLOCK_EXTTS;
   375			ptp_clock_event(phc->clock, &ptp_event);
   376		}
   377	
   378		return IRQ_HANDLED;
   379	}
   380	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
