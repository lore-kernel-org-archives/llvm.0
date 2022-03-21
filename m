Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0EB612C
	for <llvm@lists.linux.dev>; Mon, 21 Mar 2022 19:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647891692; x=1679427692;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G2lX+Di8elGcwVO0jNQnrRc581eS2Rjk8badfCKQZLg=;
  b=aEa/sCDHaTLKCz02AME2cAmNnMohKIkQtBYxvQ97ve9tilwRtbozdowH
   nVMYMWFHRvI5MH6QInvfkOvcj+ZUIpZdkBQ4zx62STF4zTXZLQyFVeRDQ
   bS912h8E+iZo48ikqMKbwVm+fb65WFl7/F3fw2eNfvChUuzNtGr+plNz+
   AFW0DLkq/KvNts+/C68K3MEScAjSdoEdROSSx4AZtwKhwXexPkf37XMeo
   bqQxMsbzW+40xpqurJgj0AWEsxn9vgdkKebIcu4QMMS93BxwyaknD4+A2
   Uq3dnRNXviY4FD74bg4vs6HOxVIBwNSHcy9ZcNIokPhXuZ9i7JE2rNwXX
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="257583573"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; 
   d="scan'208";a="257583573"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2022 12:41:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; 
   d="scan'208";a="543358439"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 21 Mar 2022 12:41:30 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nWNuD-000I67-AQ; Mon, 21 Mar 2022 19:41:29 +0000
Date: Tue, 22 Mar 2022 03:40:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, jani.nikula@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 5/7] drm/i915/dmc: abstract GPU error
 state dump
Message-ID: <202203220303.d9et6XXb-lkp@intel.com>
References: <2600c34a1a295456ed87fa64953a4530b0c001d2.1647870374.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2600c34a1a295456ed87fa64953a4530b0c001d2.1647870374.git.jani.nikula@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Jani,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]
[cannot apply to drm-intel/for-linux-next v5.17 next-20220321]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jani-Nikula/drm-i915-dmc-cleanups/20220321-215213
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-randconfig-a006-20220321 (https://download.01.org/0day-ci/archive/20220322/202203220303.d9et6XXb-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 85e9b2687a13d1908aa86d1b89c5ce398a06cd39)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/1e23e4b2519941d741e3489536b37823cece69d8
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jani-Nikula/drm-i915-dmc-cleanups/20220321-215213
        git checkout 1e23e4b2519941d741e3489536b37823cece69d8
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_dmc.c:822:2: error: implicit declaration of function 'i915_error_printf' [-Werror,-Wimplicit-function-declaration]
           i915_error_printf(m, "DMC loaded: %s\n",
           ^
   1 error generated.


vim +/i915_error_printf +822 drivers/gpu/drm/i915/display/intel_dmc.c

   813	
   814	void intel_dmc_print_error_state(struct drm_i915_error_state_buf *m,
   815					 struct drm_i915_private *i915)
   816	{
   817		struct intel_dmc *dmc = &i915->dmc;
   818	
   819		if (!HAS_DMC(i915))
   820			return;
   821	
 > 822		i915_error_printf(m, "DMC loaded: %s\n",
   823				  str_yes_no(intel_dmc_has_payload(i915)));
   824		i915_error_printf(m, "DMC fw version: %d.%d\n",
   825				  DMC_VERSION_MAJOR(dmc->version),
   826				  DMC_VERSION_MINOR(dmc->version));
   827	}
   828	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
