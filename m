Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546FE1FA272;
	Mon,  4 Nov 2024 23:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730762696; cv=none; b=oLfwewRoWHfI6Kg38BTYZkWpibnI+mqcsVB41QBX5UYoQ0EAunParUGby+CPlrMBGw1q9DzBeC0RblKZfn3HWWt3mdZBEe5AhAYqiayiFHdSDu1BkryMi8CJ5XKDTxHWjUrwy3Gdoa/FjaTMM3hWgsZ7WDkFBdR+rlPd+3EaRSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730762696; c=relaxed/simple;
	bh=FOkIhnk6K5QavpodcDnC/8cIaDirYWIBJRHgoXAlRGc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oqaWL1EeLjO5oTMuAXnTweCHP8emEh01o5h6kN3dcZBX6+znHPy6QsIdodbJ4F+SW5UpwHybDZsyrcjFJ69h2EMhuOKGDPJPzUOR0KIKoigMCZ/Z6A8pUY3dT202SEGAwfvay0m+wZ+fRCtRDFlqh3dFUtepGLowftwgmWn9yDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GiDadk3H; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GiDadk3H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730762694; x=1762298694;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FOkIhnk6K5QavpodcDnC/8cIaDirYWIBJRHgoXAlRGc=;
  b=GiDadk3HkUvpywr8l7vWgt52mdCypBGiHXPhKd26p8Qv4yQ8O3J/fTIy
   vSk5mkaFCQ4X13rLl8D90qamVEuZFX2d+hogMx6tso8pcLUBh+0taITI2
   2AAQISv9xXxmcNDQbI6eDiqTMulzUuGxEhRT7YCrdLBU7gdL6cYtpxuBM
   hNNdlNdNjmKtfA2vYDP7nqHp/AqQyMOZvoGAcBtlEHfWqX/tcgZO1TRhU
   A/IXGxoz44tuC4lKZz6BqmS0BcySso8riTvSCNHC4NzzYwdI6EFdEGVqb
   uApM3aa56s84NeOM0E1/h4vE5kh7Qc/95i8hJxXm+4OJeH3Fb8+IjFJKR
   w==;
X-CSE-ConnectionGUID: Vr0f+L/gSqixslrh7upx3Q==
X-CSE-MsgGUID: IkAMtxM3RsGCDh1JMqhVgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="41069803"
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="41069803"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 15:24:52 -0800
X-CSE-ConnectionGUID: R9p3JO4bQo2wmZSLQs6caQ==
X-CSE-MsgGUID: pyub0yaVSlWj43RX6dA3+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="114588869"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Nov 2024 15:24:50 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t86RE-000lNv-1F;
	Mon, 04 Nov 2024 23:24:48 +0000
Date: Tue, 5 Nov 2024 07:24:18 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Cohen <amcohen@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Petr Machata <petrm@nvidia.com>, Ido Schimmel <idosch@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 21/39]
 drivers/net/ethernet/mellanox/mlxsw/pci_xdp.c:47:29: error: called object
 type 'void *' is not a function or function pointer
Message-ID: <202411050748.rZ5HIX8o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   20f293f4a18d1eadb6501f4552b1d10e957eb109
commit: 234e3b5da44a04e456c833a07fca29791e68a1a0 [21/39] mlxsw: pci_xdp: Add fundamental APIs to support XDP
config: i386-randconfig-004-20241105 (https://download.01.org/0day-ci/archive/20241105/202411050748.rZ5HIX8o-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411050748.rZ5HIX8o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411050748.rZ5HIX8o-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mellanox/mlxsw/pci_xdp.c:4:
   In file included from include/linux/bpf_trace.h:5:
   In file included from include/trace/events/xdp.h:8:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/net/ethernet/mellanox/mlxsw/pci_xdp.c:47:29: error: called object type 'void *' is not a function or function pointer
      47 |         page_address = page_address(rx_pkt_info->pages[0]);
         |                        ~~~~~~~~~~~~^
   1 warning and 1 error generated.


vim +47 drivers/net/ethernet/mellanox/mlxsw/pci_xdp.c

    40	
    41	void mlxsw_xdp_buff_init(struct xdp_buff *xdp_buff,
    42				 const struct mlxsw_pci_rx_pkt_info *rx_pkt_info,
    43				 struct xdp_rxq_info *xdp_rxq)
    44	{
    45		void *page_address;
    46	
  > 47		page_address = page_address(rx_pkt_info->pages[0]);
    48	
    49		xdp_init_buff(xdp_buff, PAGE_SIZE, xdp_rxq);
    50		xdp_prepare_buff(xdp_buff, page_address, MLXSW_PCI_RX_BUF_HEADROOM,
    51				 rx_pkt_info->sg_entries_size[0], false);
    52	
    53		mlxsw_xdp_frags_init(xdp_buff, rx_pkt_info);
    54	}
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
