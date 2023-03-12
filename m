Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402DF15A0;
	Sun, 12 Mar 2023 05:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678597994; x=1710133994;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v8aXfeyTz6tm5vPZonw1jhwvy0f/MlJD8DSMZJtwbYc=;
  b=EYx7pXCSdKIVVjJP3/0GwhSFEudh5YBL6Vri2DV050aAU/l5sJXRQSCj
   eX7jUeJ1cFbCXAUy0cQTdI3qB1PjDDN6IjVoycsVt3FR/1kTMpZwQymtz
   fyerMLTTmWLx3k+YJLX0MkIhkoTErEgUO5cCVugxQvJ69H0Ko5mnb5EhX
   Hkp7PsMPwHpwSFpYdCSzMcXkIQj8rHsOVuBWZpX0j0Zn9QwMna6IjJ2cv
   qQaXn4Ac2dIl6Kwcn9VS6j10iL77PTdTyI2tixT9Rh5AwzGiaQ74uN6Go
   /q8bjYFDBt0CbY3R/hsBK2tX4VbNrndrBZzFbnZLDQxh7+742mc/HUMZS
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="364620203"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400"; 
   d="scan'208";a="364620203"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 21:13:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="852365372"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400"; 
   d="scan'208";a="852365372"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 11 Mar 2023 21:13:11 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbE19-0004zt-0Y;
	Sun, 12 Mar 2023 05:13:11 +0000
Date: Sun, 12 Mar 2023 13:12:55 +0800
From: kernel test robot <lkp@intel.com>
To: Vadim Fedorenko <vadfed@meta.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v6 6/6] ptp_ocp: implement DPLL ops
Message-ID: <202303121343.kC8XYcdk-lkp@intel.com>
References: <20230312022807.278528-7-vadfed@meta.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230312022807.278528-7-vadfed@meta.com>

Hi Vadim,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linus/master]
[also build test WARNING on v6.3-rc1 next-20230310]
[cannot apply to tnguy-next-queue/dev-queue]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vadim-Fedorenko/dpll-spec-Add-Netlink-spec-in-YAML/20230312-103056
patch link:    https://lore.kernel.org/r/20230312022807.278528-7-vadfed%40meta.com
patch subject: [PATCH RFC v6 6/6] ptp_ocp: implement DPLL ops
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20230312/202303121343.kC8XYcdk-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/fe16623a48f3c6592be80872758c19822b70ae62
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vadim-Fedorenko/dpll-spec-Add-Netlink-spec-in-YAML/20230312-103056
        git checkout fe16623a48f3c6592be80872758c19822b70ae62
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/dpll/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303121343.kC8XYcdk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dpll/dpll_core.c:285:1: warning: no previous prototype for function 'dpll_device_alloc' [-Wmissing-prototypes]
   dpll_device_alloc(const u64 clock_id, u32 dev_driver_id, struct module *module)
   ^
   drivers/dpll/dpll_core.c:284:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct dpll_device *
   ^
   static 
>> drivers/dpll/dpll_core.c:439:1: warning: no previous prototype for function 'dpll_pin_alloc' [-Wmissing-prototypes]
   dpll_pin_alloc(u64 clock_id, u8 device_drv_id,  struct module *module,
   ^
   drivers/dpll/dpll_core.c:438:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct dpll_pin *
   ^
   static 
   2 warnings generated.
--
>> drivers/dpll/dpll_netlink.c:1062:13: warning: no previous prototype for function 'dpll_netlink_fini' [-Wmissing-prototypes]
   void __exit dpll_netlink_fini(void)
               ^
   drivers/dpll/dpll_netlink.c:1062:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __exit dpll_netlink_fini(void)
   ^
   static 
   1 warning generated.


vim +/dpll_device_alloc +285 drivers/dpll/dpll_core.c

55b810a5137d33 Vadim Fedorenko 2023-03-11  269  
55b810a5137d33 Vadim Fedorenko 2023-03-11  270  
55b810a5137d33 Vadim Fedorenko 2023-03-11  271  /**
55b810a5137d33 Vadim Fedorenko 2023-03-11  272   * dpll_device_alloc - allocate the memory for dpll device
55b810a5137d33 Vadim Fedorenko 2023-03-11  273   * @clock_id: clock_id of creator
55b810a5137d33 Vadim Fedorenko 2023-03-11  274   * @dev_driver_id: id given by dev driver
55b810a5137d33 Vadim Fedorenko 2023-03-11  275   * @module: reference to registering module
55b810a5137d33 Vadim Fedorenko 2023-03-11  276   *
55b810a5137d33 Vadim Fedorenko 2023-03-11  277   * Allocates memory and initialize dpll device, hold its reference on global
55b810a5137d33 Vadim Fedorenko 2023-03-11  278   * xarray.
55b810a5137d33 Vadim Fedorenko 2023-03-11  279   *
55b810a5137d33 Vadim Fedorenko 2023-03-11  280   * Return:
55b810a5137d33 Vadim Fedorenko 2023-03-11  281   * * dpll_device struct pointer if succeeded
55b810a5137d33 Vadim Fedorenko 2023-03-11  282   * * ERR_PTR(X) - failed allocation
55b810a5137d33 Vadim Fedorenko 2023-03-11  283   */
55b810a5137d33 Vadim Fedorenko 2023-03-11  284  struct dpll_device *
55b810a5137d33 Vadim Fedorenko 2023-03-11 @285  dpll_device_alloc(const u64 clock_id, u32 dev_driver_id, struct module *module)
55b810a5137d33 Vadim Fedorenko 2023-03-11  286  {
55b810a5137d33 Vadim Fedorenko 2023-03-11  287  	struct dpll_device *dpll;
55b810a5137d33 Vadim Fedorenko 2023-03-11  288  	int ret;
55b810a5137d33 Vadim Fedorenko 2023-03-11  289  
55b810a5137d33 Vadim Fedorenko 2023-03-11  290  	dpll = kzalloc(sizeof(*dpll), GFP_KERNEL);
55b810a5137d33 Vadim Fedorenko 2023-03-11  291  	if (!dpll)
55b810a5137d33 Vadim Fedorenko 2023-03-11  292  		return ERR_PTR(-ENOMEM);
55b810a5137d33 Vadim Fedorenko 2023-03-11  293  	refcount_set(&dpll->refcount, 1);
55b810a5137d33 Vadim Fedorenko 2023-03-11  294  	dpll->dev.class = &dpll_class;
55b810a5137d33 Vadim Fedorenko 2023-03-11  295  	dpll->dev_driver_id = dev_driver_id;
55b810a5137d33 Vadim Fedorenko 2023-03-11  296  	dpll->clock_id = clock_id;
55b810a5137d33 Vadim Fedorenko 2023-03-11  297  	dpll->module = module;
55b810a5137d33 Vadim Fedorenko 2023-03-11  298  	ret = xa_alloc(&dpll_device_xa, &dpll->id, dpll,
55b810a5137d33 Vadim Fedorenko 2023-03-11  299  		       xa_limit_16b, GFP_KERNEL);
55b810a5137d33 Vadim Fedorenko 2023-03-11  300  	if (ret) {
55b810a5137d33 Vadim Fedorenko 2023-03-11  301  		kfree(dpll);
55b810a5137d33 Vadim Fedorenko 2023-03-11  302  		return ERR_PTR(ret);
55b810a5137d33 Vadim Fedorenko 2023-03-11  303  	}
55b810a5137d33 Vadim Fedorenko 2023-03-11  304  	xa_init_flags(&dpll->pin_refs, XA_FLAGS_ALLOC);
55b810a5137d33 Vadim Fedorenko 2023-03-11  305  
55b810a5137d33 Vadim Fedorenko 2023-03-11  306  	return dpll;
55b810a5137d33 Vadim Fedorenko 2023-03-11  307  }
55b810a5137d33 Vadim Fedorenko 2023-03-11  308  
55b810a5137d33 Vadim Fedorenko 2023-03-11  309  /**
55b810a5137d33 Vadim Fedorenko 2023-03-11  310   * dpll_device_get - find existing or create new dpll device
55b810a5137d33 Vadim Fedorenko 2023-03-11  311   * @clock_id: clock_id of creator
55b810a5137d33 Vadim Fedorenko 2023-03-11  312   * @dev_driver_id: id given by dev driver
55b810a5137d33 Vadim Fedorenko 2023-03-11  313   * @module: reference to registering module
55b810a5137d33 Vadim Fedorenko 2023-03-11  314   *
55b810a5137d33 Vadim Fedorenko 2023-03-11  315   * Get existing object of a dpll device, unique for given arguments.
55b810a5137d33 Vadim Fedorenko 2023-03-11  316   * Create new if doesn't exist yet.
55b810a5137d33 Vadim Fedorenko 2023-03-11  317   *
55b810a5137d33 Vadim Fedorenko 2023-03-11  318   * Return:
55b810a5137d33 Vadim Fedorenko 2023-03-11  319   * * valid dpll_device struct pointer if succeeded
55b810a5137d33 Vadim Fedorenko 2023-03-11  320   * * ERR_PTR of an error
55b810a5137d33 Vadim Fedorenko 2023-03-11  321   */
55b810a5137d33 Vadim Fedorenko 2023-03-11  322  struct dpll_device *
55b810a5137d33 Vadim Fedorenko 2023-03-11  323  dpll_device_get(u64 clock_id, u32 dev_driver_id, struct module *module)
55b810a5137d33 Vadim Fedorenko 2023-03-11  324  {
55b810a5137d33 Vadim Fedorenko 2023-03-11  325  	struct dpll_device *dpll, *ret = NULL;
55b810a5137d33 Vadim Fedorenko 2023-03-11  326  	unsigned long index;
55b810a5137d33 Vadim Fedorenko 2023-03-11  327  
55b810a5137d33 Vadim Fedorenko 2023-03-11  328  	mutex_lock(&dpll_device_xa_lock);
55b810a5137d33 Vadim Fedorenko 2023-03-11  329  	xa_for_each(&dpll_device_xa, index, dpll) {
55b810a5137d33 Vadim Fedorenko 2023-03-11  330  		if (dpll->clock_id == clock_id &&
55b810a5137d33 Vadim Fedorenko 2023-03-11  331  		    dpll->dev_driver_id == dev_driver_id &&
55b810a5137d33 Vadim Fedorenko 2023-03-11  332  		    dpll->module == module) {
55b810a5137d33 Vadim Fedorenko 2023-03-11  333  			ret = dpll;
55b810a5137d33 Vadim Fedorenko 2023-03-11  334  			refcount_inc(&ret->refcount);
55b810a5137d33 Vadim Fedorenko 2023-03-11  335  			break;
55b810a5137d33 Vadim Fedorenko 2023-03-11  336  		}
55b810a5137d33 Vadim Fedorenko 2023-03-11  337  	}
55b810a5137d33 Vadim Fedorenko 2023-03-11  338  	if (!ret)
55b810a5137d33 Vadim Fedorenko 2023-03-11  339  		ret = dpll_device_alloc(clock_id, dev_driver_id, module);
55b810a5137d33 Vadim Fedorenko 2023-03-11  340  	mutex_unlock(&dpll_device_xa_lock);
55b810a5137d33 Vadim Fedorenko 2023-03-11  341  
55b810a5137d33 Vadim Fedorenko 2023-03-11  342  	return ret;
55b810a5137d33 Vadim Fedorenko 2023-03-11  343  }
55b810a5137d33 Vadim Fedorenko 2023-03-11  344  EXPORT_SYMBOL_GPL(dpll_device_get);
55b810a5137d33 Vadim Fedorenko 2023-03-11  345  
55b810a5137d33 Vadim Fedorenko 2023-03-11  346  /**
55b810a5137d33 Vadim Fedorenko 2023-03-11  347   * dpll_device_put - decrease the refcount and free memory if possible
55b810a5137d33 Vadim Fedorenko 2023-03-11  348   * @dpll: dpll_device struct pointer
55b810a5137d33 Vadim Fedorenko 2023-03-11  349   *
55b810a5137d33 Vadim Fedorenko 2023-03-11  350   * Drop reference for a dpll device, if all references are gone, delete
55b810a5137d33 Vadim Fedorenko 2023-03-11  351   * dpll device object.
55b810a5137d33 Vadim Fedorenko 2023-03-11  352   */
55b810a5137d33 Vadim Fedorenko 2023-03-11  353  void dpll_device_put(struct dpll_device *dpll)
55b810a5137d33 Vadim Fedorenko 2023-03-11  354  {
55b810a5137d33 Vadim Fedorenko 2023-03-11  355  	if (!dpll)
55b810a5137d33 Vadim Fedorenko 2023-03-11  356  		return;
55b810a5137d33 Vadim Fedorenko 2023-03-11  357  	mutex_lock(&dpll_device_xa_lock);
55b810a5137d33 Vadim Fedorenko 2023-03-11  358  	if (refcount_dec_and_test(&dpll->refcount)) {
55b810a5137d33 Vadim Fedorenko 2023-03-11  359  		WARN_ON_ONCE(!xa_empty(&dpll->pin_refs));
55b810a5137d33 Vadim Fedorenko 2023-03-11  360  		xa_destroy(&dpll->pin_refs);
55b810a5137d33 Vadim Fedorenko 2023-03-11  361  		xa_erase(&dpll_device_xa, dpll->id);
55b810a5137d33 Vadim Fedorenko 2023-03-11  362  		kfree(dpll);
55b810a5137d33 Vadim Fedorenko 2023-03-11  363  	}
55b810a5137d33 Vadim Fedorenko 2023-03-11  364  	mutex_unlock(&dpll_device_xa_lock);
55b810a5137d33 Vadim Fedorenko 2023-03-11  365  }
55b810a5137d33 Vadim Fedorenko 2023-03-11  366  EXPORT_SYMBOL_GPL(dpll_device_put);
55b810a5137d33 Vadim Fedorenko 2023-03-11  367  
55b810a5137d33 Vadim Fedorenko 2023-03-11  368  /**
55b810a5137d33 Vadim Fedorenko 2023-03-11  369   * dpll_device_register - register the dpll device in the subsystem
55b810a5137d33 Vadim Fedorenko 2023-03-11  370   * @dpll: pointer to a dpll
55b810a5137d33 Vadim Fedorenko 2023-03-11  371   * @type: type of a dpll
55b810a5137d33 Vadim Fedorenko 2023-03-11  372   * @ops: ops for a dpll device
55b810a5137d33 Vadim Fedorenko 2023-03-11  373   * @priv: pointer to private information of owner
55b810a5137d33 Vadim Fedorenko 2023-03-11  374   * @owner: pointer to owner device
55b810a5137d33 Vadim Fedorenko 2023-03-11  375   *
55b810a5137d33 Vadim Fedorenko 2023-03-11  376   * Make dpll device available for user space.
55b810a5137d33 Vadim Fedorenko 2023-03-11  377   *
55b810a5137d33 Vadim Fedorenko 2023-03-11  378   * Return:
55b810a5137d33 Vadim Fedorenko 2023-03-11  379   * * 0 on success
55b810a5137d33 Vadim Fedorenko 2023-03-11  380   * * -EINVAL on failure
55b810a5137d33 Vadim Fedorenko 2023-03-11  381   */
55b810a5137d33 Vadim Fedorenko 2023-03-11  382  int dpll_device_register(struct dpll_device *dpll, enum dpll_type type,
55b810a5137d33 Vadim Fedorenko 2023-03-11  383  			 struct dpll_device_ops *ops, void *priv,
55b810a5137d33 Vadim Fedorenko 2023-03-11  384  			 struct device *owner)
55b810a5137d33 Vadim Fedorenko 2023-03-11  385  {
55b810a5137d33 Vadim Fedorenko 2023-03-11  386  	if (WARN_ON(!ops || !owner))
55b810a5137d33 Vadim Fedorenko 2023-03-11  387  		return -EINVAL;
55b810a5137d33 Vadim Fedorenko 2023-03-11  388  	if (WARN_ON(type <= DPLL_TYPE_UNSPEC || type > DPLL_TYPE_MAX))
55b810a5137d33 Vadim Fedorenko 2023-03-11  389  		return -EINVAL;
55b810a5137d33 Vadim Fedorenko 2023-03-11  390  	mutex_lock(&dpll_device_xa_lock);
55b810a5137d33 Vadim Fedorenko 2023-03-11  391  	if (ASSERT_DPLL_NOT_REGISTERED(dpll)) {
55b810a5137d33 Vadim Fedorenko 2023-03-11  392  		mutex_unlock(&dpll_device_xa_lock);
55b810a5137d33 Vadim Fedorenko 2023-03-11  393  		return -EEXIST;
55b810a5137d33 Vadim Fedorenko 2023-03-11  394  	}
55b810a5137d33 Vadim Fedorenko 2023-03-11  395  	dpll->dev.bus = owner->bus;
55b810a5137d33 Vadim Fedorenko 2023-03-11  396  	dpll->parent = owner;
55b810a5137d33 Vadim Fedorenko 2023-03-11  397  	dpll->type = type;
55b810a5137d33 Vadim Fedorenko 2023-03-11  398  	dpll->ops = ops;
55b810a5137d33 Vadim Fedorenko 2023-03-11  399  	dev_set_name(&dpll->dev, "%s_%d", dev_name(owner),
55b810a5137d33 Vadim Fedorenko 2023-03-11  400  		     dpll->dev_driver_id);
55b810a5137d33 Vadim Fedorenko 2023-03-11  401  	dpll->priv = priv;
55b810a5137d33 Vadim Fedorenko 2023-03-11  402  	xa_set_mark(&dpll_device_xa, dpll->id, DPLL_REGISTERED);
55b810a5137d33 Vadim Fedorenko 2023-03-11  403  	mutex_unlock(&dpll_device_xa_lock);
55b810a5137d33 Vadim Fedorenko 2023-03-11  404  	dpll_notify_device_create(dpll);
55b810a5137d33 Vadim Fedorenko 2023-03-11  405  
55b810a5137d33 Vadim Fedorenko 2023-03-11  406  	return 0;
55b810a5137d33 Vadim Fedorenko 2023-03-11  407  }
55b810a5137d33 Vadim Fedorenko 2023-03-11  408  EXPORT_SYMBOL_GPL(dpll_device_register);
55b810a5137d33 Vadim Fedorenko 2023-03-11  409  
55b810a5137d33 Vadim Fedorenko 2023-03-11  410  /**
55b810a5137d33 Vadim Fedorenko 2023-03-11  411   * dpll_device_unregister - deregister dpll device
55b810a5137d33 Vadim Fedorenko 2023-03-11  412   * @dpll: registered dpll pointer
55b810a5137d33 Vadim Fedorenko 2023-03-11  413   *
55b810a5137d33 Vadim Fedorenko 2023-03-11  414   * Deregister device, make it unavailable for userspace.
55b810a5137d33 Vadim Fedorenko 2023-03-11  415   * Note: It does not free the memory
55b810a5137d33 Vadim Fedorenko 2023-03-11  416   */
55b810a5137d33 Vadim Fedorenko 2023-03-11  417  void dpll_device_unregister(struct dpll_device *dpll)
55b810a5137d33 Vadim Fedorenko 2023-03-11  418  {
55b810a5137d33 Vadim Fedorenko 2023-03-11  419  	mutex_lock(&dpll_device_xa_lock);
55b810a5137d33 Vadim Fedorenko 2023-03-11  420  	ASSERT_DPLL_REGISTERED(dpll);
55b810a5137d33 Vadim Fedorenko 2023-03-11  421  	xa_clear_mark(&dpll_device_xa, dpll->id, DPLL_REGISTERED);
55b810a5137d33 Vadim Fedorenko 2023-03-11  422  	mutex_unlock(&dpll_device_xa_lock);
55b810a5137d33 Vadim Fedorenko 2023-03-11  423  	dpll_notify_device_delete(dpll);
55b810a5137d33 Vadim Fedorenko 2023-03-11  424  }
55b810a5137d33 Vadim Fedorenko 2023-03-11  425  EXPORT_SYMBOL_GPL(dpll_device_unregister);
55b810a5137d33 Vadim Fedorenko 2023-03-11  426  
55b810a5137d33 Vadim Fedorenko 2023-03-11  427  /**
55b810a5137d33 Vadim Fedorenko 2023-03-11  428   * dpll_pin_alloc - allocate the memory for dpll pin
55b810a5137d33 Vadim Fedorenko 2023-03-11  429   * @clock_id: clock_id of creator
55b810a5137d33 Vadim Fedorenko 2023-03-11  430   * @dev_driver_id: id given by dev driver
55b810a5137d33 Vadim Fedorenko 2023-03-11  431   * @module: reference to registering module
55b810a5137d33 Vadim Fedorenko 2023-03-11  432   * @prop: dpll pin properties
55b810a5137d33 Vadim Fedorenko 2023-03-11  433   *
55b810a5137d33 Vadim Fedorenko 2023-03-11  434   * Return:
55b810a5137d33 Vadim Fedorenko 2023-03-11  435   * * valid allocated dpll_pin struct pointer if succeeded
55b810a5137d33 Vadim Fedorenko 2023-03-11  436   * * ERR_PTR of an error
55b810a5137d33 Vadim Fedorenko 2023-03-11  437   */
55b810a5137d33 Vadim Fedorenko 2023-03-11  438  struct dpll_pin *
55b810a5137d33 Vadim Fedorenko 2023-03-11 @439  dpll_pin_alloc(u64 clock_id, u8 device_drv_id,	struct module *module,
55b810a5137d33 Vadim Fedorenko 2023-03-11  440  	       const struct dpll_pin_properties *prop)
55b810a5137d33 Vadim Fedorenko 2023-03-11  441  {
55b810a5137d33 Vadim Fedorenko 2023-03-11  442  	struct dpll_pin *pin;
55b810a5137d33 Vadim Fedorenko 2023-03-11  443  	int ret;
55b810a5137d33 Vadim Fedorenko 2023-03-11  444  
55b810a5137d33 Vadim Fedorenko 2023-03-11  445  	pin = kzalloc(sizeof(*pin), GFP_KERNEL);
55b810a5137d33 Vadim Fedorenko 2023-03-11  446  	if (!pin)
55b810a5137d33 Vadim Fedorenko 2023-03-11  447  		return ERR_PTR(-ENOMEM);
55b810a5137d33 Vadim Fedorenko 2023-03-11  448  	pin->dev_driver_id = device_drv_id;
55b810a5137d33 Vadim Fedorenko 2023-03-11  449  	pin->clock_id = clock_id;
55b810a5137d33 Vadim Fedorenko 2023-03-11  450  	pin->module = module;
55b810a5137d33 Vadim Fedorenko 2023-03-11  451  	refcount_set(&pin->refcount, 1);
55b810a5137d33 Vadim Fedorenko 2023-03-11  452  	if (WARN_ON(!prop->description)) {
55b810a5137d33 Vadim Fedorenko 2023-03-11  453  		ret = -EINVAL;
55b810a5137d33 Vadim Fedorenko 2023-03-11  454  		goto release;
55b810a5137d33 Vadim Fedorenko 2023-03-11  455  	}
55b810a5137d33 Vadim Fedorenko 2023-03-11  456  	pin->prop.description = kstrdup(prop->description, GFP_KERNEL);
55b810a5137d33 Vadim Fedorenko 2023-03-11  457  	if (!pin->prop.description) {
55b810a5137d33 Vadim Fedorenko 2023-03-11  458  		ret = -ENOMEM;
55b810a5137d33 Vadim Fedorenko 2023-03-11  459  		goto release;
55b810a5137d33 Vadim Fedorenko 2023-03-11  460  	}
55b810a5137d33 Vadim Fedorenko 2023-03-11  461  	if (WARN_ON(prop->type <= DPLL_PIN_TYPE_UNSPEC ||
55b810a5137d33 Vadim Fedorenko 2023-03-11  462  		    prop->type > DPLL_PIN_TYPE_MAX)) {
55b810a5137d33 Vadim Fedorenko 2023-03-11  463  		ret = -EINVAL;
55b810a5137d33 Vadim Fedorenko 2023-03-11  464  		goto release;
55b810a5137d33 Vadim Fedorenko 2023-03-11  465  	}
55b810a5137d33 Vadim Fedorenko 2023-03-11  466  	pin->prop.type = prop->type;
55b810a5137d33 Vadim Fedorenko 2023-03-11  467  	pin->prop.capabilities = prop->capabilities;
55b810a5137d33 Vadim Fedorenko 2023-03-11  468  	pin->prop.freq_supported = prop->freq_supported;
55b810a5137d33 Vadim Fedorenko 2023-03-11  469  	pin->prop.any_freq_min = prop->any_freq_min;
55b810a5137d33 Vadim Fedorenko 2023-03-11  470  	pin->prop.any_freq_max = prop->any_freq_max;
55b810a5137d33 Vadim Fedorenko 2023-03-11  471  	xa_init_flags(&pin->dpll_refs, XA_FLAGS_ALLOC);
55b810a5137d33 Vadim Fedorenko 2023-03-11  472  	xa_init_flags(&pin->parent_refs, XA_FLAGS_ALLOC);
55b810a5137d33 Vadim Fedorenko 2023-03-11  473  	ret = xa_alloc(&dpll_pin_xa, &pin->idx, pin,
55b810a5137d33 Vadim Fedorenko 2023-03-11  474  		       xa_limit_16b, GFP_KERNEL);
55b810a5137d33 Vadim Fedorenko 2023-03-11  475  release:
55b810a5137d33 Vadim Fedorenko 2023-03-11  476  	if (ret) {
55b810a5137d33 Vadim Fedorenko 2023-03-11  477  		xa_destroy(&pin->dpll_refs);
55b810a5137d33 Vadim Fedorenko 2023-03-11  478  		xa_destroy(&pin->parent_refs);
55b810a5137d33 Vadim Fedorenko 2023-03-11  479  		kfree(pin->prop.description);
55b810a5137d33 Vadim Fedorenko 2023-03-11  480  		kfree(pin->rclk_dev_name);
55b810a5137d33 Vadim Fedorenko 2023-03-11  481  		kfree(pin);
55b810a5137d33 Vadim Fedorenko 2023-03-11  482  		return ERR_PTR(ret);
55b810a5137d33 Vadim Fedorenko 2023-03-11  483  	}
55b810a5137d33 Vadim Fedorenko 2023-03-11  484  
55b810a5137d33 Vadim Fedorenko 2023-03-11  485  	return pin;
55b810a5137d33 Vadim Fedorenko 2023-03-11  486  }
55b810a5137d33 Vadim Fedorenko 2023-03-11  487  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
