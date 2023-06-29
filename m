Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C6614AB3;
	Thu, 29 Jun 2023 20:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688068843; x=1719604843;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QYIWA8a+vS5++74Baqv155mxyU5PjSRbxOrM+BHNmxg=;
  b=f4j3D8ZBKXh6jbnE0t35bmhVIJ7MTFDmn8bSSUS/Irp4KjF7i9KfszA1
   CC4k+9FYkwWCyomq/zT/TdU7tDqf9KT2tnmbvPLwWvu5VipWZUB81rqUP
   66dYK8ozM3Yw5lmf9stw4vRGp8q7GRXkbfrm0thiSu3gsh5SXRObu96tH
   pHoGphK7PiM29dxWYzf27KSLNE8OKL6QZ0LNAKocPqsI+SCoWbHA7ZAxc
   TtXYyeb3FFEy48eKUHOSSxsGJ9Fg29Kj7NaOQOloZ4f8JF8UR6G3+NX1r
   gnLoAPbhelVC+SO7c0r9CbTLFJD4sXXHmogcp2HKOAggy7gpBxKYp84Rz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="448593636"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="448593636"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 13:00:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="1047937532"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="1047937532"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 29 Jun 2023 13:00:38 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qExok-000EMn-0l;
	Thu, 29 Jun 2023 20:00:38 +0000
Date: Fri, 30 Jun 2023 04:00:05 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:splice-fix-corruption 2/4] fs/splice.c:1393:17:
 warning: comparison of distinct pointer types ('typeof ((typeof ((1UL << 18)
 - src_offset % (1UL << 18)))__builtin_choose_expr(((!!(sizeof ((typeof ((1UL
 << 18) - src_offset % (1UL << 18)) *)1 == (typeof ((1UL << 18) - dst_offset
 % (1...
Message-ID: <202306300333.e806BkeL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git splice-fix-corruption
head:   b7635ac359c8d2a679e0c0bd9bf7acab652ff3fb
commit: 6e9585ea6f3be545afbba5d6f1bbd17ba205e92b [2/4] splice: Make vmsplice() steal or copy
config: hexagon-randconfig-r041-20230629 (https://download.01.org/0day-ci/archive/20230630/202306300333.e806BkeL-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306300333.e806BkeL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306300333.e806BkeL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/splice.c:21:
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
   In file included from fs/splice.c:21:
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
   In file included from fs/splice.c:21:
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
>> fs/splice.c:1393:17: warning: comparison of distinct pointer types ('typeof ((typeof ((1UL << 18) - src_offset % (1UL << 18)))__builtin_choose_expr(((!!(sizeof ((typeof ((1UL << 18) - src_offset % (1UL << 18)) *)1 == (typeof ((1UL << 18) - dst_offset % (1UL << 18)) *)1))) && ((sizeof(int) == sizeof (*(8 ? ((void *)((long)((1UL << 18) - src_offset % (1UL << 18)) * 0L)) : (int *)8))) && (sizeof(int) == sizeof (*(8 ? ((void *)((long)((1UL << 18) - dst_offset % (1UL << 18)) * 0L)) : (int *)8))))), (((1UL << 18) - src_offset % (1UL << 18)) < ((1UL << 18) - dst_offset % (1UL << 18)) ? ((1UL << 18) - src_offset % (1UL << 18)) : ((1UL << 18) - dst_offset % (1UL << 18))), ({
       typeof ((1UL << 18) - src_offset % (1UL << 18)) __UNIQUE_ID___x336 = ((1UL << 18) - src_offset % (1UL << 18));
       typeof ((1UL << 18) - dst_offset % (1UL << 18)) __UNIQUE_ID___y337 = ((1UL << 18) - dst_offset % (1UL << 18));
       ((__UNIQUE_ID___x336) < (__UNIQUE_ID___y337) ? (__UNIQUE_ID___x336) : (__UNIQUE_ID___y337));
   }))) *' (aka 'unsigned long *') and 'typeof (size) *' (aka 'unsigned int *')) [-Wcompare-distinct-pointer-types]
    1393 |                 size_t part = min3(PAGE_SIZE - src_offset % PAGE_SIZE,
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1394 |                                    PAGE_SIZE - dst_offset % PAGE_SIZE,
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1395 |                                    size);
         |                                    ~~~~~
   include/linux/minmax.h:82:23: note: expanded from macro 'min3'
      82 | #define min3(x, y, z) min((typeof(x))min(x, y), z)
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:67:19: note: expanded from macro 'min'
      67 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
      26 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                    ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
>> fs/splice.c:1458:9: warning: comparison of distinct pointer types ('typeof (size) *' (aka 'unsigned int *') and 'typeof ((1UL << 18) - offset % (1UL << 18)) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
    1458 |         size = min(size, PAGE_SIZE - offset % PAGE_SIZE);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:67:19: note: expanded from macro 'min'
      67 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
      26 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                    ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   fs/splice.c:176:41: warning: unused variable 'user_page_pipe_buf_ops' [-Wunused-const-variable]
     176 | static const struct pipe_buf_operations user_page_pipe_buf_ops = {
         |                                         ^
   9 warnings generated.


vim +1393 fs/splice.c

  1385	
  1386	static void copy_folio_to_folio(struct folio *src, size_t src_offset,
  1387					struct folio *dst, size_t dst_offset,
  1388					size_t size)
  1389	{
  1390		void *p, *q;
  1391	
  1392		while (size > 0) {
> 1393			size_t part = min3(PAGE_SIZE - src_offset % PAGE_SIZE,
  1394					   PAGE_SIZE - dst_offset % PAGE_SIZE,
  1395					   size);
  1396	
  1397			p = kmap_local_folio(src, src_offset);
  1398			q = kmap_local_folio(dst, dst_offset);
  1399			memcpy(q, p, part);
  1400			kunmap_local(p);
  1401			kunmap_local(q);
  1402			src_offset += part;
  1403			dst_offset += part;
  1404			size -= part;
  1405		}
  1406	}
  1407	
  1408	static int splice_try_to_steal_page(struct pipe_inode_info *pipe,
  1409					    struct page *page, size_t offset,
  1410					    size_t size, unsigned int splice_flags)
  1411	{
  1412		struct folio *folio = page_folio(page), *copy;
  1413		unsigned int flags = 0;
  1414		size_t fsize = folio_size(folio), spliced = 0;
  1415	
  1416		if (!(splice_flags & SPLICE_F_GIFT) ||
  1417		    fsize != PAGE_SIZE || offset != 0 || size != fsize)
  1418			goto need_copy;
  1419	
  1420		/*
  1421		 * For a folio to be stealable, the caller holds a ref, the mapping
  1422		 * holds a ref and the page tables hold a ref; it may or may not also
  1423		 * be on the LRU.  Anything else and someone else has access to it.
  1424		 */
  1425		if (folio_ref_count(folio) > 4 || folio_mapcount(folio) != 1 ||
  1426		    folio_maybe_dma_pinned(folio))
  1427			goto need_copy;
  1428	
  1429		/* Try to steal. */
  1430		folio_lock(folio);
  1431	
  1432		if (folio_ref_count(folio) > 4 || folio_mapcount(folio) != 1 ||
  1433		    folio_maybe_dma_pinned(folio))
  1434			goto need_copy_unlock;
  1435		if (!folio->mapping)
  1436			goto need_copy_unlock; /* vmsplice race? */
  1437	
  1438		/*
  1439		 * Remove the folio from the process VM and then try to remove
  1440		 * it from the mapping.  It we can't remove it, we'll have to
  1441		 * copy it instead.
  1442		 */
  1443		unmap_mapping_folio(folio);
  1444		if (remove_mapping(folio->mapping, folio)) {
  1445			folio_clear_mappedtodisk(folio);
  1446			flags |= PIPE_BUF_FLAG_LRU;
  1447			goto add_to_pipe;
  1448		}
  1449	
  1450	need_copy_unlock:
  1451		folio_unlock(folio);
  1452	need_copy:
  1453	
  1454		copy = folio_alloc(GFP_KERNEL, 0);
  1455		if (!copy)
  1456			return -ENOMEM;
  1457	
> 1458		size = min(size, PAGE_SIZE - offset % PAGE_SIZE);
  1459		copy_folio_to_folio(folio, offset, copy, 0, size);
  1460		folio_mark_uptodate(copy);
  1461		folio_put(folio);
  1462		folio = copy;
  1463		offset = 0;
  1464	
  1465	add_to_pipe:
  1466		page = folio_page(folio, offset / PAGE_SIZE);
  1467		size = min(size, folio_size(folio) - offset);
  1468		offset %= PAGE_SIZE;
  1469	
  1470		while (spliced < size &&
  1471		       !pipe_full(pipe->head, pipe->tail, pipe->max_usage)) {
  1472			struct pipe_buffer *buf = pipe_head_buf(pipe);
  1473			size_t part = min_t(size_t, PAGE_SIZE - offset, size - spliced);
  1474	
  1475			*buf = (struct pipe_buffer) {
  1476				.ops	= &default_pipe_buf_ops,
  1477				.page	= page,
  1478				.offset	= offset,
  1479				.len	= part,
  1480				.flags	= flags,
  1481			};
  1482			folio_get(folio);
  1483			pipe->head++;
  1484			page++;
  1485			spliced += part;
  1486			offset = 0;
  1487		}
  1488	
  1489		folio_put(folio);
  1490		return spliced;
  1491	}
  1492	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
