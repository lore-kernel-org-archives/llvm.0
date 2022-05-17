Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59471874
	for <llvm@lists.linux.dev>; Tue, 17 May 2022 22:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652825426; x=1684361426;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ffg6rv8JZmAM/Vut3zOFIclJ/LXo7tALPpgvXJyK+5c=;
  b=cdZaiIyC4rRKNHbInDJH7xcfkeb7zscdKPGquk+eIxLowXpYSFjK1Yhx
   SHvB6lEUZz4084QY1QhnoFg/GTPKQ3x5kFvRHkJxNTIGzCYG7uGfcbJNH
   yLEk6Z30do7g3jIXDDcg0k+VV1ivno//+7VyaWKVkYJlbvgZG9Qmqe570
   eGNYMLMrqzko/SzGQK9jz1h0O8QZz07yUJn9H9RayGhFZZSyUNdGQEL91
   CUQqvcBzlvBUcZMW74042ZJGZXev0IeFPQ2sGVlrT5JrX/+Q/QN/n+SFE
   AjBd1ly2VwVW05ZUHfgmavXh3Z1B9umDHCGR0oSJl1OuhADoVPpHSmxKx
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="357764264"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="357764264"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2022 15:10:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="700270819"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 17 May 2022 15:10:04 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nr5OG-0001Up-1V;
	Tue, 17 May 2022 22:10:04 +0000
Date: Wed, 18 May 2022 06:09:22 +0800
From: kernel test robot <lkp@intel.com>
To: Sui Chen <suichen@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC Patch v5 1/1] i2c debug counters as sysfs attributes
Message-ID: <202205180518.gLEg6p2y-lkp@intel.com>
References: <20220517100505.2569874-2-suichen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517100505.2569874-2-suichen@google.com>

Hi Sui,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on wsa/i2c/for-next]
[also build test WARNING on linux/master linus/master v5.18-rc7 next-20220517]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Sui-Chen/i2c-core-Adapter-and-client-stats-as-sysfs-attributes/20220517-180857
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
config: i386-randconfig-a003-20220516 (https://download.01.org/0day-ci/archive/20220518/202205180518.gLEg6p2y-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2d26f1bca9ffcd15ddb7ab0bbb596cacd89712ca
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sui-Chen/i2c-core-Adapter-and-client-stats-as-sysfs-attributes/20220517-180857
        git checkout 2d26f1bca9ffcd15ddb7ab0bbb596cacd89712ca
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/i2c/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/i2c/i2c-core-base.c:280:6: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
           int ret = adap->bus_recovery_info->recover_bus(adap);
               ^
>> drivers/i2c/i2c-core-base.c:910:9: warning: no previous prototype for function 'i2c_client_stats_messages_show' [-Wmissing-prototypes]
   ssize_t i2c_client_stats_messages_show(struct kobject *kobj, struct kobj_attribute *addr,
           ^
   drivers/i2c/i2c-core-base.c:910:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   ssize_t i2c_client_stats_messages_show(struct kobject *kobj, struct kobj_attribute *addr,
   ^
   static 
>> drivers/i2c/i2c-core-base.c:922:9: warning: no previous prototype for function 'i2c_client_stats_bus_errors_show' [-Wmissing-prototypes]
   ssize_t i2c_client_stats_bus_errors_show(struct kobject *kobj, struct kobj_attribute *addr,
           ^
   drivers/i2c/i2c-core-base.c:922:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   ssize_t i2c_client_stats_bus_errors_show(struct kobject *kobj, struct kobj_attribute *addr,
   ^
   static 
>> drivers/i2c/i2c-core-base.c:934:9: warning: no previous prototype for function 'i2c_client_stats_nacks_show' [-Wmissing-prototypes]
   ssize_t i2c_client_stats_nacks_show(struct kobject *kobj, struct kobj_attribute *addr,
           ^
   drivers/i2c/i2c-core-base.c:934:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   ssize_t i2c_client_stats_nacks_show(struct kobject *kobj, struct kobj_attribute *addr,
   ^
   static 
>> drivers/i2c/i2c-core-base.c:946:9: warning: no previous prototype for function 'i2c_client_stats_timeouts_show' [-Wmissing-prototypes]
   ssize_t i2c_client_stats_timeouts_show(struct kobject *kobj, struct kobj_attribute *addr,
           ^
   drivers/i2c/i2c-core-base.c:946:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   ssize_t i2c_client_stats_timeouts_show(struct kobject *kobj, struct kobj_attribute *addr,
   ^
   static 
   drivers/i2c/i2c-core-base.c:968:3: error: field designator 'default_attrs' does not refer to any field in type 'struct kobj_type'
           .default_attrs = i2c_client_stats_attrs,
            ^
>> drivers/i2c/i2c-core-base.c:1064:2: warning: ignoring return value of function declared with 'warn_unused_result' attribute [-Wunused-result]
           kobject_init_and_add(&client_stats->kobj, &i2c_client_stats_ktype,
           ^~~~~~~~~~~~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/i2c/i2c-core-base.c:2704:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
           int ret, addr;
               ^
>> drivers/i2c/i2c-core-base.c:2703:7: warning: unused variable 'buf' [-Wunused-variable]
           char buf[32];
                ^
   8 warnings and 1 error generated.
--
>> drivers/i2c/i2c-dev.c:786:9: warning: no previous prototype for function 'bus_errors_show' [-Wmissing-prototypes]
   ssize_t bus_errors_show(struct device *pdev,
           ^
   drivers/i2c/i2c-dev.c:786:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   ssize_t bus_errors_show(struct device *pdev,
   ^
   static 
>> drivers/i2c/i2c-dev.c:793:9: warning: no previous prototype for function 'transfers_show' [-Wmissing-prototypes]
   ssize_t transfers_show(struct device *pdev,
           ^
   drivers/i2c/i2c-dev.c:793:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   ssize_t transfers_show(struct device *pdev,
   ^
   static 
>> drivers/i2c/i2c-dev.c:800:9: warning: no previous prototype for function 'nacks_show' [-Wmissing-prototypes]
   ssize_t nacks_show(struct device *pdev,
           ^
   drivers/i2c/i2c-dev.c:800:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   ssize_t nacks_show(struct device *pdev,
   ^
   static 
>> drivers/i2c/i2c-dev.c:807:9: warning: no previous prototype for function 'recovery_successes_show' [-Wmissing-prototypes]
   ssize_t recovery_successes_show(struct device *pdev,
           ^
   drivers/i2c/i2c-dev.c:807:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   ssize_t recovery_successes_show(struct device *pdev,
   ^
   static 
>> drivers/i2c/i2c-dev.c:814:9: warning: no previous prototype for function 'recovery_failures_show' [-Wmissing-prototypes]
   ssize_t recovery_failures_show(struct device *pdev,
           ^
   drivers/i2c/i2c-dev.c:814:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   ssize_t recovery_failures_show(struct device *pdev,
   ^
   static 
>> drivers/i2c/i2c-dev.c:821:9: warning: no previous prototype for function 'timeouts_show' [-Wmissing-prototypes]
   ssize_t timeouts_show(struct device *pdev,
           ^
   drivers/i2c/i2c-dev.c:821:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   ssize_t timeouts_show(struct device *pdev,
   ^
   static 
   6 warnings generated.


vim +280 drivers/i2c/i2c-core-base.c

   270	
   271	int i2c_recover_bus(struct i2c_adapter *adap)
   272	{
   273		if (!adap->stats)
   274			i2c_adapter_create_stats_directory(adap);
   275	
   276		if (!adap->bus_recovery_info)
   277			return -EBUSY;
   278	
   279		dev_dbg(&adap->dev, "Trying i2c bus recovery\n");
 > 280		int ret = adap->bus_recovery_info->recover_bus(adap);
   281	
   282		if (ret == 0)
   283			++(adap->stats->recovery_successes);
   284		else
   285			++(adap->stats->recovery_failures);
   286	
   287		return ret;
   288	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
