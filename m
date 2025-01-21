Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DB015C0;
	Tue, 21 Jan 2025 04:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737433531; cv=none; b=dAMHFnaZlqKkg+jq4lKb+5NrpI7y9DIS2KBcOqtE5Xh6xtOaVzFHmBrU26fplPmQFkkeN4rX4hbmz9QasGlUud9Hkee1gXkDNVgYGl1lNbQsvUiEbj6KkukAV9cL8cvZR945EkNQ7C+uyNX+gN5X3/KXjTHFNoP5fXugzLST/yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737433531; c=relaxed/simple;
	bh=IZMjX4qBkO6P7w7mUDNJiNCYs6pLjwZwzbRK5osK6x0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XuILGvyKKcShfGcsQt/9pCVxXtKf81Mdvl4EARLXf5DtUBvadKgqK0TY+g83vrGom4UxIKyl/WeD/O1MVIp+LpjbXMr/UH/V7tUZjvVAtsHDUO4eQOYij+4YPmt03ymW6V+Rr7lw+WpUZMg12iGQEcBmNJPnE+5qg1C9VPGWKXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QiGmt/eK; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QiGmt/eK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737433529; x=1768969529;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IZMjX4qBkO6P7w7mUDNJiNCYs6pLjwZwzbRK5osK6x0=;
  b=QiGmt/eKs3v8bkhqFKbnO+gniBqjYXbSO/4SUfkqvUWISYw4ADHY9qgh
   piOK8T3nT1rQUoUqueC7Oe9qzXb+/WviFJ/+JM5cMPgoXe9F+uXSSvUZr
   AbFTfk3yGXo0FF7ywH2txzVpSKLTto1P5bT1UMyWQynKbvsCNl/u2cuVF
   B/AHB79VDWmq6LoBqu92MVTqp+0F7yUUeYYqERTWlVWmfvRp/Ph3qgS6Y
   gRU+N0+G1CFukPMZLCbN8nzTsN9/Lo8/ihPtWz+A81S/jjZPYhKKr6lN+
   8xSjATXf9zw++vePxEgrbqddsxZTOC5xslHk5Nv7iFOwzgomjm9cT2E6c
   Q==;
X-CSE-ConnectionGUID: DphWyOggTc2aPdKDZ+X4dQ==
X-CSE-MsgGUID: zXxnzvaUQumTCGkilg1btg==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="55240022"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; 
   d="scan'208";a="55240022"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 20:25:29 -0800
X-CSE-ConnectionGUID: 2yWSd5pDSYGDmWGkkkBkwA==
X-CSE-MsgGUID: nzGAYh/MSzOc6pQxRjaivQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143950834"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Jan 2025 20:25:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ta5pM-000XbP-2S;
	Tue, 21 Jan 2025 04:25:24 +0000
Date: Tue, 21 Jan 2025 12:25:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Xing <kerneljasonxing@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next v6 02/13] net-timestamp: prepare for
 timestamping callbacks use
Message-ID: <202501211253.Y7W8BdGR-lkp@intel.com>
References: <20250121012901.87763-3-kerneljasonxing@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121012901.87763-3-kerneljasonxing@gmail.com>

Hi Jason,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Xing/net-timestamp-add-support-for-bpf_setsockopt/20250121-093443
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250121012901.87763-3-kerneljasonxing%40gmail.com
patch subject: [RFC PATCH net-next v6 02/13] net-timestamp: prepare for timestamping callbacks use
config: s390-randconfig-001-20250121 (https://download.01.org/0day-ci/archive/20250121/202501211253.Y7W8BdGR-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501211253.Y7W8BdGR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501211253.Y7W8BdGR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/core/sock.c:951:6: error: redefinition of 'bpf_skops_tx_timestamping'
   void bpf_skops_tx_timestamping(struct sock *sk, struct sk_buff *skb, int op)
        ^
   include/net/sock.h:2929:20: note: previous definition is here
   static inline void bpf_skops_tx_timestamping(struct sock *sk, struct sk_buff *skb, int op)
                      ^
>> net/core/sock.c:961:2: error: call to undeclared function '__cgroup_bpf_run_filter_sock_ops'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           __cgroup_bpf_run_filter_sock_ops(sk, &sock_ops, CGROUP_SOCK_OPS);
           ^
>> net/core/sock.c:961:50: error: use of undeclared identifier 'CGROUP_SOCK_OPS'; did you mean 'BPF_CGROUP_SOCK_OPS'?
           __cgroup_bpf_run_filter_sock_ops(sk, &sock_ops, CGROUP_SOCK_OPS);
                                                           ^~~~~~~~~~~~~~~
                                                           BPF_CGROUP_SOCK_OPS
   include/uapi/linux/bpf.h:1065:2: note: 'BPF_CGROUP_SOCK_OPS' declared here
           BPF_CGROUP_SOCK_OPS,
           ^
   3 errors generated.


vim +/bpf_skops_tx_timestamping +951 net/core/sock.c

   950	
 > 951	void bpf_skops_tx_timestamping(struct sock *sk, struct sk_buff *skb, int op)
   952	{
   953		struct bpf_sock_ops_kern sock_ops;
   954	
   955		memset(&sock_ops, 0, offsetof(struct bpf_sock_ops_kern, temp));
   956		sock_ops.op = op;
   957		sock_ops.is_fullsock = 1;
   958		sock_ops.sk = sk;
   959		bpf_skops_init_skb(&sock_ops, skb, 0);
   960		/* Timestamping bpf extension supports only TCP and UDP full socket */
 > 961		__cgroup_bpf_run_filter_sock_ops(sk, &sock_ops, CGROUP_SOCK_OPS);
   962	}
   963	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
