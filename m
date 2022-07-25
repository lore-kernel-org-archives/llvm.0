Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB6E1FA4
	for <llvm@lists.linux.dev>; Mon, 25 Jul 2022 15:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658763279; x=1690299279;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IlJzTywWYUah1/tFx1U0vnvlu9yCYd5VhnuYbbaRqR8=;
  b=HbCf9BDs0XoIaPn8C/IuohvOq3jwWUcv6AWr+Btoi7rxNxasnwn14iax
   f7QksEcdKoEUbFSzChyhwvfNER+pk0WtuGe8rIh5gT1gFj5aQLI2exasU
   CT5yXKGioR+OueHHxgnUa6VFNYYZwT+4+xtexw0OfHo54p9DKDweTCS3O
   iIuUtj08ZJHM6lzAeG86JgEs6SlZMPKhaohQHmJcEVn4l6OwUlI/iStHJ
   icdeM9oskUuVBSLLzcnm9bkrcb7NEDgu6QbA7JETBa3wWBLLL8Hrj6YAl
   C0FImEAdqBoLfMIRdWrqaJG8I6eHvcEaWxU5VBLXW0LalgKSTLJIeFfMk
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10419"; a="286486101"
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; 
   d="scan'208";a="286486101"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2022 08:34:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; 
   d="scan'208";a="926945886"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 25 Jul 2022 08:34:36 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oG06N-0005F7-1o;
	Mon, 25 Jul 2022 15:34:35 +0000
Date: Mon, 25 Jul 2022 23:34:04 +0800
From: kernel test robot <lkp@intel.com>
To: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v7 09/14] ALSA: hda: cs35l41: Support Hibernation during
 Suspend
Message-ID: <202207252333.OLvVowZS-lkp@intel.com>
References: <20220622074653.179078-10-vitalyr@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220622074653.179078-10-vitalyr@opensource.cirrus.com>

Hi Vitaly,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on linus/master v5.19-rc8]
[cannot apply to next-20220725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vitaly-Rodionov/ALSA-hda-cirrus-Add-initial-DSP-support-and-firmware-loading/20220622-155140
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
config: i386-randconfig-a006-20220718 (https://download.01.org/0day-ci/archive/20220725/202207252333.OLvVowZS-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d74b88c69dc2644bd0dc5d64e2d7413a0d4040e5)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ec7c9477dc53653d56130d055d711dad168a1035
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vitaly-Rodionov/ALSA-hda-cirrus-Add-initial-DSP-support-and-firmware-loading/20220622-155140
        git checkout ec7c9477dc53653d56130d055d711dad168a1035
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> sound/pci/hda/cs35l41_hda.c:448:6: error: call to undeclared function 'cs35l41_enter_hibernate'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (cs35l41_enter_hibernate(cs35l41->dev, cs35l41->regmap, cs35l41->hw_cfg.bst_type) < 0)
               ^
>> sound/pci/hda/cs35l41_hda.c:474:8: error: call to undeclared function 'cs35l41_exit_hibernate'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           ret = cs35l41_exit_hibernate(cs35l41->dev, cs35l41->regmap);
                 ^
   2 errors generated.


vim +/cs35l41_enter_hibernate +448 sound/pci/hda/cs35l41_hda.c

   438	
   439	static int cs35l41_runtime_suspend(struct device *dev)
   440	{
   441		struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
   442	
   443		dev_dbg(cs35l41->dev, "Suspend\n");
   444	
   445		if (!cs35l41->firmware_running)
   446			return 0;
   447	
 > 448		if (cs35l41_enter_hibernate(cs35l41->dev, cs35l41->regmap, cs35l41->hw_cfg.bst_type) < 0)
   449			return 0;
   450	
   451		regcache_cache_only(cs35l41->regmap, true);
   452		regcache_mark_dirty(cs35l41->regmap);
   453	
   454		return 0;
   455	}
   456	
   457	static int cs35l41_runtime_resume(struct device *dev)
   458	{
   459		struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
   460		int ret;
   461	
   462		dev_dbg(cs35l41->dev, "Resume.\n");
   463	
   464		if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST_NO_VSPK_SWITCH) {
   465			dev_dbg(cs35l41->dev, "System does not support Resume\n");
   466			return 0;
   467		}
   468	
   469		if (!cs35l41->firmware_running)
   470			return 0;
   471	
   472		regcache_cache_only(cs35l41->regmap, false);
   473	
 > 474		ret = cs35l41_exit_hibernate(cs35l41->dev, cs35l41->regmap);
   475		if (ret) {
   476			regcache_cache_only(cs35l41->regmap, true);
   477			return ret;
   478		}
   479	
   480		/* Test key needs to be unlocked to allow the OTP settings to re-apply */
   481		cs35l41_test_key_unlock(cs35l41->dev, cs35l41->regmap);
   482		ret = regcache_sync(cs35l41->regmap);
   483		cs35l41_test_key_lock(cs35l41->dev, cs35l41->regmap);
   484		if (ret) {
   485			dev_err(cs35l41->dev, "Failed to restore register cache: %d\n", ret);
   486			return ret;
   487		}
   488	
   489		if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST)
   490			cs35l41_init_boost(cs35l41->dev, cs35l41->regmap, &cs35l41->hw_cfg);
   491	
   492		return 0;
   493	}
   494	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
