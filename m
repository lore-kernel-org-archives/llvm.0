Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056E79472;
	Tue, 22 Aug 2023 11:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692702906; x=1724238906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i75HhlflSSi41MyaHt4baASVCVCa+LKBNgLm73EWvHk=;
  b=IR02bbVCYxLfO2Vf9OWVbifW6g1qbYrbVGnjcRsLnmqWQZx9W9Bhkt0f
   0qTTXCGlL+5o1/xUDnGbAXSKofZBSxi6sJskPduV3vovSYHFn4/ZaDm48
   59E7ijAMOHxTxvD1+zsUgM69trtSTDHUHq3sBsKyaGhhPnM8iRh2LIk0t
   4hQBV3aBq5bOkJBP9Q/jv8WrYp1fFu3Gh4HdQsOwrWgzqEg2l9w7j4pdf
   NyW2vRuTwaCOYIJF96ZqGGbLqSOjxSKRSIyDqgUd8xG+4/G8xo7GCzGvW
   9KRriYxb6tsY+cc3sAh7YC+rauzwLlEamX1EdQZ2V1G/ydNO7n49FXy3Z
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="377608496"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="377608496"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 04:15:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="765708401"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="765708401"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 22 Aug 2023 04:15:02 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYPLg-00008y-2n;
	Tue, 22 Aug 2023 11:15:01 +0000
Date: Tue, 22 Aug 2023 19:14:29 +0800
From: kernel test robot <lkp@intel.com>
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:file0yZ50U 278/279]
 sound/soc/intel/common/soc-acpi-intel-rpl-match.c:369:41: error:
 redefinition of 'rpl_nau8318_amp'
Message-ID: <202308221955.FkglAuTF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git file0yZ50U
head:   1465811cf7b52be6e4468f9acd678a0b05e2bd4a
commit: 6b8b6892e43419f5339c47d307b1baac0eea036d [278/279] ASoC: Intel: Add rpl_nau8318_8825 driver
config: i386-randconfig-r022-20230822 (https://download.01.org/0day-ci/archive/20230822/202308221955.FkglAuTF-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308221955.FkglAuTF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308221955.FkglAuTF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/intel/common/soc-acpi-intel-rpl-match.c:369:41: error: redefinition of 'rpl_nau8318_amp'
   static const struct snd_soc_acpi_codecs rpl_nau8318_amp = {
                                           ^
   sound/soc/intel/common/soc-acpi-intel-rpl-match.c:359:41: note: previous definition is here
   static const struct snd_soc_acpi_codecs rpl_nau8318_amp = {
                                           ^
>> sound/soc/intel/common/soc-acpi-intel-rpl-match.c:432:19: error: redeclaration of 'snd_soc_acpi_intel_rpl_machines' with a different type: 'typeof (snd_soc_acpi_intel_rpl_machines)' vs 'struct snd_soc_acpi_mach[]'
   EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_rpl_machines);
                     ^
   sound/soc/intel/common/soc-acpi-intel-rpl-match.c:374:26: note: previous definition is here
   struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
                            ^
   2 errors generated.


vim +/rpl_nau8318_amp +369 sound/soc/intel/common/soc-acpi-intel-rpl-match.c

   368	
 > 369	static const struct snd_soc_acpi_codecs rpl_nau8318_amp = {
   370		.num_codecs = 1,
   371		.codecs = {"NVTN2012"}
   372	};
   373	
   374	struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
   375		{
   376			.comp_ids = &rpl_rt5682_hp,
   377			.drv_name = "rpl_mx98357_rt5682",
   378			.machine_quirk = snd_soc_acpi_codec_list,
   379			.quirk_data = &rpl_max98357a_amp,
   380			.sof_tplg_filename = "sof-rpl-max98357a-rt5682.tplg",
   381		},
   382		{
   383			.comp_ids = &rpl_rt5682_hp,
   384			.drv_name = "rpl_mx98360_rt5682",
   385			.machine_quirk = snd_soc_acpi_codec_list,
   386			.quirk_data = &rpl_max98360a_amp,
   387			.sof_tplg_filename = "sof-rpl-max98360a-rt5682.tplg",
   388		},
   389		{
   390			.id = "10508825",
   391			.drv_name = "rpl_max98373_8825",
   392			.machine_quirk = snd_soc_acpi_codec_list,
   393			.quirk_data = &rpl_max98373_amp,
   394			.sof_tplg_filename = "sof-rpl-max98373-nau8825.tplg",
   395		},
   396		{
   397			.id = "10508825",
   398			.drv_name = "rpl_nau8318_8825",
   399			.machine_quirk = snd_soc_acpi_codec_list,
   400			.quirk_data = &rpl_nau8318_amp,
   401			.sof_tplg_filename = "sof-rpl-nau8318-nau8825.tplg",
   402		},
   403		{
   404			.comp_ids = &rpl_rt5682_hp,
   405			.drv_name = "rpl_rt1019_rt5682",
   406			.machine_quirk = snd_soc_acpi_codec_list,
   407			.quirk_data = &rpl_rt1019p_amp,
   408			.sof_tplg_filename = "sof-rpl-rt1019-rt5682.tplg",
   409		},
   410		{
   411			.comp_ids = &rpl_essx_83x6,
   412			.drv_name = "rpl_es83x6_c1_h02",
   413			.machine_quirk = snd_soc_acpi_codec_list,
   414			.quirk_data = &rpl_lt6911_hdmi,
   415			.sof_tplg_filename = "sof-rpl-es83x6-ssp1-hdmi-ssp02.tplg",
   416		},
   417		{
   418			.comp_ids = &rpl_essx_83x6,
   419			.drv_name = "sof-essx8336",
   420			.sof_tplg_filename = "sof-rpl-es83x6", /* the tplg suffix is added at run time */
   421			.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_SSP_NUMBER |
   422						SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
   423						SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
   424		},
   425		{
   426			.id = "INTC10B0",
   427			.drv_name = "rpl_lt6911_hdmi_ssp",
   428			.sof_tplg_filename = "sof-rpl-nocodec-hdmi-ssp02.tplg"
   429		},
   430		{},
   431	};
 > 432	EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_rpl_machines);
   433	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
