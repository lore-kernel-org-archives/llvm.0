Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC52023DB;
	Tue, 13 Jun 2023 14:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686667204; x=1718203204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O04xgOWnl7c7B5L/0wKgOWkmzrJ2hmKIs/j/NCTnWZI=;
  b=jTponp1MLZFBT8Hid8aWQ9LKzGrICQ6eWyJXk6nkwXon/npRy7+Ju0pV
   Ix85PakL7GcypeNnLdD5JBzhV94vbxpzxPpStQ9J3o8QMmPyYlCe82rHK
   DDWIi7UvvyZNvX/Yc595Ix2JNFVTGTaJ6A1+Z8RUqLd96oLtbQK1YunBB
   88DtsQsjZsb5TEcC4OczcGes5i5yHiFvBqcgTPTY9IBvAFWiC4BbHplck
   KeDbDzVXhu97JfEQ3Xz9d1uLZxQF25JFdAEbu6S53qaBxcsAqllNp+gR6
   9+9+CBYnnBMGutKJLmczM/fuzN5RWbQwE0moxx6um9kZpporjFbz5zks0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="337989748"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="337989748"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 07:40:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="662033818"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="662033818"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 13 Jun 2023 07:40:01 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q95Bh-0001Qp-05;
	Tue, 13 Jun 2023 14:40:01 +0000
Date: Tue, 13 Jun 2023 22:39:01 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Christian Brauner <brauner@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>
Subject: [linux-next:master 2238/9385]
 drivers/gpu/drm/i915/display/intel_display_power.h:256:70: error:
 declaration of 'struct seq_file' will not be visible outside of this
 function
Message-ID: <202306132237.Z4LJE8bP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1f6ce8392d6ff486af5ca96df9ded5882c4b6977
commit: ef104443bffa004f631729dfc924f0b84abbd602 [2238/9385] procfs: consolidate arch_report_meminfo declaration
config: x86_64-randconfig-r036-20230612 (https://download.01.org/0day-ci/archive/20230613/202306132237.Z4LJE8bP-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ef104443bffa004f631729dfc924f0b84abbd602
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout ef104443bffa004f631729dfc924f0b84abbd602
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306132237.Z4LJE8bP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:4:
   In file included from drivers/gpu/drm/i915/display/intel_display_power_well.h:10:
>> drivers/gpu/drm/i915/display/intel_display_power.h:256:70: error: declaration of 'struct seq_file' will not be visible outside of this function [-Werror,-Wvisibility]
   void intel_display_power_debug(struct drm_i915_private *i915, struct seq_file *m);
                                                                        ^
   1 error generated.


vim +256 drivers/gpu/drm/i915/display/intel_display_power.h

6979cb9a2cb41f Imre Deak   2020-12-01  255  
6abf2fc0072b02 Jani Nikula 2021-11-16 @256  void intel_display_power_debug(struct drm_i915_private *i915, struct seq_file *m);
6abf2fc0072b02 Jani Nikula 2021-11-16  257  

:::::: The code at line 256 was first introduced by commit
:::::: 6abf2fc0072b020cdbb9124ea935603b02502e6c drm/i915/debugfs: move debug printing to intel_display_power.c

:::::: TO: Jani Nikula <jani.nikula@intel.com>
:::::: CC: Jani Nikula <jani.nikula@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
