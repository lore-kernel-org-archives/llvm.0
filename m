Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B624A26;
	Thu,  1 Feb 2024 01:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706750081; cv=none; b=abXwJQmEDWf9nVKSC/eVk8ByWLAmkbEuq1PxQEJ9fLI0jBlRXv3prdo8ui0bUWboCqwFE+GPWKYr1KOERr3ndtkXcGxERqixYKa56meOyLAhFlWax1CTQqKfkc0QKfRLJ9s3I0iM4rLZHumeRVof7CI0GkHjVApOy3St+yEe+Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706750081; c=relaxed/simple;
	bh=6laeycb1th2IJygbmeHP93pz1aZzymh9YP08lVd8zBA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rfcv8FJtPcWrCBBLmMnfUJgCY4XKu6u7H2/mbNenB79U4CU8j+6WHTrNcLHnCqCoCXTXa8BHZ9NQd5LhxU75Wd8yKVDqEMhlh8fA2aCbmgLt2o/jRiEk53NgmkHg2/vGI2CZVh+/noXxxLBUz5DSPt7xb3nIbxDpw12CaMklpwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LnnvRpOy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LnnvRpOy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706750080; x=1738286080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6laeycb1th2IJygbmeHP93pz1aZzymh9YP08lVd8zBA=;
  b=LnnvRpOyvR9y7ogoB3fNDRELWDAkKTZ429l24VfS15CDtyeX9LhghVbd
   +gIri/USF36ErtyLv1b/hpslsejGICMcr5VgtpVlUz7zDS8gkfi/yer26
   7bvwNhp5dNCPYfh6zkJ4UenS6+mly+KncDkFKrUH4duY/Ag/n3aUfhuLe
   xq4FmaIjay7qVM3EFNfctWfvGI5Dkl4NZsTvtmJJT7mM6kUPUbsClgEcV
   //GSde7JTeqEJ2i3D4R7ucejyv9uwBY/34m3PqgkEL3i9FJDO6+6KZKbs
   P2gDVq3ni7VHknJXqHmdMypA3sNczbToBLHXsWAJS/lz/i3Dajq8U1iBI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="17160647"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="17160647"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 17:14:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="932034925"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="932034925"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 31 Jan 2024 17:14:37 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVLf1-0002De-1z;
	Thu, 01 Feb 2024 01:14:35 +0000
Date: Thu, 1 Feb 2024 09:11:24 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:rdma-next 43/50] drivers/infiniband/hw/mlx5/odp.c:572:3:
 warning: variable 'access_mask' is uninitialized when used here
Message-ID: <202402010925.gklK6eFn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   17282587cdc0f20c27d7404ac1caa5ebe4e9d87b
commit: 0f8d73f33588b9e1db56ab89f2eb7d1cb7f30583 [43/50] RDMA/umem: Store ODP access mask information in PFN
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240201/202402010925.gklK6eFn-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project fdac7d0b6f74f919d319b31a0680c77f66732586)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240201/202402010925.gklK6eFn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402010925.gklK6eFn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/hw/mlx5/odp.c:572:3: warning: variable 'access_mask' is uninitialized when used here [-Wuninitialized]
     572 |                 access_mask |= HMM_PFN_WRITE;
         |                 ^~~~~~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:557:17: note: initialize the variable 'access_mask' to silence this warning
     557 |         u64 access_mask;
         |                        ^
         |                         = 0
   1 warning generated.


vim +/access_mask +572 drivers/infiniband/hw/mlx5/odp.c

   547	
   548	#define MLX5_PF_FLAGS_DOWNGRADE BIT(1)
   549	#define MLX5_PF_FLAGS_SNAPSHOT BIT(2)
   550	#define MLX5_PF_FLAGS_ENABLE BIT(3)
   551	static int pagefault_real_mr(struct mlx5_ib_mr *mr, struct ib_umem_odp *odp,
   552				     u64 user_va, size_t bcnt, u32 *bytes_mapped,
   553				     u32 flags)
   554	{
   555		int page_shift, ret, np;
   556		bool downgrade = flags & MLX5_PF_FLAGS_DOWNGRADE;
   557		u64 access_mask;
   558		u64 start_idx;
   559		bool fault = !(flags & MLX5_PF_FLAGS_SNAPSHOT);
   560		u32 xlt_flags = MLX5_IB_UPD_XLT_ATOMIC;
   561	
   562		if (flags & MLX5_PF_FLAGS_ENABLE)
   563			xlt_flags |= MLX5_IB_UPD_XLT_ENABLE;
   564	
   565		if (flags & MLX5_PF_FLAGS_DOWNGRADE)
   566			xlt_flags |= MLX5_IB_UPD_XLT_DOWNGRADE;
   567	
   568		page_shift = odp->page_shift;
   569		start_idx = (user_va - ib_umem_start(odp)) >> page_shift;
   570	
   571		if (odp->umem.writable && !downgrade)
 > 572			access_mask |= HMM_PFN_WRITE;
   573	
   574		np = ib_umem_odp_map_dma_and_lock(odp, user_va, bcnt, access_mask, fault);
   575		if (np < 0)
   576			return np;
   577	
   578		/*
   579		 * No need to check whether the MTTs really belong to this MR, since
   580		 * ib_umem_odp_map_dma_and_lock already checks this.
   581		 */
   582		ret = mlx5r_umr_update_xlt(mr, start_idx, np, page_shift, xlt_flags);
   583		mutex_unlock(&odp->umem_mutex);
   584	
   585		if (ret < 0) {
   586			if (ret != -EAGAIN)
   587				mlx5_ib_err(mr_to_mdev(mr),
   588					    "Failed to update mkey page tables\n");
   589			goto out;
   590		}
   591	
   592		if (bytes_mapped) {
   593			u32 new_mappings = (np << page_shift) -
   594				(user_va - round_down(user_va, 1 << page_shift));
   595	
   596			*bytes_mapped += min_t(u32, new_mappings, bcnt);
   597		}
   598	
   599		return np << (page_shift - PAGE_SHIFT);
   600	
   601	out:
   602		return ret;
   603	}
   604	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
