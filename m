Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E3A25A645;
	Mon,  9 Feb 2026 17:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770659272; cv=none; b=r6x1Xy87LQg7sxKZcLWk/aTXBbm2/oZjaBVR6/ewBHI1dT01Ze6L0spaAAy+UlwjQaVLd+JUND0NGbBtTwxiC0WcaXmiZyztCEFPt2JgLhmFFVu84SNStyuIYjztKWaQMrC/F82fAHaC+qROF8bxrIu9/OjCBx3frrlmfuVAUl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770659272; c=relaxed/simple;
	bh=T2Z2G1IPC7BiFlbWzeqD/jeFJVwXBLZDkZ8HK53zGik=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Tb3EiO/67F6jO8uTjqwNRrBXJ/L7jsJuahJms6w6zhsY3eyjcHu62gzRmC+4Yal3ib06sDgZAvdrhjma218yK0ozOXBC9ilmRpyIIupED1cpHwZ6s/N2WEnCQwyQynsOf1eWlyyja7J4zAchRJ1UjEdEyRDwUGZwMlJHatQ9IZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BKRMiOLM; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BKRMiOLM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770659272; x=1802195272;
  h=date:from:to:cc:subject:message-id;
  bh=T2Z2G1IPC7BiFlbWzeqD/jeFJVwXBLZDkZ8HK53zGik=;
  b=BKRMiOLMkR5CkSAJDPFmUASCI6/ByDTdhpO8CaEoULPCF5uxmjijr5KW
   MJIyQ6Qx9Ar2vGoATwlGwdnz+90sPjT4m/t3/ZNPiA40CldnJruJxdYPG
   s6BFoOTZ8aJNZ++b21TbViimtIIMHOwoGa5GbpdntQFV3K9OL7oIkvx6o
   /Brrl8bccAM6WyhPPPoDdd2TItGkVGb73mezkSwuHvH8Cwg4pzXTIYk7u
   nBGPStTFXX2xXA4YdqiLJoM2CAd2Ix4Xi8GL/Ndqo1+awr16sewG15rBR
   TLFCxo3FmdwPi2M38QGJivTHO4r5X/bt5bgFSGanL3Cgn541dcNSkzFE1
   g==;
X-CSE-ConnectionGUID: bj3muzGGSEmzdoKtt+c0fA==
X-CSE-MsgGUID: ovAcWrDESRK5ijkdPQd+rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="74376986"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="74376986"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 09:47:51 -0800
X-CSE-ConnectionGUID: Dq9a6OI8SpWnINTSB9J11A==
X-CSE-MsgGUID: VbGFEygNR+uy3YMcQ+z1Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="211251777"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Feb 2026 09:47:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpVMS-00000000oCF-2ZrN;
	Mon, 09 Feb 2026 17:47:48 +0000
Date: Tue, 10 Feb 2026 01:47:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_1 4/12]
 arch/arm64/net/bpf_jit_comp.c:2510:31: error: member reference type 'struct
 bpf_link *' is a pointer; did you mean to use '->'?
Message-ID: <202602100139.stfv6wKR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_1
head:   95bf1a3ff57efabf9b7c50b8a0d3583a6714f5d8
commit: 839b12f2dd3dd0be0a7321691ec25efca4132668 [4/12] bpf: Add struct bpf_tramp_node object
config: arm64-randconfig-001-20260209 (https://download.01.org/0day-ci/archive/20260210/202602100139.stfv6wKR-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100139.stfv6wKR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100139.stfv6wKR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/net/bpf_jit_comp.c:2510:31: error: member reference type 'struct bpf_link *' is a pointer; did you mean to use '->'?
    2510 |                 fentry_nodes->nodes[0]->link.type == BPF_LINK_TYPE_STRUCT_OPS;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
         |                                             ->
   1 error generated.


vim +2510 arch/arm64/net/bpf_jit_comp.c

  2506	
  2507	static bool is_struct_ops_tramp(const struct bpf_tramp_nodes *fentry_nodes)
  2508	{
  2509		return fentry_nodes->nr_nodes == 1 &&
> 2510			fentry_nodes->nodes[0]->link.type == BPF_LINK_TYPE_STRUCT_OPS;
  2511	}
  2512	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
