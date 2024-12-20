Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80362C190;
	Fri, 20 Dec 2024 15:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734710086; cv=none; b=jpgLyaAcGc8EkvHJlRBWxR5a0ueboARHeK7JokQaPEy424jL5/FgYne6fTznTtJWOHU3gDpM64A2wLQnKTSE6IxYHELl8/rj7RSJnClRocmkJ57JPIx9FUSNMvIv2fDtvSnknSEW55hl+fZOFz9g/EvmU4cff2lensSK8XcexgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734710086; c=relaxed/simple;
	bh=LG3q0Gc2IgZ4rJH2f9Ujt6XJKqIdlICS29lef7pAEZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XAFpDKBIuVNCD1g/ANgqLWsPQz0PVIBgXsAzAtXXgWH6HsYeKkWFu0CNOgLrx5E29jdTucASWVaJbxJLVwhEeRnrkDGlQp1FzaZhygshRoEDCgt0mnkTp4RR7me7NdBnkugthFcUYIz4gtRjrFO+mJCIosA7n6To2vwEUgXSHN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lFDdN89K; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lFDdN89K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734710084; x=1766246084;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LG3q0Gc2IgZ4rJH2f9Ujt6XJKqIdlICS29lef7pAEZU=;
  b=lFDdN89KuyzEYSyLMSzmiyiBeEUq8dnAL93/UoKASyVloO2C7ddmn2ZV
   rPI/sgXa8f89znHSEELUwKG6ASnUhaoPHARQf1J6nrHSK6Q0ekXaIpoZ/
   ML1fZgaXYmX91564qxl1effs4HYvCnn46wy56kV9e0+lHXtIaJ62z26hc
   KvREG47ndoN1jUcnqmVmrHhSo/OLetOmRzcDrvwEs2sMG/Pn+plHD81ua
   wh2kb2g2yXNy29oRh6AHRNNqcoPZbb5XJDaIsuSFXv450sSUTzbupaQTe
   TjAoVvSJ2T3G6MWzg2dVVm6lOpYasP+UeH7PS16xb9ZQ++Gn11CL+TnN8
   Q==;
X-CSE-ConnectionGUID: MrU8f/GOSuiyfEBFSD7KdQ==
X-CSE-MsgGUID: 67jrC7rxReKcDodQ0RU7lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35152812"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="35152812"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 07:54:43 -0800
X-CSE-ConnectionGUID: hLumIJ3RQRimIjL4gQQjgw==
X-CSE-MsgGUID: dKTRrKsMRyeSd/fxRJb3Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103532132"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Dec 2024 07:54:42 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOfKp-0001MP-2X;
	Fri, 20 Dec 2024 15:54:39 +0000
Date: Fri, 20 Dec 2024 23:54:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kees:dev/v6.13-rc2/remove-sockaddr 4/4] net/iucv/af_iucv.c:858:9:
 error: no member named 'sa_family' in 'struct sockaddr_iucv'
Message-ID: <202412202348.fEwrQrl2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/v6.13-rc2/remove-sockaddr
head:   333adcbb2159f90fedc3f9d3194dbf6352af9335
commit: 333adcbb2159f90fedc3f9d3194dbf6352af9335 [4/4] net: Convert proto_ops::getname to sockaddr_storage
config: s390-defconfig (https://download.01.org/0day-ci/archive/20241220/202412202348.fEwrQrl2-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412202348.fEwrQrl2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412202348.fEwrQrl2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/iucv/af_iucv.c:858:9: error: no member named 'sa_family' in 'struct sockaddr_iucv'
           siucv->sa_family = AF_IUCV;
           ~~~~~  ^
   1 error generated.


vim +858 net/iucv/af_iucv.c

   850	
   851	static int iucv_sock_getname(struct socket *sock,
   852				     struct sockaddr_storage *addr, int peer)
   853	{
   854		DECLARE_SOCKADDR(struct sockaddr_iucv *, siucv, addr);
   855		struct sock *sk = sock->sk;
   856		struct iucv_sock *iucv = iucv_sk(sk);
   857	
 > 858		siucv->sa_family = AF_IUCV;
   859	
   860		if (peer) {
   861			memcpy(siucv->siucv_user_id, iucv->dst_user_id, 8);
   862			memcpy(siucv->siucv_name, iucv->dst_name, 8);
   863		} else {
   864			memcpy(siucv->siucv_user_id, iucv->src_user_id, 8);
   865			memcpy(siucv->siucv_name, iucv->src_name, 8);
   866		}
   867		memset(&siucv->siucv_port, 0, sizeof(siucv->siucv_port));
   868		memset(&siucv->siucv_addr, 0, sizeof(siucv->siucv_addr));
   869		memset(&siucv->siucv_nodeid, 0, sizeof(siucv->siucv_nodeid));
   870	
   871		return sizeof(struct sockaddr_iucv);
   872	}
   873	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
