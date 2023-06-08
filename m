Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04F61DCDC;
	Thu,  8 Jun 2023 20:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686257862; x=1717793862;
  h=date:from:cc:subject:message-id:mime-version;
  bh=4t1JQuSRc8eOdebxBpeFtzPQlHcz4PNI0fh+jWtZg8o=;
  b=FZYkoioBobcP/c7jpZ2o1rMRw5azHL9AXO5j6sw9EglOebx6t4guVRx9
   hgSlLfCkv0gA+9RHmbP9GDM9Pu2KjC2ErQ//yCvwU8sv4GMyDLHGeXfJz
   sYvTbyqNMRNHSZ4Go5+kmRmVsI6uCqc9l1YKPPke/VmUXGUNCSlLiyipU
   47M0jXZK4mIaH7hA9MHB0Blf/XlQX5mWKfJKo8uFb1ubji+VYsNmYewHL
   HwZDQ3nhpUcjJocCtwwq0Sg0p3yAo1uMwzOgrht93s1ORrQ1Ns61WP8g+
   9zpC21uJZBgsALj+UP6pxQiK+P4FPNaV6WygUMBQ/vFNzTHLgfVe9ihW9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="359915015"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="359915015"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 13:57:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="780045336"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="780045336"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 08 Jun 2023 13:57:39 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7MhO-0008G8-2l;
	Thu, 08 Jun 2023 20:57:38 +0000
Date: Fri, 9 Jun 2023 04:57:34 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH] rtc: rv3028: Improve trickle charger logic
Message-ID: <202306090421.91eXRy6m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <20230608090446.2899646-1-andrej.picej@norik.com>
References: <20230608090446.2899646-1-andrej.picej@norik.com>
TO: Andrej Picej <andrej.picej@norik.com>
TO: a.zummo@towertech.it
TO: alexandre.belloni@bootlin.com
CC: linux-rtc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: upstream@phytec.de

Hi Andrej,

kernel test robot noticed the following build warnings:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on linus/master v6.4-rc5 next-20230608]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrej-Picej/rtc-rv3028-Improve-trickle-charger-logic/20230608-190234
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20230608090446.2899646-1-andrej.picej%40norik.com
patch subject: [PATCH] rtc: rv3028: Improve trickle charger logic
config: x86_64-randconfig-a015-20230608 (https://download.01.org/0day-ci/archive/20230609/202306090421.91eXRy6m-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add abelloni https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git
        git fetch abelloni rtc-next
        git checkout abelloni/rtc-next
        b4 shazam https://lore.kernel.org/r/20230608090446.2899646-1-andrej.picej@norik.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306090421.91eXRy6m-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/rtc/rtc-rv3028.c:959:7: warning: variable 'val' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
                   if (i < ARRAY_SIZE(rv3028_trickle_resistors)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-rv3028.c:968:17: note: uninitialized use occurs here
           if (val_old != val) {
                          ^~~
   drivers/rtc/rtc-rv3028.c:959:3: note: remove the 'if' if its condition is always true
                   if (i < ARRAY_SIZE(rv3028_trickle_resistors)) {
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-rv3028.c:863:18: note: initialize the variable 'val' to silence this warning
           int val_old, val;
                           ^
                            = 0
   1 warning generated.
>> drivers/rtc/rtc-rv3028.o: warning: objtool: rv3028_probe() falls through to next function rv3028_nvram_read()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
