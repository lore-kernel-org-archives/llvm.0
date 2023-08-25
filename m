Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6666AC8D1;
	Fri, 25 Aug 2023 09:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692956340; x=1724492340;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3RThncrfyLkM0f4g6LZtlksefEUauAjBRluEVJ6Ay+s=;
  b=J6G8PM3nxDYc7mO1weAO43UG67kPtrt2oMokRU278tDsRS9+hqv3sM3g
   Evk2dOWaNi4n6N1WxtPQs3VHzLs+3PGHYb/dHCfY2DmxQ6aPQpFjRVwSP
   v8gJyv0iP+TZ3+QIzgPTNE4AbaVG8M6WtniWajE37zR098LR6R+en6+tW
   Wt3q77i58zQOp5wZQOffAEIJgh2qXPFkL9iEZW5Ks5J1/X/LZHw94K6X9
   QLnVKlzlW1KcO06Ddrll4gSuBOyuRs1vELsOYCQkFT4hEkK7tO9Ij7o8n
   9cJEfK+tH03U5aHVrXqN9CbakKaUumNmFo95VRnoeMPMmkL9LzdFvGubp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="364871748"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="364871748"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 02:38:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="714292976"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="714292976"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 25 Aug 2023 02:38:53 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZTHI-0003Pi-1O;
	Fri, 25 Aug 2023 09:38:52 +0000
Date: Fri, 25 Aug 2023 17:38:07 +0800
From: kernel test robot <lkp@intel.com>
To: Zi Yan <zi.yan@sent.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] mm: use nth_page() for all memmap (struct page)
 position operations.
Message-ID: <202308251717.4u77tZsA-lkp@intel.com>
References: <20230823030622.96112-1-zi.yan@sent.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230823030622.96112-1-zi.yan@sent.com>

Hi Zi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Zi-Yan/mm-use-nth_page-for-all-memmap-struct-page-position-operations/20230823-110839
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230823030622.96112-1-zi.yan%40sent.com
patch subject: [RFC PATCH] mm: use nth_page() for all memmap (struct page) position operations.
config: i386-randconfig-004-20230825 (https://download.01.org/0day-ci/archive/20230825/202308251717.4u77tZsA-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308251717.4u77tZsA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308251717.4u77tZsA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/hfs/btree.c:273:10: error: incompatible pointer types initializing 'const struct page *' with an expression of type 'struct page *[]' [-Werror,-Wincompatible-pointer-types]
           pagep = nth_page(node->page, (off >> PAGE_SHIFT));
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:213:38: note: expanded from macro 'nth_page'
   #define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
                            ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:64:21: note: expanded from macro 'page_to_pfn'
   #define page_to_pfn __page_to_pfn
                       ^
   include/asm-generic/memory_model.h:46:23: note: expanded from macro '__page_to_pfn'
   ({      const struct page *__pg = (pg);                         \
                              ^
   include/asm-generic/memory_model.h:52:27: note: expanded from macro '__pfn_to_page'
   ({      unsigned long __pfn = (pfn);                    \
                                  ^~~
>> fs/hfs/btree.c:273:8: error: incompatible pointer types assigning to 'struct page **' from 'struct page *' [-Werror,-Wincompatible-pointer-types]
           pagep = nth_page(node->page, (off >> PAGE_SHIFT));
                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/hfs/btree.c:319:11: error: incompatible pointer types initializing 'const struct page *' with an expression of type 'struct page *[]' [-Werror,-Wincompatible-pointer-types]
                   pagep = nth_page(node->page, (off >> PAGE_SHIFT));
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:213:38: note: expanded from macro 'nth_page'
   #define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
                            ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:64:21: note: expanded from macro 'page_to_pfn'
   #define page_to_pfn __page_to_pfn
                       ^
   include/asm-generic/memory_model.h:46:23: note: expanded from macro '__page_to_pfn'
   ({      const struct page *__pg = (pg);                         \
                              ^
   include/asm-generic/memory_model.h:52:27: note: expanded from macro '__pfn_to_page'
   ({      unsigned long __pfn = (pfn);                    \
                                  ^~~
   fs/hfs/btree.c:319:9: error: incompatible pointer types assigning to 'struct page **' from 'struct page *' [-Werror,-Wincompatible-pointer-types]
                   pagep = nth_page(node->page, (off >> PAGE_SHIFT));
                         ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.


vim +273 fs/hfs/btree.c

   249	
   250	struct hfs_bnode *hfs_bmap_alloc(struct hfs_btree *tree)
   251	{
   252		struct hfs_bnode *node, *next_node;
   253		struct page **pagep;
   254		u32 nidx, idx;
   255		unsigned off;
   256		u16 off16;
   257		u16 len;
   258		u8 *data, byte, m;
   259		int i, res;
   260	
   261		res = hfs_bmap_reserve(tree, 1);
   262		if (res)
   263			return ERR_PTR(res);
   264	
   265		nidx = 0;
   266		node = hfs_bnode_find(tree, nidx);
   267		if (IS_ERR(node))
   268			return node;
   269		len = hfs_brec_lenoff(node, 2, &off16);
   270		off = off16;
   271	
   272		off += node->page_offset;
 > 273		pagep = nth_page(node->page, (off >> PAGE_SHIFT));
   274		data = kmap_local_page(*pagep);
   275		off &= ~PAGE_MASK;
   276		idx = 0;
   277	
   278		for (;;) {
   279			while (len) {
   280				byte = data[off];
   281				if (byte != 0xff) {
   282					for (m = 0x80, i = 0; i < 8; m >>= 1, i++) {
   283						if (!(byte & m)) {
   284							idx += i;
   285							data[off] |= m;
   286							set_page_dirty(*pagep);
   287							kunmap_local(data);
   288							tree->free_nodes--;
   289							mark_inode_dirty(tree->inode);
   290							hfs_bnode_put(node);
   291							return hfs_bnode_create(tree, idx);
   292						}
   293					}
   294				}
   295				if (++off >= PAGE_SIZE) {
   296					kunmap_local(data);
   297					data = kmap_local_page(nth_page(*pagep, 1));
   298					*pagep = nth_page(*pagep, 1);
   299					off = 0;
   300				}
   301				idx += 8;
   302				len--;
   303			}
   304			kunmap_local(data);
   305			nidx = node->next;
   306			if (!nidx) {
   307				printk(KERN_DEBUG "create new bmap node...\n");
   308				next_node = hfs_bmap_new_bmap(node, idx);
   309			} else
   310				next_node = hfs_bnode_find(tree, nidx);
   311			hfs_bnode_put(node);
   312			if (IS_ERR(next_node))
   313				return next_node;
   314			node = next_node;
   315	
   316			len = hfs_brec_lenoff(node, 0, &off16);
   317			off = off16;
   318			off += node->page_offset;
   319			pagep = nth_page(node->page, (off >> PAGE_SHIFT));
   320			data = kmap_local_page(*pagep);
   321			off &= ~PAGE_MASK;
   322		}
   323	}
   324	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
