Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2711F03D9;
	Wed, 10 Jun 2026 01:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781056771; cv=none; b=QJ6KvINW9D7gBmP77mDIpq4fD+VQj14EXdGyECd4oPze254zI0hLP5T+6NMFHEl8jcpT05cwn2/2FBcMh/0/0J9gIE8Rl7m/dzFV3E/Koftex3oWji51wXdddz5pIJO3rqjHdOggbiVBqNMHZc4GkJnK0xhrnXIZ/JWPwq4WzMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781056771; c=relaxed/simple;
	bh=GVAgB+xkB1nd0Rm2CynWFmoopsG79Tg5h6BTqlJgWog=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HCIFz5GCkMFAMt4Zdv/ne1IbDCed3ho0nS4txXZHGYjwLap9c6o+iZaP+YSNxfL4tBgm1uomGY2I1bgy4gGhAh3uJCkhwnq53+ci+ZSaeCGE0NmitKAqaKFut2sU1HFr79YiFamb4q84TTDuxIhFCrKNle+ZlKcMlK1/B8k9dUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CfgsfLhn; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CfgsfLhn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781056770; x=1812592770;
  h=date:from:to:cc:subject:message-id;
  bh=GVAgB+xkB1nd0Rm2CynWFmoopsG79Tg5h6BTqlJgWog=;
  b=CfgsfLhn5P5rlw/iAIvS63ceqo7piVd4xqFeq3Q3qrlsYNpxmAEIcYhT
   xNwR7wBmcJwWJ/8gN8KuPZIS2RC93d9ZvjW+5GNHoaaPlI2GwJkH8HqFG
   4vO6qiQ7OdQgIhb6Zgn4rSMvb0mSR+aQrBL4qxiVV4ntEIC7f7l7zcPRI
   VQHAP0BoKc+vZgVP1c7Ld/+08r55Y+IdIyUCEm5T3yOM7j9XxZFnLIN6N
   ii+OIiBxzI8zPVD1KHJLNF3UGD/2xCL+V961a4i5pkHBCiYMOIJ8v2nHE
   TolW5n5DMw6jpL2UVXiVs24kdtpOcol141aIgMEOY62PN1HwRkA33ic/+
   g==;
X-CSE-ConnectionGUID: o05q/Ns4RUSB2wWRlUb6Ug==
X-CSE-MsgGUID: shrRMjvlRLWI+yQYYiPnpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81745438"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81745438"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 18:59:29 -0700
X-CSE-ConnectionGUID: HKR0KgMhQYWwPaPX5mIC6w==
X-CSE-MsgGUID: pfLAks2rSa6pJ1I9tsM23Q==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 09 Jun 2026 18:59:27 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wX8E1-000000003af-2DZY;
	Wed, 10 Jun 2026 01:59:25 +0000
Date: Wed, 10 Jun 2026 03:59:23 +0200
From: kernel test robot <lkp@intel.com>
To: Sumit Saxena <sumit.saxena@broadcom.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: Warning: drivers/scsi/hosts.c:407 function parameter 'dev'
 not described in 'scsi_host_alloc'
Message-ID: <202606100331.SVuJQ2ZA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Sumit-Saxena/scsi-scan-allocate-sdev-and-starget-on-the-NUMA-node-of-the-host-adapter/20260609-195849
head:   1a119c6869ad0a915e9c86e65a8a3d0b0c4b21d2
commit: 7479f1902d058cd6e51b1f7f9b23241d8fd588cd scsi: host: allocate struct Scsi_Host on the NUMA node of the host adapter
date:   14 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260610/202606100331.SVuJQ2ZA-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606100331.SVuJQ2ZA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606100331.SVuJQ2ZA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/scsi/hosts.c:407 function parameter 'dev' not described in 'scsi_host_alloc'
>> Warning: drivers/scsi/hosts.c:407 function parameter 'dev' not described in 'scsi_host_alloc'
--
>> drivers/scsi/qla2xxx/qla_mid.c:505:48: warning: data argument not used by format string [-Wformat-extra-args]
     505 |                     "scsi_host_alloc() failed for vport.\n", NULL);
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^
   1 warning generated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
