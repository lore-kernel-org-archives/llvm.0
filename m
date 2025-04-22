Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5175285411;
	Tue, 22 Apr 2025 14:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745331939; cv=none; b=EgP7dgaLsoLgkUg91/L4ffpwjlwtfs1c+FYMSVZVOex6uwLPV6g+fdtUP5JaSegTFfA3MGwsWbwGPtngZ6dQUy6K28UjTgjd0Nsj6P7UpF9T0yxLpEEipJF+/llSRwHmCmcAyvuw0/mmm8R1vFtegD+vdv5dEG3aRDeSXlqbvfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745331939; c=relaxed/simple;
	bh=5+98LgxChDT88V8KJUzeA2Yqn6huPZ14hqqDQn3CoZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lSDoGh0BTKSlYCEtz4L5EWRZzFR35SIiYp+4nA+04FMVA4OXqVeYtvveCMyYenwwFsFvu3+DNq/U35wZmLFu9DMeMUvTa1sDxwTmY/VZOuIPlbt8Juz3n+2dOPc2ICqjYuVEQG/oitc1RkTFVCRzpYU+1MHTLjBILngnkrZyxNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nMooPhxB; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nMooPhxB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745331938; x=1776867938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5+98LgxChDT88V8KJUzeA2Yqn6huPZ14hqqDQn3CoZg=;
  b=nMooPhxBS2x7oSmifn6fuhWh7hrPaCfStYkqCGE/Kle6t1pGs4Pk5OJK
   o/F4vmRHyiu/1CHZd7/7tszpzJSts9ELjAToCEL8loAJ+AKLT3h8IPWbI
   hZTELfLnaHcyJRgq4sZgDKZdkEtqBHp+ieHELhkELr2aCXiHQoZDxT3SJ
   hPBlkCiqAFjXxEVdZUEuBOj76Uw/wx71Cc4jTWSJ0xXEmFdVdEBk4/fFX
   Eep6tbFdZGf6+K0uKO693g4XWKhnjGSijjP7413HW6n8jFDnztUVhDi2L
   HcFPdrZO719OWD5X+L4YZHA2Bg1enKBqHz+L4ou+v98RKavTZEFGeHUok
   w==;
X-CSE-ConnectionGUID: 2g03uP/VSV+J9E8KjL1iFA==
X-CSE-MsgGUID: BWTQla4AT52gA7OwizBQUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46130609"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="46130609"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 07:25:36 -0700
X-CSE-ConnectionGUID: H67Yel7CSlyMqceumUosGw==
X-CSE-MsgGUID: QgnpvWHdT6mFjQ0t9EFqag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="132573160"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Apr 2025 07:25:35 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7EZ3-00014Z-0i;
	Tue, 22 Apr 2025 14:25:33 +0000
Date: Tue, 22 Apr 2025 22:25:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-04-22 92/103] sound/soc/soc-dapm.c:897:
 warning: expecting prototype for snd_soc_dapm_kcontrol_dapm(). Prototype was
 for snd_soc_dapm_kcontrol_to_dapm() instead
Message-ID: <202504222229.t3Qe9phM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2025-04-22
head:   f743db58ae26ad957c2beb5f627c328ec8473d30
commit: b876d1c5b4704fc450a909ae291311320b46b732 [92/103] ASoC: soc-dapm: rename snd_soc_dapm_kcontrol_dapm() to snd_soc_dapm_kcontrol_to_dapm()
config: i386-buildonly-randconfig-002-20250422 (https://download.01.org/0day-ci/archive/20250422/202504222229.t3Qe9phM-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250422/202504222229.t3Qe9phM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504222229.t3Qe9phM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/soc-dapm.c:897: warning: expecting prototype for snd_soc_dapm_kcontrol_dapm(). Prototype was for snd_soc_dapm_kcontrol_to_dapm() instead
   sound/soc/soc-dapm.c:980: warning: Function parameter or struct member 'dapm' not described in 'snd_soc_dapm_init_bias_level'
   sound/soc/soc-dapm.c:980: warning: Excess function parameter 'component' description in 'snd_soc_dapm_init_bias_level'


vim +897 sound/soc/soc-dapm.c

93e39a11520c000 Mythri P K         2015-10-20  886  
ce0fc93ae56e2ba Lars-Peter Clausen 2014-06-16  887  /**
ce0fc93ae56e2ba Lars-Peter Clausen 2014-06-16  888   * snd_soc_dapm_kcontrol_dapm() - Returns the dapm context associated to a
ce0fc93ae56e2ba Lars-Peter Clausen 2014-06-16  889   *  kcontrol
ce0fc93ae56e2ba Lars-Peter Clausen 2014-06-16  890   * @kcontrol: The kcontrol
ce0fc93ae56e2ba Lars-Peter Clausen 2014-06-16  891   *
ce0fc93ae56e2ba Lars-Peter Clausen 2014-06-16  892   * Note: This function must only be used on kcontrols that are known to have
ce0fc93ae56e2ba Lars-Peter Clausen 2014-06-16  893   * been registered for a CODEC. Otherwise the behaviour is undefined.
ce0fc93ae56e2ba Lars-Peter Clausen 2014-06-16  894   */
b876d1c5b4704fc Kuninori Morimoto  2025-04-22  895  struct snd_soc_dapm_context *snd_soc_dapm_kcontrol_to_dapm(
ce0fc93ae56e2ba Lars-Peter Clausen 2014-06-16  896  	struct snd_kcontrol *kcontrol)
ce0fc93ae56e2ba Lars-Peter Clausen 2014-06-16 @897  {
ce0fc93ae56e2ba Lars-Peter Clausen 2014-06-16  898  	return dapm_kcontrol_get_wlist(kcontrol)->widgets[0]->dapm;
ce0fc93ae56e2ba Lars-Peter Clausen 2014-06-16  899  }
b876d1c5b4704fc Kuninori Morimoto  2025-04-22  900  EXPORT_SYMBOL_GPL(snd_soc_dapm_kcontrol_to_dapm);
ce0fc93ae56e2ba Lars-Peter Clausen 2014-06-16  901  

:::::: The code at line 897 was first introduced by commit
:::::: ce0fc93ae56e2ba50ff8c220d69e4e860e889320 ASoC: Add DAPM support at the component level

:::::: TO: Lars-Peter Clausen <lars@metafoo.de>
:::::: CC: Mark Brown <broonie@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
