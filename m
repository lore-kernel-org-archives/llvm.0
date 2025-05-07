Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BAE289359;
	Wed,  7 May 2025 13:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746623326; cv=none; b=SJ06VuN0su2J5VSbwBXyp6Mb9DKNZoArdmi6ZH5LbpXq7/AUYmxuGnZdsxUoxjFy714weo24KZueFJdHOIVtbaoo11UL0z31Jvwxo6rrwWM6DfgO+MQCx8BXXoCpu2Z3l8SvM7/DTbs1RfaAGr9eIXjGW1Gv4u/ZoObhHgHgMXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746623326; c=relaxed/simple;
	bh=0V6PsA6OKEUwAIFmKPDnV9GnyRDcR5icGG8yoibio3w=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rjEmSvn6OThxn+1IeMmGhDUe4ZhDUWBt/SAC6r6mD+6Z0wxnR/XoFqb8DUXjqHlPmT39sVBBxtWSGtF3sQQvpEDxinFsWjnIeapbNauIqKx5O6GQ/4RoTW/L0R/m4WPKdxUUfXgUJkZ7nph4wZRMovhmR03gKM6Xeo76PJzCBb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EH30KePZ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EH30KePZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746623324; x=1778159324;
  h=date:from:cc:subject:message-id:mime-version;
  bh=0V6PsA6OKEUwAIFmKPDnV9GnyRDcR5icGG8yoibio3w=;
  b=EH30KePZhkk2jJHyyjkurEv4F8UaAwKZV4lPaSkDIHYcGIR6ui6olBvA
   9ogDh5k87LfHBa/qjs4fkN3NNX164eiGl3UkZlRhQng4Ti6300/8eLrFX
   PYWXXSpXl/oTaSJh4PJrDHY8c8uIDSJNT5AJhT++MvLVkMNxd7BWyFU+n
   U8kcZRYvrNdv3pacp9M2hmtRj2LaqBCvnCnBMWBvPTYTpQb0k3JIlsEow
   rxlzJymXVPuNG65bW1Um/hBd+NRDPl3/W4FWrCuJp8TYosFut6I2v1slg
   79wY8VpPv2e166bjzCkalxA3RMxBOLMh0Lr12uFprCLT4/1i67XxBDgxd
   w==;
X-CSE-ConnectionGUID: kdMFlAlpQhqEYyb0GXIOmg==
X-CSE-MsgGUID: sYoTIjcnQ4yauJB3OeuIuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48464751"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48464751"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 06:08:38 -0700
X-CSE-ConnectionGUID: 66ssoZaMRru29laYE60TKw==
X-CSE-MsgGUID: rRm+V/osQGK694Dq2cJRAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="140907168"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 May 2025 06:08:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCeVm-0007q1-2J;
	Wed, 07 May 2025 13:08:34 +0000
Date: Wed, 7 May 2025 21:08:15 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH 14/14] RDMA/ionic: Add Makefile/Kconfig to kernel build
 environment
Message-ID: <202505072012.NkkKd0ba-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <20250423102913.438027-15-abhijit.gangurde@amd.com>
References: <20250423102913.438027-15-abhijit.gangurde@amd.com>
TO: Abhijit Gangurde <abhijit.gangurde@amd.com>
TO: shannon.nelson@amd.com
TO: brett.creeley@amd.com
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: corbet@lwn.net
TO: jgg@ziepe.ca
TO: leon@kernel.org
TO: andrew+netdev@lunn.ch
CC: allen.hubbe@amd.com
CC: nikhil.agarwal@amd.com
CC: linux-rdma@vger.kernel.org
CC: netdev@vger.kernel.org
CC: linux-doc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Abhijit Gangurde <abhijit.gangurde@amd.com>

Hi Abhijit,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]
[also build test WARNING on net/main linus/master v6.15-rc5 next-20250507]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abhijit-Gangurde/net-ionic-Rename-neqs_per_lif-to-reflect-rdma-capability/20250423-185723
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250423102913.438027-15-abhijit.gangurde%40amd.com
patch subject: [PATCH 14/14] RDMA/ionic: Add Makefile/Kconfig to kernel build environment
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250507/202505072012.NkkKd0ba-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505072012.NkkKd0ba-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505072012.NkkKd0ba-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/hw/ionic/ionic_datapath.c:898:18: warning: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Wenum-compare-conditional]
     898 |                 wqe->base.op = IONIC_OP(dev->rdma_version, SEND);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:901:18: warning: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Wenum-compare-conditional]
     901 |                 wqe->base.op = IONIC_OP(dev->rdma_version, SEND_IMM);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:905:18: warning: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Wenum-compare-conditional]
     905 |                 wqe->base.op = IONIC_OP(dev->rdma_version, SEND_INV);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:942:18: warning: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Wenum-compare-conditional]
     942 |                 wqe->base.op = IONIC_OP(dev->rdma_version, SEND);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:945:18: warning: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Wenum-compare-conditional]
     945 |                 wqe->base.op = IONIC_OP(dev->rdma_version, SEND_IMM);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:974:18: warning: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Wenum-compare-conditional]
     974 |                 wqe->base.op = IONIC_OP(dev->rdma_version, RDMA_READ);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:979:18: warning: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Wenum-compare-conditional]
     979 |                 wqe->base.op = IONIC_OP(dev->rdma_version, RDMA_WRITE);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:982:18: warning: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Wenum-compare-conditional]
     982 |                 wqe->base.op = IONIC_OP(dev->rdma_version, RDMA_WRITE_IMM);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:1019:18: warning: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Wenum-compare-conditional]
    1019 |                 wqe->base.op = IONIC_OP(dev->rdma_version, ATOMIC_CS);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:1027:18: warning: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Wenum-compare-conditional]
    1027 |                 wqe->base.op = IONIC_OP(dev->rdma_version, ATOMIC_FA);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:1062:17: warning: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Wenum-compare-conditional]
    1062 |         wqe->base.op = IONIC_OP(dev->rdma_version, LOCAL_INV);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:1097:17: warning: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Wenum-compare-conditional]
    1097 |         wqe->base.op = IONIC_OP(dev->rdma_version, REG_MR);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   12 warnings generated.


vim +898 drivers/infiniband/hw/ionic/ionic_datapath.c

0c894fc5e53316 Abhijit Gangurde 2025-04-23  881  
0c894fc5e53316 Abhijit Gangurde 2025-04-23  882  static int ionic_prep_send(struct ionic_qp *qp,
0c894fc5e53316 Abhijit Gangurde 2025-04-23  883  			   const struct ib_send_wr *wr)
0c894fc5e53316 Abhijit Gangurde 2025-04-23  884  {
0c894fc5e53316 Abhijit Gangurde 2025-04-23  885  	struct ionic_ibdev *dev = to_ionic_ibdev(qp->ibqp.device);
0c894fc5e53316 Abhijit Gangurde 2025-04-23  886  	struct ionic_sq_meta *meta;
0c894fc5e53316 Abhijit Gangurde 2025-04-23  887  	struct ionic_v1_wqe *wqe;
0c894fc5e53316 Abhijit Gangurde 2025-04-23  888  
0c894fc5e53316 Abhijit Gangurde 2025-04-23  889  	meta = &qp->sq_meta[qp->sq.prod];
0c894fc5e53316 Abhijit Gangurde 2025-04-23  890  	wqe = ionic_queue_at_prod(&qp->sq);
0c894fc5e53316 Abhijit Gangurde 2025-04-23  891  
0c894fc5e53316 Abhijit Gangurde 2025-04-23  892  	ionic_prep_sq_wqe(qp, wqe);
0c894fc5e53316 Abhijit Gangurde 2025-04-23  893  
0c894fc5e53316 Abhijit Gangurde 2025-04-23  894  	meta->ibop = IB_WC_SEND;
0c894fc5e53316 Abhijit Gangurde 2025-04-23  895  
0c894fc5e53316 Abhijit Gangurde 2025-04-23  896  	switch (wr->opcode) {
0c894fc5e53316 Abhijit Gangurde 2025-04-23  897  	case IB_WR_SEND:
0c894fc5e53316 Abhijit Gangurde 2025-04-23 @898  		wqe->base.op = IONIC_OP(dev->rdma_version, SEND);
0c894fc5e53316 Abhijit Gangurde 2025-04-23  899  		break;
0c894fc5e53316 Abhijit Gangurde 2025-04-23  900  	case IB_WR_SEND_WITH_IMM:
0c894fc5e53316 Abhijit Gangurde 2025-04-23  901  		wqe->base.op = IONIC_OP(dev->rdma_version, SEND_IMM);
0c894fc5e53316 Abhijit Gangurde 2025-04-23  902  		wqe->base.imm_data_key = wr->ex.imm_data;
0c894fc5e53316 Abhijit Gangurde 2025-04-23  903  		break;
0c894fc5e53316 Abhijit Gangurde 2025-04-23  904  	case IB_WR_SEND_WITH_INV:
0c894fc5e53316 Abhijit Gangurde 2025-04-23  905  		wqe->base.op = IONIC_OP(dev->rdma_version, SEND_INV);
0c894fc5e53316 Abhijit Gangurde 2025-04-23  906  		wqe->base.imm_data_key =
0c894fc5e53316 Abhijit Gangurde 2025-04-23  907  			cpu_to_be32(wr->ex.invalidate_rkey);
0c894fc5e53316 Abhijit Gangurde 2025-04-23  908  		break;
0c894fc5e53316 Abhijit Gangurde 2025-04-23  909  	default:
0c894fc5e53316 Abhijit Gangurde 2025-04-23  910  		return -EINVAL;
0c894fc5e53316 Abhijit Gangurde 2025-04-23  911  	}
0c894fc5e53316 Abhijit Gangurde 2025-04-23  912  
0c894fc5e53316 Abhijit Gangurde 2025-04-23  913  	return ionic_prep_common(qp, wr, meta, wqe);
0c894fc5e53316 Abhijit Gangurde 2025-04-23  914  }
0c894fc5e53316 Abhijit Gangurde 2025-04-23  915  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
