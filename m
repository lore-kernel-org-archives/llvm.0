Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5589156D3;
	Mon,  7 Aug 2023 23:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691450481; x=1722986481;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VyddJhrInFUkVB+bPCrEfC9K4HNNXneYR9PoLGnu44w=;
  b=aBLU+xFjD1he8sjXuJNBjo94yZ1l/QKoJFHfU7lyLBlivRChE6Sb1rjQ
   mdFXl0J3yjKCqYrpBvRXeG34o22upHz8QzsUzXPBoHJz6xg8bc3fyiqEi
   DSAGod1w82lRM4cK53IrFNgWXpiiL8Mm/DmktkvDNLjiLyBCXCeqY/DFB
   E0hZ6C8ojWjkGwqZOwWVxhwk9wxUgZxwS25DvuiGUuUS4CjAfPnkxp0hU
   t/HREUyf0YnwX63mIkL+gieX8nmHPdk1x9B9VvRGG8/LGwGg3y/MQkFKc
   z6yqg+BzJe3oLnPNAy1pyIjMt/55RWVf+Eeb1D50t7a3IGTW8Lor5lF9N
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="434519851"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="434519851"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 16:21:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="801123340"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="801123340"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Aug 2023 16:21:19 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qT9XK-0004wT-1w;
	Mon, 07 Aug 2023 23:21:18 +0000
Date: Tue, 8 Aug 2023 07:20:24 +0800
From: kernel test robot <lkp@intel.com>
To: Weidong Wang <wangweidong.a@awinic.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:fileJNcYRL 109/114] sound/soc/codecs/aw88261.c:651:7:
 warning: variable 'ret' is used uninitialized whenever 'if' condition is
 false
Message-ID: <202308080739.Wbmp17zm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git fileJNcYRL
head:   93fd2be6eb80fe37570fbd87652ec07a4f7c5b5a
commit: 028a2ae256916eeae1040049d2d0129535ace60e [109/114] ASoC: codecs: Add aw88261 amplifier driver
config: hexagon-randconfig-r012-20230807 (https://download.01.org/0day-ci/archive/20230808/202308080739.Wbmp17zm-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230808/202308080739.Wbmp17zm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308080739.Wbmp17zm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/codecs/aw88261.c:11:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from sound/soc/codecs/aw88261.c:11:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from sound/soc/codecs/aw88261.c:11:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> sound/soc/codecs/aw88261.c:651:7: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     651 |                 if (aw_dev->prof_cur != aw_dev->prof_index) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/aw88261.c:660:9: note: uninitialized use occurs here
     660 |         return ret;
         |                ^~~
   sound/soc/codecs/aw88261.c:651:3: note: remove the 'if' if its condition is always true
     651 |                 if (aw_dev->prof_cur != aw_dev->prof_index) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/aw88261.c:639:9: note: initialize the variable 'ret' to silence this warning
     639 |         int ret;
         |                ^
         |                 = 0
   7 warnings generated.


vim +651 sound/soc/codecs/aw88261.c

   635	
   636	static int aw88261_reg_update(struct aw88261 *aw88261, bool force)
   637	{
   638		struct aw_device *aw_dev = aw88261->aw_pa;
   639		int ret;
   640	
   641		if (force) {
   642			ret = regmap_write(aw_dev->regmap,
   643						AW88261_ID_REG, AW88261_SOFT_RESET_VALUE);
   644			if (ret)
   645				return ret;
   646	
   647			ret = aw88261_dev_fw_update(aw88261);
   648			if (ret)
   649				return ret;
   650		} else {
 > 651			if (aw_dev->prof_cur != aw_dev->prof_index) {
   652				ret = aw88261_dev_fw_update(aw88261);
   653				if (ret)
   654					return ret;
   655			}
   656		}
   657	
   658		aw_dev->prof_cur = aw_dev->prof_index;
   659	
   660		return ret;
   661	}
   662	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
