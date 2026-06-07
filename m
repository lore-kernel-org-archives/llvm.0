Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71F0305660;
	Sun,  7 Jun 2026 04:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780805690; cv=none; b=C/eJ0Pt+eNxxR8CtcojzM9AXx0kIroQej3MRzk2pFJCE1owFxBdX7wqWQW6xKSnz8LOEfkF+bOdq6Lw8/j1eNORy76w6UBDD2c1zV/3wD8C36Vfh4vhmVgQvgoTiiWn3DfRWjMTVn0lMM/FCqq8PLY7k87/5cuO9/2g+1syLx/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780805690; c=relaxed/simple;
	bh=TrzSvT+ngAMJEwk59dBQhY13hnp9mu6PtQ4OLbq5/dg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z6kniD0DvJcY/xBguSSAPIOx0yBCGXuSn0fOdoikqXibDCRMqXhFlZ5oRoXoy8CnWP6nCuUChaF/YJjG0qGyIl6djgSTYCdQjDYqTqjSAlHyklpRLzkKPsd1P6l9Cx/t3RDf2qXGFl8+RmovjSQizAQSKblgLbpGeQcU6i9xG1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CpcUq3Dp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CpcUq3Dp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780805687; x=1812341687;
  h=date:from:to:cc:subject:message-id;
  bh=TrzSvT+ngAMJEwk59dBQhY13hnp9mu6PtQ4OLbq5/dg=;
  b=CpcUq3DpOW6hgtoEtafJnCzHVhzhpGrforGGiv4nALRyos2BAF/wc2mA
   TY9CL/OniD7UzfcNQ1uVmXBrMVYGrMNXJO1l+bOzdLXY5DA0577JcLYf0
   H/HpZoqj88eoLlD52+LvQUFR7chv7MwsDZlSpPv2gLXT7BX4O+vSNygM5
   iQSnY85gvzewFmxp6OM3I/MiUW/15YbtnkiMP9PqOxIGnzz3u5KsMAcPb
   iEPQ2tqDvJCJQrjMdkWmFz7LclEOsC+3bAed5953hw53FgDDK/EVRB6YF
   XvuuznFmwbmMTzkSGolyY3KrWE4xoSHijG9LWOCaBRcVGNhswq5lSV9rH
   w==;
X-CSE-ConnectionGUID: C97ULDb2R4Kz0phPlWuV0g==
X-CSE-MsgGUID: sB+vUv4MRXagjPvD1u64mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11809"; a="84158098"
X-IronPort-AV: E=Sophos;i="6.24,192,1774335600"; 
   d="scan'208";a="84158098"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2026 21:14:47 -0700
X-CSE-ConnectionGUID: uqrOvORlSA6/Vlvf1H60Gw==
X-CSE-MsgGUID: HHBh8KzlRDm0Fol4Gba2PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,192,1774335600"; 
   d="scan'208";a="250306875"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 06 Jun 2026 21:14:45 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wW4uJ-000000002zZ-0ZXo;
	Sun, 07 Jun 2026 04:14:43 +0000
Date: Sun, 07 Jun 2026 06:14:27 +0200
From: kernel test robot <lkp@intel.com>
To: Potnuri Bharat Teja <bharat@chelsio.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:2893:42:
 warning: variable 'total_size' set but not used
Message-ID: <202606070623.kN2tenPu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Potnuri-Bharat-Teja/cxgb4-Add-T7-register-definitions-and-core-structures/20260607-024352
head:   44456817300ae710d21eb9fa69f7753c96635ad5
commit: 757b35cc29e83ee8788a54a668be655f22a6fc4c cxgb4: Move PCI initialization logic to cxgb4_pci.c
date:   9 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260607/202606070623.kN2tenPu-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260607/202606070623.kN2tenPu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606070623.kN2tenPu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:2893:42: warning: variable 'total_size' set but not used [-Wunused-but-set-variable]
    2893 |         u32 j, size, max_ctx_size, max_ctx_qid, total_size = 0;
         |                                                 ^
   1 warning generated.


vim +/total_size +2893 drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c

736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2884  
9e5c598c720792 Rahul Lakkireddy    2017-11-11  2885  int cudbg_collect_dump_context(struct cudbg_init *pdbg_init,
9e5c598c720792 Rahul Lakkireddy    2017-11-11  2886  			       struct cudbg_buffer *dbg_buff,
9e5c598c720792 Rahul Lakkireddy    2017-11-11  2887  			       struct cudbg_error *cudbg_err)
9e5c598c720792 Rahul Lakkireddy    2017-11-11  2888  {
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2889  	struct cudbg_region_info region_info[CTXT_CNM + 1] = { {0} };
9e5c598c720792 Rahul Lakkireddy    2017-11-11  2890  	struct adapter *padap = pdbg_init->adap;
4fca07249158b9 Potnuri Bharat Teja 2026-06-06  2891  	struct struct_sge_ctxt_rev1 *ctxt_buff;
4fca07249158b9 Potnuri Bharat Teja 2026-06-06  2892  	struct struct_sge_ctxt_rev1_data *buff;
4fca07249158b9 Potnuri Bharat Teja 2026-06-06 @2893  	u32 j, size, max_ctx_size, max_ctx_qid, total_size = 0;
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2894  	u8 mem_type[CTXT_INGRESS + 1] = { 0 };
9e5c598c720792 Rahul Lakkireddy    2017-11-11  2895  	struct cudbg_buffer temp_buff = { 0 };
4fca07249158b9 Potnuri Bharat Teja 2026-06-06  2896  	u8 i, k, sge_ctxt_size;
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2897  	u8 *ctx_buf;
9e5c598c720792 Rahul Lakkireddy    2017-11-11  2898  	int rc;
9e5c598c720792 Rahul Lakkireddy    2017-11-11  2899  
4fca07249158b9 Potnuri Bharat Teja 2026-06-06  2900  	if (CHELSIO_CHIP_VERSION(padap->params.chip) >= CHELSIO_T7)
4fca07249158b9 Potnuri Bharat Teja 2026-06-06  2901  		sge_ctxt_size = SGE_CTXT_SIZE_T7;
4fca07249158b9 Potnuri Bharat Teja 2026-06-06  2902  	else
4fca07249158b9 Potnuri Bharat Teja 2026-06-06  2903  		sge_ctxt_size = SGE_CTXT_SIZE;
4fca07249158b9 Potnuri Bharat Teja 2026-06-06  2904  
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2905  	/* Get max valid qid for each type of queue */
4fca07249158b9 Potnuri Bharat Teja 2026-06-06  2906  	rc = cudbg_get_ctxt_region_info(padap, sge_ctxt_size, region_info, mem_type);
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2907  	if (rc)
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2908  		return rc;
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2909  
4fca07249158b9 Potnuri Bharat Teja 2026-06-06  2910  	rc = cudbg_dump_context_size(padap, sge_ctxt_size);
9e5c598c720792 Rahul Lakkireddy    2017-11-11  2911  	if (rc <= 0)
9e5c598c720792 Rahul Lakkireddy    2017-11-11  2912  		return CUDBG_STATUS_ENTITY_NOT_FOUND;
9e5c598c720792 Rahul Lakkireddy    2017-11-11  2913  
9e5c598c720792 Rahul Lakkireddy    2017-11-11  2914  	size = rc;
4fca07249158b9 Potnuri Bharat Teja 2026-06-06  2915  	rc = get_scratch_buff(dbg_buff, size + sizeof(*ctxt_buff), &temp_buff);
9e5c598c720792 Rahul Lakkireddy    2017-11-11  2916  	if (rc)
9e5c598c720792 Rahul Lakkireddy    2017-11-11  2917  		return rc;
4fca07249158b9 Potnuri Bharat Teja 2026-06-06  2918  	ctxt_buff = (void *)temp_buff.data;
4fca07249158b9 Potnuri Bharat Teja 2026-06-06  2919  	ctxt_buff->ver_hdr.signature = CUDBG_ENTITY_SIGNATURE;
4fca07249158b9 Potnuri Bharat Teja 2026-06-06  2920  	ctxt_buff->ver_hdr.revision = CUDBG_SGE_CTXT_REV;
4fca07249158b9 Potnuri Bharat Teja 2026-06-06  2921  	ctxt_buff->ver_hdr.size = sizeof(*ctxt_buff) -
4fca07249158b9 Potnuri Bharat Teja 2026-06-06  2922  		sizeof(struct cudbg_ver_hdr);
4fca07249158b9 Potnuri Bharat Teja 2026-06-06  2923  	ctxt_buff->nentries = 0;
4fca07249158b9 Potnuri Bharat Teja 2026-06-06  2924  	total_size = sizeof(*ctxt_buff);
9e5c598c720792 Rahul Lakkireddy    2017-11-11  2925  
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2926  	/* Get buffer with enough space to read the biggest context
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2927  	 * region in memory.
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2928  	 */
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2929  	max_ctx_size = max(region_info[CTXT_EGRESS].end -
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2930  			   region_info[CTXT_EGRESS].start + 1,
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2931  			   region_info[CTXT_INGRESS].end -
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2932  			   region_info[CTXT_INGRESS].start + 1);
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2933  
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2934  	ctx_buf = kvzalloc(max_ctx_size, GFP_KERNEL);
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2935  	if (!ctx_buf) {
56cf2635ce30fe Rahul Lakkireddy    2018-01-17  2936  		cudbg_put_buff(pdbg_init, &temp_buff);
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2937  		return -ENOMEM;
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2938  	}
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2939  
4fca07249158b9 Potnuri Bharat Teja 2026-06-06  2940  	buff = (void *)ctxt_buff->data;
9e5c598c720792 Rahul Lakkireddy    2017-11-11  2941  
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2942  	/* Collect EGRESS and INGRESS context data.
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2943  	 * In case of failures, fallback to collecting via FW or
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2944  	 * backdoor access.
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2945  	 */
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2946  	for (i = CTXT_EGRESS; i <= CTXT_INGRESS; i++) {
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2947  		if (!region_info[i].exist) {
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2948  			max_ctx_qid = CUDBG_LOWMEM_MAX_CTXT_QIDS;
4fca07249158b9 Potnuri Bharat Teja 2026-06-06  2949  			cudbg_get_sge_ctxt_fw(pdbg_init, sge_ctxt_size, max_ctx_qid, i,
4fca07249158b9 Potnuri Bharat Teja 2026-06-06  2950  					      ctxt_buff, &buff);
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2951  			continue;
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2952  		}
9e5c598c720792 Rahul Lakkireddy    2017-11-11  2953  
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2954  		max_ctx_size = region_info[i].end - region_info[i].start + 1;
4fca07249158b9 Potnuri Bharat Teja 2026-06-06  2955  		max_ctx_qid = max_ctx_size / sge_ctxt_size;
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2956  
770ca3477a5baf Rahul Lakkireddy    2018-01-26  2957  		/* If firmware is not attached/alive, use backdoor register
770ca3477a5baf Rahul Lakkireddy    2018-01-26  2958  		 * access to collect dump.
770ca3477a5baf Rahul Lakkireddy    2018-01-26  2959  		 */
770ca3477a5baf Rahul Lakkireddy    2018-01-26  2960  		if (is_fw_attached(pdbg_init)) {
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2961  			t4_sge_ctxt_flush(padap, padap->mbox, i);
770ca3477a5baf Rahul Lakkireddy    2018-01-26  2962  
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2963  			rc = t4_memory_rw(padap, MEMWIN_NIC, mem_type[i],
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2964  					  region_info[i].start, max_ctx_size,
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2965  					  (__be32 *)ctx_buf, 1);
770ca3477a5baf Rahul Lakkireddy    2018-01-26  2966  		}
770ca3477a5baf Rahul Lakkireddy    2018-01-26  2967  
770ca3477a5baf Rahul Lakkireddy    2018-01-26  2968  		if (rc || !is_fw_attached(pdbg_init)) {
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2969  			max_ctx_qid = CUDBG_LOWMEM_MAX_CTXT_QIDS;
4fca07249158b9 Potnuri Bharat Teja 2026-06-06  2970  			cudbg_get_sge_ctxt_fw(pdbg_init, sge_ctxt_size, max_ctx_qid, i,
4fca07249158b9 Potnuri Bharat Teja 2026-06-06  2971  					      ctxt_buff, &buff);
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2972  			continue;
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2973  		}
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2974  
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2975  		for (j = 0; j < max_ctx_qid; j++) {
1992ded5d11199 Rahul Lakkireddy    2020-06-24  2976  			__be64 *dst_off;
1992ded5d11199 Rahul Lakkireddy    2020-06-24  2977  			u64 *src_off;
1992ded5d11199 Rahul Lakkireddy    2020-06-24  2978  
4fca07249158b9 Potnuri Bharat Teja 2026-06-06  2979  			src_off = (u64 *)(ctx_buf + j * sge_ctxt_size);
1992ded5d11199 Rahul Lakkireddy    2020-06-24  2980  			dst_off = (__be64 *)buff->data;
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2981  
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2982  			/* The data is stored in 64-bit cpu order.  Convert it
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2983  			 * to big endian before parsing.
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2984  			 */
4fca07249158b9 Potnuri Bharat Teja 2026-06-06  2985  			for (k = 0; k < sge_ctxt_size / sizeof(u64); k++)
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2986  				dst_off[k] = cpu_to_be64(src_off[k]);
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2987  
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2988  			rc = cudbg_sge_ctxt_check_valid(buff->data, i);
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2989  			if (!rc)
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2990  				continue;
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2991  
4fca07249158b9 Potnuri Bharat Teja 2026-06-06  2992  			buff->ctxt_type = i;
4fca07249158b9 Potnuri Bharat Teja 2026-06-06  2993  			buff->ctxt_id = j;
4fca07249158b9 Potnuri Bharat Teja 2026-06-06  2994  			buff->size = sge_ctxt_size;
4fca07249158b9 Potnuri Bharat Teja 2026-06-06  2995  			total_size += sizeof(*buff);
4fca07249158b9 Potnuri Bharat Teja 2026-06-06  2996  			ctxt_buff->nentries++;
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2997  			buff++;
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  2998  		}
9e5c598c720792 Rahul Lakkireddy    2017-11-11  2999  	}
9e5c598c720792 Rahul Lakkireddy    2017-11-11  3000  
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  3001  	kvfree(ctx_buf);
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  3002  
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  3003  	/* Collect FREELIST and CONGESTION MANAGER contexts */
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  3004  	max_ctx_size = region_info[CTXT_FLM].end -
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  3005  		       region_info[CTXT_FLM].start + 1;
4fca07249158b9 Potnuri Bharat Teja 2026-06-06  3006  	max_ctx_qid = max_ctx_size / sge_ctxt_size;
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  3007  	/* Since FLM and CONM are 1-to-1 mapped, the below function
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  3008  	 * will fetch both FLM and CONM contexts.
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  3009  	 */
4fca07249158b9 Potnuri Bharat Teja 2026-06-06  3010  	cudbg_get_sge_ctxt_fw(pdbg_init, sge_ctxt_size, max_ctx_qid, CTXT_FLM, ctxt_buff, &buff);
736c3b94474eb3 Rahul Lakkireddy    2017-12-08  3011  
56cf2635ce30fe Rahul Lakkireddy    2018-01-17  3012  	return cudbg_write_and_release_buff(pdbg_init, &temp_buff, dbg_buff);
9e5c598c720792 Rahul Lakkireddy    2017-11-11  3013  }
9e5c598c720792 Rahul Lakkireddy    2017-11-11  3014  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
