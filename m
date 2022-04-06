Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F354217EC
	for <llvm@lists.linux.dev>; Wed,  6 Apr 2022 07:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649228933; x=1680764933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YAEykZhQeubV6/T1FWzWBRNkYItFcu0WBD+yJ0EJtzY=;
  b=UtqMt1fKgXAqxZ2sFulppkKeCWutaQNYu/0/IpsQKYlz1M1Nm48CMN9s
   mWKtRmAO+qUCrAF2by3Mcq3CRrR1VaXwW0zDy+BQAO55L2KKsI10+Rj5i
   rWrO69Um/dqrZsXZ4i9HW9gtU2QRnnC9F+an4x2rVxcEvUBWG0jTgQtbI
   vlt12+3eTXDjvUM3IhxWrS5+xtHIZNt/OxkZbiuuLhWunSg4wsx4iPiej
   DiujWBMxO2HOMjlkocIRf7EgfheDkXCQxzwxbfOEz0XOm//OoYjfwgIvx
   i/VeqIPyuGtABwrXyVzLfK/FnapQFybHwMWISwgbVwdbF8Lqw71OtGQC/
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="243110572"
X-IronPort-AV: E=Sophos;i="5.90,239,1643702400"; 
   d="scan'208";a="243110572"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2022 00:08:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,239,1643702400"; 
   d="scan'208";a="549422332"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 06 Apr 2022 00:08:51 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nbzmd-0004AL-3p;
	Wed, 06 Apr 2022 07:08:51 +0000
Date: Wed, 6 Apr 2022 15:08:33 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, 0day robot <lkp@intel.com>
Subject: drivers/cxl/core/suspend.c:8:6: warning: no previous prototype for
 function 'cxl_mem_active'
Message-ID: <202204061506.FCv04vZT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/intel-lab-lkp/linux/commits/UPDATE-20220406-100617/Dan-Williams/cxl-mem-Disable-suspend/20220403-085917
head:   16a271eb76b492775d76beb93daa896c53d50b95
commit: 16a271eb76b492775d76beb93daa896c53d50b95 PM: CXL: Disable suspend
date:   5 hours ago
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20220406/202204061506.FCv04vZT-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/16a271eb76b492775d76beb93daa896c53d50b95
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review UPDATE-20220406-100617/Dan-Williams/cxl-mem-Disable-suspend/20220403-085917
        git checkout 16a271eb76b492775d76beb93daa896c53d50b95
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/cxl/core/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/cxl/core/suspend.c:8:6: warning: no previous prototype for function 'cxl_mem_active' [-Wmissing-prototypes]
   bool cxl_mem_active(void)
        ^
   drivers/cxl/core/suspend.c:8:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool cxl_mem_active(void)
   ^
   static 
>> drivers/cxl/core/suspend.c:13:6: warning: no previous prototype for function 'cxl_mem_active_inc' [-Wmissing-prototypes]
   void cxl_mem_active_inc(void)
        ^
   drivers/cxl/core/suspend.c:13:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void cxl_mem_active_inc(void)
   ^
   static 
>> drivers/cxl/core/suspend.c:19:6: warning: no previous prototype for function 'cxl_mem_active_dec' [-Wmissing-prototypes]
   void cxl_mem_active_dec(void)
        ^
   drivers/cxl/core/suspend.c:19:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void cxl_mem_active_dec(void)
   ^
   static 
   3 warnings generated.


vim +/cxl_mem_active +8 drivers/cxl/core/suspend.c

     7	
   > 8	bool cxl_mem_active(void)
     9	{
    10		return atomic_read(&mem_active) != 0;
    11	}
    12	
  > 13	void cxl_mem_active_inc(void)
    14	{
    15		atomic_inc(&mem_active);
    16	}
    17	EXPORT_SYMBOL_NS_GPL(cxl_mem_active_inc, CXL);
    18	
  > 19	void cxl_mem_active_dec(void)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
