Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEF01448E0;
	Sun, 16 Aug 2026 04:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786855218; cv=none; b=qWR7ycb74DAzdjqrd5H263xLz4mOn4Je80mgH+XHGwhlI26dLxkuh5IDdyCylVzVE1ibkuelzFBnveyGJzAIJBxFugfc8Avaf9X/oUIdmPl/9LvFTiha80coAYwAY4XkFEbbNp17HOFxBCSsyEH8oJFYfpDbJZUa/aJsj1AH4pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786855218; c=relaxed/simple;
	bh=Gaj3HdmsBXybgNPXWiyExgG/oD1Vtcok5wosNTTlDqc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qH+NpHcGJfhm9PhAkDqbKBOElXzO4GQ0YyFxBoFbHsCnyIHqu2n6cqqpVkMNRSMLEFH10UnyZH2/ahOJKFexDkdeRTZcotRx7rlVs6qHaG5urAmlmQ4nG74zXeXse+k/IQqOmKtb0gwmi7hfSl+Wa0qFcRCweDRdO44D1zCgrjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QWr4VJnv; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QWr4VJnv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786855217; x=1818391217;
  h=date:from:to:cc:subject:message-id;
  bh=Gaj3HdmsBXybgNPXWiyExgG/oD1Vtcok5wosNTTlDqc=;
  b=QWr4VJnvbKQdCTK83Qb+q91AN1rn/hxNLzxO+sIRjulN7okYLJSLvFs5
   ZfD0OMl3DIX/Wl8BJYZtaq4hTtn/CgCKZbWChhY/vAvi6rrUGU2KRt73f
   wn2ThWMhESARF8l5Z0xRcmJMDCzdG54BeS2Y7svECtYJShg3nyFsxU7eV
   RMXmNPD2StohAdnUt6Mz2PBdzb9oSnGnhEubsP4d0R2YfTj8aWegzYCBP
   JH7D+2x1bUYwu+ZPPGii/b42Gh58BjecYwP4lI0UjBdWK61dvvATnF4Zq
   1CJXxo7B6rk+u6yYmalXXKs9CQ9mBiO+CwWO9LPBdhTutbuCua+6zU03e
   A==;
X-CSE-ConnectionGUID: dnG1zfjYSaC1smg0B1BozA==
X-CSE-MsgGUID: 643MKEfdRd2wVXZnp4aDdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="110157546"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="110157546"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 21:40:16 -0700
X-CSE-ConnectionGUID: bRLLdj37Sy+FGRmvaCelag==
X-CSE-MsgGUID: 2o4LzO8ZQkuV09DKMegOkw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 15 Aug 2026 21:40:15 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvSfN-000000006Y5-0Asb;
	Sun, 16 Aug 2026 04:40:13 +0000
Date: Sun, 16 Aug 2026 06:39:52 +0200
From: kernel test robot <lkp@intel.com>
To: Martin KaFai Lau <martin.lau@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>, Amery Hung <ameryhung@gmail.com>
Subject: kernel/bpf/cgroup.c:412:9: error: call to undeclared
 function 'bpf_struct_ops_id'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202608160659.fOw8zOgX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Amery-Hung/bpf-Remove-__rcu-tagging-in-st_link-map/20260813-181925
head:   770f00a7e2903fc692a7fbf06430c2f04d192b6f
commit: 66846cc6e671612661560603b60b552003b460d7 bpf: Add infrastructure to support attaching struct_ops to cgroups
date:   3 days ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260816/202608160659.fOw8zOgX-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608160659.fOw8zOgX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608160659.fOw8zOgX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/cgroup.c:412:9: error: call to undeclared function 'bpf_struct_ops_id'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     412 |                         id = bpf_struct_ops_id(item->kdata);
         |                              ^
   kernel/bpf/cgroup.c:412:9: note: did you mean 'bpf_struct_ops_find'?
   include/linux/btf.h:540:49: note: 'bpf_struct_ops_find' declared here
     540 | static inline const struct bpf_struct_ops_desc *bpf_struct_ops_find(struct btf *btf, u32 type_id)
         |                                                 ^
   1 error generated.


vim +/bpf_struct_ops_id +412 kernel/bpf/cgroup.c

   398	
   399	static int bpf_cgroup_array_copy_to_user(struct bpf_prog_array *array,
   400						 __u32 __user *prog_ids, int cnt,
   401						 enum cgroup_bpf_attach_type atype)
   402	{
   403		struct bpf_prog_array_item *item;
   404		int i = 0;
   405		u32 id;
   406	
   407		for (item = array->items; item->prog && i < cnt; item++) {
   408			if (item->prog == bpf_cgroup_array_dummy(atype))
   409				continue;
   410	
   411			if (cgroup_bpf_is_struct_ops_atype(atype))
 > 412				id = bpf_struct_ops_id(item->kdata);
   413			else
   414				id = item->prog->aux->id;
   415	
   416			if (copy_to_user(prog_ids + i, &id, sizeof(id)))
   417				return -EFAULT;
   418			i++;
   419		}
   420		return item->prog ? -ENOSPC : 0;
   421	}
   422	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
