Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8574C92;
	Sat, 31 May 2025 00:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748650516; cv=none; b=ADTLiEnia82bioWWs7V32/6YJHWUCRlHRSCiWv5hBAz/9AIfI81csw1PK66uEM1gIMFf3T7MpvJ71S3U1dJzS8sC1g6jAG1xvnGhVPrfjFsKgHV4ZzqzEllDf0BMl+TkzAhHm5aTBgerOZRQG+Dk+YFYfOfqrUw/Huu54sDvuM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748650516; c=relaxed/simple;
	bh=BWKe+y3Iuo2PgnzQZeVjqwtvFZUMAvI5Nmy91OSkjk0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sffUA4tJeuAt/yHI9Cudrr6IUN3I3RXX9jujJmdgkk6GVbi9ifLb9vUPTgbM5jjPlU8+JdH5W4YCx0O7OZk3PEswHplrsVlFvnMIzaLh1Z02HwcS5+fc4F32QAX0ZOPRxGgjCj5WjaZAEIUyWoXuyZDQCQL0YDwG/H+sOG72Bpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cdat5UoL; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cdat5UoL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748650515; x=1780186515;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BWKe+y3Iuo2PgnzQZeVjqwtvFZUMAvI5Nmy91OSkjk0=;
  b=Cdat5UoLpGGhUY4ctJLtDJ1TpCRWdEJHehzNNzISvgu+GcZslTx0HU31
   bFYCXiJKv0ZvY9B+SavAVFtKnTBYLDso07ao/EygQ45fTFDOL/wg8mhgf
   lkQqaxQ+aGH+EjWxS17dI1i1Eq1JVJbTKYa0XbeLoMneVzxDEkqBKet62
   n90UqAP+DCkSaglF5rGhwd6RTLEwEkzHux10Gsfm4dtZQbFcisWSB1UnU
   vianXWYUoATNm2MlsB+ACAGQMRRnH3Da7v+eRWIlFDPFflXxl2eJA7Zrf
   8tb+02rN4Supv5/IDgjo6rk3YVZqLc2oBf47iRFYLrW09Zm3d0rZkExL8
   g==;
X-CSE-ConnectionGUID: 2c6o5BIES4OuJr+NqwwopQ==
X-CSE-MsgGUID: pKhLlDvvTbKoerUA77NqDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="61010042"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="61010042"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 17:15:14 -0700
X-CSE-ConnectionGUID: 9xY5sZOrRsCYnNGZO5cG2w==
X-CSE-MsgGUID: MHvyq1nDSnCAPNZfTwwy4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="144660515"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 May 2025 17:15:13 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uL9sU-000Y4a-11;
	Sat, 31 May 2025 00:15:10 +0000
Date: Sat, 31 May 2025 08:14:35 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:move-drivers 11/16]
 drivers/infiniband/hw/mlx5/ipoib.c:580:8: warning: pointer/integer type
 mismatch in conditional expression ('int' and 'struct sk_buff *')
Message-ID: <202505310825.7wqlfqJo-lkp@intel.com>
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
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250531/202505310825.7wqlfqJo-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505310825.7wqlfqJo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505310825.7wqlfqJo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/infiniband/hw/mlx5/ipoib.c:581:10: error: use of undeclared identifier 'mlx5e_skb_from_cqe_linear'
     581 |                               mlx5e_skb_from_cqe_linear,
         |                               ^
   drivers/infiniband/hw/mlx5/ipoib.c:581:10: error: call to undeclared function 'mlx5e_skb_from_cqe_linear'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   drivers/infiniband/hw/mlx5/ipoib.c:582:10: error: use of undeclared identifier 'mlx5e_skb_from_cqe_nonlinear'; did you mean 'mlx5e_skb_from_cqe_linear'?
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
   drivers/infiniband/hw/mlx5/ipoib.c:582:10: error: call to undeclared function 'mlx5e_skb_from_cqe_nonlinear'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     582 |                               mlx5e_skb_from_cqe_nonlinear,
         |                               ^
>> drivers/infiniband/hw/mlx5/ipoib.c:580:8: warning: pointer/integer type mismatch in conditional expression ('int' and 'struct sk_buff *') [-Wconditional-type-mismatch]
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
   drivers/infiniband/hw/mlx5/ipoib.c:580:6: error: assigning to 'struct sk_buff *' from incompatible type 'void'
     580 |         skb = INDIRECT_CALL_2(rq->wqe.skb_from_cqe,
         |             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     581 |                               mlx5e_skb_from_cqe_linear,
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~
     582 |                               mlx5e_skb_from_cqe_nonlinear,
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     583 |                               rq, wi, cqe, cqe_bcnt);
         |                               ~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 5 errors generated.


vim +580 drivers/infiniband/hw/mlx5/ipoib.c

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
   581				      mlx5e_skb_from_cqe_linear,
   582				      mlx5e_skb_from_cqe_nonlinear,
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
