Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492F8394470;
	Tue, 23 Jun 2026 23:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782257033; cv=none; b=lq4BlKmF3F5ep9wtEWGUf5TH4j1egmAWD0TCOweSLj/IDXp0gFYZJjDsSXfVn0HzKzy+78+fd7roUhE6CyVl2hANeDAaVOIUdiYBL6saD1u2ciE6lMqDAGSgC8fdEC7pfdCw4ibvE8VrCWgaOnIBcLbdbuzX4L3E6j1R1cyM1KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782257033; c=relaxed/simple;
	bh=0SxkoX9dhkDXxGTyvSJYK7Opm2jvgOqRdTPvkCFIHYc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QsDa7m1VmJgViJqWueYHzN+boDRloN5gK394QF4dj0PMskhYMTPSP39+YMKkFfkepP8nqKZ9tiijXHS0rvZAwRnVlauAg1M1hdhSEYuPkJHj1K8FG4ldg/CO7nbdTmqgaZVgxxJBPtOU52oBAXGP6j/mR+5Tb2Lag9Htu2mreYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hvzA9VAW; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hvzA9VAW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782257032; x=1813793032;
  h=date:from:to:cc:subject:message-id;
  bh=0SxkoX9dhkDXxGTyvSJYK7Opm2jvgOqRdTPvkCFIHYc=;
  b=hvzA9VAWMsBEhitS3gL3qKA3wJrT9hxRkSURIiu5uaADAnUT+pmOBEgM
   wd3qDSV6BiB41C7MfeqnmFGgNqHMm5hChqC7UGX0XacEksLE6dwYNAZjC
   S3IJ4jxVu2MM8koJ/5bICWdf/voaYLhpTYX6QbVKM4+X7YbTT2eHFi4u/
   W6ihoboyeiANUIBJxNDpxMr97336r4TaVSjNKLzf4xVIglVp2+z86m7i+
   uGdCo/Zk7X1nfIYpuWQUp2Kl4E89nU8nCfBpw7tnNlR2UWA1+cW7EgvON
   WbY1x1LG4XJXEoTdpuR1gEjI/OMND6nFmu2Ha4utg3lhtdjr8yfcYYKy+
   Q==;
X-CSE-ConnectionGUID: OWNAULclQPGXXI7191pdhg==
X-CSE-MsgGUID: 2qo+kECsQ0qhpLsfP0xZEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="86847776"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="86847776"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 16:23:52 -0700
X-CSE-ConnectionGUID: D7wAEdaIQXuSuaU+17KSTw==
X-CSE-MsgGUID: ecAxBsH/QMaeCmYd1hPi6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="279816809"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 23 Jun 2026 16:23:51 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcAT5-000000002xN-27Jn;
	Tue, 23 Jun 2026 23:23:47 +0000
Date: Wed, 24 Jun 2026 07:23:19 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v3 2/12]
 /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/bin/ld:
 fs/configfs/mount.c:undefined reference to `init_net'
Message-ID: <202606240746.ELXeMhBI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v3
head:   59472df96a84fb076a2b47a90a0bb353c80f239c
commit: 0dbf11d8f95b2100f7ea5b21e40ae1fd76d5c712 [2/12] fs/configfs: dynamically allocate super_info
config: um-randconfig-002-20260624 (https://download.01.org/0day-ci/archive/20260624/202606240746.ELXeMhBI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606240746.ELXeMhBI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606240746.ELXeMhBI-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/bin/ld: fs/configfs/mount.o: in function `configfs_ns_id':
   fs/configfs/mount.c:(.text+0x5b): undefined reference to `init_net'
>> /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/bin/ld: fs/configfs/mount.c:(.text+0x260): undefined reference to `init_net'
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/bin/ld: fs/configfs/mount.o: in function `configfs_fill_super':
   fs/configfs/mount.c:126:(.text+0x44f): undefined reference to `init_net'
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/bin/ld: fs/configfs/mount.o: in function `configfs_init':
   fs/configfs/mount.c:218:(.init.text+0x4c): undefined reference to `init_net'
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/bin/ld: fs/configfs/dir.o: in function `configfs_register_subsystem':
   fs/configfs/dir.c:1874:(.text+0x200c): undefined reference to `init_net'
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/bin/ld: fs/configfs/dir.o:fs/configfs/dir.c:1943: more undefined references to `init_net' follow
   clang: error: linker command failed with exit code 1 (use -v to see invocation)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
