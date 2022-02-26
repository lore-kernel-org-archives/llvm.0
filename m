Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CCC3B21
	for <llvm@lists.linux.dev>; Sat, 26 Feb 2022 11:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645875711; x=1677411711;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0Xw35ZwRsnVzKxjlNN+v8WyTqphsVZ/ABfTIyGllVBc=;
  b=nDWx6MHCISBCc3n7y+xMxHvx55clfI+74GrNueiqHIATdpdKgyfrUbLa
   Va1mnJgd1ksGAxJvUBanthcFpkq8GJeA8XxXSeA5qh6EuPCmrxIy3EhzS
   9QaRugwPsHgMKTII16wa8gv9A2szIZnlM/C3PjkVVKLuexqAV4lI1mFIp
   LUBGiBImSmTDJeqcQTD6o9S4jgsm7jNRDsHM6cq1cbSidcNzejFumff93
   RmCymfSb4dEpmmUXKKF9HEMhw16QYRzGeP5w36e+BJIBlOoMIPp3DgoCz
   TL9giAsAJW3dfwtb5nZT98dXwWz669cfCrsm/BRw0Nrx2+VQoER+G1S/4
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10269"; a="232625599"
X-IronPort-AV: E=Sophos;i="5.90,139,1643702400"; 
   d="scan'208";a="232625599"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2022 03:41:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,139,1643702400"; 
   d="scan'208";a="533887040"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 26 Feb 2022 03:41:49 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nNvSP-0005QK-9o; Sat, 26 Feb 2022 11:41:49 +0000
Date: Sat, 26 Feb 2022 19:41:33 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RESEND v4 1/2] ASoC: codecs: Add power domains support in
 digital macro codecs
Message-ID: <202202261951.xWhoUQKi-lkp@intel.com>
References: <1645861531-13829-2-git-send-email-quic_srivasam@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1645861531-13829-2-git-send-email-quic_srivasam@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Srinivasa,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[cannot apply to v5.17-rc5 next-20220225]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Srinivasa-Rao-Mandadapu/Add-power-domains-support-for-digital-macro-codecs/20220226-154756
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20220226/202202261951.xWhoUQKi-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/dbf07c8c599d3de2e83d99b0c562cbd2b429a70e
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Srinivasa-Rao-Mandadapu/Add-power-domains-support-for-digital-macro-codecs/20220226-154756
        git checkout dbf07c8c599d3de2e83d99b0c562cbd2b429a70e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/lpass-tx-macro.c:1829:10: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
                   return ret;
                          ^~~
   sound/soc/codecs/lpass-tx-macro.c:1800:9: note: initialize the variable 'ret' to silence this warning
           int ret, reg;
                  ^
                   = 0
   1 warning generated.


vim +/ret +1829 sound/soc/codecs/lpass-tx-macro.c

  1793	
  1794	static int tx_macro_probe(struct platform_device *pdev)
  1795	{
  1796		struct device *dev = &pdev->dev;
  1797		struct device_node *np = dev->of_node;
  1798		struct tx_macro *tx;
  1799		void __iomem *base;
  1800		int ret, reg;
  1801	
  1802		tx = devm_kzalloc(dev, sizeof(*tx), GFP_KERNEL);
  1803		if (!tx)
  1804			return -ENOMEM;
  1805	
  1806		tx->macro = devm_clk_get_optional(dev, "macro");
  1807		if (IS_ERR(tx->macro))
  1808			return PTR_ERR(tx->macro);
  1809	
  1810		tx->dcodec = devm_clk_get_optional(dev, "dcodec");
  1811		if (IS_ERR(tx->dcodec))
  1812			return PTR_ERR(tx->dcodec);
  1813	
  1814		tx->mclk = devm_clk_get(dev, "mclk");
  1815		if (IS_ERR(tx->mclk))
  1816			return PTR_ERR(tx->mclk);
  1817	
  1818		tx->npl = devm_clk_get(dev, "npl");
  1819		if (IS_ERR(tx->npl))
  1820			return PTR_ERR(tx->npl);
  1821	
  1822		tx->fsgen = devm_clk_get(dev, "fsgen");
  1823		if (IS_ERR(tx->fsgen))
  1824			return PTR_ERR(tx->fsgen);
  1825	
  1826		tx->pds = lpass_macro_pds_init(dev);
  1827		if (!tx->pds) {
  1828			dev_err(dev, "Enabling power domains failed in %s\n", __func__);
> 1829			return ret;
  1830		}
  1831		base = devm_platform_ioremap_resource(pdev, 0);
  1832		if (IS_ERR(base))
  1833			return PTR_ERR(base);
  1834	
  1835		/* Update defaults for lpass sc7280 */
  1836		if (of_device_is_compatible(np, "qcom,sc7280-lpass-tx-macro")) {
  1837			for (reg = 0; reg < ARRAY_SIZE(tx_defaults); reg++) {
  1838				switch (tx_defaults[reg].reg) {
  1839				case CDC_TX_TOP_CSR_SWR_AMIC0_CTL:
  1840				case CDC_TX_TOP_CSR_SWR_AMIC1_CTL:
  1841					tx_defaults[reg].def = 0x0E;
  1842					break;
  1843				default:
  1844					break;
  1845				}
  1846			}
  1847		}
  1848	
  1849		tx->regmap = devm_regmap_init_mmio(dev, base, &tx_regmap_config);
  1850		if (IS_ERR(tx->regmap))
  1851			return PTR_ERR(tx->regmap);
  1852	
  1853		dev_set_drvdata(dev, tx);
  1854	
  1855		tx->reset_swr = true;
  1856		tx->dev = dev;
  1857	
  1858		/* set MCLK and NPL rates */
  1859		clk_set_rate(tx->mclk, MCLK_FREQ);
  1860		clk_set_rate(tx->npl, 2 * MCLK_FREQ);
  1861	
  1862		ret = clk_prepare_enable(tx->macro);
  1863		if (ret)
  1864			goto err;
  1865	
  1866		ret = clk_prepare_enable(tx->dcodec);
  1867		if (ret)
  1868			goto err_dcodec;
  1869	
  1870		ret = clk_prepare_enable(tx->mclk);
  1871		if (ret)
  1872			goto err_mclk;
  1873	
  1874		ret = clk_prepare_enable(tx->npl);
  1875		if (ret)
  1876			goto err_npl;
  1877	
  1878		ret = clk_prepare_enable(tx->fsgen);
  1879		if (ret)
  1880			goto err_fsgen;
  1881	
  1882		ret = tx_macro_register_mclk_output(tx);
  1883		if (ret)
  1884			goto err_clkout;
  1885	
  1886		ret = devm_snd_soc_register_component(dev, &tx_macro_component_drv,
  1887						      tx_macro_dai,
  1888						      ARRAY_SIZE(tx_macro_dai));
  1889		if (ret)
  1890			goto err_clkout;
  1891	
  1892		pm_runtime_set_autosuspend_delay(dev, 3000);
  1893		pm_runtime_use_autosuspend(dev);
  1894		pm_runtime_mark_last_busy(dev);
  1895		pm_runtime_set_active(dev);
  1896		pm_runtime_enable(dev);
  1897	
  1898		return 0;
  1899	
  1900	err_clkout:
  1901		clk_disable_unprepare(tx->fsgen);
  1902	err_fsgen:
  1903		clk_disable_unprepare(tx->npl);
  1904	err_npl:
  1905		clk_disable_unprepare(tx->mclk);
  1906	err_mclk:
  1907		clk_disable_unprepare(tx->dcodec);
  1908	err_dcodec:
  1909		clk_disable_unprepare(tx->macro);
  1910	err:
  1911		return ret;
  1912	}
  1913	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
