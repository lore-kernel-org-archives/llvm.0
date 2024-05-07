Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF5673514;
	Tue,  7 May 2024 21:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715118234; cv=none; b=BPfc2LfP+K8XjfAFaQ3y39/ttlEYcQVL+tjPfo0PMXY0GfVQ4GI42Qg+635jGjFduyRvmgdu4N8vy1rvwJNuU+a1fCs4/FkS4ckwzR8CZV8T11OdNNy/y4yZZ+Jx5WhZbYzPOJICZhUtTdeBORfvFiz1+MDch+CLNqvT7w5chVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715118234; c=relaxed/simple;
	bh=8ZUr1tN7mCO6m+aoWi+dR+egBQBbLyoCMH8S5H+dX6w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n3z4Spg4nYRBlTXGTK6juiv3UCEKI8IzbOvccFAN+r1LkZXxrKNHppamCxuLaDrpdw1sXbbw5ZxK0EO8TsWHpwKLG3lyjYmuJYB6tQnXReJvPZnN12Z0LoExPz66AYRGc/NzO4IyvqkqrZUWv0yEht57Al9Kr6epmrFvMrzdfaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eVBbZIKX; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eVBbZIKX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715118233; x=1746654233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8ZUr1tN7mCO6m+aoWi+dR+egBQBbLyoCMH8S5H+dX6w=;
  b=eVBbZIKXDW9Mag78jzfqzo9V2PWSGumOtMqCYmDU1BJWKn8kVY5j9VuS
   FEMJpMr7cxEEV0+c6W2kvDn1/G0WdYeb4NR/zRheCr3FSfS7N0rbzRv/3
   a0fdNPyu0AAhfjdupyijcAx+ohVqyvF/4Wg6366ljZH/qQHihDot+Gi5H
   lLfDkIKXHc+HaVkiSxm/etUNBVNl8u3iiyKGxzZMYqtROxt461qqpOOTo
   Fz7f9smL4vVbCJiD2TXS1JT6hLiz1dpRy2RmlZUxhM9jiubwt4hdxcG/i
   AJa/ja/mfXivv8LUTlh7ZenGfkwdY98dababL0cd4OffQJ8e8N+k4XJ0t
   g==;
X-CSE-ConnectionGUID: aBJHnuOgQbaUkKi3A/52KA==
X-CSE-MsgGUID: vTLvk1nnQgeXoW/HNX/7Hw==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="14767265"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; 
   d="scan'208";a="14767265"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 14:43:53 -0700
X-CSE-ConnectionGUID: kLfF8VSXQxqjYuvdJP+ZMg==
X-CSE-MsgGUID: Ct57NELLQASzx7gNqiO5Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; 
   d="scan'208";a="29216569"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 May 2024 14:43:51 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4SbE-0002fA-1P;
	Tue, 07 May 2024 21:43:48 +0000
Date: Wed, 8 May 2024 05:43:47 +0800
From: kernel test robot <lkp@intel.com>
To: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [linux-next:master 7037/11707]
 drivers/gpu/drm/xlnx/zynqmp_disp.c:949:14: error: logical not is only
 applied to the left hand side of this comparison
Message-ID: <202405080553.tfH9EmS8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Anatoliy,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   93a39e4766083050ca0ecd6a3548093a3b9eb60c
commit: b0f0469ab662159f182f5af292b71cc5d42468a8 [7037/11707] drm: xlnx: zynqmp_dpsub: Anounce supported input formats
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240508/202405080553.tfH9EmS8-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 0ab4458df0688955620b72cc2c72a32dffad3615)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405080553.tfH9EmS8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405080553.tfH9EmS8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xlnx/zynqmp_disp.c:15:
   In file included from include/drm/drm_plane.h:33:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/xlnx/zynqmp_disp.c:19:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/gpu/drm/xlnx/zynqmp_disp.c:19:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/gpu/drm/xlnx/zynqmp_disp.c:19:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/gpu/drm/xlnx/zynqmp_disp.c:949:14: error: logical not is only applied to the left hand side of this comparison [-Werror,-Wlogical-not-parentheses]
     949 |         if (WARN_ON(!layer->mode == ZYNQMP_DPSUB_LAYER_NONLIVE)) {
         |                     ^            ~~
   arch/s390/include/asm/bug.h:54:25: note: expanded from macro 'WARN_ON'
      54 |         int __ret_warn_on = !!(x);                      \
         |                                ^
   drivers/gpu/drm/xlnx/zynqmp_disp.c:949:14: note: add parentheses after the '!' to evaluate the comparison first
   drivers/gpu/drm/xlnx/zynqmp_disp.c:949:14: note: add parentheses around left hand side expression to silence this warning
   18 errors generated.


vim +949 drivers/gpu/drm/xlnx/zynqmp_disp.c

   928	
   929	/**
   930	 * zynqmp_disp_layer_drm_formats - Return the DRM formats supported by the layer
   931	 * @layer: The layer
   932	 * @num_formats: Pointer to the returned number of formats
   933	 *
   934	 * NOTE: This function doesn't make sense for live video layers and will
   935	 * always return an empty list in such cases. zynqmp_disp_live_layer_formats()
   936	 * should be used to query a list of media bus formats supported by the live
   937	 * video input layer.
   938	 *
   939	 * Return: A newly allocated u32 array that stores all the DRM formats
   940	 * supported by the layer. The number of formats in the array is returned
   941	 * through the num_formats argument.
   942	 */
   943	u32 *zynqmp_disp_layer_drm_formats(struct zynqmp_disp_layer *layer,
   944					   unsigned int *num_formats)
   945	{
   946		unsigned int i;
   947		u32 *formats;
   948	
 > 949		if (WARN_ON(!layer->mode == ZYNQMP_DPSUB_LAYER_NONLIVE)) {
   950			*num_formats = 0;
   951			return NULL;
   952		}
   953	
   954		formats = kcalloc(layer->info->num_formats, sizeof(*formats),
   955				  GFP_KERNEL);
   956		if (!formats) {
   957			*num_formats = 0;
   958			return NULL;
   959		}
   960	
   961		for (i = 0; i < layer->info->num_formats; ++i)
   962			formats[i] = layer->info->formats[i].drm_fmt;
   963	
   964		*num_formats = layer->info->num_formats;
   965		return formats;
   966	}
   967	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
