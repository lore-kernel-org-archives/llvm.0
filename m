Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB9F2F0C46;
	Fri, 12 Dec 2025 10:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765535811; cv=none; b=c6BE+hqGdbCBt3LF8cf69aH3gkDt+L3Q28nfkUFQzc8iYvsqhqc3M/MTxQkoC135u+rWIjzxOTzgmUYG+gYLmpL3VNv65zcwNWhneznziHMAZCibXnddU1Oz/fYD4hog3jKo0l0cRAeMye6/i2sN6unV0kb5oHP3GDYn4ydBnI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765535811; c=relaxed/simple;
	bh=r/JpO5LBVsw6I8J2SFBcm1AOo6uAqwkMlwHyl6tSzUg=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s4BeI35W7s/nMQN83WuTU9NUOzlEo5nKfeTKP8kScX+Mjue95AkJJiXsOOqSMzFOpXb61/k7nIys8hoJz3YFhR7vx4y+gdKsw141H14oSW9a+NEFytkeG44AxnL+GCpGBf8Wu5SEDFKYFL50qAzAC2335sYvBuUGQ3D/09pPZLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fkuuwx17; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fkuuwx17"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765535809; x=1797071809;
  h=date:from:cc:subject:message-id:mime-version;
  bh=r/JpO5LBVsw6I8J2SFBcm1AOo6uAqwkMlwHyl6tSzUg=;
  b=fkuuwx17Vxx9CSeyJIM94PRuGQ+R+4+v1RVDoV45H12Y6mklPoxtY6tn
   Gkbklx+8EQq42rT926uXgiTZC2ur66zfnPjY4rhes0MQbmDWv2vfyDaFA
   /I/3sYAT6JhsAa9pvx46UL3qdirDcQ3Hnxjx+cKu53Uo+GF1UgVfMOZSq
   7M4LJnNzMVrCMvRCvlg40TSd49fKydwf4RpqQfY44Zrmw1QQ+GtjbOid+
   18CMjmT35NYO63hC+rc6aGV6+UgVqgG+o93lVkx/1ZOjZtfiaqXLjp+r4
   GoBDF4FeL5VUehUuYJMA1qcoCSjeZ5P7wCxBapS/7N+XfrAzZIIHYhDo0
   A==;
X-CSE-ConnectionGUID: 1xJaVmbySqGwEBsOnKGOJw==
X-CSE-MsgGUID: yTLc1Z7NR+StDVMlZ+8qOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="93002403"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="93002403"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 02:36:48 -0800
X-CSE-ConnectionGUID: WhjZ29N1TCq9O0k8+6TP4A==
X-CSE-MsgGUID: bDfOdrAgQXKSj/989crzfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="197110495"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Dec 2025 02:36:47 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU0Vw-000000005wI-38di;
	Fri, 12 Dec 2025 10:36:44 +0000
Date: Fri, 12 Dec 2025 18:36:31 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: drivers/infiniband/hw/ionic/ionic_datapath.c:902:18: warning:
 conditional expression between different enumeration types ('enum
 ionic_v1_op' and 'enum ionic_v2_op')
Message-ID: <202512121854.oGIYNm5i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Abhijit Gangurde <abhijit.gangurde@amd.com>
CC: Leon Romanovsky <leon@kernel.org>
CC: Allen Hubbe <allen.hubbe@amd.com>

Hi Abhijit,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: 6603fbf158e9a34eb0961579becee377c1efa1ee RDMA/ionic: Add Makefile/Kconfig to kernel build environment
date:   3 months ago
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251212/202512121854.oGIYNm5i-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121854.oGIYNm5i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121854.oGIYNm5i-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/hw/ionic/ionic_datapath.c:902:18: warning: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Wenum-compare-conditional]
     902 |                 wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, SEND);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:905:18: warning: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Wenum-compare-conditional]
     905 |                 wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, SEND_IMM);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:909:18: warning: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Wenum-compare-conditional]
     909 |                 wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, SEND_INV);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:946:18: warning: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Wenum-compare-conditional]
     946 |                 wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, SEND);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:949:18: warning: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Wenum-compare-conditional]
     949 |                 wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, SEND_IMM);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:978:18: warning: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Wenum-compare-conditional]
     978 |                 wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, RDMA_READ);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:983:18: warning: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Wenum-compare-conditional]
     983 |                 wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, RDMA_WRITE);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:986:18: warning: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Wenum-compare-conditional]
     986 |                 wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, RDMA_WRITE_IMM);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:1023:18: warning: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Wenum-compare-conditional]
    1023 |                 wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, ATOMIC_CS);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:1031:18: warning: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Wenum-compare-conditional]
    1031 |                 wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, ATOMIC_FA);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:1066:17: warning: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Wenum-compare-conditional]
    1066 |         wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, LOCAL_INV);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:1101:17: warning: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Wenum-compare-conditional]
    1101 |         wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, REG_MR);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   12 warnings generated.


vim +902 drivers/infiniband/hw/ionic/ionic_datapath.c

b83c62055b6faa Abhijit Gangurde 2025-09-03  885  
b83c62055b6faa Abhijit Gangurde 2025-09-03  886  static int ionic_prep_send(struct ionic_qp *qp,
b83c62055b6faa Abhijit Gangurde 2025-09-03  887  			   const struct ib_send_wr *wr)
b83c62055b6faa Abhijit Gangurde 2025-09-03  888  {
b83c62055b6faa Abhijit Gangurde 2025-09-03  889  	struct ionic_ibdev *dev = to_ionic_ibdev(qp->ibqp.device);
b83c62055b6faa Abhijit Gangurde 2025-09-03  890  	struct ionic_sq_meta *meta;
b83c62055b6faa Abhijit Gangurde 2025-09-03  891  	struct ionic_v1_wqe *wqe;
b83c62055b6faa Abhijit Gangurde 2025-09-03  892  
b83c62055b6faa Abhijit Gangurde 2025-09-03  893  	meta = &qp->sq_meta[qp->sq.prod];
b83c62055b6faa Abhijit Gangurde 2025-09-03  894  	wqe = ionic_queue_at_prod(&qp->sq);
b83c62055b6faa Abhijit Gangurde 2025-09-03  895  
b83c62055b6faa Abhijit Gangurde 2025-09-03  896  	ionic_prep_sq_wqe(qp, wqe);
b83c62055b6faa Abhijit Gangurde 2025-09-03  897  
b83c62055b6faa Abhijit Gangurde 2025-09-03  898  	meta->ibop = IB_WC_SEND;
b83c62055b6faa Abhijit Gangurde 2025-09-03  899  
b83c62055b6faa Abhijit Gangurde 2025-09-03  900  	switch (wr->opcode) {
b83c62055b6faa Abhijit Gangurde 2025-09-03  901  	case IB_WR_SEND:
b83c62055b6faa Abhijit Gangurde 2025-09-03 @902  		wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, SEND);
b83c62055b6faa Abhijit Gangurde 2025-09-03  903  		break;
b83c62055b6faa Abhijit Gangurde 2025-09-03  904  	case IB_WR_SEND_WITH_IMM:
b83c62055b6faa Abhijit Gangurde 2025-09-03  905  		wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, SEND_IMM);
b83c62055b6faa Abhijit Gangurde 2025-09-03  906  		wqe->base.imm_data_key = wr->ex.imm_data;
b83c62055b6faa Abhijit Gangurde 2025-09-03  907  		break;
b83c62055b6faa Abhijit Gangurde 2025-09-03  908  	case IB_WR_SEND_WITH_INV:
b83c62055b6faa Abhijit Gangurde 2025-09-03  909  		wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, SEND_INV);
b83c62055b6faa Abhijit Gangurde 2025-09-03  910  		wqe->base.imm_data_key =
b83c62055b6faa Abhijit Gangurde 2025-09-03  911  			cpu_to_be32(wr->ex.invalidate_rkey);
b83c62055b6faa Abhijit Gangurde 2025-09-03  912  		break;
b83c62055b6faa Abhijit Gangurde 2025-09-03  913  	default:
b83c62055b6faa Abhijit Gangurde 2025-09-03  914  		return -EINVAL;
b83c62055b6faa Abhijit Gangurde 2025-09-03  915  	}
b83c62055b6faa Abhijit Gangurde 2025-09-03  916  
b83c62055b6faa Abhijit Gangurde 2025-09-03  917  	return ionic_prep_common(qp, wr, meta, wqe);
b83c62055b6faa Abhijit Gangurde 2025-09-03  918  }
b83c62055b6faa Abhijit Gangurde 2025-09-03  919  

:::::: The code at line 902 was first introduced by commit
:::::: b83c62055b6faabb444b2f8f3355420927cc39fd RDMA/ionic: Register device ops for datapath

:::::: TO: Abhijit Gangurde <abhijit.gangurde@amd.com>
:::::: CC: Leon Romanovsky <leon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
