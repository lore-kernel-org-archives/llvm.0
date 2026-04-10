Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1D9E55A;
	Fri, 10 Apr 2026 05:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775797616; cv=none; b=SZoHB+1SuF3DRC1DwV3LADJ34DliuNyj/fM/4/N+Rh/GmoDHQkl1KYXoSQbXqbKNHNLiblpRryQ134tHH8Q4f6LXxnxYwd9DOt6dq78OSOhyvTwq8TUNhs4PVdk5kbWlctcnwWThn8AWFyust67ZX8Qvp9d/ZU+reFP8g4UBmKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775797616; c=relaxed/simple;
	bh=A1ysQsa8EkVQ45sLv+mizO069TUM0J6fMqKUAnlDCH8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qdNcFBeizIx7o3AI8OcU4jLkYjv+i6H6uYE3iWnhN4mp+gnl4yJqDV0he7DtHvkKzs5ClvN9RaIwOGqPkzzWiEkj26RiunkZ2C3KQbQJm+bWpsJ+T4bpVg9QRIRcPOHZpP+ZS3SNNAAiBA6kz3Z2s456NKSlP4iyDFnGamPfX48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KzjrN8gg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KzjrN8gg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775797614; x=1807333614;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A1ysQsa8EkVQ45sLv+mizO069TUM0J6fMqKUAnlDCH8=;
  b=KzjrN8gg9D7bMtikpz9mkVjC74j6hTKJU//oRRUPNGybcPQcOKBsTNyM
   9fAkVDEQmo1oN18lNGx1mJJkkS/ci3I10BpVOnssMool8+Kj60YiILvkG
   SeADjBLCBMPcu+O/maJSETNPRu8eCcYIagusBA8AI98jysPP+ZUK2KM8Q
   MWU722jnwpr3preZVAbTb0hgF2TIY4rsla+UTgfLAfCk/DsHnEotYq6LL
   SOehYXlMevlCAm3H6D9Hrcf49BGnwfIrMDiTYpc38OL7uCB2+Uso+xAyP
   nHxAJolozh2Nrf+tL6zs2FD9u++RvLwE+53H8ICXJYqSAHxqt1GTMp/YM
   w==;
X-CSE-ConnectionGUID: Qfxv8n4YRHO1YTKNiv7TNQ==
X-CSE-MsgGUID: O5s84ygFR1SRIa4zqJaYgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="75982790"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="75982790"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 22:06:53 -0700
X-CSE-ConnectionGUID: lrwycQh9RLm2d7sBzxbxfQ==
X-CSE-MsgGUID: nAD4EXA/SculV50hpYoSnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="233380699"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Apr 2026 22:06:30 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wB44Z-000000000U6-3Xwg;
	Fri, 10 Apr 2026 05:06:27 +0000
Date: Fri, 10 Apr 2026 13:06:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Ville =?utf-8?Q?Syrj=C3=A4l=C3=A4"?= <ville.syrjala@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [vsyrjala:remap_tile_ys_64 18/30]
 drivers/gpu/drm/i915/i915_vma.c:968:1: error: conflicting types for
 'add_pages'
Message-ID: <202604090255.YqkfAme7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/vsyrjala/linux.git remap_tile_ys_64
head:   9a8f5dc5c6e5da24a2df0e93fda770ab217b0886
commit: 539e2225c8d7e19d4095bace6c48ec8d3d434e93 [18/30] drm/i915/vma: Extract add_pages()
config: x86_64-randconfig-015-20260408 (https://download.01.org/0day-ci/archive/20260409/202604090255.YqkfAme7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260409/202604090255.YqkfAme7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604090255.YqkfAme7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/i915_vma.c:968:1: error: conflicting types for 'add_pages'
     968 | add_pages(dma_addr_t addr, unsigned int count,
         | ^
   include/linux/memory_hotplug.h:153:5: note: previous declaration is here
     153 | int add_pages(int nid, unsigned long start_pfn, unsigned long nr_pages,
         |     ^
>> drivers/gpu/drm/i915/i915_vma.c:989:29: error: incompatible pointer to integer conversion passing 'struct sg_table *' to parameter of type 'unsigned long' [-Wint-conversion]
     989 |         return add_pages(0, count, st, sg);
         |                                    ^~
   include/linux/memory_hotplug.h:153:63: note: passing argument to parameter 'nr_pages' here
     153 | int add_pages(int nid, unsigned long start_pfn, unsigned long nr_pages,
         |                                                               ^
>> drivers/gpu/drm/i915/i915_vma.c:989:33: error: incompatible pointer types passing 'struct scatterlist *' to parameter of type 'struct mhp_params *' [-Werror,-Wincompatible-pointer-types]
     989 |         return add_pages(0, count, st, sg);
         |                                        ^~
   include/linux/memory_hotplug.h:154:27: note: passing argument to parameter 'params' here
     154 |               struct mhp_params *params);
         |                                  ^
>> drivers/gpu/drm/i915/i915_vma.c:989:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct scatterlist *' [-Wint-conversion]
     989 |         return add_pages(0, count, st, sg);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_vma.c:1028:28: error: incompatible pointer to integer conversion passing 'struct sg_table *' to parameter of type 'unsigned long' [-Wint-conversion]
    1028 |                         sg = add_pages(addr, 1, st, sg);
         |                                                 ^~
   include/linux/memory_hotplug.h:153:63: note: passing argument to parameter 'nr_pages' here
     153 | int add_pages(int nid, unsigned long start_pfn, unsigned long nr_pages,
         |                                                               ^
   drivers/gpu/drm/i915/i915_vma.c:1028:32: error: incompatible pointer types passing 'struct scatterlist *' to parameter of type 'struct mhp_params *' [-Werror,-Wincompatible-pointer-types]
    1028 |                         sg = add_pages(addr, 1, st, sg);
         |                                                     ^~
   include/linux/memory_hotplug.h:154:27: note: passing argument to parameter 'params' here
     154 |               struct mhp_params *params);
         |                                  ^
>> drivers/gpu/drm/i915/i915_vma.c:1028:7: error: incompatible integer to pointer conversion assigning to 'struct scatterlist *' from 'int' [-Wint-conversion]
    1028 |                         sg = add_pages(addr, 1, st, sg);
         |                            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_vma.c:1139:47: error: incompatible pointer to integer conversion passing 'struct sg_table *' to parameter of type 'unsigned long' [-Wint-conversion]
    1139 |                         sg = add_pages(addr, length >> PAGE_SHIFT, st, sg);
         |                                                                    ^~
   include/linux/memory_hotplug.h:153:63: note: passing argument to parameter 'nr_pages' here
     153 | int add_pages(int nid, unsigned long start_pfn, unsigned long nr_pages,
         |                                                               ^
   drivers/gpu/drm/i915/i915_vma.c:1139:51: error: incompatible pointer types passing 'struct scatterlist *' to parameter of type 'struct mhp_params *' [-Werror,-Wincompatible-pointer-types]
    1139 |                         sg = add_pages(addr, length >> PAGE_SHIFT, st, sg);
         |                                                                        ^~
   include/linux/memory_hotplug.h:154:27: note: passing argument to parameter 'params' here
     154 |               struct mhp_params *params);
         |                                  ^
   drivers/gpu/drm/i915/i915_vma.c:1139:7: error: incompatible integer to pointer conversion assigning to 'struct scatterlist *' from 'int' [-Wint-conversion]
    1139 |                         sg = add_pages(addr, length >> PAGE_SHIFT, st, sg);
         |                            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   10 errors generated.


vim +/add_pages +968 drivers/gpu/drm/i915/i915_vma.c

   966	
   967	static struct scatterlist *
 > 968	add_pages(dma_addr_t addr, unsigned int count,
   969		  struct sg_table *st, struct scatterlist *sg)
   970	{
   971		st->nents++;
   972	
   973		sg_set_page(sg, NULL, count * I915_GTT_PAGE_SIZE, 0);
   974		sg_dma_address(sg) = addr;
   975		sg_dma_len(sg) = count * I915_GTT_PAGE_SIZE;
   976	
   977		return sg_next(sg);
   978	}
   979	
   980	static struct scatterlist *
   981	add_padding_pages(unsigned int count,
   982			  struct sg_table *st, struct scatterlist *sg)
   983	{
   984		/*
   985		 * The DE ignores the PTEs for the padding tiles, the sg entry
   986		 * here is just a convenience to indicate how many padding PTEs
   987		 * to insert at this spot.
   988		 */
 > 989		return add_pages(0, count, st, sg);
   990	}
   991	
   992	static struct scatterlist *
   993	rotate_tiled_color_plane_pages(const struct intel_remapped_plane_info *plane,
   994				       struct drm_i915_gem_object *obj,
   995				       unsigned int alignment_pad,
   996				       struct sg_table *st, struct scatterlist *sg,
   997				       unsigned int *gtt_offset)
   998	{
   999		unsigned int offset = plane->offset;
  1000		unsigned int width = plane->width;
  1001		unsigned int height = plane->height;
  1002		unsigned int src_stride = plane->src_stride;
  1003		unsigned int dst_stride = plane->dst_stride;
  1004		unsigned int column, row;
  1005		pgoff_t src_idx;
  1006	
  1007		if (!width || !height)
  1008			return sg;
  1009	
  1010		if (alignment_pad)
  1011			sg = add_padding_pages(alignment_pad, st, sg);
  1012	
  1013		for (column = 0; column < width; column++) {
  1014			unsigned int left;
  1015	
  1016			src_idx = src_stride * (height - 1) + column + offset;
  1017			for (row = 0; row < height; row++) {
  1018				dma_addr_t addr;
  1019	
  1020				/*
  1021				 * We don't need the pages, but need to initialize
  1022				 * the entries so the sg list can be happily traversed.
  1023				 * The only thing we need are DMA addresses.
  1024				 */
  1025	
  1026				addr = i915_gem_object_get_dma_address(obj, src_idx);
  1027	
> 1028				sg = add_pages(addr, 1, st, sg);
  1029	
  1030				src_idx -= src_stride;
  1031			}
  1032	
  1033			left = (dst_stride - height) * I915_GTT_PAGE_SIZE;
  1034	
  1035			if (!left)
  1036				continue;
  1037	
  1038			sg = add_padding_pages(left >> PAGE_SHIFT, st, sg);
  1039		}
  1040	
  1041		*gtt_offset += alignment_pad + dst_stride * width;
  1042	
  1043		return sg;
  1044	}
  1045	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
