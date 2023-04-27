Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10947A937;
	Thu, 27 Apr 2023 23:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682638510; x=1714174510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dRF4kOFB41ncYx5+E0IO+A9w9lNu8mKTdfqhx7AZiZ8=;
  b=dW5xxs4bis3meFZgEjslUFXGhUGCpOOA5CYdi3VEKZmTQ4q345JOz6sy
   jjsOguC5N3PU3fmqeHqMGJoU1NZTiJyTCitOflq/iOIHXYc7NgRFX5xkz
   NiHRUoDEjlyYPhtd8i053l4VYLGHgrPtspzL4A8YyisXbwNCOhZrpesaO
   fRFsaMFKRY2jvBPuRitu2QMibIGzw0DSJTIYi3PqMIsjJbn62wbCW4uaL
   yiE5myFUBuM00orR+lYjSGrGw5TENVRgGGw+ZFtqJl3T8vTvp1VYHFOE8
   KJDavtdqPGMAehUijY61JGCGA46qZg16lMnsHmVn8twX+NkbbegdwNCMu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="410673792"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="410673792"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 16:23:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="759374851"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="759374851"
Received: from lkp-server01.sh.intel.com (HELO b95e16499b55) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 27 Apr 2023 16:23:29 -0700
Received: from kbuild by b95e16499b55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psAxV-0000CH-0u;
	Thu, 27 Apr 2023 23:23:29 +0000
Date: Fri, 28 Apr 2023 07:23:26 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 57/57] lib/genalloc.c:885:10: warning:
 incompatible integer to pointer conversion assigning to 'struct device_node
 *' from 'int'
Message-ID: <202304280704.aXgYXmcl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   d03f4bcb40575c1caf4deb8072eb2f9486e51b25
commit: d03f4bcb40575c1caf4deb8072eb2f9486e51b25 [57/57] of: header cleanups
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20230428/202304280704.aXgYXmcl-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=d03f4bcb40575c1caf4deb8072eb2f9486e51b25
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/header-cleanups
        git checkout d03f4bcb40575c1caf4deb8072eb2f9486e51b25
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/mfd/ drivers/of/ lib/ net/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304280704.aXgYXmcl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/genalloc.c:808:6: error: implicit declaration of function 'devres_find' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           p = devres_find(dev, devm_gen_pool_release, devm_gen_pool_match,
               ^
>> lib/genalloc.c:808:4: warning: incompatible integer to pointer conversion assigning to 'struct gen_pool **' from 'int' [-Wint-conversion]
           p = devres_find(dev, devm_gen_pool_release, devm_gen_pool_match,
             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/genalloc.c:843:8: error: implicit declaration of function 'devres_alloc' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           ptr = devres_alloc(devm_gen_pool_release, sizeof(*ptr), GFP_KERNEL);
                 ^
   lib/genalloc.c:843:6: warning: incompatible integer to pointer conversion assigning to 'struct gen_pool **' from 'int' [-Wint-conversion]
           ptr = devres_alloc(devm_gen_pool_release, sizeof(*ptr), GFP_KERNEL);
               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/genalloc.c:853:2: error: implicit declaration of function 'devres_add' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           devres_add(dev, ptr);
           ^
   lib/genalloc.c:858:2: error: implicit declaration of function 'devres_free' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           devres_free(ptr);
           ^
   lib/genalloc.c:885:12: error: implicit declaration of function 'of_parse_phandle' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           np_pool = of_parse_phandle(np, propname, index);
                     ^
>> lib/genalloc.c:885:10: warning: incompatible integer to pointer conversion assigning to 'struct device_node *' from 'int' [-Wint-conversion]
           np_pool = of_parse_phandle(np, propname, index);
                   ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/genalloc.c:889:9: error: implicit declaration of function 'of_find_device_by_node' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           pdev = of_find_device_by_node(np_pool);
                  ^
>> lib/genalloc.c:889:7: warning: incompatible integer to pointer conversion assigning to 'struct platform_device *' from 'int' [-Wint-conversion]
           pdev = of_find_device_by_node(np_pool);
                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/genalloc.c:892:12: error: implicit declaration of function 'of_get_parent' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   parent = of_get_parent(np_pool);
                            ^
   lib/genalloc.c:892:10: warning: incompatible integer to pointer conversion assigning to 'struct device_node *' from 'int' [-Wint-conversion]
                   parent = of_get_parent(np_pool);
                          ^ ~~~~~~~~~~~~~~~~~~~~~~
   lib/genalloc.c:893:8: warning: incompatible integer to pointer conversion assigning to 'struct platform_device *' from 'int' [-Wint-conversion]
                   pdev = of_find_device_by_node(parent);
                        ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/genalloc.c:894:3: error: implicit declaration of function 'of_node_put' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   of_node_put(parent);
                   ^
   lib/genalloc.c:896:3: error: implicit declaration of function 'of_property_read_string' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   of_property_read_string(np_pool, "label", &name);
                   ^
   lib/genalloc.c:898:18: error: incomplete definition of type 'struct device_node'
                           name = np_pool->name;
                                  ~~~~~~~^
   include/linux/arch_topology.h:18:8: note: forward declaration of 'struct device_node'
   struct device_node;
          ^
   lib/genalloc.c:901:28: error: incomplete definition of type 'struct platform_device'
                   pool = gen_pool_get(&pdev->dev, name);
                                        ~~~~^
   lib/genalloc.c:880:9: note: forward declaration of 'struct platform_device'
           struct platform_device *pdev;
                  ^
   lib/genalloc.c:902:2: error: implicit declaration of function 'of_node_put' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           of_node_put(np_pool);
           ^
   6 warnings and 12 errors generated.
--
>> drivers/of/device.c:37:5: warning: no previous prototype for function 'of_device_add' [-Wmissing-prototypes]
   int of_device_add(struct platform_device *ofdev)
       ^
   drivers/of/device.c:37:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int of_device_add(struct platform_device *ofdev)
   ^
   static 
>> drivers/of/device.c:226:5: warning: no previous prototype for function 'of_device_register' [-Wmissing-prototypes]
   int of_device_register(struct platform_device *pdev)
       ^
   drivers/of/device.c:226:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int of_device_register(struct platform_device *pdev)
   ^
   static 
>> drivers/of/device.c:233:6: warning: no previous prototype for function 'of_device_unregister' [-Wmissing-prototypes]
   void of_device_unregister(struct platform_device *ofdev)
        ^
   drivers/of/device.c:233:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void of_device_unregister(struct platform_device *ofdev)
   ^
   static 
   3 warnings generated.


vim +885 lib/genalloc.c

c98c36355dd6d5c Vladimir Zapolskiy 2015-09-04  796  
73858173593c31c Vladimir Zapolskiy 2015-09-04  797  /**
73858173593c31c Vladimir Zapolskiy 2015-09-04  798   * gen_pool_get - Obtain the gen_pool (if any) for a device
73858173593c31c Vladimir Zapolskiy 2015-09-04  799   * @dev: device to retrieve the gen_pool from
73858173593c31c Vladimir Zapolskiy 2015-09-04  800   * @name: name of a gen_pool or NULL, identifies a particular gen_pool on device
73858173593c31c Vladimir Zapolskiy 2015-09-04  801   *
73858173593c31c Vladimir Zapolskiy 2015-09-04  802   * Returns the gen_pool for the device if one is present, or NULL.
73858173593c31c Vladimir Zapolskiy 2015-09-04  803   */
73858173593c31c Vladimir Zapolskiy 2015-09-04  804  struct gen_pool *gen_pool_get(struct device *dev, const char *name)
73858173593c31c Vladimir Zapolskiy 2015-09-04  805  {
73858173593c31c Vladimir Zapolskiy 2015-09-04  806  	struct gen_pool **p;
73858173593c31c Vladimir Zapolskiy 2015-09-04  807  
c98c36355dd6d5c Vladimir Zapolskiy 2015-09-04 @808  	p = devres_find(dev, devm_gen_pool_release, devm_gen_pool_match,
c98c36355dd6d5c Vladimir Zapolskiy 2015-09-04  809  			(void *)name);
73858173593c31c Vladimir Zapolskiy 2015-09-04  810  	if (!p)
73858173593c31c Vladimir Zapolskiy 2015-09-04  811  		return NULL;
73858173593c31c Vladimir Zapolskiy 2015-09-04  812  	return *p;
73858173593c31c Vladimir Zapolskiy 2015-09-04  813  }
73858173593c31c Vladimir Zapolskiy 2015-09-04  814  EXPORT_SYMBOL_GPL(gen_pool_get);
73858173593c31c Vladimir Zapolskiy 2015-09-04  815  
9375db07adeaeea Philipp Zabel      2013-04-29  816  /**
9375db07adeaeea Philipp Zabel      2013-04-29  817   * devm_gen_pool_create - managed gen_pool_create
9375db07adeaeea Philipp Zabel      2013-04-29  818   * @dev: device that provides the gen_pool
9375db07adeaeea Philipp Zabel      2013-04-29  819   * @min_alloc_order: log base 2 of number of bytes each bitmap bit represents
73858173593c31c Vladimir Zapolskiy 2015-09-04  820   * @nid: node selector for allocated gen_pool, %NUMA_NO_NODE for all nodes
73858173593c31c Vladimir Zapolskiy 2015-09-04  821   * @name: name of a gen_pool or NULL, identifies a particular gen_pool on device
9375db07adeaeea Philipp Zabel      2013-04-29  822   *
9375db07adeaeea Philipp Zabel      2013-04-29  823   * Create a new special memory pool that can be used to manage special purpose
9375db07adeaeea Philipp Zabel      2013-04-29  824   * memory not managed by the regular kmalloc/kfree interface. The pool will be
9375db07adeaeea Philipp Zabel      2013-04-29  825   * automatically destroyed by the device management code.
9375db07adeaeea Philipp Zabel      2013-04-29  826   */
9375db07adeaeea Philipp Zabel      2013-04-29  827  struct gen_pool *devm_gen_pool_create(struct device *dev, int min_alloc_order,
73858173593c31c Vladimir Zapolskiy 2015-09-04  828  				      int nid, const char *name)
9375db07adeaeea Philipp Zabel      2013-04-29  829  {
9375db07adeaeea Philipp Zabel      2013-04-29  830  	struct gen_pool **ptr, *pool;
c98c36355dd6d5c Vladimir Zapolskiy 2015-09-04  831  	const char *pool_name = NULL;
9375db07adeaeea Philipp Zabel      2013-04-29  832  
73858173593c31c Vladimir Zapolskiy 2015-09-04  833  	/* Check that genpool to be created is uniquely addressed on device */
73858173593c31c Vladimir Zapolskiy 2015-09-04  834  	if (gen_pool_get(dev, name))
73858173593c31c Vladimir Zapolskiy 2015-09-04  835  		return ERR_PTR(-EINVAL);
73858173593c31c Vladimir Zapolskiy 2015-09-04  836  
c98c36355dd6d5c Vladimir Zapolskiy 2015-09-04  837  	if (name) {
c98c36355dd6d5c Vladimir Zapolskiy 2015-09-04  838  		pool_name = kstrdup_const(name, GFP_KERNEL);
c98c36355dd6d5c Vladimir Zapolskiy 2015-09-04  839  		if (!pool_name)
c98c36355dd6d5c Vladimir Zapolskiy 2015-09-04  840  			return ERR_PTR(-ENOMEM);
c98c36355dd6d5c Vladimir Zapolskiy 2015-09-04  841  	}
c98c36355dd6d5c Vladimir Zapolskiy 2015-09-04  842  
9375db07adeaeea Philipp Zabel      2013-04-29  843  	ptr = devres_alloc(devm_gen_pool_release, sizeof(*ptr), GFP_KERNEL);
310ee9e8f370f8f Jan Kara           2015-02-13  844  	if (!ptr)
c98c36355dd6d5c Vladimir Zapolskiy 2015-09-04  845  		goto free_pool_name;
9375db07adeaeea Philipp Zabel      2013-04-29  846  
9375db07adeaeea Philipp Zabel      2013-04-29  847  	pool = gen_pool_create(min_alloc_order, nid);
c98c36355dd6d5c Vladimir Zapolskiy 2015-09-04  848  	if (!pool)
c98c36355dd6d5c Vladimir Zapolskiy 2015-09-04  849  		goto free_devres;
c98c36355dd6d5c Vladimir Zapolskiy 2015-09-04  850  
9375db07adeaeea Philipp Zabel      2013-04-29  851  	*ptr = pool;
c98c36355dd6d5c Vladimir Zapolskiy 2015-09-04  852  	pool->name = pool_name;
9375db07adeaeea Philipp Zabel      2013-04-29  853  	devres_add(dev, ptr);
9375db07adeaeea Philipp Zabel      2013-04-29  854  
9375db07adeaeea Philipp Zabel      2013-04-29  855  	return pool;
c98c36355dd6d5c Vladimir Zapolskiy 2015-09-04  856  
c98c36355dd6d5c Vladimir Zapolskiy 2015-09-04  857  free_devres:
c98c36355dd6d5c Vladimir Zapolskiy 2015-09-04  858  	devres_free(ptr);
c98c36355dd6d5c Vladimir Zapolskiy 2015-09-04  859  free_pool_name:
c98c36355dd6d5c Vladimir Zapolskiy 2015-09-04  860  	kfree_const(pool_name);
c98c36355dd6d5c Vladimir Zapolskiy 2015-09-04  861  
c98c36355dd6d5c Vladimir Zapolskiy 2015-09-04  862  	return ERR_PTR(-ENOMEM);
9375db07adeaeea Philipp Zabel      2013-04-29  863  }
b724aa213df7aee Michal Simek       2014-12-02  864  EXPORT_SYMBOL(devm_gen_pool_create);
9375db07adeaeea Philipp Zabel      2013-04-29  865  
9375db07adeaeea Philipp Zabel      2013-04-29  866  #ifdef CONFIG_OF
9375db07adeaeea Philipp Zabel      2013-04-29  867  /**
abdd4a7025282fb Vladimir Zapolskiy 2015-06-30  868   * of_gen_pool_get - find a pool by phandle property
9375db07adeaeea Philipp Zabel      2013-04-29  869   * @np: device node
9375db07adeaeea Philipp Zabel      2013-04-29  870   * @propname: property name containing phandle(s)
9375db07adeaeea Philipp Zabel      2013-04-29  871   * @index: index into the phandle array
9375db07adeaeea Philipp Zabel      2013-04-29  872   *
9375db07adeaeea Philipp Zabel      2013-04-29  873   * Returns the pool that contains the chunk starting at the physical
9375db07adeaeea Philipp Zabel      2013-04-29  874   * address of the device tree node pointed at by the phandle property,
9375db07adeaeea Philipp Zabel      2013-04-29  875   * or NULL if not found.
9375db07adeaeea Philipp Zabel      2013-04-29  876   */
abdd4a7025282fb Vladimir Zapolskiy 2015-06-30  877  struct gen_pool *of_gen_pool_get(struct device_node *np,
9375db07adeaeea Philipp Zabel      2013-04-29  878  	const char *propname, int index)
9375db07adeaeea Philipp Zabel      2013-04-29  879  {
9375db07adeaeea Philipp Zabel      2013-04-29  880  	struct platform_device *pdev;
c98c36355dd6d5c Vladimir Zapolskiy 2015-09-04  881  	struct device_node *np_pool, *parent;
c98c36355dd6d5c Vladimir Zapolskiy 2015-09-04  882  	const char *name = NULL;
c98c36355dd6d5c Vladimir Zapolskiy 2015-09-04  883  	struct gen_pool *pool = NULL;
9375db07adeaeea Philipp Zabel      2013-04-29  884  
9375db07adeaeea Philipp Zabel      2013-04-29 @885  	np_pool = of_parse_phandle(np, propname, index);
9375db07adeaeea Philipp Zabel      2013-04-29  886  	if (!np_pool)
9375db07adeaeea Philipp Zabel      2013-04-29  887  		return NULL;
c98c36355dd6d5c Vladimir Zapolskiy 2015-09-04  888  
9375db07adeaeea Philipp Zabel      2013-04-29 @889  	pdev = of_find_device_by_node(np_pool);

:::::: The code at line 885 was first introduced by commit
:::::: 9375db07adeaeea5f5ea7ca0463a8b371d71ddbb genalloc: add devres support, allow to find a managed pool by device

:::::: TO: Philipp Zabel <p.zabel@pengutronix.de>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
