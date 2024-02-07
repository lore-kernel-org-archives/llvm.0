Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D279B77F0E;
	Wed,  7 Feb 2024 15:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707320403; cv=none; b=YDrBo9cTJZdynW8aRs/qK2rIVJbzzitKwRPjSTjtq4nzV98hpYdRocx0ufL5fPJ+b5grHDce8p8pGkg+ktmbf/gN+1hVbJ1eWS1k/mxLr6I7RJrlcrP21xvxMU1q/u3bMqR2vlSHokgg8sCylDiNDnkA4UGCTDXf59pD58r1xlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707320403; c=relaxed/simple;
	bh=hsSn8krijksYdVdJnRB4OQuEj9nkDlOneCTs/9iDsaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WRWg75Z91QJyyYfivm52JkQWhA4vwC2ICP8uOkc9cmXbIMh4c4C0b/iWMBgpZzkbhILDMV1v7bsR9T5UiSeqVVEmzpmEuTC8D45ZedztNzQ662mWoCxu1RB/Y8/kDDASoplt/ekLLM86Qj4laM03nExY2DwUkfBjA2Keogaferc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mNg2audZ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mNg2audZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707320401; x=1738856401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hsSn8krijksYdVdJnRB4OQuEj9nkDlOneCTs/9iDsaQ=;
  b=mNg2audZAOEtQMBAQWyICOe0IC984Lat6p4GdNRH+wOAdb7Np2asZ/0x
   Pa03+5YQxok/IJzcXWeL5LOJQpl7y9PVMA2t1J6xkd/J9EdMUaBQODmYt
   geObgoFanja62jsT44BpZkiMEw3Meo45y3Ax6JIDv/gX80uT+X60KfxEF
   kNwfpQCjnHr6DWfR6HJkkLJhRuqe1JofthOjWBMrVZNNZvgWhjiDY/N+O
   hmyxeRn4s0+y3r00oZ4GkC218cMkomeF3t108yDXibPRViPNowg+XnAb8
   XTY/etkJEzBVaQpZe4gUc3YT6y3narAivd107qfaiDDmgyhHdHa5Q/uUH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="893089"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="893089"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 07:40:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="910024572"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="910024572"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2024 07:39:59 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXk1l-0002km-1L;
	Wed, 07 Feb 2024 15:39:57 +0000
Date: Wed, 7 Feb 2024 23:39:29 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chenyi Qiang <chenyi.qiang@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 66/376]
 arch/x86/kvm/vmx/main.c:83:17: error: no member named 'flush_remote_tlbs' in
 'struct kvm_x86_ops'
Message-ID: <202402072345.dCvXtwP8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   e7a7b1f2a1c28403511e71538d30888c9e1425ef
commit: 154dd2ab6afc31785ec68ff099e8c54618a0e49c [66/376] KVM: TDX: TDP MMU TDX support
config: i386-randconfig-002-20240207 (https://download.01.org/0day-ci/archive/20240207/202402072345.dCvXtwP8-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240207/202402072345.dCvXtwP8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402072345.dCvXtwP8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/vmx/main.c:83:17: error: no member named 'flush_remote_tlbs' in 'struct kvm_x86_ops'
      83 |         if (vt_x86_ops.flush_remote_tlbs ||
         |             ~~~~~~~~~~ ^
>> arch/x86/kvm/vmx/main.c:84:17: error: no member named 'flush_remote_tlbs_range' in 'struct kvm_x86_ops'
      84 |             vt_x86_ops.flush_remote_tlbs_range) {
         |             ~~~~~~~~~~ ^
   arch/x86/kvm/vmx/main.c:92:14: error: no member named 'flush_remote_tlbs' in 'struct kvm_x86_ops'
      92 |                 vt_x86_ops.flush_remote_tlbs = vt_flush_remote_tlbs;
         |                 ~~~~~~~~~~ ^
   3 errors generated.


vim +83 arch/x86/kvm/vmx/main.c

    50	
    51	static __init int vt_hardware_setup(void)
    52	{
    53		int ret;
    54	
    55		ret = vmx_hardware_setup();
    56		if (ret)
    57			return ret;
    58	
    59		/*
    60		 * As kvm_mmu_set_ept_masks() updates enable_mmio_caching, call it
    61		 * before checking enable_mmio_caching.
    62		 */
    63		if (enable_ept)
    64			kvm_mmu_set_ept_masks(enable_ept_ad_bits,
    65					      cpu_has_vmx_ept_execute_only());
    66		/* TDX requires KVM TDP MMU. */
    67		if (enable_tdx && !tdp_enabled) {
    68			enable_tdx = false;
    69			pr_warn_ratelimited("TDX requires TDP MMU.  Please enable TDP MMU for TDX.\n");
    70		}
    71	
    72		/* TDX requires MMIO caching. */
    73		if (enable_tdx && !enable_mmio_caching) {
    74			enable_tdx = false;
    75			pr_warn_ratelimited("TDX requires mmio caching.  Please enable mmio caching for TDX.\n");
    76		}
    77	
    78		/*
    79		 * TDX KVM overrides flush_remote_tlbs method and assumes
    80		 * flush_remote_tlbs_range = NULL that falls back to
    81		 * flush_remote_tlbs.  Disable TDX if there are conflicts.
    82		 */
  > 83		if (vt_x86_ops.flush_remote_tlbs ||
  > 84		    vt_x86_ops.flush_remote_tlbs_range) {
    85			enable_tdx = false;
    86			pr_warn_ratelimited("TDX requires baremetal. Not Supported on VMM guest.\n");
    87		}
    88	
    89		enable_tdx = enable_tdx && !tdx_hardware_setup(&vt_x86_ops);
    90	
    91		if (enable_tdx)
    92			vt_x86_ops.flush_remote_tlbs = vt_flush_remote_tlbs;
    93	
    94		return 0;
    95	}
    96	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
