Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB38353A0;
	Mon, 27 Nov 2023 05:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iqhVS91b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701064704; x=1732600704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BlHboTApcORFphCUD4Y2/UqQozcpKRzgyLwXUvarxk4=;
  b=iqhVS91byiyiM+06/sf5PJ3aOcRBZPUNZB6eq7xW/iK0EVjTszyN5wy/
   xkPe8QBsOkdNfKcA86vIjg6ni7WCJqEIMzbGMt24oVqIJfmh0MOPNMolN
   UxRk/eglnYqvHWjc1GJ8Vdp/bASjCexsOuW0ja0u4NAj+rt4Itno8BeTW
   t6RKgqiXxCZKIrh5v3W9yqVzcSugUAt+k7B32bUuLFDj6nzOuaRYhnWNK
   R+Gl23uAmLspr6vAAoPeWnr6hF00/F+Z4+9lU7zxDCXPFf3GbFelcW7Tp
   8ve116tIJ3wSZKaWgG7UTZgzL9pmLYh6ZkdnxSgqZe4D9q0JXEDL9/EDc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="392393483"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="392393483"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 21:58:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="744459774"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="744459774"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 26 Nov 2023 21:58:22 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7UdQ-0005rw-02;
	Mon, 27 Nov 2023 05:58:20 +0000
Date: Mon, 27 Nov 2023 13:57:47 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ragnatech:next/net/tsn 4/5]
 drivers/net/ethernet/renesas/rtsn.c:270:2: error: call to undeclared
 function '__iowmb'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202311271326.6QVRuNLT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niklas/linux.git next/net/tsn
head:   9929703c4bd6c8c37ff9c65353ea241101007b52
commit: 2aec3957074d82d65a9df406a07631e6a81e7a98 [4/5] net: ethernet: rtsn: Add support for Renesas Ethernet-TSN
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231127/202311271326.6QVRuNLT-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231127/202311271326.6QVRuNLT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311271326.6QVRuNLT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/renesas/rtsn.c:270:2: error: call to undeclared function '__iowmb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           __iowmb();
           ^
   1 error generated.


vim +/__iowmb +270 drivers/net/ethernet/renesas/rtsn.c

   244	
   245	static int rtsn_poll(struct napi_struct *napi, int budget)
   246	{
   247		struct rtsn_private *priv;
   248		struct net_device *ndev;
   249		unsigned long flags;
   250		int quota = budget;
   251	
   252		ndev = napi->dev;
   253		priv = netdev_priv(ndev);
   254	
   255		/* Processing RX Descriptor Ring */
   256		if (rtsn_rx(ndev, &quota))
   257			goto out;
   258	
   259		/* Processing TX Descriptor Ring */
   260		spin_lock_irqsave(&priv->lock, flags);
   261		rtsn_tx_free(ndev, true);
   262		netif_wake_subqueue(ndev, 0);
   263		spin_unlock_irqrestore(&priv->lock, flags);
   264	
   265		napi_complete(napi);
   266	
   267		/* Re-enable TX/RX interrupts */
   268		spin_lock_irqsave(&priv->lock, flags);
   269		rtsn_ctrl_data_irq(priv, true);
 > 270		__iowmb();
   271		spin_unlock_irqrestore(&priv->lock, flags);
   272	out:
   273		return budget - quota;
   274	}
   275	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
