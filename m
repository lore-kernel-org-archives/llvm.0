Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727F234BA3F;
	Sat,  4 Oct 2025 07:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759562212; cv=none; b=OnlNIjKUNAvSrDv/uSlHql3Phd0H+Hel4Nje5G9Rlx/bedQHhYpdElPSJzQJUI+7ty2ZEItFXZQUc1Q6SKFMuI4aQdVKcTYpGyjRKcCf8cIGL/+EFSOAG8k8M1YNvYK1FKN4nswuU16JoeMYn4PZ9P3sQgswsOYZ1MumG0UNGhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759562212; c=relaxed/simple;
	bh=GN75K08pQ4IQp/o1K21cWNmwgKDg771mmExliqsoMts=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X1gDt5EGeqNvTM3ZzLJLmm0lkQ8U1NhxVIRTMWNRb0zACOHye8uQ/V2R8vCol1Zccwo7mT0SLwlbhFlYB5EvdirOqhJ1oRQL7AzGqXa1qNDAZrZ1SzePYlSlhmd0AYiVAxedH0M8lxrti4LSyfD0r2y+v1QqDtm8OsVJnQXKdLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gC9qWPQn; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gC9qWPQn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759562210; x=1791098210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GN75K08pQ4IQp/o1K21cWNmwgKDg771mmExliqsoMts=;
  b=gC9qWPQnnP/mZ2JZBCSloJ/NC+rv5Quia6pMW4BE3KTR+9ii/plJG7dn
   ULQns4DVD6lIC7gzCKsTj897/GQQv0LssKLFas+ajbkccQLBPPAuNbF5X
   aGwDw8+qvZtqKkA5CRM1yUTjYx9uEsIgkOuidaSuIoa34kUCsNkAnRAma
   H9eSHIzN/38EHbgX5tuAaGApQcrJ5oU3uFirl7aOx5pdyDUq/3y5o1BXk
   v4A1/iD+pCVplO6OYgKiS7iTm57aAPsS/aO3FHkLJjlVc+kRIsws/2P2V
   npzu/tWtJWhittGSUUlYrHHeRwFtTLUh0W+apI/aJG/QgpDdjN5KygZ2s
   A==;
X-CSE-ConnectionGUID: 7/aa/O5MRvKNUsH+16Zltg==
X-CSE-MsgGUID: aNfjMJ6+QUmPk5WoQ+nh7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="84453658"
X-IronPort-AV: E=Sophos;i="6.18,314,1751266800"; 
   d="scan'208";a="84453658"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2025 00:16:50 -0700
X-CSE-ConnectionGUID: P49kNJvSRj6R+EV1AJkm4w==
X-CSE-MsgGUID: yfinJdHsSGeSVKaEppUtUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,314,1751266800"; 
   d="scan'208";a="178749380"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Oct 2025 00:16:47 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4wVZ-00058V-0K;
	Sat, 04 Oct 2025 07:16:45 +0000
Date: Sat, 4 Oct 2025 15:16:20 +0800
From: kernel test robot <lkp@intel.com>
To: Emil Tantilov <emil.s.tantilov@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Chittim Madhu <madhu.chittim@intel.com>
Subject: [tnguy-net-queue:dev-queue 7/17]
 drivers/net/ethernet/intel/idpf/xdp.c:421:20: error: use of undeclared
 identifier '__IDPF_VPORT_UP'; did you mean 'IDPF_VPORT_UP'?
Message-ID: <202510041511.Kfu7sVNC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Emil,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue.git dev-queue
head:   e50b34f0f3fb86c9be2f9ad3b7ed483f18b46896
commit: 7c0e8a950dbd30ca46e999cf1d25f3e97a98f174 [7/17] idpf: convert vport state to bitmap
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20251004/202510041511.Kfu7sVNC-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251004/202510041511.Kfu7sVNC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510041511.Kfu7sVNC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/intel/idpf/xdp.c:421:20: error: use of undeclared identifier '__IDPF_VPORT_UP'; did you mean 'IDPF_VPORT_UP'?
     421 |                 if (np->state == __IDPF_VPORT_UP)
         |                                  ^~~~~~~~~~~~~~~
         |                                  IDPF_VPORT_UP
   drivers/net/ethernet/intel/idpf/idpf.h:138:2: note: 'IDPF_VPORT_UP' declared here
     138 |         IDPF_VPORT_UP,
         |         ^
   1 error generated.


vim +421 drivers/net/ethernet/intel/idpf/xdp.c

cba102cd719029 Alexander Lobakin 2025-08-26  407  
705457e7211f22 Michal Kubiak     2025-08-26  408  static int idpf_xdp_setup_prog(struct idpf_vport *vport,
705457e7211f22 Michal Kubiak     2025-08-26  409  			       const struct netdev_bpf *xdp)
705457e7211f22 Michal Kubiak     2025-08-26  410  {
705457e7211f22 Michal Kubiak     2025-08-26  411  	const struct idpf_netdev_priv *np = netdev_priv(vport->netdev);
705457e7211f22 Michal Kubiak     2025-08-26  412  	struct bpf_prog *old, *prog = xdp->prog;
705457e7211f22 Michal Kubiak     2025-08-26  413  	struct idpf_vport_config *cfg;
705457e7211f22 Michal Kubiak     2025-08-26  414  	int ret;
705457e7211f22 Michal Kubiak     2025-08-26  415  
705457e7211f22 Michal Kubiak     2025-08-26  416  	cfg = vport->adapter->vport_config[vport->idx];
705457e7211f22 Michal Kubiak     2025-08-26  417  
705457e7211f22 Michal Kubiak     2025-08-26  418  	if (test_bit(IDPF_REMOVE_IN_PROG, vport->adapter->flags) ||
705457e7211f22 Michal Kubiak     2025-08-26  419  	    !test_bit(IDPF_VPORT_REG_NETDEV, cfg->flags) ||
705457e7211f22 Michal Kubiak     2025-08-26  420  	    !!vport->xdp_prog == !!prog) {
705457e7211f22 Michal Kubiak     2025-08-26 @421  		if (np->state == __IDPF_VPORT_UP)
705457e7211f22 Michal Kubiak     2025-08-26  422  			idpf_xdp_copy_prog_to_rqs(vport, prog);
705457e7211f22 Michal Kubiak     2025-08-26  423  
705457e7211f22 Michal Kubiak     2025-08-26  424  		old = xchg(&vport->xdp_prog, prog);
705457e7211f22 Michal Kubiak     2025-08-26  425  		if (old)
705457e7211f22 Michal Kubiak     2025-08-26  426  			bpf_prog_put(old);
705457e7211f22 Michal Kubiak     2025-08-26  427  
705457e7211f22 Michal Kubiak     2025-08-26  428  		cfg->user_config.xdp_prog = prog;
705457e7211f22 Michal Kubiak     2025-08-26  429  
705457e7211f22 Michal Kubiak     2025-08-26  430  		return 0;
705457e7211f22 Michal Kubiak     2025-08-26  431  	}
705457e7211f22 Michal Kubiak     2025-08-26  432  
705457e7211f22 Michal Kubiak     2025-08-26  433  	if (!vport->num_xdp_txq && vport->num_txq == cfg->max_q.max_txq) {
705457e7211f22 Michal Kubiak     2025-08-26  434  		NL_SET_ERR_MSG_MOD(xdp->extack,
705457e7211f22 Michal Kubiak     2025-08-26  435  				   "No Tx queues available for XDP, please decrease the number of regular SQs");
705457e7211f22 Michal Kubiak     2025-08-26  436  		return -ENOSPC;
705457e7211f22 Michal Kubiak     2025-08-26  437  	}
705457e7211f22 Michal Kubiak     2025-08-26  438  
705457e7211f22 Michal Kubiak     2025-08-26  439  	old = cfg->user_config.xdp_prog;
705457e7211f22 Michal Kubiak     2025-08-26  440  	cfg->user_config.xdp_prog = prog;
705457e7211f22 Michal Kubiak     2025-08-26  441  
705457e7211f22 Michal Kubiak     2025-08-26  442  	ret = idpf_initiate_soft_reset(vport, IDPF_SR_Q_CHANGE);
705457e7211f22 Michal Kubiak     2025-08-26  443  	if (ret) {
705457e7211f22 Michal Kubiak     2025-08-26  444  		NL_SET_ERR_MSG_MOD(xdp->extack,
705457e7211f22 Michal Kubiak     2025-08-26  445  				   "Could not reopen the vport after XDP setup");
705457e7211f22 Michal Kubiak     2025-08-26  446  
705457e7211f22 Michal Kubiak     2025-08-26  447  		cfg->user_config.xdp_prog = old;
705457e7211f22 Michal Kubiak     2025-08-26  448  		old = prog;
705457e7211f22 Michal Kubiak     2025-08-26  449  	}
705457e7211f22 Michal Kubiak     2025-08-26  450  
705457e7211f22 Michal Kubiak     2025-08-26  451  	if (old)
705457e7211f22 Michal Kubiak     2025-08-26  452  		bpf_prog_put(old);
705457e7211f22 Michal Kubiak     2025-08-26  453  
aaa3ac6480baeb Alexander Lobakin 2025-08-26  454  	libeth_xdp_set_redirect(vport->netdev, vport->xdp_prog);
aaa3ac6480baeb Alexander Lobakin 2025-08-26  455  
705457e7211f22 Michal Kubiak     2025-08-26  456  	return ret;
705457e7211f22 Michal Kubiak     2025-08-26  457  }
705457e7211f22 Michal Kubiak     2025-08-26  458  

:::::: The code at line 421 was first introduced by commit
:::::: 705457e7211f22c49b410eb25e83cef8a61bd560 idpf: implement XDP_SETUP_PROG in ndo_bpf for splitq

:::::: TO: Michal Kubiak <michal.kubiak@intel.com>
:::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
