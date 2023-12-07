Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5055A3309C;
	Thu,  7 Dec 2023 16:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HolY5u3p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701964905; x=1733500905;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=phWQlYp9T78VNLL1jO/M1PShHVS5tnBO9tbtLaPHCwo=;
  b=HolY5u3pk1+QgJoFAIqvYJBq11pqvA2QbdJ+ijp5dRuODWYDDiqPFUSj
   G2jCRhn752o++KA0/AY6R+n4M71sJwnTA44TDv0mr5MILbUZfO+rELL69
   6N18HBAswNjhTr1yijNNia0uw0oey9QThoweqWFQ/m6DY2ThEA4YZ4Mav
   FOjg+wnXam7KTSAqZm6hAgDkXWRwvGj9KOLkcgYJqmG0+z/eFEACGZN+A
   TtvriZd50PlVVnbwVfNhWVgapHasp8AZJcocgUvpL5Z2Xc/qS2nn4Ep7u
   ICRl8CvSf7waIl2fMI+w4BD/Pptgb+Z1ocXxFczDXBcMPNW0KRRkiUE0D
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1358008"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1358008"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 08:01:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="748006917"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="748006917"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 07 Dec 2023 08:01:32 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBGoc-000CSM-22;
	Thu, 07 Dec 2023 16:01:30 +0000
Date: Fri, 8 Dec 2023 00:00:42 +0800
From: kernel test robot <lkp@intel.com>
To: Gergo Koteles <soyer@irl.hu>, Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	Gergo Koteles <soyer@irl.hu>
Subject: Re: [PATCH 13/16] ALSA: hda/tas2781: remove sound controls in unbind
Message-ID: <202312072318.9KUgvYeb-lkp@intel.com>
References: <8f16576930682297fd08bba5e063a9a1f3150388.1701906455.git.soyer@irl.hu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f16576930682297fd08bba5e063a9a1f3150388.1701906455.git.soyer@irl.hu>

Hi Gergo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus broonie-sound/for-next linus/master v6.7-rc4 next-20231207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gergo-Koteles/ALSA-hda-tas2781-leave-hda_component-in-usable-state/20231207-085947
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/8f16576930682297fd08bba5e063a9a1f3150388.1701906455.git.soyer%40irl.hu
patch subject: [PATCH 13/16] ALSA: hda/tas2781: remove sound controls in unbind
config: x86_64-randconfig-001-20231207 (https://download.01.org/0day-ci/archive/20231207/202312072318.9KUgvYeb-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231207/202312072318.9KUgvYeb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312072318.9KUgvYeb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/pci/hda/tas2781_hda_i2c.c:868:1: warning: unused label 'out' [-Wunused-label]
   out:
   ^~~~
   1 warning generated.


vim +/out +868 sound/pci/hda/tas2781_hda_i2c.c

   852	
   853	static int tas2781_runtime_resume(struct device *dev)
   854	{
   855		struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
   856	
   857		dev_dbg(tas_hda->dev, "Runtime Resume\n");
   858	
   859		mutex_lock(&tas_hda->priv->codec_lock);
   860	
   861		tasdevice_prmg_load(tas_hda->priv, tas_hda->priv->cur_prog);
   862	
   863		/* If calibrated data occurs error, dsp will still works with default
   864		 * calibrated data inside algo.
   865		 */
   866		tasdevice_apply_calibration(tas_hda->priv);
   867	
 > 868	out:
   869		mutex_unlock(&tas_hda->priv->codec_lock);
   870	
   871		return 0;
   872	}
   873	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
