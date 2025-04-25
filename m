Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1355F26AC3;
	Fri, 25 Apr 2025 10:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745575563; cv=none; b=ldJKrJ0mhKQHyzwiRiEVAqJGE4lRQTCiH5vaNLtm7RHY1Rzt3bQh8qCxJMHA7CczYQGP0xhYCpIw7RQZaUWxVdTnZxddfSE92hvDFUVxvs2dQmX3AFlnvlXVd7QZrWN+hmPRsyLyP0sbEulUnW/fj9I1/CZEry5fDjbMOPUrt3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745575563; c=relaxed/simple;
	bh=RlzWIVdo7+6AT5aMuG1xqPJ9PjHGrkb10yBGJ0RZPb4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rpw3HMUNu7ScnZSMQo7j+8WvF3MSwW0unNWwbQL8LWhosriivkiwh49muKimshERtGIL5xw4gFt8tnMi+bDUez2klPvhCKkuXpkYSf0K5TY4xu8UVOvUQy3rTtKt50gtBTHVpvx/DQsdQioTwhtRuH0LrCxqGNgO4x79uq1Vipw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hd3yaDWr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hd3yaDWr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745575561; x=1777111561;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RlzWIVdo7+6AT5aMuG1xqPJ9PjHGrkb10yBGJ0RZPb4=;
  b=Hd3yaDWr2FCCCx9KCHM4PfneM2B+Ru5DVuDy/BDOyRYNFdoEZKOSu57k
   Mlth7iT2k5meRMNaNr81yZPTZmMmIuEPnPtRulOAvtoSsus6r9qI4eVW/
   vVU/RUfq0r3pj+L8GJTI2KlYSCjuQ8DFq2aIjlu5xwWPzvrTkCJnlGOVf
   g1AmvJ8C2VWXKjStURhYy7+SCIPraHQLKxNWgwGyMaRAXEhPnNRdJ6CTb
   oVNdCT76t/n4OXdBf9Pd/g/NG0iTe6bRu+Plx7PfNAykFsUTO5hMymPh1
   C5pa1Oh/xFpPVPR8fTzs3K/+7LI3cBQSnDuRgkM+BXuR6rew/yyBGw+s/
   Q==;
X-CSE-ConnectionGUID: y2azDHtZRqqhJ9oWu3I9nw==
X-CSE-MsgGUID: uE5EM/eVR/CbBPNpz37W7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="58598849"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="58598849"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 03:06:00 -0700
X-CSE-ConnectionGUID: wYslSblASnelvopOqj8wsw==
X-CSE-MsgGUID: yQ/JsgX/RFWY4wnQG53PYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="156096584"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Apr 2025 03:05:59 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8FwS-00053F-2o;
	Fri, 25 Apr 2025 10:05:56 +0000
Date: Fri, 25 Apr 2025 18:05:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-04-23 110/116]
 sound/soc/codecs/simple-mux.c:62:48: error: incomplete definition of type
 'struct snd_soc_dapm_context'
Message-ID: <202504251809.nFvLE1wU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2025-04-23
head:   66104ef95f2f8e651b29bf32aaa483868492887e
commit: cd5502a8955a4d68f36c94affdeecf657f767438 [110/116] ASoC: soc-dapm: move struct snd_soc_dapm_context
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250425/202504251809.nFvLE1wU-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504251809.nFvLE1wU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504251809.nFvLE1wU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/codecs/simple-mux.c:11:
   include/sound/soc.h:1485:38: error: incomplete definition of type 'struct snd_soc_dapm_context'
    1485 |         _snd_soc_dapm_mutex_lock_root_c(dapm->card);
         |                                         ~~~~^
   include/sound/soc-topology.h:26:8: note: forward declaration of 'struct snd_soc_dapm_context'
      26 | struct snd_soc_dapm_context;
         |        ^
   In file included from sound/soc/codecs/simple-mux.c:11:
   include/sound/soc.h:1490:33: error: incomplete definition of type 'struct snd_soc_dapm_context'
    1490 |         _snd_soc_dapm_mutex_lock_c(dapm->card);
         |                                    ~~~~^
   include/sound/soc-topology.h:26:8: note: forward declaration of 'struct snd_soc_dapm_context'
      26 | struct snd_soc_dapm_context;
         |        ^
   In file included from sound/soc/codecs/simple-mux.c:11:
   include/sound/soc.h:1495:35: error: incomplete definition of type 'struct snd_soc_dapm_context'
    1495 |         _snd_soc_dapm_mutex_unlock_c(dapm->card);
         |                                      ~~~~^
   include/sound/soc-topology.h:26:8: note: forward declaration of 'struct snd_soc_dapm_context'
      26 | struct snd_soc_dapm_context;
         |        ^
   In file included from sound/soc/codecs/simple-mux.c:11:
   include/sound/soc.h:1500:40: error: incomplete definition of type 'struct snd_soc_dapm_context'
    1500 |         _snd_soc_dapm_mutex_assert_held_c(dapm->card);
         |                                           ~~~~^
   include/sound/soc-topology.h:26:8: note: forward declaration of 'struct snd_soc_dapm_context'
      26 | struct snd_soc_dapm_context;
         |        ^
   sound/soc/codecs/simple-mux.c:37:38: error: call to undeclared function 'snd_soc_dapm_kcontrol_dapm'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      37 |         struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
         |                                             ^
   sound/soc/codecs/simple-mux.c:37:38: note: did you mean 'snd_soc_dapm_kcontrol_to_dapm'?
   include/sound/soc-dapm.h:702:30: note: 'snd_soc_dapm_kcontrol_to_dapm' declared here
     702 | struct snd_soc_dapm_context *snd_soc_dapm_kcontrol_to_dapm(struct snd_kcontrol *kcontrol);
         |                              ^
   sound/soc/codecs/simple-mux.c:37:31: error: incompatible integer to pointer conversion initializing 'struct snd_soc_dapm_context *' with an expression of type 'int' [-Wint-conversion]
      37 |         struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
         |                                      ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/simple-mux.c:49:38: error: call to undeclared function 'snd_soc_dapm_kcontrol_dapm'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      49 |         struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
         |                                             ^
   sound/soc/codecs/simple-mux.c:49:31: error: incompatible integer to pointer conversion initializing 'struct snd_soc_dapm_context *' with an expression of type 'int' [-Wint-conversion]
      49 |         struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
         |                                      ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/codecs/simple-mux.c:62:48: error: incomplete definition of type 'struct snd_soc_dapm_context'
      62 |         if (priv->idle_state != MUX_IDLE_AS_IS && dapm->bias_level < SND_SOC_BIAS_PREPARE)
         |                                                   ~~~~^
   include/sound/soc-topology.h:26:8: note: forward declaration of 'struct snd_soc_dapm_context'
      26 | struct snd_soc_dapm_context;
         |        ^
   9 errors generated.


vim +62 sound/soc/codecs/simple-mux.c

342fbb7578d174 Alexandre Belloni 2020-12-05  45  
342fbb7578d174 Alexandre Belloni 2020-12-05  46  static int simple_mux_control_put(struct snd_kcontrol *kcontrol,
342fbb7578d174 Alexandre Belloni 2020-12-05  47  				  struct snd_ctl_elem_value *ucontrol)
342fbb7578d174 Alexandre Belloni 2020-12-05  48  {
342fbb7578d174 Alexandre Belloni 2020-12-05  49  	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
342fbb7578d174 Alexandre Belloni 2020-12-05  50  	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
342fbb7578d174 Alexandre Belloni 2020-12-05  51  	struct snd_soc_component *c = snd_soc_dapm_to_component(dapm);
342fbb7578d174 Alexandre Belloni 2020-12-05  52  	struct simple_mux *priv = snd_soc_component_get_drvdata(c);
342fbb7578d174 Alexandre Belloni 2020-12-05  53  
342fbb7578d174 Alexandre Belloni 2020-12-05  54  	if (ucontrol->value.enumerated.item[0] > e->items)
342fbb7578d174 Alexandre Belloni 2020-12-05  55  		return -EINVAL;
342fbb7578d174 Alexandre Belloni 2020-12-05  56  
342fbb7578d174 Alexandre Belloni 2020-12-05  57  	if (priv->mux == ucontrol->value.enumerated.item[0])
342fbb7578d174 Alexandre Belloni 2020-12-05  58  		return 0;
342fbb7578d174 Alexandre Belloni 2020-12-05  59  
342fbb7578d174 Alexandre Belloni 2020-12-05  60  	priv->mux = ucontrol->value.enumerated.item[0];
342fbb7578d174 Alexandre Belloni 2020-12-05  61  
2b974284aa073d Hendrik v. Raven  2024-11-14 @62  	if (priv->idle_state != MUX_IDLE_AS_IS && dapm->bias_level < SND_SOC_BIAS_PREPARE)
2b974284aa073d Hendrik v. Raven  2024-11-14  63  		return 0;
2b974284aa073d Hendrik v. Raven  2024-11-14  64  
342fbb7578d174 Alexandre Belloni 2020-12-05  65  	gpiod_set_value_cansleep(priv->gpiod_mux, priv->mux);
342fbb7578d174 Alexandre Belloni 2020-12-05  66  
342fbb7578d174 Alexandre Belloni 2020-12-05  67  	return snd_soc_dapm_mux_update_power(dapm, kcontrol,
342fbb7578d174 Alexandre Belloni 2020-12-05  68  					     ucontrol->value.enumerated.item[0],
342fbb7578d174 Alexandre Belloni 2020-12-05  69  					     e, NULL);
342fbb7578d174 Alexandre Belloni 2020-12-05  70  }
342fbb7578d174 Alexandre Belloni 2020-12-05  71  

:::::: The code at line 62 was first introduced by commit
:::::: 2b974284aa073d6e2936f9032e8ad7b99480b5b8 ASoc: simple-mux: add idle-state support

:::::: TO: Hendrik v. Raven <h.v.raven@merzmedtech.de>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
