Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D58263F2E;
	Tue, 11 Mar 2025 19:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741722957; cv=none; b=NIEMyVBH6K2uuzXDD2oqXUMHG6WIEG9/S/R1p1LjT9wBf7SKz7VybW6IZHAVZNTSCmcGyFl+e4aEHPSGk4HrYB9G8KeNrTaDR1EsBnf9GaasOSdy7tUtjfcNohTKmwmhcaiEwDbNJU3wWAgcaXM7PjbwlkGMcsPjduKlZsN0P80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741722957; c=relaxed/simple;
	bh=i9Dch3q9CNWiq4otuP/MCKM1qlYUAIJnGOpM9u0PwA0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NfxoXDsJXeJcQmEi7HpXBUYemt1G3ojSyY8lrShSnJmYYFhz2+ml9H5zACeqdmNXZi1KgVFaCMTkR+kxHhpq/slPaLOEmWzkvEJuRxZqbwsNFxrtTi8UKbv5asS1n9bAIFNoWWEv/XziaNi9ox2Feu4+/hVpCO1MEgto0fMg4mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XYVYFiPu; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XYVYFiPu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741722953; x=1773258953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i9Dch3q9CNWiq4otuP/MCKM1qlYUAIJnGOpM9u0PwA0=;
  b=XYVYFiPu3+GpPQs1i/XgzvJ5Gby6XGWahtZeq3aymXJ5+qs/Lw92xGdr
   HtRdz8zX2Ha9LbNVtVYd/cj1CuSk/+zw3lA2Y2GofpCKEbwU+mPS3xB1N
   EEWLEMii36pNaLLlii2fCoxaMOG3mlxtODQKw8WEU/EcHh5ECN1OYPR3K
   mOEnmZ1sdn64mCQu/fpvWhZxUXQGfplXZIsi3hOXDhmY2X8q4YKdYPFQn
   WFhUDa/hHho+ibfez2oiMKSazw7SLdqbVQcqCAIuYKKpMHInerM/3VTuR
   w4lW1bYZmW3k1GrU6wALduOIHrzkhsiGR31BsBipzAdVS4XemVty77N70
   g==;
X-CSE-ConnectionGUID: U2thNYbjR2GVZCHKC4grjQ==
X-CSE-MsgGUID: 6cc0M25mQlaW5lsgj7qBUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="52987804"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="52987804"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 12:55:50 -0700
X-CSE-ConnectionGUID: cmnnOJBgT7C/VEOaPOKSAQ==
X-CSE-MsgGUID: ey143gVJRdWihAQPfklbuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="125040132"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 11 Mar 2025 12:55:49 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ts5ha-0007nS-2R;
	Tue, 11 Mar 2025 19:55:46 +0000
Date: Wed, 12 Mar 2025 03:55:34 +0800
From: kernel test robot <lkp@intel.com>
To: Naveen Manohar <naveen.m@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <liam.r.girdwood@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [broonie-ci:file9lz3qR 69/69]
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c:583:18: error: 'struct
 snd_soc_acpi_mach' has no member named 'get_function_tplg_files'
Message-ID: <202503120331.6lpwacmu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git file9lz3qR
head:   db57ed1d27f9626ed0c8bb636fad6e9d767dcd4b
commit: db57ed1d27f9626ed0c8bb636fad6e9d767dcd4b [69/69] ASoC: Intel: soc-acpi-intel-ptl-match: Add cs42l43 support
config: arc-randconfig-002-20250312 (https://download.01.org/0day-ci/archive/20250312/202503120331.6lpwacmu-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503120331.6lpwacmu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503120331.6lpwacmu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/intel/common/soc-acpi-intel-ptl-match.c:583:18: error: 'struct snd_soc_acpi_mach' has no member named 'get_function_tplg_files'
     583 |                 .get_function_tplg_files = sof_sdw_get_tplg_files,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/intel/common/soc-acpi-intel-ptl-match.c:583:44: error: 'sof_sdw_get_tplg_files' undeclared here (not in a function)
     583 |                 .get_function_tplg_files = sof_sdw_get_tplg_files,
         |                                            ^~~~~~~~~~~~~~~~~~~~~~


vim +583 sound/soc/intel/common/soc-acpi-intel-ptl-match.c

   538	
   539	/* this table is used when there is no I2S codec present */
   540	struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
   541		/* mockup tests need to be first */
   542		{
   543			.link_mask = GENMASK(3, 0),
   544			.links = sdw_mockup_headset_2amps_mic,
   545			.drv_name = "sof_sdw",
   546			.sof_tplg_filename = "sof-ptl-rt711-rt1308-rt715.tplg",
   547		},
   548		{
   549			.link_mask = BIT(0) | BIT(1) | BIT(3),
   550			.links = sdw_mockup_headset_1amp_mic,
   551			.drv_name = "sof_sdw",
   552			.sof_tplg_filename = "sof-ptl-rt711-rt1308-mono-rt715.tplg",
   553		},
   554		{
   555			.link_mask = GENMASK(2, 0),
   556			.links = sdw_mockup_mic_headset_1amp,
   557			.drv_name = "sof_sdw",
   558			.sof_tplg_filename = "sof-ptl-rt715-rt711-rt1308-mono.tplg",
   559		},
   560		{
   561			.link_mask = BIT(1) | BIT(2) | BIT(3),
   562			.links = ptl_cs42l43_l2_cs35l56x6_l13,
   563			.drv_name = "sof_sdw",
   564			.sof_tplg_filename = "sof-ptl-cs42l43-l2-cs35l56x6-l13.tplg",
   565		},
   566		{
   567			.link_mask = BIT(0),
   568			.links = sdw_mockup_multi_func,
   569			.drv_name = "sof_sdw",
   570			.sof_tplg_filename = "sof-ptl-rt722.tplg", /* Reuse the existing tplg file */
   571		},
   572		{
   573			.link_mask = BIT(0),
   574			.links = ptl_rvp,
   575			.drv_name = "sof_sdw",
   576			.sof_tplg_filename = "sof-ptl-rt711.tplg",
   577		},
   578		{
   579			.link_mask = BIT(3),
   580			.links = ptl_cs42l43_l3,
   581			.drv_name = "sof_sdw",
   582			.sof_tplg_filename = "sof-ptl-cs42l43-l3.tplg",
 > 583			.get_function_tplg_files = sof_sdw_get_tplg_files,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
