Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260513C15
	for <llvm@lists.linux.dev>; Sun,  7 Aug 2022 17:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659893687; x=1691429687;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PJb6sgcaW6XwsPmmIIc5VDGbnksrZ6P+StXKyk0O5vk=;
  b=RSCeo1EUh86Q9awkot+XvbBON3s3LK+Ghcuw4f/nZNgJVmpBc4S7uSrp
   NseYzgNQRo9nobCCC24Ww5ZKn1DCR+dE9gctuU0gNj0QoF7k1cmABRVNW
   pvXOKfV4G4jyeGZF//1bux/T8KWz79od3knjqcUQQJJCLIKl67jN+zUwA
   5YgKmG2iJ33JDvNf+xkO/+1ENpvUmch1IuCst1fbCdyVvqZ5M+4Q99PUw
   xSHs+WYPZBchlE3oHQgzUmnX9w457ALfRGOMNbU5Bg5NGhCA8R9bRbd99
   sp9Wa7yhdqjMx1q3kHTVe84ML889+9Eje8mtDpW1ZIozkCkl4Zn3XKtuR
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10432"; a="277381470"
X-IronPort-AV: E=Sophos;i="5.93,220,1654585200"; 
   d="scan'208";a="277381470"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2022 10:34:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,220,1654585200"; 
   d="scan'208";a="672215752"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Aug 2022 10:34:44 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oKkAm-000LWL-0C;
	Sun, 07 Aug 2022 17:34:44 +0000
Date: Mon, 8 Aug 2022 01:33:47 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Cercueil <paul@crapouillou.net>, Lee Jones <lee.jones@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 20/28] mfd: arizona: Remove #ifdef guards for PM related
 functions
Message-ID: <202208080141.UIoxRyzL-lkp@intel.com>
References: <20220807145247.46107-21-paul@crapouillou.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220807145247.46107-21-paul@crapouillou.net>

Hi Paul,

I love your patch! Yet something to improve:

[auto build test ERROR on v5.19]
[cannot apply to lee-mfd/for-mfd-next linus/master next-20220805]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Cercueil/mfd-Remove-ifdef-guards-for-PM-functions/20220807-225947
base:    3d7cb6b04c3f3115719235cc6866b10326de34cd
config: hexagon-randconfig-r013-20220807 (https://download.01.org/0day-ci/archive/20220808/202208080141.UIoxRyzL-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/03342844cafff973ffa39ce471f64a76c4d87b06
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Paul-Cercueil/mfd-Remove-ifdef-guards-for-PM-functions/20220807-225947
        git checkout 03342844cafff973ffa39ce471f64a76c4d87b06
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/mfd/arizona-core.c:788:25: error: static declaration of 'arizona_pm_ops' follows non-static declaration
   const struct dev_pm_ops arizona_pm_ops = {
                           ^
   drivers/mfd/arizona.h:29:32: note: previous declaration is here
   extern const struct dev_pm_ops arizona_pm_ops;
                                  ^
   1 error generated.


vim +/arizona_pm_ops +788 drivers/mfd/arizona-core.c

dc781d0e10fca2 Mark Brown     2013-01-27  784  
03342844cafff9 Paul Cercueil  2022-08-07  785  #ifndef CONFIG_PM
03342844cafff9 Paul Cercueil  2022-08-07  786  static __maybe_unused
03342844cafff9 Paul Cercueil  2022-08-07  787  #endif
3cc72986947501 Mark Brown     2012-06-19 @788  const struct dev_pm_ops arizona_pm_ops = {
03342844cafff9 Paul Cercueil  2022-08-07  789  	RUNTIME_PM_OPS(arizona_runtime_suspend,
3cc72986947501 Mark Brown     2012-06-19  790  		       arizona_runtime_resume,
3cc72986947501 Mark Brown     2012-06-19  791  		       NULL)
03342844cafff9 Paul Cercueil  2022-08-07  792  	SYSTEM_SLEEP_PM_OPS(arizona_suspend, arizona_resume)
03342844cafff9 Paul Cercueil  2022-08-07  793  	NOIRQ_SYSTEM_SLEEP_PM_OPS(arizona_suspend_noirq,
3612b27cfb4a07 Charles Keepax 2016-08-30  794  				  arizona_resume_noirq)
3cc72986947501 Mark Brown     2012-06-19  795  };
03342844cafff9 Paul Cercueil  2022-08-07  796  #ifdef CONFIG_PM
3cc72986947501 Mark Brown     2012-06-19  797  EXPORT_SYMBOL_GPL(arizona_pm_ops);
03342844cafff9 Paul Cercueil  2022-08-07  798  #endif
3cc72986947501 Mark Brown     2012-06-19  799  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
