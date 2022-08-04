Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1173F363
	for <llvm@lists.linux.dev>; Thu,  4 Aug 2022 10:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659609967; x=1691145967;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zLOOZiWBCb31kaGdsoXKXtvmX/Xl352oLW7ZtSVO9A4=;
  b=i5oGDMvF2Ey+iptjO4fhU5aHgDvAXEywAiy5TC6sZ6zjGqZRtG74MkSf
   bvagCvWlCq0qk03WRahv7nyTpvoeMxZb+SbBGNy0OGdfIKMMgR2pHGZrd
   vUz698axXMKsULVW4B609ThDJEy3cIFpDOT3lDvAch4p1S4D5H/i5qi1T
   65/tCmqvrdrd3v0diH/J5pKsrSXh5jQvZMJ6ofNy2ca/wXkCzLoOLVBeq
   dT0mN8/0o/Ia1iqy2lEXzE9GD2yAIYKXR5IXuFwHBNYSjlMzRJb5jYwam
   gjuZSXQ0Eh/PGWA5d9ff0I/afMltFTofixkMwSSclwcefpXmkzePl131u
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10428"; a="289913674"
X-IronPort-AV: E=Sophos;i="5.93,215,1654585200"; 
   d="scan'208";a="289913674"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2022 03:46:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,215,1654585200"; 
   d="scan'208";a="930761086"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 04 Aug 2022 03:46:05 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oJYMe-000IJU-2O;
	Thu, 04 Aug 2022 10:46:04 +0000
Date: Thu, 4 Aug 2022 18:45:42 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Aji <srinivas.aji@memverge.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 4/4] device-dax: Add a block device persistent type,
 BLK, for DAX KMEM
Message-ID: <202208041827.gXLXUdlo-lkp@intel.com>
References: <Yulo96W5ofaJranB@memverge.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yulo96W5ofaJranB@memverge.com>

Hi Srinivas,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linus/master]
[also build test WARNING on v5.19 next-20220803]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Aji/Allow-persistent-data-on-DAX-device-being-used-as-KMEM/20220803-021320
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 0805c6fb39f66e01cb0adccfae8d9e0615c70fd7
config: s390-buildonly-randconfig-r005-20220804 (https://download.01.org/0day-ci/archive/20220804/202208041827.gXLXUdlo-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 26dd42705c2af0b8f6e5d6cdb32c9bd5ed9524eb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/1d821cfc1cd5b2a7034ca77e84b59cf808b09a4f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Srinivas-Aji/Allow-persistent-data-on-DAX-device-being-used-as-KMEM/20220803-021320
        git checkout 1d821cfc1cd5b2a7034ca77e84b59cf808b09a4f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/dax/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/dax/kmem_blk.c:338:21: error: use of undeclared identifier 'QUEUE_FLAG_DISCARD'
           blk_queue_flag_set(QUEUE_FLAG_DISCARD, disk->queue);
                              ^
>> drivers/dax/kmem_blk.c:479:3: warning: pointer/integer type mismatch in conditional expression ('unsigned long' and 'void *') [-Wconditional-type-mismatch]
                   dev_err("KMEM not formatted for blk, magic %lx type %d\n",
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:431:2: note: expanded from macro 'printk_index_subsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:397:39: note: expanded from macro '__printk_index_emit'
                                   .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
                                                                     ^ ~~~~~~   ~~~~
   drivers/dax/kmem_blk.c:479:11: error: incompatible pointer types passing 'char[47]' to parameter of type 'const struct device *' [-Werror,-Wincompatible-pointer-types]
                   dev_err("KMEM not formatted for blk, magic %lx type %d\n",
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:44: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                     ^~~
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                           ^~~
   include/linux/dev_printk.h:50:36: note: passing argument to parameter 'dev' here
   void _dev_err(const struct device *dev, const char *fmt, ...);
                                      ^
   drivers/dax/kmem_blk.c:480:4: error: incompatible integer to pointer conversion passing 'unsigned long' to parameter of type 'const char *' [-Wint-conversion]
                           super->header.magic, super->header.type);
                           ^~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:57: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                  ^~~
   include/linux/dev_printk.h:19:22: note: expanded from macro 'dev_fmt'
   #define dev_fmt(fmt) fmt
                        ^~~
   include/linux/dev_printk.h:110:16: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ^~~
   include/linux/dev_printk.h:50:53: note: passing argument to parameter 'fmt' here
   void _dev_err(const struct device *dev, const char *fmt, ...);
                                                       ^
   1 warning and 3 errors generated.


vim +479 drivers/dax/kmem_blk.c

   459	
   460	static int kmem_blk_probe(struct dev_dax *dev_dax, void **persist_data)
   461	{
   462		struct device *dev = &dev_dax->dev;
   463		struct kmem_blk_super *super;
   464		unsigned long i;
   465		struct kmem_blk_data *data;
   466		unsigned long num_pages = dax_kmem_num_pages(dev_dax);
   467	
   468		if (num_pages == 0) {
   469			dev_err(dev, "Dax device for KMEM has no pages\n");
   470			*persist_data = NULL;
   471			return -1;
   472		}
   473	
   474		super = kmap(dax_kmem_index_to_page(0, dev_dax));
   475	
   476		/* Validate superblock magic and type */
   477		if (super->header.magic != kmem_persist_magic ||
   478			super->header.type != KMEM_PERSIST_BLK) {
 > 479			dev_err("KMEM not formatted for blk, magic %lx type %d\n",
   480				super->header.magic, super->header.type);
   481			kunmap(dax_kmem_index_to_page(0, dev_dax));
   482			*persist_data = NULL;
   483			return -EINVAL;
   484		}
   485	
   486		/* Validate superblock index page counts */
   487		if (super->num_index_entries <=
   488			super->num_index_pages * index_entries_per_page &&
   489			1 + super->num_index_pages + super->num_index_entries
   490			== num_pages) {
   491			dev_info(dev,
   492				"Found kmem_blk superblock num_index_entries %llu num_index_pages %llu num_pages %lu\n",
   493				super->num_index_entries,
   494				super->num_index_pages, num_pages);
   495		} else {
   496			dev_warn(dev,
   497				"Invalid kmem_blk superblock num_index_entries %llu num_index_pages %llu num_pages %lu\n",
   498				super->num_index_entries,
   499				super->num_index_pages, num_pages);
   500			kunmap(dax_kmem_index_to_page(0, dev_dax));
   501			*persist_data = NULL;
   502			return -EINVAL;
   503		}
   504	
   505		data = kzalloc(struct_size(data, index_page, super->num_index_pages),
   506			GFP_KERNEL);
   507		if (!data) {
   508			kunmap(dax_kmem_index_to_page(0, dev_dax));
   509			*persist_data = NULL;
   510			return -ENOMEM;
   511		}
   512	
   513		*persist_data = data;
   514		data->dev_dax = dev_dax;
   515		data->super = super;
   516		spin_lock_init(&data->index_lock);
   517	
   518		for (i = 0; i < super->num_index_pages; i++)
   519			data->index_page[i] =
   520				kmap(dax_kmem_index_to_page(i + 1, dev_dax));
   521	
   522		kmem_blk_free_unused(data);
   523	
   524		kmem_blk_disk_init(data);
   525	
   526		return 0;
   527	}
   528	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
