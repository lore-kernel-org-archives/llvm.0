Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633605;
	b=s5A5VZTKye+QjxcsjkuX9lI4kW3aQkllEdsWyMIDW6R3SlIyxUXaBvyAb0W2HNiIewJc
	 +EI66tiLkZpCXmzC5eRt+p7NvKCYrS5axYki6FoThaxvDoBMtLtksAqNLBnedoEmYohKX
	 brAbJU1s7WxrnweXOUHigeStXeajernrJg/iNueh0qvzaGmHAHZTd94T/ZCgccmEd495t
	 Fijt5DT0/FsTTOYU8AyM+jRrImcB4ckMgM52nRv3gHwl5h+Y4878rdpQqbwXqxiMlJeao
	 MGDgTFziZVSCk7wXOQVOK094mmlVGyXQw4vQwGNQVYzEyOxIAOhiAPMYTSwApCOHRrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633605;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=lJHoj9lM3k/CRUYNMR+EIgjIhAXFSpH7YrbBAELRZig=;
	b=qVFHGG+c73NZabKJODB01eD9kS5U/jkp94lc8z5wfWhUSQWR8eX9tX56QNNpssq4wOaM
	 b4OhXlYTcXEaEV1v7OMgDqKUwlary5dWSJKosOsP9MUIw3kkNi5+mdYYO1XeH3qvRL45e
	 rC0SkzxNb6rzvVcQYZP3b+etL90G2ESqxOdg7wpul7CBVBsyWOWgV923VUwINLUc3LhcR
	 YKEYs7dBQVcpQdYYFjXO22DVNUa2UKWbHsRyDaJfynZJ5pgRtQZGp57XmFnsM6uicQLOR
	 At4PYim2VZkSm61BZHb5sdnZYe2kQLDHGCgJ46tmbRj+YsFY2Y6X4KFa/u2sAQj79hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZDQKZEOO;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866B4608A372;
	Mon,  2 Nov 2026 15:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 866B4608A372
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZDQKZEOO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793633604; x=1825169604;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/VrAM8d+OBUPZ1t1z41VtwaZT+cQHgFWWxsqB2NaHcw=;
  b=ZDQKZEOOA7ujE8GmsW+Xrgqy6Cg6kApqoXjcs2FcT1ViQ5Zdge+/3Wf/
   Z5RjHrGcutWw/QzNhSdWwDL2z73qupDql53BfhUpH/RtnBGYwXMW5wCrk
   zfu5TFNlGflbKMfMcNx0NbTmzwkyqrw+9qubsWL2TKGbh9b4T3oZdn6or
   +4QQ2FuCJLTblDbT77FzVfbIPjsABoWOTHNZ/+KbwyKBTwodJvfhA5v0N
   nunsfKPEAe2RWLSJ1sM8ukkfz/dk2Hm0G/ED+ZoiUO911A2DjQ0CzHU8h
   psbNaCF0EXMN66WT73ZupWx1YqbXiBicsoQushBJ66BgBvYL9OBetE6ZT
   Q==;
X-CSE-ConnectionGUID: oL3YTsLWQom/YtBV+Al9Bw==
X-CSE-MsgGUID: cgRMFLQGSPGeAYeWrUCgHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2359995"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2359995"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 07:33:23 -0800
X-CSE-ConnectionGUID: 3QG/0HqgRrSehrutwxc9VA==
X-CSE-MsgGUID: W8dxiBUPSMGsfV3iKeM07w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="7920912"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 02 Nov 2026 07:33:20 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNu29-00000000hDI-1eW4;
	Mon, 02 Nov 2026 15:33:17 +0000
Date: Mon, 2 Nov 2026 23:32:58 +0800
From: kernel test robot <lkp@intel.com>
To: Tung Nguyen <tung.quang.nguyen@est.tech>, netdev@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	davem@davemloft.net, kuba@kernel.org, edumazet@kernel.org,
	pabeni@redhat.com, jmaloy@redhat.com, horms@kernel.org,
	tipc-discussion@lists.sourceforge.net,
	Tung Nguyen <tung.quang.nguyen@est.tech>,
	syzbot+64197f7577a09686ffdb@syzkaller.appspotmail.com
Subject: Re: [PATCH net v2 6/6] tipc: fix NULL pointer dereference in
 named_distribute()
Message-ID: <202611022356.UddfVq4D-lkp@intel.com>
References: <20261102034207.10639-7-tung.quang.nguyen@est.tech>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102034207.10639-7-tung.quang.nguyen@est.tech>

Hi Tung,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Tung-Nguyen/tipc-fix-memory-leak-in-tipc_node_xmit/20261102-104027
base:   net/main
patch link:    https://lore.kernel.org/r/20261102034207.10639-7-tung.quang.nguyen%40est.tech
patch subject: [PATCH net v2 6/6] tipc: fix NULL pointer dereference in named_distribute()
config: sparc64-randconfig-1001-20261102 (https://download.01.org/0day-ci/archive/20261102/202611022356.UddfVq4D-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261102/202611022356.UddfVq4D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611022356.UddfVq4D-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/tipc/net.c:147:6: warning: variable 'p' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     147 |         if (!tn->nt_self_node_exist)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   net/tipc/net.c:150:6: note: uninitialized use occurs here
     150 |         if (p || err == -EEXIST)
         |             ^
   net/tipc/net.c:147:2: note: remove the 'if' if its condition is always true
     147 |         if (!tn->nt_self_node_exist)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
     148 |                 p = tipc_nametbl_insert(net, &ua, &sk, addr, &skb, &err);
   net/tipc/net.c:132:23: note: initialize the variable 'p' to silence this warning
     132 |         struct publication *p;
         |                              ^
         |                               = NULL
   1 warning generated.


vim +147 net/tipc/net.c

   125	
   126	static void tipc_net_finalize(struct net *net, u32 addr)
   127	{
   128		struct name_table *nt = tipc_name_table(net);
   129		struct tipc_socket_addr sk = {0, addr};
   130		struct tipc_net *tn = tipc_net(net);
   131		struct sk_buff *skb = NULL;
   132		struct publication *p;
   133		struct tipc_uaddr ua;
   134		u32 rc_dests;
   135		int err = 0;
   136	
   137		tipc_uaddr(&ua, TIPC_SERVICE_RANGE, TIPC_CLUSTER_SCOPE,
   138			   TIPC_NODE_STATE, addr, addr);
   139	
   140		if (cmpxchg(&tn->node_addr, 0, addr))
   141			return;
   142		tipc_set_node_addr(net, addr);
   143		tipc_named_reinit(net);
   144		tipc_sk_reinit(net);
   145		tipc_mon_reinit_self(net);
   146		spin_lock_bh(&tn->nametbl_lock);
 > 147		if (!tn->nt_self_node_exist)
   148			p = tipc_nametbl_insert(net, &ua, &sk, addr, &skb, &err);
   149	
   150		if (p || err == -EEXIST)
   151			tn->nt_self_node_exist = true;
   152		rc_dests = nt->rc_dests;
   153		spin_unlock_bh(&tn->nametbl_lock);
   154	
   155		if (skb)
   156			tipc_node_broadcast(net, skb, rc_dests);
   157	}
   158	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
