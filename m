Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C8A1DC19E;
	Sun, 17 Nov 2024 22:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731884149; cv=none; b=A/TWh1M643c1awt2g2wyQ/5K/SToaGBzoLF0gx5UE0Wxm131PbVAvI5QqfhRFzmV2CL2lUKNnqDe4aO1g+YwC0ZgR8WDkkmkgOvYjEjYxu8jd23E5rafywJ1opgEx+Adav9MOQ0EwpFQzep2+7NCFoQPgTtm0V6mMEuhRhVUFns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731884149; c=relaxed/simple;
	bh=cjiA5sDSXbZmtHZPmTFA3SGiYQy3RC23Rlf5HVULNLY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tG+3qlrAhWSHrs75ZTi50zHylfca+p430HpGXCKrN6v0fMZFJHtJG++XNIT6/rcWtsfgMOM/wxONLcyD4/B8jYh0/gGBXR5dppfEj3gkkg/npL1SVOr6f4RaPWE3m7UTo4BdlWikHT0kB8bAXEPyRlrUwBAnD6g7Str/T0zv5UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PLD9XIlw; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PLD9XIlw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731884147; x=1763420147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cjiA5sDSXbZmtHZPmTFA3SGiYQy3RC23Rlf5HVULNLY=;
  b=PLD9XIlw2DADNN3WUw65Mce3FDuFBVMmmmy98LTPd9BnEw5axCEIMAkg
   UGpJOduV+SgnHC4w9Z45mptBG1V2jMFuuTdAbI+nlMvnumhP9fWs0z0hG
   uVgMNXAMc7j4yFO/Wg1F7kzF4W2TOa1fM3uoFkY2WKWYJjmRWSJfd32Rz
   sTxR5rxI0lfpNfuo+LNuRFANrNfLTRRp8051IdZz4tM4eQ5zhgmARbg9R
   UL8RhbqFyvCZJzjkwby27plCdzjdxkSH4Qi0Op5pljhE85Fa4VmUDJZ4Y
   Lqwcb91uMzZxDLsA/1wmByCLEhNusQJrMckui5y7L2EJgnyc0zA2I3Zg8
   g==;
X-CSE-ConnectionGUID: fGqnaLfCSLGll4i7q0EDTQ==
X-CSE-MsgGUID: pqbOIqMGRZmIyz4zgBm7XA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="54325007"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="54325007"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 14:55:47 -0800
X-CSE-ConnectionGUID: d1nTh8IYSLC+sB+Wfyr1CQ==
X-CSE-MsgGUID: eaJ8ohKbRGSqh9pr1VZXiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="88820925"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Nov 2024 14:55:45 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCoBC-00024d-2E;
	Sun, 17 Nov 2024 22:55:42 +0000
Date: Mon, 18 Nov 2024 06:55:19 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:rxrpc-iothread 57/64] net/rxrpc/rtt.c:133:18: warning:
 overflow in expression; result is 705'032'704 with type 'long'
Message-ID: <202411180634.Ebu62cEL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git rxrpc-iothread
head:   2f36eeb32c6d169f6def5f26b80a769ce6e47821
commit: 4edfde64fe9c9f12a4681434d61f4a70e1f7dfff [57/64] rxrpc: Generate rtt_min
config: hexagon-randconfig-002-20241118 (https://download.01.org/0day-ci/archive/20241118/202411180634.Ebu62cEL-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411180634.Ebu62cEL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411180634.Ebu62cEL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/rxrpc/rtt.c:11:
   In file included from include/linux/net.h:24:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from net/rxrpc/rtt.c:12:
   In file included from net/rxrpc/ar-internal.h:11:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from net/rxrpc/rtt.c:12:
   In file included from net/rxrpc/ar-internal.h:11:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from net/rxrpc/rtt.c:12:
   In file included from net/rxrpc/ar-internal.h:11:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> net/rxrpc/rtt.c:133:18: warning: overflow in expression; result is 705'032'704 with type 'long' [-Winteger-overflow]
     133 |         u32 wlen_us = 5 * NSEC_PER_SEC / 1024;
         |                       ~~^~~~~~~~~~~~~~
   8 warnings generated.


vim +133 net/rxrpc/rtt.c

   129	
   130	static void rxrpc_update_rtt_min(struct rxrpc_peer *peer, ktime_t resp_time, long rtt_us)
   131	{
   132		/* Window size 5mins in approx usec (ipv4.sysctl_tcp_min_rtt_wlen) */
 > 133		u32 wlen_us = 5 * NSEC_PER_SEC / 1024;
   134	
   135		minmax_running_min(&peer->min_rtt, wlen_us, resp_time / 1024,
   136				   (u32)rtt_us ? : jiffies_to_usecs(1));
   137	}
   138	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
