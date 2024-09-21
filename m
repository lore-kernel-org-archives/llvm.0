Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A703314E2E8;
	Sat, 21 Sep 2024 09:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726911946; cv=none; b=G8wwJSdk3ek/ZsQEDq8jTKabPaE3/sZ2icdGOk/6g0rQeZ4SZMp0Og3wQHR3f9WAaS62jgSuyPO4ZArr7uBvlqtPcEP62ko4Xf2Q7dyWjWgT/xEPUXpPKz6/N7eLxVsXyJK/DSep4LbdCF6K+DCFu2YuknZoDLEB3pWRiVXynjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726911946; c=relaxed/simple;
	bh=0KuOncQeBEmYI8MKJ2kJyN4kleqgmZWyASmcQIMLubc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QVTEGuYVQFT3WHbpEaXO+xGDtThGhKYdjnCg9UoCL2IE8vvTZ/fA4qScx8atLNEFmfcsYPoP/PCngIXcozDRsUdM8BKRnM//IV2nHtzbezLqEzUdlLbwL82y7uurKQZVOd0f351WVu5AYuOM8GxItT5hyJY2CNOO1tqYH5NQAiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SnkcqICY; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SnkcqICY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726911945; x=1758447945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0KuOncQeBEmYI8MKJ2kJyN4kleqgmZWyASmcQIMLubc=;
  b=SnkcqICYpzpykTgw9hG4NLZZ4p6eMXy2dZn60zzWq1+4aaoD6/V6S60s
   h/KIS3JDLg3gGdFhmVCZQFSGSf+svYrEAabcZiBufZTjDvJvdmCuuVX0k
   RAKxl/RfXqJ43rzjkDsTRuTPZ/63AnPccU9CdsQ+2Es8nkkPJ/C5JOKfm
   F2GCEK2wsKvL4WfawT1ov2nFl1cvQVMnRUZKxABQRV8/1vYoeNjQxboUZ
   N9PeGKqO9CBgoiVuXJAr1Yc6FvhRwYVFRB8ptIGR4Zo8jt5gTu2wOB/df
   jpzctDoPmrtJz6yYzwZTHOo6MQncJaA3hEN3hNi9j+0OM7Plf2csNndF0
   w==;
X-CSE-ConnectionGUID: DazRjjLQSMmfaS4tueg5ug==
X-CSE-MsgGUID: uZSfKXpiQSGxktq1u7wz2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="25786434"
X-IronPort-AV: E=Sophos;i="6.10,246,1719903600"; 
   d="scan'208";a="25786434"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 02:45:41 -0700
X-CSE-ConnectionGUID: sizi2zJ1QsedTW/eDF1F2w==
X-CSE-MsgGUID: /fifwVHyT7uHQSBMQ5DeeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,246,1719903600"; 
   d="scan'208";a="101281037"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Sep 2024 02:45:40 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srwgL-000FKN-2F;
	Sat, 21 Sep 2024 09:45:37 +0000
Date: Sat, 21 Sep 2024 17:45:32 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-writeback 12/13] fs/afs/dir.c:296:9: warning:
 explicitly assigning value of variable of type 'ssize_t' (aka 'long') to
 itself
Message-ID: <202409211745.cpcn0ckB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-writeback
head:   1b8d06c4ea0b6eb74b52b9dadb866a92c0cc5b69
commit: 0f34d30a14a72f72a214488bf16a9dcd3b21509e [12/13] afs: Use netfslib for directories
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240921/202409211745.cpcn0ckB-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 8663a75fa2f31299ab8d1d90288d9df92aadee88)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240921/202409211745.cpcn0ckB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409211745.cpcn0ckB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/afs/dir.c:11:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2237:
   include/linux/vmstat.h:503:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     503 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     504 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:510:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     510 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     511 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:523:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     523 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     524 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/afs/dir.c:18:
   In file included from fs/afs/internal.h:23:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from fs/afs/dir.c:18:
   In file included from fs/afs/internal.h:23:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from fs/afs/dir.c:18:
   In file included from fs/afs/internal.h:23:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> fs/afs/dir.c:296:9: warning: explicitly assigning value of variable of type 'ssize_t' (aka 'long') to itself [-Wself-assign]
     296 |                                 ret = ret;
         |                                 ~~~ ^ ~~~
   17 warnings generated.


vim +296 fs/afs/dir.c

   246	
   247	/*
   248	 * Perform a read of the directory.
   249	 */
   250	static ssize_t afs_do_read_dir(struct afs_vnode *dvnode, struct file *file)
   251	{
   252		struct iov_iter iter;
   253		ssize_t ret;
   254		loff_t i_size;
   255	
   256		i_size = i_size_read(&dvnode->netfs.inode);
   257		if (i_size < 2048)
   258			return afs_bad(dvnode, afs_file_error_dir_small);
   259		if (i_size > 2048 * 1024) {
   260			trace_afs_file_error(dvnode, -EFBIG, afs_file_error_dir_big);
   261			return -EFBIG;
   262		}
   263	
   264		/* Lock all the folios in the range we need, filling in any gaps.  We
   265		 * drop the references we get from the VM here analogously with the VM
   266		 * readahead code.
   267		 */
   268		if (dvnode->directory_size < i_size) {
   269			size_t cur_size = dvnode->directory_size;
   270	
   271			ret = netfs_alloc_folioq_buffer(dvnode->netfs.inode.i_mapping,
   272							&dvnode->directory, &cur_size, i_size,
   273							GFP_KERNEL | __GFP_HIGHMEM);
   274			dvnode->directory_size = cur_size;
   275			if (ret < 0)
   276				return ret;
   277		}
   278	
   279		iov_iter_folio_queue(&iter, ITER_DEST, dvnode->directory, 0, 0, dvnode->directory_size);
   280	
   281		/* AFS requires us to perform the read of a directory synchronously as
   282		 * a single unit to avoid issues with the directory contents being
   283		 * changed between reads.
   284		 */
   285		ret = netfs_read_single(&dvnode->netfs.inode, file, &iter);
   286		if (ret >= 0) {
   287			i_size = i_size_read(&dvnode->netfs.inode);
   288			if (i_size > ret) {
   289				/* The content has grown, so we need to expand the
   290				 * buffer.
   291				 */
   292				ret = -ESTALE;
   293			} else {
   294				int ret2 = afs_dir_check(dvnode);
   295				if (ret2 < 0)
 > 296					ret = ret;
   297			}
   298		}
   299	
   300		return ret;
   301	}
   302	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
