Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48080250F3;
	Fri, 13 Oct 2023 21:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NdTvbdpk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697231801; x=1728767801;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gKHV+M/k+ZIH5GutFzplK5nxPf27amH0RIKvaYjWEUQ=;
  b=NdTvbdpkfUefJ8h7GB0bTV7Ef26KB7YdfGjDRdQ0jLN5C7naqXLbIS4Z
   KO54ilEpobMBnrXM99ybAHZ1e5v41LFNtQ1YozeRaPbn0XeWsXrQ10iJd
   +xCEdWnPbCtzuVpH7Bfo3G+50EFRKGXEmiOZTQ8I0hAa9QvirDkEbUAnn
   +UutqfBKYXumg2o1ePSFzzkGRk7hw2i0eG1vzoqQRY4GbZAeh4tAbExhq
   SgoDCfzB9gz8Nkng2lzNa3xjH+hggjZqOWMVrRuzhX6NecLSwrRTUJ1Ah
   ag18FCSCN7Pj2gYdIcIOhHgEz+YxeKry+/ttj+VqeWaBvXRLIVd5joMsg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="384138021"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="384138021"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 14:16:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="754850671"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="754850671"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 13 Oct 2023 14:16:36 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrPWM-0005Oi-1E;
	Fri, 13 Oct 2023 21:16:34 +0000
Date: Sat, 14 Oct 2023 05:15:51 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Roberts <ryan.roberts@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
	Peter Collingbourne <pcc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64/mm: Hoist synchronization out of set_ptes() loop
Message-ID: <202310140531.BQQwt3NQ-lkp@intel.com>
References: <20231005140730.2191134-1-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005140730.2191134-1-ryan.roberts@arm.com>

Hi Ryan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on arm-perf/for-next/perf arm/for-next kvmarm/next soc/for-next linus/master v6.6-rc5 next-20231013]
[cannot apply to arm/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Roberts/arm64-mm-Hoist-synchronization-out-of-set_ptes-loop/20231005-231636
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20231005140730.2191134-1-ryan.roberts%40arm.com
patch subject: [PATCH v2] arm64/mm: Hoist synchronization out of set_ptes() loop
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231014/202310140531.BQQwt3NQ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140531.BQQwt3NQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140531.BQQwt3NQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/ipv4/route.c:66:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
>> arch/arm64/include/asm/pgtable.h:344:65: warning: parameter 'addr' set but not used [-Wunused-but-set-parameter]
     344 | static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
         |                                                                 ^
   1 warning generated.
--
   In file included from sound/soc/qcom/qdsp6/q6apm-dai.c:9:
   In file included from include/sound/soc.h:18:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/arm64/include/asm/hardirq.h:17:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/arm64/include/asm/io.h:12:
   In file included from include/linux/pgtable.h:6:
>> arch/arm64/include/asm/pgtable.h:344:65: warning: parameter 'addr' set but not used [-Wunused-but-set-parameter]
     344 | static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
         |                                                                 ^
   sound/soc/qcom/qdsp6/q6apm-dai.c:355:38: warning: cast from 'void (*)(uint32_t, uint32_t, uint32_t *, void *)' (aka 'void (*)(unsigned int, unsigned int, unsigned int *, void *)') to 'q6apm_cb' (aka 'void (*)(unsigned int, unsigned int, void *, void *)') converts to incompatible function type [-Wcast-function-type-strict]
     355 |         prtd->graph = q6apm_graph_open(dev, (q6apm_cb)event_handler, prtd, graph_id);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/q6apm-dai.c:499:38: warning: cast from 'void (*)(uint32_t, uint32_t, uint32_t *, void *)' (aka 'void (*)(unsigned int, unsigned int, unsigned int *, void *)') to 'q6apm_cb' (aka 'void (*)(unsigned int, unsigned int, void *, void *)') converts to incompatible function type [-Wcast-function-type-strict]
     499 |         prtd->graph = q6apm_graph_open(dev, (q6apm_cb)event_handler_compr, prtd, graph_id);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.
--
   In file included from arch/arm64/kernel/mte.c:9:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
>> arch/arm64/include/asm/pgtable.h:344:65: warning: parameter 'addr' set but not used [-Wunused-but-set-parameter]
     344 | static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
         |                                                                 ^
   arch/arm64/kernel/mte.c:79:20: warning: unused function '__mte_enable_kernel' [-Wunused-function]
      79 | static inline void __mte_enable_kernel(const char *mode, unsigned long tcf)
         |                    ^
   2 warnings generated.
--
   In file included from drivers/gpu/drm/radeon/radeon_ttm.c:33:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
>> arch/arm64/include/asm/pgtable.h:344:65: warning: parameter 'addr' set but not used [-Wunused-but-set-parameter]
     344 | static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
         |                                                                 ^
   drivers/gpu/drm/radeon/radeon_ttm.c:200:20: warning: variable 'rbo' set but not used [-Wunused-but-set-variable]
     200 |         struct radeon_bo *rbo;
         |                           ^
   2 warnings generated.
--
   In file included from drivers/gpu/drm/kmb/kmb_dsi.c:12:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/arm64/include/asm/io.h:12:
   In file included from include/linux/pgtable.h:6:
>> arch/arm64/include/asm/pgtable.h:344:65: warning: parameter 'addr' set but not used [-Wunused-but-set-parameter]
     344 | static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
         |                                                                 ^
   drivers/gpu/drm/kmb/kmb_dsi.c:822:2: warning: unused function 'set_test_mode_src_osc_freq_target_low_bits' [-Wunused-function]
     822 |         set_test_mode_src_osc_freq_target_low_bits(struct kmb_dsi *kmb_dsi,
         |         ^
   drivers/gpu/drm/kmb/kmb_dsi.c:834:2: warning: unused function 'set_test_mode_src_osc_freq_target_hi_bits' [-Wunused-function]
     834 |         set_test_mode_src_osc_freq_target_hi_bits(struct kmb_dsi *kmb_dsi,
         |         ^
   3 warnings generated.
--
   In file included from drivers/gpu/drm/nouveau/nouveau_svm.c:22:
   In file included from drivers/gpu/drm/nouveau/nouveau_svm.h:3:
   In file included from drivers/gpu/drm/nouveau/include/nvif/os.h:8:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/arm64/include/asm/hardirq.h:17:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/arm64/include/asm/io.h:12:
   In file included from include/linux/pgtable.h:6:
>> arch/arm64/include/asm/pgtable.h:344:65: warning: parameter 'addr' set but not used [-Wunused-but-set-parameter]
     344 | static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
         |                                                                 ^
   drivers/gpu/drm/nouveau/nouveau_svm.c:115:24: warning: variable 'priority' set but not used [-Wunused-but-set-variable]
     115 |         unsigned target, cmd, priority;
         |                               ^
   drivers/gpu/drm/nouveau/nouveau_svm.c:929:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     929 |         int ret;
         |             ^
   3 warnings generated.
--
   In file included from drivers/gpu/drm/nouveau/nouveau_connector.c:30:
   In file included from include/linux/vga_switcheroo.h:34:
   In file included from include/linux/fb.h:6:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/arm64/include/asm/hardirq.h:17:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/arm64/include/asm/io.h:12:
   In file included from include/linux/pgtable.h:6:
>> arch/arm64/include/asm/pgtable.h:344:65: warning: parameter 'addr' set but not used [-Wunused-but-set-parameter]
     344 | static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
         |                                                                 ^
   drivers/gpu/drm/nouveau/nouveau_connector.c:1301:7: warning: variable 'entry' set but not used [-Wunused-but-set-variable]
    1301 |                 u32 entry = ROM16(nv_connector->dcb[0]);
         |                     ^
   2 warnings generated.
--
   In file included from drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:22:
   In file included from drivers/gpu/drm/nouveau/nvkm/subdev/acr/priv.h:3:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/subdev/acr.h:5:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/device.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h:3:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/os.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvif/os.h:8:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/arm64/include/asm/hardirq.h:17:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/arm64/include/asm/io.h:12:
   In file included from include/linux/pgtable.h:6:
>> arch/arm64/include/asm/pgtable.h:344:65: warning: parameter 'addr' set but not used [-Wunused-but-set-parameter]
     344 | static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
         |                                                                 ^
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:221:7: warning: variable 'loc' set but not used [-Wunused-but-set-variable]
     221 |                 u32 loc, sig, cnt, *meta;
         |                     ^
   2 warnings generated.
--
   In file included from drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c:24:
   In file included from drivers/gpu/drm/nouveau/nvkm/subdev/bios/priv.h:5:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/subdev/bios.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/device.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h:3:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/os.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvif/os.h:8:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/arm64/include/asm/hardirq.h:17:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/arm64/include/asm/io.h:12:
   In file included from include/linux/pgtable.h:6:
>> arch/arm64/include/asm/pgtable.h:344:65: warning: parameter 'addr' set but not used [-Wunused-but-set-parameter]
     344 | static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
         |                                                                 ^
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c:161:10: warning: cast from 'void (*)(const struct firmware *)' to 'void (*)(void *)' converts to incompatible function type [-Wcast-function-type-strict]
     161 |         .fini = (void(*)(void *))release_firmware,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
--
   In file included from drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c:8:
   In file included from include/linux/io.h:13:
   In file included from arch/arm64/include/asm/io.h:12:
   In file included from include/linux/pgtable.h:6:
>> arch/arm64/include/asm/pgtable.h:344:65: warning: parameter 'addr' set but not used [-Wunused-but-set-parameter]
     344 | static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
         |                                                                 ^
   drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c:35:19: warning: unused function 'rcar_cmm_read' [-Wunused-function]
      35 | static inline int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
         |                   ^
   2 warnings generated.
--
   In file included from drivers/gpu/drm/qxl/qxl_cmd.c:30:
   In file included from include/drm/drm_util.h:35:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/arm64/include/asm/hardirq.h:17:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/arm64/include/asm/io.h:12:
   In file included from include/linux/pgtable.h:6:
>> arch/arm64/include/asm/pgtable.h:344:65: warning: parameter 'addr' set but not used [-Wunused-but-set-parameter]
     344 | static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
         |                                                                 ^
   drivers/gpu/drm/qxl/qxl_cmd.c:424:6: warning: variable 'count' set but not used [-Wunused-but-set-variable]
     424 |         int count = 0;
         |             ^
   2 warnings generated.
..


vim +/addr +344 arch/arm64/include/asm/pgtable.h

4f04d8f0054511 Catalin Marinas         2012-03-05  343  
4a169d61c2ede9 Matthew Wilcox (Oracle  2023-08-02 @344) static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
4a169d61c2ede9 Matthew Wilcox (Oracle  2023-08-02  345) 			      pte_t *ptep, pte_t pte, unsigned int nr)
42b2547137f5c9 Kefeng Wang             2022-05-12  346  {
4a169d61c2ede9 Matthew Wilcox (Oracle  2023-08-02  347) 	page_table_check_ptes_set(mm, ptep, pte, nr);
3ba82bb647345d Ryan Roberts            2023-10-05  348  	__sync_cache_and_tags(pte, nr);
4a169d61c2ede9 Matthew Wilcox (Oracle  2023-08-02  349) 
4a169d61c2ede9 Matthew Wilcox (Oracle  2023-08-02  350) 	for (;;) {
3ba82bb647345d Ryan Roberts            2023-10-05  351  		__check_safe_pte_update(mm, ptep, pte);
3ba82bb647345d Ryan Roberts            2023-10-05  352  		set_pte(ptep, pte);
4a169d61c2ede9 Matthew Wilcox (Oracle  2023-08-02  353) 		if (--nr == 0)
4a169d61c2ede9 Matthew Wilcox (Oracle  2023-08-02  354) 			break;
4a169d61c2ede9 Matthew Wilcox (Oracle  2023-08-02  355) 		ptep++;
4a169d61c2ede9 Matthew Wilcox (Oracle  2023-08-02  356) 		addr += PAGE_SIZE;
4a169d61c2ede9 Matthew Wilcox (Oracle  2023-08-02  357) 		pte_val(pte) += PAGE_SIZE;
4a169d61c2ede9 Matthew Wilcox (Oracle  2023-08-02  358) 	}
42b2547137f5c9 Kefeng Wang             2022-05-12  359  }
4a169d61c2ede9 Matthew Wilcox (Oracle  2023-08-02  360) #define set_ptes set_ptes
42b2547137f5c9 Kefeng Wang             2022-05-12  361  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
