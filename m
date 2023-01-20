Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C181569E;
	Fri, 20 Jan 2023 19:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674244162; x=1705780162;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LkaUdd4OdIGIWum9Mt3m0Zi5T8RTEMrbZghJ58jlido=;
  b=ViQcXzWUZFmljH1+ngm+NK3TxWQ0/SuO6Nc5xmWU66ghzCpZbn9F7iBB
   dgw6gV1PTZ9FPkgncgrDwsOPPdz7U7lyHc34+psTg0YInNNK54wq9/uOt
   A/Dg/tmdhFNoia/BZPap8NWAvrtGavGJH1E+wPgl/38HSrVD82LQ5FJOy
   dGMmF3+U25Tl+2l69KEVhTlG2sGtBRcGCfYzSWG2I71wOanVJ965aMRIK
   sDSWng+A0Q8lbwl+X9lX8C2DrVlqfuBoHmrihRaZxEg7Y6En0w9TdGKQh
   S4H3mkm3AvlVvGKnOzVjFs7Iv4JaTwgBWaW/FEY4Z5G2YdJi060VDixMB
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="324363973"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="324363973"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 11:49:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="906072162"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="906072162"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 20 Jan 2023 11:49:19 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIxO3-0002rK-05;
	Fri, 20 Jan 2023 19:49:19 +0000
Date: Sat, 21 Jan 2023 03:49:14 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	John Harrison <John.C.Harrison@intel.com>,
	Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 4/8] drm/i915/guc: Update GuC messages in intel_guc_ct.c
Message-ID: <202301210330.zvfxkqjp-lkp@intel.com>
References: <20230120164050.1765-5-michal.wajdeczko@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230120164050.1765-5-michal.wajdeczko@intel.com>

Hi Michal,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Wajdeczko/drm-i915-guc-Add-GuC-oriented-print-macros/20230121-004232
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230120164050.1765-5-michal.wajdeczko%40intel.com
patch subject: [PATCH 4/8] drm/i915/guc: Update GuC messages in intel_guc_ct.c
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20230121/202301210330.zvfxkqjp-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e3ee219e703a4153b750288ac3e28cd2ea4130c1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Michal-Wajdeczko/drm-i915-guc-Add-GuC-oriented-print-macros/20230121-004232
        git checkout e3ee219e703a4153b750288ac3e28cd2ea4130c1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c:27:40: warning: unused function 'ct_to_i915' [-Wunused-function]
   static inline struct drm_i915_private *ct_to_i915(struct intel_guc_ct *ct)
                                          ^
   1 warning generated.


vim +/ct_to_i915 +27 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c

6fb086e5e6ba82d Daniele Ceraolo Spurio 2021-06-02  26  
6fb086e5e6ba82d Daniele Ceraolo Spurio 2021-06-02 @27  static inline struct drm_i915_private *ct_to_i915(struct intel_guc_ct *ct)
6fb086e5e6ba82d Daniele Ceraolo Spurio 2021-06-02  28  {
6fb086e5e6ba82d Daniele Ceraolo Spurio 2021-06-02  29  	return ct_to_gt(ct)->i915;
6fb086e5e6ba82d Daniele Ceraolo Spurio 2021-06-02  30  }
6fb086e5e6ba82d Daniele Ceraolo Spurio 2021-06-02  31  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
