Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45558168DA;
	Sun,  4 Feb 2024 09:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707037718; cv=none; b=Wp5hDtk4/cD2jvwrmu7vUtpLoApOVBGsrGj2jY4zLushhHC9WhnKa2CZGOSpwLRAn9CoPWiJj+jdTzmklMJX6dczHIPRJRmwm1UAbUOKeOym7I/AkXo4v8Gn0LdDxW7u4MHoEK7KtN/TILW8q1bWiOJojhgrZQaIOu0yJnATA+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707037718; c=relaxed/simple;
	bh=qSpYGWqz0bJRJBPz9iCGtN9g47eBpXQxbTifF6X0Ddo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EhBQQPjz+3FizNOkzRSWEOp/kpoRHnXHKX78TKweDlADG15cWkoRVYqQpvnp8TaYzPq+x9fKGf+/v1krE2Aez4k/Z6nN/toqCQftd1RMXeRNfAXT5QZb+7uL1OEF49SGsUHZH5V9DO/2fbZxI4AMxdQnOZrDkYsfFNXGHJUaG38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X46fREgo; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X46fREgo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707037717; x=1738573717;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qSpYGWqz0bJRJBPz9iCGtN9g47eBpXQxbTifF6X0Ddo=;
  b=X46fREgojDX9X3wFsxO1kJUhFBEPRRnWn2OHk7wtpUxhfYgoc00VOCVx
   kEcO3icz8Pzzl0w2fAn0sNCy+7TFPI5XCey284KNDHUFCAtgP1eiOR6Zv
   RbpHnqlIqXRtBb9h0Iw5C/AHGWRA1jNuJe2DH3X4UleAHrZ2e4Ug1pIJb
   LR6t0c7Hhb8Gc7ZkQqRKz+x6h2YoM7uqSc4+uGOAq6RBgm6uN3tvWT+q2
   umtWmNz4qHOIdTAiBMHfUGwlWFQgoUu7HR1D5+qoPQkZB/xVG0OJhJ0jT
   6UVURvXFxzVCUo32UTeLDqE0JGemDf61315aPAUKXs+3iPAlwPBuBoXX1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="4178050"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="4178050"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 01:08:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="453124"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 04 Feb 2024 01:08:34 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWYTs-0006Bs-1h;
	Sun, 04 Feb 2024 09:08:12 +0000
Date: Sun, 4 Feb 2024 17:07:26 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 3/9] power: sequencing: new subsystem
Message-ID: <202402041605.rK2bRp1D-lkp@intel.com>
References: <20240201155532.49707-4-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201155532.49707-4-brgl@bgdev.pl>

Hi Bartosz,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus robh/for-next bluetooth-next/master bluetooth/master linus/master v6.8-rc2 next-20240202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/of-provide-a-cleanup-helper-for-OF-nodes/20240202-000307
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20240201155532.49707-4-brgl%40bgdev.pl
patch subject: [RFC 3/9] power: sequencing: new subsystem
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240204/202402041605.rK2bRp1D-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7dd790db8b77c4a833c06632e903dc4f13877a64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402041605.rK2bRp1D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402041605.rK2bRp1D-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/power/sequencing/core.c:91:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      91 |         kfree(pwrseq);
         |         ^
>> drivers/power/sequencing/core.c:123:11: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     123 |         pwrseq = kzalloc(sizeof(*pwrseq), GFP_KERNEL);
         |                  ^
>> drivers/power/sequencing/core.c:123:9: error: incompatible integer to pointer conversion assigning to 'struct pwrseq_device *' from 'int' [-Wint-conversion]
     123 |         pwrseq = kzalloc(sizeof(*pwrseq), GFP_KERNEL);
         |                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/sequencing/core.c:134:3: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     134 |                 kfree(pwrseq);
         |                 ^
>> drivers/power/sequencing/core.c:280:27: error: use of undeclared identifier '__free_kfree'; did you mean '__free_pages'?
     280 |         struct pwrseq_desc *desc __free(kfree) = kzalloc(sizeof(*desc),
         |                                  ^
   include/linux/cleanup.h:64:33: note: expanded from macro '__free'
      64 | #define __free(_name)   __cleanup(__free_##_name)
         |                                   ^
   <scratch space>:13:1: note: expanded from here
      13 | __free_kfree
         | ^
   include/linux/gfp.h:310:13: note: '__free_pages' declared here
     310 | extern void __free_pages(struct page *page, unsigned int order);
         |             ^
>> drivers/power/sequencing/core.c:280:27: error: 'cleanup' function '__free_pages' must take 1 parameter
     280 |         struct pwrseq_desc *desc __free(kfree) = kzalloc(sizeof(*desc),
         |                                  ^
   include/linux/cleanup.h:64:33: note: expanded from macro '__free'
      64 | #define __free(_name)   __cleanup(__free_##_name)
         |                                   ^
   <scratch space>:13:1: note: expanded from here
      13 | __free_kfree
         | ^
   drivers/power/sequencing/core.c:280:43: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     280 |         struct pwrseq_desc *desc __free(kfree) = kzalloc(sizeof(*desc),
         |                                                  ^
>> drivers/power/sequencing/core.c:280:22: error: incompatible integer to pointer conversion initializing 'struct pwrseq_desc *' with an expression of type 'int' [-Wint-conversion]
     280 |         struct pwrseq_desc *desc __free(kfree) = kzalloc(sizeof(*desc),
         |                             ^                    ~~~~~~~~~~~~~~~~~~~~~~
     281 |                                                          GFP_KERNEL);
         |                                                          ~~~~~~~~~~~
   drivers/power/sequencing/core.c:325:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     325 |         kfree(desc);
         |         ^
   9 errors generated.


vim +/kfree +91 drivers/power/sequencing/core.c

    84	
    85	static void pwrseq_release(struct device *dev)
    86	{
    87		struct pwrseq_device *pwrseq = to_pwrseq_device(dev);
    88	
    89		mutex_destroy(&pwrseq->state_lock);
    90		ida_free(&pwrseq_ida, pwrseq->id);
  > 91		kfree(pwrseq);
    92	}
    93	
    94	static const struct device_type pwrseq_device_type = {
    95		.name = "power_sequencer",
    96		.release = pwrseq_release,
    97	};
    98	
    99	/**
   100	 * pwrseq_device_register() - Register a new power sequencer.
   101	 * @config: Configuration of the new power sequencing device.
   102	 *
   103	 * The config structure is only used during the call and can be freed after
   104	 * the function returns. The config structure *must* have the parent device
   105	 * as well as the match(), power_on() and power_off() callbacks registered.
   106	 *
   107	 * Returns:
   108	 * Returns the address of the new pwrseq device or ERR_PTR() on failure.
   109	 */
   110	struct pwrseq_device *pwrseq_device_register(struct pwrseq_config *config)
   111	{
   112		struct pwrseq_device *pwrseq;
   113		int ret;
   114	
   115		/*
   116		 * Power sequencer must have a parent device and at least the power-on,
   117		 * power-off and match callbacks.
   118		 */
   119		if (!config->parent || !config->match || !config->power_on ||
   120		    !config->power_off)
   121			return ERR_PTR(-EINVAL);
   122	
 > 123		pwrseq = kzalloc(sizeof(*pwrseq), GFP_KERNEL);
   124		if (!pwrseq)
   125			return ERR_PTR(-ENOMEM);
   126	
   127		pwrseq->dev.type = &pwrseq_device_type;
   128		pwrseq->dev.bus = &pwrseq_bus;
   129		pwrseq->dev.parent = config->parent;
   130		device_set_node(&pwrseq->dev, dev_fwnode(config->parent));
   131	
   132		pwrseq->id = ida_alloc(&pwrseq_ida, GFP_KERNEL);
   133		if (pwrseq->id < 0) {
   134			kfree(pwrseq);
   135			return ERR_PTR(pwrseq->id);
   136		}
   137	
   138		/*
   139		 * From this point onwards the device's release() callback is
   140		 * responsible for freeing resources.
   141		 */
   142		device_initialize(&pwrseq->dev);
   143	
   144		ret = dev_set_name(&pwrseq->dev, "pwrseq.%d", pwrseq->id);
   145		if (ret)
   146			goto err_put_pwrseq;
   147	
   148		pwrseq->owner = config->owner ?: THIS_MODULE;
   149		pwrseq->drvdata = config->drvdata;
   150		pwrseq->match = config->match;
   151		pwrseq->power_on = config->power_on;
   152		pwrseq->power_off = config->power_off;
   153	
   154		init_rwsem(&pwrseq->dev_sem);
   155		mutex_init(&pwrseq->state_lock);
   156	
   157		scoped_guard(rwsem_write, &pwrseq_sem) {
   158			ret = device_add(&pwrseq->dev);
   159			if (ret)
   160				goto err_put_pwrseq;
   161		}
   162	
   163		return pwrseq;
   164	
   165	err_put_pwrseq:
   166		pwrseq_device_put(pwrseq);
   167		return ERR_PTR(ret);
   168	}
   169	EXPORT_SYMBOL_GPL(pwrseq_device_register);
   170	
   171	/**
   172	 * pwrseq_device_unregister() - Unregister the power sequencer.
   173	 * @pwrseq: Power sequencer to unregister.
   174	 */
   175	void pwrseq_device_unregister(struct pwrseq_device *pwrseq)
   176	{
   177		struct device *dev = &pwrseq->dev;
   178	
   179		scoped_guard(mutex, &pwrseq->state_lock) {
   180			WARN_ONCE(pwrseq->pwrup_count > 0,
   181				  "%s: UNREGISTERING POWER SEQUENCER WITH ACTIVE USERS\n",
   182				  dev_name(&pwrseq->dev));
   183	
   184			scoped_guard(rwsem_write, &pwrseq_sem) {
   185				scoped_guard(rwsem_write, &pwrseq->dev_sem)
   186					device_del(dev);
   187			}
   188		}
   189	
   190		pwrseq_device_put(pwrseq);
   191	}
   192	EXPORT_SYMBOL_GPL(pwrseq_device_unregister);
   193	
   194	static void devm_pwrseq_device_unregister(void *data)
   195	{
   196		struct pwrseq_device *pwrseq = data;
   197	
   198		pwrseq_device_unregister(pwrseq);
   199	}
   200	
   201	/**
   202	 * devm_pwrseq_device_register() - Managed variant of pwrseq_device_register().
   203	 * @dev: Managing device.
   204	 * @config: Configuration of the new power sequencing device.
   205	 *
   206	 * Returns:
   207	 * Returns the address of the new pwrseq device or ERR_PTR() on failure.
   208	 */
   209	struct pwrseq_device *
   210	devm_pwrseq_device_register(struct device *dev, struct pwrseq_config *config)
   211	{
   212		struct pwrseq_device *pwrseq;
   213		int ret;
   214	
   215		pwrseq = pwrseq_device_register(config);
   216		if (IS_ERR(pwrseq))
   217			return pwrseq;
   218	
   219		ret = devm_add_action_or_reset(dev, devm_pwrseq_device_unregister,
   220					       pwrseq);
   221		if (ret)
   222			return ERR_PTR(ret);
   223	
   224		return pwrseq;
   225	}
   226	EXPORT_SYMBOL_GPL(devm_pwrseq_device_register);
   227	
   228	/**
   229	 * pwrseq_device_get_data() - Get the driver private data associated with this
   230	 *                            sequencer.
   231	 * @pwrseq: Power sequencer object.
   232	 *
   233	 * Returns:
   234	 * Address of the private driver data.
   235	 */
   236	void *pwrseq_device_get_data(struct pwrseq_device *pwrseq)
   237	{
   238		return pwrseq->drvdata;
   239	}
   240	EXPORT_SYMBOL_GPL(pwrseq_device_get_data);
   241	
   242	struct pwrseq_match_data {
   243		struct pwrseq_device *matched;
   244		struct device *dev;
   245	};
   246	
   247	static int pwrseq_match_device(struct device *pwrseq_dev, void *data)
   248	{
   249		struct pwrseq_device *pwrseq = to_pwrseq_device(pwrseq_dev);
   250		struct pwrseq_match_data *match_data = data;
   251		int ret;
   252	
   253		guard(rwsem_read)(&pwrseq->dev_sem);
   254		if (!device_is_registered(&pwrseq->dev))
   255			return 0;
   256	
   257		ret = pwrseq->match(pwrseq, match_data->dev);
   258		if (ret <= 0)
   259			return ret;
   260	
   261		match_data->matched = pwrseq;
   262	
   263		return 1;
   264	}
   265	
   266	/**
   267	 * pwrseq_get() - Get the power sequencer associated with this device.
   268	 * @dev: Device for which to get the sequencer.
   269	 *
   270	 * Returns:
   271	 * New power sequencer descriptor for use by the consumer driver or ERR_PTR()
   272	 * on failure.
   273	 */
   274	struct pwrseq_desc *pwrseq_get(struct device *dev)
   275	{
   276		struct pwrseq_match_data match_data;
   277		struct pwrseq_device *pwrseq;
   278		int ret;
   279	
 > 280		struct pwrseq_desc *desc __free(kfree) = kzalloc(sizeof(*desc),
   281								 GFP_KERNEL);
   282		if (!desc)
   283			return ERR_PTR(-ENOMEM);
   284	
   285		match_data.matched = NULL;
   286		match_data.dev = dev;
   287	
   288		guard(rwsem_read)(&pwrseq_sem);
   289	
   290		ret = bus_for_each_dev(&pwrseq_bus, NULL, &match_data,
   291				       pwrseq_match_device);
   292		if (ret < 0)
   293			return ERR_PTR(ret);
   294		if (ret == 0)
   295			/* No device matched. */
   296			return ERR_PTR(-EPROBE_DEFER);
   297	
   298		pwrseq = match_data.matched;
   299	
   300		if (!try_module_get(pwrseq->owner))
   301			return ERR_PTR(-EPROBE_DEFER);
   302	
   303		desc->pwrseq = pwrseq_device_get(pwrseq);
   304	
   305		return no_free_ptr(desc);
   306	}
   307	EXPORT_SYMBOL_GPL(pwrseq_get);
   308	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
