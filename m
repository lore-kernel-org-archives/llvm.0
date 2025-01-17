Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1F41F76C2;
	Fri, 17 Jan 2025 10:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737109888; cv=none; b=oahJRyYybblHJJPgsp9uRWcDqTNTfRlaHK5cz2IFXpYnG3nbg1Idbr2kC8pBA1ndX0eJIgVS3t+VDpx3+18jlw92ZJEILuaabvsclQeYW9bvS2iOdrNGRq1rZnQ2DflHcbp/WNpRw0gskjETSLGMf36D00cMkUlJHsrA8DqzLmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737109888; c=relaxed/simple;
	bh=DZOM3HZgs6PTS7mom2SnNPsK0a/bjhq53HE4sUbtxw0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p1ZfR8dk5x7TFP9PANSCvWddpfyxG3mT1OsKGtlBnOTQhnq/+3aLJH0lM+9GWXp0F/5C4OY1P6VzE8Xzs49dde3Oa1sMN39b+rpCMu/RGLUcPUO0PW05hIkZB4x6+YwAzY0XDSa8s+cyECZncwVEqHcVgfztyEDrzdwxYtQkDOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P4faAvjf; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P4faAvjf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737109887; x=1768645887;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DZOM3HZgs6PTS7mom2SnNPsK0a/bjhq53HE4sUbtxw0=;
  b=P4faAvjfdJhbr5SKFa7PYAKa52YOneHUIR3qltwHzFUZC0eHY+PnnlS9
   HErZkSSfKY/OWM/XlDjB9EtXGCTltUIzhjoPccxpJGHb1VlLpiPFlzgvl
   NgJuubPG1YV+STD7SN99tt+4M9srQ6nQtUeHe5+mZjmeY96m1Pq7/CdIm
   VpssE62HLZ6eXUymWUptOcztcZ02MozCW9CvZ/fRbOzlL0D/rcan5q9gO
   tvEgo58peAw4AK+HP2haKZNyZSC1vHzuSKStfDxzsNqq9QVBcGhtMgjsQ
   4gzIKuokXV5wIq5PqikTTG860OdtFFwib5GqLWqr+Mj9RXySHofWCELyL
   A==;
X-CSE-ConnectionGUID: /1h1T6hETTyVdrc2lWs7QA==
X-CSE-MsgGUID: 7qy0mB2LQrmvtVV2tdkr8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37655127"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="37655127"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 02:31:24 -0800
X-CSE-ConnectionGUID: 8/t4W8mnTf+k6t27im6cOg==
X-CSE-MsgGUID: CJfscxrtSiC+89BznowzMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="106359930"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jan 2025 02:31:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYjdJ-000T4L-0n;
	Fri, 17 Jan 2025 10:31:21 +0000
Date: Fri, 17 Jan 2025 18:30:33 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:ipsec-fixes 11/11] net/xfrm/xfrm_output.c:837:5: error:
 redefinition of 'xfrm6_tunnel_check_size'
Message-ID: <202501171817.JV1YopmX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git ipsec-fixes
head:   3bbb0d5d23db82d8493191fc103c4c2b26decc13
commit: 3bbb0d5d23db82d8493191fc103c4c2b26decc13 [11/11] xfrm: check for PMTU in tunnel mode for packet offload
config: powerpc64-randconfig-001-20250116 (https://download.01.org/0day-ci/archive/20250117/202501171817.JV1YopmX-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171817.JV1YopmX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501171817.JV1YopmX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/xfrm/xfrm_output.c:10:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/powerpc/include/asm/cacheflush.h:7:
   In file included from include/linux/mm.h:2224:
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
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> net/xfrm/xfrm_output.c:837:5: error: redefinition of 'xfrm6_tunnel_check_size'
     837 | int xfrm6_tunnel_check_size(struct sk_buff *skb)
         |     ^
   include/net/xfrm.h:1789:19: note: previous definition is here
    1789 | static inline int xfrm6_tunnel_check_size(struct sk_buff *skb)
         |                   ^
>> net/xfrm/xfrm_output.c:851:42: error: call to undeclared function 'ip6_skb_dst_mtu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     851 |              !skb_gso_validate_network_len(skb, ip6_skb_dst_mtu(skb)))) {
         |                                                 ^
   net/xfrm/xfrm_output.c:851:42: note: did you mean 'ip_skb_dst_mtu'?
   include/net/ip.h:503:28: note: 'ip_skb_dst_mtu' declared here
     503 | static inline unsigned int ip_skb_dst_mtu(struct sock *sk,
         |                            ^
>> net/xfrm/xfrm_output.c:855:7: error: call to undeclared function 'xfrm6_local_dontfrag'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     855 |                 if (xfrm6_local_dontfrag(skb->sk))
         |                     ^
   3 warnings and 3 errors generated.


vim +/xfrm6_tunnel_check_size +837 net/xfrm/xfrm_output.c

   836	
 > 837	int xfrm6_tunnel_check_size(struct sk_buff *skb)
   838	{
   839		int mtu, ret = 0;
   840		struct dst_entry *dst = skb_dst(skb);
   841	
   842		if (skb->ignore_df)
   843			goto out;
   844	
   845		mtu = dst_mtu(dst);
   846		if (mtu < IPV6_MIN_MTU)
   847			mtu = IPV6_MIN_MTU;
   848	
   849		if ((!skb_is_gso(skb) && skb->len > mtu) ||
   850		    (skb_is_gso(skb) &&
 > 851		     !skb_gso_validate_network_len(skb, ip6_skb_dst_mtu(skb)))) {
   852			skb->dev = dst->dev;
   853			skb->protocol = htons(ETH_P_IPV6);
   854	
 > 855			if (xfrm6_local_dontfrag(skb->sk))
   856				ipv6_stub->xfrm6_local_rxpmtu(skb, mtu);
   857			else if (skb->sk)
   858				xfrm_local_error(skb, mtu);
   859			else
   860				icmpv6_send(skb, ICMPV6_PKT_TOOBIG, 0, mtu);
   861			ret = -EMSGSIZE;
   862		}
   863	out:
   864		return ret;
   865	}
   866	EXPORT_SYMBOL_GPL(xfrm6_tunnel_check_size);
   867	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
