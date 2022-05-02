Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F20015A9
	for <llvm@lists.linux.dev>; Mon,  2 May 2022 00:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651452166; x=1682988166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EHnVq/zbWlRkSGLV5OMsmMleGi2LkOsdxjON4FKrBas=;
  b=MciLB46TT4iBp2Qki/OYBsSiq6MbQ4xVIuKT0jpsgrh4WS+Qk/hiro4B
   YqRh7RjgQmNU/JcjJAlk/kQaF1kZmtkm/SfhNplNOzbV0t8unk+THOWq3
   EyTZeMjRV/d8iNSJYK1jWCXD2ay8FdtbsaalimWsAQsvPm9CAnZEA1j/O
   pfNFapXspraJwnxKuPV+M7tTZHaxtoo9kW0d47QUqWIvMUmk07Ih2pjuJ
   sp0TcUqWq7mMZNarysSSQAYuRhe/rJa9k7oByDXzZlCcCwk4kM1mEdB10
   dEE89LlfxHoxlmKUQkSQWjzFhn5DyEyBpjk89rvYM+CsnnVWmV28rLLa6
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="267244799"
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="267244799"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2022 17:42:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="689121636"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 01 May 2022 17:42:43 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nlK9C-0009AB-PV;
	Mon, 02 May 2022 00:42:42 +0000
Date: Mon, 2 May 2022 08:41:58 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [linux-next:master 2756/7959]
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:276:20: error: call to
 undeclared function 'sysfs_gt_attribute_r_max_func'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202205020853.CQCkKyFc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Joonas,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5469f0c06732a077c70a759a81f2a1f00b277694
commit: c16c8bfa09d5f318c1bd65698d058d3739970c24 [2756/7959] Merge drm/drm-next into drm-intel-gt-next
config: i386-randconfig-a013-20220502 (https://download.01.org/0day-ci/archive/20220502/202205020853.CQCkKyFc-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 09325d36061e42b495d1f4c7e933e260eac260ed)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=c16c8bfa09d5f318c1bd65698d058d3739970c24
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout c16c8bfa09d5f318c1bd65698d058d3739970c24
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:276:20: error: call to undeclared function 'sysfs_gt_attribute_r_max_func'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           u32 actual_freq = sysfs_gt_attribute_r_max_func(dev, attr,
                             ^
   drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:290:17: error: call to undeclared function 'sysfs_gt_attribute_r_max_func'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           u32 cur_freq = sysfs_gt_attribute_r_max_func(dev, attr,
                          ^
   drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:305:19: error: call to undeclared function 'sysfs_gt_attribute_r_max_func'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           u32 boost_freq = sysfs_gt_attribute_r_max_func(dev, attr,
                            ^
>> drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:327:9: error: call to undeclared function 'sysfs_gt_attribute_w_func'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return sysfs_gt_attribute_w_func(dev, attr,
                  ^
   drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:339:17: error: call to undeclared function 'sysfs_gt_attribute_r_max_func'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           u32 rp0_freq = sysfs_gt_attribute_r_max_func(dev, attr,
                          ^
   drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:353:17: error: call to undeclared function 'sysfs_gt_attribute_r_max_func'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           u32 rp1_freq = sysfs_gt_attribute_r_max_func(dev, attr,
                          ^
   drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:367:17: error: call to undeclared function 'sysfs_gt_attribute_r_max_func'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           u32 rpn_freq = sysfs_gt_attribute_r_max_func(dev, attr,
                          ^
   drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:381:17: error: call to undeclared function 'sysfs_gt_attribute_r_max_func'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           u32 max_freq = sysfs_gt_attribute_r_max_func(dev, attr,
                          ^
   drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:403:8: error: call to undeclared function 'sysfs_gt_attribute_w_func'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           ret = sysfs_gt_attribute_w_func(dev, attr, __set_max_freq, val);
                 ^
>> drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:416:17: error: call to undeclared function 'sysfs_gt_attribute_r_min_func'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           u32 min_freq = sysfs_gt_attribute_r_min_func(dev, attr,
                          ^
   drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:438:8: error: call to undeclared function 'sysfs_gt_attribute_w_func'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           ret = sysfs_gt_attribute_w_func(dev, attr, __set_min_freq, val);
                 ^
   drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:453:17: error: call to undeclared function 'sysfs_gt_attribute_r_max_func'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           u32 rpe_freq = sysfs_gt_attribute_r_max_func(dev, attr,
                          ^
   12 errors generated.


vim +/sysfs_gt_attribute_r_max_func +276 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c

56a709cf77468e Andi Shyti 2022-03-19  272  
56a709cf77468e Andi Shyti 2022-03-19  273  static ssize_t act_freq_mhz_show(struct device *dev,
56a709cf77468e Andi Shyti 2022-03-19  274  				 struct device_attribute *attr, char *buff)
56a709cf77468e Andi Shyti 2022-03-19  275  {
56a709cf77468e Andi Shyti 2022-03-19 @276  	u32 actual_freq = sysfs_gt_attribute_r_max_func(dev, attr,
56a709cf77468e Andi Shyti 2022-03-19  277  						    __act_freq_mhz_show);
56a709cf77468e Andi Shyti 2022-03-19  278  
56a709cf77468e Andi Shyti 2022-03-19  279  	return sysfs_emit(buff, "%u\n", actual_freq);
56a709cf77468e Andi Shyti 2022-03-19  280  }
56a709cf77468e Andi Shyti 2022-03-19  281  
56a709cf77468e Andi Shyti 2022-03-19  282  static u32 __cur_freq_mhz_show(struct intel_gt *gt)
56a709cf77468e Andi Shyti 2022-03-19  283  {
56a709cf77468e Andi Shyti 2022-03-19  284  	return intel_rps_get_requested_frequency(&gt->rps);
56a709cf77468e Andi Shyti 2022-03-19  285  }
56a709cf77468e Andi Shyti 2022-03-19  286  
56a709cf77468e Andi Shyti 2022-03-19  287  static ssize_t cur_freq_mhz_show(struct device *dev,
56a709cf77468e Andi Shyti 2022-03-19  288  				 struct device_attribute *attr, char *buff)
56a709cf77468e Andi Shyti 2022-03-19  289  {
56a709cf77468e Andi Shyti 2022-03-19  290  	u32 cur_freq = sysfs_gt_attribute_r_max_func(dev, attr,
56a709cf77468e Andi Shyti 2022-03-19  291  						 __cur_freq_mhz_show);
56a709cf77468e Andi Shyti 2022-03-19  292  
56a709cf77468e Andi Shyti 2022-03-19  293  	return sysfs_emit(buff, "%u\n", cur_freq);
56a709cf77468e Andi Shyti 2022-03-19  294  }
56a709cf77468e Andi Shyti 2022-03-19  295  
56a709cf77468e Andi Shyti 2022-03-19  296  static u32 __boost_freq_mhz_show(struct intel_gt *gt)
56a709cf77468e Andi Shyti 2022-03-19  297  {
56a709cf77468e Andi Shyti 2022-03-19  298  	return intel_rps_get_boost_frequency(&gt->rps);
56a709cf77468e Andi Shyti 2022-03-19  299  }
56a709cf77468e Andi Shyti 2022-03-19  300  
56a709cf77468e Andi Shyti 2022-03-19  301  static ssize_t boost_freq_mhz_show(struct device *dev,
56a709cf77468e Andi Shyti 2022-03-19  302  				   struct device_attribute *attr,
56a709cf77468e Andi Shyti 2022-03-19  303  				   char *buff)
56a709cf77468e Andi Shyti 2022-03-19  304  {
56a709cf77468e Andi Shyti 2022-03-19  305  	u32 boost_freq = sysfs_gt_attribute_r_max_func(dev, attr,
56a709cf77468e Andi Shyti 2022-03-19  306  						   __boost_freq_mhz_show);
56a709cf77468e Andi Shyti 2022-03-19  307  
56a709cf77468e Andi Shyti 2022-03-19  308  	return sysfs_emit(buff, "%u\n", boost_freq);
56a709cf77468e Andi Shyti 2022-03-19  309  }
56a709cf77468e Andi Shyti 2022-03-19  310  
56a709cf77468e Andi Shyti 2022-03-19  311  static int __boost_freq_mhz_store(struct intel_gt *gt, u32 val)
56a709cf77468e Andi Shyti 2022-03-19  312  {
56a709cf77468e Andi Shyti 2022-03-19  313  	return intel_rps_set_boost_frequency(&gt->rps, val);
56a709cf77468e Andi Shyti 2022-03-19  314  }
56a709cf77468e Andi Shyti 2022-03-19  315  
56a709cf77468e Andi Shyti 2022-03-19  316  static ssize_t boost_freq_mhz_store(struct device *dev,
56a709cf77468e Andi Shyti 2022-03-19  317  				    struct device_attribute *attr,
56a709cf77468e Andi Shyti 2022-03-19  318  				    const char *buff, size_t count)
56a709cf77468e Andi Shyti 2022-03-19  319  {
56a709cf77468e Andi Shyti 2022-03-19  320  	ssize_t ret;
56a709cf77468e Andi Shyti 2022-03-19  321  	u32 val;
56a709cf77468e Andi Shyti 2022-03-19  322  
56a709cf77468e Andi Shyti 2022-03-19  323  	ret = kstrtou32(buff, 0, &val);
56a709cf77468e Andi Shyti 2022-03-19  324  	if (ret)
56a709cf77468e Andi Shyti 2022-03-19  325  		return ret;
56a709cf77468e Andi Shyti 2022-03-19  326  
56a709cf77468e Andi Shyti 2022-03-19 @327  	return sysfs_gt_attribute_w_func(dev, attr,
56a709cf77468e Andi Shyti 2022-03-19  328  					 __boost_freq_mhz_store, val) ?: count;
56a709cf77468e Andi Shyti 2022-03-19  329  }
56a709cf77468e Andi Shyti 2022-03-19  330  
56a709cf77468e Andi Shyti 2022-03-19  331  static u32 __rp0_freq_mhz_show(struct intel_gt *gt)
56a709cf77468e Andi Shyti 2022-03-19  332  {
56a709cf77468e Andi Shyti 2022-03-19  333  	return intel_rps_get_rp0_frequency(&gt->rps);
56a709cf77468e Andi Shyti 2022-03-19  334  }
56a709cf77468e Andi Shyti 2022-03-19  335  
56a709cf77468e Andi Shyti 2022-03-19  336  static ssize_t RP0_freq_mhz_show(struct device *dev,
56a709cf77468e Andi Shyti 2022-03-19  337  				 struct device_attribute *attr, char *buff)
56a709cf77468e Andi Shyti 2022-03-19  338  {
56a709cf77468e Andi Shyti 2022-03-19  339  	u32 rp0_freq = sysfs_gt_attribute_r_max_func(dev, attr,
56a709cf77468e Andi Shyti 2022-03-19  340  						     __rp0_freq_mhz_show);
56a709cf77468e Andi Shyti 2022-03-19  341  
56a709cf77468e Andi Shyti 2022-03-19  342  	return sysfs_emit(buff, "%u\n", rp0_freq);
56a709cf77468e Andi Shyti 2022-03-19  343  }
56a709cf77468e Andi Shyti 2022-03-19  344  
56a709cf77468e Andi Shyti 2022-03-19  345  static u32 __rp1_freq_mhz_show(struct intel_gt *gt)
56a709cf77468e Andi Shyti 2022-03-19  346  {
56a709cf77468e Andi Shyti 2022-03-19  347  	return intel_rps_get_rp1_frequency(&gt->rps);
56a709cf77468e Andi Shyti 2022-03-19  348  }
56a709cf77468e Andi Shyti 2022-03-19  349  
56a709cf77468e Andi Shyti 2022-03-19  350  static ssize_t RP1_freq_mhz_show(struct device *dev,
56a709cf77468e Andi Shyti 2022-03-19  351  				 struct device_attribute *attr, char *buff)
56a709cf77468e Andi Shyti 2022-03-19  352  {
56a709cf77468e Andi Shyti 2022-03-19  353  	u32 rp1_freq = sysfs_gt_attribute_r_max_func(dev, attr,
56a709cf77468e Andi Shyti 2022-03-19  354  						     __rp1_freq_mhz_show);
56a709cf77468e Andi Shyti 2022-03-19  355  
56a709cf77468e Andi Shyti 2022-03-19  356  	return sysfs_emit(buff, "%u\n", rp1_freq);
56a709cf77468e Andi Shyti 2022-03-19  357  }
56a709cf77468e Andi Shyti 2022-03-19  358  
56a709cf77468e Andi Shyti 2022-03-19  359  static u32 __rpn_freq_mhz_show(struct intel_gt *gt)
56a709cf77468e Andi Shyti 2022-03-19  360  {
56a709cf77468e Andi Shyti 2022-03-19  361  	return intel_rps_get_rpn_frequency(&gt->rps);
56a709cf77468e Andi Shyti 2022-03-19  362  }
56a709cf77468e Andi Shyti 2022-03-19  363  
56a709cf77468e Andi Shyti 2022-03-19  364  static ssize_t RPn_freq_mhz_show(struct device *dev,
56a709cf77468e Andi Shyti 2022-03-19  365  				 struct device_attribute *attr, char *buff)
56a709cf77468e Andi Shyti 2022-03-19  366  {
56a709cf77468e Andi Shyti 2022-03-19  367  	u32 rpn_freq = sysfs_gt_attribute_r_max_func(dev, attr,
56a709cf77468e Andi Shyti 2022-03-19  368  						     __rpn_freq_mhz_show);
56a709cf77468e Andi Shyti 2022-03-19  369  
56a709cf77468e Andi Shyti 2022-03-19  370  	return sysfs_emit(buff, "%u\n", rpn_freq);
56a709cf77468e Andi Shyti 2022-03-19  371  }
56a709cf77468e Andi Shyti 2022-03-19  372  
56a709cf77468e Andi Shyti 2022-03-19  373  static u32 __max_freq_mhz_show(struct intel_gt *gt)
56a709cf77468e Andi Shyti 2022-03-19  374  {
56a709cf77468e Andi Shyti 2022-03-19  375  	return intel_rps_get_max_frequency(&gt->rps);
56a709cf77468e Andi Shyti 2022-03-19  376  }
56a709cf77468e Andi Shyti 2022-03-19  377  
56a709cf77468e Andi Shyti 2022-03-19  378  static ssize_t max_freq_mhz_show(struct device *dev,
56a709cf77468e Andi Shyti 2022-03-19  379  				 struct device_attribute *attr, char *buff)
56a709cf77468e Andi Shyti 2022-03-19  380  {
56a709cf77468e Andi Shyti 2022-03-19  381  	u32 max_freq = sysfs_gt_attribute_r_max_func(dev, attr,
56a709cf77468e Andi Shyti 2022-03-19  382  						     __max_freq_mhz_show);
56a709cf77468e Andi Shyti 2022-03-19  383  
56a709cf77468e Andi Shyti 2022-03-19  384  	return sysfs_emit(buff, "%u\n", max_freq);
56a709cf77468e Andi Shyti 2022-03-19  385  }
56a709cf77468e Andi Shyti 2022-03-19  386  
56a709cf77468e Andi Shyti 2022-03-19  387  static int __set_max_freq(struct intel_gt *gt, u32 val)
56a709cf77468e Andi Shyti 2022-03-19  388  {
56a709cf77468e Andi Shyti 2022-03-19  389  	return intel_rps_set_max_frequency(&gt->rps, val);
56a709cf77468e Andi Shyti 2022-03-19  390  }
56a709cf77468e Andi Shyti 2022-03-19  391  
56a709cf77468e Andi Shyti 2022-03-19  392  static ssize_t max_freq_mhz_store(struct device *dev,
56a709cf77468e Andi Shyti 2022-03-19  393  				  struct device_attribute *attr,
56a709cf77468e Andi Shyti 2022-03-19  394  				  const char *buff, size_t count)
56a709cf77468e Andi Shyti 2022-03-19  395  {
56a709cf77468e Andi Shyti 2022-03-19  396  	int ret;
56a709cf77468e Andi Shyti 2022-03-19  397  	u32 val;
56a709cf77468e Andi Shyti 2022-03-19  398  
56a709cf77468e Andi Shyti 2022-03-19  399  	ret = kstrtou32(buff, 0, &val);
56a709cf77468e Andi Shyti 2022-03-19  400  	if (ret)
56a709cf77468e Andi Shyti 2022-03-19  401  		return ret;
56a709cf77468e Andi Shyti 2022-03-19  402  
56a709cf77468e Andi Shyti 2022-03-19  403  	ret = sysfs_gt_attribute_w_func(dev, attr, __set_max_freq, val);
56a709cf77468e Andi Shyti 2022-03-19  404  
56a709cf77468e Andi Shyti 2022-03-19  405  	return ret ?: count;
56a709cf77468e Andi Shyti 2022-03-19  406  }
56a709cf77468e Andi Shyti 2022-03-19  407  
56a709cf77468e Andi Shyti 2022-03-19  408  static u32 __min_freq_mhz_show(struct intel_gt *gt)
56a709cf77468e Andi Shyti 2022-03-19  409  {
56a709cf77468e Andi Shyti 2022-03-19  410  	return intel_rps_get_min_frequency(&gt->rps);
56a709cf77468e Andi Shyti 2022-03-19  411  }
56a709cf77468e Andi Shyti 2022-03-19  412  
56a709cf77468e Andi Shyti 2022-03-19  413  static ssize_t min_freq_mhz_show(struct device *dev,
56a709cf77468e Andi Shyti 2022-03-19  414  				 struct device_attribute *attr, char *buff)
56a709cf77468e Andi Shyti 2022-03-19  415  {
56a709cf77468e Andi Shyti 2022-03-19 @416  	u32 min_freq = sysfs_gt_attribute_r_min_func(dev, attr,
56a709cf77468e Andi Shyti 2022-03-19  417  						     __min_freq_mhz_show);
56a709cf77468e Andi Shyti 2022-03-19  418  
56a709cf77468e Andi Shyti 2022-03-19  419  	return sysfs_emit(buff, "%u\n", min_freq);
56a709cf77468e Andi Shyti 2022-03-19  420  }
56a709cf77468e Andi Shyti 2022-03-19  421  

:::::: The code at line 276 was first introduced by commit
:::::: 56a709cf77468e3a422b0ce3d58f8c2257bac2f1 drm/i915/gt: Create per-tile RPS sysfs interfaces

:::::: TO: Andi Shyti <andi.shyti@linux.intel.com>
:::::: CC: Matthew Auld <matthew.auld@intel.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
