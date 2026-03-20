Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63113C1408;
	Fri, 20 Mar 2026 14:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774016817; cv=none; b=re7WIa3b8yEwRghg8LH3rywLDtvx6+HEZV6y4oyddSVF5bpXxOyAZ8k2Hn89wGzJ6V2x2Y6oP+5TH71kmUg6dv7sfbkQbjPILaeuBhIGOFFs5K45bdF+chkH8PzgiHcwDHVzER+Dv9+5NFTW+g0QdBY+4MxsMNCc3MUyrW/nipc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774016817; c=relaxed/simple;
	bh=Ej4NUBf1ZQKo+LPQkcwUQb9IYVa+4LZy2t0eim3b6gY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SfGAwM9E4D4G0+m4t/FpT45kPNWwAo103C0iIDXZQf4YtNNFPNXqlEeJb9hpNqwnsohbdZXCA/oDufHN8tm5rtwUw90MAD65lBhPH4IUeJJQGCx+XcdyePJEMZ6MOPL8bkClbCsN0k3WuDtVh5OeWz9LHZxWmByvyBbz0E8gW+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XsxNYjQj; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XsxNYjQj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774016815; x=1805552815;
  h=date:from:to:cc:subject:message-id;
  bh=Ej4NUBf1ZQKo+LPQkcwUQb9IYVa+4LZy2t0eim3b6gY=;
  b=XsxNYjQj5b1bFfH0MSqxmE+HRsMIwI3WXkOw6HZNLsSgP5k5iE4ZglMJ
   XUHE08TUyw39Jq4tUJvRaC5M2pG7iRwzFVCEd3HB9/U4OTPy7cWS5JxWN
   nn57tQcMNOoEgC13x7blKKqImCk6Z8ongwHjRwasPOoDRhC559SLGUE8u
   mMq139HP+2isC2nLAODkiApZFRyR552qV+01zpA/q5yc4bK2Nh+A6a5ze
   iVjDesB51Sq/ipoYQMQivnApL4XeVBXk2bx9Cpuzh7SFY1iK57GRzTg0Q
   yaKdE0cPC2hduNSBqAvakQDr18Vv4muaGCti/BYviDiBX2w2GoTfAlbWz
   A==;
X-CSE-ConnectionGUID: PuWUXjoYR2Ou2ux0mZo9iQ==
X-CSE-MsgGUID: MaUjwvXiQe6xr+ZTW9+73Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75175336"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="75175336"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 07:26:54 -0700
X-CSE-ConnectionGUID: Dsfc5Z0XTearPKu0PB2MMw==
X-CSE-MsgGUID: gRm927vKSju0o37lrtckyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="225217057"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 20 Mar 2026 07:26:53 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3ao8-000000002T1-0bdQ;
	Fri, 20 Mar 2026 14:26:38 +0000
Date: Fri, 20 Mar 2026 22:24:12 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 David Wei <dw@davidwei.uk>
Subject: [cilium:pr/netkit-iouring19 570/583]
 drivers/net/ethernet/mellanox/mlx5/core/en_main.c:5617:7: error: call to
 undeclared function 'netif_rxq_has_unreadable_mp'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202603202209.dNMkb930-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/cilium/linux.git pr/netkit-iouring19
head:   263b05479cf2219b9610925d32a127cb5adde246
commit: 8b33e9b1c0bee6f058cbe6cf57915e49e58baa9d [570/583] net: Implement netdev_nl_queue_create_doit
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260320/202603202209.dNMkb930-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603202209.dNMkb930-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603202209.dNMkb930-lkp@intel.com/

Note: the cilium/pr/netkit-iouring19 HEAD 263b05479cf2219b9610925d32a127cb5adde246 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/mellanox/mlx5/core/en_main.c:5617:7: error: call to undeclared function 'netif_rxq_has_unreadable_mp'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5617 |         if (!netif_rxq_has_unreadable_mp(dev, queue_index))
         |              ^
   1 error generated.


vim +/netif_rxq_has_unreadable_mp +5617 drivers/net/ethernet/mellanox/mlx5/core/en_main.c

0fa8c93357601c Dragos Tatulea 2026-02-23  5609  
df5135fced85bf Dragos Tatulea 2026-02-23  5610  static bool mlx5e_queue_validate_page_size(struct net_device *dev,
df5135fced85bf Dragos Tatulea 2026-02-23  5611  					   struct netdev_queue_config *qcfg,
df5135fced85bf Dragos Tatulea 2026-02-23  5612  					   int queue_index)
df5135fced85bf Dragos Tatulea 2026-02-23  5613  {
df5135fced85bf Dragos Tatulea 2026-02-23  5614  	if (qcfg->rx_page_size == PAGE_SIZE)
df5135fced85bf Dragos Tatulea 2026-02-23  5615  		return true;
df5135fced85bf Dragos Tatulea 2026-02-23  5616  
df5135fced85bf Dragos Tatulea 2026-02-23 @5617  	if (!netif_rxq_has_unreadable_mp(dev, queue_index))
df5135fced85bf Dragos Tatulea 2026-02-23  5618  		return false;
df5135fced85bf Dragos Tatulea 2026-02-23  5619  
df5135fced85bf Dragos Tatulea 2026-02-23  5620  	return true;
df5135fced85bf Dragos Tatulea 2026-02-23  5621  }
df5135fced85bf Dragos Tatulea 2026-02-23  5622  

:::::: The code at line 5617 was first introduced by commit
:::::: df5135fced85bf3c3dfe174f1cf853cdf39312e5 net/mlx5e: SHAMPO, Allow high order pages in zerocopy mode

:::::: TO: Dragos Tatulea <dtatulea@nvidia.com>
:::::: CC: Paolo Abeni <pabeni@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
