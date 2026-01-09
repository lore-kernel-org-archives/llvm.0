Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903D631577B;
	Fri,  9 Jan 2026 11:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767956546; cv=none; b=PwYBuyOLtgAZSPLoeU3aJXS9Wsk+ZqoMpPVPbSEkh4AUyoJu0O3jR334IpKaEUmufMhEE4eJq7f+xY1VFlJb117fp/wPyiHp7ngWnysegWvm5qjHqBNORzKtEaUF6SLpXvnHH2ZqJUsOCQ0k0YeB8fAklQBC5Qn/tUmHYcIygUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767956546; c=relaxed/simple;
	bh=NLAzUFsYzqRocu0Mbc+PVUKaBpxEzEiinbIfImNWFtg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oVKdOmO9TTxK4tfxcwFX2Z7l8tb8fLgYolbCv1SzgTCks9s6+EibEQivy63w+kZtJxJ31PVhRE1yufzIpbdQ5Xxb5f/S/BNGx4IXmjLy/kcwlToli0qsoPuzo4R1+6fAtsbGzdIKmOTYJ3EEtwhSUAPPicrHCjAWQxayMmP7bdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AHbEZsJp; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AHbEZsJp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767956544; x=1799492544;
  h=date:from:to:cc:subject:message-id;
  bh=NLAzUFsYzqRocu0Mbc+PVUKaBpxEzEiinbIfImNWFtg=;
  b=AHbEZsJpbZmCLbOV8xipgAB5fZsn8p6sHO3eVFVJI/IUHilnSk9um12s
   8JXYxR67gPSgHiXj5oLAcNPJoNYaPLzBNueowaUKMi6IDFHDhwE3w3ObE
   oi3pqZc3I87NVl5TdrhYCkCsiugqV3xc//uQK0bxJGf0JVDfGIzNISGxv
   R7IUd1m8OPZkgljYHJLG4YHJNkQiokT3PSwsk8HsnzS36xDnS3/c/S1ge
   zjHL2RfV22jrZl8dWPugRZmHP+8aH1St4sUHAjut5mqDFI3f3EiWJEaaa
   gVDXWDFCvusGL7vQJQHQGTaXyPTlbGdNrO4FPPf1amDf5ZGwJwykpg8Ra
   g==;
X-CSE-ConnectionGUID: W7A8c95OQueFDl6o1i1nyg==
X-CSE-MsgGUID: CbDQPCt5SXSPfTolAaaADQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="72973377"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="72973377"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 03:02:24 -0800
X-CSE-ConnectionGUID: syqDyg7CTU2BspCIuMx7tw==
X-CSE-MsgGUID: Q+v9eWzYTieEwV1tCzaDEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="226820203"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 09 Jan 2026 03:02:22 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veAG3-0000000023U-3oNR;
	Fri, 09 Jan 2026 11:02:19 +0000
Date: Fri, 09 Jan 2026 12:01:30 +0100
From: kernel test robot <lkp@intel.com>
To: Maxim Mikityanskiy <maxim@isovalent.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:max/vxlan-bigtcp 21/21]
 net/ipv4/udp_offload.c:743:7: warning: variable 'ulen' is uninitialized when
 used here
Message-ID: <202601091257.BJEzIJ6l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/cilium/linux.git max/vxlan-bigtcp
head:   de0493575c7f01a82c2b58b308fae122df5aa143
commit: de0493575c7f01a82c2b58b308fae122df5aa143 [21/21] tmp: combine checks
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260109/202601091257.BJEzIJ6l-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601091257.BJEzIJ6l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601091257.BJEzIJ6l-lkp@intel.com/

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

da5bab079f9b7d9 Daniel Borkmann    2013-06-08  695  
0b935d7f8c07bf0 Eric Dumazet       2021-11-15  696  
e20cf8d3f1f763a Paolo Abeni        2018-11-07  697  #define UDP_GRO_CNT_MAX 64
e20cf8d3f1f763a Paolo Abeni        2018-11-07  698  static struct sk_buff *udp_gro_receive_segment(struct list_head *head,
e20cf8d3f1f763a Paolo Abeni        2018-11-07  699  					       struct sk_buff *skb)
e20cf8d3f1f763a Paolo Abeni        2018-11-07  700  {
4b1a86281cc1d0d Alexander Lobakin  2020-11-11  701  	struct udphdr *uh = udp_gro_udphdr(skb);
e20cf8d3f1f763a Paolo Abeni        2018-11-07  702  	struct sk_buff *pp = NULL;
e20cf8d3f1f763a Paolo Abeni        2018-11-07  703  	struct udphdr *uh2;
e20cf8d3f1f763a Paolo Abeni        2018-11-07  704  	struct sk_buff *p;
4dd2b82d5adfbe0 Eric Dumazet       2019-05-01  705  	unsigned int ulen;
9fd1ff5d2ac7181 Steffen Klassert   2020-01-25  706  	int ret = 0;
5babae777c61aa8 Richard Gobert     2024-04-30  707  	int flush;
e20cf8d3f1f763a Paolo Abeni        2018-11-07  708  
e20cf8d3f1f763a Paolo Abeni        2018-11-07  709  	/* requires non zero csum, for symmetry with GSO */
e20cf8d3f1f763a Paolo Abeni        2018-11-07  710  	if (!uh->check) {
e20cf8d3f1f763a Paolo Abeni        2018-11-07  711  		NAPI_GRO_CB(skb)->flush = 1;
e20cf8d3f1f763a Paolo Abeni        2018-11-07  712  		return NULL;
e20cf8d3f1f763a Paolo Abeni        2018-11-07  713  	}
e20cf8d3f1f763a Paolo Abeni        2018-11-07  714  
e20cf8d3f1f763a Paolo Abeni        2018-11-07  715  	/* pull encapsulating udp header */
e20cf8d3f1f763a Paolo Abeni        2018-11-07  716  	skb_gro_pull(skb, sizeof(struct udphdr));
e20cf8d3f1f763a Paolo Abeni        2018-11-07  717  
e20cf8d3f1f763a Paolo Abeni        2018-11-07  718  	list_for_each_entry(p, head, list) {
e20cf8d3f1f763a Paolo Abeni        2018-11-07  719  		if (!NAPI_GRO_CB(p)->same_flow)
e20cf8d3f1f763a Paolo Abeni        2018-11-07  720  			continue;
e20cf8d3f1f763a Paolo Abeni        2018-11-07  721  
e20cf8d3f1f763a Paolo Abeni        2018-11-07  722  		uh2 = udp_hdr(p);
e20cf8d3f1f763a Paolo Abeni        2018-11-07  723  
e20cf8d3f1f763a Paolo Abeni        2018-11-07  724  		/* Match ports only, as csum is always non zero */
e20cf8d3f1f763a Paolo Abeni        2018-11-07  725  		if ((*(u32 *)&uh->source != *(u32 *)&uh2->source)) {
e20cf8d3f1f763a Paolo Abeni        2018-11-07  726  			NAPI_GRO_CB(p)->same_flow = 0;
e20cf8d3f1f763a Paolo Abeni        2018-11-07  727  			continue;
e20cf8d3f1f763a Paolo Abeni        2018-11-07  728  		}
e20cf8d3f1f763a Paolo Abeni        2018-11-07  729  
9fd1ff5d2ac7181 Steffen Klassert   2020-01-25  730  		if (NAPI_GRO_CB(skb)->is_flist != NAPI_GRO_CB(p)->is_flist) {
9fd1ff5d2ac7181 Steffen Klassert   2020-01-25  731  			NAPI_GRO_CB(skb)->flush = 1;
9fd1ff5d2ac7181 Steffen Klassert   2020-01-25  732  			return p;
9fd1ff5d2ac7181 Steffen Klassert   2020-01-25  733  		}
9fd1ff5d2ac7181 Steffen Klassert   2020-01-25  734  
4b0ebbca3e16797 Richard Gobert     2024-05-09  735  		flush = gro_receive_network_flush(uh, uh2, p);
5babae777c61aa8 Richard Gobert     2024-04-30  736  
e20cf8d3f1f763a Paolo Abeni        2018-11-07  737  		/* Terminate the flow on len mismatch or if it grow "too much".
e20cf8d3f1f763a Paolo Abeni        2018-11-07  738  		 * Under small packet flood GRO count could elsewhere grow a lot
4dd2b82d5adfbe0 Eric Dumazet       2019-05-01  739  		 * leading to excessive truesize values.
21f1b8a6636c4db Paolo Abeni        2019-04-26  740  		 * On len mismatch merge the first packet shorter than gso_size,
21f1b8a6636c4db Paolo Abeni        2019-04-26  741  		 * otherwise complete the GRO packet.
e20cf8d3f1f763a Paolo Abeni        2018-11-07  742  		 */
57eb5d520e53206 Maxim Mikityanskiy 2025-10-21 @743  		if (ulen > udp_get_len_short(uh2) || flush) {
9fd1ff5d2ac7181 Steffen Klassert   2020-01-25  744  			pp = p;
9fd1ff5d2ac7181 Steffen Klassert   2020-01-25  745  		} else {
9fd1ff5d2ac7181 Steffen Klassert   2020-01-25  746  			if (NAPI_GRO_CB(skb)->is_flist) {
9fd1ff5d2ac7181 Steffen Klassert   2020-01-25  747  				if (!pskb_may_pull(skb, skb_gro_offset(skb))) {
9fd1ff5d2ac7181 Steffen Klassert   2020-01-25  748  					NAPI_GRO_CB(skb)->flush = 1;
9fd1ff5d2ac7181 Steffen Klassert   2020-01-25  749  					return NULL;
9fd1ff5d2ac7181 Steffen Klassert   2020-01-25  750  				}
9fd1ff5d2ac7181 Steffen Klassert   2020-01-25  751  				if ((skb->ip_summed != p->ip_summed) ||
9fd1ff5d2ac7181 Steffen Klassert   2020-01-25  752  				    (skb->csum_level != p->csum_level)) {
9fd1ff5d2ac7181 Steffen Klassert   2020-01-25  753  					NAPI_GRO_CB(skb)->flush = 1;
9fd1ff5d2ac7181 Steffen Klassert   2020-01-25  754  					return NULL;
9fd1ff5d2ac7181 Steffen Klassert   2020-01-25  755  				}
9f735b6f8a77d7b Felix Fietkau      2025-07-05  756  				skb_set_network_header(skb, skb_gro_receive_network_offset(skb));
9fd1ff5d2ac7181 Steffen Klassert   2020-01-25  757  				ret = skb_gro_receive_list(p, skb);
9fd1ff5d2ac7181 Steffen Klassert   2020-01-25  758  			} else {
9fd1ff5d2ac7181 Steffen Klassert   2020-01-25  759  				skb_gro_postpull_rcsum(skb, uh,
9fd1ff5d2ac7181 Steffen Klassert   2020-01-25  760  						       sizeof(struct udphdr));
9fd1ff5d2ac7181 Steffen Klassert   2020-01-25  761  
9fd1ff5d2ac7181 Steffen Klassert   2020-01-25  762  				ret = skb_gro_receive(p, skb);
9fd1ff5d2ac7181 Steffen Klassert   2020-01-25  763  			}
9fd1ff5d2ac7181 Steffen Klassert   2020-01-25  764  		}
9fd1ff5d2ac7181 Steffen Klassert   2020-01-25  765  
57eb5d520e53206 Maxim Mikityanskiy 2025-10-21  766  		if (ret || ulen != udp_get_len_short(uh2) ||
e20cf8d3f1f763a Paolo Abeni        2018-11-07  767  		    NAPI_GRO_CB(p)->count >= UDP_GRO_CNT_MAX)
e20cf8d3f1f763a Paolo Abeni        2018-11-07  768  			pp = p;
e20cf8d3f1f763a Paolo Abeni        2018-11-07  769  
e20cf8d3f1f763a Paolo Abeni        2018-11-07  770  		return pp;
e20cf8d3f1f763a Paolo Abeni        2018-11-07  771  	}
e20cf8d3f1f763a Paolo Abeni        2018-11-07  772  
e20cf8d3f1f763a Paolo Abeni        2018-11-07  773  	/* mismatch, but we never need to flush */
e20cf8d3f1f763a Paolo Abeni        2018-11-07  774  	return NULL;
e20cf8d3f1f763a Paolo Abeni        2018-11-07  775  }
e20cf8d3f1f763a Paolo Abeni        2018-11-07  776  

:::::: The code at line 743 was first introduced by commit
:::::: 57eb5d520e532063143bb2c4b08f6e3ec36d5bee net: Use helpers to get/set UDP len tree-wide

:::::: TO: Maxim Mikityanskiy <maxim@isovalent.com>
:::::: CC: Maxim Mikityanskiy <maxim@isovalent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
