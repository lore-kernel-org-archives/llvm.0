Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74862DF59;
	Fri, 27 Mar 2026 06:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774591559; cv=none; b=J0OgddadtrGco/MxE7ZGQZ3P+otF5TMpYmBCmmN4nA2K0SensOEezlLnSxYEYVi6fXHIXJ8MNmeTGq+08ZnEWFF/f/64H9aVe7UrO7tKTtd3Ltu/+LuIjdKygynBJTdnki85/wfbudGrfC/Xbqg2d0pV8ATkAhISMm+P4s9KCXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774591559; c=relaxed/simple;
	bh=rshW/KraPFt6qu9+jYpS0v2+ZFEotb20B4b2+pmKCp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pSDn/AhrCxp3Yx8z/TxBeToNcAILnVN8IDVvGL8pvq9wH8V3NzYGBdgxYvgD9x5mFTdkJ8Eh5W2/WnL4YbIAET5EBXsFcR8RMSF987kI7ewlT6PXR+645RRLeJReC3KlFN9hruWUs0Egm6XfaIuzF3RkieCZKmWLDwoz97gyO/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GEh5DPQH; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GEh5DPQH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774591559; x=1806127559;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rshW/KraPFt6qu9+jYpS0v2+ZFEotb20B4b2+pmKCp4=;
  b=GEh5DPQHFsBtMNsjnpVnIujhxOYO3ZCeS2FXZ8kcNOl3MmKbEFWaiQ+e
   6gHgYAW6ue1dZJFr/oLiXYAhm3XyBe1oGGMJayasirdqLdzeFpCyHOuON
   0OoTFycHOdzupbMKOKOA5ZqfSC6oz/J+eKJmR0X8Ch5ow/Lov/d13qspl
   EYWFYyZ8WWmE4416z2Fhu4EMTrcZv/Y7MXMWu+6zsS98i52iUoO2zN+Q3
   ioD5VRiWZNJAg2BEIFcDVXuJRNVySgf8Mh7Rbt0j2tiwhE4dHfeyMCPRD
   mPnnflUcUIeezuzUhPMhQopd+OJ7lkHc8qjsBPCT2tG6MBbFTnx9CufYr
   A==;
X-CSE-ConnectionGUID: 2y1Lb3aOTCu08gO1POheoQ==
X-CSE-MsgGUID: NIN8YcroQ+ycdbiZuK40aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75775895"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="75775895"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 23:05:58 -0700
X-CSE-ConnectionGUID: Ytj3hztRQMq/b+i5QxjHMw==
X-CSE-MsgGUID: cVE9mgRAQje94geeX9T1Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="225466570"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Mar 2026 23:05:56 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w60KP-000000009qx-3LSH;
	Fri, 27 Mar 2026 06:05:53 +0000
Date: Fri, 27 Mar 2026 14:05:33 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <ltykernel@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH V3] x86/VMBus: Confidential VMBus for dynamic DMA
 transfers
Message-ID: <202603271353.0O7DBbvf-lkp@intel.com>
References: <20260325075649.248241-1-tiala@microsoft.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325075649.248241-1-tiala@microsoft.com>

Hi Tianyu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.0-rc5 next-20260326]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tianyu-Lan/x86-VMBus-Confidential-VMBus-for-dynamic-DMA-transfers/20260325-162853
base:   linus/master
patch link:    https://lore.kernel.org/r/20260325075649.248241-1-tiala%40microsoft.com
patch subject: [RFC PATCH V3] x86/VMBus: Confidential VMBus for dynamic DMA transfers
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260327/202603271353.0O7DBbvf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603271353.0O7DBbvf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603271353.0O7DBbvf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hv/vmbus_drv.c:2194:3: error: call to undeclared function 'swiotlb_dev_disable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2194 |                 swiotlb_dev_disable(&child_device_obj->device);
         |                 ^
   1 error generated.


vim +/swiotlb_dev_disable +2194 drivers/hv/vmbus_drv.c

  2172	
  2173	/*
  2174	 * vmbus_device_register - Register the child device
  2175	 */
  2176	int vmbus_device_register(struct hv_device *child_device_obj)
  2177	{
  2178		struct kobject *kobj = &child_device_obj->device.kobj;
  2179		int ret;
  2180	
  2181		dev_set_name(&child_device_obj->device, "%pUl",
  2182			     &child_device_obj->channel->offermsg.offer.if_instance);
  2183	
  2184		child_device_obj->device.bus = &hv_bus;
  2185		child_device_obj->device.parent = vmbus_root_device;
  2186		child_device_obj->device.release = vmbus_device_release;
  2187	
  2188		child_device_obj->device.dma_parms = &child_device_obj->dma_parms;
  2189		child_device_obj->device.dma_mask = &child_device_obj->dma_mask;
  2190		dma_set_mask(&child_device_obj->device, DMA_BIT_MASK(64));
  2191	
  2192		device_initialize(&child_device_obj->device);
  2193		if (child_device_obj->channel->co_external_memory)
> 2194			swiotlb_dev_disable(&child_device_obj->device);
  2195	
  2196		/*
  2197		 * Register with the LDM. This will kick off the driver/device
  2198		 * binding...which will eventually call vmbus_match() and vmbus_probe()
  2199		 */
  2200		ret = device_add(&child_device_obj->device);
  2201		if (ret) {
  2202			pr_err("Unable to register child device\n");
  2203			put_device(&child_device_obj->device);
  2204			return ret;
  2205		}
  2206	
  2207		/*
  2208		 * If device_register() found a driver to assign to the device, the
  2209		 * driver's probe function has already run at this point. If that
  2210		 * probe function accesses or operates on the "channels" subdirectory
  2211		 * in sysfs, those operations will have failed because the "channels"
  2212		 * subdirectory doesn't exist until the code below runs. Or if the
  2213		 * probe function creates a /dev entry, a user space program could
  2214		 * find and open the /dev entry, and then create a race by accessing
  2215		 * the "channels" subdirectory while the creation steps are in progress
  2216		 * here. The race can't result in a kernel failure, but the user space
  2217		 * program may get an error in accessing "channels" or its
  2218		 * subdirectories. See also comments with vmbus_add_dynid() about a
  2219		 * related race condition.
  2220		 */
  2221		child_device_obj->channels_kset = kset_create_and_add("channels",
  2222								      NULL, kobj);
  2223		if (!child_device_obj->channels_kset) {
  2224			ret = -ENOMEM;
  2225			goto err_dev_unregister;
  2226		}
  2227	
  2228		ret = vmbus_add_channel_kobj(child_device_obj,
  2229					     child_device_obj->channel);
  2230		if (ret) {
  2231			pr_err("Unable to register primary channel\n");
  2232			goto err_kset_unregister;
  2233		}
  2234		hv_debug_add_dev_dir(child_device_obj);
  2235	
  2236		return 0;
  2237	
  2238	err_kset_unregister:
  2239		kset_unregister(child_device_obj->channels_kset);
  2240	
  2241	err_dev_unregister:
  2242		device_unregister(&child_device_obj->device);
  2243		return ret;
  2244	}
  2245	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
