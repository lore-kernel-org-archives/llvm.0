Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30B38C04;
	Tue, 31 Jan 2023 14:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675176538; x=1706712538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KkNlVjcBVDfQgu0ETCQE7EldQapEvGWY+gMETxI+Wiw=;
  b=gBnaskrvmHWLMVkv/Dn6E3PV7sSjCcsXtvhRo7SfxxioG2ZjEUIv/qcC
   QCByJth2qlfb4TAfZs41/97bqZHFAdjgbFJLG4DfXQaO6A6p8Xu2TllTc
   WIAkrokGwh7kM8W9xEbZFSFAnc2jqAyZcHIK4EcJEWp9WmB9FtzeameZQ
   sCiuzZaapvqccFChhX36qOl/g3qE7UclsVPBZlsXwa88hPaj1HLk9Mw+m
   L3o4KLAEVUWbLCSxmPOQ8amT9352R6+MvfO/5OQC8f+B1ahPfRSCVpz9u
   imTME9Piu+2guJV023iRs4k+ybruH/CGUlU0V4MfXF/xUP+wnPHzgKG4V
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="327874627"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="327874627"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 06:48:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="909932780"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="909932780"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 31 Jan 2023 06:48:56 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMrwN-0004UA-28;
	Tue, 31 Jan 2023 14:48:55 +0000
Date: Tue, 31 Jan 2023 22:48:48 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Lee Jones <lee.jones@linaro.org>, Lee Jones <lee@kernel.org>
Subject: [lee-mfd:for-mfd-next 36/37] drivers/mmc/host/tmio_mmc.c:141:12:
 error: no member named 'enable' in 'struct mfd_cell'
Message-ID: <202301312253.oUVq9cys-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
head:   a561a980c024193e342b6878f62e02ff9d018285
commit: 78e7ccec94380519919267670174cbf1711b7963 [36/37] mfd: Remove .enable() and .disable() callbacks
config: hexagon-randconfig-r041-20230130 (https://download.01.org/0day-ci/archive/20230131/202301312253.oUVq9cys-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/commit/?id=78e7ccec94380519919267670174cbf1711b7963
        git remote add lee-mfd https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git
        git fetch --no-tags lee-mfd for-mfd-next
        git checkout 78e7ccec94380519919267670174cbf1711b7963
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/mmc/host/ drivers/video/fbdev/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/mmc/host/tmio_mmc.c:16:
   In file included from include/linux/mfd/tmio.h:6:
   In file included from include/linux/fb.h:6:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/mmc/host/tmio_mmc.c:16:
   In file included from include/linux/mfd/tmio.h:6:
   In file included from include/linux/fb.h:6:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/mmc/host/tmio_mmc.c:16:
   In file included from include/linux/mfd/tmio.h:6:
   In file included from include/linux/fb.h:6:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/mmc/host/tmio_mmc.c:141:12: error: no member named 'enable' in 'struct mfd_cell'
           if (cell->enable) {
               ~~~~  ^
   drivers/mmc/host/tmio_mmc.c:142:15: error: no member named 'enable' in 'struct mfd_cell'
                   ret = cell->enable(pdev);
                         ~~~~  ^
>> drivers/mmc/host/tmio_mmc.c:186:12: error: no member named 'disable' in 'struct mfd_cell'
           if (cell->disable)
               ~~~~  ^
   drivers/mmc/host/tmio_mmc.c:187:9: error: no member named 'disable' in 'struct mfd_cell'
                   cell->disable(pdev);
                   ~~~~  ^
   drivers/mmc/host/tmio_mmc.c:198:12: error: no member named 'disable' in 'struct mfd_cell'
           if (cell->disable)
               ~~~~  ^
   drivers/mmc/host/tmio_mmc.c:199:9: error: no member named 'disable' in 'struct mfd_cell'
                   cell->disable(pdev);
                   ~~~~  ^
   6 warnings and 6 errors generated.
--
   In file included from drivers/video/fbdev/tmiofb.c:17:
   In file included from include/linux/fb.h:6:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/video/fbdev/tmiofb.c:17:
   In file included from include/linux/fb.h:6:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/video/fbdev/tmiofb.c:17:
   In file included from include/linux/fb.h:6:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/video/fbdev/tmiofb.c:759:12: error: no member named 'enable' in 'struct mfd_cell'
           if (cell->enable) {
               ~~~~  ^
   drivers/video/fbdev/tmiofb.c:760:18: error: no member named 'enable' in 'struct mfd_cell'
                   retval = cell->enable(dev);
                            ~~~~  ^
>> drivers/video/fbdev/tmiofb.c:784:12: error: no member named 'disable' in 'struct mfd_cell'
           if (cell->disable)
               ~~~~  ^
   drivers/video/fbdev/tmiofb.c:785:9: error: no member named 'disable' in 'struct mfd_cell'
                   cell->disable(dev);
                   ~~~~  ^
   drivers/video/fbdev/tmiofb.c:813:13: error: no member named 'disable' in 'struct mfd_cell'
                   if (cell->disable)
                       ~~~~  ^
   drivers/video/fbdev/tmiofb.c:814:10: error: no member named 'disable' in 'struct mfd_cell'
                           cell->disable(dev);
                           ~~~~  ^
   6 warnings and 6 errors generated.


vim +141 drivers/mmc/host/tmio_mmc.c

4a48998fa16121 Ian Molton            2008-07-15  118  
c3be1efd41a97f Bill Pemberton        2012-11-19  119  static int tmio_mmc_probe(struct platform_device *pdev)
4a48998fa16121 Ian Molton            2008-07-15  120  {
b6147490e6aac8 Guennadi Liakhovetski 2011-03-23  121  	const struct mfd_cell *cell = mfd_get_cell(pdev);
f0e46cc4971f6b Philipp Zabel         2009-06-04  122  	struct tmio_mmc_data *pdata;
4a48998fa16121 Ian Molton            2008-07-15  123  	struct tmio_mmc_host *host;
3b159a6e955c8d Kuninori Morimoto     2013-11-20  124  	struct resource *res;
8e7bfdb37ac001 Magnus Damm           2011-05-06  125  	int ret = -EINVAL, irq;
4a48998fa16121 Ian Molton            2008-07-15  126  
b6147490e6aac8 Guennadi Liakhovetski 2011-03-23  127  	if (pdev->num_resources != 2)
4a48998fa16121 Ian Molton            2008-07-15  128  		goto out;
4a48998fa16121 Ian Molton            2008-07-15  129  
ec71974f2a3ae0 Samuel Ortiz          2011-04-06  130  	pdata = pdev->dev.platform_data;
d6c9b5ed37c265 Philipp Zabel         2009-06-04  131  	if (!pdata || !pdata->hclk)
f0e46cc4971f6b Philipp Zabel         2009-06-04  132  		goto out;
d6c9b5ed37c265 Philipp Zabel         2009-06-04  133  
8e7bfdb37ac001 Magnus Damm           2011-05-06  134  	irq = platform_get_irq(pdev, 0);
8e7bfdb37ac001 Magnus Damm           2011-05-06  135  	if (irq < 0) {
8e7bfdb37ac001 Magnus Damm           2011-05-06  136  		ret = irq;
8e7bfdb37ac001 Magnus Damm           2011-05-06  137  		goto out;
8e7bfdb37ac001 Magnus Damm           2011-05-06  138  	}
8e7bfdb37ac001 Magnus Damm           2011-05-06  139  
4a48998fa16121 Ian Molton            2008-07-15  140  	/* Tell the MFD core we are ready to be enabled */
4a48998fa16121 Ian Molton            2008-07-15 @141  	if (cell->enable) {
b6147490e6aac8 Guennadi Liakhovetski 2011-03-23  142  		ret = cell->enable(pdev);
4a48998fa16121 Ian Molton            2008-07-15  143  		if (ret)
b6147490e6aac8 Guennadi Liakhovetski 2011-03-23  144  			goto out;
4a48998fa16121 Ian Molton            2008-07-15  145  	}
4a48998fa16121 Ian Molton            2008-07-15  146  
3b159a6e955c8d Kuninori Morimoto     2013-11-20  147  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
25db67e2ce2fdf Ian Molton            2015-04-27  148  	if (!res) {
25db67e2ce2fdf Ian Molton            2015-04-27  149  		ret = -EINVAL;
25db67e2ce2fdf Ian Molton            2015-04-27  150  		goto cell_disable;
25db67e2ce2fdf Ian Molton            2015-04-27  151  	}
3b159a6e955c8d Kuninori Morimoto     2013-11-20  152  
b21fc294387e4c Masahiro Yamada       2018-01-18  153  	host = tmio_mmc_host_alloc(pdev, pdata);
8d09a13386ccde Masahiro Yamada       2018-01-18  154  	if (IS_ERR(host)) {
8d09a13386ccde Masahiro Yamada       2018-01-18  155  		ret = PTR_ERR(host);
7ee422dc6e947f Magnus Damm           2010-02-17  156  		goto cell_disable;
8d09a13386ccde Masahiro Yamada       2018-01-18  157  	}
4a48998fa16121 Ian Molton            2008-07-15  158  
7445bf9e6f4e5d Kuninori Morimoto     2015-01-13  159  	/* SD control register space size is 0x200, 0x400 for bus_shift=1 */
7445bf9e6f4e5d Kuninori Morimoto     2015-01-13  160  	host->bus_shift = resource_size(res) >> 10;
0196c8db8363f7 Masahiro Yamada       2018-08-23  161  	host->set_clock = tmio_mmc_set_clock;
acb9fce7309a38 Masahiro Yamada       2018-10-10  162  	host->reset = tmio_mmc_reset;
7445bf9e6f4e5d Kuninori Morimoto     2015-01-13  163  
b21fc294387e4c Masahiro Yamada       2018-01-18  164  	host->mmc->f_max = pdata->hclk;
b21fc294387e4c Masahiro Yamada       2018-01-18  165  	host->mmc->f_min = pdata->hclk / 512;
b21fc294387e4c Masahiro Yamada       2018-01-18  166  
bc45719c1b1a56 Masahiro Yamada       2018-01-18  167  	ret = tmio_mmc_host_probe(host);
94b110aff8679b Kuninori Morimoto     2015-01-13  168  	if (ret)
94b110aff8679b Kuninori Morimoto     2015-01-13  169  		goto host_free;
94b110aff8679b Kuninori Morimoto     2015-01-13  170  
de501af98dfab9 Ian Molton            2015-04-27  171  	ret = devm_request_irq(&pdev->dev, irq, tmio_mmc_irq,
de501af98dfab9 Ian Molton            2015-04-27  172  			       IRQF_TRIGGER_FALLING,
d9618e9f1a057e Yong Zhang            2011-09-22  173  			       dev_name(&pdev->dev), host);
8e7bfdb37ac001 Magnus Damm           2011-05-06  174  	if (ret)
8e7bfdb37ac001 Magnus Damm           2011-05-06  175  		goto host_remove;
8e7bfdb37ac001 Magnus Damm           2011-05-06  176  
ade8e9d3fb9232 Krzysztof Kozlowski   2020-11-16  177  	pr_info("%s at 0x%p irq %d\n", mmc_hostname(host->mmc), host->ctl, irq);
4a48998fa16121 Ian Molton            2008-07-15  178  
4a48998fa16121 Ian Molton            2008-07-15  179  	return 0;
4a48998fa16121 Ian Molton            2008-07-15  180  
8e7bfdb37ac001 Magnus Damm           2011-05-06  181  host_remove:
8e7bfdb37ac001 Magnus Damm           2011-05-06  182  	tmio_mmc_host_remove(host);
94b110aff8679b Kuninori Morimoto     2015-01-13  183  host_free:
94b110aff8679b Kuninori Morimoto     2015-01-13  184  	tmio_mmc_host_free(host);
7ee422dc6e947f Magnus Damm           2010-02-17  185  cell_disable:
7ee422dc6e947f Magnus Damm           2010-02-17 @186  	if (cell->disable)
b6147490e6aac8 Guennadi Liakhovetski 2011-03-23  187  		cell->disable(pdev);
4a48998fa16121 Ian Molton            2008-07-15  188  out:
4a48998fa16121 Ian Molton            2008-07-15  189  	return ret;
4a48998fa16121 Ian Molton            2008-07-15  190  }
4a48998fa16121 Ian Molton            2008-07-15  191  

:::::: The code at line 141 was first introduced by commit
:::::: 4a48998fa16121d0fe3436cce43afd6f47424103 mfd: TMIO MMC driver

:::::: TO: Ian Molton <spyro@f2s.com>
:::::: CC: Samuel Ortiz <sameo@openedhand.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
