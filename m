Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E1D14284;
	Thu, 29 Jun 2023 19:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688065721; x=1719601721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qkwu8rhxN6dRTdDxGPIVI6Y43awI11hJ90eWWEBGHW4=;
  b=CPWabxV5HOLlRBMb1YoEMEl92LEGSSscqPyHVDCCJUYXl818J9NBevb5
   VMY9arBH4K4ZtoN3zeFfYw/Wm9WhXdBAK7JZWw/JZl2EptJOow8g4tpI1
   MX7aniR7V7oTa9+qmIVaXc8OjCkS2pa5xU7j+XPS19JKTV8nkuJAlaMM7
   6+P+5yZWTrAmRlwJ74W9JsDJYv5KdutTo1NtKt46XtMwWBdjkSC7DrEzq
   Kqav1+uJNA6IMBgpA0Swvp9P/1weLkwdTXGWz/qXN0LKtj/tALSKX12H1
   6txSpAbhX3JOAOZIRR50NDFIUgb0Ob/+RLLZX2DPmfZs4ZdaY8OPB1qIJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="392929025"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="392929025"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 12:08:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="891496362"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="891496362"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 29 Jun 2023 12:08:38 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEx0P-000ELZ-1U;
	Thu, 29 Jun 2023 19:08:37 +0000
Date: Fri, 30 Jun 2023 03:08:15 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:splice-fix-corruption 1/4] mm/filemap.c:2848:17:
 warning: comparison of distinct pointer types ('typeof ((typeof (((1UL) <<
 12) - src_offset % ((1UL) << 12)))__builtin_choose_expr(((!!(sizeof ((typeof
 (((1UL) << 12) - src_offset % ((1UL) << 12)) *)1 == (typeof (((1UL) << 12) -
 dst_...
Message-ID: <202306300225.Be1cucsD-lkp@intel.com>
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
commit: 018eeae5c2f650da68338bfc464de887af53ff1f [1/4] splice: Fix corruption of spliced data after splice() returns
config: i386-randconfig-i014-20230629 (https://download.01.org/0day-ci/archive/20230630/202306300225.Be1cucsD-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306300225.Be1cucsD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306300225.Be1cucsD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/filemap.c:2848:17: warning: comparison of distinct pointer types ('typeof ((typeof (((1UL) << 12) - src_offset % ((1UL) << 12)))__builtin_choose_expr(((!!(sizeof ((typeof (((1UL) << 12) - src_offset % ((1UL) << 12)) *)1 == (typeof (((1UL) << 12) - dst_offset % ((1UL) << 12)) *)1))) && ((sizeof(int) == sizeof (*(8 ? ((void *)((long)(((1UL) << 12) - src_offset % ((1UL) << 12)) * 0L)) : (int *)8))) && (sizeof(int) == sizeof (*(8 ? ((void *)((long)(((1UL) << 12) - dst_offset % ((1UL) << 12)) * 0L)) : (int *)8))))), ((((1UL) << 12) - src_offset % ((1UL) << 12)) < (((1UL) << 12) - dst_offset % ((1UL) << 12)) ? (((1UL) << 12) - src_offset % ((1UL) << 12)) : (((1UL) << 12) - dst_offset % ((1UL) << 12))), ({
       typeof (((1UL) << 12) - src_offset % ((1UL) << 12)) __UNIQUE_ID___x384 = (((1UL) << 12) - src_offset % ((1UL) << 12));
       typeof (((1UL) << 12) - dst_offset % ((1UL) << 12)) __UNIQUE_ID___y385 = (((1UL) << 12) - dst_offset % ((1UL) << 12));
       ((__UNIQUE_ID___x384) < (__UNIQUE_ID___y385) ? (__UNIQUE_ID___x384) : (__UNIQUE_ID___y385));
   }))) *' (aka 'unsigned long *') and 'typeof (size) *' (aka 'unsigned int *')) [-Wcompare-distinct-pointer-types]
                   size_t part = min3(PAGE_SIZE - src_offset % PAGE_SIZE,
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:82:23: note: expanded from macro 'min3'
   #define min3(x, y, z) min((typeof(x))min(x, y), z)
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:67:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
>> mm/filemap.c:2916:9: warning: comparison of distinct pointer types ('typeof (size) *' (aka 'unsigned int *') and 'typeof (((1UL) << 12) - offset % ((1UL) << 12)) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
           size = min(size, PAGE_SIZE - offset % PAGE_SIZE);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:67:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   2 warnings generated.


vim +2848 mm/filemap.c

  2840	
  2841	static inline void copy_folio_to_folio(struct folio *src, size_t src_offset,
  2842					       struct folio *dst, size_t dst_offset,
  2843					       size_t size)
  2844	{
  2845		void *p, *q;
  2846	
  2847		while (size > 0) {
> 2848			size_t part = min3(PAGE_SIZE - src_offset % PAGE_SIZE,
  2849					   PAGE_SIZE - dst_offset % PAGE_SIZE,
  2850					   size);
  2851	
  2852			p = kmap_local_folio(src, src_offset);
  2853			q = kmap_local_folio(dst, dst_offset);
  2854			memcpy(q, p, part);
  2855			kunmap_local(p);
  2856			kunmap_local(q);
  2857			src_offset += part;
  2858			dst_offset += part;
  2859			size -= part;
  2860		}
  2861	}
  2862	
  2863	/*
  2864	 * Splice data from a folio into a pipe.  The folio is stolen if no one else is
  2865	 * using it and copied otherwise.  We can't put the folio into the pipe still
  2866	 * attached to the pagecache as that allows someone to modify it after the
  2867	 * splice.
  2868	 */
  2869	ssize_t splice_folio_into_pipe(struct pipe_inode_info *pipe,
  2870				       struct folio *folio, loff_t fpos, size_t size)
  2871	{
  2872		struct address_space *mapping;
  2873		struct folio *copy = NULL;
  2874		struct page *page;
  2875		unsigned int flags = 0;
  2876		ssize_t ret;
  2877		size_t spliced = 0, offset = offset_in_folio(folio, fpos);
  2878	
  2879		folio_lock(folio);
  2880	
  2881		mapping = folio_mapping(folio);
  2882		ret = -ENODATA;
  2883		if (!folio->mapping)
  2884			goto err_unlock; /* Truncated */
  2885		ret = -EIO;
  2886		if (!folio_test_uptodate(folio))
  2887			goto err_unlock;
  2888	
  2889		/*
  2890		 * At least for ext2 with nobh option, we need to wait on writeback
  2891		 * completing on this folio, since we'll remove it from the pagecache.
  2892		 * Otherwise truncate wont wait on the folio, allowing the disk blocks
  2893		 * to be reused by someone else before we actually wrote our data to
  2894		 * them. fs corruption ensues.
  2895		 */
  2896		folio_wait_writeback(folio);
  2897	
  2898		if (folio_has_private(folio) &&
  2899		    !filemap_release_folio(folio, GFP_KERNEL))
  2900			goto need_copy;
  2901	
  2902		/* If we succeed in removing the mapping, set LRU flag and add it. */
  2903		if (remove_mapping(mapping, folio)) {
  2904			folio_unlock(folio);
  2905			flags = PIPE_BUF_FLAG_LRU;
  2906			goto add_to_pipe;
  2907		}
  2908	
  2909	need_copy:
  2910		folio_unlock(folio);
  2911	
  2912		copy = folio_alloc(GFP_KERNEL, 0);
  2913		if (!copy)
  2914			return -ENOMEM;
  2915	
> 2916		size = min(size, PAGE_SIZE - offset % PAGE_SIZE);
  2917		copy_folio_to_folio(folio, offset, copy, 0, size);
  2918		folio = copy;
  2919		offset = 0;
  2920	
  2921	add_to_pipe:
  2922		page = folio_page(folio, offset / PAGE_SIZE);
  2923		size = min(size, folio_size(folio) - offset);
  2924		offset %= PAGE_SIZE;
  2925	
  2926		while (spliced < size &&
  2927		       !pipe_full(pipe->head, pipe->tail, pipe->max_usage)) {
  2928			struct pipe_buffer *buf = pipe_head_buf(pipe);
  2929			size_t part = min_t(size_t, PAGE_SIZE - offset, size - spliced);
  2930	
  2931			*buf = (struct pipe_buffer) {
  2932				.ops	= &page_cache_pipe_buf_ops,
  2933				.page	= page,
  2934				.offset	= offset,
  2935				.len	= part,
  2936				.flags	= flags,
  2937			};
  2938			folio_get(folio);
  2939			pipe->head++;
  2940			page++;
  2941			spliced += part;
  2942			offset = 0;
  2943		}
  2944	
  2945		if (copy)
  2946			folio_put(copy);
  2947		return spliced;
  2948	
  2949	err_unlock:
  2950		folio_unlock(folio);
  2951		return ret;
  2952	}
  2953	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
