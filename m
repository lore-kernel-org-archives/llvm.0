Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DC22C9D
	for <llvm@lists.linux.dev>; Tue, 21 Dec 2021 19:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640114056; x=1671650056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0+76WnuBTMhkDbnQFzuotah7ci6CpzxWTz0HppDfbaI=;
  b=IcOCYlh9+r3M3ARAjiUgZyc3/YZuP3oBT6BZRixEaDuLgEkD2NXA3R1R
   8MdAfWlSNJEDF+a+VBMlqJfjU5ntrqt4+D9KaPwOwDN6xMG5wpPfIp1UF
   igh78vPaIzQkwiIBsTVveDLKXvsfQTBVjJ8f6J24GPyk576fmNWy9CtHD
   AvCE91CWNB4MYfRp9gg9FGjnkrYN4otWoBMSb84T2GzXN0MkLb13UEV9V
   Ty29kpVzqJMonhDVEmJP9xvynO9gtwXTzFJzkeUfNP5/BB07hvdb2RWBS
   SM1HaBdAi6X8J2Cet/+t8oRS5KISDg90ByMVcQmV72dZD6W+o0XlJehlA
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="240429960"
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; 
   d="scan'208";a="240429960"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2021 11:14:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; 
   d="scan'208";a="684768169"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 21 Dec 2021 11:14:13 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mzkaT-0009S7-3k; Tue, 21 Dec 2021 19:14:13 +0000
Date: Wed, 22 Dec 2021 03:13:22 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <Tianyu.Lan@microsoft.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Wei Liu <wei.liu@kernel.org>, Long Li <longli@microsoft.com>,
	Michael Kelley <mikelley@microsoft.com>
Subject: [linux-next:master 8563/8895] drivers/hv/vmbus_drv.c:2082:29:
 warning: shift count >= width of type
Message-ID: <202112220302.x6d84578-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2850c2311ef4bf30ae8dd8927f0f66b026ff08fb
commit: 743b237c3a7b0f5b44aa704aae8a1058877b6322 [8563/8895] scsi: storvsc: Add Isolation VM support for storvsc driver
config: x86_64-randconfig-r015-20211220 (https://download.01.org/0day-ci/archive/20211222/202112220302.x6d84578-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6c2bf01270a8a52b7986d5c49eaa7ad1c7083ec5)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=743b237c3a7b0f5b44aa704aae8a1058877b6322
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 743b237c3a7b0f5b44aa704aae8a1058877b6322
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/hv/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/hv/vmbus_drv.c:2082:29: warning: shift count >= width of type [-Wshift-count-overflow]
   static u64 vmbus_dma_mask = DMA_BIT_MASK(64);
                               ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   1 warning generated.


vim +2082 drivers/hv/vmbus_drv.c

  2081	
> 2082	static u64 vmbus_dma_mask = DMA_BIT_MASK(64);
  2083	/*
  2084	 * vmbus_device_register - Register the child device
  2085	 */
  2086	int vmbus_device_register(struct hv_device *child_device_obj)
  2087	{
  2088		struct kobject *kobj = &child_device_obj->device.kobj;
  2089		int ret;
  2090	
  2091		dev_set_name(&child_device_obj->device, "%pUl",
  2092			     &child_device_obj->channel->offermsg.offer.if_instance);
  2093	
  2094		child_device_obj->device.bus = &hv_bus;
  2095		child_device_obj->device.parent = &hv_acpi_dev->dev;
  2096		child_device_obj->device.release = vmbus_device_release;
  2097	
  2098		/*
  2099		 * Register with the LDM. This will kick off the driver/device
  2100		 * binding...which will eventually call vmbus_match() and vmbus_probe()
  2101		 */
  2102		ret = device_register(&child_device_obj->device);
  2103		if (ret) {
  2104			pr_err("Unable to register child device\n");
  2105			return ret;
  2106		}
  2107	
  2108		child_device_obj->channels_kset = kset_create_and_add("channels",
  2109								      NULL, kobj);
  2110		if (!child_device_obj->channels_kset) {
  2111			ret = -ENOMEM;
  2112			goto err_dev_unregister;
  2113		}
  2114	
  2115		ret = vmbus_add_channel_kobj(child_device_obj,
  2116					     child_device_obj->channel);
  2117		if (ret) {
  2118			pr_err("Unable to register primary channeln");
  2119			goto err_kset_unregister;
  2120		}
  2121		hv_debug_add_dev_dir(child_device_obj);
  2122	
  2123		child_device_obj->device.dma_mask = &vmbus_dma_mask;
  2124		child_device_obj->device.dma_parms = &child_device_obj->dma_parms;
  2125		return 0;
  2126	
  2127	err_kset_unregister:
  2128		kset_unregister(child_device_obj->channels_kset);
  2129	
  2130	err_dev_unregister:
  2131		device_unregister(&child_device_obj->device);
  2132		return ret;
  2133	}
  2134	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
