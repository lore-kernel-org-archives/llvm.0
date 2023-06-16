Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F591ACA2;
	Fri, 16 Jun 2023 16:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686932084; x=1718468084;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z65nm2dEdioRGHx9EZ1gz14d7F5txR2xE24eguRT540=;
  b=iKOCzfKaNoFXhAY2V4/owQyvEHYWKB7TwL4cjPPAmb+9oSj2rm3JWn5L
   U/isTRqERt17oIJCu8OBxWcS9lAEMHBl1DFv29sOo/PNlQudhOLD8fnqW
   134813RnYnoZqxiW/1gfwC/A6G3hrc0iQIiRIjoq7icuzgLpc/+W6+WS7
   JimziQVReggLtU3uywjgU5DW3dA3Qy0QFN/X9bmqSbIH+mkr5R+iYg10X
   z8F+1KlW876BcdLCKF2RgsiB2VTn743B34XdhdJow9fteRFHz+CXlVumH
   Fv3jirhQ6zigA61ljY2zOZbE3UMJi24FfA265Xe4Ir+wcZ/CPWzSyB8DM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="362666312"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="362666312"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 09:14:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="782960762"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="782960762"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 16 Jun 2023 09:14:42 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAC5x-0001Xi-2d;
	Fri, 16 Jun 2023 16:14:41 +0000
Date: Sat, 17 Jun 2023 00:13:42 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: [mcgrof-next:large-block-20230616-hacks 37/38]
 fs/iomap/buffered-io.c:830:42: warning: if statement has empty body
Message-ID: <202306170021.8TZdCFER-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git large-block-20230616-hacks
head:   5416cb31017b28b25627f4f5b8292af96bb65f58
commit: ddf48d516b57d686874c57ffa3630ea19c4b7fdb [37/38] iomap: Copy larger chunks from userspace
config: hexagon-randconfig-r045-20230616 (https://download.01.org/0day-ci/archive/20230617/202306170021.8TZdCFER-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230617/202306170021.8TZdCFER-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306170021.8TZdCFER-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/iomap/buffered-io.c:9:
   In file included from include/linux/iomap.h:7:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from fs/iomap/buffered-io.c:9:
   In file included from include/linux/iomap.h:7:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/iomap/buffered-io.c:9:
   In file included from include/linux/iomap.h:7:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> fs/iomap/buffered-io.c:830:42: warning: if statement has empty body [-Wempty-body]
     830 |                 if (bytes > folio_size(folio) - offset);
         |                                                        ^
   fs/iomap/buffered-io.c:830:42: note: put the semicolon on a separate line to silence this warning
   7 warnings generated.


vim +830 fs/iomap/buffered-io.c

   780	
   781	static loff_t iomap_write_iter(struct iomap_iter *iter, struct iov_iter *i)
   782	{
   783		loff_t length = iomap_length(iter);
   784		size_t chunk = PAGE_SIZE << MAX_PAGECACHE_ORDER;
   785		loff_t pos = iter->pos;
   786		ssize_t written = 0;
   787		long status = 0;
   788		struct address_space *mapping = iter->inode->i_mapping;
   789		unsigned int bdp_flags = (iter->flags & IOMAP_NOWAIT) ? BDP_ASYNC : 0;
   790	
   791		do {
   792			struct folio *folio;
   793			size_t offset;		/* Offset into folio */
   794			unsigned long bytes;	/* Bytes to write to folio */
   795			size_t copied;		/* Bytes copied from user */
   796	
   797	again:
   798			offset = pos & (chunk - 1);
   799			bytes = min(chunk - offset, iov_iter_count(i));
   800			status = balance_dirty_pages_ratelimited_flags(mapping,
   801								       bdp_flags);
   802			if (unlikely(status))
   803				break;
   804	
   805			if (bytes > length)
   806				bytes = length;
   807	
   808			/*
   809			 * Bring in the user page that we'll copy from _first_.
   810			 * Otherwise there's a nasty deadlock on copying from the
   811			 * same page as we're writing to, without it being marked
   812			 * up-to-date.
   813			 *
   814			 * For async buffered writes the assumption is that the user
   815			 * page has already been faulted in. This can be optimized by
   816			 * faulting the user page.
   817			 */
   818			if (unlikely(fault_in_iov_iter_readable(i, bytes) == bytes)) {
   819				status = -EFAULT;
   820				break;
   821			}
   822	
   823			status = iomap_write_begin(iter, pos, bytes, &folio);
   824			if (unlikely(status))
   825				break;
   826			if (iter->iomap.flags & IOMAP_F_STALE)
   827				break;
   828	
   829			offset = offset_in_folio(folio, pos);
 > 830			if (bytes > folio_size(folio) - offset);
   831				bytes = folio_size(folio) - offset;
   832	
   833			if (mapping_writably_mapped(mapping))
   834				flush_dcache_folio(folio);
   835	
   836			copied = copy_page_from_iter_atomic(&folio->page, offset, bytes, i);
   837	
   838			status = iomap_write_end(iter, pos, bytes, copied, folio);
   839	
   840			if (unlikely(copied != status))
   841				iov_iter_revert(i, copied - status);
   842	
   843			cond_resched();
   844			if (unlikely(status == 0)) {
   845				/*
   846				 * A short copy made iomap_write_end() reject the
   847				 * thing entirely.  Might be memory poisoning
   848				 * halfway through, might be a race with munmap,
   849				 * might be severe memory pressure.
   850				 */
   851				if (copied)
   852					bytes = copied;
   853				if (chunk > PAGE_SIZE)
   854					chunk /= 2;
   855				goto again;
   856			}
   857			pos += status;
   858			written += status;
   859			length -= status;
   860		} while (iov_iter_count(i) && length);
   861	
   862		if (status == -EAGAIN) {
   863			iov_iter_revert(i, written);
   864			return -EAGAIN;
   865		}
   866		return written ? written : status;
   867	}
   868	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
