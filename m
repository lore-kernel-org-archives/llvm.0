Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2918231845;
	Mon, 22 Dec 2025 17:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766423649; cv=none; b=phK56IcQND7WyY9i9VZ/ycNy38dUn02C9JoZoMu9qZ8B0HHYARcul2pSE8lKVC+7IbZqB7g1EglEc9HQ5C3VebMcWtmGlvKW70NDaOaSwdgOvPIdSvbQrrjDwDWLaNIgSEncPO6NeNb/a41ScesqtBJPtW+bg/eyBup8z4MWkMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766423649; c=relaxed/simple;
	bh=KwGwrcMpJiU3MVYBV9KIwxN3Y+/Oe9IZDbzfQgGZV5E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HWWYunBfmkvuS4j1Nt80ZiKhDWrkuqRCCxhu5GPDXvH0ScG/K7dQCSgklhqolVggaJPDa93tyHWHnrAftDWC6t7R+ZiOkI8lBI7sQxa4IlBewIJpzcncwzbsfuZgQV9w8LOCV+eJr7suSpSPqAPawh7iTS+lhkn8o7pi+l6yw54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hcVOqUGt; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hcVOqUGt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766423648; x=1797959648;
  h=date:from:to:cc:subject:message-id;
  bh=KwGwrcMpJiU3MVYBV9KIwxN3Y+/Oe9IZDbzfQgGZV5E=;
  b=hcVOqUGtDttbXKCtEkUi0zk6jUfxLyLvfmNCqGocG5oLbacuQa8bZmEq
   fJ9B3Qx6ulOAx3SmUKiBHkVfhsTD3/2XreHSRyeGcaYB08yx0LXkSxp2l
   gkxy41bcC4k9UyFlaJ5SKFgMbPo9NwX2XKOqxTGeITXsyCNYlWiScRqBf
   wDX5bUqdJ8Ev2WkQ36C9OfJZGqKni3S276fEsPC4dupO7MYGPIa3ZOblz
   beLaNHdY+36u+cXxusrO6Z8VewbettbgW8A9OHe440eLtbhJwAtivcA6Q
   gZReo/GXFf4/FWQ0+Bmy4tsk8NOwHjfmJxplfzRMnS1DZcekfnDi/YX31
   w==;
X-CSE-ConnectionGUID: 0C5Ajw36SdqrfDCJIyFtDQ==
X-CSE-MsgGUID: tp5jDnAvROaVSvYxp0DXzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="72130770"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="72130770"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 09:14:08 -0800
X-CSE-ConnectionGUID: G4ht34QKT46t14mWxEp+MQ==
X-CSE-MsgGUID: pXHf6azTQxiBImg+Bu2NEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="198811632"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 Dec 2025 09:14:06 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXjTv-000000000us-1q6x;
	Mon, 22 Dec 2025 17:14:03 +0000
Date: Tue, 23 Dec 2025 01:13:05 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Elver <elver@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:locking/core 35/39] WARNING: modpost: EXPORT
 symbol "rhashtable_insert_slow" [vmlinux] version generation failed, symbol
 will not be versioned.
Message-ID: <202512230100.SV9PzmsR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   77b4ebc9e43b02f3c50dab48963d969964ea83ef
commit: 078d1288b6dd1f2d9ecff5021861beada37b5133 [35/39] rhashtable: Enable context analysis
config: s390-defconfig (https://download.01.org/0day-ci/archive/20251223/202512230100.SV9PzmsR-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 185f5fd5ce4c65116ca8cf6df467a682ef090499)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230100.SV9PzmsR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230100.SV9PzmsR-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: EXPORT symbol "rhashtable_insert_slow" [vmlinux] version generation failed, symbol will not be versioned.
Is "rhashtable_insert_slow" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "rhashtable_walk_start_check" [vmlinux] version generation failed, symbol will not be versioned.
Is "rhashtable_walk_start_check" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "stack_depot_save_flags" [vmlinux] version generation failed, symbol will not be versioned.
Is "stack_depot_save_flags" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "stack_depot_save" [vmlinux] version generation failed, symbol will not be versioned.
Is "stack_depot_save" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: "rhashtable_insert_slow" [fs/dlm/dlm.ko] has no CRC!
>> WARNING: modpost: "rhashtable_walk_start_check" [fs/nfsd/nfsd.ko] has no CRC!
>> WARNING: modpost: "rhashtable_insert_slow" [fs/nfsd/nfsd.ko] has no CRC!
>> WARNING: modpost: "rhashtable_insert_slow" [fs/gfs2/gfs2.ko] has no CRC!
>> WARNING: modpost: "rhashtable_walk_start_check" [fs/gfs2/gfs2.ko] has no CRC!
>> WARNING: modpost: "rhashtable_insert_slow" [drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko] has no CRC!
>> WARNING: modpost: "rhashtable_insert_slow" [drivers/net/vxlan/vxlan.ko] has no CRC!
>> WARNING: modpost: "rhashtable_insert_slow" [net/sched/act_ct.ko] has no CRC!
>> WARNING: modpost: "rhashtable_insert_slow" [net/sched/cls_flower.ko] has no CRC!
>> WARNING: modpost: "rhashtable_walk_start_check" [net/netlink/netlink_diag.ko] has no CRC!
>> WARNING: modpost: "rhashtable_insert_slow" [net/netfilter/nf_tables.ko] has no CRC!
>> WARNING: modpost: "rhashtable_walk_start_check" [net/netfilter/nf_tables.ko] has no CRC!
>> WARNING: modpost: "rhashtable_insert_slow" [net/netfilter/nf_flow_table.ko] has no CRC!
>> WARNING: modpost: "rhashtable_walk_start_check" [net/netfilter/nf_flow_table.ko] has no CRC!
>> WARNING: modpost: "rhashtable_walk_start_check" [net/sctp/sctp.ko] has no CRC!
>> WARNING: modpost: "rhashtable_insert_slow" [net/sctp/sctp.ko] has no CRC!
>> WARNING: modpost: "rhashtable_insert_slow" [net/rds/rds.ko] has no CRC!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
