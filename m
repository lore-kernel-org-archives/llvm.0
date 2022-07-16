Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E27E665B
	for <llvm@lists.linux.dev>; Sat, 16 Jul 2022 17:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657994012; x=1689530012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IUHHIx0fQJs/Cdu9JIBdViTJ9P/27B8e3gxL35x3/so=;
  b=Rk95zQnnqg91SWQUSDg8lJpi7PwlpRsYfRMnhmxPD6MLYsf1J6K9PfRx
   1qMbxaBd+wUycxkFfR9N/MW0ep962WNHov6vxnJes+HJHoRiTfBleZLY1
   nhGNmjucPBceR+Ac6KgZr50BGKCZkl3+fH5/pseaBV/O5W1SYD8rN2S6h
   0iwLhhTzoB5WrzsOsP1R6d4EI29cEJkZDYNhH1StSCY1AK+U0LnYgf/X2
   C+kTrwrcLAbYP8/xnC6fE4Rib2YhXpojO86ReQMO7DfxwALE6lMwajT1f
   62CyUzxcQDyQNHI3CiFCCL4ShvzaLHimpdg5y+tf+wDahYPuy+KVat4EA
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10410"; a="265781970"
X-IronPort-AV: E=Sophos;i="5.92,277,1650956400"; 
   d="scan'208";a="265781970"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2022 10:53:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,277,1650956400"; 
   d="scan'208";a="596808733"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 16 Jul 2022 10:53:29 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oClyr-0001v8-4n;
	Sat, 16 Jul 2022 17:53:29 +0000
Date: Sun, 17 Jul 2022 01:53:00 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 2/5] ALSA: pcm: Drop async signal support
Message-ID: <202207170141.kyNwoI54-lkp@intel.com>
References: <20220715102935.4695-3-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220715102935.4695-3-tiwai@suse.de>

Hi Takashi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on linus/master v5.19-rc6 next-20220715]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Takashi-Iwai/ALSA-Drop-async-signal-support/20220716-211853
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
config: i386-randconfig-a011 (https://download.01.org/0day-ci/archive/20220717/202207170141.kyNwoI54-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 07022e6cf9b5b3baa642be53d0b3c3f1c403dbfd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6705167eb6bf093c8a099fa16c0aeb5f3da0dfba
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Takashi-Iwai/ALSA-Drop-async-signal-support/20220716-211853
        git checkout 6705167eb6bf093c8a099fa16c0aeb5f3da0dfba
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash sound/core/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/core/pcm_lib.c:1810:26: warning: variable 'runtime' set but not used [-Wunused-but-set-variable]
           struct snd_pcm_runtime *runtime;
                                   ^
   1 warning generated.


vim +/runtime +1810 sound/core/pcm_lib.c

e88e8ae639a490 Takashi Iwai     2006-04-28  1780  
^1da177e4c3f41 Linus Torvalds   2005-04-16  1781  /**
47271b1b98c980 Takashi Sakamoto 2021-06-10  1782   * snd_pcm_period_elapsed_under_stream_lock() - update the status of runtime for the next period
47271b1b98c980 Takashi Sakamoto 2021-06-10  1783   *						under acquired lock of PCM substream.
47271b1b98c980 Takashi Sakamoto 2021-06-10  1784   * @substream: the instance of pcm substream.
47271b1b98c980 Takashi Sakamoto 2021-06-10  1785   *
47271b1b98c980 Takashi Sakamoto 2021-06-10  1786   * This function is called when the batch of audio data frames as the same size as the period of
47271b1b98c980 Takashi Sakamoto 2021-06-10  1787   * buffer is already processed in audio data transmission.
47271b1b98c980 Takashi Sakamoto 2021-06-10  1788   *
47271b1b98c980 Takashi Sakamoto 2021-06-10  1789   * The call of function updates the status of runtime with the latest position of audio data
47271b1b98c980 Takashi Sakamoto 2021-06-10  1790   * transmission, checks overrun and underrun over buffer, awaken user processes from waiting for
47271b1b98c980 Takashi Sakamoto 2021-06-10  1791   * available audio data frames, sampling audio timestamp, and performs stop or drain the PCM
47271b1b98c980 Takashi Sakamoto 2021-06-10  1792   * substream according to configured threshold.
47271b1b98c980 Takashi Sakamoto 2021-06-10  1793   *
47271b1b98c980 Takashi Sakamoto 2021-06-10  1794   * The function is intended to use for the case that PCM driver operates audio data frames under
47271b1b98c980 Takashi Sakamoto 2021-06-10  1795   * acquired lock of PCM substream; e.g. in callback of any operation of &snd_pcm_ops in process
47271b1b98c980 Takashi Sakamoto 2021-06-10  1796   * context. In any interrupt context, it's preferrable to use ``snd_pcm_period_elapsed()`` instead
47271b1b98c980 Takashi Sakamoto 2021-06-10  1797   * since lock of PCM substream should be acquired in advance.
^1da177e4c3f41 Linus Torvalds   2005-04-16  1798   *
47271b1b98c980 Takashi Sakamoto 2021-06-10  1799   * Developer should pay enough attention that some callbacks in &snd_pcm_ops are done by the call of
47271b1b98c980 Takashi Sakamoto 2021-06-10  1800   * function:
^1da177e4c3f41 Linus Torvalds   2005-04-16  1801   *
47271b1b98c980 Takashi Sakamoto 2021-06-10  1802   * - .pointer - to retrieve current position of audio data transmission by frame count or XRUN state.
47271b1b98c980 Takashi Sakamoto 2021-06-10  1803   * - .trigger - with SNDRV_PCM_TRIGGER_STOP at XRUN or DRAINING state.
47271b1b98c980 Takashi Sakamoto 2021-06-10  1804   * - .get_time_info - to retrieve audio time stamp if needed.
47271b1b98c980 Takashi Sakamoto 2021-06-10  1805   *
47271b1b98c980 Takashi Sakamoto 2021-06-10  1806   * Even if more than one periods have elapsed since the last call, you have to call this only once.
^1da177e4c3f41 Linus Torvalds   2005-04-16  1807   */
47271b1b98c980 Takashi Sakamoto 2021-06-10  1808  void snd_pcm_period_elapsed_under_stream_lock(struct snd_pcm_substream *substream)
^1da177e4c3f41 Linus Torvalds   2005-04-16  1809  {
877211f5e1b119 Takashi Iwai     2005-11-17 @1810  	struct snd_pcm_runtime *runtime;
^1da177e4c3f41 Linus Torvalds   2005-04-16  1811  
f5cdc9d4003a2f paulhsia         2019-11-13  1812  	if (PCM_RUNTIME_CHECK(substream))
47271b1b98c980 Takashi Sakamoto 2021-06-10  1813  		return;
f5cdc9d4003a2f paulhsia         2019-11-13  1814  	runtime = substream->runtime;
f5cdc9d4003a2f paulhsia         2019-11-13  1815  
^1da177e4c3f41 Linus Torvalds   2005-04-16  1816  	if (!snd_pcm_running(substream) ||
f240406babfe15 Jaroslav Kysela  2010-01-05  1817  	    snd_pcm_update_hw_ptr0(substream, 1) < 0)
6705167eb6bf09 Takashi Iwai     2022-07-15  1818  		return;
^1da177e4c3f41 Linus Torvalds   2005-04-16  1819  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
