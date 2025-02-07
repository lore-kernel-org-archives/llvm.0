Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1324619340D;
	Fri,  7 Feb 2025 06:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738910600; cv=none; b=l5XRQchOTjqKt4P/WK0dlYZu72HCxK/r+dcPbCZBo2CydGzoj2fC7GRNIBxsKpVBDU+ukZ8ZkF580Dl4M2fz9ZczFLgpsiVwWGvhGoUZQ+kmmnzchZ1SmTSjy+3X7zk6Lh4g3GcDDJ/BLiJSAQCSlCdMlsZzgCv5cYwHKEpc1bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738910600; c=relaxed/simple;
	bh=vMCr6BCHMe6xJlPJJVMI5c+9PXqQM7J+fDibucBDvVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CIznmLo7tHubmejfg6Jen0zd7pf+OKQN1REJUS1inY9RW5C9RO7KscU4pizDxTBTRczfBWyYnJXc9fU4Oi8/rWstOqynBMckcgT6oSG1oCDh/XoOz5wsTd9Q/7qgIdsVUaiQCC+cu5FsG1FXUngJxLiqcwCJC3szZcWxUvqIZHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fJu2bQjv; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJu2bQjv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738910599; x=1770446599;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vMCr6BCHMe6xJlPJJVMI5c+9PXqQM7J+fDibucBDvVM=;
  b=fJu2bQjvnnDYbwZeSYiXyCE76IdTmI1s9C0w/5ZiBkqq3IpU8FTDZewW
   RdfwF/DHFxd4INRPGdOaNpsibPSGnCA21KHk5FdXeQ9ifkmdMu1oUFF0G
   HEOzLghjeI7ukB1uqeXfCvre5gDBzwMeMFIRHr7GVU0RXQ25MKrIZ7Pru
   0z95c+4E1zQrlCFJ/h/OomGxml/Qi7ORJqwGTvZephpbpZ5NsOZb2W5Eg
   Utzu7Bgf+DPGSzKtqd98TgeW3J84mnv05WE8I14x1LY5ANLVcJRPRBsoN
   OtH70NQ2AotYtDlZXBuHKs9g8/0urcnn7tFfQalSgR5GJwbNzRTMk2YTj
   A==;
X-CSE-ConnectionGUID: b0hKwhZcRTu6xrFabCdlFw==
X-CSE-MsgGUID: Du2C8dZYRNOC/sl+YjXd0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43206390"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="43206390"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 22:43:19 -0800
X-CSE-ConnectionGUID: TlB73ylvRbuVhCqj0tYHIw==
X-CSE-MsgGUID: U9exOrEYRmSEsVY6t4ddUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="111268994"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Feb 2025 22:43:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgI52-000xql-0u;
	Fri, 07 Feb 2025 06:43:12 +0000
Date: Fri, 7 Feb 2025 14:43:03 +0800
From: kernel test robot <lkp@intel.com>
To: Joe Damato <jdamato@fastly.com>, netdev@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, kuba@kernel.org,
	Joe Damato <jdamato@fastly.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Mina Almasry <almasrymina@google.com>,
	Daniel Jurgens <danielj@nvidia.com>,
	Martin Karsten <mkarsten@uwaterloo.ca>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 1/2] netdev-genl: Add an XSK attribute to
 queues
Message-ID: <202502071452.B85Lw7aV-lkp@intel.com>
References: <20250204191108.161046-2-jdamato@fastly.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204191108.161046-2-jdamato@fastly.com>

Hi Joe,

kernel test robot noticed the following build errors:

[auto build test ERROR on c2933b2befe25309f4c5cfbea0ca80909735fd76]

url:    https://github.com/intel-lab-lkp/linux/commits/Joe-Damato/netdev-genl-Add-an-XSK-attribute-to-queues/20250205-031236
base:   c2933b2befe25309f4c5cfbea0ca80909735fd76
patch link:    https://lore.kernel.org/r/20250204191108.161046-2-jdamato%40fastly.com
patch subject: [PATCH net-next v3 1/2] netdev-genl: Add an XSK attribute to queues
config: arm-defconfig (https://download.01.org/0day-ci/archive/20250207/202502071452.B85Lw7aV-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project ee3bccab34f57387bdf33853cdd5f214fef349a2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502071452.B85Lw7aV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502071452.B85Lw7aV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/core/netdev-genl.c:398:12: error: no member named 'pool' in 'struct netdev_rx_queue'
     398 |                 if (rxq->pool) {
         |                     ~~~  ^
>> net/core/netdev-genl.c:410:12: error: no member named 'pool' in 'struct netdev_queue'
     410 |                 if (txq->pool) {
         |                     ~~~  ^
   2 errors generated.


vim +398 net/core/netdev-genl.c

   366	
   367	static int
   368	netdev_nl_queue_fill_one(struct sk_buff *rsp, struct net_device *netdev,
   369				 u32 q_idx, u32 q_type, const struct genl_info *info)
   370	{
   371		struct net_devmem_dmabuf_binding *binding;
   372		struct netdev_rx_queue *rxq;
   373		struct netdev_queue *txq;
   374		struct nlattr *nest;
   375		void *hdr;
   376	
   377		hdr = genlmsg_iput(rsp, info);
   378		if (!hdr)
   379			return -EMSGSIZE;
   380	
   381		if (nla_put_u32(rsp, NETDEV_A_QUEUE_ID, q_idx) ||
   382		    nla_put_u32(rsp, NETDEV_A_QUEUE_TYPE, q_type) ||
   383		    nla_put_u32(rsp, NETDEV_A_QUEUE_IFINDEX, netdev->ifindex))
   384			goto nla_put_failure;
   385	
   386		switch (q_type) {
   387		case NETDEV_QUEUE_TYPE_RX:
   388			rxq = __netif_get_rx_queue(netdev, q_idx);
   389			if (rxq->napi && nla_put_u32(rsp, NETDEV_A_QUEUE_NAPI_ID,
   390						     rxq->napi->napi_id))
   391				goto nla_put_failure;
   392	
   393			binding = rxq->mp_params.mp_priv;
   394			if (binding &&
   395			    nla_put_u32(rsp, NETDEV_A_QUEUE_DMABUF, binding->id))
   396				goto nla_put_failure;
   397	
 > 398			if (rxq->pool) {
   399				nest = nla_nest_start(rsp, NETDEV_A_QUEUE_XSK);
   400				nla_nest_end(rsp, nest);
   401			}
   402	
   403			break;
   404		case NETDEV_QUEUE_TYPE_TX:
   405			txq = netdev_get_tx_queue(netdev, q_idx);
   406			if (txq->napi && nla_put_u32(rsp, NETDEV_A_QUEUE_NAPI_ID,
   407						     txq->napi->napi_id))
   408				goto nla_put_failure;
   409	
 > 410			if (txq->pool) {
   411				nest = nla_nest_start(rsp, NETDEV_A_QUEUE_XSK);
   412				nla_nest_end(rsp, nest);
   413			}
   414		}
   415	
   416		genlmsg_end(rsp, hdr);
   417	
   418		return 0;
   419	
   420	nla_put_failure:
   421		genlmsg_cancel(rsp, hdr);
   422		return -EMSGSIZE;
   423	}
   424	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
