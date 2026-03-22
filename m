Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E81713DDAE;
	Sun, 22 Mar 2026 06:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774162563; cv=none; b=gkpYvR7U7U7FkICdLKuFCBdusrFgxV6+Egv8+wiH8ejLCOvSBBnxfyc19YSvE+XxqHwqToo0Uo4vePg7C7Xqq73FjB2WmnnK5NUZ1OnmHtM0zkP/tzJHDbVunJo1FRTnUPcI0+un0N/xBEeEaozLwe3I0kYkj9N4inEriksPViI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774162563; c=relaxed/simple;
	bh=r3hgbqyFFtvP9AAc73+VTsUTjxoLvj6hK8Ge/PRTBYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CO+WcxgB9zbERLho1MrM7+Pa7RouE32Tt0tWR1+3xPYH4xcBgt20u3sr2NmM9aHgaSeq8kCxoF9KvdGNeBXLH6mucP5F6ZWkfCHvLCh23RytwmbfyPgUI7m7i+hfyrddLq7wAel8CR0fUSMOL5k8c7S9PZ1EVLLmcPBOS0O2voQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J2shX8Nj; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J2shX8Nj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774162563; x=1805698563;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r3hgbqyFFtvP9AAc73+VTsUTjxoLvj6hK8Ge/PRTBYw=;
  b=J2shX8NjorKuBHvMc85aTnW0TOrY+fTiH6yv2Y39DbxURr9uHmnfmGYB
   EOIbwf1bHgZEwTQ7aHqxm9S7y896wwEFhikDU6s4VIyqviR5yNKHWhg/Z
   miULEF9adHJ3VH3KnXk4JATaJLyu45nMBeRpZ561zbdqRyYdlOnfmlZB3
   Qisf0z4Gmz54oyD5QuOaZuCWRP+1hOQ+cf3kPIVbd2WMmR2Z3xazPJuUl
   U7NsIuIrHBDapyaM7nA31le924rCUGtp1UvupbXxETslMeGfmVB0T89+6
   S8MZCUJ+KyLjly7dmj3qSbhjHC00QsOSxlKebTq3mH+VnfYPv2gWACRoY
   w==;
X-CSE-ConnectionGUID: 5yWDYhQPTzqvnCHMmd1SKA==
X-CSE-MsgGUID: ute6lfIDQOuPDXGElikqtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="97815613"
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="97815613"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 23:56:03 -0700
X-CSE-ConnectionGUID: QovQiBF0TwexhkwkeSV56w==
X-CSE-MsgGUID: hFIyRNwZRl+kdB5q/Dgs3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="227808559"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 21 Mar 2026 23:56:01 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4Cj6-000000001nZ-1dMa;
	Sun, 22 Mar 2026 06:55:57 +0000
Date: Sun, 22 Mar 2026 14:55:22 +0800
From: kernel test robot <lkp@intel.com>
To: Ralf Lici <ralf@mandelbit.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next 05/15] ipxlat: add IPv6 packet validation path
Message-ID: <202603221453.u8DVY8ud-lkp@intel.com>
References: <20260319151230.655687-6-ralf@mandelbit.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319151230.655687-6-ralf@mandelbit.com>

Hi Ralf,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Ralf-Lici/drivers-net-add-ipxlat-netdevice-skeleton-and-build-plumbing/20260321-005756
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260319151230.655687-6-ralf%40mandelbit.com
patch subject: [RFC net-next 05/15] ipxlat: add IPv6 packet validation path
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260322/202603221453.u8DVY8ud-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603221453.u8DVY8ud-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603221453.u8DVY8ud-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ipxlat/packet.c:452:18: warning: variable 'ip6' set but not used [-Wunused-but-set-variable]
     452 |         struct ipv6hdr *ip6;
         |                         ^
>> drivers/net/ipxlat/packet.c:686:9: error: call to undeclared function 'csum_ipv6_magic'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     686 |         csum = csum_ipv6_magic(&iph6->saddr, &iph6->daddr, len, NEXTHDR_ICMP,
         |                ^
   drivers/net/ipxlat/packet.c:686:9: note: did you mean 'csum_tcpudp_magic'?
   arch/hexagon/include/asm/checksum.h:21:9: note: 'csum_tcpudp_magic' declared here
      21 | __sum16 csum_tcpudp_magic(__be32 saddr, __be32 daddr,
         |         ^
   arch/hexagon/include/asm/checksum.h:20:27: note: expanded from macro 'csum_tcpudp_magic'
      20 | #define csum_tcpudp_magic csum_tcpudp_magic
         |                           ^
   1 warning and 1 error generated.


vim +/csum_ipv6_magic +686 drivers/net/ipxlat/packet.c

   674	
   675	static int ipxlat_v6_validate_icmp_csum(const struct sk_buff *skb)
   676	{
   677		struct ipv6hdr *iph6;
   678		unsigned int len;
   679		__sum16 csum;
   680	
   681		if (skb->ip_summed != CHECKSUM_NONE)
   682			return 0;
   683	
   684		iph6 = ipv6_hdr(skb);
   685		len = ipxlat_skb_datagram_len(skb);
 > 686		csum = csum_ipv6_magic(&iph6->saddr, &iph6->daddr, len, NEXTHDR_ICMP,
   687				       skb_checksum(skb, skb_transport_offset(skb), len,
   688						    0));
   689	
   690		return unlikely(csum) ? -EINVAL : 0;
   691	}
   692	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
