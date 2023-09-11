Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FD528F9;
	Mon, 11 Sep 2023 22:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694472056; x=1726008056;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mhmmY5VPSlyAdVNJJgS7iufwlfE+amRbTJE+gdUzzM0=;
  b=UeKGNXKFDVQSv80s4PaKmn4m/gyMHKkATE4vvWKO2fttWLab4ArSPcP9
   51X3KtCSUjjuLRHsnu9CNtA9rfjY7eutRJtiLl8xYm3eeAOVr5AZgbwzf
   hBrUDjeoPvWg/lXn5h4mqQ+GuJWdzl697oF/T+9840PV0eDW/o8Fbb3Oy
   oT+Vi8sBbYsY2Kx8C/wF1X/YTx3NEfyZd1ce0EZT2XQYRw4a5CIV66brd
   yMzc3+GUpnLfZf3NRq6lpfqG8v2nua76KhtxV/EMtobKEgicu2vR108Rj
   GKuVUbzA5u3F5XQgfDQ7RQXO1WXlbnJR4Djc/z17Ol5aFFkYKLAKjDmcJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="375557090"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="375557090"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 15:40:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="833666959"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="833666959"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Sep 2023 15:40:52 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfpaM-0006pa-0u;
	Mon, 11 Sep 2023 22:40:50 +0000
Date: Tue, 12 Sep 2023 06:40:21 +0800
From: kernel test robot <lkp@intel.com>
To: Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next 5/6] microchip: lan865x: add driver support
 for Microchip's LAN865X MACPHY
Message-ID: <202309120628.2Mkm0paw-lkp@intel.com>
References: <20230908142919.14849-6-Parthiban.Veerasooran@microchip.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230908142919.14849-6-Parthiban.Veerasooran@microchip.com>

Hi Parthiban,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Parthiban-Veerasooran/net-ethernet-implement-OPEN-Alliance-control-transaction-interface/20230908-224352
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230908142919.14849-6-Parthiban.Veerasooran%40microchip.com
patch subject: [RFC PATCH net-next 5/6] microchip: lan865x: add driver support for Microchip's LAN865X MACPHY
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230912/202309120628.2Mkm0paw-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309120628.2Mkm0paw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309120628.2Mkm0paw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/microchip/../oa_tc6.c:133:5: warning: no previous prototype for function 'oa_tc6_perform_ctrl' [-Wmissing-prototypes]
   int oa_tc6_perform_ctrl(struct oa_tc6 *tc6, u32 addr, u32 val[], u8 len,
       ^
   drivers/net/ethernet/microchip/../oa_tc6.c:133:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int oa_tc6_perform_ctrl(struct oa_tc6 *tc6, u32 addr, u32 val[], u8 len,
   ^
   static 
   1 warning generated.


vim +/oa_tc6_perform_ctrl +133 drivers/net/ethernet/microchip/../oa_tc6.c

9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  132  
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08 @133  int oa_tc6_perform_ctrl(struct oa_tc6 *tc6, u32 addr, u32 val[], u8 len,
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  134  			bool wnr, bool ctrl_prot)
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  135  {
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  136  	u8 *tx_buf;
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  137  	u8 *rx_buf;
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  138  	u16 size;
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  139  	u16 pos;
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  140  	int ret;
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  141  
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  142  	if (ctrl_prot)
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  143  		size = (TC6_HDR_SIZE * 2) + (len * (TC6_HDR_SIZE * 2));
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  144  	else
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  145  		size = (TC6_HDR_SIZE * 2) + (len * TC6_HDR_SIZE);
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  146  
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  147  	tx_buf = kzalloc(size, GFP_KERNEL);
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  148  	if (!tx_buf)
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  149  		return -ENOMEM;
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  150  
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  151  	rx_buf = kzalloc(size, GFP_KERNEL);
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  152  	if (!rx_buf) {
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  153  		ret = -ENOMEM;
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  154  		goto err_rx_buf_kzalloc;
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  155  	}
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  156  
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  157  	/* Prepare control command */
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  158  	oa_tc6_prepare_ctrl_buf(tc6, addr, val, len, wnr, tx_buf, ctrl_prot);
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  159  
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  160  	/* Perform SPI transfer */
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  161  	ret = oa_tc6_spi_transfer(tc6->spi, tx_buf, rx_buf, size);
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  162  	if (ret)
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  163  		goto err_ctrl;
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  164  
2dc8ae856934a3 Parthiban Veerasooran 2023-09-08  165  	/* In case of reset write, the echoed control command doesn't have any
2dc8ae856934a3 Parthiban Veerasooran 2023-09-08  166  	 * valid data. So no need to check for error.
2dc8ae856934a3 Parthiban Veerasooran 2023-09-08  167  	 */
2dc8ae856934a3 Parthiban Veerasooran 2023-09-08  168  	if (addr != OA_TC6_RESET) {
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  169  		/* Check echoed/received control reply */
2dc8ae856934a3 Parthiban Veerasooran 2023-09-08  170  		ret = oa_tc6_check_control(tc6, tx_buf, rx_buf, len, wnr,
2dc8ae856934a3 Parthiban Veerasooran 2023-09-08  171  					   ctrl_prot);
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  172  		if (ret)
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  173  			goto err_ctrl;
2dc8ae856934a3 Parthiban Veerasooran 2023-09-08  174  	}
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  175  
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  176  	if (!wnr) {
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  177  		/* Copy read data from the rx data in case of ctrl read */
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  178  		for (u8 i = 0; i < len; i++) {
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  179  			if (!ctrl_prot) {
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  180  				pos = (TC6_HDR_SIZE * 2) + (i * TC6_HDR_SIZE);
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  181  				val[i] = be32_to_cpu(*(u32 *)&rx_buf[pos]);
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  182  			} else {
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  183  				pos = (TC6_HDR_SIZE * 2) +
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  184  				       (i * (TC6_HDR_SIZE * 2));
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  185  				val[i] = be32_to_cpu(*(u32 *)&rx_buf[pos]);
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  186  			}
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  187  		}
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  188  	}
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  189  
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  190  err_ctrl:
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  191  	kfree(rx_buf);
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  192  err_rx_buf_kzalloc:
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  193  	kfree(tx_buf);
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  194  	return ret;
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  195  }
9c44fe1a3412d9 Parthiban Veerasooran 2023-09-08  196  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
