Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387EA7262C;
	Sat, 31 May 2025 06:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748673705; cv=none; b=ImEGI4ep+T2wMgLsEdKbCoLfu5P5nv5wnlDoa7LMX2OWtc3klHfaHl6XPxs1iGPCrOxB3dbMDlPvb8vuikc79oDwec+KozafgH8lrA7PUK9VPArCG+RZf6nMbv2svqA7JAL0RgASFnSfm9XldDDpatZ/zDkoMLJ6QInK0F3WsN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748673705; c=relaxed/simple;
	bh=lBb13S2SzPhMhNfaCdrNwWGzCk2pCC1247zEuFJ4RT0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sbeiz3EXPdpl7/kIeDfV0SvjNWINaRvRKaQ748kHFcQAByT4ghq35rm7I4wvI9i1fK16GcFV7gWZrSqlWSoh+Vutb01SC6isVmJDUdzo/NSmLYv7XfMn3uA8A4p4E5Fe5OT2YJJ8G0qKW9CtcRFPafKDjH8DbCc9jwxKXgcUVUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MFhAJC+3; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MFhAJC+3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748673703; x=1780209703;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lBb13S2SzPhMhNfaCdrNwWGzCk2pCC1247zEuFJ4RT0=;
  b=MFhAJC+3IuqBSyCfS0nA+h+m8Jx72y8eS0vAll7Lv3Ic5QoPV0ygY4io
   W6aLzzHw9Ha//hOYh/FTF579AKUvsIDtGqZr0TxHkEqRpv3SlpBYrvlTg
   Z9dcY035UVlJVCxfBhKgXGqSCxZq5nbhtl69Z4nLP9ssZQclkEsqD21dC
   I5qnGbnd6sdCZhwTeSzbp9sDp2j611tjE6uh4KRRIs34XkyfgvYyAojjq
   cy0zNB6rDBy3HNSxcFd5g+vE/2sm1h3kjpHUPg1STBM+Uxea6trZhUEYF
   pigDfIiAZi+Vh57ht8+8BFOXiZdMonV+ulX/qoxAeHs9qx/Gm7iExyLkA
   w==;
X-CSE-ConnectionGUID: q+ysJMwVRpqbSFp49vSjKg==
X-CSE-MsgGUID: he+CWn2gSpKHj+bcO/R5mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="62109299"
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; 
   d="scan'208";a="62109299"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 23:41:42 -0700
X-CSE-ConnectionGUID: T9DkoL9DR0CoGedyvGRXxA==
X-CSE-MsgGUID: eePjs6eLTNOBHb1bVFwCvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; 
   d="scan'208";a="144043109"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 30 May 2025 23:41:41 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLFuU-000YF6-24;
	Sat, 31 May 2025 06:41:38 +0000
Date: Sat, 31 May 2025 14:41:05 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:move-drivers 11/16]
 drivers/infiniband/hw/mlx5/ipoib.c:581:10: error: use of undeclared
 identifier 'mlx5e_skb_from_cqe_linear'
Message-ID: <202505311416.2NUNk5bO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git move-drivers
head:   59b028d17e1dc229f52b9c2081b90fbb11798b27
commit: 7e94a32c6f4e8a718894671b0bf624bee281d605 [11/16] RDMA/mlx5: Move IPoIB to relevant subsystem
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250531/202505311416.2NUNk5bO-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505311416.2NUNk5bO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505311416.2NUNk5bO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/infiniband/hw/mlx5/ipoib.c:581:10: error: use of undeclared identifier 'mlx5e_skb_from_cqe_linear'
     581 |                               mlx5e_skb_from_cqe_linear,
         |                               ^
>> drivers/infiniband/hw/mlx5/ipoib.c:581:10: error: call to undeclared function 'mlx5e_skb_from_cqe_linear'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>> drivers/infiniband/hw/mlx5/ipoib.c:582:10: error: use of undeclared identifier 'mlx5e_skb_from_cqe_nonlinear'; did you mean 'mlx5e_skb_from_cqe_linear'?
     582 |                               mlx5e_skb_from_cqe_nonlinear,
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                               mlx5e_skb_from_cqe_linear
   include/linux/indirect_call_wrapper.h:24:26: note: expanded from macro 'INDIRECT_CALL_2'
      24 |                                   INDIRECT_CALL_1(f, f1, __VA_ARGS__);  \
         |                                                      ^
   include/linux/indirect_call_wrapper.h:19:15: note: expanded from macro 'INDIRECT_CALL_1'
      19 |                 likely(f == f1) ? f1(__VA_ARGS__) : f(__VA_ARGS__);     \
         |                             ^
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   drivers/infiniband/hw/mlx5/ipoib.c:581:10: note: 'mlx5e_skb_from_cqe_linear' declared here
     581 |                               mlx5e_skb_from_cqe_linear,
         |                               ^
>> drivers/infiniband/hw/mlx5/ipoib.c:582:10: error: call to undeclared function 'mlx5e_skb_from_cqe_nonlinear'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     582 |                               mlx5e_skb_from_cqe_nonlinear,
         |                               ^
   drivers/infiniband/hw/mlx5/ipoib.c:580:8: warning: pointer/integer type mismatch in conditional expression ('int' and 'struct sk_buff *') [-Wconditional-type-mismatch]
     580 |         skb = INDIRECT_CALL_2(rq->wqe.skb_from_cqe,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     581 |                               mlx5e_skb_from_cqe_linear,
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~
     582 |                               mlx5e_skb_from_cqe_nonlinear,
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     583 |                               rq, wi, cqe, cqe_bcnt);
         |                               ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/indirect_call_wrapper.h:24:7: note: expanded from macro 'INDIRECT_CALL_2'
      24 |                                   INDIRECT_CALL_1(f, f1, __VA_ARGS__);  \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/indirect_call_wrapper.h:19:19: note: expanded from macro 'INDIRECT_CALL_1'
      19 |                 likely(f == f1) ? f1(__VA_ARGS__) : f(__VA_ARGS__);     \
         |                                 ^ ~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~
>> drivers/infiniband/hw/mlx5/ipoib.c:580:6: error: assigning to 'struct sk_buff *' from incompatible type 'void'
     580 |         skb = INDIRECT_CALL_2(rq->wqe.skb_from_cqe,
         |             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     581 |                               mlx5e_skb_from_cqe_linear,
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~
     582 |                               mlx5e_skb_from_cqe_nonlinear,
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     583 |                               rq, wi, cqe, cqe_bcnt);
         |                               ~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 5 errors generated.


vim +/mlx5e_skb_from_cqe_linear +581 drivers/infiniband/hw/mlx5/ipoib.c

   562	
   563	static void mlx5i_handle_rx_cqe(struct mlx5e_rq *rq, struct mlx5_cqe64 *cqe)
   564	{
   565		struct mlx5_wq_cyc *wq = &rq->wqe.wq;
   566		struct mlx5e_wqe_frag_info *wi;
   567		struct sk_buff *skb;
   568		u32 cqe_bcnt;
   569		u16 ci;
   570	
   571		ci       = mlx5_wq_cyc_ctr2ix(wq, be16_to_cpu(cqe->wqe_counter));
   572		wi       = mlx5e_get_frag(rq, ci);
   573		cqe_bcnt = be32_to_cpu(cqe->byte_cnt);
   574	
   575		if (unlikely(MLX5E_RX_ERR_CQE(cqe))) {
   576			rq->stats->wqe_err++;
   577			goto wq_cyc_pop;
   578		}
   579	
 > 580		skb = INDIRECT_CALL_2(rq->wqe.skb_from_cqe,
 > 581				      mlx5e_skb_from_cqe_linear,
 > 582				      mlx5e_skb_from_cqe_nonlinear,
   583				      rq, wi, cqe, cqe_bcnt);
   584		if (!skb)
   585			goto wq_cyc_pop;
   586	
   587		mlx5i_complete_rx_cqe(rq, cqe, cqe_bcnt, skb);
   588		if (unlikely(!skb->dev)) {
   589			dev_kfree_skb_any(skb);
   590			goto wq_cyc_pop;
   591		}
   592		napi_gro_receive(rq->cq.napi, skb);
   593	
   594	wq_cyc_pop:
   595		mlx5_wq_cyc_pop(wq);
   596	}
   597	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
