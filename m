Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06DC3A7F4C;
	Fri, 20 Mar 2026 11:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774005994; cv=none; b=V7ylmswWkc4U4EloUdZ69o+hRqn8d9ifhEFVswiQFojqK7R0jVbPdBoReqPdbCU7ep29Sl1wBzKHr47+TBLIX/1Mx8Hai9Db0DBNvFvQIpW5eK74EEM00X3xRBf2pdhcGc2EXliOhCsHlLdquYiuOvUIceGdOKk1cLRp3tTAv6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774005994; c=relaxed/simple;
	bh=S9kyTw6v4Hvvnd2vtU8jxbZDobP6TI13uDpyigbSNUQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rh64txzdnkBdY/5IQ70Du2XUowWHrUIxAFN8B6ia9SfFxmgqVfEbdL18z6gLMHBbqXWC8xbVYCUKnBQNb/hG83neNTSuoOri6JUxqteR2FnZxzxRlWBK1Wrn/UrdWKGfuK4JNa+d53qX08CdS5xjN9hLJEviIxs/D+wMkIV4YAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b66FINKY; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b66FINKY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774005991; x=1805541991;
  h=date:from:to:cc:subject:message-id;
  bh=S9kyTw6v4Hvvnd2vtU8jxbZDobP6TI13uDpyigbSNUQ=;
  b=b66FINKYqTfElrjYibjWKEa6qDottd+v6GgOuBZdfJxPeWuu7Q3KMHRs
   MWp+kwlJpmYajthM5/hGwfilh7W9LtrFhxmOytccwcrkknmGi7XaV7U7o
   UImoWut5CayyjUfRFYoGHrHE+JBi0M3iUB+JW3AvFuQVJsikXvtc/RQL1
   S+07jq5/BshzjNCcSxt59kEQr1Ti7ImSi0HxGoUY0NVkqyTpYK/sDNxbb
   DRypgHFXO+NplUfBaHsxUk6xnCRPpLYVgMW57BrD3xLFc7vY0MP/yCaYV
   09iZzEIAAiJ/XPEunYze0MO/lnKNqREUCalSYVTKaULII++VQQTPEpMQv
   g==;
X-CSE-ConnectionGUID: /iT6faliT+W6FWVcyu6IgQ==
X-CSE-MsgGUID: UUOsJOjYSdaJiYZbbpD8hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="100543761"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="100543761"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 04:25:56 -0700
X-CSE-ConnectionGUID: DZu7TnBDRKGQLo7HNJd67Q==
X-CSE-MsgGUID: mTWEXM1tSReEShQfv2+WOQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 20 Mar 2026 04:25:53 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3XzD-000000002In-0dA4;
	Fri, 20 Mar 2026 11:25:51 +0000
Date: Fri, 20 Mar 2026 19:21:48 +0800
From: kernel test robot <lkp@intel.com>
To: Konstantin Taranov <kotaranov@microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Doug Ledford <dledford@redhat.com>,
 Jason Gunthorpe <jgg+lists@ziepe.ca>, linux-rdma@vger.kernel.org,
 Leon Romanovsky <leon@kernel.org>
Subject: [rdma:wip/leon-for-next 47/53]
 drivers/infiniband/hw/mana/main.c:696:3: error: expected ')'
Message-ID: <202603201909.6pvOE0KP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git wip/leon-for-next
head:   90b7abe25ce9b8ea6b97c534cb0f037155013bb8
commit: 684603da1e156756affe3a9f6070428d72dcf944 [47/53] RDMA/mana_ib: cleanup the usage of mana_gd_send_request()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260320/202603201909.6pvOE0KP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603201909.6pvOE0KP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603201909.6pvOE0KP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/infiniband/hw/mana/main.c:696:3: error: expected ')'
     696 |                 return err;
         |                 ^
   drivers/infiniband/hw/mana/main.c:695:5: note: to match this '('
     695 |         if (err
         |            ^
   1 error generated.


vim +696 drivers/infiniband/hw/mana/main.c

98b889c43935c4 Konstantin Taranov 2024-04-10  682  
c390828d4d7b45 Konstantin Taranov 2025-05-07  683  int mana_eth_query_adapter_caps(struct mana_ib_dev *dev)
c390828d4d7b45 Konstantin Taranov 2025-05-07  684  {
c390828d4d7b45 Konstantin Taranov 2025-05-07  685  	struct mana_ib_adapter_caps *caps = &dev->adapter_caps;
c390828d4d7b45 Konstantin Taranov 2025-05-07  686  	struct gdma_query_max_resources_resp resp = {};
c390828d4d7b45 Konstantin Taranov 2025-05-07  687  	struct gdma_general_req req = {};
c390828d4d7b45 Konstantin Taranov 2025-05-07  688  	int err;
c390828d4d7b45 Konstantin Taranov 2025-05-07  689  
c390828d4d7b45 Konstantin Taranov 2025-05-07  690  	mana_gd_init_req_hdr(&req.hdr, GDMA_QUERY_MAX_RESOURCES,
c390828d4d7b45 Konstantin Taranov 2025-05-07  691  			     sizeof(req), sizeof(resp));
c390828d4d7b45 Konstantin Taranov 2025-05-07  692  
684603da1e1567 Konstantin Taranov 2026-03-18  693  	err = mana_gd_send_request(mdev_to_gc(dev), sizeof(req), &req,
684603da1e1567 Konstantin Taranov 2026-03-18  694  				   sizeof(resp), &resp);
684603da1e1567 Konstantin Taranov 2026-03-18  695  	if (err
c390828d4d7b45 Konstantin Taranov 2025-05-07 @696  		return err;
c390828d4d7b45 Konstantin Taranov 2025-05-07  697  
c390828d4d7b45 Konstantin Taranov 2025-05-07  698  	caps->max_qp_count = min_t(u32, resp.max_sq, resp.max_rq);
c390828d4d7b45 Konstantin Taranov 2025-05-07  699  	caps->max_cq_count = resp.max_cq;
c390828d4d7b45 Konstantin Taranov 2025-05-07  700  	caps->max_mr_count = resp.max_mst;
c390828d4d7b45 Konstantin Taranov 2025-05-07  701  	caps->max_pd_count = 0x6000;
c390828d4d7b45 Konstantin Taranov 2025-05-07  702  	caps->max_qp_wr = min_t(u32,
c390828d4d7b45 Konstantin Taranov 2025-05-07  703  				0x100000 / GDMA_MAX_SQE_SIZE,
c390828d4d7b45 Konstantin Taranov 2025-05-07  704  				0x100000 / GDMA_MAX_RQE_SIZE);
c390828d4d7b45 Konstantin Taranov 2025-05-07  705  	caps->max_send_sge_count = 30;
c390828d4d7b45 Konstantin Taranov 2025-05-07  706  	caps->max_recv_sge_count = 15;
c390828d4d7b45 Konstantin Taranov 2025-05-07  707  	caps->page_size_cap = PAGE_SZ_BM;
c390828d4d7b45 Konstantin Taranov 2025-05-07  708  
c390828d4d7b45 Konstantin Taranov 2025-05-07  709  	return 0;
c390828d4d7b45 Konstantin Taranov 2025-05-07  710  }
c390828d4d7b45 Konstantin Taranov 2025-05-07  711  

:::::: The code at line 696 was first introduced by commit
:::::: c390828d4d7b453c21c6fc0787c714db82731093 RDMA/mana_ib: Add support of mana_ib for RNIC and ETH nic

:::::: TO: Konstantin Taranov <kotaranov@microsoft.com>
:::::: CC: Leon Romanovsky <leon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
