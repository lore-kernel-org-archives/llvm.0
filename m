Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD3F18801A;
	Wed, 26 Mar 2025 22:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743029855; cv=none; b=UYQX4qRIq2AufJ4iLryepD//t0SstYbH50xKpc9DUqGwWfbDm3zvxhmS6RwloB1rXe1SWEiux6zPWpwRZkUftwv9diMGu5MDdD8VZyV+CHCG8zYGL0UVyoQ/Jab5DKVQXps8dWiy0mQrune3vgiJMv6EvRjfkVzYzyM6XUaF+wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743029855; c=relaxed/simple;
	bh=vsuDLqipq3hANjtkW7q69Vs2DD+GURrL9jkIb0Va9xM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qpK9SYf6CgeLFi1+JSSQIV6jTFyC8Onk82ewpksiw5oLrs/P+EO659Dgcccru7WwMFauSI8yGet0vBFnXc0W2R4tNRxP1Y6wyVUk/y2sucqXAj1PcS6Xj7oIJOsOnsQC4aPWXWXyvRU7czpRaAyN/hEwI+4HABmJmvHbO5L765c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T3fN8YUl; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T3fN8YUl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743029854; x=1774565854;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vsuDLqipq3hANjtkW7q69Vs2DD+GURrL9jkIb0Va9xM=;
  b=T3fN8YUl/jmx8py85bdHZ4kzVVXLSVHeBcgJqXYv2vVBHEzFVau4q8Hw
   xQA6xoJJm0sqCX2xnYHPX7vcskE8DGouHwKC/8GeJYIXAve90DtOYjWaB
   uYHdyjPPLoDWYWtd7J26h/WDYROg6jll8w7RmRoCXDMEt5NUMMqJXUDO2
   blh3edCPODUYKiyAFo/iFV36yMrFr+8LSztMx6WO2+J7lt0aMssK35AEG
   sP9CFrjnlUXihLYOnnV6IuXw2XXx3q6EB5k2dkqZNmXegTtjRLuHRD79J
   KjOR9qGUN8k6CZWUhlTO8vxJHh9HMfFF2tL641FvCoJXSPvtoFFb4pmgX
   A==;
X-CSE-ConnectionGUID: BMXl6xb0RxiIjYvRZo3iuQ==
X-CSE-MsgGUID: mPNSmgnOSumJg3pYLRCkrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48218941"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="48218941"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 15:57:33 -0700
X-CSE-ConnectionGUID: lNADsVBHQFqicvFi4kmKVw==
X-CSE-MsgGUID: f7izSHs2QFO/N6nS4dYYmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="129090412"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 26 Mar 2025 15:57:32 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txZgf-000699-2Q;
	Wed, 26 Mar 2025 22:57:29 +0000
Date: Thu, 27 Mar 2025 06:57:13 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/netkit-xdp 6/8] drivers/net/netkit.c:218:40: error: no
 member named 'pool' in 'struct netdev_rx_queue'
Message-ID: <202503270659.vCkBxrBF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/netkit-xdp
head:   6f1df43931ef06ffe83eaa6a0d3df5d4c9a53786
commit: 65332eb9360ea7f0f0bcea9de6c4b2ec7a8ca936 [6/8] netkit: implement ndos
config: i386-randconfig-004-20250327 (https://download.01.org/0day-ci/archive/20250327/202503270659.vCkBxrBF-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250327/202503270659.vCkBxrBF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503270659.vCkBxrBF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/netkit.c:218:40: error: no member named 'pool' in 'struct netdev_rx_queue'
     218 |                 return nk->lower->dev->_rx[queue_id].pool;
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
>> drivers/net/netkit.c:220:40: error: no member named 'pool' in 'struct netdev_queue'
     220 |                 return nk->lower->dev->_tx[queue_id].pool;
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/net/netkit.c:245:33: error: no member named 'pool' in 'struct netdev_rx_queue'
     245 |                 nk->lower->dev->_rx[queue_id].pool = pool;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/net/netkit.c:247:33: error: no member named 'pool' in 'struct netdev_queue'
     247 |                 nk->lower->dev->_tx[queue_id].pool = pool;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/net/netkit.c:261:33: error: no member named 'pool' in 'struct netdev_rx_queue'
     261 |                 nk->lower->dev->_rx[queue_id].pool = NULL;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/net/netkit.c:263:33: error: no member named 'pool' in 'struct netdev_queue'
     263 |                 nk->lower->dev->_tx[queue_id].pool = NULL;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   6 errors generated.


vim +218 drivers/net/netkit.c

   207	
   208	static struct xsk_buff_pool *
   209	netkit_xsk_get_pool_from_qid(struct net_device *dev, u16 queue_id)
   210	{
   211		struct netkit *nk = netkit_priv(dev);
   212	
   213		if (!nk->lower || nk->primary)
   214			return NULL;
   215		if (!netkit_queue_valid(dev, queue_id))
   216			return NULL;
   217		if (queue_id < nk->lower->dev->real_num_rx_queues)
 > 218			return nk->lower->dev->_rx[queue_id].pool;
   219		if (queue_id < nk->lower->dev->real_num_tx_queues)
 > 220			return nk->lower->dev->_tx[queue_id].pool;
   221		return NULL;
   222	}
   223	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
