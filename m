Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B995660;
	Tue,  6 Jun 2023 08:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686038721; x=1717574721;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YZ+BShNVcqwz22yCNfebC9mwpM3gDyllJShjKLtadC4=;
  b=O+4PcqYyJn0oLXqVNURDdK7ytLjoWORkfq60V71kjsqskyKdiS/TAJKg
   QaFPET8ugJuXg+PP/Ag3T4HFioCikj9x7eOaHzS6KpYyBkV4IewWhaZDW
   xamxeRxS0lXxKFbwv9oa+PTaC9+an5W6K7xPaAoeFhqjquvaa4UbLHW2x
   x0GVit8gBn83XeaUYmj7X/uOBPcAY11Ok7N1JETymUNLeD2jVGwSwEVYg
   ItggyjWAHCYWbW/FCnIYKHigVowOvze+pKEanMUxakRR7EUStObOrTMwK
   MfMVuOYLYPNIoEvCl7D42P88Hi+niwqdzBRMLoUMdAr4RSXDbUF61p3lC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="355450688"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="355450688"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 01:05:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="659421681"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="659421681"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 Jun 2023 01:05:06 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6Rgf-00050d-3B;
	Tue, 06 Jun 2023 08:05:05 +0000
Date: Tue, 6 Jun 2023 16:04:45 +0800
From: kernel test robot <lkp@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alan Previn <alan.previn.teres.alexis@intel.com>,
	dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v2 4/5] drm/i915/mtl/gsc: Add a gsc_info
 debugfs
Message-ID: <202306061545.foCGgcsF-lkp@intel.com>
References: <20230606022402.2048235-5-daniele.ceraolospurio@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606022402.2048235-5-daniele.ceraolospurio@intel.com>

Hi Daniele,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniele-Ceraolo-Spurio/drm-i915-gsc-fixes-and-updates-for-GSC-memory-allocation/20230606-102510
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230606022402.2048235-5-daniele.ceraolospurio%40intel.com
patch subject: [Intel-gfx] [PATCH v2 4/5] drm/i915/mtl/gsc: Add a gsc_info debugfs
config: x86_64-randconfig-a014-20230606 (https://download.01.org/0day-ci/archive/20230606/202306061545.foCGgcsF-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add drm-tip git://anongit.freedesktop.org/drm/drm-tip
        git fetch drm-tip drm-tip
        git checkout drm-tip/drm-tip
        b4 shazam https://lore.kernel.org/r/20230606022402.2048235-5-daniele.ceraolospurio@intel.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306061545.foCGgcsF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.c:28:6: error: no previous prototype for function 'intel_gsc_uc_debugfs_register' [-Werror,-Wmissing-prototypes]
   void intel_gsc_uc_debugfs_register(struct intel_gsc_uc *gsc_uc, struct dentry *root)
        ^
   drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.c:28:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void intel_gsc_uc_debugfs_register(struct intel_gsc_uc *gsc_uc, struct dentry *root)
   ^
   static 
   1 error generated.


vim +/intel_gsc_uc_debugfs_register +28 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.c

    27	
  > 28	void intel_gsc_uc_debugfs_register(struct intel_gsc_uc *gsc_uc, struct dentry *root)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
