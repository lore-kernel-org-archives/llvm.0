Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91950342CAD;
	Mon, 12 Jan 2026 21:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768254229; cv=none; b=XomA+doAkqeAG8srMs3L4EjsgbMZ9snpDpl09WZSqqUmItykG017WCCBDkPnG42QeooQ50ycBC03FdBOyQjxU3B5S/6BjKZwNBjELLsmTDquuEYnj6NI0jtijD/PKnvWSdc3PrW1rAmZj7kj4ZR9aWoynmWmio/CzSANtFLseII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768254229; c=relaxed/simple;
	bh=8htnrs1PqELkKHrz5bGANLkOl/UBq2FhqFKBEdH/q34=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Dj8xUwGsBAGEcq80gTDbgjfNDIA7/7oVEuzpg6a1fB94Y195Dl0OtvncmOi03QTlMePKW9ztUld8aA2nlLuLht+8S/no/Wv+mircKCHh1ZaQ5m9+yv7MGMbkI71XN/vtfk9NVNuiZe1VPjahbUVHwbOX9IOsl0pssA9H2rmInS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V+mgDRG6; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V+mgDRG6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768254227; x=1799790227;
  h=date:from:to:cc:subject:message-id;
  bh=8htnrs1PqELkKHrz5bGANLkOl/UBq2FhqFKBEdH/q34=;
  b=V+mgDRG69xh8jfOqgZeNMlJ6CTkQsr2TFVeIcFf0V5StOC2/mZSnKVLr
   0T/KA5+lpI4a+nFBywW8nsjvdOHeKrqXtfG/hcL2e0iCH4gCEcG/6QDvN
   MetMY/ASZxs6DA0hHrxaiyjYepcLi2YSWkJ2C4bTtxodMx13293cGcX2r
   LRN+o47GTYId219yMa9ygZCr6WW/tijUbT1AtAD/zs7+90DmkTodQqoUc
   iJNGZC8J+7LBxncKN92tteQSq8f+FH5h9I93AqsqM4rSA3lNsc2aIuqFU
   vHVrEkykUm5Hs3qoonLY/q9nuY7MP/YsmiP917pyiBaCUe+QRRiJQg90S
   A==;
X-CSE-ConnectionGUID: 9qGxPnDmS+alyUR36tNzPg==
X-CSE-MsgGUID: 6lRlQ6EvQASMJLP4PVA+uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="68744197"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="68744197"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 13:43:46 -0800
X-CSE-ConnectionGUID: fTK6eFnbR9qbjWm9KLT9wA==
X-CSE-MsgGUID: ZFTYDoIiT6uhcIiHrYopNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="203407745"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Jan 2026 13:43:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfPhO-00000000Dtq-1ahN;
	Mon, 12 Jan 2026 21:43:42 +0000
Date: Tue, 13 Jan 2026 05:43:18 +0800
From: kernel test robot <lkp@intel.com>
To: Maxim Mikityanskiy <maxim@isovalent.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:max/vxlan-bigtcp 21/21]
 net/ipv4/udp_offload.c:743:7: warning: variable 'ulen' is uninitialized when
 used here
Message-ID: <202601130502.oURtw3Mc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/cilium/linux.git max/vxlan-bigtcp
head:   de0493575c7f01a82c2b58b308fae122df5aa143
commit: de0493575c7f01a82c2b58b308fae122df5aa143 [21/21] tmp: combine checks
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260113/202601130502.oURtw3Mc-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130502.oURtw3Mc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601130502.oURtw3Mc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ipv4/udp_offload.c:743:7: warning: variable 'ulen' is uninitialized when used here [-Wuninitialized]
     743 |                 if (ulen > udp_get_len_short(uh2) || flush) {
         |                     ^~~~
   net/ipv4/udp_offload.c:705:19: note: initialize the variable 'ulen' to silence this warning
     705 |         unsigned int ulen;
         |                          ^
         |                           = 0
   1 warning generated.


vim +/ulen +743 net/ipv4/udp_offload.c

da5bab079f9b7d Daniel Borkmann    2013-06-08  695  
0b935d7f8c07bf Eric Dumazet       2021-11-15  696  
e20cf8d3f1f763 Paolo Abeni        2018-11-07  697  #define UDP_GRO_CNT_MAX 64
e20cf8d3f1f763 Paolo Abeni        2018-11-07  698  static struct sk_buff *udp_gro_receive_segment(struct list_head *head,
e20cf8d3f1f763 Paolo Abeni        2018-11-07  699  					       struct sk_buff *skb)
e20cf8d3f1f763 Paolo Abeni        2018-11-07  700  {
4b1a86281cc1d0 Alexander Lobakin  2020-11-11  701  	struct udphdr *uh = udp_gro_udphdr(skb);
e20cf8d3f1f763 Paolo Abeni        2018-11-07  702  	struct sk_buff *pp = NULL;
e20cf8d3f1f763 Paolo Abeni        2018-11-07  703  	struct udphdr *uh2;
e20cf8d3f1f763 Paolo Abeni        2018-11-07  704  	struct sk_buff *p;
4dd2b82d5adfbe Eric Dumazet       2019-05-01  705  	unsigned int ulen;
9fd1ff5d2ac718 Steffen Klassert   2020-01-25  706  	int ret = 0;
5babae777c61aa Richard Gobert     2024-04-30  707  	int flush;
e20cf8d3f1f763 Paolo Abeni        2018-11-07  708  
e20cf8d3f1f763 Paolo Abeni        2018-11-07  709  	/* requires non zero csum, for symmetry with GSO */
e20cf8d3f1f763 Paolo Abeni        2018-11-07  710  	if (!uh->check) {
e20cf8d3f1f763 Paolo Abeni        2018-11-07  711  		NAPI_GRO_CB(skb)->flush = 1;
e20cf8d3f1f763 Paolo Abeni        2018-11-07  712  		return NULL;
e20cf8d3f1f763 Paolo Abeni        2018-11-07  713  	}
e20cf8d3f1f763 Paolo Abeni        2018-11-07  714  
e20cf8d3f1f763 Paolo Abeni        2018-11-07  715  	/* pull encapsulating udp header */
e20cf8d3f1f763 Paolo Abeni        2018-11-07  716  	skb_gro_pull(skb, sizeof(struct udphdr));
e20cf8d3f1f763 Paolo Abeni        2018-11-07  717  
e20cf8d3f1f763 Paolo Abeni        2018-11-07  718  	list_for_each_entry(p, head, list) {
e20cf8d3f1f763 Paolo Abeni        2018-11-07  719  		if (!NAPI_GRO_CB(p)->same_flow)
e20cf8d3f1f763 Paolo Abeni        2018-11-07  720  			continue;
e20cf8d3f1f763 Paolo Abeni        2018-11-07  721  
e20cf8d3f1f763 Paolo Abeni        2018-11-07  722  		uh2 = udp_hdr(p);
e20cf8d3f1f763 Paolo Abeni        2018-11-07  723  
e20cf8d3f1f763 Paolo Abeni        2018-11-07  724  		/* Match ports only, as csum is always non zero */
e20cf8d3f1f763 Paolo Abeni        2018-11-07  725  		if ((*(u32 *)&uh->source != *(u32 *)&uh2->source)) {
e20cf8d3f1f763 Paolo Abeni        2018-11-07  726  			NAPI_GRO_CB(p)->same_flow = 0;
e20cf8d3f1f763 Paolo Abeni        2018-11-07  727  			continue;
e20cf8d3f1f763 Paolo Abeni        2018-11-07  728  		}
e20cf8d3f1f763 Paolo Abeni        2018-11-07  729  
9fd1ff5d2ac718 Steffen Klassert   2020-01-25  730  		if (NAPI_GRO_CB(skb)->is_flist != NAPI_GRO_CB(p)->is_flist) {
9fd1ff5d2ac718 Steffen Klassert   2020-01-25  731  			NAPI_GRO_CB(skb)->flush = 1;
9fd1ff5d2ac718 Steffen Klassert   2020-01-25  732  			return p;
9fd1ff5d2ac718 Steffen Klassert   2020-01-25  733  		}
9fd1ff5d2ac718 Steffen Klassert   2020-01-25  734  
4b0ebbca3e1679 Richard Gobert     2024-05-09  735  		flush = gro_receive_network_flush(uh, uh2, p);
5babae777c61aa Richard Gobert     2024-04-30  736  
e20cf8d3f1f763 Paolo Abeni        2018-11-07  737  		/* Terminate the flow on len mismatch or if it grow "too much".
e20cf8d3f1f763 Paolo Abeni        2018-11-07  738  		 * Under small packet flood GRO count could elsewhere grow a lot
4dd2b82d5adfbe Eric Dumazet       2019-05-01  739  		 * leading to excessive truesize values.
21f1b8a6636c4d Paolo Abeni        2019-04-26  740  		 * On len mismatch merge the first packet shorter than gso_size,
21f1b8a6636c4d Paolo Abeni        2019-04-26  741  		 * otherwise complete the GRO packet.
e20cf8d3f1f763 Paolo Abeni        2018-11-07  742  		 */
57eb5d520e5320 Maxim Mikityanskiy 2025-10-21 @743  		if (ulen > udp_get_len_short(uh2) || flush) {
9fd1ff5d2ac718 Steffen Klassert   2020-01-25  744  			pp = p;
9fd1ff5d2ac718 Steffen Klassert   2020-01-25  745  		} else {
9fd1ff5d2ac718 Steffen Klassert   2020-01-25  746  			if (NAPI_GRO_CB(skb)->is_flist) {
9fd1ff5d2ac718 Steffen Klassert   2020-01-25  747  				if (!pskb_may_pull(skb, skb_gro_offset(skb))) {
9fd1ff5d2ac718 Steffen Klassert   2020-01-25  748  					NAPI_GRO_CB(skb)->flush = 1;
9fd1ff5d2ac718 Steffen Klassert   2020-01-25  749  					return NULL;
9fd1ff5d2ac718 Steffen Klassert   2020-01-25  750  				}
9fd1ff5d2ac718 Steffen Klassert   2020-01-25  751  				if ((skb->ip_summed != p->ip_summed) ||
9fd1ff5d2ac718 Steffen Klassert   2020-01-25  752  				    (skb->csum_level != p->csum_level)) {
9fd1ff5d2ac718 Steffen Klassert   2020-01-25  753  					NAPI_GRO_CB(skb)->flush = 1;
9fd1ff5d2ac718 Steffen Klassert   2020-01-25  754  					return NULL;
9fd1ff5d2ac718 Steffen Klassert   2020-01-25  755  				}
9f735b6f8a77d7 Felix Fietkau      2025-07-05  756  				skb_set_network_header(skb, skb_gro_receive_network_offset(skb));
9fd1ff5d2ac718 Steffen Klassert   2020-01-25  757  				ret = skb_gro_receive_list(p, skb);
9fd1ff5d2ac718 Steffen Klassert   2020-01-25  758  			} else {
9fd1ff5d2ac718 Steffen Klassert   2020-01-25  759  				skb_gro_postpull_rcsum(skb, uh,
9fd1ff5d2ac718 Steffen Klassert   2020-01-25  760  						       sizeof(struct udphdr));
9fd1ff5d2ac718 Steffen Klassert   2020-01-25  761  
9fd1ff5d2ac718 Steffen Klassert   2020-01-25  762  				ret = skb_gro_receive(p, skb);
9fd1ff5d2ac718 Steffen Klassert   2020-01-25  763  			}
9fd1ff5d2ac718 Steffen Klassert   2020-01-25  764  		}
9fd1ff5d2ac718 Steffen Klassert   2020-01-25  765  
57eb5d520e5320 Maxim Mikityanskiy 2025-10-21  766  		if (ret || ulen != udp_get_len_short(uh2) ||
e20cf8d3f1f763 Paolo Abeni        2018-11-07  767  		    NAPI_GRO_CB(p)->count >= UDP_GRO_CNT_MAX)
e20cf8d3f1f763 Paolo Abeni        2018-11-07  768  			pp = p;
e20cf8d3f1f763 Paolo Abeni        2018-11-07  769  
e20cf8d3f1f763 Paolo Abeni        2018-11-07  770  		return pp;
e20cf8d3f1f763 Paolo Abeni        2018-11-07  771  	}
e20cf8d3f1f763 Paolo Abeni        2018-11-07  772  
e20cf8d3f1f763 Paolo Abeni        2018-11-07  773  	/* mismatch, but we never need to flush */
e20cf8d3f1f763 Paolo Abeni        2018-11-07  774  	return NULL;
e20cf8d3f1f763 Paolo Abeni        2018-11-07  775  }
e20cf8d3f1f763 Paolo Abeni        2018-11-07  776  

:::::: The code at line 743 was first introduced by commit
:::::: 57eb5d520e532063143bb2c4b08f6e3ec36d5bee net: Use helpers to get/set UDP len tree-wide

:::::: TO: Maxim Mikityanskiy <maxim@isovalent.com>
:::::: CC: Maxim Mikityanskiy <maxim@isovalent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
