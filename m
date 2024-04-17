Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A62171673;
	Wed, 17 Apr 2024 17:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713374836; cv=none; b=RVYUd9SdSqeiMrxC7z/E+2uneQw/WJSXtNX2OVNRLupNhTAzyxeq8X2unY2gHCv6RUN7MbgXNiHXeo2iDe/ZIwuV3OMOkPatm3BjmuhmkhIFRA8G3ieheUzYbhvNHZS6wpLwBXTzSIqaPYRg/1FQdGk0iiwtF5i5FLdnu8OlhKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713374836; c=relaxed/simple;
	bh=tetqATcIRyeLe7XhjLVK7J1PUOARjEBhY1obh91qHKY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t3MwLAgIqJ6IfBR0KK55X1OOUw77Y5EjtW9c4wHauBzCNvVdmZ6VDvpk9cWuoiJOSoerTYG15TWyr58X6NbbsUUZhV1Y/D55bs9enV/PJlesW5rUIjcwejlYDfjeRS8WPp9jjFqAGQrskIzykPEdH54PKGblSP56cLMztfi0oFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B5VobCBt; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B5VobCBt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713374834; x=1744910834;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tetqATcIRyeLe7XhjLVK7J1PUOARjEBhY1obh91qHKY=;
  b=B5VobCBtj7BLoLaGcIf/7VRxZS/awAIGXu7M76dLVaJOiiBw7KMLzy1V
   lvTthzWjVndmPh0JWlyKg/QTHB88CHd3v303bixm0qclDwZFVe1vNBJf4
   3VcCN+LOAgjJvSYFCGUVHMIAIujlsUseJ0HA8UX2qDmKkdE9zQwbx/0Mi
   QyhmfXYmrhwavbq0M9YpjLwx6Z3lhxUxnRB8JXD6Nwgnwss59QryEVFSS
   hvwfv0RI9xVdwEzyh4DOQf4pci519iols8P+a2RtEeq707UoARoyUjUa+
   hoQqu1NpVZGUDw5HXTQVrM3yIkkyJQitQg8ClnLgxMocHyLwpDjjS5B/O
   g==;
X-CSE-ConnectionGUID: Zzb81OvTSuy0HKJHZXWSBw==
X-CSE-MsgGUID: 0m5MkmIQS/mG587Z2Q5UGg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="34279845"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="34279845"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:27:14 -0700
X-CSE-ConnectionGUID: 1wR8MaZCSGq/eKkiRW1vvw==
X-CSE-MsgGUID: t6xPuEDvSrmmtHR00TOd/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="22739222"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 17 Apr 2024 10:27:12 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rx93u-0006qW-0M;
	Wed, 17 Apr 2024 17:27:10 +0000
Date: Thu, 18 Apr 2024 01:26:12 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:cifs-netfs 7/40] fs/netfs/direct_write.c:165:44:
 warning: variable 'end' is uninitialized when used here
Message-ID: <202404180108.grnZRvXY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git cifs-netfs
head:   8dc73cdbbce16b41d4de537600385262aa8b7613
commit: 3a3871ab79037b2330014b3cbe16676c74e10c00 [7/40] mm: Provide a means of invalidation without using launder_folio
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240418/202404180108.grnZRvXY-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240418/202404180108.grnZRvXY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404180108.grnZRvXY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/netfs/direct_write.c:10:
   In file included from fs/netfs/internal.h:10:
   In file included from include/linux/netfs.h:19:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from fs/netfs/direct_write.c:10:
   In file included from fs/netfs/internal.h:10:
   In file included from include/linux/netfs.h:19:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from fs/netfs/direct_write.c:10:
   In file included from fs/netfs/internal.h:10:
   In file included from include/linux/netfs.h:19:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/netfs/direct_write.c:10:
   In file included from fs/netfs/internal.h:10:
   In file included from include/linux/netfs.h:19:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> fs/netfs/direct_write.c:165:44: warning: variable 'end' is uninitialized when used here [-Wuninitialized]
     165 |                 if (filemap_range_has_page(mapping, pos, end))
         |                                                          ^~~
   fs/netfs/direct_write.c:138:24: note: initialize the variable 'end' to silence this warning
     138 |         unsigned long long end;
         |                               ^
         |                                = 0
   8 warnings generated.


vim +/end +165 fs/netfs/direct_write.c

   118	
   119	/**
   120	 * netfs_unbuffered_write_iter - Unbuffered write to a file
   121	 * @iocb: IO state structure
   122	 * @from: iov_iter with data to write
   123	 *
   124	 * Do an unbuffered write to a file, writing the data directly to the server
   125	 * and not lodging the data in the pagecache.
   126	 *
   127	 * Return:
   128	 * * Negative error code if no data has been written at all of
   129	 *   vfs_fsync_range() failed for a synchronous write
   130	 * * Number of bytes written, even for truncated writes
   131	 */
   132	ssize_t netfs_unbuffered_write_iter(struct kiocb *iocb, struct iov_iter *from)
   133	{
   134		struct file *file = iocb->ki_filp;
   135		struct address_space *mapping = file->f_mapping;
   136		struct inode *inode = mapping->host;
   137		struct netfs_inode *ictx = netfs_inode(inode);
   138		unsigned long long end;
   139		ssize_t ret;
   140		loff_t pos = iocb->ki_pos;
   141	
   142		_enter("%llx,%zx,%llx", pos, iov_iter_count(from), i_size_read(inode));
   143	
   144		if (!iov_iter_count(from))
   145			return 0;
   146	
   147		trace_netfs_write_iter(iocb, from);
   148		netfs_stat(&netfs_n_rh_dio_write);
   149	
   150		ret = netfs_start_io_direct(inode);
   151		if (ret < 0)
   152			return ret;
   153		ret = generic_write_checks(iocb, from);
   154		if (ret <= 0)
   155			goto out;
   156		ret = file_remove_privs(file);
   157		if (ret < 0)
   158			goto out;
   159		ret = file_update_time(file);
   160		if (ret < 0)
   161			goto out;
   162		if (iocb->ki_flags & IOCB_NOWAIT) {
   163			/* We could block if there are any pages in the range. */
   164			ret = -EAGAIN;
 > 165			if (filemap_range_has_page(mapping, pos, end))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
