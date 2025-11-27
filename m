Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EF32FF14F;
	Thu, 27 Nov 2025 18:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764269329; cv=none; b=m3JS/v7Hs6bElDxA1GxrgBxIT0DOz+sMLONrG+TBAYRAn9QbmirFfK41hQzhK1UZQChq54XkX4e+b/E1jsPvbH/4VhXIBX6/QI78ODQToqPVr+oGwPMXleuh6MbJKyMXek5kDF4OOytRzWpRBtL6dh7U/yq/86rtQhpP0pnjFfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764269329; c=relaxed/simple;
	bh=9Gi34BDaT+X4E7bmOg3HIrauXOhbY5x67GshPzklwaM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b31yoO82XGMizaGwTvxY7fXVrGVRTNFy0sW7rS82TdKbSUVuoMHRMJav/cGfUFfRYWDxU1fo76jpln5/AtsJZj+iuq9OReMOy5tmg8STcEvLGeABAGSzTJPTboWrg++4giazTYHzyQhOmGXaxcU3QUawcQrJtLH55WbBL2SYqVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dQR45nlm; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dQR45nlm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764269326; x=1795805326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9Gi34BDaT+X4E7bmOg3HIrauXOhbY5x67GshPzklwaM=;
  b=dQR45nlmg9gdJgvcJJNVx4GdAR9aCZcTqfDWzzqqRLWRt6IHVwJyQrCW
   D0DnqBJIyEYib1AbNhTUXatGnI2clyKaStvtS3s0ppn5z8QbUZDXOALx7
   IYREiPLA9Mm8dNJWqawmsX5eMt8A4xGvlJyI7QRXFF57DTYvKaIivvT4a
   kXxcmfOa94L1Iy4zmZDvxj6CyfCZgauMrm8PS4suEoiyVNO7qVWFKG6IQ
   9EozpW0spvqVcFwHaT17XghlkWdspBUy3VmCZSvMu2r8BEEiIkLnMg65f
   36hKKxuhAPd+vE1X2BxmXUjfdI82T+RDbR4PWi6Z2bgviJGSomS3mUry2
   Q==;
X-CSE-ConnectionGUID: 5SBV791RT1GaWS9r5xr65Q==
X-CSE-MsgGUID: vu8WyPeNRWCfzrFEl22A7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="77678987"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="77678987"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 10:48:45 -0800
X-CSE-ConnectionGUID: gNIoV6r8ThyoKID9tgEwXA==
X-CSE-MsgGUID: ds0+XGEHQzCcezaYGJzqZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="193184098"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 27 Nov 2025 10:48:44 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOh2n-000000001oj-3iR5;
	Thu, 27 Nov 2025 18:48:41 +0000
Date: Thu, 27 Nov 2025 19:48:13 +0100
From: kernel test robot <lkp@intel.com>
To: David Wei <dw@davidwei.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Daniel Borkmann <daniel@iogearbox.net>,
	Nikolay Aleksandrov <razor@blackwall.org>
Subject: [cilium:pr/netkit-iouring6 1/2] net/core/netdev-genl.c:1123:5:
 warning: no previous prototype for function 'netdev_nl_bind_queue_doit'
Message-ID: <202511271941.PlC6xXYn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/netkit-iouring6
head:   7bfb4fc5f460441d05b483647e4f4c59c4afaeb1
commit: f54fd4a1c99a85d283ce07ebc4505d09a28b28f5 [1/2] net: Add bind-queue operation
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251127/202511271941.PlC6xXYn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511271941.PlC6xXYn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511271941.PlC6xXYn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/netdev-genl.c:1123:5: warning: no previous prototype for function 'netdev_nl_bind_queue_doit' [-Wmissing-prototypes]
    1123 | int netdev_nl_bind_queue_doit(struct sk_buff *skb, struct genl_info *info)
         |     ^
   net/core/netdev-genl.c:1123:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1123 | int netdev_nl_bind_queue_doit(struct sk_buff *skb, struct genl_info *info)
         | ^
         | static 
   1 warning generated.


vim +/netdev_nl_bind_queue_doit +1123 net/core/netdev-genl.c

  1122	
> 1123	int netdev_nl_bind_queue_doit(struct sk_buff *skb, struct genl_info *info)
  1124	{
  1125		return -EOPNOTSUPP;
  1126	}
  1127	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
