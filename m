Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E834A49DBB9;
	Thu,  1 Oct 2026 16:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873950; cv=none; b=WTZnIWqsLCAeLYTUaODng1siXIbmS8QRifUJNM5f3NttSpffbsoRaCA/CScewXmHMyMcUaJ9z0BibULjMEryujaOC6XwTQEnA3zACzru2qAintKZ4OH2p6VbfavqWREdvT4kIfcr9LsM70sZu1eBNAnlAL+KlHrMGLwP11N1aow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873950; c=relaxed/simple;
	bh=US636mPlqMTdVvPy6JexEbt2KEXiPNgJhzptFT4MmDM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sprgK3fmfgBflbSZ+OVO7+/HDkIkMKEsyghLUY81lfvRy3bzwCTGthtO0YhnX2mc2i0ufJ6TXTSa+7PKZAKxtBp11IMBdXjRZVuxIwNZnGA77JlNBf9esvJlo6MudgByxXHsrZ4WhHGW9e5kF5jSoWG9HYivhCHfBmemo+ceRcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UZZN0Y3y; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UZZN0Y3y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790873949; x=1822409949;
  h=date:from:to:cc:subject:message-id;
  bh=US636mPlqMTdVvPy6JexEbt2KEXiPNgJhzptFT4MmDM=;
  b=UZZN0Y3yG1DZUI3XRnNPFQXDuXRo7MKAnEIvat36pyNQaDytc+P3QcqI
   plg4jLimBXtzHZwKt1x6+ctjJ356xt26dcvBSj+gyZG+tC5dSe2lab3Sr
   ggNAc/8c5VCfyzRbsd3n3MqkPHKCyvfHd3qLsowztk6MC8zNeuYwFU6+f
   nJoE85B02TszeWS6M6qJQFIhPutz+fQP9nvtoSW8KJPSa4siipRr6MNW0
   4tjQKR5YvVYto1I8vnKyCXAqzKi2UXvOT+cEAv0+ZFLYGLKKU354/I0tM
   8JGSwKpS/+Rfoi9XRx+Xu5aLrbGCnFYWRAhLQq6nypb86d0DCx0dgZzx2
   w==;
X-CSE-ConnectionGUID: iTVXhCZQTkeM/2f6LnwJCA==
X-CSE-MsgGUID: pdFGoz5ORDKCCimJF7XvqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="108020350"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="108020350"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 09:59:08 -0700
X-CSE-ConnectionGUID: rYRZyl/1QFGIOBt9VDJHPg==
X-CSE-MsgGUID: reHRoPHbS7iOMJxqdTXEIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="279344887"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 01 Oct 2026 09:59:07 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCK7a-0000000009L-0P4T;
	Thu, 01 Oct 2026 16:59:02 +0000
Date: Thu, 01 Oct 2026 18:58:14 +0200
From: kernel test robot <lkp@intel.com>
To: Fernando Fernandez Mancera <fmancera@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: include/net/route.h:176:63: warning: omitting the parameter
 name in a function definition is a C2x extension
Message-ID: <202610011836.LY2TSmkY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Fernando-Fernandez-Mancera/ipv4-introduce-CONFIG_IPV4-to-decouple-the-IPv4-stack/20260928-212957
head:   9699ec4e92ef081fbb0e1a4247538ba53e5b17bf
commit: 809c9f483b87854f5b7ede3ce9ac6e372855169c net: core: add IPv4 fallback stubs and guards for CONFIG_IPV4=n
date:   3 days ago
config: um-randconfig-2000-20261001 (https://download.01.org/0day-ci/archive/20261001/202610011836.LY2TSmkY-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261001/202610011836.LY2TSmkY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610011836.LY2TSmkY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/eventpoll.c:23:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   In file included from fs/eventpoll.c:42:
   In file included from include/net/busy_poll.h:18:
   In file included from include/net/ip.h:30:
>> include/net/route.h:176:63: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
     176 | static inline struct rtable *ip_route_output_flow(struct net *, struct flowi4 *flp,
         |                                                               ^
   2 warnings generated.


vim +176 include/net/route.h

   171	
   172	#if IS_ENABLED(CONFIG_IPV4)
   173	struct rtable *ip_route_output_flow(struct net *, struct flowi4 *flp,
   174					    const struct sock *sk);
   175	#else
 > 176	static inline struct rtable *ip_route_output_flow(struct net *, struct flowi4 *flp,
   177							  const struct sock *sk)
   178	{
   179		return ERR_PTR(-EAFNOSUPPORT);
   180	}
   181	#endif
   182	struct dst_entry *ipv4_blackhole_route(struct net *net,
   183					       struct dst_entry *dst_orig);
   184	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
