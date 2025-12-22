Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3E3349AF2;
	Mon, 22 Dec 2025 20:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766435937; cv=none; b=JEVgw0H7nxavKD3ghNwAdtVVWg+XuVrIpHarcOGEFvjt/DqxgLgUweoF3Y30I2tYWYfnDHu0JiE9jb600U5S7YrEMGXxY/LeCbpTgHl+ipzZb+4ZwEu3pHHKn4GSPS0H2TElfvkG9ATjIAgl0s2AYNZOQ/JFADHZ/pG3SttbP1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766435937; c=relaxed/simple;
	bh=zYw+QvLhf8X8S4x+JvvxDuYBrz+O3TRVCQYiBMqe4vk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KtHnxE479a6hRi41+okodvurRvboGd5vn6BD3dLwuE22AEByfna4I/1kNywCcVvKnYGG+G81q481cV4tvWKOEsyes+7tXm9iZRd4gXL1GrqNw8nzEWW7Y8pYT3UH8+F6LLn74iNdNcBU4b/pbjdn7v2KaoHILONUlS7NSCG+HSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kBsE7FlQ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kBsE7FlQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766435936; x=1797971936;
  h=date:from:to:cc:subject:message-id;
  bh=zYw+QvLhf8X8S4x+JvvxDuYBrz+O3TRVCQYiBMqe4vk=;
  b=kBsE7FlQ3SbQevqlrIq5hV4AsRkVAur9d5unb0gLTPQ+XDHoKVg3b7ee
   zYFikc+NFjijTDEU+TKfeZ13b7OBZ61WvGACQzin1bG17f++yA08ROXVO
   kdXUZNBlWkYUR4JgRPPAFKC8p0b2A+9zTXiHat+ZFwkS+jPAhR3WE3LHt
   DgV6zLd4pKnqgjCNIhjScEAC3Q3P6tf5jyr701dH1aegfg8+LbBbiPbe4
   18EU3gJAdZ1VWTEK/d8ZjvIILFp+mAKmK0KpD7bvjNdvktptTh1GMx3Jm
   m7Bgh2HGpjq62jZD1CLRRbSJ2dhIha1xkazG/IrudgGduxU1QHhgSxvat
   w==;
X-CSE-ConnectionGUID: ct925e4cRWuaS1Gjwn0uvA==
X-CSE-MsgGUID: k8TRFzQzRb6Vmt4Uln00Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="85879387"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="85879387"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 12:38:55 -0800
X-CSE-ConnectionGUID: avNASbzNRL2cjmImx5sC6A==
X-CSE-MsgGUID: NAKEAbT8RxmX+MK2z0dOBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="230267258"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 22 Dec 2025 12:38:52 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXmg2-0000000015V-1y0a;
	Mon, 22 Dec 2025 20:38:47 +0000
Date: Tue, 23 Dec 2025 04:38:17 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Elver <elver@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:locking/core 38/39] WARNING: modpost: EXPORT
 symbol "crypto_larval_alloc" [vmlinux] version generation failed, symbol will
 not be versioned.
Message-ID: <202512230401.T9Ks8CSB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   77b4ebc9e43b02f3c50dab48963d969964ea83ef
commit: fcd7db8b4bb56af5cb7d0e8f33ab1eef15c43e5e [38/39] crypto: Enable context analysis
config: s390-defconfig (https://download.01.org/0day-ci/archive/20251223/202512230401.T9Ks8CSB-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 185f5fd5ce4c65116ca8cf6df467a682ef090499)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230401.T9Ks8CSB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230401.T9Ks8CSB-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: EXPORT symbol "crypto_larval_alloc" [vmlinux] version generation failed, symbol will not be versioned.
Is "crypto_larval_alloc" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "crypto_alg_tested" [vmlinux] version generation failed, symbol will not be versioned.
Is "crypto_alg_tested" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "rhashtable_insert_slow" [vmlinux] version generation failed, symbol will not be versioned.
Is "rhashtable_insert_slow" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "rhashtable_walk_start_check" [vmlinux] version generation failed, symbol will not be versioned.
Is "rhashtable_walk_start_check" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "stack_depot_save_flags" [vmlinux] version generation failed, symbol will not be versioned.
Is "stack_depot_save_flags" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "stack_depot_save" [vmlinux] version generation failed, symbol will not be versioned.
Is "stack_depot_save" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: "rhashtable_insert_slow" [fs/dlm/dlm.ko] has no CRC!
WARNING: modpost: "rhashtable_walk_start_check" [fs/nfsd/nfsd.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [fs/nfsd/nfsd.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [fs/gfs2/gfs2.ko] has no CRC!
WARNING: modpost: "rhashtable_walk_start_check" [fs/gfs2/gfs2.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [drivers/net/vxlan/vxlan.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [net/sched/act_ct.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [net/sched/cls_flower.ko] has no CRC!
WARNING: modpost: "rhashtable_walk_start_check" [net/netlink/netlink_diag.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [net/netfilter/nf_tables.ko] has no CRC!
WARNING: modpost: "rhashtable_walk_start_check" [net/netfilter/nf_tables.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [net/netfilter/nf_flow_table.ko] has no CRC!
WARNING: modpost: "rhashtable_walk_start_check" [net/netfilter/nf_flow_table.ko] has no CRC!
WARNING: modpost: "rhashtable_walk_start_check" [net/sctp/sctp.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [net/sctp/sctp.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [net/rds/rds.ko] has no CRC!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
