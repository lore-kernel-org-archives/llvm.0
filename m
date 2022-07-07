Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F1728ED
	for <llvm@lists.linux.dev>; Thu,  7 Jul 2022 21:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657230009; x=1688766009;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ocBncahtaSg7S42lZSGoqH6BP+AOxjjrjkVB4JpO39s=;
  b=XrUguUgx5YIGykZvZRx8cIkcWsHuQQ49zV7JNvtnCublOzxQEs+k2YV5
   v3AheIQF46r9rLuVQ53XvKt6W5sbFgwNB+/1ufUuOYzem6eunllG1nEh7
   Jjp+hBj2k6wrfID9vXR6Nv/zD3Is2pWfwT0BlgbiJfsQ1ah5yrQimS+Em
   bQAYKIdgcvksY1O1x5vk2VnY69L5FH6rFwJxSHy9dWsaHg9w7h854NqPi
   7jtv0LameXJByPs8E6gMA72rjTS6zv161JtCGuZC9Y4bFo7KjF7auHHtW
   IUiqUdjyZhhP0GMUQudqFr1RjSPeHAmUzVM/nR2gDS94SYMvhoHHaTV1o
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="284151036"
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; 
   d="scan'208";a="284151036"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2022 14:40:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; 
   d="scan'208";a="661541874"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Jul 2022 14:40:06 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o9ZED-000MVW-CY;
	Thu, 07 Jul 2022 21:40:05 +0000
Date: Fri, 8 Jul 2022 05:39:51 +0800
From: kernel test robot <lkp@intel.com>
To: Zhu Ning <zhuning0077@gmail.com>, alsa-devel@alsa-project.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Zhu Ning <zhuning0077@gmail.com>,
	pierre-louis.bossart@linux.intel.com, tiwai@suse.com,
	broonie@kernel.org, David Yang <yangxiaohua@everest-semi.com>
Subject: Re: [PATCH] ASoC: codecs: add support for ES8326
Message-ID: <202207080557.twGXw3yY-lkp@intel.com>
References: <20220707011856.10841-1-zhuning0077@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707011856.10841-1-zhuning0077@gmail.com>

Hi Zhu,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on tiwai-sound/for-next linus/master v5.19-rc5 next-20220707]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhu-Ning/ASoC-codecs-add-support-for-ES8326/20220707-115006
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: arm64-buildonly-randconfig-r006-20220707 (https://download.01.org/0day-ci/archive/20220708/202207080557.twGXw3yY-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 66ae1d60bb278793fd651cece264699d522bab84)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/fda793f4ec55b33955344b93a8c290fe207d54d4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Zhu-Ning/ASoC-codecs-add-support-for-ES8326/20220707-115006
        git checkout fda793f4ec55b33955344b93a8c290fe207d54d4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   sound/soc/codecs/es8326.c:612:13: warning: converting the result of '<<' to a boolean always evaluates to true [-Wtautological-constant-compare]
           if((reg && ES8326_VERSION_B) == 1)
                      ^
   sound/soc/codecs/es8326.h:185:29: note: expanded from macro 'ES8326_VERSION_B'
   #define ES8326_VERSION_B (1 << 0)
                               ^
>> sound/soc/codecs/es8326.c:742:35: warning: unused variable 'es8326_i2c_id' [-Wunused-const-variable]
   static const struct i2c_device_id es8326_i2c_id[] = {
                                     ^
   2 warnings generated.


vim +/es8326_i2c_id +742 sound/soc/codecs/es8326.c

   741	
 > 742	static const struct i2c_device_id es8326_i2c_id[] = {
   743		{"es8326", 0 },
   744		{}
   745	};
   746	MODULE_DEVICE_TABLE(i2c, es8326_i2c_id);
   747	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
