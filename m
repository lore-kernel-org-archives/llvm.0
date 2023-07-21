Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE5327F1D;
	Fri, 21 Jul 2023 18:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689965342; x=1721501342;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5VTBjYmsvAP9jAPIOEMyPB4xHrxsup3rEwasdGr3Ag8=;
  b=hPZKWDbIE9DG3ai3c/AOIbURI8oaWQjCECF+ho2O+WgjBSWZXspvRvVg
   gpDhzRWdXWNrSjmMgLzSG5ixt96uOhOvEKbdzvgKSWRLFxDCfsM78a7Kv
   OthZendcLwHvT9+4Xw0XLasNTkKhM/4YdChkKL4U5afccBzAEFVGEa6HE
   WAWd1kVyaJvRsNDViHxysBfY2QeAIpYZU7W1Do2c+gcMTcv6V0vu6R77U
   xiR/QQB0SP02UMd1sEIhpL+yNsGEP87MqzhOE7HxLCoBb90MkNE7S0OXh
   1nzrt3ZPt+KPy5eEjqtdyo6Qk3lJdoW34F4xKqGjc/c+CJZqKoU74plxa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="367128002"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="367128002"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 11:49:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="868329284"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 21 Jul 2023 11:49:00 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMvBS-0007XZ-0R;
	Fri, 21 Jul 2023 18:48:58 +0000
Date: Sat, 22 Jul 2023 02:47:58 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RESEND v2 6/7] regulator: mt6358: Add output voltage fine
 tuning to variable LDOs
Message-ID: <202307220209.G9QKqubM-lkp@intel.com>
References: <20230721082903.2038975-7-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230721082903.2038975-7-wenst@chromium.org>

Hi Chen-Yu,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-regulator/for-next]
[also build test ERROR on lee-mfd/for-mfd-next lee-leds/for-leds-next linus/master v6.5-rc2 next-20230721]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/mfd-mt6358-Add-missing-registers-for-LDO-voltage-calibration/20230721-163236
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20230721082903.2038975-7-wenst%40chromium.org
patch subject: [PATCH RESEND v2 6/7] regulator: mt6358: Add output voltage fine tuning to variable LDOs
config: i386-randconfig-r013-20230720 (https://download.01.org/0day-ci/archive/20230722/202307220209.G9QKqubM-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307220209.G9QKqubM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307220209.G9QKqubM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/regulator/mt6358-regulator.c:492:2: error: field designator 'linear_range_selectors_bitfield' does not refer to any field in type 'struct regulator_desc'; did you mean 'linear_range_selectors'?
           MT6358_LDO("ldo_vdram2", VDRAM2, vdram2,
           ^
   drivers/regulator/mt6358-regulator.c:76:4: note: expanded from macro 'MT6358_LDO'
                   .linear_range_selectors_bitfield = volt_ranges##_selectors,     \
                    ^
   include/linux/regulator/driver.h:387:22: note: 'linear_range_selectors' declared here
           const unsigned int *linear_range_selectors;
                               ^
   drivers/regulator/mt6358-regulator.c:494:2: error: field designator 'linear_range_selectors_bitfield' does not refer to any field in type 'struct regulator_desc'; did you mean 'linear_range_selectors'?
           MT6358_LDO("ldo_vsim1", VSIM1, vsim,
           ^
   drivers/regulator/mt6358-regulator.c:76:4: note: expanded from macro 'MT6358_LDO'
                   .linear_range_selectors_bitfield = volt_ranges##_selectors,     \
                    ^
   include/linux/regulator/driver.h:387:22: note: 'linear_range_selectors' declared here
           const unsigned int *linear_range_selectors;
                               ^
   drivers/regulator/mt6358-regulator.c:496:2: error: field designator 'linear_range_selectors_bitfield' does not refer to any field in type 'struct regulator_desc'; did you mean 'linear_range_selectors'?
           MT6358_LDO("ldo_vibr", VIBR, vibr,
           ^
   drivers/regulator/mt6358-regulator.c:76:4: note: expanded from macro 'MT6358_LDO'
                   .linear_range_selectors_bitfield = volt_ranges##_selectors,     \
                    ^
   include/linux/regulator/driver.h:387:22: note: 'linear_range_selectors' declared here
           const unsigned int *linear_range_selectors;
                               ^
   drivers/regulator/mt6358-regulator.c:498:2: error: field designator 'linear_range_selectors_bitfield' does not refer to any field in type 'struct regulator_desc'; did you mean 'linear_range_selectors'?
           MT6358_LDO("ldo_vusb", VUSB, vusb,
           ^
   drivers/regulator/mt6358-regulator.c:76:4: note: expanded from macro 'MT6358_LDO'
                   .linear_range_selectors_bitfield = volt_ranges##_selectors,     \
                    ^
   include/linux/regulator/driver.h:387:22: note: 'linear_range_selectors' declared here
           const unsigned int *linear_range_selectors;
                               ^
   drivers/regulator/mt6358-regulator.c:500:2: error: field designator 'linear_range_selectors_bitfield' does not refer to any field in type 'struct regulator_desc'; did you mean 'linear_range_selectors'?
           MT6358_LDO("ldo_vcamd", VCAMD, vcamd,
           ^
   drivers/regulator/mt6358-regulator.c:76:4: note: expanded from macro 'MT6358_LDO'
                   .linear_range_selectors_bitfield = volt_ranges##_selectors,     \
                    ^
   include/linux/regulator/driver.h:387:22: note: 'linear_range_selectors' declared here
           const unsigned int *linear_range_selectors;
                               ^
   drivers/regulator/mt6358-regulator.c:502:2: error: field designator 'linear_range_selectors_bitfield' does not refer to any field in type 'struct regulator_desc'; did you mean 'linear_range_selectors'?
           MT6358_LDO("ldo_vefuse", VEFUSE, vefuse,
           ^
   drivers/regulator/mt6358-regulator.c:76:4: note: expanded from macro 'MT6358_LDO'
                   .linear_range_selectors_bitfield = volt_ranges##_selectors,     \
                    ^
   include/linux/regulator/driver.h:387:22: note: 'linear_range_selectors' declared here
           const unsigned int *linear_range_selectors;
                               ^
   drivers/regulator/mt6358-regulator.c:504:2: error: field designator 'linear_range_selectors_bitfield' does not refer to any field in type 'struct regulator_desc'; did you mean 'linear_range_selectors'?
           MT6358_LDO("ldo_vmch", VMCH, vmch_vemc,
           ^
   drivers/regulator/mt6358-regulator.c:76:4: note: expanded from macro 'MT6358_LDO'
                   .linear_range_selectors_bitfield = volt_ranges##_selectors,     \
                    ^
   include/linux/regulator/driver.h:387:22: note: 'linear_range_selectors' declared here
           const unsigned int *linear_range_selectors;
                               ^
   drivers/regulator/mt6358-regulator.c:506:2: error: field designator 'linear_range_selectors_bitfield' does not refer to any field in type 'struct regulator_desc'; did you mean 'linear_range_selectors'?
           MT6358_LDO("ldo_vcama1", VCAMA1, vcama,
           ^
   drivers/regulator/mt6358-regulator.c:76:4: note: expanded from macro 'MT6358_LDO'
                   .linear_range_selectors_bitfield = volt_ranges##_selectors,     \
                    ^
   include/linux/regulator/driver.h:387:22: note: 'linear_range_selectors' declared here
           const unsigned int *linear_range_selectors;
                               ^
   drivers/regulator/mt6358-regulator.c:508:2: error: field designator 'linear_range_selectors_bitfield' does not refer to any field in type 'struct regulator_desc'; did you mean 'linear_range_selectors'?
           MT6358_LDO("ldo_vemc", VEMC, vmch_vemc,
           ^
   drivers/regulator/mt6358-regulator.c:76:4: note: expanded from macro 'MT6358_LDO'
                   .linear_range_selectors_bitfield = volt_ranges##_selectors,     \
                    ^
   include/linux/regulator/driver.h:387:22: note: 'linear_range_selectors' declared here
           const unsigned int *linear_range_selectors;
                               ^
   drivers/regulator/mt6358-regulator.c:510:2: error: field designator 'linear_range_selectors_bitfield' does not refer to any field in type 'struct regulator_desc'; did you mean 'linear_range_selectors'?
           MT6358_LDO("ldo_vcn33", VCN33, vcn33,
           ^
   drivers/regulator/mt6358-regulator.c:76:4: note: expanded from macro 'MT6358_LDO'
                   .linear_range_selectors_bitfield = volt_ranges##_selectors,     \
                    ^
   include/linux/regulator/driver.h:387:22: note: 'linear_range_selectors' declared here
           const unsigned int *linear_range_selectors;
                               ^
   drivers/regulator/mt6358-regulator.c:512:2: error: field designator 'linear_range_selectors_bitfield' does not refer to any field in type 'struct regulator_desc'; did you mean 'linear_range_selectors'?
           MT6358_LDO("ldo_vcama2", VCAMA2, vcama,
           ^
   drivers/regulator/mt6358-regulator.c:76:4: note: expanded from macro 'MT6358_LDO'
                   .linear_range_selectors_bitfield = volt_ranges##_selectors,     \
                    ^
   include/linux/regulator/driver.h:387:22: note: 'linear_range_selectors' declared here
           const unsigned int *linear_range_selectors;
                               ^
   drivers/regulator/mt6358-regulator.c:514:2: error: field designator 'linear_range_selectors_bitfield' does not refer to any field in type 'struct regulator_desc'; did you mean 'linear_range_selectors'?
           MT6358_LDO("ldo_vmc", VMC, vmc,


vim +492 drivers/regulator/mt6358-regulator.c

   452	
   453	/* The array is indexed by id(MT6358_ID_XXX) */
   454	static const struct mt6358_regulator_info mt6358_regulators[] = {
   455		MT6358_BUCK("buck_vdram1", VDRAM1, 500000, 2087500, 12500,
   456			    0x7f, MT6358_BUCK_VDRAM1_DBG0, 0x7f, MT6358_VDRAM1_ANA_CON0, 8),
   457		MT6358_BUCK("buck_vcore", VCORE, 500000, 1293750, 6250,
   458			    0x7f, MT6358_BUCK_VCORE_DBG0, 0x7f, MT6358_VCORE_VGPU_ANA_CON0, 1),
   459		MT6358_BUCK("buck_vpa", VPA, 500000, 3650000, 50000,
   460			    0x3f, MT6358_BUCK_VPA_DBG0, 0x3f, MT6358_VPA_ANA_CON0, 3),
   461		MT6358_BUCK("buck_vproc11", VPROC11, 500000, 1293750, 6250,
   462			    0x7f, MT6358_BUCK_VPROC11_DBG0, 0x7f, MT6358_VPROC_ANA_CON0, 1),
   463		MT6358_BUCK("buck_vproc12", VPROC12, 500000, 1293750, 6250,
   464			    0x7f, MT6358_BUCK_VPROC12_DBG0, 0x7f, MT6358_VPROC_ANA_CON0, 2),
   465		MT6358_BUCK("buck_vgpu", VGPU, 500000, 1293750, 6250,
   466			    0x7f, MT6358_BUCK_VGPU_ELR0, 0x7f, MT6358_VCORE_VGPU_ANA_CON0, 2),
   467		MT6358_BUCK("buck_vs2", VS2, 500000, 2087500, 12500,
   468			    0x7f, MT6358_BUCK_VS2_DBG0, 0x7f, MT6358_VS2_ANA_CON0, 8),
   469		MT6358_BUCK("buck_vmodem", VMODEM, 500000, 1293750, 6250,
   470			    0x7f, MT6358_BUCK_VMODEM_DBG0, 0x7f, MT6358_VMODEM_ANA_CON0, 8),
   471		MT6358_BUCK("buck_vs1", VS1, 1000000, 2587500, 12500,
   472			    0x7f, MT6358_BUCK_VS1_DBG0, 0x7f, MT6358_VS1_ANA_CON0, 8),
   473		MT6358_REG_FIXED("ldo_vrf12", VRF12,
   474				 MT6358_LDO_VRF12_CON0, 0, 1200000),
   475		MT6358_REG_FIXED("ldo_vio18", VIO18,
   476				 MT6358_LDO_VIO18_CON0, 0, 1800000),
   477		MT6358_REG_FIXED("ldo_vcamio", VCAMIO,
   478				 MT6358_LDO_VCAMIO_CON0, 0, 1800000),
   479		MT6358_REG_FIXED("ldo_vcn18", VCN18, MT6358_LDO_VCN18_CON0, 0, 1800000),
   480		MT6358_REG_FIXED("ldo_vfe28", VFE28, MT6358_LDO_VFE28_CON0, 0, 2800000),
   481		MT6358_REG_FIXED("ldo_vcn28", VCN28, MT6358_LDO_VCN28_CON0, 0, 2800000),
   482		MT6358_REG_FIXED("ldo_vxo22", VXO22, MT6358_LDO_VXO22_CON0, 0, 2200000),
   483		MT6358_REG_FIXED("ldo_vaux18", VAUX18,
   484				 MT6358_LDO_VAUX18_CON0, 0, 1800000),
   485		MT6358_REG_FIXED("ldo_vbif28", VBIF28,
   486				 MT6358_LDO_VBIF28_CON0, 0, 2800000),
   487		MT6358_REG_FIXED("ldo_vio28", VIO28, MT6358_LDO_VIO28_CON0, 0, 2800000),
   488		MT6358_REG_FIXED("ldo_va12", VA12, MT6358_LDO_VA12_CON0, 0, 1200000),
   489		MT6358_REG_FIXED("ldo_vrf18", VRF18, MT6358_LDO_VRF18_CON0, 0, 1800000),
   490		MT6358_REG_FIXED("ldo_vaud28", VAUD28,
   491				 MT6358_LDO_VAUD28_CON0, 0, 2800000),
 > 492		MT6358_LDO("ldo_vdram2", VDRAM2, vdram2,
   493			   MT6358_LDO_VDRAM2_CON0, 0, MT6358_LDO_VDRAM2_ELR0, 0xf),
   494		MT6358_LDO("ldo_vsim1", VSIM1, vsim,
   495			   MT6358_LDO_VSIM1_CON0, 0, MT6358_VSIM1_ANA_CON0, 0xf00),
   496		MT6358_LDO("ldo_vibr", VIBR, vibr,
   497			   MT6358_LDO_VIBR_CON0, 0, MT6358_VIBR_ANA_CON0, 0xf00),
   498		MT6358_LDO("ldo_vusb", VUSB, vusb,
   499			   MT6358_LDO_VUSB_CON0_0, 0, MT6358_VUSB_ANA_CON0, 0x700),
   500		MT6358_LDO("ldo_vcamd", VCAMD, vcamd,
   501			   MT6358_LDO_VCAMD_CON0, 0, MT6358_VCAMD_ANA_CON0, 0xf00),
   502		MT6358_LDO("ldo_vefuse", VEFUSE, vefuse,
   503			   MT6358_LDO_VEFUSE_CON0, 0, MT6358_VEFUSE_ANA_CON0, 0xf00),
   504		MT6358_LDO("ldo_vmch", VMCH, vmch_vemc,
   505			   MT6358_LDO_VMCH_CON0, 0, MT6358_VMCH_ANA_CON0, 0x700),
   506		MT6358_LDO("ldo_vcama1", VCAMA1, vcama,
   507			   MT6358_LDO_VCAMA1_CON0, 0, MT6358_VCAMA1_ANA_CON0, 0xf00),
   508		MT6358_LDO("ldo_vemc", VEMC, vmch_vemc,
   509			   MT6358_LDO_VEMC_CON0, 0, MT6358_VEMC_ANA_CON0, 0x700),
   510		MT6358_LDO("ldo_vcn33", VCN33, vcn33,
   511			   MT6358_LDO_VCN33_CON0_0, 0, MT6358_VCN33_ANA_CON0, 0x300),
   512		MT6358_LDO("ldo_vcama2", VCAMA2, vcama,
   513			   MT6358_LDO_VCAMA2_CON0, 0, MT6358_VCAMA2_ANA_CON0, 0xf00),
   514		MT6358_LDO("ldo_vmc", VMC, vmc,
   515			   MT6358_LDO_VMC_CON0, 0, MT6358_VMC_ANA_CON0, 0xf00),
   516		MT6358_LDO("ldo_vldo28", VLDO28, vldo28,
   517			   MT6358_LDO_VLDO28_CON0_0, 0,
   518			   MT6358_VLDO28_ANA_CON0, 0x300),
   519		MT6358_LDO("ldo_vsim2", VSIM2, vsim,
   520			   MT6358_LDO_VSIM2_CON0, 0, MT6358_VSIM2_ANA_CON0, 0xf00),
   521		MT6358_LDO1("ldo_vsram_proc11", VSRAM_PROC11, 500000, 1293750, 6250,
   522			    MT6358_LDO_VSRAM_PROC11_DBG0, 0x7f00, MT6358_LDO_VSRAM_CON0, 0x7f),
   523		MT6358_LDO1("ldo_vsram_others", VSRAM_OTHERS, 500000, 1293750, 6250,
   524			    MT6358_LDO_VSRAM_OTHERS_DBG0, 0x7f00, MT6358_LDO_VSRAM_CON2, 0x7f),
   525		MT6358_LDO1("ldo_vsram_gpu", VSRAM_GPU, 500000, 1293750, 6250,
   526			    MT6358_LDO_VSRAM_GPU_DBG0, 0x7f00, MT6358_LDO_VSRAM_CON3, 0x7f),
   527		MT6358_LDO1("ldo_vsram_proc12", VSRAM_PROC12, 500000, 1293750, 6250,
   528			    MT6358_LDO_VSRAM_PROC12_DBG0, 0x7f00, MT6358_LDO_VSRAM_CON1, 0x7f),
   529	};
   530	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
