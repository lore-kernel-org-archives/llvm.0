Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7892B8821;
	Sun,  5 Jan 2025 02:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736045638; cv=none; b=iD25vMAf2FLYt1teftCEAnNxRtld37UpuC+SJxGxXU5N3zpxzA/tP844vg3meyYwl5If/WWht++GnDcq3IjMHY01JkeffXOxRsbhswrskX62K9lh+gu6Fwg3xXqLk0AHIB6MAXZG/Ve2dhnWa1rbAAa8mo6ZoGokUxx3CoWokfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736045638; c=relaxed/simple;
	bh=rY/aPCU1+vTru7w2Gb1RhVYhXvSRZj/O3GNHrH/M8i0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tH55275cjmKrA2YTeUn6weD1mY/ZemyEzSjR/uQu9rlTD+BP2U7pvJz/WWFn9IXn5V+XDIWzdZXKHkgFB9zAmK/2cZdvzoMhAbHJ5bIql/TA6h8BQJ9K0HxyTahqdmj0bEPcc/4Wh2kkEayy5vKRrxC4mJxzzkQEOXtp1nYBhrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K+1Eba8D; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K+1Eba8D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736045637; x=1767581637;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rY/aPCU1+vTru7w2Gb1RhVYhXvSRZj/O3GNHrH/M8i0=;
  b=K+1Eba8DnmZIqtc3kDtBYginLR/XWbVNVoSr13BEPvOI+BGeYcDMsLQg
   TbMEvZK3C2BBElTre6eXchkxU2utU0s/UtIP0Uuum79f/9h3bMurBZlJy
   cjo7IfZkosz+zoPxiUMd2xXj+GLUKeQYfsHStb8UlfpdLRpltFlQRVwb0
   W6hZzm02UrRe8+2z6zTCxq0ZISbYn8HHLKfNhv78N7QYmMZTaSdhyHCQy
   MpSLlblVrTpCQaKJ57D5/ezAkFDbFm/q5EUT9V3JaD9TB1ox3yp4b/kdH
   SGRCuXan8z2JPXc/Iqr7vWWjdyNrOECPj8XE6h//BcV91QGpMYDRLLaqV
   Q==;
X-CSE-ConnectionGUID: mcdLpIY7RQOyBSqQfldfWw==
X-CSE-MsgGUID: HUkOqACgT3y6vqx6OIUcGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="46812850"
X-IronPort-AV: E=Sophos;i="6.12,289,1728975600"; 
   d="scan'208";a="46812850"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 18:53:56 -0800
X-CSE-ConnectionGUID: 0J8AoNZhQaSHL9cN7stF3w==
X-CSE-MsgGUID: IbGw47S0Qm60FO2YXIaEOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="139441945"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Jan 2025 18:53:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUGly-000BPn-2s;
	Sun, 05 Jan 2025 02:53:50 +0000
Date: Sun, 5 Jan 2025 10:53:24 +0800
From: kernel test robot <lkp@intel.com>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
	hbabu@us.ibm.com, haren@linux.ibm.com
Subject: Re: [PATCH 1/6] powerpc/pseries: Define common functions for RTAS
 sequence HCALLs
Message-ID: <202501051055.oZDoR4fH-lkp@intel.com>
References: <20250104204652.388720-2-haren@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250104204652.388720-2-haren@linux.ibm.com>

Hi Haren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haren-Myneni/powerpc-pseries-Define-common-functions-for-RTAS-sequence-HCALLs/20250105-045010
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250104204652.388720-2-haren%40linux.ibm.com
patch subject: [PATCH 1/6] powerpc/pseries: Define common functions for RTAS sequence HCALLs
config: powerpc64-randconfig-002-20250105 (https://download.01.org/0day-ci/archive/20250105/202501051055.oZDoR4fH-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250105/202501051055.oZDoR4fH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501051055.oZDoR4fH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/platforms/pseries/papr-vpd.c:141: warning: Function parameter or struct member 'param' not described in 'vpd_sequence_begin'
>> arch/powerpc/platforms/pseries/papr-vpd.c:141: warning: Excess function parameter 'loc_code' description in 'vpd_sequence_begin'


vim +141 arch/powerpc/platforms/pseries/papr-vpd.c

514f6ff4369a30 Nathan Lynch 2023-12-12  121  
514f6ff4369a30 Nathan Lynch 2023-12-12  122  /*
514f6ff4369a30 Nathan Lynch 2023-12-12  123   * Internal VPD sequence APIs. A VPD sequence is a series of calls to
514f6ff4369a30 Nathan Lynch 2023-12-12  124   * ibm,get-vpd for a given location code. The sequence ends when an
514f6ff4369a30 Nathan Lynch 2023-12-12  125   * error is encountered or all VPD for the location code has been
514f6ff4369a30 Nathan Lynch 2023-12-12  126   * returned.
514f6ff4369a30 Nathan Lynch 2023-12-12  127   */
514f6ff4369a30 Nathan Lynch 2023-12-12  128  
514f6ff4369a30 Nathan Lynch 2023-12-12  129  /**
514f6ff4369a30 Nathan Lynch 2023-12-12  130   * vpd_sequence_begin() - Begin a VPD retrieval sequence.
514f6ff4369a30 Nathan Lynch 2023-12-12  131   * @seq:      Uninitialized sequence state.
514f6ff4369a30 Nathan Lynch 2023-12-12  132   * @loc_code: Location code that defines the scope of the VPD to return.
514f6ff4369a30 Nathan Lynch 2023-12-12  133   *
514f6ff4369a30 Nathan Lynch 2023-12-12  134   * Initializes @seq with the resources necessary to carry out a VPD
514f6ff4369a30 Nathan Lynch 2023-12-12  135   * sequence. Callers must pass @seq to vpd_sequence_end() regardless
514f6ff4369a30 Nathan Lynch 2023-12-12  136   * of whether the sequence succeeds.
514f6ff4369a30 Nathan Lynch 2023-12-12  137   *
514f6ff4369a30 Nathan Lynch 2023-12-12  138   * Context: May sleep.
514f6ff4369a30 Nathan Lynch 2023-12-12  139   */
5d8b0014124124 Haren Myneni 2025-01-04  140  static void vpd_sequence_begin(struct papr_rtas_sequence *seq, void *param)
514f6ff4369a30 Nathan Lynch 2023-12-12 @141  {
5d8b0014124124 Haren Myneni 2025-01-04  142  	struct rtas_ibm_get_vpd_params *vpd_params;
514f6ff4369a30 Nathan Lynch 2023-12-12  143  	/*
514f6ff4369a30 Nathan Lynch 2023-12-12  144  	 * Use a static data structure for the location code passed to
514f6ff4369a30 Nathan Lynch 2023-12-12  145  	 * RTAS to ensure it's in the RMA and avoid a separate work
514f6ff4369a30 Nathan Lynch 2023-12-12  146  	 * area allocation. Guarded by the function lock.
514f6ff4369a30 Nathan Lynch 2023-12-12  147  	 */
514f6ff4369a30 Nathan Lynch 2023-12-12  148  	static struct papr_location_code static_loc_code;
514f6ff4369a30 Nathan Lynch 2023-12-12  149  
514f6ff4369a30 Nathan Lynch 2023-12-12  150  	/*
514f6ff4369a30 Nathan Lynch 2023-12-12  151  	 * We could allocate the work area before acquiring the
514f6ff4369a30 Nathan Lynch 2023-12-12  152  	 * function lock, but that would allow concurrent requests to
514f6ff4369a30 Nathan Lynch 2023-12-12  153  	 * exhaust the limited work area pool for no benefit. So
514f6ff4369a30 Nathan Lynch 2023-12-12  154  	 * allocate the work area under the lock.
514f6ff4369a30 Nathan Lynch 2023-12-12  155  	 */
514f6ff4369a30 Nathan Lynch 2023-12-12  156  	mutex_lock(&rtas_ibm_get_vpd_lock);
5d8b0014124124 Haren Myneni 2025-01-04  157  	static_loc_code = *(struct papr_location_code *)param;
5d8b0014124124 Haren Myneni 2025-01-04  158  	vpd_params =  (struct rtas_ibm_get_vpd_params *)seq->params;
5d8b0014124124 Haren Myneni 2025-01-04  159  	vpd_params->work_area = rtas_work_area_alloc(SZ_4K);
5d8b0014124124 Haren Myneni 2025-01-04  160  	vpd_params->loc_code = &static_loc_code;
5d8b0014124124 Haren Myneni 2025-01-04  161  	vpd_params->sequence = 1;
5d8b0014124124 Haren Myneni 2025-01-04  162  	vpd_params->status = 0;
514f6ff4369a30 Nathan Lynch 2023-12-12  163  }
514f6ff4369a30 Nathan Lynch 2023-12-12  164  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
