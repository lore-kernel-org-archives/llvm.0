Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8283090D2;
	Thu,  4 Dec 2025 06:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764831538; cv=none; b=CI/xh8Wkr0KVXS5GeA21hiGfz9p+PsK8xxWVRnJOHKwbE3js1wfUHoyqLHaoa9HVXhrRbeC7FtI1pi7jvFVEVkP2ijX5zw70WxdBoqULUsiT8Xuwjd/Pmp+Obd8Zhzt/9zNdJ8hN8PYN41xKJlSQ4hfEkrHVMUIvlQjsyWUJjeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764831538; c=relaxed/simple;
	bh=CwkJdgz50qSuUgZU5wgKBfmfG4Q3PN/e8pN3Tb7C8is=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OCBnhJ1urBNUZBkuH+nrZL0DD6owGRHIHbTtngjHGACyGRabwxzkwAT5IJqm5az6swG46HFte0f+DUcO3Rvwfm3EjguuhoS3WhoPscq+28Ztt+tjS6CmDXTW4dEQgmIUIxDieHpskxi1+A8NFSeARb7Q8mm06EE7om9S9ewktSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TdYtOK7E; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TdYtOK7E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764831537; x=1796367537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CwkJdgz50qSuUgZU5wgKBfmfG4Q3PN/e8pN3Tb7C8is=;
  b=TdYtOK7EKgzBvCfUkhCuA5sRc40QZNaUdRhOzTXiYpJSJrkQy671iBgf
   qennxJOjOLwsQqiHLdRy1c++6e9ZF23F1aeJfYcs+vfqODGReKqro5j7u
   n37AAl1OCA63EynS6J2K6e0mEnWEXNPLp1rFBPA81OIqS6CYHbsGRN2EJ
   aXyvY0prNrliQDP5D/+q90Vgcagzy1i2WK+tihLoq6oAUUs6mbb9irW2/
   r3VZ76TJFco9yaXRxvxRoTpBoFbsDu18Ozgm8nMowryD0BhhaNnMJRv0p
   u5TFlD80vAGHLw4C31L+3wcMRztxvzsP140n13dK9FsiKycSf44MyCo5g
   A==;
X-CSE-ConnectionGUID: pruDVej8TdWS9GRk7I/gYQ==
X-CSE-MsgGUID: k/pkYzCmQ1e7QbMUMPD2WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="84442928"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="84442928"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 22:58:54 -0800
X-CSE-ConnectionGUID: gr/QgrVHQXyv/1SjRaCe2Q==
X-CSE-MsgGUID: OcEjOCZ7QiadSSXYA4AF2w==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Dec 2025 22:58:53 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vR3Ig-00000000DX5-3rho;
	Thu, 04 Dec 2025 06:58:50 +0000
Date: Thu, 4 Dec 2025 14:58:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-12-03 15/16]
 sound/soc/img/img-i2s-in.c:388:31: error: expected ';' at end of declaration
Message-ID: <202512041440.gykRQDyW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2025-12-03
head:   48371bd5c0566cfc8e9d81b48b39c9e355eafdc1
commit: bc3f6d1fbadd3a9fc48804d41967912f6a0e35f3 [15/16] hoge
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20251204/202512041440.gykRQDyW-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512041440.gykRQDyW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512041440.gykRQDyW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/img/img-i2s-in.c:388:31: error: expected ';' at end of declaration
     388 |         SND_SOC_POSSIBLE_DAIFMT_IB_IF,
         |                                      ^
         |                                      ;
>> sound/soc/img/img-i2s-in.c:395:2: error: member reference base type 'int (struct snd_soc_dai *, unsigned int)' is not a structure or union
     394 |         .set_fmt        = img_i2s_in_set_fmt
         |                           ~~~~~~~~~~~~~~~~~~
     395 |         .auto_selectable_formats        = &img_i2s_in_selectable_formats,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.
--
>> sound/soc/img/img-i2s-out.c:406:2: error: member reference base type 'int (struct snd_soc_dai *, unsigned int)' is not a structure or union
     405 |         .set_fmt        = img_i2s_out_set_fmt
         |                           ~~~~~~~~~~~~~~~~~~~
     406 |         .auto_selectable_formats        = &img_i2s_out_selectable_formats,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> sound/soc/img/img-parallel-out.c:199:2: error: member reference base type 'int (struct snd_soc_dai *, unsigned int)' is not a structure or union
     198 |         .set_fmt        = img_prl_out_set_fmt
         |                           ~~~~~~~~~~~~~~~~~~~
     199 |         .auto_selectable_formats        = &img_prl_selectable_formats,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> sound/soc/mediatek/mt8186/mt8186-dai-pcm.c:353:30: error: use of undeclared identifier 't9015_dai_selectable_formats'; did you mean 'ssi_dai_selectable_formats'?
     353 |         .auto_selectable_formats        = &t9015_dai_selectable_formats,
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                            ssi_dai_selectable_formats
   sound/soc/mediatek/mt8186/mt8186-dai-pcm.c:340:18: note: 'ssi_dai_selectable_formats' declared here
     340 | static const u64 ssi_dai_selectable_formats =
         |                  ^
   1 error generated.
--
>> sound/soc/mediatek/mt8195/mt8195-dai-etdm.c:2511:30: error: use of undeclared identifier 'mtk_dai_selectable_formats'; did you mean 'ssi_dai_selectable_formats'?
    2511 |         .auto_selectable_formats        = &mtk_dai_selectable_formats,
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                            ssi_dai_selectable_formats
   sound/soc/mediatek/mt8195/mt8195-dai-etdm.c:2493:18: note: 'ssi_dai_selectable_formats' declared here
    2493 | static const u64 ssi_dai_selectable_formats =
         |                  ^
   sound/soc/mediatek/mt8195/mt8195-dai-etdm.c:2523:30: error: use of undeclared identifier 'mtk_dai_selectable_formats'; did you mean 'ssi_dai_selectable_formats'?
    2523 |         .auto_selectable_formats        = &mtk_dai_selectable_formats,
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                            ssi_dai_selectable_formats
   sound/soc/mediatek/mt8195/mt8195-dai-etdm.c:2493:18: note: 'ssi_dai_selectable_formats' declared here
    2493 | static const u64 ssi_dai_selectable_formats =
         |                  ^
   sound/soc/mediatek/mt8195/mt8195-dai-etdm.c:2536:30: error: use of undeclared identifier 'mtk_dai_selectable_formats'; did you mean 'ssi_dai_selectable_formats'?
    2536 |         .auto_selectable_formats        = &mtk_dai_selectable_formats,
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                            ssi_dai_selectable_formats
   sound/soc/mediatek/mt8195/mt8195-dai-etdm.c:2493:18: note: 'ssi_dai_selectable_formats' declared here
    2493 | static const u64 ssi_dai_selectable_formats =
         |                  ^
   3 errors generated.


vim +388 sound/soc/img/img-i2s-in.c

   381	
   382	static const u64 img_i2s_in_selectable_formats =
   383		SND_SOC_POSSIBLE_DAIFMT_I2S	|
   384		SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
   385		SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
   386		SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
   387		SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
 > 388		SND_SOC_POSSIBLE_DAIFMT_IB_IF,
   389	
   390	static const struct snd_soc_dai_ops img_i2s_in_dai_ops = {
   391		.probe		= img_i2s_in_dai_probe,
   392		.trigger	= img_i2s_in_trigger,
   393		.hw_params	= img_i2s_in_hw_params,
   394		.set_fmt	= img_i2s_in_set_fmt
 > 395		.auto_selectable_formats	= &img_i2s_in_selectable_formats,
   396		.num_auto_selectable_formats	= 1,
   397	};
   398	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
