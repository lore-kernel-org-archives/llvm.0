Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FF8168BC;
	Sun,  5 Nov 2023 23:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dIoSrlq4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699228160; x=1730764160;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IB35KXqkOsp9LzDt+o3HcIIDTzPUOe/zTAR8u+POflc=;
  b=dIoSrlq4FazdSheBzqCxCaIPWMSWorlg5dX6R0YmP093+4DCWk4qPQoy
   7lUo0My7+g2YkiBbpZvdh3bips55COMfeHsxNgbyg1n2HkSNddQXWVRyD
   6RE9fOCJeRJCwhZ+t0IfjRcSvA1+MgPj8yjtRjxPoWM3ELYNWHrFEp91U
   wUW1CfcrAeQa9dij+NX4owWk+YRNvEVxDOl9w40PCCY58pD0Lql+6JK+e
   r3fdQli9UVOe6EZJQcsuJ+C+C0QbY8NyGpR6tHfwFhGt0R4xKYnDKtbeS
   TmIOtdeBpaa8ZxLyJjTc64WbNzhYiK6F6sNgNl6wofXqj/dsSGNErnvuA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="10721860"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="10721860"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 15:49:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="1093607298"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="1093607298"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 05 Nov 2023 15:49:17 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzmrj-0005tI-1D;
	Sun, 05 Nov 2023 23:49:15 +0000
Date: Mon, 6 Nov 2023 07:48:43 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/2] dmaengine: fsl-edma: add trace event support
Message-ID: <202311060731.YvOiksyu-lkp@intel.com>
References: <20230919151430.2919042-3-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919151430.2919042-3-Frank.Li@nxp.com>

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on linus/master v6.6 next-20231103]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/dmaengine-fsl-emda-add-debugfs-support/20230920-010257
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20230919151430.2919042-3-Frank.Li%40nxp.com
patch subject: [PATCH v2 2/2] dmaengine: fsl-edma: add trace event support
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20231106/202311060731.YvOiksyu-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311060731.YvOiksyu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311060731.YvOiksyu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/dma/fsl-edma-trace.c:4:
   In file included from drivers/dma/fsl-edma-common.h:238:
   In file included from drivers/dma/fsl-edma-trace.h:134:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:237:
>> drivers/dma/fsl-edma-trace.h:29:3: warning: format specifies type 'unsigned long' but the argument has type 'int' [-Wformat]
                   __entry->addr - __entry->edma->membase, __entry->value)
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/stages/stage3_trace_output.h:6:17: note: expanded from macro '__entry'
   #define __entry field
                   ^
   include/trace/stages/stage3_trace_output.h:9:43: note: expanded from macro 'TP_printk'
   #define TP_printk(fmt, args...) fmt "\n", args
                                   ~~~       ^
   include/trace/trace_events.h:203:27: note: expanded from macro 'DECLARE_EVENT_CLASS'
           trace_event_printf(iter, print);                                \
                                    ^~~~~
   1 warning generated.


vim +29 drivers/dma/fsl-edma-trace.h

    14	
    15	DECLARE_EVENT_CLASS(edma_log_io,
    16		TP_PROTO(struct fsl_edma_engine *edma, void __iomem *addr, u32 value),
    17		TP_ARGS(edma, addr, value),
    18		TP_STRUCT__entry(
    19			__field(struct fsl_edma_engine *, edma)
    20			__field(void __iomem *, addr)
    21			__field(u32, value)
    22		),
    23		TP_fast_assign(
    24			__entry->edma = edma;
    25			__entry->addr = addr;
    26			__entry->value = value;
    27		),
    28		TP_printk("offset %08lx: value %08x",
  > 29			__entry->addr - __entry->edma->membase, __entry->value)
    30	);
    31	
    32	DEFINE_EVENT(edma_log_io, edma_readl,
    33		TP_PROTO(struct fsl_edma_engine *edma, void __iomem *addr, u32 value),
    34		TP_ARGS(edma, addr, value)
    35	);
    36	
    37	DEFINE_EVENT(edma_log_io, edma_writel,
    38		TP_PROTO(struct fsl_edma_engine *edma, void __iomem *addr,  u32 value),
    39		TP_ARGS(edma, addr, value)
    40	);
    41	
    42	DEFINE_EVENT(edma_log_io, edma_readw,
    43		TP_PROTO(struct fsl_edma_engine *edma, void __iomem *addr, u32 value),
    44		TP_ARGS(edma, addr, value)
    45	);
    46	
    47	DEFINE_EVENT(edma_log_io, edma_writew,
    48		TP_PROTO(struct fsl_edma_engine *edma, void __iomem *addr,  u32 value),
    49		TP_ARGS(edma, addr, value)
    50	);
    51	
    52	DEFINE_EVENT(edma_log_io, edma_readb,
    53		TP_PROTO(struct fsl_edma_engine *edma, void __iomem *addr, u32 value),
    54		TP_ARGS(edma, addr, value)
    55	);
    56	
    57	DEFINE_EVENT(edma_log_io, edma_writeb,
    58		TP_PROTO(struct fsl_edma_engine *edma, void __iomem *addr,  u32 value),
    59		TP_ARGS(edma, addr, value)
    60	);
    61	
    62	DECLARE_EVENT_CLASS(edma_log_tcd,
    63		TP_PROTO(struct fsl_edma_engine *edma, struct fsl_edma_hw_tcd *tcd),
    64		TP_ARGS(edma, tcd),
    65		TP_STRUCT__entry(
    66			__field(struct fsl_edma_engine *, edma)
    67			__field(u32, saddr)
    68			__field(u16, soff)
    69			__field(u16, attr)
    70			__field(u32, nbytes)
    71			__field(u32, slast)
    72			__field(u32, daddr)
    73			__field(u16, doff)
    74			__field(u16, citer)
    75			__field(u32, dlast_sga)
    76			__field(u16, csr)
    77			__field(u16, biter)
    78	
    79		),
    80		TP_fast_assign(
    81			__entry->edma = edma;
    82			__entry->saddr = tcd->saddr,
    83			__entry->soff = tcd->soff,
    84			__entry->attr = tcd->attr,
    85			__entry->nbytes = tcd->nbytes,
    86			__entry->slast = tcd->slast,
    87			__entry->daddr = tcd->daddr,
    88			__entry->doff = tcd->doff,
    89			__entry->citer = tcd->citer,
    90			__entry->dlast_sga = tcd->dlast_sga,
    91			__entry->csr = tcd->csr,
    92			__entry->biter = tcd->biter;
    93		),
    94		TP_printk("\n==== TCD =====\n"
    95			  "  saddr:  0x%08x\n"
    96			  "  soff:       0x%04x\n"
    97			  "  attr:       0x%04x\n"
    98			  "  nbytes: 0x%08x\n"
    99			  "  slast:  0x%08x\n"
   100			  "  daddr:  0x%08x\n"
   101			  "  doff:       0x%04x\n"
   102			  "  citer:      0x%04x\n"
   103			  "  dlast:  0x%08x\n"
   104			  "  csr:        0x%04x\n"
   105			  "  biter:      0x%04x\n",
   106			__entry->saddr,
   107			__entry->soff,
   108			__entry->attr,
   109			__entry->nbytes,
   110			__entry->slast,
   111			__entry->daddr,
   112			__entry->doff,
   113			__entry->citer,
   114			__entry->dlast_sga,
   115			__entry->csr,
   116			__entry->biter)
   117	);
   118	
   119	DEFINE_EVENT(edma_log_tcd, edma_fill_tcd,
   120		TP_PROTO(struct fsl_edma_engine *edma, struct fsl_edma_hw_tcd *tcd),
   121		TP_ARGS(edma, tcd)
   122	);
   123	
   124	#endif
   125	
   126	/* this part must be outside header guard */
   127	
   128	#undef TRACE_INCLUDE_PATH
   129	#define TRACE_INCLUDE_PATH .
   130	
   131	#undef TRACE_INCLUDE_FILE
   132	#define TRACE_INCLUDE_FILE fsl-edma-trace
   133	
 > 134	#include <trace/define_trace.h>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
