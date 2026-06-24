Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A511A262A;
	Wed, 24 Jun 2026 21:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782337704; cv=none; b=uDYJy4VbyOxzHJADyfU04zHU+8Z4p2eSPSw443kh0340YfZwnP39wxvTOSnLg3YPjBFRnTyEkV8VfFi0Tr7s5BscaVVcUMrFZzdpXUbd+8ZPQ3qNrrCzW1VWs+gBIS9CmPwe/LjaeDzVAITyBUUx9XIlvcPdILjFbE330Jd+mpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782337704; c=relaxed/simple;
	bh=J7tTuSQRC3HfbocAhNqi/eYeoUHCjQPzdj981PhH6FU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HLLZW4M2Q13Jo7Ec8tsf7XTTbHj87/WqoFn/w+nrGRpc36Jl+KJGntAGgZKxQ9BXCtrSlBj96+JndVYxIU3zPcZdKGv1+kVztS+cx++gDxQzvQgJYiYGQr6w5BSQOynrJC3Ru0r4wGVy3nWPtkHkP43iFkdkzf0eRuvD0ornptY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iZAp5Ue4; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZAp5Ue4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782337703; x=1813873703;
  h=date:from:to:cc:subject:message-id;
  bh=J7tTuSQRC3HfbocAhNqi/eYeoUHCjQPzdj981PhH6FU=;
  b=iZAp5Ue4SN1GSfM+LFT8WUmYYfwY8NHhUtz/dk5L0IgboZXGMejZzYjw
   48UEbpFAUFUkCV7RYy5t5q04m/sCua2gN4vxbU0Rp/4xHdX5FnAKU7VUP
   6iplpGsD4sv5UZ8Xsppris6iWlQY6nSpCT4y7OnCAFZoT+KGpyXcRzGOs
   AFmSo3nC6LKUG4GrW77I8tgZCDnZLFp+a34xP9VaO4Ix+9vK//QBzy+Tp
   R7OMkxpiPZEtnfwmjQ6bJw66kYughkAU2TjhaVUS2prLv21jGfsdN6/yb
   UGcP6F6pASUPyHM9ylsrX2du5S68lv6bwtrhveLfaYO6wRKAoIzwbxDyT
   Q==;
X-CSE-ConnectionGUID: jxOdFvHqS62qGgn3r1V2eQ==
X-CSE-MsgGUID: CdmZGEGvTc+Z9vivUwoSXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="83207380"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="83207380"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 14:48:22 -0700
X-CSE-ConnectionGUID: PhjibrFBSGqeKeEp4dDBmw==
X-CSE-MsgGUID: HkN6++KkSG6ykos0PLTbjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="250307420"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 24 Jun 2026 14:48:20 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcVRt-000000003gn-0s7b;
	Wed, 24 Jun 2026 21:48:03 +0000
Date: Thu, 25 Jun 2026 05:47:32 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/managed_nodes/rfc5 34/75]
 mm/mempolicy.c:1194:3: error: expected ')'
Message-ID: <202606250535.hKlRhKft-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/rfc5
head:   46a97233124f2cd0a55d11f159f5c975529ebb03
commit: 5a2689d32ea3ed6497b47864893666699f4bb999 [34/75] mm/mempolicy: add in-kernel MPOL_BIND interfaces for drivers/services
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260625/202606250535.hKlRhKft-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260625/202606250535.hKlRhKft-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606250535.hKlRhKft-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/mempolicy.c:1194:3: error: expected ')'
    1194 |                 return ERR_PTR(-EINVAL);
         |                 ^
   mm/mempolicy.c:1193:5: note: to match this '('
    1193 |         if (!node_state(nid, N_MEMORY_PRIVATE)
         |            ^
   1 error generated.


vim +1194 mm/mempolicy.c

  1172	
  1173	/**
  1174	 * mpol_private_bind - build an MPOL_BIND policy pinned to a private node
  1175	 * @nid: an N_MEMORY_PRIVATE node
  1176	 *
  1177	 * Returns a refcounted mempolicy that binds allocations to @nid with the
  1178	 * private-placement intent (MPOL_F_PRIVATE).  This binds to @nid regardless
  1179	 * of the node's CAP_USER_NUMA, providing a privileged way for node-owners
  1180	 * to bind driver/service owned VMAs to the node.
  1181	 *
  1182	 * Like any MPOL_BIND it is relaxable: an unsatisfiable request falls back
  1183	 * rather than failing.
  1184	 *
  1185	 * Must be called while @nid is N_MEMORY_PRIVATE.
  1186	 *
  1187	 * The caller owns the reference and frees it with mpol_put().
  1188	 *
  1189	 * Return: the policy, or an ERR_PTR on failure.
  1190	 */
  1191	struct mempolicy *mpol_private_bind(int nid)
  1192	{
  1193		if (!node_state(nid, N_MEMORY_PRIVATE)
> 1194			return ERR_PTR(-EINVAL);
  1195		return __mpol_bind_node(nid, MPOL_F_PRIVATE);
  1196	}
  1197	EXPORT_SYMBOL_FOR_MODULES(mpol_private_bind, "kmem");
  1198	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
