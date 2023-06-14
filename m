Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B4064F;
	Wed, 14 Jun 2023 12:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686746639; x=1718282639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WMzh0UyKzKusIpL0x7LqWzwpBY3QmVDJEW910AUFGj0=;
  b=SSXbDail0uUCUihjeJ8SR+9XkqlMeZXJTKDD/9O9l9IVHPf69IPxyEr9
   GWRAscQiKWmYmRfmErhvrr0Qf8P4HMBS5Gmg8Hd6qyIi0mLIbxgKagqjk
   OZ89ukUq+UX43F/wBT/vytWLbGN//x4SMCikuZe3cXlEfDbzzh9hQSR6u
   t72zcB/cSq3ZTMQmDduYj0Q0BwgBoIiYndEnGZ5RZvO89+ikAsYo3vHQE
   y5wLgoRV2nYrTdGXR9AdnmUaJXssCOauXSH+8zrtsduVpkRkhWWBMX3wv
   nIWsIpq0qZ+NIisWlZPRqsiw0393eOXH4EfLPjj8v7+5ln4yTFkpnjNQu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="387008444"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
   d="scan'208";a="387008444"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 05:43:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="777228644"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
   d="scan'208";a="777228644"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 14 Jun 2023 05:43:57 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9Pqn-0000dv-1X;
	Wed, 14 Jun 2023 12:43:51 +0000
Date: Wed, 14 Jun 2023 20:43:28 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andi Shyti <andi.shyti@linux.intel.com>
Subject: [linux-next:master 5726/9793]
 drivers/gpu/drm/i915/i915_driver.c:1806:17: error: use of undeclared
 identifier 'i915_drm_client_fdinfo'
Message-ID: <202306142023.vjEaFkk5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b16049b21162bb649cdd8519642a35972b7910fe
commit: e894b724c316d9b45d963f929c97578cdffbbe8d [5726/9793] drm/i915: Use the fdinfo helper
config: x86_64-buildonly-randconfig-r006-20230614 (https://download.01.org/0day-ci/archive/20230614/202306142023.vjEaFkk5-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=e894b724c316d9b45d963f929c97578cdffbbe8d
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout e894b724c316d9b45d963f929c97578cdffbbe8d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306142023.vjEaFkk5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/i915_driver.c:1806:17: error: use of undeclared identifier 'i915_drm_client_fdinfo'
           .show_fdinfo = i915_drm_client_fdinfo,
                          ^
   1 error generated.


vim +/i915_drm_client_fdinfo +1806 drivers/gpu/drm/i915/i915_driver.c

  1793	
  1794	static const struct drm_driver i915_drm_driver = {
  1795		/* Don't use MTRRs here; the Xserver or userspace app should
  1796		 * deal with them for Intel hardware.
  1797		 */
  1798		.driver_features =
  1799		    DRIVER_GEM |
  1800		    DRIVER_RENDER | DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_SYNCOBJ |
  1801		    DRIVER_SYNCOBJ_TIMELINE,
  1802		.release = i915_driver_release,
  1803		.open = i915_driver_open,
  1804		.lastclose = i915_driver_lastclose,
  1805		.postclose = i915_driver_postclose,
> 1806		.show_fdinfo = i915_drm_client_fdinfo,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
