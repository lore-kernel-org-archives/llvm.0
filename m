Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93EF33987;
	Thu, 30 Jan 2025 06:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738218226; cv=none; b=F5vpAprN/I5hyx8Ylsy1yQBaCIrsFWRuAgUvzZpv5ciOOOcgcOGBbk4oWdrJ/NTE/rCJ+A4bEb4zsOxr+Rae1CjkvBDPdXh80ZJdHRNrsJcs/o9FbVpVqDLjuG3EhUdsFb9G5cxHmDqy0oYVLHRlPRsL6VXA2OSlhFpouNui2zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738218226; c=relaxed/simple;
	bh=LfCdPygos0pL+AlQegcU9RLuu0UcBJUY6KwAT8p1Vro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WAXiKLJG+rpyWao8nCtw9x9j6SRaQJ/lPBWx/pv6fENE5JmyJAAQwGJcsJRx2YgRYmpZ9wIAfB4up2o68a0Xr05VxhFwoPqBPxQghLV2I4A0f0ysk94nRsXq9D6YlnqqWC3gc0w6Rl/sMrYCvchvxSV275QeVDb3UCUOiQ7tdEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZPBbPf1f; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZPBbPf1f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738218222; x=1769754222;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LfCdPygos0pL+AlQegcU9RLuu0UcBJUY6KwAT8p1Vro=;
  b=ZPBbPf1fEOLLGWpCVD3RClKRT8bua5Vpj2q9WT4s9IwMw+aBWt5vlrqf
   In/jk3M9+mHEzHuv5NeGA+rLHVyVmdOfix5G34PdMO06V3dwSfyLMfGRw
   lOIm/T4+hHJp3iUfhdQP7oTEBaHLRGJ20UDAC5lizFmglNCn+Wp7xsZoh
   BRF/3hd15YtNpLh54EEeLGxLuxsUDiAkd3SneLfpA/nO1XE9Bq960lTzD
   hNdQC8XRPyemDpUOAxinKS3ieJ1YJhQqREtt0AjpErmeRJgR0OLXVHjHd
   l+lGw8+0Wie0EbqCEcLbCnnCi96UGUpeKRvVO7Bb31fd/kr9lTQwfOFOY
   A==;
X-CSE-ConnectionGUID: 5fBPknGtQdyjGHP4sEE94A==
X-CSE-MsgGUID: oHiqOUKtRJyxJuS3hBaLTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="42678655"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="42678655"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 22:23:42 -0800
X-CSE-ConnectionGUID: 820QTpr2QvyODJN9PLs5XQ==
X-CSE-MsgGUID: stO9517kTQyWJZ+LQm/8bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113253956"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Jan 2025 22:23:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdNxi-000jkB-3D;
	Thu, 30 Jan 2025 06:23:39 +0000
Date: Thu, 30 Jan 2025 14:23:35 +0800
From: kernel test robot <lkp@intel.com>
To: Joe Damato <jdamato@fastly.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next 1/2] netdev-genl: Add an XSK attribute to queues
Message-ID: <202501301434.ZoSDVYrs-lkp@intel.com>
References: <20250129172431.65773-2-jdamato@fastly.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129172431.65773-2-jdamato@fastly.com>

Hi Joe,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 0ad9617c78acbc71373fb341a6f75d4012b01d69]

url:    https://github.com/intel-lab-lkp/linux/commits/Joe-Damato/netdev-genl-Add-an-XSK-attribute-to-queues/20250130-012820
base:   0ad9617c78acbc71373fb341a6f75d4012b01d69
patch link:    https://lore.kernel.org/r/20250129172431.65773-2-jdamato%40fastly.com
patch subject: [RFC net-next 1/2] netdev-genl: Add an XSK attribute to queues
config: hexagon-randconfig-002-20250130 (https://download.01.org/0day-ci/archive/20250130/202501301434.ZoSDVYrs-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 19306351a2c45e266fa11b41eb1362b20b6ca56d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501301434.ZoSDVYrs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501301434.ZoSDVYrs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/core/netdev-genl.c:397:51: error: no member named 'pool' in 'struct netdev_rx_queue'
     397 |                 if (nla_put_u32(rsp, NETDEV_A_QUEUE_XSK, !!rxq->pool))
         |                                                            ~~~  ^
>> net/core/netdev-genl.c:407:51: error: no member named 'pool' in 'struct netdev_queue'
     407 |                 if (nla_put_u32(rsp, NETDEV_A_QUEUE_XSK, !!txq->pool))
         |                                                            ~~~  ^
   2 errors generated.


vim +397 net/core/netdev-genl.c

   366	
   367	static int
   368	netdev_nl_queue_fill_one(struct sk_buff *rsp, struct net_device *netdev,
   369				 u32 q_idx, u32 q_type, const struct genl_info *info)
   370	{
   371		struct net_devmem_dmabuf_binding *binding;
   372		struct netdev_rx_queue *rxq;
   373		struct netdev_queue *txq;
   374		void *hdr;
   375	
   376		hdr = genlmsg_iput(rsp, info);
   377		if (!hdr)
   378			return -EMSGSIZE;
   379	
   380		if (nla_put_u32(rsp, NETDEV_A_QUEUE_ID, q_idx) ||
   381		    nla_put_u32(rsp, NETDEV_A_QUEUE_TYPE, q_type) ||
   382		    nla_put_u32(rsp, NETDEV_A_QUEUE_IFINDEX, netdev->ifindex))
   383			goto nla_put_failure;
   384	
   385		switch (q_type) {
   386		case NETDEV_QUEUE_TYPE_RX:
   387			rxq = __netif_get_rx_queue(netdev, q_idx);
   388			if (rxq->napi && nla_put_u32(rsp, NETDEV_A_QUEUE_NAPI_ID,
   389						     rxq->napi->napi_id))
   390				goto nla_put_failure;
   391	
   392			binding = rxq->mp_params.mp_priv;
   393			if (binding &&
   394			    nla_put_u32(rsp, NETDEV_A_QUEUE_DMABUF, binding->id))
   395				goto nla_put_failure;
   396	
 > 397			if (nla_put_u32(rsp, NETDEV_A_QUEUE_XSK, !!rxq->pool))
   398				goto nla_put_failure;
   399	
   400			break;
   401		case NETDEV_QUEUE_TYPE_TX:
   402			txq = netdev_get_tx_queue(netdev, q_idx);
   403			if (txq->napi && nla_put_u32(rsp, NETDEV_A_QUEUE_NAPI_ID,
   404						     txq->napi->napi_id))
   405				goto nla_put_failure;
   406	
 > 407			if (nla_put_u32(rsp, NETDEV_A_QUEUE_XSK, !!txq->pool))
   408				goto nla_put_failure;
   409		}
   410	
   411		genlmsg_end(rsp, hdr);
   412	
   413		return 0;
   414	
   415	nla_put_failure:
   416		genlmsg_cancel(rsp, hdr);
   417		return -EMSGSIZE;
   418	}
   419	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
