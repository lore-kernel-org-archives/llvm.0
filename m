Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC99130F932;
	Mon, 11 May 2026 22:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778539941; cv=none; b=h2ypAuU8jmQOIFEtLZ5YK/BvdsRUWZOUsO3GgpvRgNchAzjMCM3NMaX5AKMiWyT74b/vzDQCuLwQqowfekJNufbfC7F8dRo4T7Nszuznx3RFgiAYEyLtFYi4kH1KclV89VSNB5tPHVAWPHXSz86zsRs/IDwulOi1ls/sffMTJbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778539941; c=relaxed/simple;
	bh=nzenf9xQBriqxnpezC4WTv/G6yrSQj9GGyfE86ro94M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aJZugSjH0nxrFy7TWeGEosxff+sDZTda7oaVfBPTPyFbT0++/F+n/A9cnlOb7rxFVY9yTn+oev8qlqd0zrPevrM+/x7XhHLvKuPH1rrGOtj5ZDIhVdCecbhalCub9LDxaqOOp+30pXJsCJFTLrPra6+ZPPrptmbTqzXop6T5PeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cDG+77z2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cDG+77z2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778539939; x=1810075939;
  h=date:from:to:cc:subject:message-id;
  bh=nzenf9xQBriqxnpezC4WTv/G6yrSQj9GGyfE86ro94M=;
  b=cDG+77z2lvywRryRlGOpRXDHK217nApoLJGUCq5dJIms+MvWsuJY7d31
   4vftlCXzcrknK1ZuLKBM0TJZxjY7u3h8mWvT5sTfJyeFpOfqEjuFQo0FU
   IqUqt7oglvciFeShMSK2wf8tquhiVSwENnBsadbhXXEUIgOLmUrsSRNlc
   2pG+NiUdH5gsATo1wqe0X/31Vkfe6+CF5DrGjRQzNGM5NVuMJVohc98hp
   2NMBtbcPWU/PrD6nauhmjP0WaCmYFAehJkaNRYcWYtPoTTCO0vG9l2a6q
   ebmFLhvtqLzP3VxKuwFmX8ua3+jkl5zY0fvsimcU0s9szWUiZBVjgYYUE
   g==;
X-CSE-ConnectionGUID: Am3gJs6dRkGoV/5lGd0ksA==
X-CSE-MsgGUID: 3UkkXZGwSUye2aYxIUHwiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="82003284"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="82003284"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 15:52:16 -0700
X-CSE-ConnectionGUID: bTRmn63+TFyH6V37RVX5Og==
X-CSE-MsgGUID: tOafFbXiQUi70ExpVMvs0g==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 11 May 2026 15:52:15 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMZTw-0000000084J-47Yb;
	Mon, 11 May 2026 22:52:12 +0000
Date: Tue, 12 May 2026 00:51:18 +0200
From: kernel test robot <lkp@intel.com>
To: Vernon Yang <yanglincheng@kylinos.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: kernel/bpf/helpers.c:2833:28: error: call to undeclared
 function 'cgroup_psi'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202605120005.IWDpu87d-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Vernon-Yang/psi-add-psi_group_flush_stats-function/20260511-160117
head:   935bf63d5c33c8fc0d26f2092de20e4720f4b2ae
commit: 46f204179b5fd01c11fa4999b7a94beccfe84ea4 bpf: add bpf_cgroup_{flush_stats,stall} function
date:   15 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260512/202605120005.IWDpu87d-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605120005.IWDpu87d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605120005.IWDpu87d-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/helpers.c:2831:14: warning: declaration of 'enum psi_states' will not be visible outside of this function [-Wvisibility]
    2831 |                                            enum psi_states states)
         |                                                 ^
   kernel/bpf/helpers.c:2831:25: error: variable has incomplete type 'enum psi_states'
    2831 |                                            enum psi_states states)
         |                                                            ^
   kernel/bpf/helpers.c:2831:14: note: forward declaration of 'enum psi_states'
    2831 |                                            enum psi_states states)
         |                                                 ^
>> kernel/bpf/helpers.c:2833:28: error: call to undeclared function 'cgroup_psi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2833 |         struct psi_group *group = cgroup_psi(cgrp);
         |                                   ^
>> kernel/bpf/helpers.c:2833:20: error: incompatible integer to pointer conversion initializing 'struct psi_group *' with an expression of type 'int' [-Wint-conversion]
    2833 |         struct psi_group *group = cgroup_psi(cgrp);
         |                           ^       ~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2835:24: error: no member named 'total' in 'struct psi_group'
    2835 |         return div_u64(group->total[PSI_AVGS][states], NSEC_PER_MSEC);
         |                        ~~~~~  ^
   kernel/bpf/helpers.c:2835:30: error: use of undeclared identifier 'PSI_AVGS'
    2835 |         return div_u64(group->total[PSI_AVGS][states], NSEC_PER_MSEC);
         |                                     ^
   kernel/bpf/helpers.c:2844:28: error: call to undeclared function 'cgroup_psi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2844 |         struct psi_group *group = cgroup_psi(cgrp);
         |                                   ^
   kernel/bpf/helpers.c:2844:20: error: incompatible integer to pointer conversion initializing 'struct psi_group *' with an expression of type 'int' [-Wint-conversion]
    2844 |         struct psi_group *group = cgroup_psi(cgrp);
         |                           ^       ~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2846:2: error: call to undeclared function 'psi_group_flush_stats'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2846 |         psi_group_flush_stats(group);
         |         ^
   1 warning and 8 errors generated.


vim +/cgroup_psi +2833 kernel/bpf/helpers.c

  2822	
  2823	/**
  2824	 * bpf_cgroup_stall - acquire the total stall time of cgroup
  2825	 * @cgrp: cgroup struct
  2826	 * @states: psi states
  2827	 *
  2828	 * Return the total stall time.
  2829	 */
  2830	__bpf_kfunc unsigned long bpf_cgroup_stall(struct cgroup *cgrp,
  2831						   enum psi_states states)
  2832	{
> 2833		struct psi_group *group = cgroup_psi(cgrp);
  2834	
  2835		return div_u64(group->total[PSI_AVGS][states], NSEC_PER_MSEC);
  2836	}
  2837	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
