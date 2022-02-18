Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7465738DA
	for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 03:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645153634; x=1676689634;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Cz980iip9pCG1rLc1y1oqzoo/FsN4EbcxNCIFmruno8=;
  b=IQ4ue/GuUoFbIkpDniJLnHYlrcKLVNTXHa18F+AvsXUkU/6U4gMwH3e7
   2Vy/ls6ca5DFOLXKODiuOiRVFtvDUWDzCc0dVjIchou3LdwvOQQ26ut2p
   JlkpG0K3tPSMZb3iCY81MR4FLE3m5X+kvvjDdtRonwCHVCnzWX8N5WMsR
   X5iGwVNJM5Hja+6U4OYn/1D7Gk8vYhOjCQt4bgTno1rAXKAmsF+OF3fYo
   FzU27m6eiKxgJxowcTQzX2zGdZpR497DS7G+7nm/dgV/JdSKmGXrVuGKX
   DtrA2Xfom/wxA4NtzgnU1I8s32JeiujOfct2mCUg4U3EMyyJHQA8qbz9V
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="275634708"
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; 
   d="scan'208";a="275634708"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2022 19:07:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; 
   d="scan'208";a="503821882"
Received: from lkp-server01.sh.intel.com (HELO 6f05bf9e3301) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 17 Feb 2022 19:07:10 -0800
Received: from kbuild by 6f05bf9e3301 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nKtby-0000sp-5A; Fri, 18 Feb 2022 03:07:10 +0000
Date: Fri, 18 Feb 2022 11:06:56 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v12 2/2] leds: Add driver for Qualcomm LPG
Message-ID: <202202181023.H7VNk5J7-lkp@intel.com>
References: <20220216045620.1716537-2-bjorn.andersson@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220216045620.1716537-2-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Bjorn,

I love your patch! Perhaps something to improve:

[auto build test WARNING on pavel-leds/for-next]
[also build test WARNING on robh/for-next linus/master v5.17-rc4 next-20220217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Bjorn-Andersson/dt-bindings-leds-Add-Qualcomm-Light-Pulse-Generator-binding/20220216-125508
base:   git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git for-next
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220218/202202181023.H7VNk5J7-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0e628a783b935c70c80815db6c061ec84f884af5)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/88352f2526296902090ed67f8b07f3fa348dad57
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Bjorn-Andersson/dt-bindings-leds-Add-Qualcomm-Light-Pulse-Generator-binding/20220216-125508
        git checkout 88352f2526296902090ed67f8b07f3fa348dad57
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/leds/rgb/ drivers/net/ethernet/mellanox/mlxsw/ mm/damon/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/leds/rgb/leds-qcom-lpg.c:920:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (state->enabled) {
               ^~~~~~~~~~~~~~
   drivers/leds/rgb/leds-qcom-lpg.c:936:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   drivers/leds/rgb/leds-qcom-lpg.c:920:2: note: remove the 'if' if its condition is always true
           if (state->enabled) {
           ^~~~~~~~~~~~~~~~~~~~
   drivers/leds/rgb/leds-qcom-lpg.c:913:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   1 warning generated.


vim +920 drivers/leds/rgb/leds-qcom-lpg.c

   900	
   901	/*
   902	 * Limitations:
   903	 * - Updating both duty and period is not done atomically, so the output signal
   904	 *   will momentarily be a mix of the settings.
   905	 * - Changed parameters takes effect immediately.
   906	 * - A disabled channel outputs a logical 0.
   907	 */
   908	static int lpg_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
   909				 const struct pwm_state *state)
   910	{
   911		struct lpg *lpg = container_of(chip, struct lpg, pwm);
   912		struct lpg_channel *chan = &lpg->channels[pwm->hwpwm];
   913		int ret;
   914	
   915		if (state->polarity != PWM_POLARITY_NORMAL)
   916			return -EINVAL;
   917	
   918		mutex_lock(&lpg->lock);
   919	
 > 920		if (state->enabled) {
   921			ret = lpg_calc_freq(chan, state->period);
   922			if (ret < 0)
   923				goto out_unlock;
   924	
   925			lpg_calc_duty(chan, state->duty_cycle);
   926		}
   927		chan->enabled = state->enabled;
   928	
   929		lpg_apply(chan);
   930	
   931		triled_set(lpg, chan->triled_mask, chan->enabled ? chan->triled_mask : 0);
   932	
   933	out_unlock:
   934		mutex_unlock(&lpg->lock);
   935	
   936		return ret;
   937	}
   938	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
