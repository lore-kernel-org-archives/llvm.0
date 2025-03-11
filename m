Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EAE2206B1;
	Tue, 11 Mar 2025 21:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741726862; cv=none; b=SpYC0zQdcoWmcmCovuKp2f1tuKwG+QlhiZO0cmPbx4b4F0gAwWrElmujMwzAMGdcsPCvalNv8EFOy+bWc0KyWFZz+wLjD+Zv9BNHSJ98eEWds0oAE5y9OQhMXPHXVfkwiakwhFYzB+Q7eNKanSNUFBbdkou6pHaIPGWHAUcRga8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741726862; c=relaxed/simple;
	bh=znkAz8ntmACVuE9/82iRPyH0yE/wH3vlDeb8zlnkWkg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MOojjN+xV41zWnCD3gPu7wSNAzLTBy5FQAHnptAt3oQtHgXIrS+Myk9vaJT/ETMe1Ifo26umTNvsg2cLp5X3nV5uqkVpxgNE3bgRclMwnqPg7gJ96d9bjXfEQWQJqQ0R/1UW+AVX+jaksnH1IkSFz8c7T9jKVfx2qqzWoaCF03U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iccD+v4j; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iccD+v4j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741726861; x=1773262861;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=znkAz8ntmACVuE9/82iRPyH0yE/wH3vlDeb8zlnkWkg=;
  b=iccD+v4j4oamv1ezFj1bj52DFN3Bm4xYnArbGzEv/o8U17X+le8YXEHH
   GUuK6Z21DTq00FvJg9xAK5iYjFTf7GwITTFw7KzErpw6/0f9voTRasOfk
   28m+Or3wwTl3WurWLyEAUocRfJXuZjhtcB6byiy4uql7KjyukmAI9oLKi
   XSbj6dZi+gIgUTEeJ1gzOpMV7KkSLNo0QwbyUcJUzB879l8vdslqXn5dk
   RyiqEQYDnsolPcJS9jMbRpUFAW1TGuJgGEoNagiVnQfLSZ7lxPXsAknrp
   nL8M90kdsDdxfHqEqqXhhFh5IaFbGz8tAi1kZ4mNY967m2mNpj303V31D
   Q==;
X-CSE-ConnectionGUID: AgUWJNiDSdeCCSSrUgVNUA==
X-CSE-MsgGUID: XOgI+Uy/QkuLYhRADQ13eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42504487"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="42504487"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 14:00:58 -0700
X-CSE-ConnectionGUID: mI1htfL2RQO0ZODCXikBnA==
X-CSE-MsgGUID: rpy7So0rQcWYn7Y5Y0frFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="120260320"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 11 Mar 2025 14:00:56 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ts6ic-0007qK-0M;
	Tue, 11 Mar 2025 21:00:54 +0000
Date: Wed, 12 Mar 2025 05:00:04 +0800
From: kernel test robot <lkp@intel.com>
To: Naveen Manohar <naveen.m@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <liam.r.girdwood@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [broonie-ci:file9lz3qR 69/69]
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c:583:30: error: use of
 undeclared identifier 'sof_sdw_get_tplg_files'
Message-ID: <202503120404.0S6QBuEe-lkp@intel.com>
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
config: i386-randconfig-013-20250312 (https://download.01.org/0day-ci/archive/20250312/202503120404.0S6QBuEe-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503120404.0S6QBuEe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503120404.0S6QBuEe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/intel/common/soc-acpi-intel-ptl-match.c:583:30: error: use of undeclared identifier 'sof_sdw_get_tplg_files'
     583 |                 .get_function_tplg_files = sof_sdw_get_tplg_files,
         |                                            ^
   1 error generated.


vim +/sof_sdw_get_tplg_files +583 sound/soc/intel/common/soc-acpi-intel-ptl-match.c

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
