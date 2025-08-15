Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3DE20D50C;
	Fri, 15 Aug 2025 09:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755248741; cv=none; b=jUEF+23dWjjbpizzwyDCdOiLMDHCkYZWKkieM5usXxWTRIbp631LUus5xdr/FCOHGlEzQ6saPfcbmzI6Hml7ln7ih0D9sKosmu/gXJKioJLURAZ+jmptwhFYhoBCeZDXNUxzptEte5JNwWH1az3moaHBkPwhvjlGYl42rH7k6pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755248741; c=relaxed/simple;
	bh=O7xPgKRPbGgdLevfx5porg0tubKMhWfNLrtzO0WORlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YCcuLjnd9yWKBSaCDOu0f9Qx6N/b5s+Y/PCa7/unlPDgZSioe2tmI4/nURsurhIqQbVuTPw7+tt1w6j3iuLs568cT2TIyxhWM0ix4IaFuhruEIpjOQ5AlxcCJuGeGq5FwULV3XX3xBTnpVUfRC8ow3k3G1BNNlhgHc549ycPtRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IrzcNGZm; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IrzcNGZm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755248740; x=1786784740;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O7xPgKRPbGgdLevfx5porg0tubKMhWfNLrtzO0WORlk=;
  b=IrzcNGZmzvMv7/DpQUXJ10DiSe99pBM2dUHCRfmjdi6ZtdtT2WZ1Qujw
   aPrJjuo+brbGSJ65HGVWVta5BTeQK5KZd+1yDbKIZzVviTNM23I972CjP
   PcmLTlJasAF0hT0kv0BxyllkVbRP4piesjbudAxNIyhtQ6RR+8gkb27fq
   idTcPbcDU7grygzt2oY0Czj4KDopBmXkR+YYjhz6gCImbopALRzdUktPJ
   wKyCymum3rBbcBBc9fqBGXKhvuCJV7sGtJAg6CYihlhFYUXJOrDkdm5kA
   DYZqo48p+pklvdbs7I0VU9TvDi6NOkCIgVnIIw6k0h7dWDoueLCteIaoD
   Q==;
X-CSE-ConnectionGUID: GbEx9GdUTl+Vc9njbPCgJQ==
X-CSE-MsgGUID: jEPKyTltSm6YMxlDwnrBTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57646245"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="57646245"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 02:05:37 -0700
X-CSE-ConnectionGUID: /CVWz0dBSSe7UAYy8tkPVA==
X-CSE-MsgGUID: FRHqS8lPRPWy1v540QUoLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="166892207"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 15 Aug 2025 02:05:36 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umqN6-000BmW-1b;
	Fri, 15 Aug 2025 09:05:26 +0000
Date: Fri, 15 Aug 2025 17:04:19 +0800
From: kernel test robot <lkp@intel.com>
To: Bharata B Rao <bharata@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 4/7] x86: ibs: In-kernel IBS driver for memory
 access profiling
Message-ID: <202508151636.bBftpYLw-lkp@intel.com>
References: <20250814134826.154003-5-bharata@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814134826.154003-5-bharata@amd.com>

Hi Bharata,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.17-rc1]
[cannot apply to akpm-mm/mm-everything tip/x86/core tip/x86/mm next-20250815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bharata-B-Rao/mm-migrate-Allow-misplaced-migration-without-VMA-too/20250814-215419
base:   linus/master
patch link:    https://lore.kernel.org/r/20250814134826.154003-5-bharata%40amd.com
patch subject: [RFC PATCH v1 4/7] x86: ibs: In-kernel IBS driver for memory access profiling
config: i386-buildonly-randconfig-003-20250815 (https://download.01.org/0day-ci/archive/20250815/202508151636.bBftpYLw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508151636.bBftpYLw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508151636.bBftpYLw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/mm/ibs.c:198:19: warning: shift count >= width of type [-Wshift-count-overflow]
     198 |         if (laddr & (1UL << 63)) {
         |                          ^  ~~
   arch/x86/mm/ibs.c:252:7: error: call to undeclared function 'setup_APIC_eilvt'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     252 |         if (!setup_APIC_eilvt(offset, 0, APIC_EILVT_MSG_NMI, 0))
         |              ^
   arch/x86/mm/ibs.c:252:7: note: did you mean 'setup_APIC_ibs'?
   arch/x86/mm/ibs.c:244:13: note: 'setup_APIC_ibs' declared here
     244 | static void setup_APIC_ibs(void)
         |             ^
     245 | {
     246 |         int offset;
     247 | 
     248 |         offset = get_ibs_lvt_offset();
     249 |         if (offset < 0)
     250 |                 goto failed;
     251 | 
     252 |         if (!setup_APIC_eilvt(offset, 0, APIC_EILVT_MSG_NMI, 0))
         |              ~~~~~~~~~~~~~~~~
         |              setup_APIC_ibs
   arch/x86/mm/ibs.c:265:3: error: call to undeclared function 'setup_APIC_eilvt'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     265 |                 setup_APIC_eilvt(offset, 0, APIC_EILVT_MSG_FIX, 1);
         |                 ^
   1 warning and 2 errors generated.


vim +198 arch/x86/mm/ibs.c

   100	
   101	/*
   102	 * IBS NMI handler: Process the memory access info reported by IBS.
   103	 *
   104	 * Reads the MSRs to collect all the information about the reported
   105	 * memory access, validates the access, stores the valid sample and
   106	 * schedules the work on this CPU to further process the sample.
   107	 */
   108	static int ibs_overflow_handler(unsigned int cmd, struct pt_regs *regs)
   109	{
   110		struct mm_struct *mm = current->mm;
   111		u64 ops_ctl, ops_data3, ops_data2;
   112		u64 laddr = -1, paddr = -1;
   113		u64 data_src, rmt_node;
   114		struct page *page;
   115		unsigned long pfn;
   116	
   117		rdmsrl(MSR_AMD64_IBSOPCTL, ops_ctl);
   118	
   119		/*
   120		 * When IBS sampling period is reprogrammed via read-modify-update
   121		 * of MSR_AMD64_IBSOPCTL, overflow NMIs could be generated with
   122		 * IBS_OP_ENABLE not set. For such cases, return as HANDLED.
   123		 *
   124		 * With this, the handler will say "handled" for all NMIs that
   125		 * aren't related to this NMI.  This stems from the limitation of
   126		 * having both status and control bits in one MSR.
   127		 */
   128		if (!(ops_ctl & IBS_OP_VAL))
   129			goto handled;
   130	
   131		wrmsrl(MSR_AMD64_IBSOPCTL, ops_ctl & ~IBS_OP_VAL);
   132	
   133		count_vm_event(HWHINT_NR_EVENTS);
   134	
   135		if (!user_mode(regs)) {
   136			count_vm_event(HWHINT_KERNEL);
   137			goto handled;
   138		}
   139	
   140		if (!mm) {
   141			count_vm_event(HWHINT_KTHREAD);
   142			goto handled;
   143		}
   144	
   145		rdmsrl(MSR_AMD64_IBSOPDATA3, ops_data3);
   146	
   147		/* Load/Store ops only */
   148		/* TODO: DataSrc isn't valid for stores, so filter out stores? */
   149		if (!(ops_data3 & (MSR_AMD64_IBSOPDATA3_LDOP |
   150				   MSR_AMD64_IBSOPDATA3_STOP))) {
   151			count_vm_event(HWHINT_NON_LOAD_STORES);
   152			goto handled;
   153		}
   154	
   155		/* Discard the sample if it was L1 or L2 hit */
   156		if (!(ops_data3 & (MSR_AMD64_IBSOPDATA3_DCMISS |
   157				   MSR_AMD64_IBSOPDATA3_L2MISS))) {
   158			count_vm_event(HWHINT_DC_L2_HITS);
   159			goto handled;
   160		}
   161	
   162		rdmsrl(MSR_AMD64_IBSOPDATA2, ops_data2);
   163		data_src = ops_data2 & MSR_AMD64_IBSOPDATA2_DATASRC;
   164		if (ibs_caps & IBS_CAPS_ZEN4)
   165			data_src |= ((ops_data2 & 0xC0) >> 3);
   166	
   167		switch (data_src) {
   168		case MSR_AMD64_IBSOPDATA2_DATASRC_LCL_CACHE:
   169			count_vm_event(HWHINT_LOCAL_L3L1L2);
   170			break;
   171		case MSR_AMD64_IBSOPDATA2_DATASRC_PEER_CACHE_NEAR:
   172			count_vm_event(HWHINT_LOCAL_PEER_CACHE_NEAR);
   173			break;
   174		case MSR_AMD64_IBSOPDATA2_DATASRC_DRAM:
   175			count_vm_event(HWHINT_DRAM_ACCESSES);
   176			break;
   177		case MSR_AMD64_IBSOPDATA2_DATASRC_EXT_MEM:
   178			count_vm_event(HWHINT_CXL_ACCESSES);
   179			break;
   180		case MSR_AMD64_IBSOPDATA2_DATASRC_FAR_CCX_CACHE:
   181			count_vm_event(HWHINT_FAR_CACHE_HITS);
   182			break;
   183		}
   184	
   185		rmt_node = ops_data2 & MSR_AMD64_IBSOPDATA2_RMTNODE;
   186		if (rmt_node)
   187			count_vm_event(HWHINT_REMOTE_NODE);
   188	
   189		/* Is linear addr valid? */
   190		if (ops_data3 & MSR_AMD64_IBSOPDATA3_LADDR_VALID)
   191			rdmsrl(MSR_AMD64_IBSDCLINAD, laddr);
   192		else {
   193			count_vm_event(HWHINT_LADDR_INVALID);
   194			goto handled;
   195		}
   196	
   197		/* Discard kernel address accesses */
 > 198		if (laddr & (1UL << 63)) {
   199			count_vm_event(HWHINT_KERNEL_ADDR);
   200			goto handled;
   201		}
   202	
   203		/* Is phys addr valid? */
   204		if (ops_data3 & MSR_AMD64_IBSOPDATA3_PADDR_VALID)
   205			rdmsrl(MSR_AMD64_IBSDCPHYSAD, paddr);
   206		else {
   207			count_vm_event(HWHINT_PADDR_INVALID);
   208			goto handled;
   209		}
   210	
   211		pfn = PHYS_PFN(paddr);
   212		page = pfn_to_online_page(pfn);
   213		if (!page)
   214			goto handled;
   215	
   216		if (!PageLRU(page)) {
   217			count_vm_event(HWHINT_NON_LRU);
   218			goto handled;
   219		}
   220	
   221		if (!ibs_push_sample(pfn, numa_node_id(), jiffies)) {
   222			count_vm_event(HWHINT_BUFFER_FULL);
   223			goto handled;
   224		}
   225	
   226		irq_work_queue(&ibs_irq_work);
   227		count_vm_event(HWHINT_USEFUL_SAMPLES);
   228	
   229	handled:
   230		return NMI_HANDLED;
   231	}
   232	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
