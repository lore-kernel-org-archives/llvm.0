Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A09A47;
	Thu, 10 Jul 2025 00:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752106365; cv=none; b=aOzazSJZgk+uTRJ7jeSpGRWjE0QPGIKsGTNufVam3lL4T/vs8e7u0pus0vMYbq4b/3CHFpH0t6Ddh3wnXSKyBXbfY99zx4snrYgYtaoj9t73QJLgUVe4A5/nF9oXBc8u1q/v49/ugD45oFo1G1YvjpPdel+2PUIxVVcsCqAwScE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752106365; c=relaxed/simple;
	bh=lwH9hNdFsBeCfhJ7eyk6vPn0/eFcO9EjVXkBTJMbTP4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y8yuemblIQxyK9KTB8OJbr3eINhaw4xORhNVW14pOong17IOD6U8/zqhK2OycaLRUVqbJs6/iDOFj6craLy0ewkGtp6DGDL5533CARy1T5XlAPFb/7n/5I9SQBr8Jqlo5YtuDTf9Ws95zV9nt1U1fXYnkc33lt9rO2P8IDGX21o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BxTXNG0A; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BxTXNG0A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752106364; x=1783642364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lwH9hNdFsBeCfhJ7eyk6vPn0/eFcO9EjVXkBTJMbTP4=;
  b=BxTXNG0AvoAUDkYoRmx/TVGYaJpRgBf8lgVkv9RA/DufiVOGu9REdKhZ
   60rSAPjmm6vMXQIvwjfRBEmJi51NOuiDdrzgx5IMnHAD5cZJXHnAJW1Wq
   3R/o2I3Pr7XgoY0eoqiFbmm/gF8mRD2hqKvYIy3o3j/NsVuX49GUlj4XZ
   0Ooj6a1I2lb/LXgX67Uf4O2NHiZe6wpwA23eDTt3XxVBAdErZIvN1Y/fM
   G4lsyMN63nk4nJtuEy3kL5hMQPMZtj2DV6Pqggq3Sez8suVwbyj31IZo2
   b1x0sw4I6MNQsqXKCTnNWJ4FsdeUFGmpecw5QIQBXZHniR+V0c2l2/ArO
   g==;
X-CSE-ConnectionGUID: OHNEkohNTFKJ5XMKMmvEUQ==
X-CSE-MsgGUID: Crg62cswSIm2Br9jlNz5KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="42003889"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="42003889"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 17:12:43 -0700
X-CSE-ConnectionGUID: oMfcHE1LQXmYpYtDt818Zw==
X-CSE-MsgGUID: g/tDbQ1BQo66k7/OpQ7KrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="155680702"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Jul 2025 17:12:41 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZety-0004EX-2i;
	Thu, 10 Jul 2025 00:12:38 +0000
Date: Thu, 10 Jul 2025 08:12:08 +0800
From: kernel test robot <lkp@intel.com>
To: Yishai Hadas <yishaih@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Leon Romanovsky <leon@kernel.org>,
	Edward Srouji <edwards@nvidia.com>
Subject: [leon-rdma:rdma-next 56/102]
 drivers/infiniband/hw/hns/hns_roce_mr.c:242:10: error: incompatible integer
 to pointer conversion returning 'int' from a function with result type
 'struct ib_mr *'
Message-ID: <202507100805.RMkoPCwe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   168eb64efd0f6c7938890d4c9029142dcd13fd7c
commit: e8063443db94464663beb65a92425bba22ae41e6 [56/102] IB: Extend UVERBS_METHOD_REG_MR to get DMAH
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250710/202507100805.RMkoPCwe-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250710/202507100805.RMkoPCwe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507100805.RMkoPCwe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/infiniband/hw/hns/hns_roce_mr.c:242:10: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct ib_mr *' [-Wint-conversion]
     242 |                 return -EOPNOTSUPP;
         |                        ^~~~~~~~~~~
   1 error generated.


vim +242 drivers/infiniband/hw/hns/hns_roce_mr.c

   231	
   232	struct ib_mr *hns_roce_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
   233					   u64 virt_addr, int access_flags,
   234					   struct ib_dmah *dmah,
   235					   struct ib_udata *udata)
   236	{
   237		struct hns_roce_dev *hr_dev = to_hr_dev(pd->device);
   238		struct hns_roce_mr *mr;
   239		int ret;
   240	
   241		if (dmah)
 > 242			return -EOPNOTSUPP;
   243	
   244		mr = kzalloc(sizeof(*mr), GFP_KERNEL);
   245		if (!mr) {
   246			ret = -ENOMEM;
   247			goto err_out;
   248		}
   249	
   250		mr->iova = virt_addr;
   251		mr->size = length;
   252		mr->pd = to_hr_pd(pd)->pdn;
   253		mr->access = access_flags;
   254		mr->type = MR_TYPE_MR;
   255	
   256		ret = alloc_mr_key(hr_dev, mr);
   257		if (ret)
   258			goto err_alloc_mr;
   259	
   260		ret = alloc_mr_pbl(hr_dev, mr, udata, start);
   261		if (ret)
   262			goto err_alloc_key;
   263	
   264		ret = hns_roce_mr_enable(hr_dev, mr);
   265		if (ret)
   266			goto err_alloc_pbl;
   267	
   268		mr->ibmr.rkey = mr->ibmr.lkey = mr->key;
   269	
   270		return &mr->ibmr;
   271	
   272	err_alloc_pbl:
   273		free_mr_pbl(hr_dev, mr);
   274	err_alloc_key:
   275		free_mr_key(hr_dev, mr);
   276	err_alloc_mr:
   277		kfree(mr);
   278	err_out:
   279		atomic64_inc(&hr_dev->dfx_cnt[HNS_ROCE_DFX_MR_REG_ERR_CNT]);
   280	
   281		return ERR_PTR(ret);
   282	}
   283	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
