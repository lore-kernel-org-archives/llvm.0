Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9D710FF
	for <llvm@lists.linux.dev>; Wed, 22 Jun 2022 06:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655878597; x=1687414597;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7cztiAQBKPIybAnoNLvePrR/jpDzqYbkX/XFOAT39SE=;
  b=Lj+i4oyivb6LHZKVNGFgDur5U2u89scDr7pfOMKhWsV9t9e2I4xIE8Uy
   qW/JY9wWZqwtNKEVaQ7FUmhvt7l54DuG+j0wSfIfT+25W7ytIDOvT+AQJ
   mWOXsZL/cAX5WPUjbDZFUhOhPbH1BjViKQtEBHa98hKDo3CjOnbjHF1Nu
   IShLHFneTp0nwsSs7G6mfPWFGF2YTc45YlPT3fdWhp+tLL929q3UMagxD
   qgANlbRAi2KY7Zi8FeJin7Pq2iCWIMpi2L3JB/jIuUvokT93AvqfRNR9k
   NFApOetdNsd3xtqBBtIwcNVHRZuXEt1P6rgXob3ZMBcTQFTeqCD5Pisv6
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="305775161"
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; 
   d="scan'208";a="305775161"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 23:16:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; 
   d="scan'208";a="587252070"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 21 Jun 2022 23:16:35 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o3tfG-0000vC-BX;
	Wed, 22 Jun 2022 06:16:34 +0000
Date: Wed, 22 Jun 2022 14:16:09 +0800
From: kernel test robot <lkp@intel.com>
To: Vadim Fedorenko <vfedorenko@novek.ru>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 3/3] ptp_ocp: implement DPLL ops
Message-ID: <202206221441.9L8YTI3Y-lkp@intel.com>
References: <20220622000651.27299-4-vfedorenko@novek.ru>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220622000651.27299-4-vfedorenko@novek.ru>

Hi Vadim,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linus/master]
[also build test WARNING on v5.19-rc3 next-20220621]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Vadim-Fedorenko/Create-common-DPLL-clock-configuration-API/20220622-080746
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git ca1fdab7fd27eb069df1384b2850dcd0c2bebe8d
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220622/202206221441.9L8YTI3Y-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 8b8d126598ce7bd5243da7f94f69fa1104288bee)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/bb2b52ab297193cfb419e71db72823a36b11e031
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vadim-Fedorenko/Create-common-DPLL-clock-configuration-API/20220622-080746
        git checkout bb2b52ab297193cfb419e71db72823a36b11e031
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/dpll/ drivers/ptp/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/dpll/dpll_netlink.c:227:28: error: use of undeclared identifier 'id'
           dpll_notify_source_change(id, src_id, type);
                                     ^
   drivers/dpll/dpll_netlink.c:252:28: error: use of undeclared identifier 'id'
           dpll_notify_source_change(id, out_id, type);
                                     ^
>> drivers/dpll/dpll_netlink.c:580:13: warning: no previous prototype for function 'dpll_netlink_fini' [-Wmissing-prototypes]
   void __exit dpll_netlink_fini(void)
               ^
   drivers/dpll/dpll_netlink.c:580:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __exit dpll_netlink_fini(void)
   ^
   static 
   1 warning and 2 errors generated.
--
   drivers/ptp/ptp_ocp.c:3721:45: error: incomplete definition of type 'struct dpll_device'
           struct ptp_ocp *bp = (struct ptp_ocp *)dpll->priv;
                                                  ~~~~^
   drivers/ptp/ptp_ocp.c:339:9: note: forward declaration of 'struct dpll_device'
           struct dpll_device *dpll;
                  ^
   drivers/ptp/ptp_ocp.c:3730:45: error: incomplete definition of type 'struct dpll_device'
           struct ptp_ocp *bp = (struct ptp_ocp *)dpll->priv;
                                                  ~~~~^
   drivers/ptp/ptp_ocp.c:339:9: note: forward declaration of 'struct dpll_device'
           struct dpll_device *dpll;
                  ^
   drivers/ptp/ptp_ocp.c:3739:45: error: incomplete definition of type 'struct dpll_device'
           struct ptp_ocp *bp = (struct ptp_ocp *)dpll->priv;
                                                  ~~~~^
   drivers/ptp/ptp_ocp.c:339:9: note: forward declaration of 'struct dpll_device'
           struct dpll_device *dpll;
                  ^
   drivers/ptp/ptp_ocp.c:3763:45: error: incomplete definition of type 'struct dpll_device'
           struct ptp_ocp *bp = (struct ptp_ocp *)dpll->priv;
                                                  ~~~~^
   drivers/ptp/ptp_ocp.c:339:9: note: forward declaration of 'struct dpll_device'
           struct dpll_device *dpll;
                  ^
>> drivers/ptp/ptp_ocp.c:3787:31: warning: tentative definition of variable with internal linkage has incomplete non-array type 'struct dpll_device_ops' [-Wtentative-definition-incomplete-type]
   static struct dpll_device_ops ptp_ocp_dpll_ops {
                                 ^
   drivers/ptp/ptp_ocp.c:3787:15: note: forward declaration of 'struct dpll_device_ops'
   static struct dpll_device_ops ptp_ocp_dpll_ops {
                 ^
   drivers/ptp/ptp_ocp.c:3787:47: error: expected ';' after top level declarator
   static struct dpll_device_ops ptp_ocp_dpll_ops {
                                                 ^
                                                 ;
   drivers/ptp/ptp_ocp.c:3850:13: error: call to undeclared function 'dpll_device_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           bp->dpll = dpll_device_alloc(&dpll_ops, ARRAY_SIZE(bp->sma), ARRAY_SIZE(bp->sma));
                      ^
   drivers/ptp/ptp_ocp.c:3850:32: error: use of undeclared identifier 'dpll_ops'
           bp->dpll = dpll_device_alloc(&dpll_ops, ARRAY_SIZE(bp->sma), ARRAY_SIZE(bp->sma));
                                         ^
   drivers/ptp/ptp_ocp.c:3855:2: error: call to undeclared function 'dpll_device_register'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           dpll_device_register(bp->dpll);
           ^
   drivers/ptp/ptp_ocp.c:3855:2: note: did you mean 'device_register'?
   include/linux/device.h:895:18: note: 'device_register' declared here
   int __must_check device_register(struct device *dev);
                    ^
   drivers/ptp/ptp_ocp.c:3787:31: error: tentative definition has type 'struct dpll_device_ops' that is never completed
   static struct dpll_device_ops ptp_ocp_dpll_ops {
                                 ^
   drivers/ptp/ptp_ocp.c:3787:15: note: forward declaration of 'struct dpll_device_ops'
   static struct dpll_device_ops ptp_ocp_dpll_ops {
                 ^
   1 warning and 9 errors generated.


vim +3787 drivers/ptp/ptp_ocp.c

  3786	
> 3787	static struct dpll_device_ops ptp_ocp_dpll_ops {
  3788		.get_status			= ptp_ocp_dpll_get_status;
  3789		.get_lock_status	= ptp_ocp_dpll_get_lock_status;
  3790		.get_source_type	= ptp_ocp_dpll_get_source_type;
  3791		.get_output_type	= ptp_ocp_dpll_get_output_type;
  3792	};
  3793	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
