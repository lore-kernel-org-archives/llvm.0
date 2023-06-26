Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E25BE64;
	Mon, 26 Jun 2023 15:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687793668; x=1719329668;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=818V+UbhltwG74/m2cMyF6r9YTgqND5RDdLzZiIgGY0=;
  b=i+E07fBSP9+2S27QzpcG1rhPJMQYkSOWn6fRczZj16HptRfzCRiDJM8R
   M9tQejDxnMgBRywhsUK3T8Is6isULWvqysTg4t/r0+FrZtXmqaUTr7Dc8
   ZAbp/cy26sOoicZ/VymtbQVXA4H7vY6dquVqCSYi1W+eCfdkkMxnZKeKg
   M0U0DVRnyJGu79FvphM6zUhmUYuGdTdsxseuHjoE+FVIjehGTtSz2X++G
   M15LSbGtXv/R+ByzAAm5Kc0HUGmz0grOb1aswH/oTN0a08h5M1TPZLxTG
   u2WZILmBTaQBSU7AUSSb1MovCmsJx46jzJkcEbtesl9NB6PTqyCeO84sz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="358799081"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="358799081"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 08:34:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="719398262"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="719398262"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 26 Jun 2023 08:34:15 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDoEG-000Am9-2K;
	Mon, 26 Jun 2023 15:34:12 +0000
Date: Mon, 26 Jun 2023 23:33:25 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] ovl: move all parameter handling into params.{c,h}
Message-ID: <202306262337.DVcrVJMm-lkp@intel.com>
References: <20230626-fs-overlayfs-mount-api-param-v1-1-29afb997a19f@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230626-fs-overlayfs-mount-api-param-v1-1-29afb997a19f@kernel.org>

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 62149a745eee03194f025021640c80b84353089b]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Brauner/ovl-move-all-parameter-handling-into-params-c-h/20230626-182521
base:   62149a745eee03194f025021640c80b84353089b
patch link:    https://lore.kernel.org/r/20230626-fs-overlayfs-mount-api-param-v1-1-29afb997a19f%40kernel.org
patch subject: [PATCH] ovl: move all parameter handling into params.{c,h}
config: x86_64-randconfig-a003-20230626 (https://download.01.org/0day-ci/archive/20230626/202306262337.DVcrVJMm-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230626/202306262337.DVcrVJMm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306262337.DVcrVJMm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/overlayfs/params.c:92:13: warning: no previous prototype for function 'ovl_redirect_mode' [-Wmissing-prototypes]
   const char *ovl_redirect_mode(struct ovl_config *config)
               ^
   fs/overlayfs/params.c:92:7: note: declare 'static' if the function is not intended to be used outside of this translation unit
   const char *ovl_redirect_mode(struct ovl_config *config)
         ^
   static 
   1 warning generated.


vim +/ovl_redirect_mode +92 fs/overlayfs/params.c

    91	
  > 92	const char *ovl_redirect_mode(struct ovl_config *config)
    93	{
    94		return ovl_parameter_redirect_dir[config->redirect_mode].name;
    95	}
    96	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
