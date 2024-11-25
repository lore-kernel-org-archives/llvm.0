Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A561B2187;
	Mon, 25 Nov 2024 13:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732541892; cv=none; b=U9iDdZRFqa/SDSyB75xLBQF146o2tUoMyAT1c3iZvmHX9ZHDeYXgySE7OK9JLX6jqh9PMKmvDZHD57wdEPv3LItY28Pz3s9dMXfFKl94rHNkrNhh1HwnMB/so10nvwV+xp7FPXtQPIgNuofL6YSuy6CHixwuqJ0Kv1thAKknriA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732541892; c=relaxed/simple;
	bh=6992Qzl9SHjdFsac/kl1de55U7JtJaem1omRCsXNFz8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YKxg/9097TkRy5Jr8cOb/ssywwVvwGpv85f2d9zAKkapRxkgGcqjw4d30boacVs2oZQ9Kxuc0zb25ScrtGvvLydtF9QxWNtO7wVbvxMdjDyPlSEIGXU6Z7i9HkiqvZZcH5D9NY8ubGYB/JpPorUcoy8mmm9NCmeq9T2sOAYZW/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e+H3a6sM; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e+H3a6sM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732541891; x=1764077891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6992Qzl9SHjdFsac/kl1de55U7JtJaem1omRCsXNFz8=;
  b=e+H3a6sM/JgmUxeQiOT7YM/oEOm/WBekK4NEyMwaEcHnjfVPlg6P+Z85
   dKSdaOBbP0s1Hh67shiTzIAK+pGDURhcXLm7KwrlqXoyERVrXOqrKLVy3
   SrZM/12El0ql6saJNn+RKbOKL/MHEKVC78Q8ujq2QXuKpKoe5P36GoVFB
   eZ1O3K0Iqd4RvVkuikZfpua/WCeGlpGY3slM1H6oblOZtEV9u6Fet+Vfg
   eohyzUWHD/CvI1+vV8QMc7NUI9KZ2XbgPjRXDUA28oJ75J4HKn33vwIOl
   awSNtzLbwPPo+N4ZbPUr24oD9y0P4J5uJaVfk02Jhaed/k/HITvNSupTL
   Q==;
X-CSE-ConnectionGUID: NipM0AIUSw2T5al+Td58IA==
X-CSE-MsgGUID: QxKu8oehSKuFIUqbFOqpMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="36427567"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="36427567"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 05:38:07 -0800
X-CSE-ConnectionGUID: RM2x+MXSStufTEAdlTX6VQ==
X-CSE-MsgGUID: MmUz9/OzR76uilkUXGpQ3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="96329474"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Nov 2024 05:38:05 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFZHu-0006RR-2g;
	Mon, 25 Nov 2024 13:38:02 +0000
Date: Mon, 25 Nov 2024 21:37:49 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:inode_hash_find_debug 123/124]
 fs/bcachefs/fs.c:398:2: error: expected expression
Message-ID: <202411252127.LPBKfLzo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs inode_hash_find_debug
head:   942bfc10d286a7fe82d8064250cf0341c1f86608
commit: 7f0ae9ab2f5f2ea12951f1d5ff04ff35bbee8d3f [123/124] bcachefs: Debug counters for bch2_inode_hash_find()
config: hexagon-randconfig-002-20241125 (https://download.01.org/0day-ci/archive/20241125/202411252127.LPBKfLzo-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411252127.LPBKfLzo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411252127.LPBKfLzo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/bcachefs/fs.c:4:
   In file included from fs/bcachefs/bcachefs.h:188:
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
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from fs/bcachefs/fs.c:4:
   In file included from fs/bcachefs/bcachefs.h:188:
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
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from fs/bcachefs/fs.c:4:
   In file included from fs/bcachefs/bcachefs.h:188:
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
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> fs/bcachefs/fs.c:398:2: error: expected expression
           int ret = rhashtable_lookup_insert_key(&c->vfs_inodes_table,
           ^
>> fs/bcachefs/fs.c:402:15: error: use of undeclared identifier 'ret'
           if (unlikely(ret)) {
                        ^
   fs/bcachefs/fs.c:403:30: error: use of undeclared identifier 'ret'
                   pr_info("%s", bch2_err_str(ret));
                                              ^
   6 warnings and 3 errors generated.


vim +398 fs/bcachefs/fs.c

   387	
   388	static struct bch_inode_info *bch2_inode_hash_insert(struct bch_fs *c,
   389							     struct btree_trans *trans,
   390							     struct bch_inode_info *inode)
   391	{
   392		struct bch_inode_info *old = inode;
   393		struct inode_hash_find_counters s = {};
   394	
   395		set_bit(EI_INODE_HASHED, &inode->ei_flags);
   396		smp_mb__after_atomic();
   397	retry:
 > 398		int ret = rhashtable_lookup_insert_key(&c->vfs_inodes_table,
   399						&inode->ei_inum,
   400						&inode->hash,
   401						bch2_vfs_inodes_params);
 > 402		if (unlikely(ret)) {
   403			pr_info("%s", bch2_err_str(ret));
   404			old = bch2_inode_hash_find(c, trans, inode->ei_inum, &s);
   405			if (!old)
   406				goto retry;
   407	
   408			clear_bit(EI_INODE_HASHED, &inode->ei_flags);
   409	
   410			/*
   411			 * bcachefs doesn't use I_NEW; we have no use for it since we
   412			 * only insert fully created inodes in the inode hash table. But
   413			 * discard_new_inode() expects it to be set...
   414			 */
   415			inode->v.i_state |= I_NEW;
   416			/*
   417			 * We don't want bch2_evict_inode() to delete the inode on disk,
   418			 * we just raced and had another inode in cache. Normally new
   419			 * inodes don't have nlink == 0 - except tmpfiles do...
   420			 */
   421			set_nlink(&inode->v, 1);
   422			discard_new_inode(&inode->v);
   423			return old;
   424		}
   425	
   426		inode_fake_hash(&inode->v);
   427	
   428		inode_sb_list_add(&inode->v);
   429	
   430		mutex_lock(&c->vfs_inodes_lock);
   431		list_add(&inode->ei_vfs_inode_list, &c->vfs_inodes_list);
   432		mutex_unlock(&c->vfs_inodes_lock);
   433		return inode;
   434	}
   435	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
