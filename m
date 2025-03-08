Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A02A1B3957;
	Sat,  8 Mar 2025 19:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741460640; cv=none; b=sNIlRhhIeKZsLfPe7kqZLETMYLDkrb5IfOntDqrsxx0w7660TsRb7FpxS7Cx0VES5CFgqZ+5Vn/2xKcUmOXn3Fz+PVdbtvwgRERfFqD615S5LyEVHe158EvAZP80Dzevv3wQMedeJUFzDqebJ5w6gRm9DuOgNZw+Echt6A8ntI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741460640; c=relaxed/simple;
	bh=Y0FVtMyIr6JwfYY0Qysro0s9MpxljLul9s3nJ2jhdFk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tXEhllfv6ORY2x1sk8LRi3QEnOW7LYtMpFNdXvHzroip2ROi3nmgjvSW8k1Ux6KgQpPVb1hL+CDZkL+1dUlD/7mwzl3ememtRf8bfxqViw+m0Xdxxl5oV1G0/JFaKf+HcHeF5SMQV15gRBtuLG1j+VChg5oNfI0Y8dGrVdF0oFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LeOADEw1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LeOADEw1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741460639; x=1772996639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y0FVtMyIr6JwfYY0Qysro0s9MpxljLul9s3nJ2jhdFk=;
  b=LeOADEw1+tTy3gRelRtha6rpF0ckOv1ZvptCZ8QfbY/F3kzTDAEipW1C
   5buQrEKYKtvRDQeIfVB9RyiLYCCLjGAZfoHKI7E3WeFjmKrhzrLATW3nf
   LJYZ2KAPPBBW1kdrrVlywvZmu0LuHfa6ffcnRrbsoFQgAvL08HvX1OXff
   IhgDNOoEX6lmKMJfpx77cebHB/ihWqnCRJWqg74V9BT2Ixdt/pjOOwakx
   nCZSRT8NU2NTrTVYZSzV3Noq5rsidLzzZDAnK5miiHBV/RAvi6uGwebG+
   /IUeLZmhWKTZR8LxFdei+mQ7lBIaCFbHChKqcJs/Yp81haS8lwi2a7rps
   Q==;
X-CSE-ConnectionGUID: jnwgX15oSHyyKnAthHTHBA==
X-CSE-MsgGUID: qEVK+/TNRfeP2QEJBEEl3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="42632749"
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="42632749"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 11:03:56 -0800
X-CSE-ConnectionGUID: paDUvW3WT3aetgMIBU6zYQ==
X-CSE-MsgGUID: x4VK+8eVR66Mthdk3pM/pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="120301244"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 08 Mar 2025 11:03:56 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqzSi-0002Dq-2p;
	Sat, 08 Mar 2025 19:03:52 +0000
Date: Sun, 9 Mar 2025 03:03:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:nfsd-tracepoints 8/9] fs/nfsd/nfs4proc.c:797:2: warning:
 label at end of compound statement is a C23 extension
Message-ID: <202503090202.HOZ7XWRq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git nfsd-tracepoints
head:   7162c90c3e04a073c111a5821e529377ce2ab43f
commit: f1681c62918a99afaf3528b5332aa647740eb818 [8/9] nfsd: add tracepoints around nfsd_create events
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20250309/202503090202.HOZ7XWRq-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503090202.HOZ7XWRq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503090202.HOZ7XWRq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/nfsd/nfs4proc.c:42:
   In file included from include/linux/sunrpc/addr.h:14:
   In file included from include/net/ipv6.h:12:
   In file included from include/linux/ipv6.h:102:
   In file included from include/linux/tcp.h:17:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> fs/nfsd/nfs4proc.c:797:2: warning: label at end of compound statement is a C23 extension [-Wc23-extensions]
     797 |         }
         |         ^
   4 warnings generated.


vim +797 fs/nfsd/nfs4proc.c

   778	
   779	static umode_t nfs_type_to_vfs_type(enum nfs_ftype4 nfstype)
   780	{
   781		switch (nfstype) {
   782		case NF4REG:
   783			return S_IFREG;
   784		case NF4DIR:
   785			return S_IFDIR;
   786		case NF4BLK:
   787			return S_IFBLK;
   788		case NF4CHR:
   789			return S_IFCHR;
   790		case NF4LNK:
   791			return S_IFLNK;
   792		case NF4SOCK:
   793			return S_IFSOCK;
   794		case NF4FIFO:
   795			return S_IFIFO;
   796		default:
 > 797		}
   798		return 0;
   799	}
   800	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
