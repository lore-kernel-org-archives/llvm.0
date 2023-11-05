Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B1D28F5;
	Sun,  5 Nov 2023 20:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ITiPhGLZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699217103; x=1730753103;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DFEnBoAZfjHsPxHG7Pn6/C8BILMOVrXxGrVVO4Ir0M0=;
  b=ITiPhGLZmbNg3lGfHSqTRDse7rsF/PQ/phU4OYA1V7yuphhkd2bAsA/h
   kuKkynBymi5i2Pks3kYS4KZWpnjWmwiB5TWsegaYvL2gt8JPq5fBgFSx8
   zkMxiN6k+G/ubBVwahHwk2eCqAjm3+YnmMAxOmHvkzfTbBMQ3HSf3ehnA
   4+qC9q5PZwB9krE3aYjXJJlwMY+wkAH2QfKjZCHc6g7Io5Yb6vwf0+f/L
   IuMw45a/mGu7TPVVYoJY7nkVY0htkBvWEmzPi+TQRMQXpPUmR/tG/DJuW
   vEAaFmn7MZv6c6ZUWXfNOm6C7weoUibt+p8EduA0AXCSdAcZmYE53SRT4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="388991514"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="388991514"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 12:45:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="762133802"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="762133802"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 05 Nov 2023 12:44:58 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzjzL-0005mC-32;
	Sun, 05 Nov 2023 20:44:55 +0000
Date: Mon, 6 Nov 2023 04:44:17 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Orlov <ivan.orlov0322@gmail.com>, perex@perex.cz, tiwai@suse.com,
	corbet@lwn.net
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ivan Orlov <ivan.orlov0322@gmail.com>, alsa-devel@alsa-project.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH v2 2/2] ALSA: Add new driver for Marian M2 sound card
Message-ID: <202311060403.591giMV8-lkp@intel.com>
References: <20230918181044.7257-2-ivan.orlov0322@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918181044.7257-2-ivan.orlov0322@gmail.com>

Hi Ivan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus linus/master v6.6 next-20231103]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivan-Orlov/ALSA-Add-new-driver-for-Marian-M2-sound-card/20230919-021236
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230918181044.7257-2-ivan.orlov0322%40gmail.com
patch subject: [PATCH v2 2/2] ALSA: Add new driver for Marian M2 sound card
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20231106/202311060403.591giMV8-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311060403.591giMV8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311060403.591giMV8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/pci/marianm2.c:466:6: warning: variable 'buffer_frames' set but not used [-Wunused-but-set-variable]
           int buffer_frames;
               ^
>> sound/pci/marianm2.c:472:11: warning: variable 'speedmode' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           else if (params_rate(params) < RATE_FAST)
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/marianm2.c:475:6: note: uninitialized use occurs here
           if (speedmode > marian->desc->speedmode_max) {
               ^~~~~~~~~
   sound/pci/marianm2.c:472:7: note: remove the 'if' if its condition is always true
           else if (params_rate(params) < RATE_FAST)
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/marianm2.c:465:24: note: initialize the variable 'speedmode' to silence this warning
           unsigned int speedmode;
                                 ^
                                  = 0
   2 warnings generated.


vim +472 sound/pci/marianm2.c

   460	
   461	static int snd_marian_hw_params(struct snd_pcm_substream *substream,
   462					struct snd_pcm_hw_params *params)
   463	{
   464		struct marian_card *marian = snd_pcm_substream_chip(substream);
   465		unsigned int speedmode;
 > 466		int buffer_frames;
   467	
   468		buffer_frames = SUBSTREAM_BUF_SIZE / M2_FRAME_SIZE;
   469	
   470		if (params_rate(params) < RATE_SLOW)
   471			speedmode = SPEEDMODE_SLOW;
 > 472		else if (params_rate(params) < RATE_FAST)
   473			speedmode = SPEEDMODE_FAST;
   474	
   475		if (speedmode > marian->desc->speedmode_max) {
   476			dev_err(marian->card->dev,
   477				"Requested rate (%u Hz) higher than card's maximum\n",
   478				params_rate(params));
   479			_snd_pcm_hw_param_setempty(params, SNDRV_PCM_HW_PARAM_RATE);
   480			return -EBUSY;
   481		}
   482	
   483		spin_lock(&marian->reglock);
   484		if (marian->desc->set_speedmode)
   485			marian->desc->set_speedmode(marian, speedmode);
   486		else
   487			marian_generic_set_speedmode(marian, speedmode);
   488	
   489		marian->detune = 0;
   490	
   491		marian_generic_set_dco(marian, params_rate(params), 0);
   492		spin_unlock(&marian->reglock);
   493	
   494		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
   495			snd_pcm_set_runtime_buffer(substream, &marian->playback_buf);
   496		else
   497			snd_pcm_set_runtime_buffer(substream, &marian->capture_buf);
   498	
   499		// apply optional card specific hw constraints
   500		if (marian->desc->hw_constraints_func)
   501			marian->desc->hw_constraints_func(marian, substream, params);
   502	
   503		return 0;
   504	}
   505	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
