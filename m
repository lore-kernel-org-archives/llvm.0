Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0781127442;
	Sun, 17 Nov 2024 06:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731825668; cv=none; b=Jn2K9C3fajqh6ryz8VM0ckuFfXWGQ2TzHH6qmTr55k4ik6WceDGmhovptXsYUO9ZJXVd//K23rhBINlldCeodvIgoYrAbjSemILj69hPqW7wVj+CJtGlam4L6WCMGiT9Zq8N8c6jL6TPSlGDQnl3N9UXs0Pjdvzp6Dfx4tU7Ea0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731825668; c=relaxed/simple;
	bh=2tUID49KtGGq/msLOwTgs8qkQ3cmylH0yEmJyLYeqWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RSdoWd3KEiFuNvGCiSh10w3sDimvYPjfx8TPNYZ8bUfjEQCKP+IkrVSNP9MoYvsBXkrP+XIBUl+YNYigqE/XCXagvincHY0yptlqjoweMLU5x2ON1yWI11XIeKnxrCkwp1NpQrROhOQoXDJJlwa83H9pQPZgusuUSfgcMrDkZbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FSgPSHkE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FSgPSHkE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731825666; x=1763361666;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2tUID49KtGGq/msLOwTgs8qkQ3cmylH0yEmJyLYeqWM=;
  b=FSgPSHkEz+aIvRT3Smjvcz648Y23iLwPRRQZc+Z4RtGQtZdO1L1wgJVz
   gRe6RfBj4cRxNpvnHXft+TBS7R3FfRixxQ0l+8h+x3PfvshhYWK1UaTdB
   1kamFjGNo76340nZ3jL6XA6rx/RsBP94tmSr7zu5j641IEIu0pJ5E2j8X
   NblfDfV8Lu02/5Vdp3RBWmgVT15kRihT7JLYjgO6DzuBwd3d+8UuysKjm
   Qhs8i/xW+2aLGp2JSG47+nSFTLY9BAgCI9Gb7qNoNwXCBXyvwtIVu1YzD
   2+HCsIdFb6Gc6zldYUcPK9/uPoD8mosgA5m2Hch789tOPjQKt6xdrR0Ti
   Q==;
X-CSE-ConnectionGUID: 61cAaltQTv66z7djE4W5fg==
X-CSE-MsgGUID: 1LDJFhQrTNKWIxy/nRIQ6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="42425439"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="42425439"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 22:41:05 -0800
X-CSE-ConnectionGUID: WWqbNtaUTyyDUfrCA5qEGQ==
X-CSE-MsgGUID: XclpopwHTEqgxnYvPQ2F3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="93862317"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Nov 2024 22:41:04 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCYxx-0001bN-1f;
	Sun, 17 Nov 2024 06:41:01 +0000
Date: Sun, 17 Nov 2024 14:40:18 +0800
From: kernel test robot <lkp@intel.com>
To: Stefano Brivio <sbrivio@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net 2/2] datagram, udp: Set local address and rehash
 socket atomically against lookup
Message-ID: <202411171453.ewEGcIhx-lkp@intel.com>
References: <20241114215414.3357873-3-sbrivio@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114215414.3357873-3-sbrivio@redhat.com>

Hi Stefano,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefano-Brivio/datagram-Rehash-sockets-only-if-local-address-changed-for-their-family/20241115-060512
base:   net/main
patch link:    https://lore.kernel.org/r/20241114215414.3357873-3-sbrivio%40redhat.com
patch subject: [PATCH RFC net 2/2] datagram, udp: Set local address and rehash socket atomically against lookup
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241117/202411171453.ewEGcIhx-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411171453.ewEGcIhx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411171453.ewEGcIhx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/core/sock.c:91:
   In file included from include/linux/errqueue.h:6:
   In file included from include/net/ip.h:22:
   In file included from include/linux/ip.h:16:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> net/core/sock.c:649:40: error: no member named 'skc_v6_rcv_saddr' in 'struct sock_common'; did you mean 'skc_rcv_saddr'?
     649 |                         sk->sk_prot->set_rcv_saddr(sk, &sk->sk_v6_rcv_saddr);
         |                                                             ^
   include/net/sock.h:376:37: note: expanded from macro 'sk_v6_rcv_saddr'
     376 | #define sk_v6_rcv_saddr __sk_common.skc_v6_rcv_saddr
         |                                     ^
   include/net/sock.h:155:11: note: 'skc_rcv_saddr' declared here
     155 |                         __be32  skc_rcv_saddr;
         |                                 ^
   4 warnings and 1 error generated.
--
   In file included from net/ipv4/udp.c:77:
   In file included from include/linux/bpf-cgroup.h:5:
   In file included from include/linux/bpf.h:21:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> net/ipv4/udp.c:2061:7: error: no member named 'skc_v6_rcv_saddr' in 'struct sock_common'
    2061 |                 sk->sk_v6_rcv_saddr = *(struct in6_addr *)addr;
         |                 ~~~~^~~~~~~~~~~~~~~
   include/net/sock.h:376:37: note: expanded from macro 'sk_v6_rcv_saddr'
     376 | #define sk_v6_rcv_saddr __sk_common.skc_v6_rcv_saddr
         |                                     ^
   net/ipv4/udp.c:3663:27: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    3663 |                   PTR_TO_BTF_ID_OR_NULL | PTR_TRUSTED },
         |                   ~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   5 warnings and 1 error generated.


vim +649 net/core/sock.c

   627	
   628	static int sock_bindtoindex_locked(struct sock *sk, int ifindex)
   629	{
   630		int ret = -ENOPROTOOPT;
   631	#ifdef CONFIG_NETDEVICES
   632		struct net *net = sock_net(sk);
   633	
   634		/* Sorry... */
   635		ret = -EPERM;
   636		if (sk->sk_bound_dev_if && !ns_capable(net->user_ns, CAP_NET_RAW))
   637			goto out;
   638	
   639		ret = -EINVAL;
   640		if (ifindex < 0)
   641			goto out;
   642	
   643		/* Paired with all READ_ONCE() done locklessly. */
   644		WRITE_ONCE(sk->sk_bound_dev_if, ifindex);
   645	
   646		/* Force rehash if protocol needs it */
   647		if (sk->sk_prot->set_rcv_saddr) {
   648			if (IS_ENABLED(CONFIG_IPV6) && sk->sk_family == AF_INET6) {
 > 649				sk->sk_prot->set_rcv_saddr(sk, &sk->sk_v6_rcv_saddr);
   650			} else if (sk->sk_family == AF_INET) {
   651				struct inet_sock *inet = inet_sk(sk);
   652	
   653				sk->sk_prot->set_rcv_saddr(sk, &inet->inet_rcv_saddr);
   654			}
   655		}
   656	
   657		sk_dst_reset(sk);
   658	
   659		ret = 0;
   660	
   661	out:
   662	#endif
   663	
   664		return ret;
   665	}
   666	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
