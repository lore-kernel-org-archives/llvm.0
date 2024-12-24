Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D05F442C;
	Tue, 24 Dec 2024 19:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735069869; cv=none; b=fVExGGTjgS4fQguhEK9aqyF/iff07qF4XuAoLL20tokCeBYnj816pZZVZt6FlcKokBXLbfdRVucZN7wIJAbMZRWTN9mMfMICaSgCPWnBijFNe4VIdRo8jLvy5M4GDyKvH0HD5PtBhAdojBLr0IWh/csUW8WdCaM/Oov1GStFEu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735069869; c=relaxed/simple;
	bh=mrgS68bZ6DseRndN40d7oDtMIPRQRFLhnxyzZ+33blI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vc6LMWNeVR9cVkoBxRpJ9mwUNxOXx7TGE3B+S43d3PJ5Y2klvQJA1Ks1TiYv2LW8ARkqXhmxZY+GYTGYkzUfftJDKAMFaXA4htwIG1P4rcbHnH+Sb9lf8uisceXdqEOMfJ0enazrUVMjfD/NazALaHb/jptqGl2wFDWW/6X0blk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PanSxcSn; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PanSxcSn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735069867; x=1766605867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mrgS68bZ6DseRndN40d7oDtMIPRQRFLhnxyzZ+33blI=;
  b=PanSxcSnWzaZtQv10WtogUVNLiSAS1d4accqHsOFNotuqFfqOIcz2F6Q
   jYKjdIA4y6uKdzRA4eU6V/J8WJdHk0lh7BKdhxaKAcWpzG6tOfsCm2hbV
   wE2A+KwkoiM2/z5kwxL4cMe0VgNc9JGuZQ25mTOsvZpdJK1UZwUgBon0l
   bE/EoNdaiJSaf+zgNYX4TMhdSdZLvRmNnvXLIDCQui1lrMayawvslQ7X4
   I0NDqQcdfcciV/WzUkgyQILujpenZlNwvjy4W/mfXEV2u8/8gC1ZvK1zx
   nFmqUVZZMRB7XhDqs7vkkoexlw0ABlrB2CwbvEM7453tn928wjg4LaYMX
   g==;
X-CSE-ConnectionGUID: mUtZYCNdQNm8DVNfigPlfA==
X-CSE-MsgGUID: 0uYtHv3zQzieEYPKWRJXcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="60922671"
X-IronPort-AV: E=Sophos;i="6.12,261,1728975600"; 
   d="scan'208";a="60922671"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 11:51:06 -0800
X-CSE-ConnectionGUID: Cap4vluNSdehk3lfyXfOHA==
X-CSE-MsgGUID: wpUigovaTr+Jz4LZQIQw2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,261,1728975600"; 
   d="scan'208";a="130406591"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Dec 2024 11:51:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQAvm-0001PP-2Z;
	Tue, 24 Dec 2024 19:51:02 +0000
Date: Wed, 25 Dec 2024 03:50:24 +0800
From: kernel test robot <lkp@intel.com>
To: Yuyu Li <liyuyu6@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Leon Romanovsky <leon@kernel.org>,
	Junxian Huang <huangjunxian6@hisilicon.com>
Subject: [rdma-rdma:wip/leon-for-next 25/34]
 drivers/infiniband/hw/bnxt_re/main.c:2172:1: warning: unused label
 're_dev_unreg'
Message-ID: <202412250356.e2dZ2kjW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git wip/leon-for-next
head:   1a4f56e8c029d463e9b8461ea3256ae16c88ddf6
commit: 6c409d08650c2a6dc6776d8b78a706996dcf4a78 [25/34] RDMA/bnxt_re: Remove deliver net device event
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241225/202412250356.e2dZ2kjW-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241225/202412250356.e2dZ2kjW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412250356.e2dZ2kjW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/hw/bnxt_re/main.c:2172:1: warning: unused label 're_dev_unreg' [-Wunused-label]
    2172 | re_dev_unreg:
         | ^~~~~~~~~~~~~
   1 warning generated.


vim +/re_dev_unreg +2172 drivers/infiniband/hw/bnxt_re/main.c

dee3da3422d5e8 Chandramohan Akula 2024-09-10  2135  
cc5b9b48d44756 Selvin Xavier      2024-09-10  2136  static int bnxt_re_add_device(struct auxiliary_device *adev, u8 op_type)
1ac5a404797523 Selvin Xavier      2017-02-10  2137  {
6d758147c7b80a Ajit Khaparde      2022-10-14  2138  	struct bnxt_aux_priv *aux_priv =
6d758147c7b80a Ajit Khaparde      2022-10-14  2139  		container_of(adev, struct bnxt_aux_priv, aux_dev);
dee3da3422d5e8 Chandramohan Akula 2024-09-10  2140  	struct bnxt_re_en_dev_info *en_info;
1ac5a404797523 Selvin Xavier      2017-02-10  2141  	struct bnxt_en_dev *en_dev;
6d758147c7b80a Ajit Khaparde      2022-10-14  2142  	struct bnxt_re_dev *rdev;
14611b9b984125 Kalesh AP          2023-08-03  2143  	int rc;
1ac5a404797523 Selvin Xavier      2017-02-10  2144  
dee3da3422d5e8 Chandramohan Akula 2024-09-10  2145  	en_info = auxiliary_get_drvdata(adev);
dee3da3422d5e8 Chandramohan Akula 2024-09-10  2146  	en_dev = en_info->en_dev;
dee3da3422d5e8 Chandramohan Akula 2024-09-10  2147  
1ac5a404797523 Selvin Xavier      2017-02-10  2148  
0ba9294da081ba Kalesh AP          2024-10-08  2149  	rdev = bnxt_re_dev_add(adev, en_dev);
6d758147c7b80a Ajit Khaparde      2022-10-14  2150  	if (!rdev || !rdev_to_dev(rdev)) {
1ac5a404797523 Selvin Xavier      2017-02-10  2151  		rc = -ENOMEM;
1ac5a404797523 Selvin Xavier      2017-02-10  2152  		goto exit;
1ac5a404797523 Selvin Xavier      2017-02-10  2153  	}
66832705c4d01e Selvin Xavier      2020-02-26  2154  
dee3da3422d5e8 Chandramohan Akula 2024-09-10  2155  	bnxt_re_update_en_info_rdev(rdev, en_info, adev);
dee3da3422d5e8 Chandramohan Akula 2024-09-10  2156  
cc5b9b48d44756 Selvin Xavier      2024-09-10  2157  	rc = bnxt_re_dev_init(rdev, op_type);
6d758147c7b80a Ajit Khaparde      2022-10-14  2158  	if (rc)
6d758147c7b80a Ajit Khaparde      2022-10-14  2159  		goto re_dev_dealloc;
1ac5a404797523 Selvin Xavier      2017-02-10  2160  
c2b777a9592395 Selvin Xavier      2020-02-26  2161  	rc = bnxt_re_ib_init(rdev);
497158aa5f520d Selvin Xavier      2018-02-26  2162  	if (rc) {
6d758147c7b80a Ajit Khaparde      2022-10-14  2163  		pr_err("Failed to register with IB: %s",
6d758147c7b80a Ajit Khaparde      2022-10-14  2164  			aux_priv->aux_dev.name);
6d758147c7b80a Ajit Khaparde      2022-10-14  2165  		goto re_dev_uninit;
3cae58047c1343 Jason Gunthorpe    2020-03-13  2166  	}
3cae58047c1343 Jason Gunthorpe    2020-03-13  2167  
94a9dc6ac8f7e6 Selvin Xavier      2024-09-10  2168  	bnxt_re_setup_cc(rdev, true);
94a9dc6ac8f7e6 Selvin Xavier      2024-09-10  2169  
6d758147c7b80a Ajit Khaparde      2022-10-14  2170  	return 0;
3cae58047c1343 Jason Gunthorpe    2020-03-13  2171  
a5e099e0c464ac Kalesh AP          2024-10-08 @2172  re_dev_unreg:
a5e099e0c464ac Kalesh AP          2024-10-08  2173  	ib_unregister_device(&rdev->ibdev);
6d758147c7b80a Ajit Khaparde      2022-10-14  2174  re_dev_uninit:
dee3da3422d5e8 Chandramohan Akula 2024-09-10  2175  	bnxt_re_update_en_info_rdev(NULL, en_info, adev);
cc5b9b48d44756 Selvin Xavier      2024-09-10  2176  	bnxt_re_dev_uninit(rdev, BNXT_RE_COMPLETE_REMOVE);
6d758147c7b80a Ajit Khaparde      2022-10-14  2177  re_dev_dealloc:
6d758147c7b80a Ajit Khaparde      2022-10-14  2178  	ib_dealloc_device(&rdev->ibdev);
a6c66d6a08b88c Selvin Xavier      2018-11-21  2179  exit:
6d758147c7b80a Ajit Khaparde      2022-10-14  2180  	return rc;
1ac5a404797523 Selvin Xavier      2017-02-10  2181  }
1ac5a404797523 Selvin Xavier      2017-02-10  2182  

:::::: The code at line 2172 was first introduced by commit
:::::: a5e099e0c464ac3d077339f481981e0d859b8545 RDMA/bnxt_re: Fix an error path in bnxt_re_add_device

:::::: TO: Kalesh AP <kalesh-anakkur.purayil@broadcom.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
