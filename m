Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01DC3A1E67;
	Sat, 20 Dec 2025 15:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766246245; cv=none; b=HbmgkT+UDt9V3LwX6o0YuXnKdyLThzb6Cb2uBUBDsu8XbgutM6pLlkimhcsrMQ9JxZPG1vnsSdMZpzUjuyp8Oar3UPZIluphkgD11vqeGGXGrK/KTqcvg+Ye+ZehKe8MX9vJXd5wsnFQdy/A+BW156OfKxxjfFt3+exQXe3w9dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766246245; c=relaxed/simple;
	bh=pdthMO3raZUKsso4hMhbUW4BWP/5KpRBApr7hWYNsLs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GJ11FH5ouQf641EwaSFcaxxigBDoZQSksKzxnM2XsQ8SSX/LFbvOnd7Uerw7eTuSTgWcG2gDoT4ydPqjyJSOkuJYZ1rKiSavOtRV/FfJg/RIHESzliDM0MRSWBDuG64NnD1njXkYr+X0CPS/4ccLbO4WEZoZ1TbSsHiHi6mUQno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TtcXDMFm; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TtcXDMFm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766246244; x=1797782244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pdthMO3raZUKsso4hMhbUW4BWP/5KpRBApr7hWYNsLs=;
  b=TtcXDMFmRn5G4PkYGOfVuAFQK7/AlxSTwA01kxPPpvFPHE9hhz+q+y9x
   7GQN2ITcPxcdRmPCquT1U6/c9I2eiQ3PKoNl949imYhkCyLYlwE4YMJoZ
   HknQKR2mt6To9U/VYqh6+lx9RTcjg9+yhcmld2Tvf43PdZisxImZzcffd
   GHGRJxcyt+39LMycxmgxpZQ/BnpXSd5lab1jJCIiUJYKDWrfTOn6olzWv
   jUHbBC8SMEvmRFtcQUV0k15D2Iv4ijfu6/tg1IrlQe/m4FQKXHiKRFHGx
   24WGWh0AQVKNrsbAxsBMtsRFbqJd5i2za+yHqq8mBDhqKnqsViJJwhcUc
   g==;
X-CSE-ConnectionGUID: LXdJ5MnCRkadwtu1fiQwvQ==
X-CSE-MsgGUID: x3UjA89HR1ObBmA0cKtOuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="72037336"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="72037336"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 07:57:22 -0800
X-CSE-ConnectionGUID: w0HvEiUCRJi7M0cOKagOYg==
X-CSE-MsgGUID: /iw0VKOUT5++AKt6Mot8Yw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Dec 2025 07:57:21 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWzKY-000000004o9-3znF;
	Sat, 20 Dec 2025 15:57:18 +0000
Date: Sat, 20 Dec 2025 23:57:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-12-16 13/18]
 sound/soc/sti/uniperif_reader.c:422:30: error: use of undeclared identifier
 'uni_selectable_formats'; did you mean 'ui_selectable_formats'?
Message-ID: <202512202313.UbJgzqFz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2025-12-16
head:   32531f002d5d3c578d98a699c3f79c082ea4296e
commit: 44a13cc7bec06a431483d34ac991314ce6656561 [13/18] hoge
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20251220/202512202313.UbJgzqFz-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202313.UbJgzqFz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202313.UbJgzqFz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/sti/uniperif_reader.c:422:30: error: use of undeclared identifier 'uni_selectable_formats'; did you mean 'ui_selectable_formats'?
     422 |         .auto_selectable_formats        = &uni_selectable_formats,
         |                                            ^~~~~~~~~~~~~~~~~~~~~~
         |                                            ui_selectable_formats
   sound/soc/sti/uniperif_reader.c:404:18: note: 'ui_selectable_formats' declared here
     404 | static const u64 ui_selectable_formats =
         |                  ^
   1 error generated.


vim +422 sound/soc/sti/uniperif_reader.c

   399	
   400	/*
   401	 * Select below from Sound Card, not Auto
   402	 *	SND_SOC_DAIFMT_CBx_CFx
   403	 */
   404	static const u64 ui_selectable_formats =
   405		SND_SOC_POSSIBLE_DAIFMT_I2S	|
   406		SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
   407		SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
   408		SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
   409		SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
   410		SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
   411		SND_SOC_POSSIBLE_DAIFMT_IB_IF;
   412	
   413	static const struct snd_soc_dai_ops uni_reader_dai_ops = {
   414		.startup			= uni_reader_startup,
   415		.shutdown			= uni_reader_shutdown,
   416		.prepare			= uni_reader_prepare,
   417		.probe				= sti_uniperiph_dai_probe,
   418		.trigger			= uni_reader_trigger,
   419		.hw_params			= sti_uniperiph_dai_hw_params,
   420		.set_fmt			= sti_uniperiph_dai_set_fmt,
   421		.set_tdm_slot			= sti_uniperiph_set_tdm_slot,
 > 422		.auto_selectable_formats	= &uni_selectable_formats,
   423		.num_auto_selectable_formats	= 1,
   424	};
   425	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
