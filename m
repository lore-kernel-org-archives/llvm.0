Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626107C
	for <llvm@lists.linux.dev>; Mon, 19 Sep 2022 14:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663598264; x=1695134264;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DQXzR6mgg7tCdJ03+Ddfwc+6yxJEvlD5YLFuVNAA5RU=;
  b=Q4ouycn/lCiUQjKMsyKrkwTgJVsyJw5ij4VdTRiM96YAhXMSn5yC82DF
   GY6Y7cazRQHu/QL0/u+uC1+ob2baNkhGYan6t6MHniO4CmkqP3RbGWDWI
   6Rv+GKVmiZ9vww1XE9OIMeA7LhM+HQ9xTzjNGmJtt63vfcHeRE8A6xWFx
   sftSLCMjfl/1rCNaECsgXzXBBmJNYGP+EHqY0mDuqY41NOHeyBqBLdWGh
   CtBb7J5Pnu3SlPwBbfeLwtr8U/ycjS1RVlY9B92xRdlxtpp3niRmKOAZ+
   IHsPTNfceCmLI2bBd383JCNusRMUTJso0AaLYMdZYkUXPlBM3qklzt1nL
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="300790530"
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; 
   d="scan'208";a="300790530"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2022 07:37:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; 
   d="scan'208";a="651700255"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 19 Sep 2022 07:37:42 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oaHu1-000223-1k;
	Mon, 19 Sep 2022 14:37:41 +0000
Date: Mon, 19 Sep 2022 22:37:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jagan Teki <jagan@edgeble.ai>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Finley Xiao <finley.xiao@rock-chips.com>
Subject: [linux-next:master 7127/7934]
 drivers/clk/rockchip/clk-rv1126.c:178:7: warning: unused variable
 'mux_cpll_hpll_gpll_p'
Message-ID: <202209192243.d80zUWVW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4c9ca5b1597e3222177ba2a94658f78fa5ef4f58
commit: 7f2f620daa88e72b04efd2f3da84abea0b5ca1c7 [7127/7934] clk: rockchip: Add clock controller support for RV1126 SoC
config: arm-defconfig (https://download.01.org/0day-ci/archive/20220919/202209192243.d80zUWVW-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=7f2f620daa88e72b04efd2f3da84abea0b5ca1c7
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 7f2f620daa88e72b04efd2f3da84abea0b5ca1c7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/clk/rockchip/ drivers/irqchip/ drivers/net/wireless/ralink/rt2x00/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/clk/rockchip/clk-rv1126.c:178:7: warning: unused variable 'mux_cpll_hpll_gpll_p' [-Wunused-const-variable]
   PNAME(mux_cpll_hpll_gpll_p)             = { "cpll", "hpll", "gpll" };
         ^
>> drivers/clk/rockchip/clk-rv1126.c:179:7: warning: unused variable 'mux_cpll_gpll_hpll_p' [-Wunused-const-variable]
   PNAME(mux_cpll_gpll_hpll_p)             = { "cpll", "gpll", "hpll" };
         ^
>> drivers/clk/rockchip/clk-rv1126.c:180:7: warning: unused variable 'mux_dclk_vop_p' [-Wunused-const-variable]
   PNAME(mux_dclk_vop_p)                   = { "dclk_vop_div", "dclk_vop_fracdiv", "xin24m" };
         ^
>> drivers/clk/rockchip/clk-rv1126.c:181:7: warning: unused variable 'mux_aclk_pdvi_p' [-Wunused-const-variable]
   PNAME(mux_aclk_pdvi_p)                  = { "aclk_pdvi_div", "aclk_pdvi_np5" };
         ^
>> drivers/clk/rockchip/clk-rv1126.c:182:7: warning: unused variable 'mux_gpll_cpll_hpll_p' [-Wunused-const-variable]
   PNAME(mux_gpll_cpll_hpll_p)             = { "gpll", "cpll", "hpll" };
         ^
>> drivers/clk/rockchip/clk-rv1126.c:183:7: warning: unused variable 'mux_clk_isp_p' [-Wunused-const-variable]
   PNAME(mux_clk_isp_p)                    = { "clk_isp_div", "clk_isp_np5" };
         ^
>> drivers/clk/rockchip/clk-rv1126.c:184:7: warning: unused variable 'mux_gpll_usb480m_p' [-Wunused-const-variable]
   PNAME(mux_gpll_usb480m_p)               = { "gpll", "usb480m" };
         ^
>> drivers/clk/rockchip/clk-rv1126.c:185:7: warning: unused variable 'mux_cif_out2io_p' [-Wunused-const-variable]
   PNAME(mux_cif_out2io_p)                 = { "xin24m", "clk_cif_out2io_div", "clk_cif_out2io_fracdiv" };
         ^
>> drivers/clk/rockchip/clk-rv1126.c:186:7: warning: unused variable 'mux_mipicsi_out2io_p' [-Wunused-const-variable]
   PNAME(mux_mipicsi_out2io_p)             = { "xin24m", "clk_mipicsi_out2io_div", "clk_mipicsi_out2io_fracdiv" };
         ^
>> drivers/clk/rockchip/clk-rv1126.c:187:7: warning: unused variable 'mux_aclk_pdispp_p' [-Wunused-const-variable]
   PNAME(mux_aclk_pdispp_p)                = { "aclk_pdispp_div", "aclk_pdispp_npu" };
         ^
>> drivers/clk/rockchip/clk-rv1126.c:188:7: warning: unused variable 'mux_clk_ispp_p' [-Wunused-const-variable]
   PNAME(mux_clk_ispp_p)                   = { "clk_ispp_div", "clk_ispp_npu" };
         ^
>> drivers/clk/rockchip/clk-rv1126.c:197:7: warning: unused variable 'mux_gpll_cpll_apll_hpll_p' [-Wunused-const-variable]
   PNAME(mux_gpll_cpll_apll_hpll_p)        = { "gpll", "cpll", "dummy_apll", "hpll" };
         ^
>> drivers/clk/rockchip/clk-rv1126.c:198:7: warning: unused variable 'mux_aclk_pdnpu_p' [-Wunused-const-variable]
   PNAME(mux_aclk_pdnpu_p)                 = { "aclk_pdnpu_div", "aclk_pdnpu_np5" };
         ^
>> drivers/clk/rockchip/clk-rv1126.c:199:7: warning: unused variable 'mux_clk_npu_p' [-Wunused-const-variable]
   PNAME(mux_clk_npu_p)                    = { "clk_npu_div", "clk_npu_np5" };
         ^
   14 warnings generated.


vim +/mux_cpll_hpll_gpll_p +178 drivers/clk/rockchip/clk-rv1126.c

   144	
   145	PNAME(mux_pll_p)			= { "xin24m" };
   146	PNAME(mux_rtc32k_p)			= { "clk_pmupvtm_divout", "xin32k", "clk_osc0_div32k" };
   147	PNAME(mux_wifi_p)			= { "clk_wifi_osc0", "clk_wifi_div" };
   148	PNAME(mux_gpll_usb480m_cpll_xin24m_p)	= { "gpll", "usb480m", "cpll", "xin24m" };
   149	PNAME(mux_uart1_p)			= { "sclk_uart1_div", "sclk_uart1_fracdiv", "xin24m" };
   150	PNAME(mux_xin24m_gpll_p)		= { "xin24m", "gpll" };
   151	PNAME(mux_gpll_xin24m_p)		= { "gpll", "xin24m" };
   152	PNAME(mux_xin24m_32k_p)			= { "xin24m", "clk_rtc32k" };
   153	PNAME(mux_usbphy_otg_ref_p)		= { "clk_ref12m", "xin_osc0_div2_usbphyref_otg" };
   154	PNAME(mux_usbphy_host_ref_p)		= { "clk_ref12m", "xin_osc0_div2_usbphyref_host" };
   155	PNAME(mux_mipidsiphy_ref_p)		= { "clk_ref24m", "xin_osc0_mipiphyref" };
   156	PNAME(mux_usb480m_p)			= { "xin24m", "usb480m_phy", "clk_rtc32k" };
   157	PNAME(mux_armclk_p)			= { "gpll", "cpll", "apll" };
   158	PNAME(mux_gpll_cpll_dpll_p)		= { "gpll", "cpll", "dummy_dpll" };
   159	PNAME(mux_gpll_cpll_p)			= { "gpll", "cpll" };
   160	PNAME(mux_hclk_pclk_pdbus_p)		= { "gpll", "dummy_cpll" };
   161	PNAME(mux_gpll_cpll_usb480m_xin24m_p)	= { "gpll", "cpll", "usb480m", "xin24m" };
   162	PNAME(mux_uart0_p)			= { "sclk_uart0_div", "sclk_uart0_frac", "xin24m" };
   163	PNAME(mux_uart2_p)			= { "sclk_uart2_div", "sclk_uart2_frac", "xin24m" };
   164	PNAME(mux_uart3_p)			= { "sclk_uart3_div", "sclk_uart3_frac", "xin24m" };
   165	PNAME(mux_uart4_p)			= { "sclk_uart4_div", "sclk_uart4_frac", "xin24m" };
   166	PNAME(mux_uart5_p)			= { "sclk_uart5_div", "sclk_uart5_frac", "xin24m" };
   167	PNAME(mux_cpll_gpll_p)			= { "cpll", "gpll" };
   168	PNAME(mux_i2s0_tx_p)			= { "mclk_i2s0_tx_div", "mclk_i2s0_tx_fracdiv", "i2s0_mclkin", "xin12m" };
   169	PNAME(mux_i2s0_rx_p)			= { "mclk_i2s0_rx_div", "mclk_i2s0_rx_fracdiv", "i2s0_mclkin", "xin12m" };
   170	PNAME(mux_i2s0_tx_out2io_p)		= { "mclk_i2s0_tx", "xin12m" };
   171	PNAME(mux_i2s0_rx_out2io_p)		= { "mclk_i2s0_rx", "xin12m" };
   172	PNAME(mux_i2s1_p)			= { "mclk_i2s1_div", "mclk_i2s1_fracdiv", "i2s1_mclkin", "xin12m" };
   173	PNAME(mux_i2s1_out2io_p)		= { "mclk_i2s1", "xin12m" };
   174	PNAME(mux_i2s2_p)			= { "mclk_i2s2_div", "mclk_i2s2_fracdiv", "i2s2_mclkin", "xin12m" };
   175	PNAME(mux_i2s2_out2io_p)		= { "mclk_i2s2", "xin12m" };
   176	PNAME(mux_gpll_cpll_xin24m_p)		= { "gpll", "cpll", "xin24m" };
   177	PNAME(mux_audpwm_p)			= { "sclk_audpwm_div", "sclk_audpwm_fracdiv", "xin24m" };
 > 178	PNAME(mux_cpll_hpll_gpll_p)		= { "cpll", "hpll", "gpll" };
 > 179	PNAME(mux_cpll_gpll_hpll_p)		= { "cpll", "gpll", "hpll" };
 > 180	PNAME(mux_dclk_vop_p)			= { "dclk_vop_div", "dclk_vop_fracdiv", "xin24m" };
 > 181	PNAME(mux_aclk_pdvi_p)			= { "aclk_pdvi_div", "aclk_pdvi_np5" };
 > 182	PNAME(mux_gpll_cpll_hpll_p)		= { "gpll", "cpll", "hpll" };
 > 183	PNAME(mux_clk_isp_p)			= { "clk_isp_div", "clk_isp_np5" };
 > 184	PNAME(mux_gpll_usb480m_p)		= { "gpll", "usb480m" };
 > 185	PNAME(mux_cif_out2io_p)			= { "xin24m", "clk_cif_out2io_div", "clk_cif_out2io_fracdiv" };
 > 186	PNAME(mux_mipicsi_out2io_p)		= { "xin24m", "clk_mipicsi_out2io_div", "clk_mipicsi_out2io_fracdiv" };
 > 187	PNAME(mux_aclk_pdispp_p)		= { "aclk_pdispp_div", "aclk_pdispp_npu" };
 > 188	PNAME(mux_clk_ispp_p)			= { "clk_ispp_div", "clk_ispp_npu" };
   189	PNAME(mux_usb480m_gpll_p)		= { "usb480m", "gpll" };
   190	PNAME(clk_gmac_src_m0_p)		= { "clk_gmac_div", "clk_gmac_rgmii_m0" };
   191	PNAME(clk_gmac_src_m1_p)		= { "clk_gmac_div", "clk_gmac_rgmii_m1" };
   192	PNAME(mux_clk_gmac_src_p)		= { "clk_gmac_src_m0", "clk_gmac_src_m1" };
   193	PNAME(mux_rgmii_clk_p)			= { "clk_gmac_tx_div50", "clk_gmac_tx_div5", "clk_gmac_tx_src", "clk_gmac_tx_src"};
   194	PNAME(mux_rmii_clk_p)			= { "clk_gmac_rx_div20", "clk_gmac_rx_div2" };
   195	PNAME(mux_gmac_tx_rx_p)			= { "rgmii_mode_clk", "rmii_mode_clk" };
   196	PNAME(mux_dpll_gpll_p)			= { "dpll", "gpll" };
 > 197	PNAME(mux_gpll_cpll_apll_hpll_p)	= { "gpll", "cpll", "dummy_apll", "hpll" };
 > 198	PNAME(mux_aclk_pdnpu_p)			= { "aclk_pdnpu_div", "aclk_pdnpu_np5" };
 > 199	PNAME(mux_clk_npu_p)			= { "clk_npu_div", "clk_npu_np5" };
   200	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
