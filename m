Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339BF2D5A0C;
	Wed, 22 Oct 2025 23:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761175998; cv=none; b=HHqTvg1ym+0hSC2CiBYUCDapJhuCuW5Z4ZPqzivbAfOqcVScAr+ZLcCGIUXJH88t9de+1JqVxsZSqrEiNHdHvL2ZKXN0Nvbfr1uKgjbQ4EWEfah6g1yevtT922sLx1WBSB+z/xqHr4MKWFt/IC4s106+A/1aefUWfdxVlYlB2Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761175998; c=relaxed/simple;
	bh=4NuAGL1cGZJ6e0a8C5CF1M/Okh0/0I5YTI/Z42jpmZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F2wZFhoN15vcFRdlN1GPAujRfoGcFEQPXxQRHUqmE7vternQhBCAnzUtG0numAz5uwXpp3Ve2wP6HWbpMfFfXchzzUlV8DUplC2Toc5yTkAzLjc6a3qw7v1FJmopl9kwNhcNNbH7nioXnFmyjpDIrAp0x6vC/yRAQT+EgQc7W3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mlGFK9I/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mlGFK9I/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761175996; x=1792711996;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4NuAGL1cGZJ6e0a8C5CF1M/Okh0/0I5YTI/Z42jpmZk=;
  b=mlGFK9I/GaQ4xIw+aca81svASAv7sFmEw8cSbKqubIXQczxZ7aow/rg0
   42pvv+2BuCgNgZ6HbhAIZPtJeUo35U67/hmpAJwrZzWTkkpa2YE63CtN1
   pyWy/G1rucMw1/jIK/ch2DEQ/y900Jf0efqmHsOHf9Qmpu3ZRREqx1hbv
   pz8EcuhUYqT9p5zIRhtJ09d8a7HDKdfXsra4vYKGzfonhJcMSnBf03p8y
   c8KXqvMoScdgDKcdRgwOGs9uPLQaxv+9hmP8XGL5dOCcVU0UtGGycx2Fy
   0grrygcGVc3pmqc3QaPm54yC05e/jBGPaYmmp0XOjICw2avBBYtORnUVF
   Q==;
X-CSE-ConnectionGUID: LiSA880vQf6ilk7uCxA4rA==
X-CSE-MsgGUID: wB6JQ2PrTP6xIFrxyxqNJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74006820"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="74006820"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 16:33:16 -0700
X-CSE-ConnectionGUID: X5FDYiBBSIOaCHLgpQWJRw==
X-CSE-MsgGUID: WiwXutIBTemOfIh5y17R8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="184059538"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 22 Oct 2025 16:33:14 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBiKG-000CpV-33;
	Wed, 22 Oct 2025 23:33:09 +0000
Date: Thu, 23 Oct 2025 07:32:10 +0800
From: kernel test robot <lkp@intel.com>
To: Steffen Klassert <steffen.klassert@secunet.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC ipsec-next] esp: Consolidate esp4 and esp6.
Message-ID: <202510230746.7ZvmpD5O-lkp@intel.com>
References: <aPhzm0lzMXGSpf22@secunet.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPhzm0lzMXGSpf22@secunet.com>

Hi Steffen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on klassert-ipsec-next/master]
[also build test ERROR on klassert-ipsec/master linus/master v6.18-rc2 next-20251022]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steffen-Klassert/esp-Consolidate-esp4-and-esp6/20251022-140856
base:   https://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec-next.git master
patch link:    https://lore.kernel.org/r/aPhzm0lzMXGSpf22%40secunet.com
patch subject: [PATCH RFC ipsec-next] esp: Consolidate esp4 and esp6.
config: i386-buildonly-randconfig-004-20251023 (https://download.01.org/0day-ci/archive/20251023/202510230746.7ZvmpD5O-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510230746.7ZvmpD5O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510230746.7ZvmpD5O-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> net/ipv6/esp6.c:53:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct sock *' [-Wint-conversion]
      53 |         return -EOPNOTSUPP;
         |                ^~~~~~~~~~~
>> net/ipv6/esp6.c:78:6: warning: variable 'hdr_len' set but not used [-Wunused-but-set-variable]
      78 |         int hdr_len = skb_network_header_len(skb);
         |             ^
   1 warning and 1 error generated.


vim +53 net/ipv6/esp6.c

26333c37fc285e Sabrina Dubroca  2020-04-27   48  
26333c37fc285e Sabrina Dubroca  2020-04-27   49  #else
110277bee31750 Steffen Klassert 2025-10-22   50  static struct sock *esp6_find_tcp_sk(struct xfrm_state *x)
26333c37fc285e Sabrina Dubroca  2020-04-27   51  {
96f887a612e4cd Hagar Hemdan     2024-05-18   52  	WARN_ON(1);
26333c37fc285e Sabrina Dubroca  2020-04-27  @53  	return -EOPNOTSUPP;
26333c37fc285e Sabrina Dubroca  2020-04-27   54  }
26333c37fc285e Sabrina Dubroca  2020-04-27   55  #endif
26333c37fc285e Sabrina Dubroca  2020-04-27   56  
110277bee31750 Steffen Klassert 2025-10-22   57  static void esp6_output_encap_csum(struct sk_buff *skb)
0146dca70b877b Sabrina Dubroca  2020-04-27   58  {
0146dca70b877b Sabrina Dubroca  2020-04-27   59  	/* UDP encap with IPv6 requires a valid checksum */
0146dca70b877b Sabrina Dubroca  2020-04-27   60  	if (*skb_mac_header(skb) == IPPROTO_UDP) {
0146dca70b877b Sabrina Dubroca  2020-04-27   61  		struct udphdr *uh = udp_hdr(skb);
0146dca70b877b Sabrina Dubroca  2020-04-27   62  		struct ipv6hdr *ip6h = ipv6_hdr(skb);
0146dca70b877b Sabrina Dubroca  2020-04-27   63  		int len = ntohs(uh->len);
0146dca70b877b Sabrina Dubroca  2020-04-27   64  		unsigned int offset = skb_transport_offset(skb);
0146dca70b877b Sabrina Dubroca  2020-04-27   65  		__wsum csum = skb_checksum(skb, offset, skb->len - offset, 0);
0146dca70b877b Sabrina Dubroca  2020-04-27   66  
0146dca70b877b Sabrina Dubroca  2020-04-27   67  		uh->check = csum_ipv6_magic(&ip6h->saddr, &ip6h->daddr,
0146dca70b877b Sabrina Dubroca  2020-04-27   68  					    len, IPPROTO_UDP, csum);
0146dca70b877b Sabrina Dubroca  2020-04-27   69  		if (uh->check == 0)
0146dca70b877b Sabrina Dubroca  2020-04-27   70  			uh->check = CSUM_MANGLED_0;
0146dca70b877b Sabrina Dubroca  2020-04-27   71  	}
0146dca70b877b Sabrina Dubroca  2020-04-27   72  }
0146dca70b877b Sabrina Dubroca  2020-04-27   73  
110277bee31750 Steffen Klassert 2025-10-22   74  static int esp6_input_encap(struct sk_buff *skb, struct xfrm_state *x)
38320c70d282be Herbert Xu       2008-01-28   75  {
0146dca70b877b Sabrina Dubroca  2020-04-27   76  	const struct ipv6hdr *ip6h = ipv6_hdr(skb);
17175d1a27c618 Sabrina Dubroca  2020-07-03   77  	int offset = skb_network_offset(skb) + sizeof(*ip6h);
110277bee31750 Steffen Klassert 2025-10-22  @78  	int hdr_len = skb_network_header_len(skb);
0146dca70b877b Sabrina Dubroca  2020-04-27   79  	struct xfrm_encap_tmpl *encap = x->encap;
17175d1a27c618 Sabrina Dubroca  2020-07-03   80  	u8 nexthdr = ip6h->nexthdr;
17175d1a27c618 Sabrina Dubroca  2020-07-03   81  	__be16 frag_off, source;
17175d1a27c618 Sabrina Dubroca  2020-07-03   82  	struct udphdr *uh;
17175d1a27c618 Sabrina Dubroca  2020-07-03   83  	struct tcphdr *th;
110277bee31750 Steffen Klassert 2025-10-22   84  	int err = 0;
17175d1a27c618 Sabrina Dubroca  2020-07-03   85  
17175d1a27c618 Sabrina Dubroca  2020-07-03   86  	offset = ipv6_skip_exthdr(skb, offset, &nexthdr, &frag_off);
4db4075f92af2b Sabrina Dubroca  2022-03-10   87  	if (offset == -1) {
5f9c55c8066bcd Jordy Zomer      2021-11-17   88  		err = -EINVAL;
5f9c55c8066bcd Jordy Zomer      2021-11-17   89  		goto out;
5f9c55c8066bcd Jordy Zomer      2021-11-17   90  	}
5f9c55c8066bcd Jordy Zomer      2021-11-17   91  
17175d1a27c618 Sabrina Dubroca  2020-07-03   92  	uh = (void *)(skb->data + offset);
17175d1a27c618 Sabrina Dubroca  2020-07-03   93  	th = (void *)(skb->data + offset);
d5dba1376e2baf Sabrina Dubroca  2020-07-27   94  	hdr_len += offset;
0146dca70b877b Sabrina Dubroca  2020-04-27   95  
0146dca70b877b Sabrina Dubroca  2020-04-27   96  	switch (x->encap->encap_type) {
26333c37fc285e Sabrina Dubroca  2020-04-27   97  	case TCP_ENCAP_ESPINTCP:
26333c37fc285e Sabrina Dubroca  2020-04-27   98  		source = th->source;
26333c37fc285e Sabrina Dubroca  2020-04-27   99  		break;
0146dca70b877b Sabrina Dubroca  2020-04-27  100  	case UDP_ENCAP_ESPINUDP:
0146dca70b877b Sabrina Dubroca  2020-04-27  101  		source = uh->source;
0146dca70b877b Sabrina Dubroca  2020-04-27  102  		break;
0146dca70b877b Sabrina Dubroca  2020-04-27  103  	default:
0146dca70b877b Sabrina Dubroca  2020-04-27  104  		WARN_ON_ONCE(1);
0146dca70b877b Sabrina Dubroca  2020-04-27  105  		err = -EINVAL;
0146dca70b877b Sabrina Dubroca  2020-04-27  106  		goto out;
0146dca70b877b Sabrina Dubroca  2020-04-27  107  	}
0146dca70b877b Sabrina Dubroca  2020-04-27  108  
0146dca70b877b Sabrina Dubroca  2020-04-27  109  	/*
0146dca70b877b Sabrina Dubroca  2020-04-27  110  	 * 1) if the NAT-T peer's IP or port changed then
1711435e3e67e0 Deming Wang      2023-10-25  111  	 *    advertise the change to the keying daemon.
0146dca70b877b Sabrina Dubroca  2020-04-27  112  	 *    This is an inbound SA, so just compare
0146dca70b877b Sabrina Dubroca  2020-04-27  113  	 *    SRC ports.
0146dca70b877b Sabrina Dubroca  2020-04-27  114  	 */
0146dca70b877b Sabrina Dubroca  2020-04-27  115  	if (!ipv6_addr_equal(&ip6h->saddr, &x->props.saddr.in6) ||
0146dca70b877b Sabrina Dubroca  2020-04-27  116  	    source != encap->encap_sport) {
0146dca70b877b Sabrina Dubroca  2020-04-27  117  		xfrm_address_t ipaddr;
0146dca70b877b Sabrina Dubroca  2020-04-27  118  
0146dca70b877b Sabrina Dubroca  2020-04-27  119  		memcpy(&ipaddr.a6, &ip6h->saddr.s6_addr, sizeof(ipaddr.a6));
0146dca70b877b Sabrina Dubroca  2020-04-27  120  		km_new_mapping(x, &ipaddr, source);
0146dca70b877b Sabrina Dubroca  2020-04-27  121  
0146dca70b877b Sabrina Dubroca  2020-04-27  122  		/* XXX: perhaps add an extra
0146dca70b877b Sabrina Dubroca  2020-04-27  123  		 * policy check here, to see
0146dca70b877b Sabrina Dubroca  2020-04-27  124  		 * if we should allow or
0146dca70b877b Sabrina Dubroca  2020-04-27  125  		 * reject a packet from a
0146dca70b877b Sabrina Dubroca  2020-04-27  126  		 * different source
0146dca70b877b Sabrina Dubroca  2020-04-27  127  		 * address/port.
0146dca70b877b Sabrina Dubroca  2020-04-27  128  		 */
0146dca70b877b Sabrina Dubroca  2020-04-27  129  	}
0146dca70b877b Sabrina Dubroca  2020-04-27  130  
0146dca70b877b Sabrina Dubroca  2020-04-27  131  	/*
0146dca70b877b Sabrina Dubroca  2020-04-27  132  	 * 2) ignore UDP/TCP checksums in case
0146dca70b877b Sabrina Dubroca  2020-04-27  133  	 *    of NAT-T in Transport Mode, or
0146dca70b877b Sabrina Dubroca  2020-04-27  134  	 *    perform other post-processing fixes
0146dca70b877b Sabrina Dubroca  2020-04-27  135  	 *    as per draft-ietf-ipsec-udp-encaps-06,
0146dca70b877b Sabrina Dubroca  2020-04-27  136  	 *    section 3.1.2
0146dca70b877b Sabrina Dubroca  2020-04-27  137  	 */
0146dca70b877b Sabrina Dubroca  2020-04-27  138  	if (x->props.mode == XFRM_MODE_TRANSPORT)
0146dca70b877b Sabrina Dubroca  2020-04-27  139  		skb->ip_summed = CHECKSUM_UNNECESSARY;
38320c70d282be Herbert Xu       2008-01-28  140  
38320c70d282be Herbert Xu       2008-01-28  141  out:
^1da177e4c3f41 Linus Torvalds   2005-04-16  142  	return err;
^1da177e4c3f41 Linus Torvalds   2005-04-16  143  }
^1da177e4c3f41 Linus Torvalds   2005-04-16  144  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
