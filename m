Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C57A192B87;
	Thu, 12 Sep 2024 14:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726152809; cv=none; b=iSQnDMJSXL52PTxSC6CYUb+dVyE+V5Ti915Zt7+sa2PHVmOs0OpgG5+6YvSyM5jED2fgHv1tC3d1C1U4+V6Ok9s1jucyiZ2iR5PNLZHYQONkadfhbmohVK1v4Ne+EyBSl9BMJ9EwRwlZFuDiP6fo7y84hxx+yDXoDZOFBJWzfTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726152809; c=relaxed/simple;
	bh=Ir6bsvEBFvV/dC1nZnquTHz8L5rusomkLn+29VJYOsc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GX6EV7sASI2vNqjxx5sRn6TEm54al52lBX97mrEFfE/7a21kdb7tEgdSdjj5VRpLH6eIYBe/RV5i71mJFrEeEQNUk2FOAWLmc8svkeU3yoJBMJSF3OUbmN1nr8wN3oSVdJos4AtKibHtdys6Udf+s7352Hxc2cuGn5vO0uADSAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WqTxmmkU; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WqTxmmkU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726152807; x=1757688807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ir6bsvEBFvV/dC1nZnquTHz8L5rusomkLn+29VJYOsc=;
  b=WqTxmmkUFuULi+WPjTqFfKL5FMrRQoe0anlcHW99MbpMARW6bV6/ZryJ
   QXO8dB1/IYpDyKj/8dnEsN2Iqscw5iwql8gc9JmPAXwb3DwBNoTWQ+bBi
   2h/Hp7rXmH1jolIqDUp74nVq6v6RWaVKTyuFKpppbGk5Yw1uudV0GXCM4
   i5ZpzKniLcm4WbBPVWt68ASq7A7fFrMwL9Xt8o9UZ83zhdqfXZVGEcGrG
   2cvQwG+3tluuh/qmz4NdVRD9rEF01piZtlUx9FU9leZsw12iTdzFGDjRn
   49U1dUbSQUSLfUADkOjo1ze7nA4sDGX18ITFl1uzl6XirQSWJkaZA6cpm
   w==;
X-CSE-ConnectionGUID: lsxTKbJoT/Kdh3nuoJIKpg==
X-CSE-MsgGUID: nCUr0VR5RXOEyZwt0UXn3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="35678461"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="35678461"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 07:53:05 -0700
X-CSE-ConnectionGUID: wtKoXXQfRXWzfHxSG0m6eg==
X-CSE-MsgGUID: aoaCo78cQ0GJDRisKYHJWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="72543930"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Sep 2024 07:53:04 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1solBt-0005Io-0U;
	Thu, 12 Sep 2024 14:53:01 +0000
Date: Thu, 12 Sep 2024 22:52:30 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chaitanya Kulkarni <kch@nvidia.com>
Subject: [leon-rdma:dma-split-wip 25/26] drivers/nvme/host/pci.c:732:18:
 warning: result of comparison of constant 512 with expression of type 'u8'
 (aka 'unsigned char') is always false
Message-ID: <202409122256.Gjz9KnCP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dma-split-wip
head:   63cdbb87e1b08464705fa343b65e561eb3abd5f9
commit: dd0782c9fcb73487b60939a11f381411464f0572 [25/26] nvme-pci: use new dma API
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240912/202409122256.Gjz9KnCP-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240912/202409122256.Gjz9KnCP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409122256.Gjz9KnCP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvme/host/pci.c:732:18: warning: result of comparison of constant 512 with expression of type 'u8' (aka 'unsigned char') is always false [-Wtautological-constant-out-of-range-compare]
     732 |         WARN_ON(entries > 512);
         |                 ~~~~~~~ ^ ~~~
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   1 warning generated.


vim +732 drivers/nvme/host/pci.c

   705	
   706	static blk_status_t nvme_pci_setup_pool(struct nvme_dev *dev,
   707						struct request *req, bool is_sgl)
   708	{
   709		struct nvme_iod *iod = blk_mq_rq_to_pdu(req);
   710		struct dma_pool *pool;
   711		size_t entry_sz;
   712		dma_addr_t addr;
   713		u8 entries;
   714		void *list;
   715	
   716		if (iod->nr_dmas <= 2)
   717			/* Do nothing, we can use the inline PRP/SG list */
   718			return BLK_STS_OK;
   719	
   720		/* First DMA address goes to prp1 anyway */
   721		entries = iod->nr_dmas - 1;
   722		entry_sz = (is_sgl) ? sizeof(struct nvme_sgl_desc) : sizeof(__le64);
   723		if (entries <= (256 / entry_sz)) {
   724			pool = dev->prp_small_pool;
   725			iod->nr_allocations = 0;
   726		} else {
   727			pool = dev->prp_page_pool;
   728			iod->nr_allocations = 1;
   729		}
   730	
   731		/* TBD: allocate mulitple pools and chain them */
 > 732		WARN_ON(entries > 512);
   733	
   734		list = dma_pool_alloc(pool, GFP_ATOMIC, &addr);
   735		if (!list) {
   736			iod->nr_allocations = -1;
   737			return BLK_STS_RESOURCE;
   738		}
   739	
   740		if (is_sgl)
   741			iod->list[0].sg_list = list;
   742		else
   743			iod->list[0].prp_list = list;
   744		iod->first_dma = addr;
   745		return BLK_STS_OK;
   746	}
   747	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
