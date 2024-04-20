Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FBF134DE;
	Sat, 20 Apr 2024 13:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713619898; cv=none; b=uOhvdCPUHBtEai/01e5MDVnGpvPvpP9JTVsRqELDf7RWhQvc71/d6SkvZhFqq1h07cG4KKAyjgvJm/QGKttysCA+rPYrnt5zHMKCCIBUuvBU+BgFALMTPgnO/bzY/Jei/MZeCrhdgSfb6SlWq9R1FnlHexiwimpDBo5Uj1G5ik0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713619898; c=relaxed/simple;
	bh=tmhZtPGAMr8IPvH/Y1+N/5MfnmXVAVT5PIqfKmNr22w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rilm64P8LCAVoGuSx1Udvhdxgj2NGTI8njajSsWtLu00adeoj0QSh5TwXtGtz5sWmRy67qQcHabYH6iBNdqF/5oTmNOmuy2jpA9O+0kisreh+Rn+25rdehzqczvUF/g4f98egwTtrif5V7UxZ3oNxB5kjQvfr8Xrq948+ju+yPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nP6qjt4o; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nP6qjt4o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713619896; x=1745155896;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tmhZtPGAMr8IPvH/Y1+N/5MfnmXVAVT5PIqfKmNr22w=;
  b=nP6qjt4oc2zkASnxsKl89jCkt9veC/9obtnJ5cmNzqV8tEjxrKRMDdh+
   EutFGIoOJL1XPGfKWkcHynNp+rBC7WYQlHpkexITlrBr5kStziMNaOgtI
   nJ4u0wuVO4jBTaZllJdNqfYjpLVrtxfvA1GfdyUJ+BPgeNV5akptRrec3
   7ZfFcLG++jB+yEVBy8hBJy7tmR+I3vJKLfYz1bcq89yDTIfZwysZl5vXF
   EW+KajGa/JHEOH5C9hhGJLeaH1z4F0+MnXZvgmj4GrcaRC6UtZL8byI33
   6UTI0bwZbXdPlsspX3rwm6li458PsH/wWeRvLcnU2YJMFwwi9pNmRFgO0
   A==;
X-CSE-ConnectionGUID: 9ZIVA7XwSTu4SURj9zUX7A==
X-CSE-MsgGUID: k4XRx9o8RrmoqlS22kda+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11050"; a="34612375"
X-IronPort-AV: E=Sophos;i="6.07,216,1708416000"; 
   d="scan'208";a="34612375"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2024 06:31:35 -0700
X-CSE-ConnectionGUID: MTplHLvsSlCZyANNLR9QPg==
X-CSE-MsgGUID: D3O6Ao35QGaQh/mXOoUBDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,216,1708416000"; 
   d="scan'208";a="54520269"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 20 Apr 2024 06:31:33 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryAoU-000B6e-16;
	Sat, 20 Apr 2024 13:31:30 +0000
Date: Sat, 20 Apr 2024 21:30:38 +0800
From: kernel test robot <lkp@intel.com>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 2/2] riscv: Use Zawrs to accelerate IPI to idle cpu
Message-ID: <202404202129.uQmgTDG1-lkp@intel.com>
References: <20240418114942.52770-3-luxu.kernel@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240418114942.52770-3-luxu.kernel@bytedance.com>

Hi Xu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on v6.9-rc2]
[cannot apply to linus/master v6.9-rc4 v6.9-rc3 next-20240419]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xu-Lu/riscv-process-Introduce-idle-thread-using-Zawrs-extension/20240418-195356
base:   v6.9-rc2
patch link:    https://lore.kernel.org/r/20240418114942.52770-3-luxu.kernel%40bytedance.com
patch subject: [RFC 2/2] riscv: Use Zawrs to accelerate IPI to idle cpu
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240420/202404202129.uQmgTDG1-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240420/202404202129.uQmgTDG1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404202129.uQmgTDG1-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/mediatek/mdp/mtk_mdp_core.c:11:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/media/platform/mediatek/mdp/mtk_mdp_core.c:23:
>> drivers/media/platform/mediatek/vpu/mtk_vpu.h:63:2: error: redefinition of enumerator 'IPI_MAX'
      63 |         IPI_MAX,
         |         ^
   arch/riscv/include/asm/smp.h:29:2: note: previous definition is here
      29 |         IPI_MAX
         |         ^
   drivers/media/platform/mediatek/mdp/mtk_mdp_core.c:206:52: warning: implicit conversion from 'unsigned long long' to 'unsigned int' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
     206 |         ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
         |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~             ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:40: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                        ^~~~~
   6 warnings and 1 error generated.
--
   In file included from drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c:17:
   In file included from drivers/media/platform/mediatek/mdp/mtk_mdp_core.h:12:
   In file included from include/media/v4l2-ctrls.h:14:
   In file included from include/media/media-request.h:20:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c:20:
>> drivers/media/platform/mediatek/vpu/mtk_vpu.h:63:2: error: redefinition of enumerator 'IPI_MAX'
      63 |         IPI_MAX,
         |         ^
   arch/riscv/include/asm/smp.h:29:2: note: previous definition is here
      29 |         IPI_MAX
         |         ^
   5 warnings and 1 error generated.
--
   In file included from drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_intr.c:10:
   In file included from drivers/media/platform/mediatek/vcodec/common/../decoder/mtk_vcodec_dec_drv.h:10:
   In file included from drivers/media/platform/mediatek/vcodec/common/../decoder/../common/mtk_vcodec_cmn_drv.h:12:
   In file included from include/media/v4l2-ctrls.h:14:
   In file included from include/media/media-request.h:20:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_intr.c:10:
   In file included from drivers/media/platform/mediatek/vcodec/common/../decoder/mtk_vcodec_dec_drv.h:12:
   In file included from drivers/media/platform/mediatek/vcodec/common/../decoder/../common/mtk_vcodec_fw_priv.h:6:
   In file included from drivers/media/platform/mediatek/vcodec/common/../decoder/../common/mtk_vcodec_fw.h:9:
>> drivers/media/platform/mediatek/vcodec/common/../decoder/../common/../../vpu/mtk_vpu.h:63:2: error: redefinition of enumerator 'IPI_MAX'
      63 |         IPI_MAX,
         |         ^
   arch/riscv/include/asm/smp.h:29:2: note: previous definition is here
      29 |         IPI_MAX
         |         ^
   5 warnings and 1 error generated.
--
   In file included from drivers/media/platform/mediatek/vpu/mtk_vpu.c:9:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/media/platform/mediatek/vpu/mtk_vpu.c:20:
>> drivers/media/platform/mediatek/vpu/mtk_vpu.h:63:2: error: redefinition of enumerator 'IPI_MAX'
      63 |         IPI_MAX,
         |         ^
   arch/riscv/include/asm/smp.h:29:2: note: previous definition is here
      29 |         IPI_MAX
         |         ^
>> drivers/media/platform/mediatek/vpu/mtk_vpu.c:299:9: warning: comparison of different enumeration types ('enum ipi_id' and 'enum ipi_message_type') [-Wenum-compare]
     299 |         if (id < IPI_MAX && handler) {
         |             ~~ ^ ~~~~~~~
   drivers/media/platform/mediatek/vpu/mtk_vpu.c:322:31: warning: comparison of different enumeration types ('enum ipi_id' and 'enum ipi_message_type') [-Wenum-compare]
     322 |         if (id <= IPI_VPU_INIT || id >= IPI_MAX ||
         |                                   ~~ ^  ~~~~~~~
   7 warnings and 1 error generated.
--
   In file included from drivers/media/platform/mediatek/vcodec/encoder/venc/venc_vp8_if.c:8:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/media/platform/mediatek/vcodec/encoder/venc/venc_vp8_if.c:12:
   In file included from drivers/media/platform/mediatek/vcodec/encoder/venc/../mtk_vcodec_enc_drv.h:12:
   In file included from drivers/media/platform/mediatek/vcodec/encoder/venc/../../common/mtk_vcodec_fw_priv.h:6:
   In file included from drivers/media/platform/mediatek/vcodec/encoder/venc/../../common/mtk_vcodec_fw.h:9:
>> drivers/media/platform/mediatek/vcodec/encoder/venc/../../common/../../vpu/mtk_vpu.h:63:2: error: redefinition of enumerator 'IPI_MAX'
      63 |         IPI_MAX,
         |         ^
   arch/riscv/include/asm/smp.h:29:2: note: previous definition is here
      29 |         IPI_MAX
         |         ^
   5 warnings and 1 error generated.
--
   In file included from drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c:9:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c:13:
   In file included from drivers/media/platform/mediatek/vcodec/encoder/venc/../mtk_vcodec_enc_drv.h:12:
   In file included from drivers/media/platform/mediatek/vcodec/encoder/venc/../../common/mtk_vcodec_fw_priv.h:6:
   In file included from drivers/media/platform/mediatek/vcodec/encoder/venc/../../common/mtk_vcodec_fw.h:9:
>> drivers/media/platform/mediatek/vcodec/encoder/venc/../../common/../../vpu/mtk_vpu.h:63:2: error: redefinition of enumerator 'IPI_MAX'
      63 |         IPI_MAX,
         |         ^
   arch/riscv/include/asm/smp.h:29:2: note: previous definition is here
      29 |         IPI_MAX
         |         ^
   drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c:596:29: warning: conditional expression between different enumeration types ('enum scp_ipi_id' and 'enum ipi_id') [-Wenum-compare-conditional]
     596 |         inst->vpu_inst.id = is_ext ? SCP_IPI_VENC_H264 : IPI_VENC_H264;
         |                                    ^ ~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~
   6 warnings and 1 error generated.
--
   In file included from drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c:9:
   In file included from include/media/v4l2-mem2mem.h:16:
   In file included from include/media/videobuf2-v4l2.h:16:
   In file included from include/media/videobuf2-core.h:18:
   In file included from include/linux/dma-buf.h:19:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c:13:
   In file included from drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.h:14:
   In file included from drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h:12:
   In file included from drivers/media/platform/mediatek/vcodec/encoder/../common/mtk_vcodec_fw_priv.h:6:
   In file included from drivers/media/platform/mediatek/vcodec/encoder/../common/mtk_vcodec_fw.h:9:
>> drivers/media/platform/mediatek/vcodec/encoder/../common/../../vpu/mtk_vpu.h:63:2: error: redefinition of enumerator 'IPI_MAX'
      63 |         IPI_MAX,
         |         ^
   arch/riscv/include/asm/smp.h:29:2: note: previous definition is here
      29 |         IPI_MAX
         |         ^
   5 warnings and 1 error generated.
--
   In file included from drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_if.c:10:
   In file included from drivers/media/platform/mediatek/vcodec/decoder/vdec/../vdec_drv_if.h:11:
   In file included from drivers/media/platform/mediatek/vcodec/decoder/vdec/../mtk_vcodec_dec.h:11:
   In file included from include/media/videobuf2-core.h:18:
   In file included from include/linux/dma-buf.h:19:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_if.c:10:
   In file included from drivers/media/platform/mediatek/vcodec/decoder/vdec/../vdec_drv_if.h:11:
   In file included from drivers/media/platform/mediatek/vcodec/decoder/vdec/../mtk_vcodec_dec.h:14:
   In file included from drivers/media/platform/mediatek/vcodec/decoder/vdec/../mtk_vcodec_dec_drv.h:12:
   In file included from drivers/media/platform/mediatek/vcodec/decoder/vdec/../../common/mtk_vcodec_fw_priv.h:6:
   In file included from drivers/media/platform/mediatek/vcodec/decoder/vdec/../../common/mtk_vcodec_fw.h:9:
>> drivers/media/platform/mediatek/vcodec/decoder/vdec/../../common/../../vpu/mtk_vpu.h:63:2: error: redefinition of enumerator 'IPI_MAX'
      63 |         IPI_MAX,
         |         ^
   arch/riscv/include/asm/smp.h:29:2: note: previous definition is here
      29 |         IPI_MAX
         |         ^
   5 warnings and 1 error generated.
..


vim +/IPI_MAX +63 drivers/media/platform/mediatek/vpu/mtk_vpu.h

3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  11  
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  12  /**
0f02beec61875e drivers/media/platform/mtk-vpu/mtk_vpu.h      Hans Verkuil   2021-03-11  13   * DOC: VPU
0f02beec61875e drivers/media/platform/mtk-vpu/mtk_vpu.h      Hans Verkuil   2021-03-11  14   *
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  15   * VPU (video processor unit) is a tiny processor controlling video hardware
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  16   * related to video codec, scaling and color format converting.
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  17   * VPU interfaces with other blocks by share memory and interrupt.
0f02beec61875e drivers/media/platform/mtk-vpu/mtk_vpu.h      Hans Verkuil   2021-03-11  18   */
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  19  
bfb1b99802ef16 drivers/media/platform/mediatek/vpu/mtk_vpu.h Arnd Bergmann  2024-02-24  20  typedef void (*ipi_handler_t) (void *data,
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  21  			       unsigned int len,
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  22  			       void *priv);
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  23  
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  24  /**
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  25   * enum ipi_id - the id of inter-processor interrupt
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  26   *
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  27   * @IPI_VPU_INIT:	 The interrupt from vpu is to notfiy kernel
e2818a59f7ca42 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  28   *			 VPU initialization completed.
e2818a59f7ca42 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  29   *			 IPI_VPU_INIT is sent from VPU when firmware is
e2818a59f7ca42 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  30   *			 loaded. AP doesn't need to send IPI_VPU_INIT
e2818a59f7ca42 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  31   *			 command to VPU.
e2818a59f7ca42 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  32   *			 For other IPI below, AP should send the request
e2818a59f7ca42 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  33   *			 to VPU to trigger the interrupt.
e2818a59f7ca42 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  34   * @IPI_VDEC_H264:	 The interrupt from vpu is to notify kernel to
e2818a59f7ca42 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  35   *			 handle H264 vidoe decoder job, and vice versa.
e2818a59f7ca42 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  36   *			 Decode output format is always MT21 no matter what
e2818a59f7ca42 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  37   *			 the input format is.
e2818a59f7ca42 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  38   * @IPI_VDEC_VP8:	 The interrupt from is to notify kernel to
e2818a59f7ca42 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  39   *			 handle VP8 video decoder job, and vice versa.
e2818a59f7ca42 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  40   *			 Decode output format is always MT21 no matter what
e2818a59f7ca42 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  41   *			 the input format is.
e2818a59f7ca42 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  42   * @IPI_VDEC_VP9:	 The interrupt from vpu is to notify kernel to
e2818a59f7ca42 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  43   *			 handle VP9 video decoder job, and vice versa.
e2818a59f7ca42 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  44   *			 Decode output format is always MT21 no matter what
e2818a59f7ca42 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  45   *			 the input format is.
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  46   * @IPI_VENC_H264:	 The interrupt from vpu is to notify kernel to
e2818a59f7ca42 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  47   *			 handle H264 video encoder job, and vice versa.
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  48   * @IPI_VENC_VP8:	 The interrupt fro vpu is to notify kernel to
e2818a59f7ca42 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  49   *			 handle VP8 video encoder job,, and vice versa.
737ea6cfd22631 drivers/media/platform/mtk-vpu/mtk_vpu.h      Minghsiu Tsai  2016-09-08  50   * @IPI_MDP:		 The interrupt from vpu is to notify kernel to
737ea6cfd22631 drivers/media/platform/mtk-vpu/mtk_vpu.h      Minghsiu Tsai  2016-09-08  51   *			 handle MDP (Media Data Path) job, and vice versa.
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  52   * @IPI_MAX:		 The maximum IPI number
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  53   */
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  54  
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  55  enum ipi_id {
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  56  	IPI_VPU_INIT = 0,
e2818a59f7ca42 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  57  	IPI_VDEC_H264,
e2818a59f7ca42 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  58  	IPI_VDEC_VP8,
e2818a59f7ca42 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  59  	IPI_VDEC_VP9,
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  60  	IPI_VENC_H264,
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  61  	IPI_VENC_VP8,
737ea6cfd22631 drivers/media/platform/mtk-vpu/mtk_vpu.h      Minghsiu Tsai  2016-09-08  62  	IPI_MDP,
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03 @63  	IPI_MAX,
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  64  };
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  65  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
