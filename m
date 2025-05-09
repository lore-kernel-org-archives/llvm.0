Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90816274653;
	Fri,  9 May 2025 08:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746780893; cv=none; b=HizoGc0bTWsqf5fGtS9ZR82BxRPWYrrY/wiV9J5HpHnm/kYF5I+v+nG9np4IR2jvYHxTXsQI0Ic41JMqRfyZ2EMOO+98ntUDvyg02CR15woExmY2+zyH3ZMClX+Ly85abH9J85pmD2WA+4H1Su/fbQiqKLU4cBrFlL58G/d7zsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746780893; c=relaxed/simple;
	bh=oepDtHzajxH/jtKxGYRJsypIYPhpsvGjOf7cGD1TEyY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MMe5Rh+l5hfq4bSx3fsrAACODLM97NBNV/XTu/9dPhlNmPGEK2lX6FL2yxA7zlyP4WYP1yXnEoJ7X0g1MCG+I33CmIMyVEuppg3Oo+JalI+J7PEX2oestZtP7N77DRDiZfuNZAQjGD8B3Kvp93jVByQ2sSGF5i08BopF5WHeobg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UlaLZQaP; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UlaLZQaP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746780891; x=1778316891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oepDtHzajxH/jtKxGYRJsypIYPhpsvGjOf7cGD1TEyY=;
  b=UlaLZQaPEzjCCf5oDflvv7Tmf+1z0z/6nrXh38fRLw1G6znhs4WkvPbQ
   H7eheFrB8qQFZdqmaL2YQ3kTOVqRs7LqmJ9aLFImWwzItzS66Rlp0s8zN
   Vc5//JPwUajVzm79N62PKqPP/nEHRDfSJfpLh+p4Hre0ShYcuOTOabIts
   bdO9/H9nwJuyuhNpaMD1EMlsv0i5HIiZMoSxRWCF3uOyA0Y2rD3LsgvJH
   ZjAJXdu1aW3Fr5ES3HlCz2iI2SYXIk2MrApxVQwViSZE29KQcJAQ8TAPw
   PATgvOFT0ZM3jVCX1pvkcinNjkWYiH1T8Bn8Wmob1NEQXGfFsJTxkWWNV
   Q==;
X-CSE-ConnectionGUID: TeSr6QnZTcSld6Y3ey/LUQ==
X-CSE-MsgGUID: 4HcEqaLdSVqG5X9uyuIHhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="47708660"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="47708660"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 01:54:50 -0700
X-CSE-ConnectionGUID: xLlKLPs9S2yw7cHFFTC1/g==
X-CSE-MsgGUID: 5gtTs8nWQpqsgidedIDJrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="141334172"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 May 2025 01:54:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDJVF-000BqR-2n;
	Fri, 09 May 2025 08:54:45 +0000
Date: Fri, 9 May 2025 16:54:02 +0800
From: kernel test robot <lkp@intel.com>
To: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-nvme@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
	Damien Le Moal <dlemoal@kernel.org>
Subject: [linux-nvme:nvme-6.16 11/14] drivers/nvme/target/core.c:1018:10:
 warning: variable 'ret' is uninitialized when used here
Message-ID: <202505091619.QFU1fxsd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/nvme.git nvme-6.16
head:   a0136c6ac4a9aba90a47b9c691bc299a113b5259
commit: 206372d7c565174e6b8289dac03077b23b8369c9 [11/14] nvmet: support completion queue sharing
config: s390-randconfig-002-20250509 (https://download.01.org/0day-ci/archive/20250509/202505091619.QFU1fxsd-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505091619.QFU1fxsd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505091619.QFU1fxsd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvme/target/core.c:1018:10: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
    1018 |                 return ret;
         |                        ^~~
   drivers/nvme/target/core.c:1015:9: note: initialize the variable 'ret' to silence this warning
    1015 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +1018 drivers/nvme/target/core.c

  1012	
  1013	int nvmet_sq_init(struct nvmet_sq *sq, struct nvmet_cq *cq)
  1014	{
  1015		int ret;
  1016	
  1017		if (!nvmet_cq_get(cq))
> 1018			return ret;
  1019	
  1020		ret = percpu_ref_init(&sq->ref, nvmet_sq_free, 0, GFP_KERNEL);
  1021		if (ret) {
  1022			pr_err("percpu_ref init failed!\n");
  1023			nvmet_cq_put(cq);
  1024			return ret;
  1025		}
  1026		init_completion(&sq->free_done);
  1027		init_completion(&sq->confirm_done);
  1028		nvmet_auth_sq_init(sq);
  1029		sq->cq = cq;
  1030	
  1031		return 0;
  1032	}
  1033	EXPORT_SYMBOL_GPL(nvmet_sq_init);
  1034	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
