Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547063211
	for <llvm@lists.linux.dev>; Wed,  3 Aug 2022 20:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659556883; x=1691092883;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=csuNX+jhTjrRU2Ka49ZVWlbfBBu0C13ujfPWKnqyXxQ=;
  b=OUKXXF+jEWlr7t7qk5is4rCY3RgQH3oeJec5HHT6WJ236aGwPKpbkdny
   IJOv8olqdWg2IR16jWRLS64WzFiGfP7+bshxi+VgTzyufYpxQISxmBS/e
   6l5LJuP06Ns45aRA6XsLqbYJoC5e/1Qvhdko+5U4Bwu2yLvX0Y6a4dkiY
   Pxe+Yziy0Pv0EIzzHoZZrf7K/8rrAtpQfVhrHnQo+lXvhOyGq5PRJyReg
   utiWoLbWCUCq6c349diu+ZdPI5XnXjMPWOhNLRKmFHF7/UHIB98ZIK6/l
   oClWFz6oNX93voUMRyHCQvBy99xR00WcvxmfW7gyyYvbeNOqC8qMxasIs
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10428"; a="290539207"
X-IronPort-AV: E=Sophos;i="5.93,214,1654585200"; 
   d="scan'208";a="290539207"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2022 13:01:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,214,1654585200"; 
   d="scan'208";a="635817710"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 03 Aug 2022 13:01:21 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oJKYS-000Hbr-2P;
	Wed, 03 Aug 2022 20:01:20 +0000
Date: Thu, 4 Aug 2022 04:00:22 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Aji <srinivas.aji@memverge.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 4/4] device-dax: Add a block device persistent type,
 BLK, for DAX KMEM
Message-ID: <202208040329.87LkXtmz-lkp@intel.com>
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
[auto build test ERROR on linus/master]
[also build test ERROR on v5.19 next-20220802]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Aji/Allow-persistent-data-on-DAX-device-being-used-as-KMEM/20220803-021320
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 0805c6fb39f66e01cb0adccfae8d9e0615c70fd7
config: x86_64-randconfig-a003 (https://download.01.org/0day-ci/archive/20220804/202208040329.87LkXtmz-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 495519e5f8232d144ed26e9c18dbcbac6a5f25eb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1d821cfc1cd5b2a7034ca77e84b59cf808b09a4f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Srinivas-Aji/Allow-persistent-data-on-DAX-device-being-used-as-KMEM/20220803-021320
        git checkout 1d821cfc1cd5b2a7034ca77e84b59cf808b09a4f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/dax/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/dax/kmem_blk.c:338:21: error: use of undeclared identifier 'QUEUE_FLAG_DISCARD'
           blk_queue_flag_set(QUEUE_FLAG_DISCARD, disk->queue);
                              ^
>> drivers/dax/kmem_blk.c:479:11: error: incompatible pointer types passing 'char[47]' to parameter of type 'const struct device *' [-Werror,-Wincompatible-pointer-types]
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
>> drivers/dax/kmem_blk.c:480:4: error: incompatible integer to pointer conversion passing 'unsigned long' to parameter of type 'const char *' [-Wint-conversion]
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
   3 errors generated.


vim +/QUEUE_FLAG_DISCARD +338 drivers/dax/kmem_blk.c

   305	
   306	
   307	
   308	
   309	
   310	static int kmem_blk_disk_init(struct kmem_blk_data *data)
   311	{
   312		struct gendisk *disk;
   313		int err;
   314	
   315		disk = blk_alloc_disk(data->dev_dax->target_node);
   316		data->disk = disk;
   317	
   318		disk->flags = GENHD_FL_NO_PART;
   319		disk->fops = &kmem_blk_fops;
   320		disk->private_data = data;
   321		snprintf(disk->disk_name, DISK_NAME_LEN, "kmem%d",
   322			data->dev_dax->target_node);
   323	
   324		set_capacity(disk,
   325			data->super->num_index_entries << PAGE_SECTORS_SHIFT);
   326	
   327		// TODO: Handle cases where PAGE_SIZE is too big.
   328		/* Set physical and logical block size to PAGE_SIZE */
   329		blk_queue_physical_block_size(disk->queue, PAGE_SIZE);
   330		blk_queue_logical_block_size(disk->queue, PAGE_SIZE);
   331	
   332		/* Tell the block layer that this is not a rotational device */
   333		blk_queue_flag_set(QUEUE_FLAG_NONROT, disk->queue);
   334		/* Don't use this for randomness */
   335		blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, disk->queue);
   336	
   337		/* Support discard */
 > 338		blk_queue_flag_set(QUEUE_FLAG_DISCARD, disk->queue);
   339		disk->queue->limits.discard_granularity = PAGE_SIZE;
   340		blk_queue_max_discard_sectors(disk->queue, UINT_MAX);
   341		/* We can handle WRITE_ZEROES as DISCARD, at units of page size */
   342		blk_queue_max_write_zeroes_sectors(disk->queue, UINT_MAX);
   343	
   344		err = add_disk(disk);
   345		if (err)
   346			goto out_cleanup_disk;
   347	
   348		return 0;
   349	out_cleanup_disk:
   350		blk_cleanup_disk(data->disk);
   351		data->disk = NULL;
   352		return err;
   353	}
   354	
   355	
   356	static void kmem_blk_disk_cleanup(struct kmem_blk_data *data)
   357	{
   358		if (data->disk == NULL)
   359			return;
   360		del_gendisk(data->disk);
   361		blk_cleanup_disk(data->disk);
   362		data->disk = NULL;
   363	}
   364	
   365	/* Format device with full allocation */
   366	static int kmem_blk_format(struct dev_dax *dev_dax)
   367	{
   368		struct kmem_blk_super *super =
   369			kmap_local_page(dax_kmem_index_to_page(0, dev_dax));
   370	
   371		unsigned long num_pages = dax_kmem_num_pages(dev_dax);
   372		u64 i;
   373		/*
   374		 * c = a / b => c is largest c s.t. c * b <= a.
   375		 * c = (a + b - 1) / b is smallest c s.t. c * b >= a
   376		 * num_index_pages is the largest number such that
   377		 * 1 + num_index_pages + num_index_pages * index_entries_per_page >= num_pages
   378		 * num_index_pages *(1 + index_entries_per_page) >= num_pages - 1
   379		 * num_index_pages =
   380		 *   ((num_pages - 1) + (1 + index_entries_per_page) - 1 ) /
   381		 *   (1 + index_entries_per_page)
   382		 */
   383		u64 num_index_pages =
   384			(num_pages + index_entries_per_page - 1) /
   385			(1 + index_entries_per_page);
   386		super->header.magic = kmem_persist_magic;
   387		super->header.type = KMEM_PERSIST_BLK;
   388		super->num_index_pages = num_index_pages;
   389		super->num_index_entries = num_pages - 1 - num_index_pages;
   390	
   391		for (i = 0; i < num_index_pages; i++) {
   392			u64 *index_array =
   393				kmap_local_page(dax_kmem_index_to_page(1 + i, dev_dax));
   394	#if !defined(KMEM_PERSIST_BLK_FORMAT_FULL)
   395			memset(index_array, 0, PAGE_SIZE);
   396	#else /* KMEM_PERSIST_BLK_FORMAT_FULL */
   397			u64 j;
   398	
   399			for (j = 0; j < index_entries_per_page; j++) {
   400				u64 idx =
   401					1 + num_index_pages +
   402					i * index_entries_per_page + j;
   403	
   404				if (idx >= num_pages)
   405					idx = 0;
   406				index_array[j] = idx;
   407			}
   408	#endif
   409			kunmap_local(index_array);
   410		}
   411		kunmap_local(super);
   412		return 0;
   413	}
   414	
   415	/* Free unused blocks in the dax memory to system */
   416	static int kmem_blk_free_unused(struct kmem_blk_data *data)
   417	{
   418		struct kmem_blk_super *super = data->super;
   419		unsigned long num_pages = dax_kmem_num_pages(data->dev_dax);
   420		u64 *alloc_bitmap;
   421		unsigned long i;
   422	
   423		/* Bitmap for tracking allocated pages. Temporary */
   424		alloc_bitmap =
   425			kvzalloc(sizeof(u64) * BITS_TO_U64(num_pages), GFP_KERNEL);
   426		if (alloc_bitmap == NULL) {
   427			dev_err(&data->dev_dax->dev,
   428				"Unable to allocate bit array. Not freeing unused space.\n");
   429			return -ENOMEM;
   430		}
   431	
   432		/* Free up pages unused by block storage to memory */
   433		for (i = 0; i < super->num_index_entries; i++) {
   434			u64 page_num = data->index_page
   435				[i / index_entries_per_page]
   436				[i % index_entries_per_page];
   437	
   438			if (page_num != 0) {
   439				BUG_ON(page_num < 1 + super->num_index_pages ||
   440					page_num >= num_pages);
   441				/* Set bit */
   442				alloc_bitmap[page_num / 64] |= 1 << (page_num % 64);
   443			}
   444		}
   445	
   446		for (i = 1 + super->num_index_pages; i < num_pages; i++) {
   447			struct page *page;
   448	
   449			if (!(alloc_bitmap[i / 64] & (1 << (i % 64)))) {
   450				/* Bit clear. Page not used */
   451				page = dax_kmem_index_to_page(i, data->dev_dax);
   452				__free_page(page);
   453			}
   454		}
   455	
   456		kvfree(alloc_bitmap);
   457		return 0;
   458	}
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
 > 480				super->header.magic, super->header.type);
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
