Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFF825E828;
	Wed,  7 May 2025 12:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746619618; cv=none; b=E5ywFyQqOhSApTHwevxK2ropG0KGcKZAe0R93E7Zturr+/P3b/lWMSX5EFNtGp0zp/wwLjreMDuk0ZF+hHkZZzIcfvD950GdPO1QWQEiAaCnM+aAEqGYzpFslXlUAW5/NwX66tG7Be9tNtMxQkdV1ohnbH1iMLof1pK2prGUisU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746619618; c=relaxed/simple;
	bh=oOoppb62PQ4xraIkA9sXFx2EHtxHdAikQDEjmQ8i2oU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uFSipYn/ERfNTrfAHL2Ke+OaExJTS/3CVlEUGrkKkLdXhEuUbos1ubkgqh1f/LUtTXjprEDE6yETTB/KafpO/LoarEZBSykq2b+Ndw7QLA8mJYnMYDZMlQ2V38A1VwFx7kBOno3pqDblNf5pg4IH2UcDWdWfrbc30o0v4R9wqtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fWdgst08; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fWdgst08"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746619617; x=1778155617;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oOoppb62PQ4xraIkA9sXFx2EHtxHdAikQDEjmQ8i2oU=;
  b=fWdgst08zi0pq52F1Ofk9+vZf0rze7iay1nshwn5GslpEER8gR6Ivn9A
   lFEkeVMc/iuHzjXpq65tBz/D0ns1VjHHz9SDeHneotnRHCFH25BHHiOTl
   lsosyTpXLgwqm+MDC5vHd2XoSvuzc21tfguzXeBFDyPKaaUEmI9dAxRp1
   M023XILN3+719spNAS+Z0WvbOZuXl7HRzJe0unQLcdJ904Az7jbABrKNP
   DdVgPYLjBv15bpV2YUAb3G/RVxW8cf2sDDnHXHW0IJ2ACf0whd9kgsLcT
   GPjwoEwyTXZ2GdjIh5RGMlPpBU0sJvsiIp9KlU4SlMrYGuPSulB0AogIA
   A==;
X-CSE-ConnectionGUID: ZyD/5h/mSkyFFmGOTb4nhg==
X-CSE-MsgGUID: t9vNmUggSiK/hA+KP6PUmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="58541807"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="58541807"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 05:06:56 -0700
X-CSE-ConnectionGUID: qk9P2QjsTSeJSqhGWoPnZA==
X-CSE-MsgGUID: 6xQvtvMMRae34H0jNAHM8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="136450457"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 May 2025 05:05:34 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCdWl-0007kD-2G;
	Wed, 07 May 2025 12:05:31 +0000
Date: Wed, 7 May 2025 20:04:55 +0800
From: kernel test robot <lkp@intel.com>
To: Tanmay Jagdale <tanmay@marvell.com>, bbrezillon@kernel.org,
	arno@natisbad.org, schalla@marvell.com, herbert@gondor.apana.org.au,
	davem@davemloft.net, sgoutham@marvell.com, lcherian@marvell.com,
	gakula@marvell.com, jerinj@marvell.com, hkelam@marvell.com,
	sbhatta@marvell.com, andrew+netdev@lunn.ch, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, bbhushan2@marvell.com,
	bhelgaas@google.com, pstanner@redhat.com,
	gregkh@linuxfoundation.org, linux@treblig.org,
	krzysztof.kozlowski@linaro.org, giovanni.cabiddu@intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, rkannoth@marvell.com, sumang@marvell.com,
	gcherian@marvell.com, Tanmay Jagdale <tanmay@marvell.com>
Subject: Re: [net-next PATCH v1 11/15] octeontx2-pf: ipsec: Handle NPA
 threshold interrupt
Message-ID: <202505071904.TWc5095k-lkp@intel.com>
References: <20250502132005.611698-12-tanmay@marvell.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502132005.611698-12-tanmay@marvell.com>

Hi Tanmay,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Tanmay-Jagdale/crypto-octeontx2-Share-engine-group-info-with-AF-driver/20250502-213203
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250502132005.611698-12-tanmay%40marvell.com
patch subject: [net-next PATCH v1 11/15] octeontx2-pf: ipsec: Handle NPA threshold interrupt
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250507/202505071904.TWc5095k-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071904.TWc5095k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071904.TWc5095k-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/marvell/octeontx2/nic/cn10k_ipsec.c:488:6: warning: variable 'pool' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     488 |         if (err)
         |             ^~~
   drivers/net/ethernet/marvell/octeontx2/nic/cn10k_ipsec.c:512:23: note: uninitialized use occurs here
     512 |         qmem_free(pfvf->dev, pool->stack);
         |                              ^~~~
   drivers/net/ethernet/marvell/octeontx2/nic/cn10k_ipsec.c:488:2: note: remove the 'if' if its condition is always false
     488 |         if (err)
         |         ^~~~~~~~
     489 |                 goto pool_fail;
         |                 ~~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/octeontx2/nic/cn10k_ipsec.c:466:24: note: initialize the variable 'pool' to silence this warning
     466 |         struct otx2_pool *pool;
         |                               ^
         |                                = NULL
>> drivers/net/ethernet/marvell/octeontx2/nic/cn10k_ipsec.c:528:20: warning: variable 'qset' set but not used [-Wunused-but-set-variable]
     528 |         struct otx2_qset *qset = NULL;
         |                           ^
>> drivers/net/ethernet/marvell/octeontx2/nic/cn10k_ipsec.c:591:8: warning: variable 'ptr' set but not used [-Wunused-but-set-variable]
     591 |         void *ptr;
         |               ^
   3 warnings generated.


vim +/qset +528 drivers/net/ethernet/marvell/octeontx2/nic/cn10k_ipsec.c

   521	
   522	static void cn10k_ipsec_npa_refill_inb_ipsecq(struct work_struct *work)
   523	{
   524		struct cn10k_ipsec *ipsec = container_of(work, struct cn10k_ipsec,
   525							 refill_npa_inline_ipsecq);
   526		struct otx2_nic *pfvf = container_of(ipsec, struct otx2_nic, ipsec);
   527		struct otx2_pool *pool = NULL;
 > 528		struct otx2_qset *qset = NULL;
   529		u64 val, *ptr, op_int = 0, count;
   530		int err, pool_id, idx;
   531		dma_addr_t bufptr;
   532	
   533		qset = &pfvf->qset;
   534	
   535		val = otx2_read64(pfvf, NPA_LF_QINTX_INT(0));
   536		if (!(val & 1))
   537			return;
   538	
   539		ptr = otx2_get_regaddr(pfvf, NPA_LF_AURA_OP_INT);
   540		val = otx2_atomic64_add(((u64)pfvf->ipsec.inb_ipsec_pool << 44), ptr);
   541	
   542		/* Error interrupt bits */
   543		if (val & 0xff)
   544			op_int = (val & 0xff);
   545	
   546		/* Refill buffers on a Threshold interrupt */
   547		if (val & (1 << 16)) {
   548			/* Get the current number of buffers consumed */
   549			ptr = otx2_get_regaddr(pfvf, NPA_LF_AURA_OP_CNT);
   550			count = otx2_atomic64_add(((u64)pfvf->ipsec.inb_ipsec_pool << 44), ptr);
   551			count &= GENMASK_ULL(35, 0);
   552	
   553			/* Refill */
   554			pool_id = pfvf->ipsec.inb_ipsec_pool;
   555			pool = &pfvf->qset.pool[pool_id];
   556	
   557			for (idx = 0; idx < count; idx++) {
   558				err = otx2_alloc_rbuf(pfvf, pool, &bufptr, pool_id, idx);
   559				if (err) {
   560					netdev_err(pfvf->netdev,
   561						   "Insufficient memory for IPsec pool buffers\n");
   562					break;
   563				}
   564				pfvf->hw_ops->aura_freeptr(pfvf, pool_id,
   565							    bufptr + OTX2_HEAD_ROOM);
   566			}
   567	
   568			op_int |= (1 << 16);
   569		}
   570	
   571		/* Clear/ACK Interrupt */
   572		if (op_int)
   573			otx2_write64(pfvf, NPA_LF_AURA_OP_INT,
   574				     ((u64)pfvf->ipsec.inb_ipsec_pool << 44) | op_int);
   575	}
   576	
   577	static irqreturn_t cn10k_ipsec_npa_inb_ipsecq_intr_handler(int irq, void *data)
   578	{
   579		struct otx2_nic *pf = data;
   580	
   581		schedule_work(&pf->ipsec.refill_npa_inline_ipsecq);
   582	
   583		return IRQ_HANDLED;
   584	}
   585	
   586	static int cn10k_inb_cpt_init(struct net_device *netdev)
   587	{
   588		struct otx2_nic *pfvf = netdev_priv(netdev);
   589		int ret = 0, vec;
   590		char *irq_name;
 > 591		void *ptr;
   592		u64 val;
   593	
   594		ret = cn10k_ipsec_setup_nix_rx_hw_resources(pfvf);
   595		if (ret) {
   596			netdev_err(netdev, "Failed to setup NIX HW resources for IPsec\n");
   597			return ret;
   598		}
   599	
   600		/* Work entry for refilling the NPA queue for ingress inline IPSec */
   601		INIT_WORK(&pfvf->ipsec.refill_npa_inline_ipsecq,
   602			  cn10k_ipsec_npa_refill_inb_ipsecq);
   603	
   604		/* Register NPA interrupt */
   605		vec = pfvf->hw.npa_msixoff;
   606		irq_name = &pfvf->hw.irq_name[vec * NAME_SIZE];
   607		snprintf(irq_name, NAME_SIZE, "%s-npa-qint", pfvf->netdev->name);
   608	
   609		ret = request_irq(pci_irq_vector(pfvf->pdev, vec),
   610				  cn10k_ipsec_npa_inb_ipsecq_intr_handler, 0,
   611				  irq_name, pfvf);
   612		if (ret) {
   613			dev_err(pfvf->dev,
   614				"RVUPF%d: IRQ registration failed for NPA QINT%d\n",
   615				rvu_get_pf(pfvf->pcifunc), 0);
   616			return ret;
   617		}
   618	
   619		/* Enable NPA threshold interrupt */
   620		ptr = otx2_get_regaddr(pfvf, NPA_LF_AURA_OP_INT);
   621		val = BIT_ULL(43) | BIT_ULL(17);
   622		otx2_write64(pfvf, NPA_LF_AURA_OP_INT,
   623			     ((u64)pfvf->ipsec.inb_ipsec_pool << 44) | val);
   624	
   625		/* Enable interrupt */
   626		otx2_write64(pfvf, NPA_LF_QINTX_ENA_W1S(0), BIT_ULL(0));
   627	
   628		return ret;
   629	}
   630	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
