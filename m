Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66B5A40
	for <llvm@lists.linux.dev>; Sat, 10 Sep 2022 06:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662792886; x=1694328886;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yEuCidu63aCFaEYKv2hxgJqRuNZ2tYFkwV+a+5SfNjM=;
  b=KmsVA6Y1CT3bB0zCM082NBDjcernoTRL5aZFCquKTy+zRJO2Ctg36MTC
   R5unYAgZsUkG1/pW9ZQbtvdXgeb6gjeleN6VCrOEpeHnC1CsW/EKt0/qW
   s6wzVNmK3tHSBbFzJ+ufnlnWnj9cGq87RPQys7rthMNk4sHfGw2Mmu3ik
   d25Ij69iQ1nGH5o6bjT8VsJZfGt1D5Kn6czThkX2gXRiMmfErtbgM4bi3
   UP8UGPYaytprbrDUO66F94Z8m1XUxjBv/g79Ao0sDzNVIrDU+UtkX7fDZ
   +KkUUahevxJsNQq2ne2KjdHP7vNbEfW07o4tBx2k1JEChkgOMm9OuxHOX
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="383916317"
X-IronPort-AV: E=Sophos;i="5.93,305,1654585200"; 
   d="scan'208";a="383916317"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2022 23:54:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,305,1654585200"; 
   d="scan'208";a="645808391"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 09 Sep 2022 23:54:44 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oWuO3-0002El-1m;
	Sat, 10 Sep 2022 06:54:43 +0000
Date: Sat, 10 Sep 2022 14:53:54 +0800
From: kernel test robot <lkp@intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v10 4/9] drm/i915/gem: Typecheck page lookups
Message-ID: <202209101430.Wackz7db-lkp@intel.com>
References: <20220909105913.752049-5-gwan-gyeong.mun@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909105913.752049-5-gwan-gyeong.mun@intel.com>

Hi Gwan-gyeong,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on linus/master v6.0-rc4]
[cannot apply to drm-intel/for-linux-next kees/for-next/hardening next-20220909]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gwan-gyeong-Mun/Fixes-integer-overflow-or-integer-truncation-issues-in-page-lookups-ttm-place-configuration-and-scatterlist-creation/20220909-190301
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20220910/202209101430.Wackz7db-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2dc8fb7f63e0eddbe9f1c0c6b0b8b2e036a329b4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Gwan-gyeong-Mun/Fixes-integer-overflow-or-integer-truncation-issues-in-page-lookups-ttm-place-configuration-and-scatterlist-creation/20220909-190301
        git checkout 2dc8fb7f63e0eddbe9f1c0c6b0b8b2e036a329b4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1127:23: warning: '_Static_assert' with no message is a C2x extension [-Wc2x-extensions]
                   struct page *page = i915_gem_object_get_page(obj, cache->page);
                                       ^
   drivers/gpu/drm/i915/gem/i915_gem_object.h:540:2: note: expanded from macro 'i915_gem_object_get_page'
           assert_typable(pgoff_t, n);             \
           ^
   include/linux/compiler_types.h:334:35: note: expanded from macro 'assert_typable'
                                               __same_type(t, typeof(n)))
                                                                        ^
   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1209:9: warning: '_Static_assert' with no message is a C2x extension [-Wc2x-extensions]
           page = i915_gem_object_get_page(obj, pageno);
                  ^
   drivers/gpu/drm/i915/gem/i915_gem_object.h:540:2: note: expanded from macro 'i915_gem_object_get_page'
           assert_typable(pgoff_t, n);             \
           ^
   include/linux/compiler_types.h:334:35: note: expanded from macro 'assert_typable'
                                               __same_type(t, typeof(n)))
                                                                        ^
   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1285:10: warning: '_Static_assert' with no message is a C2x extension [-Wc2x-extensions]
                                        i915_gem_object_get_dma_address(obj, page),
                                        ^
   drivers/gpu/drm/i915/gem/i915_gem_object.h:648:2: note: expanded from macro 'i915_gem_object_get_dma_address'
           assert_typable(pgoff_t, n);                     \
           ^
   include/linux/compiler_types.h:334:35: note: expanded from macro 'assert_typable'
                                               __same_type(t, typeof(n)))
                                                                        ^
   3 warnings generated.
--
>> drivers/gpu/drm/i915/gem/i915_gem_object.c:420:24: warning: '_Static_assert' with no message is a C2x extension [-Wc2x-extensions]
           src_map = kmap_atomic(i915_gem_object_get_page(obj, idx));
                                 ^
   drivers/gpu/drm/i915/gem/i915_gem_object.h:540:2: note: expanded from macro 'i915_gem_object_get_page'
           assert_typable(pgoff_t, n);             \
           ^
   include/linux/compiler_types.h:334:35: note: expanded from macro 'assert_typable'
                                               __same_type(t, typeof(n)))
                                                                        ^
   drivers/gpu/drm/i915/gem/i915_gem_object.c:434:19: warning: '_Static_assert' with no message is a C2x extension [-Wc2x-extensions]
           dma_addr_t dma = i915_gem_object_get_dma_address(obj, idx);
                            ^
   drivers/gpu/drm/i915/gem/i915_gem_object.h:648:2: note: expanded from macro 'i915_gem_object_get_dma_address'
           assert_typable(pgoff_t, n);                     \
           ^
   include/linux/compiler_types.h:334:35: note: expanded from macro 'assert_typable'
                                               __same_type(t, typeof(n)))
                                                                        ^
   2 warnings generated.
--
>> drivers/gpu/drm/i915/gem/i915_gem_lmem.c:22:11: warning: '_Static_assert' with no message is a C2x extension [-Wc2x-extensions]
           offset = i915_gem_object_get_dma_address(obj, n);
                    ^
   drivers/gpu/drm/i915/gem/i915_gem_object.h:648:2: note: expanded from macro 'i915_gem_object_get_dma_address'
           assert_typable(pgoff_t, n);                     \
           ^
   include/linux/compiler_types.h:334:35: note: expanded from macro 'assert_typable'
                                               __same_type(t, typeof(n)))
                                                                        ^
   1 warning generated.
--
>> drivers/gpu/drm/i915/gem/i915_gem_pages.c:637:7: warning: '_Static_assert' with no message is a C2x extension [-Wc2x-extensions]
           sg = i915_gem_object_get_sg(obj, n, &offset);
                ^
   drivers/gpu/drm/i915/gem/i915_gem_object.h:459:2: note: expanded from macro 'i915_gem_object_get_sg'
           assert_typable(pgoff_t, n);                     \
           ^
   include/linux/compiler_types.h:334:35: note: expanded from macro 'assert_typable'
                                               __same_type(t, typeof(n)))
                                                                        ^
   drivers/gpu/drm/i915/gem/i915_gem_pages.c:647:9: warning: '_Static_assert' with no message is a C2x extension [-Wc2x-extensions]
           page = i915_gem_object_get_page(obj, n);
                  ^
   drivers/gpu/drm/i915/gem/i915_gem_object.h:540:2: note: expanded from macro 'i915_gem_object_get_page'
           assert_typable(pgoff_t, n);             \
           ^
   include/linux/compiler_types.h:334:35: note: expanded from macro 'assert_typable'
                                               __same_type(t, typeof(n)))
                                                                        ^
   drivers/gpu/drm/i915/gem/i915_gem_pages.c:661:7: warning: '_Static_assert' with no message is a C2x extension [-Wc2x-extensions]
           sg = i915_gem_object_get_sg_dma(obj, n, &offset);
                ^
   drivers/gpu/drm/i915/gem/i915_gem_object.h:504:2: note: expanded from macro 'i915_gem_object_get_sg_dma'
           assert_typable(pgoff_t, n);                     \
           ^
   include/linux/compiler_types.h:334:35: note: expanded from macro 'assert_typable'
                                               __same_type(t, typeof(n)))
                                                                        ^
   drivers/gpu/drm/i915/gem/i915_gem_pages.c:672:9: warning: '_Static_assert' with no message is a C2x extension [-Wc2x-extensions]
           return i915_gem_object_get_dma_address_len(obj, n, NULL);
                  ^
   drivers/gpu/drm/i915/gem/i915_gem_object.h:613:2: note: expanded from macro 'i915_gem_object_get_dma_address_len'
           assert_typable(pgoff_t, n);                             \
           ^
   include/linux/compiler_types.h:334:35: note: expanded from macro 'assert_typable'
                                               __same_type(t, typeof(n)))
                                                                        ^
   4 warnings generated.
--
>> drivers/gpu/drm/i915/gem/i915_gem_ttm.c:688:7: warning: '_Static_assert' with no message is a C2x extension [-Wc2x-extensions]
           sg = i915_gem_object_page_iter_get_sg(obj, &obj->ttm.get_io_page, page_offset, &ofs);
                ^
   drivers/gpu/drm/i915/gem/i915_gem_object.h:414:2: note: expanded from macro 'i915_gem_object_page_iter_get_sg'
           assert_typable(pgoff_t, n);                             \
           ^
   include/linux/compiler_types.h:334:35: note: expanded from macro 'assert_typable'
                                               __same_type(t, typeof(n)))
                                                                        ^
   1 warning generated.
--
>> drivers/gpu/drm/i915/i915_cmd_parser.c:1214:22: warning: '_Static_assert' with no message is a C2x extension [-Wc2x-extensions]
                           src = kmap_atomic(i915_gem_object_get_page(src_obj, n));
                                             ^
   drivers/gpu/drm/i915/gem/i915_gem_object.h:540:2: note: expanded from macro 'i915_gem_object_get_page'
           assert_typable(pgoff_t, n);             \
           ^
   include/linux/compiler_types.h:334:35: note: expanded from macro 'assert_typable'
                                               __same_type(t, typeof(n)))
                                                                        ^
   1 warning generated.
--
>> drivers/gpu/drm/i915/i915_gem.c:257:23: warning: '_Static_assert' with no message is a C2x extension [-Wc2x-extensions]
                   struct page *page = i915_gem_object_get_page(obj, idx);
                                       ^
   drivers/gpu/drm/i915/gem/i915_gem_object.h:540:2: note: expanded from macro 'i915_gem_object_get_page'
           assert_typable(pgoff_t, n);             \
           ^
   include/linux/compiler_types.h:334:35: note: expanded from macro 'assert_typable'
                                               __same_type(t, typeof(n)))
                                                                        ^
   drivers/gpu/drm/i915/i915_gem.c:423:11: warning: '_Static_assert' with no message is a C2x extension [-Wc2x-extensions]
                                                i915_gem_object_get_dma_address(obj, offset >> PAGE_SHIFT),
                                                ^
   drivers/gpu/drm/i915/gem/i915_gem_object.h:648:2: note: expanded from macro 'i915_gem_object_get_dma_address'
           assert_typable(pgoff_t, n);                     \
           ^
   include/linux/compiler_types.h:334:35: note: expanded from macro 'assert_typable'
                                               __same_type(t, typeof(n)))
                                                                        ^
   drivers/gpu/drm/i915/i915_gem.c:601:11: warning: '_Static_assert' with no message is a C2x extension [-Wc2x-extensions]
                                                i915_gem_object_get_dma_address(obj, offset >> PAGE_SHIFT),
                                                ^
   drivers/gpu/drm/i915/gem/i915_gem_object.h:648:2: note: expanded from macro 'i915_gem_object_get_dma_address'
           assert_typable(pgoff_t, n);                     \
           ^
   include/linux/compiler_types.h:334:35: note: expanded from macro 'assert_typable'
                                               __same_type(t, typeof(n)))
                                                                        ^
   drivers/gpu/drm/i915/i915_gem.c:699:23: warning: '_Static_assert' with no message is a C2x extension [-Wc2x-extensions]
                   struct page *page = i915_gem_object_get_page(obj, idx);
                                       ^
   drivers/gpu/drm/i915/gem/i915_gem_object.h:540:2: note: expanded from macro 'i915_gem_object_get_page'
           assert_typable(pgoff_t, n);             \
           ^
   include/linux/compiler_types.h:334:35: note: expanded from macro 'assert_typable'
                                               __same_type(t, typeof(n)))
                                                                        ^
   4 warnings generated.
--
>> drivers/gpu/drm/i915/i915_vma.c:927:5: warning: '_Static_assert' with no message is a C2x extension [-Wc2x-extensions]
                                   i915_gem_object_get_dma_address(obj, src_idx);
                                   ^
   drivers/gpu/drm/i915/gem/i915_gem_object.h:648:2: note: expanded from macro 'i915_gem_object_get_dma_address'
           assert_typable(pgoff_t, n);                     \
           ^
   include/linux/compiler_types.h:334:35: note: expanded from macro 'assert_typable'
                                               __same_type(t, typeof(n)))
                                                                        ^
   drivers/gpu/drm/i915/i915_vma.c:1045:11: warning: '_Static_assert' with no message is a C2x extension [-Wc2x-extensions]
                           addr = i915_gem_object_get_dma_address_len(obj, offset, &length);
                                  ^
   drivers/gpu/drm/i915/gem/i915_gem_object.h:613:2: note: expanded from macro 'i915_gem_object_get_dma_address_len'
           assert_typable(pgoff_t, n);                             \
           ^
   include/linux/compiler_types.h:334:35: note: expanded from macro 'assert_typable'
                                               __same_type(t, typeof(n)))
                                                                        ^
   drivers/gpu/drm/i915/i915_vma.c:1084:9: warning: '_Static_assert' with no message is a C2x extension [-Wc2x-extensions]
           iter = i915_gem_object_get_sg_dma(obj, obj_offset, &offset);
                  ^
   drivers/gpu/drm/i915/gem/i915_gem_object.h:504:2: note: expanded from macro 'i915_gem_object_get_sg_dma'
           assert_typable(pgoff_t, n);                     \
           ^
   include/linux/compiler_types.h:334:35: note: expanded from macro 'assert_typable'
                                               __same_type(t, typeof(n)))
                                                                        ^
   3 warnings generated.
--
>> drivers/gpu/drm/i915/gt/intel_gsc.c:219:28: warning: '_Static_assert' with no message is a C2x extension [-Wc2x-extensions]
                   adev->ext_op_mem.start = i915_gem_object_get_dma_address(intf->gem_obj, 0);
                                            ^
   drivers/gpu/drm/i915/gem/i915_gem_object.h:648:2: note: expanded from macro 'i915_gem_object_get_dma_address'
           assert_typable(pgoff_t, n);                     \
           ^
   include/linux/compiler_types.h:334:35: note: expanded from macro 'assert_typable'
                                               __same_type(t, typeof(n)))
                                                                        ^
   1 warning generated.


vim +/_Static_assert +420 drivers/gpu/drm/i915/gem/i915_gem_object.c

   412	
   413	static void
   414	i915_gem_object_read_from_page_kmap(struct drm_i915_gem_object *obj, u64 offset, void *dst, int size)
   415	{
   416		pgoff_t idx = offset >> PAGE_SHIFT;
   417		void *src_map;
   418		void *src_ptr;
   419	
 > 420		src_map = kmap_atomic(i915_gem_object_get_page(obj, idx));
   421	
   422		src_ptr = src_map + offset_in_page(offset);
   423		if (!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_READ))
   424			drm_clflush_virt_range(src_ptr, size);
   425		memcpy(dst, src_ptr, size);
   426	
   427		kunmap_atomic(src_map);
   428	}
   429	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
