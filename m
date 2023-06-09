Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455BC1373;
	Fri,  9 Jun 2023 03:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686280333; x=1717816333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aBKvJgdnUfuu1+9D/YDlouN8zb116ZdvXqjB47hRwac=;
  b=K2gSWJSz1gOklSlTlFhzHPzXbrIBVBE+g8bbttrbld725yjJA0VcQLN2
   GYY8JsWazZ8NRoivQyELLypeoohAsydmUti+gG+fa2Vp+iPvcmHqSH+gV
   IS/5cjG7FN75BICV8QyCEX6GT6i6e3u5Nqs2Y+Io8WCqU87HCfMM76dhs
   vl9IByDIaMZ0zuAVB1Wer5WNGfDHmyHw6h00Tkf/d71XbQUc0UxeaZ6dE
   xfMhaTIf2OeQNN6PaQG8CXM7jaOv7MoLUO7ePS4ujtIfg5EFG26vAph8z
   cmNy8WGeYNFgnzRMI5Z0mDFhx0EeO1oup6rgEkSn9xAA/KOn0sV8uHoRW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="359984012"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="359984012"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 20:12:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="956979556"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="956979556"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Jun 2023 20:12:10 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7SXp-0008ZU-2Z;
	Fri, 09 Jun 2023 03:12:09 +0000
Date: Fri, 9 Jun 2023 11:11:20 +0800
From: kernel test robot <lkp@intel.com>
To: Wenbin Mei <wenbin.mei@mediatek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ulf Hansson <ulf.hansson@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [ulfh-mmc:next 14/14] drivers/mmc/host/mtk-sd.c:2468:12: error: call
 to undeclared function 'FIELD_GET'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202306091106.vNMNXZ4y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git next
head:   364dae3e80a48fcd22c9d4e57223d2918bcadd6f
commit: 364dae3e80a48fcd22c9d4e57223d2918bcadd6f [14/14] mmc: mtk-sd: reduce CIT for better performance
config: i386-randconfig-r023-20230608 (https://download.01.org/0day-ci/archive/20230609/202306091106.vNMNXZ4y-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git/commit/?id=364dae3e80a48fcd22c9d4e57223d2918bcadd6f
        git remote add ulfh-mmc git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git
        git fetch --no-tags ulfh-mmc next
        git checkout 364dae3e80a48fcd22c9d4e57223d2918bcadd6f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/mmc/host/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306091106.vNMNXZ4y-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mmc/host/mtk-sd.c:2468:12: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           itcfmul = CQHCI_ITCFMUL(cqhci_readl(cq_host, CQHCI_CAP));
                     ^
   drivers/mmc/host/cqhci.h:27:27: note: expanded from macro 'CQHCI_ITCFMUL'
   #define CQHCI_ITCFMUL(x)                FIELD_GET(CQHCI_CAP_ITCFMUL, (x))
                                           ^
   1 error generated.


vim +/FIELD_GET +2468 drivers/mmc/host/mtk-sd.c

  2453	
  2454	static void msdc_cqe_cit_cal(struct msdc_host *host, u64 timer_ns)
  2455	{
  2456		struct mmc_host *mmc = mmc_from_priv(host);
  2457		struct cqhci_host *cq_host = mmc->cqe_private;
  2458		u8 itcfmul;
  2459		unsigned long hclk_freq;
  2460		u64 value;
  2461	
  2462		/*
  2463		 * On MediaTek SoCs the MSDC controller's CQE uses msdc_hclk as ITCFVAL
  2464		 * so we multiply/divide the HCLK frequency by ITCFMUL to calculate the
  2465		 * Send Status Command Idle Timer (CIT) value.
  2466		 */
  2467		hclk_freq = clk_get_rate(host->h_clk);
> 2468		itcfmul = CQHCI_ITCFMUL(cqhci_readl(cq_host, CQHCI_CAP));
  2469		switch (itcfmul) {
  2470		case 0x0:
  2471			do_div(hclk_freq, 1000);
  2472			break;
  2473		case 0x1:
  2474			do_div(hclk_freq, 100);
  2475			break;
  2476		case 0x2:
  2477			do_div(hclk_freq, 10);
  2478			break;
  2479		case 0x3:
  2480			break;
  2481		case 0x4:
  2482			hclk_freq = hclk_freq * 10;
  2483			break;
  2484		default:
  2485			host->cq_ssc1_time = 0x40;
  2486			return;
  2487		}
  2488	
  2489		value = hclk_freq * timer_ns;
  2490		do_div(value, 1000000000);
  2491		host->cq_ssc1_time = value;
  2492	}
  2493	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
