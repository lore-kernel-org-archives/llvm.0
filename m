Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187101875;
	Sun, 19 Nov 2023 14:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QgcrC2Rb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700405343; x=1731941343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H3mrNzAKMk1qz9qnxzz0h7Pdmnwxz91BHjCVL2y0sBc=;
  b=QgcrC2RbBdwVB1T72tJaMkPAYbmKrgrjDvJh+rSKa8y5QUB4wh4o9aZA
   fPBsvrRBQSUivRQjvR5O3wuxQTQwLXbY4SxEcUDatrXdvo8SXAU/t4wCp
   mKKMJ+Zo7TbU/bs7qFTE9dwi1f01+OqNg2Jw/GSfXRkEfvJexi6ZO8/4P
   1U5c99Hlg/1rWwdbpasodgQkpAKjgbVP8DKQ2OKBts4SgVJspuwhwVOnm
   yMgEG5NNXCBiHJSo3QzScPjjW5dkrIq2r9MjlQih/o80CSz8d9BA2iKFK
   LDY+EaAY9uJSSe2bWVZI2yBtttrhcQD7LMPQv4cfPJgu+CNjmEcJgbQJm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="4668370"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="4668370"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 06:49:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="1013376144"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="1013376144"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 19 Nov 2023 06:49:00 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4j6Y-0005D5-2b;
	Sun, 19 Nov 2023 14:48:58 +0000
Date: Sun, 19 Nov 2023 22:48:24 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/070-audio 63/100]
 sound/soc/apple/macaudio.c:1016:5: warning: no previous prototype for
 function 'macaudio_sss_info'
Message-ID: <202311192204.0A4cJo32-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   1c71b1fa2c491cc29c94d29f1a450dba39f27557
commit: 7cc2528565fefec88f55654e9b81e00b2e40130d [63/100] ASoC: macaudio: Add 'Speakers Up Indicator' control
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231119/202311192204.0A4cJo32-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231119/202311192204.0A4cJo32-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311192204.0A4cJo32-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/apple/macaudio.c:1016:5: warning: no previous prototype for function 'macaudio_sss_info' [-Wmissing-prototypes]
   int macaudio_sss_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo)
       ^
   sound/soc/apple/macaudio.c:1016:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int macaudio_sss_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo)
   ^
   static 
>> sound/soc/apple/macaudio.c:1026:5: warning: no previous prototype for function 'macaudio_sss_get' [-Wmissing-prototypes]
   int macaudio_sss_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
       ^
   sound/soc/apple/macaudio.c:1026:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int macaudio_sss_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
   ^
   static 
   2 warnings generated.


vim +/macaudio_sss_info +1016 sound/soc/apple/macaudio.c

  1015	
> 1016	int macaudio_sss_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo)
  1017	{
  1018		uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
  1019		uinfo->count = 1;
  1020		uinfo->value.integer.min = 0;
  1021		uinfo->value.integer.max = 1;
  1022	
  1023		return 0;
  1024	}
  1025	
> 1026	int macaudio_sss_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
  1027	{
  1028		struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
  1029		struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
  1030	
  1031		/*
  1032		 * TODO: Check if any locking is in order here. I would
  1033		 * assume there is some ALSA-level lock, but DAPM implementations
  1034		 * of kcontrol ops do explicit locking, so look into it.
  1035		 */
  1036		uvalue->value.integer.value[0] = ma->speakers_streaming;
  1037	
  1038		return 0;
  1039	}
  1040	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
