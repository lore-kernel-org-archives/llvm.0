Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44ACA20
	for <llvm@lists.linux.dev>; Thu, 28 Apr 2022 02:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651112486; x=1682648486;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VfSZQuuw+iDv3iI4FxnjCk3AEAiWZPyL042EWQL7qWQ=;
  b=nRDuJHTiKkf5wRncT8ZRLl/9VBYE/aQ3+G71Y45qtIjT6tgp9hvI1oeh
   t0rBZdjZLhBlfn7fG1F+gAuoV6OtqLy0+OFGo4FsutZS1rvx00zZ62UxX
   FktFTeD54il84wQY4rAXSUQT93WpJIfZFc0j9q0rfmjcQzxtypUXJ6v8l
   qFu/m5V4LdGp/S7jWl9J5SWHl1+76XPkkqKJrY6L6UB1Wc3zVPuZqLl1m
   IvawsAL7H52QOXZ6LfTzkM+Nubale+NxhfcyaUwaoLDNZQDTrvWQLceDj
   c13qW9DHAN87BA6ToZT1jxr9we/mplkilSjjuxLcrHVmnGyrtLUlNk7K+
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="253515822"
X-IronPort-AV: E=Sophos;i="5.90,294,1643702400"; 
   d="scan'208";a="253515822"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2022 19:21:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,294,1643702400"; 
   d="scan'208";a="533571819"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 27 Apr 2022 19:21:24 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1njtmW-0004zL-7q;
	Thu, 28 Apr 2022 02:21:24 +0000
Date: Thu, 28 Apr 2022 10:21:19 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 2/5] block: add partition parser for U-Boot uImage.FIT
Message-ID: <202204281053.YvZRzUMp-lkp@intel.com>
References: <Yma3HdWInhth9rek@makrotopia.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yma3HdWInhth9rek@makrotopia.org>

Hi Daniel,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on mtd/mtd/next mtd/mtd/fixes efi/next linus/master v5.18-rc4 next-20220427]
[cannot apply to rw-ubifs/next rw-ubifs/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Golle/partition-parser-for-U-Boot-s-uImage-FIT/20220425-230256
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20220428/202204281053.YvZRzUMp-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9a3e5b64e6fe0db32db5ffca9b27abdaf3b7e1ec
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Daniel-Golle/partition-parser-for-U-Boot-s-uImage-FIT/20220425-230256
        git checkout 9a3e5b64e6fe0db32db5ffca9b27abdaf3b7e1ec
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash block/partitions/ drivers/devfreq/ drivers/iio/imu/ drivers/misc/lkdtm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> block/partitions/fit.c:177:26: warning: variable 'images' is uninitialized when used here [-Wuninitialized]
                          FIT_CONFS_PATH, images);
                                          ^~~~~~
   include/linux/printk.h:489:33: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                          ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   block/partitions/fit.c:94:27: note: initialize the variable 'images' to silence this warning
           int ret = 1, node, images, config;
                                    ^
                                     = 0
   1 warning generated.


vim +/images +177 block/partitions/fit.c

    69	
    70	/**
    71	 * parse_fit_partitions - map uImage.FIT filesystem sub-images into sub-partitions
    72	 * @state: pointer to partition parser state
    73	 * @fit_start_sector: start sector of the FIT structure on disk
    74	 * @sectors: number of sectors of the uImage.FIT partition or 0 if whole device
    75	 * @slot: pointer to the current partition slot number
    76	 * @add_remain: map unused sectors into additional partition
    77	 *
    78	 * To be called by other partition parsers on physical block devices or using
    79	 * wrapper function int fit_partition(struct parsed_partitions *state) for the
    80	 * whole disk, relevant typically for ubiblock or mtdblock devices.
    81	 */
    82	int parse_fit_partitions(struct parsed_partitions *state, u64 fit_start_sector,
    83				 u64 sectors, int *slot, int max_slot, bool add_remain)
    84	{
    85		struct block_device *bdev = state->disk->part0;
    86		struct address_space *mapping = bdev->bd_inode->i_mapping;
    87		struct page *page;
    88		void *fit, *init_fit;
    89		struct partition_meta_info *info;
    90		char tmp[sizeof(info->volname)];
    91		u64 dsize, dsectors, imgmaxsect = 0;
    92		u32 size, image_pos, image_len;
    93		const u32 *image_offset_be, *image_len_be, *image_pos_be;
    94		int ret = 1, node, images, config;
    95		const char *image_name, *image_type, *image_description,
    96			*config_default, *config_description, *config_loadables;
    97		int image_name_len, image_type_len, image_description_len,
    98			config_default_len, config_description_len,
    99			config_loadables_len;
   100		sector_t start_sect, nr_sects;
   101		size_t label_min;
   102		struct device_node *np = NULL;
   103		const char *bootconf;
   104		const char *loadable;
   105		bool found;
   106		int loadables_rem_len, loadable_len;
   107		u16 loadcnt;
   108	
   109		/* uImage.FIT should be aligned to page boundaries */
   110		if (fit_start_sector % (1 << (PAGE_SHIFT - SECTOR_SHIFT)))
   111			return 0;
   112	
   113		/* map first page */
   114		page = read_mapping_page(
   115			mapping, fit_start_sector >> (PAGE_SHIFT - SECTOR_SHIFT), NULL);
   116	
   117		if (IS_ERR(page))
   118			return -EFAULT;
   119	
   120		if (PageError(page))
   121			return -EFAULT;
   122	
   123		init_fit = page_address(page);
   124	
   125		if (!init_fit) {
   126			put_page(page);
   127			return -EFAULT;
   128		}
   129	
   130		/* uImage.FIT is based on flattened device tree structure */
   131		if (fdt_check_header(init_fit)) {
   132			put_page(page);
   133			return 0;
   134		}
   135	
   136		/* acquire disk or partition size */
   137		dsectors = get_capacity(bdev->bd_disk);
   138		if (sectors)
   139			dsectors = min_t(u64, sectors, dsectors);
   140	
   141		dsize = dsectors << SECTOR_SHIFT;
   142		size = fdt_totalsize(init_fit);
   143	
   144		/* silently skip non-external-data legacy uImage.FIT */
   145		if (size > PAGE_SIZE) {
   146			put_page(page);
   147			return 0;
   148		}
   149	
   150		/* abort if FIT structure is larger than disk or partition size */
   151		if (size >= dsize) {
   152			state->access_beyond_eod = 1;
   153			put_page(page);
   154			return -EFBIG;
   155		}
   156	
   157		/*
   158		 * copy FIT structure for further processing
   159		 * this is necessary for libfdt to work
   160		 */
   161		fit = kmemdup(init_fit, size, GFP_KERNEL);
   162		put_page(page);
   163		if (!fit)
   164			return -ENOMEM;
   165	
   166		/* set boot config node name U-Boot may have added to the device tree */
   167		np = of_find_node_by_path("/chosen");
   168		if (np)
   169			bootconf = of_get_property(np, "u-boot,bootconf", NULL);
   170		else
   171			bootconf = NULL;
   172	
   173		/* find configuration path in uImage.FIT */
   174		config = fdt_path_offset(fit, FIT_CONFS_PATH);
   175		if (config < 0) {
   176			pr_err("FIT: Cannot find %s node: %d\n",
 > 177			       FIT_CONFS_PATH, images);
   178			ret = -ENOENT;
   179			goto ret_out;
   180		}
   181	
   182		/* get default configuration node name */
   183		config_default =
   184			fdt_getprop(fit, config, FIT_DEFAULT_PROP, &config_default_len);
   185	
   186		/* make sure we got either default or selected boot config node name */
   187		if (!config_default && !bootconf) {
   188			pr_err("FIT: Cannot find default configuration\n");
   189			ret = -ENOENT;
   190			goto ret_out;
   191		}
   192	
   193		/* find selected boot config node, fallback on default config node */
   194		node = fdt_subnode_offset(fit, config, bootconf ?: config_default);
   195		if (node < 0) {
   196			pr_err("FIT: Cannot find %s node: %d\n",
   197			       bootconf ?: config_default, node);
   198			ret = -ENOENT;
   199			goto ret_out;
   200		}
   201	
   202		/* get selected configuration data */
   203		config_description =
   204			fdt_getprop(fit, node, FIT_DESC_PROP, &config_description_len);
   205		config_loadables = fdt_getprop(fit, node, FIT_LOADABLE_PROP,
   206					       &config_loadables_len);
   207	
   208		pr_info("FIT: %s configuration: \"%s\"%s%s%s\n",
   209			bootconf ? "Selected" : "Default", bootconf ?: config_default,
   210			config_description ? " (" : "", config_description ?: "",
   211			config_description ? ")" : "");
   212	
   213		if (!config_loadables || !config_loadables_len) {
   214			pr_err("FIT: No loadables configured in \"%s\"\n",
   215			       bootconf ?: config_default);
   216			ret = -ENOENT;
   217			goto ret_out;
   218		}
   219	
   220		/* get images path in uImage.FIT */
   221		images = fdt_path_offset(fit, FIT_IMAGES_PATH);
   222		if (images < 0) {
   223			pr_err("FIT: Cannot find %s node: %d\n", FIT_IMAGES_PATH, images);
   224			ret = -EINVAL;
   225			goto ret_out;
   226		}
   227	
   228		/* allocate one slot for mapping remaing space */
   229		if (add_remain)
   230			--max_slot;
   231	
   232		/* iterate over images in uImage.FIT */
   233		fdt_for_each_subnode(node, fit, images) {
   234			image_name = fdt_get_name(fit, node, &image_name_len);
   235			image_type = fdt_getprop(fit, node, FIT_TYPE_PROP, &image_type_len);
   236			image_offset_be = fdt_getprop(fit, node, FIT_DATA_OFFSET_PROP, NULL);
   237			image_pos_be = fdt_getprop(fit, node, FIT_DATA_POSITION_PROP, NULL);
   238			image_len_be = fdt_getprop(fit, node, FIT_DATA_SIZE_PROP, NULL);
   239	
   240			if (!image_name || !image_type || !image_len_be)
   241				continue;
   242	
   243			image_len = be32_to_cpu(*image_len_be);
   244			if (!image_len)
   245				continue;
   246	
   247			if (image_offset_be)
   248				image_pos = be32_to_cpu(*image_offset_be) + size;
   249			else if (image_pos_be)
   250				image_pos = be32_to_cpu(*image_pos_be);
   251			else
   252				continue;
   253	
   254			image_description = fdt_getprop(fit, node, FIT_DESC_PROP,
   255							&image_description_len);
   256	
   257			pr_info("FIT: %16s sub-image 0x%08x..0x%08x \"%s\" %s%s%s\n",
   258				image_type, image_pos, image_pos + image_len - 1,
   259				image_name, image_description ? "(" : "",
   260				image_description ?: "", image_description ? ") " : "");
   261	
   262			/* only 'filesystem' images should be mapped as partitions */
   263			if (strcmp(image_type, FIT_FILESYSTEM_PROP))
   264				continue;
   265	
   266			/* check if sub-image is part of configured loadables */
   267			found = false;
   268			loadable = config_loadables;
   269			loadables_rem_len = config_loadables_len;
   270			for (loadcnt = 0; loadables_rem_len > 1 &&
   271					  loadcnt < MAX_FIT_LOADABLES; ++loadcnt) {
   272				loadable_len =
   273					strnlen(loadable, loadables_rem_len - 1) + 1;
   274				loadables_rem_len -= loadable_len;
   275				if (!strncmp(image_name, loadable, loadable_len)) {
   276					found = true;
   277					break;
   278				}
   279				loadable += loadable_len;
   280			}
   281			if (!found)
   282				continue;
   283	
   284			if (image_pos % (1 << PAGE_SHIFT)) {
   285				pr_err("FIT: image %s start not aligned to page boundaries, skipping\n",
   286				       image_name);
   287				continue;
   288			}
   289	
   290			if (image_len % (1 << PAGE_SHIFT)) {
   291				pr_err("FIT: sub-image %s end not aligned to page boundaries, skipping\n",
   292				       image_name);
   293				continue;
   294			}
   295	
   296			start_sect = image_pos >> SECTOR_SHIFT;
   297			nr_sects = image_len >> SECTOR_SHIFT;
   298			imgmaxsect = (imgmaxsect < (start_sect + nr_sects)) ?
   299					     (start_sect + nr_sects) :
   300						   imgmaxsect;
   301	
   302			if (start_sect + nr_sects > dsectors) {
   303				state->access_beyond_eod = 1;
   304				continue;
   305			}
   306	
   307			put_partition(state, *slot, fit_start_sector + start_sect,
   308				      nr_sects);
   309			state->parts[*slot].flags = ADDPART_FLAG_READONLY;
   310			state->parts[*slot].has_info = true;
   311			info = &state->parts[*slot].info;
   312	
   313			label_min = min_t(int, sizeof(info->volname) - 1, image_name_len);
   314			strncpy(info->volname, image_name, label_min);
   315			info->volname[label_min] = '\0';
   316	
   317			snprintf(tmp, sizeof(tmp), "(%s)", info->volname);
   318			strlcat(state->pp_buf, tmp, PAGE_SIZE);
   319	
   320			if (++(*slot) > max_slot)
   321				break;
   322		}
   323	
   324		/* in case uImage.FIT is stored in a partition, map the remaining space */
   325		if (add_remain && (imgmaxsect + MIN_FREE_SECT) < dsectors) {
   326			put_partition(state, *slot, fit_start_sector + imgmaxsect,
   327				      dsectors - imgmaxsect);
   328			state->parts[*slot].flags = 0;
   329			info = &state->parts[*slot].info;
   330			strcpy(info->volname, REMAIN_VOLNAME);
   331			snprintf(tmp, sizeof(tmp), "(%s)", REMAIN_VOLNAME);
   332			strlcat(state->pp_buf, tmp, PAGE_SIZE);
   333			++(*slot);
   334		}
   335	ret_out:
   336		kfree(fit);
   337		return ret;
   338	}
   339	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
