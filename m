Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8C11AC456;
	Tue, 24 Sep 2024 16:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727196635; cv=none; b=bKH/Ov3g5bkmK78Wdhn4lFfnQtmA7UxA6ym4qNlQMaiM/lSnD6l6XlxOqO6ZqXZ8VVsFL1CxLnErM53YIrAurSjOVI3RL61jD46nEj/p8kVQb85+oLnUVQLP1c2MQnGhtnWClgU4iFphdRvwMHbVegtYm8hbIWpEY7l6I32d2rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727196635; c=relaxed/simple;
	bh=K3KhIPwgbjM9WYd/mRoNbyvaqimjcrSZXZiWDO5JN30=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gFjPUZohN/EA2m9H4krIrKDUqHKTNSNTQIz62PKia7SRgrahKswiNzI4EyesI/W7w++qK8HslTFbOxghYzrajH58BziT7qFHc0yAuvs7+66KcFZxMj4UikOqDqZuFCiqdAPrCtdxzX78ZxLkB07Q/yEjfLfnS0O9fbzIhAqUK9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iN3qWt5S; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iN3qWt5S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727196633; x=1758732633;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K3KhIPwgbjM9WYd/mRoNbyvaqimjcrSZXZiWDO5JN30=;
  b=iN3qWt5SmZRKawM8vc+fDqUDHPuKE/c1SREFjdeXJDDhixRrhbw9nRq8
   LFNSO7eIVY+mrJ7X/4pd5A2tVwHE2Rt8nfSKsvGoq0GsAUQEpMDRRlq6X
   RY2NZ6kUScwEtHZjAVbiL6Tz0J73XPYEj9MccY+RYkdv3Y5L6IvY19DnH
   JmZNNXsXCn8eplMEcrjkmKZaq4wi2wViOAbJzJjzvobrSCCQu45hpc3dK
   O2sEvU/NvINJWWLLkXnHoUZn6A45Zef+e4MTyvsmMvDwgZbz53AqoPAOj
   tsoYSj/oELySian1yyWYCU6AjpCf4fJHV9YWAf5+OPiIv9GcTxF1JPCP2
   Q==;
X-CSE-ConnectionGUID: 8oQ5cf7HTFysnSDTEOww6g==
X-CSE-MsgGUID: GdidHQ/3QK6olFTEKRLc0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="43726035"
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="43726035"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 09:50:32 -0700
X-CSE-ConnectionGUID: gyiVkz+nSQih+Cu0eY+DkA==
X-CSE-MsgGUID: BcriO7JHSHqlxxl51wnQhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="71919088"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 24 Sep 2024 09:50:31 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1st8k8-000Ich-33;
	Tue, 24 Sep 2024 16:50:28 +0000
Date: Wed, 25 Sep 2024 00:49:57 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:nr_cpus 1/1] include/linux/threads.h:16:2: error:
 "CONFIG_NR_CPUS not defined"
Message-ID: <202409250044.OFQyPQyO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux nr_cpus
head:   06e0fc4651a486ac1ce333cccc89b394222431c8
commit: 06e0fc4651a486ac1ce333cccc89b394222431c8 [1/1] fixup
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20240925/202409250044.OFQyPQyO-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240925/202409250044.OFQyPQyO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409250044.OFQyPQyO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/um/os-Linux/skas/process.c:25:
>> include/linux/threads.h:16:2: error: "CONFIG_NR_CPUS not defined"
      16 | #error "CONFIG_NR_CPUS not defined"
         |  ^
>> arch/um/os-Linux/skas/process.c:256:19: error: use of undeclared identifier 'CONFIG_NR_CPUS'
     256 | int userspace_pid[NR_CPUS];
         |                   ^
   include/linux/threads.h:20:18: note: expanded from macro 'NR_CPUS'
      20 | #define NR_CPUS         CONFIG_NR_CPUS
         |                         ^
   2 errors generated.


vim +16 include/linux/threads.h

     4	
     5	
     6	/*
     7	 * The default limit for the nr of threads is now in
     8	 * /proc/sys/kernel/threads-max.
     9	 */
    10	
    11	/*
    12	 * Maximum supported processors.  Setting this smaller saves quite a
    13	 * bit of memory.  Use nr_cpu_ids instead of this except for static bitmaps.
    14	 */
    15	#ifndef CONFIG_NR_CPUS
  > 16	#error "CONFIG_NR_CPUS not defined"
    17	#endif
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
