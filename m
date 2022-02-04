Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8888E29CA
	for <llvm@lists.linux.dev>; Fri,  4 Feb 2022 17:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643997580; x=1675533580;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i7C4BKOaffz3S5FaBVAVvCSPXn1+alDyK0CZfCaeH18=;
  b=JzbUDqr7QMX/1hrf7BQjAC2kaiz9SEitgEPxpPu8q/LGUyLXDPUDam+c
   7AN6XKS9XM+0oQP0r29mCRn/7Yh6Ujiz+2JDR1GA4JyG+f084effjdhr9
   +XLJYCElT/flmRT3lpRAUJ93fqOCm5ccvNKkiokG1l/DPdVA2vLLZGMfk
   Lu6wt0DbmpK/CuDTrPaEvD1en/yCu7R8ujgCJZxfPA1No26V+r/WBunqb
   q5o1gIOGIxnZPwyQRVwgHrym0dIH8BZ6J8k7OWy3M+KAB/xUTEeME7Kuv
   ArLYji8gIDQG/33aRHv5XvfjtjYfC2CJ8JtU4/HH1xJttW6Of/6q9mVEj
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10248"; a="231980357"
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; 
   d="scan'208";a="231980357"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2022 09:59:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; 
   d="scan'208";a="600297463"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 04 Feb 2022 09:59:38 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nG2rx-000Xyq-Cj; Fri, 04 Feb 2022 17:59:37 +0000
Date: Sat, 5 Feb 2022 01:58:53 +0800
From: kernel test robot <lkp@intel.com>
To: Krishna Yarlagadda <kyarlagadda@nvidia.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 6/6] spi: tegra210-quad: combined sequence mode
Message-ID: <202202050117.8UkDI9O7-lkp@intel.com>
References: <1643970576-31503-7-git-send-email-kyarlagadda@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1643970576-31503-7-git-send-email-kyarlagadda@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Krishna,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on v5.17-rc2 next-20220204]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Krishna-Yarlagadda/Tegra-QUAD-SPI-combined-sequence-mode/20220204-183224
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
config: hexagon-randconfig-r045-20220131 (https://download.01.org/0day-ci/archive/20220205/202202050117.8UkDI9O7-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a73e4ce6a59b01f0e37037761c1e6889d539d233)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/7b66ae189feb38fc460bc1eaf1374f82fd0eb893
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Krishna-Yarlagadda/Tegra-QUAD-SPI-combined-sequence-mode/20220204-183224
        git checkout 7b66ae189feb38fc460bc1eaf1374f82fd0eb893
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/spi/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/spi/spi-tegra210-quad.c:989:2: warning: ignoring return value of function declared with 'warn_unused_result' attribute [-Wunused-result]
           device_reset(tqspi->dev);
           ^~~~~~~~~~~~ ~~~~~~~~~~
   drivers/spi/spi-tegra210-quad.c:1133:5: warning: ignoring return value of function declared with 'warn_unused_result' attribute [-Wunused-result]
                                   device_reset(tqspi->dev);
                                   ^~~~~~~~~~~~ ~~~~~~~~~~
>> drivers/spi/spi-tegra210-quad.c:1052:20: warning: variable 'len' set but not used [-Wunused-but-set-variable]
           u8 cmd_value = 0, len = 0, val = 0;
                             ^
>> drivers/spi/spi-tegra210-quad.c:1044:6: warning: variable 'single_xfer' set but not used [-Wunused-but-set-variable]
           int single_xfer;
               ^
   drivers/spi/spi-tegra210-quad.c:1528:2: warning: ignoring return value of function declared with 'warn_unused_result' attribute [-Wunused-result]
           device_reset(tqspi->dev);
           ^~~~~~~~~~~~ ~~~~~~~~~~
   5 warnings generated.


vim +/len +1052 drivers/spi/spi-tegra210-quad.c

  1039	
  1040	static int tegra_qspi_combined_seq_xfer(struct tegra_qspi *tqspi,
  1041						struct spi_message *msg)
  1042	{
  1043		bool is_first_msg = true;
> 1044		int single_xfer;
  1045		struct spi_transfer *xfer;
  1046		struct spi_device *spi = msg->spi;
  1047		u8 transfer_phase = 0;
  1048		u32 cmd1 = 0, dma_ctl = 0;
  1049		int ret;
  1050		u32 address_value = 0;
  1051		u32 cmd_config = 0, addr_config = 0;
> 1052		u8 cmd_value = 0, len = 0, val = 0;
  1053	
  1054		/* Enable Combined sequence mode */
  1055		val = tegra_qspi_readl(tqspi, QSPI_GLOBAL_CONFIG);
  1056		val |= QSPI_CMB_SEQ_EN;
  1057		tegra_qspi_writel(tqspi, val, QSPI_GLOBAL_CONFIG);
  1058		single_xfer = list_is_singular(&msg->transfers);
  1059		/* Process individual transfer list */
  1060		list_for_each_entry(xfer, &msg->transfers, transfer_list) {
  1061			if (transfer_phase == CMD_TRANSFER) {
  1062				/* X1 SDR mode */
  1063				cmd_config = tegra_qspi_cmd_config(false, 0,
  1064								   xfer->len);
  1065				cmd_value = *((const u8 *)(xfer->tx_buf));
  1066	
  1067			} else if (transfer_phase == ADDR_TRANSFER) {
  1068				len = xfer->len;
  1069				/* X1 SDR mode */
  1070				addr_config = tegra_qspi_addr_config(false, 0,
  1071								     xfer->len);
  1072				address_value = *((const u32 *)(xfer->tx_buf));
  1073			} else {
  1074				/* Program Command, Address value in register */
  1075				tegra_qspi_writel(tqspi, cmd_value, QSPI_CMB_SEQ_CMD);
  1076				tegra_qspi_writel(tqspi, address_value,
  1077						  QSPI_CMB_SEQ_ADDR);
  1078				/* Program Command and Address config in register */
  1079				tegra_qspi_writel(tqspi, cmd_config,
  1080						  QSPI_CMB_SEQ_CMD_CFG);
  1081				tegra_qspi_writel(tqspi, addr_config,
  1082						  QSPI_CMB_SEQ_ADDR_CFG);
  1083	
  1084				reinit_completion(&tqspi->xfer_completion);
  1085				cmd1 = tegra_qspi_setup_transfer_one(spi, xfer,
  1086								     is_first_msg);
  1087				ret = tegra_qspi_start_transfer_one(spi, xfer,
  1088								    cmd1);
  1089	
  1090				if (ret < 0) {
  1091					dev_err(tqspi->dev, "Failed to start transfer-one: %d\n",
  1092						ret);
  1093					return ret;
  1094				}
  1095	
  1096				is_first_msg = false;
  1097				ret = wait_for_completion_timeout
  1098						(&tqspi->xfer_completion,
  1099						QSPI_DMA_TIMEOUT);
  1100	
  1101				if (WARN_ON(ret == 0)) {
  1102					dev_err(tqspi->dev, "QSPI Transfer failed with timeout: %d\n",
  1103						ret);
  1104					if (tqspi->is_curr_dma_xfer &&
  1105					    (tqspi->cur_direction & DATA_DIR_TX))
  1106						dmaengine_terminate_all
  1107							(tqspi->tx_dma_chan);
  1108	
  1109					if (tqspi->is_curr_dma_xfer &&
  1110					    (tqspi->cur_direction & DATA_DIR_RX))
  1111						dmaengine_terminate_all
  1112							(tqspi->rx_dma_chan);
  1113	
  1114					/* Abort transfer by resetting pio/dma bit */
  1115					if (!tqspi->is_curr_dma_xfer) {
  1116						cmd1 = tegra_qspi_readl
  1117								(tqspi,
  1118								 QSPI_COMMAND1);
  1119						cmd1 &= ~QSPI_PIO;
  1120						tegra_qspi_writel
  1121								(tqspi, cmd1,
  1122								 QSPI_COMMAND1);
  1123					} else {
  1124						dma_ctl = tegra_qspi_readl
  1125								(tqspi,
  1126								 QSPI_DMA_CTL);
  1127						dma_ctl &= ~QSPI_DMA_EN;
  1128						tegra_qspi_writel(tqspi, dma_ctl,
  1129								  QSPI_DMA_CTL);
  1130					}
  1131	
  1132					/* Reset controller if timeout happens */
  1133					device_reset(tqspi->dev);
  1134					ret = -EIO;
  1135					goto exit;
  1136				}
  1137	
  1138				if (tqspi->tx_status ||  tqspi->rx_status) {
  1139					dev_err(tqspi->dev, "QSPI Transfer failed\n");
  1140					tqspi->tx_status = 0;
  1141					tqspi->rx_status = 0;
  1142					ret = -EIO;
  1143					goto exit;
  1144				}
  1145			}
  1146			msg->actual_length += xfer->len;
  1147			transfer_phase++;
  1148		}
  1149	
  1150	exit:
  1151		msg->status = ret;
  1152	
  1153		return ret;
  1154	}
  1155	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
