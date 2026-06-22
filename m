Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EAA37997A;
	Mon, 22 Jun 2026 11:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782127159; cv=none; b=AnaMcPXPR7TGx4BDwd3X42keHKMkU2RFkfZQ38PdkIHugkZOB5lVTT0y1U3HCQbxybtsnyPHysae9Gq0hxpLYIDTP3Cc6K0cNqCNtpbGzz8Nv4+M1/V7NmuKXN49G1f0bk4+1/MiuA8JeVEdPiE5tdvfHqr+IoOmW794YGJbOrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782127159; c=relaxed/simple;
	bh=UJlf8GNgKLQZTpvGkoIRxiisri3P1FyntwPyS+gewYA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K5NCXpyvHLoqi50/Wo7L8Jym/J+nFidNHS0O3BkTpWCLus4IURIxmYKM0MfN1x1Tpxv7++anlSOXbJlh82ACoXjYnwWWrS5udyyh2Qr5eDInNmwdrFVzk81WgJeOZASF2d1cl0rT48xRabA2Lcl30Hf7K2QocSKH1Vxc/J9GyjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P88ueHgV; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P88ueHgV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782127158; x=1813663158;
  h=date:from:to:cc:subject:message-id;
  bh=UJlf8GNgKLQZTpvGkoIRxiisri3P1FyntwPyS+gewYA=;
  b=P88ueHgV+/Cb9J0ib4d6abPD0Spaf9Ssb396w8xsP8XVR7p2KLMJc3sz
   ZUNYomGRT2JkQohGSqZ4LeIKXInSzxiQPdH7CwUtARaRZrLiJ79lB6FZE
   ANgAoniYVOKNTRWQxd1AVOUTU5yZJyx4w0HE7lx9DTuRCUCwO7m/JBYQv
   1SjosMrEbJj6hHZiGch4iLwYxE4ou8D2MEIcfGSykx8KpR/fjkGZQ+y1K
   T826J2NaCXHHC1ape8XGshzNQZ1YRbops0hAPH+pNBJQ1Gc93An0+DGu1
   jIhXbW8tc3ul9WbtaE6+I0Mf1r54ydKklsmnJBcNaEH0a3TcGmUxu6mZq
   w==;
X-CSE-ConnectionGUID: x5ujc5YwTCi8VqerEPC1AA==
X-CSE-MsgGUID: 8pQElYDmSRmAt+4bg+zZ9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="82622668"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="82622668"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 04:19:18 -0700
X-CSE-ConnectionGUID: mybT7a5OQmyCqp0BAy0Gcw==
X-CSE-MsgGUID: s+qKMsnLTpKUP5QRPUfBDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="253103175"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 22 Jun 2026 04:19:17 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbcgM-0000000013F-1QlG;
	Mon, 22 Jun 2026 11:19:14 +0000
Date: Mon, 22 Jun 2026 19:19:12 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v2 16/17]
 drivers/nvme/target/loop.c:542:36: error: incomplete definition of type
 'struct nsproxy'
Message-ID: <202606221944.avjlQZnR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v2
head:   e2bc6e23c907dceafa9ce30beca26cdc05bb664d
commit: 5ee9c143b806000467a489e080f5d0f7db3af48e [16/17] nvmet-loop: skip ports from wrong namespaces
config: i386-randconfig-017-20260622 (https://download.01.org/0day-ci/archive/20260622/202606221944.avjlQZnR-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260622/202606221944.avjlQZnR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606221944.avjlQZnR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/nvme/target/loop.c:542:36: error: incomplete definition of type 'struct nsproxy'
     542 |                 if (p->net_ns != current->nsproxy->net_ns)
         |                                  ~~~~~~~~~~~~~~~~^
   include/linux/sched.h:72:8: note: forward declaration of 'struct nsproxy'
      72 | struct nsproxy;
         |        ^
   1 error generated.


vim +542 drivers/nvme/target/loop.c

   534	
   535	static struct nvmet_port *nvme_loop_find_port(struct nvme_ctrl *ctrl)
   536	{
   537		struct nvmet_port *p, *found = NULL;
   538	
   539		mutex_lock(&nvme_loop_ports_mutex);
   540		list_for_each_entry(p, &nvme_loop_ports, entry) {
   541			/* Skip ports from non-matching namespaces */
 > 542			if (p->net_ns != current->nsproxy->net_ns)
   543				continue;
   544			/* if no transport address is specified use the first port */
   545			if ((ctrl->opts->mask & NVMF_OPT_TRADDR) &&
   546			    strcmp(ctrl->opts->traddr, p->disc_addr.traddr))
   547				continue;
   548			found = p;
   549			break;
   550		}
   551		mutex_unlock(&nvme_loop_ports_mutex);
   552		return found;
   553	}
   554	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
