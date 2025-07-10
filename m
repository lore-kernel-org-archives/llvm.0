Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDA2A32;
	Thu, 10 Jul 2025 00:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752106365; cv=none; b=db1qC6/c5hlvWl8hfA8/JdR/DfLTqAA+E4LYtD6MuOGB16J92vO7DG360VhT7/+KeDaVpM3UlxSDTHfbDU2rrXEmKSHqzoYsE4UgB6ggeakGwq9InQycDuH9HownS71Dbm55ZoreHg02p0UvK/aptsX/sTlBM3jriCrMtO2nbo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752106365; c=relaxed/simple;
	bh=NjxTlAlKVhcdMOpfdpQ2gqEb3DolrXm5bkV8lQptpzI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VmmI9QlPdTgRyXuI3F7ifuKeb2ofqauliumwPEaRoqdfeRZHqXYouRrupUlvG8mIEn4+kMJEVXNEEcqDoeZhu54SbqG+iwjiRxH51bS0Qyb0W1/YXBv+judgkci2wkNcSJBLs1fcFXyM5jhRfMbgYDmbXEX4KCsYwBKK8tjhOg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jsHqkjAD; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jsHqkjAD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752106363; x=1783642363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NjxTlAlKVhcdMOpfdpQ2gqEb3DolrXm5bkV8lQptpzI=;
  b=jsHqkjAD1zX2l4Gd3gM1qfvGHNx30An2/qTx30ADRZmn5+DW8yjaFU1q
   Gnw4qcu6ajUSJ5kP7IWxP4kSZTz+1YJhIt/eMfr7JWqPzkBNFBW173yet
   UqUCmFiX20Se132Vr/3TsHufUwtNQX+oCr9ETeUsBu/qN/NAwTu8FpfEc
   p1F5ta1uFEjeUoyKhcyn0MHjGS+s4nZGBJ5mRtSuSEG81meEKA1JPiLlC
   jLZn2E5HJRtM2ACdpVupWrbRZNni/QGPf59i8ovLt09JIiYzwbYffwUer
   ASasaGWHzBo91ucj7qrsp9RZ1bY3tn9zWzG4hLIEUI8LdqQ1YCR2fJ+cu
   w==;
X-CSE-ConnectionGUID: qMz12qLlQyWNeRK79T+rcA==
X-CSE-MsgGUID: 9n1zjN4SQuWJ5wyDqSzKXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="76923383"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="76923383"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 17:12:42 -0700
X-CSE-ConnectionGUID: karJuR3DQMO+8HQXNDEvcg==
X-CSE-MsgGUID: ijLvxrl2R9ebfO3+V7ytcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="160195638"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Jul 2025 17:12:41 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZety-0004EV-2e;
	Thu, 10 Jul 2025 00:12:38 +0000
Date: Thu, 10 Jul 2025 08:12:09 +0800
From: kernel test robot <lkp@intel.com>
To: Yishai Hadas <yishaih@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Leon Romanovsky <leon@kernel.org>
Subject: [leon-rdma:rdma-next 52/102]
 drivers/net/ethernet/mellanox/mlx5/core/lib/st.c:35:20: error: no member
 named 'parent_mdev' in 'struct mlx5_priv'
Message-ID: <202507101012.LbzCjdBi-lkp@intel.com>
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
commit: 6a5617ea8e62a77cca3cab8df55a2eba59594fb0 [52/102] net/mlx5: Add support for device steering tag
config: i386-buildonly-randconfig-006-20250710 (https://download.01.org/0day-ci/archive/20250710/202507101012.LbzCjdBi-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250710/202507101012.LbzCjdBi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507101012.LbzCjdBi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/mellanox/mlx5/core/lib/st.c:35:20: error: no member named 'parent_mdev' in 'struct mlx5_priv'
      35 |                 return dev->priv.parent_mdev->st;
         |                        ~~~~~~~~~ ^
   1 error generated.


vim +35 drivers/net/ethernet/mellanox/mlx5/core/lib/st.c

    23	
    24	struct mlx5_st *mlx5_st_create(struct mlx5_core_dev *dev)
    25	{
    26		struct pci_dev *pdev = dev->pdev;
    27		struct mlx5_st *st;
    28		u16 num_entries;
    29		int ret;
    30	
    31		if (!MLX5_CAP_GEN(dev, mkey_pcie_tph))
    32			return NULL;
    33	
    34		if (IS_ENABLED(CONFIG_MLX5_SF) && mlx5_core_is_sf(dev))
  > 35			return dev->priv.parent_mdev->st;
    36	
    37		/* Checking whether the device is capable */
    38		if (!pdev->tph_cap)
    39			return NULL;
    40	
    41		num_entries = pcie_tph_get_st_table_size(pdev);
    42		/* We need a reserved entry for non TPH cases */
    43		if (num_entries < 2)
    44			return NULL;
    45	
    46		/* The OS doesn't support ST */
    47		ret = pcie_enable_tph(pdev, PCI_TPH_ST_DS_MODE);
    48		if (ret)
    49			return NULL;
    50	
    51		st = kzalloc(sizeof(*st), GFP_KERNEL);
    52		if (!st)
    53			goto end;
    54	
    55		mutex_init(&st->lock);
    56		xa_init_flags(&st->idx_xa, XA_FLAGS_ALLOC);
    57		/* entry 0 is reserved for non TPH cases */
    58		st->index_limit.min = MLX5_MKC_PCIE_TPH_NO_STEERING_TAG_INDEX + 1;
    59		st->index_limit.max = num_entries - 1;
    60	
    61		return st;
    62	
    63	end:
    64		pcie_disable_tph(dev->pdev);
    65		return NULL;
    66	}
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
