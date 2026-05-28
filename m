Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504A13BB680;
	Thu, 28 May 2026 17:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779987953; cv=none; b=sTaX8UWNEQxH0+e/n47U3iI6okPxZJsEBgQI9Sw1yXQqB7Q3osi+7hI/D+XSYDYlzUldENCnx4HiFecTAiM9T3Q5m0TaBdlBGbXYnyW/DwczQRpw3EBrOw09Z4CHuF9gYsnYlxJaLzJeJd/ORR9+LR1kkWPLWFMGX9t0kmXEEzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779987953; c=relaxed/simple;
	bh=aP5B1RBt+hZkXFu+sdNG5ss+Z213MXR1OFDByfvJCx8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cmZmq2W5BblG/mMmbEXuYYyG5wdZx1yNh5Kx1WPEsWLuef94Mi7gn6q+B2CH74NeKrlUurucxoGxN+sPZWuv78vmFvWJdHUHq56atd7iwyxlqGZTrNSfIPMCcth+FhTcCHBT2Ju8zNpUlF+zdObhspyy+zi7llQbFzPCOzv7wm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A/kdNVuu; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A/kdNVuu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779987952; x=1811523952;
  h=date:from:to:cc:subject:message-id;
  bh=aP5B1RBt+hZkXFu+sdNG5ss+Z213MXR1OFDByfvJCx8=;
  b=A/kdNVuu0P362lAFSPD0xg0hlab44Y2sS2wA5fvjPdXTDJawoEfhURu1
   2J4A5+J3IP4bgG+zW5Ja7sT/m0wZMNogoS39QV+5HqB+kEpeT0KaCIUdu
   Epni99mdr+h5ogjlUJeNCpws/g+sXm77mDKZv9Q5c+ZYwwBNeph6h+GlH
   I0z1ZxTDDlJUPcyjzPAsXpdZmX4x424i9/bVYFZ4jghFJzEK7hiO4P/1E
   in+lBkJdiERDA4sH2FAO00WXnGgdxJZFx+FKTfXf/vur9OCJaA7Hv2x92
   e0VrkmJRzfVM3CEap8y7bEEnAnyX5LS/vPaLpMn/PjVuP6uYTSVEz0srR
   g==;
X-CSE-ConnectionGUID: KpNOr3wrQoqxWvkl5po1BA==
X-CSE-MsgGUID: 5QUMApeUTBm+M9MZtYK09g==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="83413025"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="83413025"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 10:05:43 -0700
X-CSE-ConnectionGUID: Wvqgp+ZLT2WzRnA4shY+0A==
X-CSE-MsgGUID: OS72TRCZRl+xIabQfSW3og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="240039299"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 May 2026 10:05:42 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSeAu-000000006By-0xPM;
	Thu, 28 May 2026 17:05:40 +0000
Date: Fri, 29 May 2026 01:04:54 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v5 21/26]
 drivers/nvme/target/discovery.c:21:6: warning: variable 'ns_id' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202605290041.c268dsUP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v5
head:   ef344c27d4d9d0e8ba46f599a08ab287a95e132b
commit: 06dc930655c7e599c1b110243c66baa25f9a4989 [21/26] drivers/nvme/target: make configuration namespace-aware
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260529/202605290041.c268dsUP-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605290041.c268dsUP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605290041.c268dsUP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvme/target/discovery.c:21:6: warning: variable 'ns_id' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (ns)
               ^~
   drivers/nvme/target/discovery.c:25:37: note: uninitialized use occurs here
           subsys = idr_find(&nvmet_disc_idr, ns_id);
                                              ^~~~~
   drivers/nvme/target/discovery.c:21:2: note: remove the 'if' if its condition is always true
           if (ns)
           ^~~~~~~
   drivers/nvme/target/discovery.c:17:11: note: initialize the variable 'ns_id' to silence this warning
           u64 ns_id;
                    ^
                     = 0
   1 warning generated.


vim +21 drivers/nvme/target/discovery.c

    13	
    14	struct nvmet_subsys *nvmet_get_disc_subsys(struct ns_common *ns)
    15	{
    16		struct nvmet_subsys *subsys;
    17		u64 ns_id;
    18	
    19		if (ns && is_ns_init_id(ns))
    20			ns = NULL;
  > 21		if (ns)
    22			ns_id = ns->ns_id;
    23	
    24		mutex_lock(&nvmet_disc_mutex);
    25		subsys = idr_find(&nvmet_disc_idr, ns_id);
    26		mutex_unlock(&nvmet_disc_mutex);
    27		return subsys;
    28	}
    29	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
