Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB17F2109;
	Tue, 29 Aug 2023 08:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693298697; x=1724834697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eI6kuMMMgz2tilexqPWImnY8jaq7Sk4V4d/6Ynlg8VQ=;
  b=j/SZJBRw69lbnbDGwLB6ji26i3mLVVnpQRZMF3R5GTFI9YRgVScJJDmD
   y2/rH4ix5VYuyJUdZY81v/r1FTdiUHH6CC8BZBa25QsRkj4d228iogAWB
   /KSfDPIYH01uYNTTdqtM6xKJiTMumAOiKYrqZm66w869E4DK91QHQgkFZ
   y0gLaXdku/+IHpksuROxE4Y7umIrrbL1AAbqvb4ViUgtefiymfYAlmFgi
   iZ/t2uWN28/3GxRGzF5y3U1E6PhhDpbJ0jAQsIm3sshpmBxdhcyE6b6n2
   QCGdOfXxzQgoxpg4gq4hLc5a69lFVI9W9Fq/F4QXa22mTuzt5nmRn8ePN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="441662232"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="441662232"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 01:44:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="853199130"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="853199130"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 29 Aug 2023 01:44:53 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qauLA-0008aB-0j;
	Tue, 29 Aug 2023 08:44:49 +0000
Date: Tue, 29 Aug 2023 16:44:14 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Navneet Singh <navneet.singh@intel.com>
Subject: [weiny2:dcd-v2-2023-08-28 29/36] drivers/dax/dax-private.h:129:16:
 error: field has incomplete type 'struct range'
Message-ID: <202308291623.uwedANTc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git dcd-v2-2023-08-28
head:   4e8d6c7176cb59f986a4365a6c6bd7d3610c229e
commit: af90cf6f56ec6574628051a51b1364e759206aa3 [29/36] cxl/region: Expose DC extents on region driver load
config: arm-randconfig-r015-20230829 (https://download.01.org/0day-ci/archive/20230829/202308291623.uwedANTc-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308291623.uwedANTc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308291623.uwedANTc-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/dax/extent.c:6:
>> drivers/dax/dax-private.h:129:16: error: field has incomplete type 'struct range'
     129 |                 struct range range;
         |                              ^
   include/linux/memory_hotplug.h:273:8: note: forward declaration of 'struct range'
     273 | struct range arch_get_mappable_range(void);
         |        ^
>> drivers/dax/extent.c:13:36: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
      13 |         return sysfs_emit(buf, "%#llx\n", dr_reg_ext_dev->length);
         |                                 ~~~~~     ^~~~~~~~~~~~~~~~~~~~~~
         |                                 %#x
   drivers/dax/extent.c:70:3: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
      70 |         dev_dbg(&dr_reg_ext_dev->dev, "Unregister DAX region ext OFF:%llx L:%s\n",
         |                                                                      ~~~~
         |                                                                      %x
      71 |                 dr_reg_ext_dev->offset, dr_reg_ext_dev->label);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                      ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:272:19: note: expanded from macro 'dynamic_dev_dbg'
     272 |                            dev, fmt, ##__VA_ARGS__)
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:59: note: expanded from macro '_dynamic_func_call'
     248 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:246:65: note: expanded from macro '_dynamic_func_call_cls'
     246 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:222:15: note: expanded from macro '__dynamic_func_call_cls'
     222 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
>> drivers/dax/extent.c:96:21: error: use of undeclared identifier 'PMD_SIZE'
      96 |         dev->id = offset / PMD_SIZE ;
         |                            ^
   drivers/dax/extent.c:109:3: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
     109 |         dev_dbg(dev, "DAX region extent OFF:%llx LEN:%llx\n",
         |                                             ~~~~
         |                                             %x
     110 |                 dr_reg_ext_dev->offset, dr_reg_ext_dev->length);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                      ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:272:19: note: expanded from macro 'dynamic_dev_dbg'
     272 |                            dev, fmt, ##__VA_ARGS__)
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:59: note: expanded from macro '_dynamic_func_call'
     248 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:246:65: note: expanded from macro '_dynamic_func_call_cls'
     246 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:222:15: note: expanded from macro '__dynamic_func_call_cls'
     222 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   drivers/dax/extent.c:109:27: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
     109 |         dev_dbg(dev, "DAX region extent OFF:%llx LEN:%llx\n",
         |                                                      ~~~~
         |                                                      %x
     110 |                 dr_reg_ext_dev->offset, dr_reg_ext_dev->length);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                      ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:272:19: note: expanded from macro 'dynamic_dev_dbg'
     272 |                            dev, fmt, ##__VA_ARGS__)
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:59: note: expanded from macro '_dynamic_func_call'
     248 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:246:65: note: expanded from macro '_dynamic_func_call_cls'
     246 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:222:15: note: expanded from macro '__dynamic_func_call_cls'
     222 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   drivers/dax/extent.c:115:3: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
     115 |         dev_err(dev, "Failed to initialize DAX extent dev OFF:%llx LEN:%llx\n",
         |                                                               ~~~~
         |                                                               %x
     116 |                 dr_reg_ext_dev->offset, dr_reg_ext_dev->length);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/dax/extent.c:115:27: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
     115 |         dev_err(dev, "Failed to initialize DAX extent dev OFF:%llx LEN:%llx\n",
         |                                                                        ~~~~
         |                                                                        %x
     116 |                 dr_reg_ext_dev->offset, dr_reg_ext_dev->length);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   6 warnings and 2 errors generated.


vim +129 drivers/dax/dax-private.h

0b07ce872a9eca Dan Williams 2020-10-13  101  
efebc711180f7f Dave Jiang   2017-04-07  102  /**
89ec9f2cfa36cc Dan Williams 2018-10-29  103   * struct dev_dax - instance data for a subdivision of a dax region, and
89ec9f2cfa36cc Dan Williams 2018-10-29  104   * data while the device is activated in the driver.
efebc711180f7f Dave Jiang   2017-04-07  105   * @region - parent region
736163671bcb16 Dan Williams 2017-05-04  106   * @dax_dev - core dax functionality
8fc5c73554db0a Dan Williams 2018-11-09  107   * @target_node: effective numa node if dev_dax memory range is onlined
70aab281e18c68 Dan Williams 2023-06-02  108   * @dyn_id: is this a dynamic or statically created instance
70aab281e18c68 Dan Williams 2023-06-02  109   * @id: ida allocated id when the dax_region is not static
0b07ce872a9eca Dan Williams 2020-10-13  110   * @ida: mapping id allocator
736163671bcb16 Dan Williams 2017-05-04  111   * @dev - device core
89ec9f2cfa36cc Dan Williams 2018-10-29  112   * @pgmap - pgmap for memmap setup / lifetime (driver owned)
60e93dc097f7f1 Dan Williams 2020-10-13  113   * @nr_range: size of @ranges
60e93dc097f7f1 Dan Williams 2020-10-13  114   * @ranges: resource-span + pgoff tuples for the instance
efebc711180f7f Dave Jiang   2017-04-07  115   */
736163671bcb16 Dan Williams 2017-05-04  116  struct dev_dax {
efebc711180f7f Dave Jiang   2017-04-07  117  	struct dax_region *region;
736163671bcb16 Dan Williams 2017-05-04  118  	struct dax_device *dax_dev;
33cf94d7176672 Joao Martins 2020-10-13  119  	unsigned int align;
8fc5c73554db0a Dan Williams 2018-11-09  120  	int target_node;
70aab281e18c68 Dan Williams 2023-06-02  121  	bool dyn_id;
0f3da14a4f0503 Dan Williams 2020-10-13  122  	int id;
0b07ce872a9eca Dan Williams 2020-10-13  123  	struct ida ida;
efebc711180f7f Dave Jiang   2017-04-07  124  	struct device dev;
f5516ec5efb9fe Dan Williams 2020-10-13  125  	struct dev_pagemap *pgmap;
60e93dc097f7f1 Dan Williams 2020-10-13  126  	int nr_range;
60e93dc097f7f1 Dan Williams 2020-10-13  127  	struct dev_dax_range {
60e93dc097f7f1 Dan Williams 2020-10-13  128  		unsigned long pgoff;
f5516ec5efb9fe Dan Williams 2020-10-13 @129  		struct range range;
0b07ce872a9eca Dan Williams 2020-10-13  130  		struct dax_mapping *mapping;
60e93dc097f7f1 Dan Williams 2020-10-13  131  	} *ranges;
efebc711180f7f Dave Jiang   2017-04-07  132  };
51cf784c42d07f Dan Williams 2017-07-12  133  

:::::: The code at line 129 was first introduced by commit
:::::: f5516ec5efb9fe0f426a46eeef25d389d3c2f988 device-dax: make pgmap optional for instance creation

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
