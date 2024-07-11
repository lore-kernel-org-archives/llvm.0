Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94159450FA;
	Thu, 11 Jul 2024 17:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720717358; cv=none; b=RnWAckasnXRNhliSySfyqONDkneD9bjZRig8yDD4MAzpAn5fnakmbMm6K6gxYcQ5gA0IAvaYsf8eyuyEUir/Mmxw6cN09i3HRKD9rnw0UOSIS/nj3rz8afmEJ2dItG5iwrmdjqb5RDNP3IM7HWTTVNYGO2ZG3J1YxnpRQiP0rpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720717358; c=relaxed/simple;
	bh=bUf6oN5XZo5cxB2/I0mm9cpzuGUPh8ItgSMDp4dXE48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lRNOGvE/Thax8zfzAHzCdIn63u/copI4x4KksO8CP9mvQdDoG4mW7QIrR0ftUmZ53QmxdB1Jz/9+KaE7V8Vv4OAjuUT5SsMagYGwN0P6Y1JMvvJbJ1+UaWmhboluWdZZZBmSwnT9JzelzG0qEsc/KRWD/8AWPL+TWHRsQL6dtOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xnw2TrQh; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xnw2TrQh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720717356; x=1752253356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bUf6oN5XZo5cxB2/I0mm9cpzuGUPh8ItgSMDp4dXE48=;
  b=Xnw2TrQhDDiavB5eeR/IIs0FJ+g703xS8DK7LzRh8x8hm+F/DfwEJzx8
   F0LaggI/tL6Jm78wBh7T256lqiCdDR9Leg3S3zbu6Py3bmg1vlCmE0KzO
   lnYEJxt88lP/9oGIx40NxTV78FmKqFksx7WZVh1uJoAc1mBmNz415j+5q
   9BCAsxQmciqXUI5azAnc4OKjO3zWYhqa9tALn4z+VllBJeTc3LpqhX9Ry
   ERZXjrMkPNCSJinw45Kdp5XpkK+VO0MC7ulR7b1hwNkEnrtl3oLIfqko6
   irXNeLkNs3mGGoUzfGHkW2jPFg4a4gOkDuwx9EX8GbFRbyMGNN8Io9S0G
   g==;
X-CSE-ConnectionGUID: LJaKexTCTdilEg6Ij9zdrw==
X-CSE-MsgGUID: FajQ+dwLRCaaJ62hqklMng==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18258748"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="18258748"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 10:02:36 -0700
X-CSE-ConnectionGUID: CAQh8NBxRcGa+MdsKQ7Xnw==
X-CSE-MsgGUID: 1/YvYZTxRlibutA3u24ILQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="53447404"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Jul 2024 10:02:33 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRxBf-000ZXK-0F;
	Thu, 11 Jul 2024 17:02:31 +0000
Date: Fri, 12 Jul 2024 01:01:40 +0800
From: kernel test robot <lkp@intel.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 12283/12643] drivers/md/dm-integrity.c:4559:22:
 warning: result of comparison of constant 2048 with expression of type
 'unsigned char' is always false
Message-ID: <202407120027.MgaGW5XW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f477dd6eede3ecedc8963478571d99ec3bf3f762
commit: 22a79e88e923d836bcd592fd8100c479dfcc35aa [12283/12643] dm-integrity: introduce the Inline mode
config: hexagon-randconfig-r022-20230903 (https://download.01.org/0day-ci/archive/20240712/202407120027.MgaGW5XW-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407120027.MgaGW5XW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407120027.MgaGW5XW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/md/dm-integrity.c:10:
   In file included from drivers/md/dm-bio-record.h:11:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/md/dm-integrity.c:10:
   In file included from drivers/md/dm-bio-record.h:11:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/md/dm-integrity.c:10:
   In file included from drivers/md/dm-bio-record.h:11:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/md/dm-integrity.c:4559:22: warning: result of comparison of constant 2048 with expression of type 'unsigned char' is always false [-Wtautological-constant-out-of-range-compare]
    4559 |                 if (bi->tuple_size > PAGE_SIZE / 2) {
         |                 ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:86: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ~~~~~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:68:3: note: expanded from macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
>> drivers/md/dm-integrity.c:4559:22: warning: result of comparison of constant 2048 with expression of type 'unsigned char' is always false [-Wtautological-constant-out-of-range-compare]
    4559 |                 if (bi->tuple_size > PAGE_SIZE / 2) {
         |                 ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
>> drivers/md/dm-integrity.c:4559:22: warning: result of comparison of constant 2048 with expression of type 'unsigned char' is always false [-Wtautological-constant-out-of-range-compare]
    4559 |                 if (bi->tuple_size > PAGE_SIZE / 2) {
         |                 ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:61: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   9 warnings generated.


vim +4559 drivers/md/dm-integrity.c

  4329	
  4330		if (argc <= DIRECT_ARGUMENTS) {
  4331			ti->error = "Invalid argument count";
  4332			return -EINVAL;
  4333		}
  4334	
  4335		ic = kzalloc(sizeof(struct dm_integrity_c), GFP_KERNEL);
  4336		if (!ic) {
  4337			ti->error = "Cannot allocate integrity context";
  4338			return -ENOMEM;
  4339		}
  4340		ti->private = ic;
  4341		ti->per_io_data_size = sizeof(struct dm_integrity_io);
  4342		ic->ti = ti;
  4343	
  4344		ic->in_progress = RB_ROOT;
  4345		INIT_LIST_HEAD(&ic->wait_list);
  4346		init_waitqueue_head(&ic->endio_wait);
  4347		bio_list_init(&ic->flush_bio_list);
  4348		init_waitqueue_head(&ic->copy_to_journal_wait);
  4349		init_completion(&ic->crypto_backoff);
  4350		atomic64_set(&ic->number_of_mismatches, 0);
  4351		ic->bitmap_flush_interval = BITMAP_FLUSH_INTERVAL;
  4352	
  4353		r = dm_get_device(ti, argv[0], dm_table_get_mode(ti->table), &ic->dev);
  4354		if (r) {
  4355			ti->error = "Device lookup failed";
  4356			goto bad;
  4357		}
  4358	
  4359		if (sscanf(argv[1], "%llu%c", &start, &dummy) != 1 || start != (sector_t)start) {
  4360			ti->error = "Invalid starting offset";
  4361			r = -EINVAL;
  4362			goto bad;
  4363		}
  4364		ic->start = start;
  4365	
  4366		if (strcmp(argv[2], "-")) {
  4367			if (sscanf(argv[2], "%u%c", &ic->tag_size, &dummy) != 1 || !ic->tag_size) {
  4368				ti->error = "Invalid tag size";
  4369				r = -EINVAL;
  4370				goto bad;
  4371			}
  4372		}
  4373	
  4374		if (!strcmp(argv[3], "J") || !strcmp(argv[3], "B") ||
  4375		    !strcmp(argv[3], "D") || !strcmp(argv[3], "R") ||
  4376		    !strcmp(argv[3], "I")) {
  4377			ic->mode = argv[3][0];
  4378		} else {
  4379			ti->error = "Invalid mode (expecting J, B, D, R, I)";
  4380			r = -EINVAL;
  4381			goto bad;
  4382		}
  4383	
  4384		journal_sectors = 0;
  4385		interleave_sectors = DEFAULT_INTERLEAVE_SECTORS;
  4386		buffer_sectors = DEFAULT_BUFFER_SECTORS;
  4387		journal_watermark = DEFAULT_JOURNAL_WATERMARK;
  4388		sync_msec = DEFAULT_SYNC_MSEC;
  4389		ic->sectors_per_block = 1;
  4390	
  4391		as.argc = argc - DIRECT_ARGUMENTS;
  4392		as.argv = argv + DIRECT_ARGUMENTS;
  4393		r = dm_read_arg_group(_args, &as, &extra_args, &ti->error);
  4394		if (r)
  4395			goto bad;
  4396	
  4397		while (extra_args--) {
  4398			const char *opt_string;
  4399			unsigned int val;
  4400			unsigned long long llval;
  4401	
  4402			opt_string = dm_shift_arg(&as);
  4403			if (!opt_string) {
  4404				r = -EINVAL;
  4405				ti->error = "Not enough feature arguments";
  4406				goto bad;
  4407			}
  4408			if (sscanf(opt_string, "journal_sectors:%u%c", &val, &dummy) == 1)
  4409				journal_sectors = val ? val : 1;
  4410			else if (sscanf(opt_string, "interleave_sectors:%u%c", &val, &dummy) == 1)
  4411				interleave_sectors = val;
  4412			else if (sscanf(opt_string, "buffer_sectors:%u%c", &val, &dummy) == 1)
  4413				buffer_sectors = val;
  4414			else if (sscanf(opt_string, "journal_watermark:%u%c", &val, &dummy) == 1 && val <= 100)
  4415				journal_watermark = val;
  4416			else if (sscanf(opt_string, "commit_time:%u%c", &val, &dummy) == 1)
  4417				sync_msec = val;
  4418			else if (!strncmp(opt_string, "meta_device:", strlen("meta_device:"))) {
  4419				if (ic->meta_dev) {
  4420					dm_put_device(ti, ic->meta_dev);
  4421					ic->meta_dev = NULL;
  4422				}
  4423				r = dm_get_device(ti, strchr(opt_string, ':') + 1,
  4424						  dm_table_get_mode(ti->table), &ic->meta_dev);
  4425				if (r) {
  4426					ti->error = "Device lookup failed";
  4427					goto bad;
  4428				}
  4429			} else if (sscanf(opt_string, "block_size:%u%c", &val, &dummy) == 1) {
  4430				if (val < 1 << SECTOR_SHIFT ||
  4431				    val > MAX_SECTORS_PER_BLOCK << SECTOR_SHIFT ||
  4432				    (val & (val - 1))) {
  4433					r = -EINVAL;
  4434					ti->error = "Invalid block_size argument";
  4435					goto bad;
  4436				}
  4437				ic->sectors_per_block = val >> SECTOR_SHIFT;
  4438			} else if (sscanf(opt_string, "sectors_per_bit:%llu%c", &llval, &dummy) == 1) {
  4439				log2_sectors_per_bitmap_bit = !llval ? 0 : __ilog2_u64(llval);
  4440			} else if (sscanf(opt_string, "bitmap_flush_interval:%u%c", &val, &dummy) == 1) {
  4441				if ((uint64_t)val >= (uint64_t)UINT_MAX * 1000 / HZ) {
  4442					r = -EINVAL;
  4443					ti->error = "Invalid bitmap_flush_interval argument";
  4444					goto bad;
  4445				}
  4446				ic->bitmap_flush_interval = msecs_to_jiffies(val);
  4447			} else if (!strncmp(opt_string, "internal_hash:", strlen("internal_hash:"))) {
  4448				r = get_alg_and_key(opt_string, &ic->internal_hash_alg, &ti->error,
  4449						    "Invalid internal_hash argument");
  4450				if (r)
  4451					goto bad;
  4452			} else if (!strncmp(opt_string, "journal_crypt:", strlen("journal_crypt:"))) {
  4453				r = get_alg_and_key(opt_string, &ic->journal_crypt_alg, &ti->error,
  4454						    "Invalid journal_crypt argument");
  4455				if (r)
  4456					goto bad;
  4457			} else if (!strncmp(opt_string, "journal_mac:", strlen("journal_mac:"))) {
  4458				r = get_alg_and_key(opt_string, &ic->journal_mac_alg, &ti->error,
  4459						    "Invalid journal_mac argument");
  4460				if (r)
  4461					goto bad;
  4462			} else if (!strcmp(opt_string, "recalculate")) {
  4463				ic->recalculate_flag = true;
  4464			} else if (!strcmp(opt_string, "reset_recalculate")) {
  4465				ic->recalculate_flag = true;
  4466				ic->reset_recalculate_flag = true;
  4467			} else if (!strcmp(opt_string, "allow_discards")) {
  4468				ic->discard = true;
  4469			} else if (!strcmp(opt_string, "fix_padding")) {
  4470				ic->fix_padding = true;
  4471			} else if (!strcmp(opt_string, "fix_hmac")) {
  4472				ic->fix_hmac = true;
  4473			} else if (!strcmp(opt_string, "legacy_recalculate")) {
  4474				ic->legacy_recalculate = true;
  4475			} else {
  4476				r = -EINVAL;
  4477				ti->error = "Invalid argument";
  4478				goto bad;
  4479			}
  4480		}
  4481	
  4482		ic->data_device_sectors = bdev_nr_sectors(ic->dev->bdev);
  4483		if (!ic->meta_dev)
  4484			ic->meta_device_sectors = ic->data_device_sectors;
  4485		else
  4486			ic->meta_device_sectors = bdev_nr_sectors(ic->meta_dev->bdev);
  4487	
  4488		if (!journal_sectors) {
  4489			journal_sectors = min((sector_t)DEFAULT_MAX_JOURNAL_SECTORS,
  4490					      ic->data_device_sectors >> DEFAULT_JOURNAL_SIZE_FACTOR);
  4491		}
  4492	
  4493		if (!buffer_sectors)
  4494			buffer_sectors = 1;
  4495		ic->log2_buffer_sectors = min((int)__fls(buffer_sectors), 31 - SECTOR_SHIFT);
  4496	
  4497		r = get_mac(&ic->internal_hash, &ic->internal_hash_alg, &ti->error,
  4498			    "Invalid internal hash", "Error setting internal hash key");
  4499		if (r)
  4500			goto bad;
  4501	
  4502		r = get_mac(&ic->journal_mac, &ic->journal_mac_alg, &ti->error,
  4503			    "Invalid journal mac", "Error setting journal mac key");
  4504		if (r)
  4505			goto bad;
  4506	
  4507		if (!ic->tag_size) {
  4508			if (!ic->internal_hash) {
  4509				ti->error = "Unknown tag size";
  4510				r = -EINVAL;
  4511				goto bad;
  4512			}
  4513			ic->tag_size = crypto_shash_digestsize(ic->internal_hash);
  4514		}
  4515		if (ic->tag_size > MAX_TAG_SIZE) {
  4516			ti->error = "Too big tag size";
  4517			r = -EINVAL;
  4518			goto bad;
  4519		}
  4520		if (!(ic->tag_size & (ic->tag_size - 1)))
  4521			ic->log2_tag_size = __ffs(ic->tag_size);
  4522		else
  4523			ic->log2_tag_size = -1;
  4524	
  4525		if (ic->mode == 'I') {
  4526			struct blk_integrity *bi;
  4527			if (ic->meta_dev) {
  4528				r = -EINVAL;
  4529				ti->error = "Metadata device not supported in inline mode";
  4530				goto bad;
  4531			}
  4532			if (!ic->internal_hash_alg.alg_string) {
  4533				r = -EINVAL;
  4534				ti->error = "Internal hash not set in inline mode";
  4535				goto bad;
  4536			}
  4537			if (ic->journal_crypt_alg.alg_string || ic->journal_mac_alg.alg_string) {
  4538				r = -EINVAL;
  4539				ti->error = "Journal crypt not supported in inline mode";
  4540				goto bad;
  4541			}
  4542			if (ic->discard) {
  4543				r = -EINVAL;
  4544				ti->error = "Discards not supported in inline mode";
  4545				goto bad;
  4546			}
  4547			bi = blk_get_integrity(ic->dev->bdev->bd_disk);
  4548			if (!bi || bi->csum_type != BLK_INTEGRITY_CSUM_NONE) {
  4549				r = -EINVAL;
  4550				ti->error = "Integrity profile not supported";
  4551				goto bad;
  4552			}
  4553			/*printk("tag_size: %u, tuple_size: %u\n", bi->tag_size, bi->tuple_size);*/
  4554			if (bi->tuple_size < ic->tag_size) {
  4555				r = -EINVAL;
  4556				ti->error = "The integrity profile is smaller than tag size";
  4557				goto bad;
  4558			}
> 4559			if (bi->tuple_size > PAGE_SIZE / 2) {
  4560				r = -EINVAL;
  4561				ti->error = "Too big tuple size";
  4562				goto bad;
  4563			}
  4564			ic->tuple_size = bi->tuple_size;
  4565			if (1 << bi->interval_exp != ic->sectors_per_block << SECTOR_SHIFT) {
  4566				r = -EINVAL;
  4567				ti->error = "Integrity profile sector size mismatch";
  4568				goto bad;
  4569			}
  4570		}
  4571	
  4572		if (ic->mode == 'B' && !ic->internal_hash) {
  4573			r = -EINVAL;
  4574			ti->error = "Bitmap mode can be only used with internal hash";
  4575			goto bad;
  4576		}
  4577	
  4578		if (ic->discard && !ic->internal_hash) {
  4579			r = -EINVAL;
  4580			ti->error = "Discard can be only used with internal hash";
  4581			goto bad;
  4582		}
  4583	
  4584		ic->autocommit_jiffies = msecs_to_jiffies(sync_msec);
  4585		ic->autocommit_msec = sync_msec;
  4586		timer_setup(&ic->autocommit_timer, autocommit_fn, 0);
  4587	
  4588		ic->io = dm_io_client_create();
  4589		if (IS_ERR(ic->io)) {
  4590			r = PTR_ERR(ic->io);
  4591			ic->io = NULL;
  4592			ti->error = "Cannot allocate dm io";
  4593			goto bad;
  4594		}
  4595	
  4596		r = mempool_init_slab_pool(&ic->journal_io_mempool, JOURNAL_IO_MEMPOOL, journal_io_cache);
  4597		if (r) {
  4598			ti->error = "Cannot allocate mempool";
  4599			goto bad;
  4600		}
  4601	
  4602		r = mempool_init_page_pool(&ic->recheck_pool, 1, ic->mode == 'I' ? 1 : 0);
  4603		if (r) {
  4604			ti->error = "Cannot allocate mempool";
  4605			goto bad;
  4606		}
  4607	
  4608		if (ic->mode == 'I') {
  4609			r = bioset_init(&ic->recheck_bios, RECHECK_POOL_SIZE, 0, BIOSET_NEED_BVECS);
  4610			if (r) {
  4611				ti->error = "Cannot allocate bio set";
  4612				goto bad;
  4613			}
  4614			r = bioset_integrity_create(&ic->recheck_bios, RECHECK_POOL_SIZE);
  4615			if (r) {
  4616				ti->error = "Cannot allocate bio integrity set";
  4617				r = -ENOMEM;
  4618				goto bad;
  4619			}
  4620		}
  4621	
  4622		ic->metadata_wq = alloc_workqueue("dm-integrity-metadata",
  4623						  WQ_MEM_RECLAIM, METADATA_WORKQUEUE_MAX_ACTIVE);
  4624		if (!ic->metadata_wq) {
  4625			ti->error = "Cannot allocate workqueue";
  4626			r = -ENOMEM;
  4627			goto bad;
  4628		}
  4629	
  4630		/*
  4631		 * If this workqueue weren't ordered, it would cause bio reordering
  4632		 * and reduced performance.
  4633		 */
  4634		ic->wait_wq = alloc_ordered_workqueue("dm-integrity-wait", WQ_MEM_RECLAIM);
  4635		if (!ic->wait_wq) {
  4636			ti->error = "Cannot allocate workqueue";
  4637			r = -ENOMEM;
  4638			goto bad;
  4639		}
  4640	
  4641		ic->offload_wq = alloc_workqueue("dm-integrity-offload", WQ_MEM_RECLAIM,
  4642						  METADATA_WORKQUEUE_MAX_ACTIVE);
  4643		if (!ic->offload_wq) {
  4644			ti->error = "Cannot allocate workqueue";
  4645			r = -ENOMEM;
  4646			goto bad;
  4647		}
  4648	
  4649		ic->commit_wq = alloc_workqueue("dm-integrity-commit", WQ_MEM_RECLAIM, 1);
  4650		if (!ic->commit_wq) {
  4651			ti->error = "Cannot allocate workqueue";
  4652			r = -ENOMEM;
  4653			goto bad;
  4654		}
  4655		INIT_WORK(&ic->commit_work, integrity_commit);
  4656	
  4657		if (ic->mode == 'J' || ic->mode == 'B') {
  4658			ic->writer_wq = alloc_workqueue("dm-integrity-writer", WQ_MEM_RECLAIM, 1);
  4659			if (!ic->writer_wq) {
  4660				ti->error = "Cannot allocate workqueue";
  4661				r = -ENOMEM;
  4662				goto bad;
  4663			}
  4664			INIT_WORK(&ic->writer_work, integrity_writer);
  4665		}
  4666	
  4667		ic->sb = alloc_pages_exact(SB_SECTORS << SECTOR_SHIFT, GFP_KERNEL);
  4668		if (!ic->sb) {
  4669			r = -ENOMEM;
  4670			ti->error = "Cannot allocate superblock area";
  4671			goto bad;
  4672		}
  4673	
  4674		r = sync_rw_sb(ic, REQ_OP_READ);
  4675		if (r) {
  4676			ti->error = "Error reading superblock";
  4677			goto bad;
  4678		}
  4679		should_write_sb = false;
  4680		if (memcmp(ic->sb->magic, SB_MAGIC, 8)) {
  4681			if (ic->mode != 'R') {
  4682				if (memchr_inv(ic->sb, 0, SB_SECTORS << SECTOR_SHIFT)) {
  4683					r = -EINVAL;
  4684					ti->error = "The device is not initialized";
  4685					goto bad;
  4686				}
  4687			}
  4688	
  4689			r = initialize_superblock(ic, journal_sectors, interleave_sectors);
  4690			if (r) {
  4691				ti->error = "Could not initialize superblock";
  4692				goto bad;
  4693			}
  4694			if (ic->mode != 'R')
  4695				should_write_sb = true;
  4696		}
  4697	
  4698		if (!ic->sb->version || ic->sb->version > SB_VERSION_6) {
  4699			r = -EINVAL;
  4700			ti->error = "Unknown version";
  4701			goto bad;
  4702		}
  4703		if (!!(ic->sb->flags & cpu_to_le32(SB_FLAG_INLINE)) != (ic->mode == 'I')) {
  4704			r = -EINVAL;
  4705			ti->error = "Inline flag mismatch";
  4706			goto bad;
  4707		}
  4708		if (le16_to_cpu(ic->sb->integrity_tag_size) != ic->tag_size) {
  4709			r = -EINVAL;
  4710			ti->error = "Tag size doesn't match the information in superblock";
  4711			goto bad;
  4712		}
  4713		if (ic->sb->log2_sectors_per_block != __ffs(ic->sectors_per_block)) {
  4714			r = -EINVAL;
  4715			ti->error = "Block size doesn't match the information in superblock";
  4716			goto bad;
  4717		}
  4718		if (!le32_to_cpu(ic->sb->journal_sections) != (ic->mode == 'I')) {
  4719			r = -EINVAL;
  4720			if (ic->mode != 'I')
  4721				ti->error = "Corrupted superblock, journal_sections is 0";
  4722			else
  4723				ti->error = "Corrupted superblock, journal_sections is not 0";
  4724			goto bad;
  4725		}
  4726		/* make sure that ti->max_io_len doesn't overflow */
  4727		if (!ic->meta_dev) {
  4728			if (ic->sb->log2_interleave_sectors < MIN_LOG2_INTERLEAVE_SECTORS ||
  4729			    ic->sb->log2_interleave_sectors > MAX_LOG2_INTERLEAVE_SECTORS) {
  4730				r = -EINVAL;
  4731				ti->error = "Invalid interleave_sectors in the superblock";
  4732				goto bad;
  4733			}
  4734		} else {
  4735			if (ic->sb->log2_interleave_sectors) {
  4736				r = -EINVAL;
  4737				ti->error = "Invalid interleave_sectors in the superblock";
  4738				goto bad;
  4739			}
  4740		}
  4741		if (!!(ic->sb->flags & cpu_to_le32(SB_FLAG_HAVE_JOURNAL_MAC)) != !!ic->journal_mac_alg.alg_string) {
  4742			r = -EINVAL;
  4743			ti->error = "Journal mac mismatch";
  4744			goto bad;
  4745		}
  4746	
  4747		get_provided_data_sectors(ic);
  4748		if (!ic->provided_data_sectors) {
  4749			r = -EINVAL;
  4750			ti->error = "The device is too small";
  4751			goto bad;
  4752		}
  4753	
  4754	try_smaller_buffer:
  4755		r = calculate_device_limits(ic);
  4756		if (r) {
  4757			if (ic->meta_dev) {
  4758				if (ic->log2_buffer_sectors > 3) {
  4759					ic->log2_buffer_sectors--;
  4760					goto try_smaller_buffer;
  4761				}
  4762			}
  4763			ti->error = "The device is too small";
  4764			goto bad;
  4765		}
  4766	
  4767		if (log2_sectors_per_bitmap_bit < 0)
  4768			log2_sectors_per_bitmap_bit = __fls(DEFAULT_SECTORS_PER_BITMAP_BIT);
  4769		if (log2_sectors_per_bitmap_bit < ic->sb->log2_sectors_per_block)
  4770			log2_sectors_per_bitmap_bit = ic->sb->log2_sectors_per_block;
  4771	
  4772		bits_in_journal = ((__u64)ic->journal_section_sectors * ic->journal_sections) << (SECTOR_SHIFT + 3);
  4773		if (bits_in_journal > UINT_MAX)
  4774			bits_in_journal = UINT_MAX;
  4775		if (bits_in_journal)
  4776			while (bits_in_journal < (ic->provided_data_sectors + ((sector_t)1 << log2_sectors_per_bitmap_bit) - 1) >> log2_sectors_per_bitmap_bit)
  4777				log2_sectors_per_bitmap_bit++;
  4778	
  4779		log2_blocks_per_bitmap_bit = log2_sectors_per_bitmap_bit - ic->sb->log2_sectors_per_block;
  4780		ic->log2_blocks_per_bitmap_bit = log2_blocks_per_bitmap_bit;
  4781		if (should_write_sb)
  4782			ic->sb->log2_blocks_per_bitmap_bit = log2_blocks_per_bitmap_bit;
  4783	
  4784		n_bitmap_bits = ((ic->provided_data_sectors >> ic->sb->log2_sectors_per_block)
  4785					+ (((sector_t)1 << log2_blocks_per_bitmap_bit) - 1)) >> log2_blocks_per_bitmap_bit;
  4786		ic->n_bitmap_blocks = DIV_ROUND_UP(n_bitmap_bits, BITMAP_BLOCK_SIZE * 8);
  4787	
  4788		if (!ic->meta_dev)
  4789			ic->log2_buffer_sectors = min(ic->log2_buffer_sectors, (__u8)__ffs(ic->metadata_run));
  4790	
  4791		if (ti->len > ic->provided_data_sectors) {
  4792			r = -EINVAL;
  4793			ti->error = "Not enough provided sectors for requested mapping size";
  4794			goto bad;
  4795		}
  4796	
  4797		threshold = (__u64)ic->journal_entries * (100 - journal_watermark);
  4798		threshold += 50;
  4799		do_div(threshold, 100);
  4800		ic->free_sectors_threshold = threshold;
  4801	
  4802		DEBUG_print("initialized:\n");
  4803		DEBUG_print("	integrity_tag_size %u\n", le16_to_cpu(ic->sb->integrity_tag_size));
  4804		DEBUG_print("	journal_entry_size %u\n", ic->journal_entry_size);
  4805		DEBUG_print("	journal_entries_per_sector %u\n", ic->journal_entries_per_sector);
  4806		DEBUG_print("	journal_section_entries %u\n", ic->journal_section_entries);
  4807		DEBUG_print("	journal_section_sectors %u\n", ic->journal_section_sectors);
  4808		DEBUG_print("	journal_sections %u\n", (unsigned int)le32_to_cpu(ic->sb->journal_sections));
  4809		DEBUG_print("	journal_entries %u\n", ic->journal_entries);
  4810		DEBUG_print("	log2_interleave_sectors %d\n", ic->sb->log2_interleave_sectors);
  4811		DEBUG_print("	data_device_sectors 0x%llx\n", bdev_nr_sectors(ic->dev->bdev));
  4812		DEBUG_print("	initial_sectors 0x%x\n", ic->initial_sectors);
  4813		DEBUG_print("	metadata_run 0x%x\n", ic->metadata_run);
  4814		DEBUG_print("	log2_metadata_run %d\n", ic->log2_metadata_run);
  4815		DEBUG_print("	provided_data_sectors 0x%llx (%llu)\n", ic->provided_data_sectors, ic->provided_data_sectors);
  4816		DEBUG_print("	log2_buffer_sectors %u\n", ic->log2_buffer_sectors);
  4817		DEBUG_print("	bits_in_journal %llu\n", bits_in_journal);
  4818	
  4819		if (ic->recalculate_flag && !(ic->sb->flags & cpu_to_le32(SB_FLAG_RECALCULATING))) {
  4820			ic->sb->flags |= cpu_to_le32(SB_FLAG_RECALCULATING);
  4821			ic->sb->recalc_sector = cpu_to_le64(0);
  4822		}
  4823	
  4824		if (ic->internal_hash) {
  4825			ic->recalc_wq = alloc_workqueue("dm-integrity-recalc", WQ_MEM_RECLAIM, 1);
  4826			if (!ic->recalc_wq) {
  4827				ti->error = "Cannot allocate workqueue";
  4828				r = -ENOMEM;
  4829				goto bad;
  4830			}
  4831			INIT_WORK(&ic->recalc_work, integrity_recalc);
  4832		} else {
  4833			if (ic->sb->flags & cpu_to_le32(SB_FLAG_RECALCULATING)) {
  4834				ti->error = "Recalculate can only be specified with internal_hash";
  4835				r = -EINVAL;
  4836				goto bad;
  4837			}
  4838		}
  4839	
  4840		if (ic->sb->flags & cpu_to_le32(SB_FLAG_RECALCULATING) &&
  4841		    le64_to_cpu(ic->sb->recalc_sector) < ic->provided_data_sectors &&
  4842		    dm_integrity_disable_recalculate(ic)) {
  4843			ti->error = "Recalculating with HMAC is disabled for security reasons - if you really need it, use the argument \"legacy_recalculate\"";
  4844			r = -EOPNOTSUPP;
  4845			goto bad;
  4846		}
  4847	
  4848		if (ic->mode != 'I') {
  4849			ic->bufio = dm_bufio_client_create(ic->meta_dev ? ic->meta_dev->bdev : ic->dev->bdev,
  4850					1U << (SECTOR_SHIFT + ic->log2_buffer_sectors), 1, 0, NULL, NULL, 0);
  4851			if (IS_ERR(ic->bufio)) {
  4852				r = PTR_ERR(ic->bufio);
  4853				ti->error = "Cannot initialize dm-bufio";
  4854				ic->bufio = NULL;
  4855				goto bad;
  4856			}
  4857			dm_bufio_set_sector_offset(ic->bufio, ic->start + ic->initial_sectors);
  4858		}
  4859	
  4860		if (ic->mode != 'R' && ic->mode != 'I') {
  4861			r = create_journal(ic, &ti->error);
  4862			if (r)
  4863				goto bad;
  4864	
  4865		}
  4866	
  4867		if (ic->mode == 'B') {
  4868			unsigned int i;
  4869			unsigned int n_bitmap_pages = DIV_ROUND_UP(ic->n_bitmap_blocks, PAGE_SIZE / BITMAP_BLOCK_SIZE);
  4870	
  4871			ic->recalc_bitmap = dm_integrity_alloc_page_list(n_bitmap_pages);
  4872			if (!ic->recalc_bitmap) {
  4873				r = -ENOMEM;
  4874				goto bad;
  4875			}
  4876			ic->may_write_bitmap = dm_integrity_alloc_page_list(n_bitmap_pages);
  4877			if (!ic->may_write_bitmap) {
  4878				r = -ENOMEM;
  4879				goto bad;
  4880			}
  4881			ic->bbs = kvmalloc_array(ic->n_bitmap_blocks, sizeof(struct bitmap_block_status), GFP_KERNEL);
  4882			if (!ic->bbs) {
  4883				r = -ENOMEM;
  4884				goto bad;
  4885			}
  4886			INIT_DELAYED_WORK(&ic->bitmap_flush_work, bitmap_flush_work);
  4887			for (i = 0; i < ic->n_bitmap_blocks; i++) {
  4888				struct bitmap_block_status *bbs = &ic->bbs[i];
  4889				unsigned int sector, pl_index, pl_offset;
  4890	
  4891				INIT_WORK(&bbs->work, bitmap_block_work);
  4892				bbs->ic = ic;
  4893				bbs->idx = i;
  4894				bio_list_init(&bbs->bio_queue);
  4895				spin_lock_init(&bbs->bio_queue_lock);
  4896	
  4897				sector = i * (BITMAP_BLOCK_SIZE >> SECTOR_SHIFT);
  4898				pl_index = sector >> (PAGE_SHIFT - SECTOR_SHIFT);
  4899				pl_offset = (sector << SECTOR_SHIFT) & (PAGE_SIZE - 1);
  4900	
  4901				bbs->bitmap = lowmem_page_address(ic->journal[pl_index].page) + pl_offset;
  4902			}
  4903		}
  4904	
  4905		if (should_write_sb) {
  4906			init_journal(ic, 0, ic->journal_sections, 0);
  4907			r = dm_integrity_failed(ic);
  4908			if (unlikely(r)) {
  4909				ti->error = "Error initializing journal";
  4910				goto bad;
  4911			}
  4912			r = sync_rw_sb(ic, REQ_OP_WRITE | REQ_FUA);
  4913			if (r) {
  4914				ti->error = "Error initializing superblock";
  4915				goto bad;
  4916			}
  4917			ic->just_formatted = true;
  4918		}
  4919	
  4920		if (!ic->meta_dev && ic->mode != 'I') {
  4921			r = dm_set_target_max_io_len(ti, 1U << ic->sb->log2_interleave_sectors);
  4922			if (r)
  4923				goto bad;
  4924		}
  4925		if (ic->mode == 'B') {
  4926			unsigned int max_io_len;
  4927	
  4928			max_io_len = ((sector_t)ic->sectors_per_block << ic->log2_blocks_per_bitmap_bit) * (BITMAP_BLOCK_SIZE * 8);
  4929			if (!max_io_len)
  4930				max_io_len = 1U << 31;
  4931			DEBUG_print("max_io_len: old %u, new %u\n", ti->max_io_len, max_io_len);
  4932			if (!ti->max_io_len || ti->max_io_len > max_io_len) {
  4933				r = dm_set_target_max_io_len(ti, max_io_len);
  4934				if (r)
  4935					goto bad;
  4936			}
  4937		}
  4938	
  4939		ti->num_flush_bios = 1;
  4940		ti->flush_supported = true;
  4941		if (ic->discard)
  4942			ti->num_discard_bios = 1;
  4943	
  4944		if (ic->mode == 'I')
  4945			ti->mempool_needs_integrity = true;
  4946	
  4947		dm_audit_log_ctr(DM_MSG_PREFIX, ti, 1);
  4948		return 0;
  4949	
  4950	bad:
  4951		dm_audit_log_ctr(DM_MSG_PREFIX, ti, 0);
  4952		dm_integrity_dtr(ti);
  4953		return r;
  4954	}
  4955	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
