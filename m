Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D6717554;
	Sat, 10 Feb 2024 11:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707564801; cv=none; b=LKSDlsg+3fXJqlJo/HTZ6JFHhcZDJDs6oA89GfvHXLh5kSoP8qW74eFOu9N/oX+aKlMV94WPJs+qgZIohZNh7QkE73oGLYUQoXrOjtdcUZFj5CEkiBDDo3fdy6KLHy4M4DwJp14S10pAlkRQuwWPq22hUhvtkHUUFcB7rNCcMIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707564801; c=relaxed/simple;
	bh=j1OB/OMrX1bxPGG9OjNeAmWW7AX7FcjWAQz4R1t+qsE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=seU4g4+XGivOMQL4BQ5Y41cEhssQQR5YLPpstcsGbpELYMXX8602sY2yKZegLhontXx6/zl3xpiRbohPcY/gVvBenwZk4H8Is0fsOf1kExJLzwSD/8WMIWrFJe8AcHMnr0LjgvjcriU/ZZxcruZcM8twWTRYuUo/4UcMiDo8TX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nF/RLWs1; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nF/RLWs1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707564800; x=1739100800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j1OB/OMrX1bxPGG9OjNeAmWW7AX7FcjWAQz4R1t+qsE=;
  b=nF/RLWs1NnOIbvqtbGf1yN8Iif3gLQXSJaEdDdN8FFNh5RSPeOoErpN0
   UIyu83Kqj7+HrAqU3eeFQWEqIwW1fEw3Tlg22GYtxP46Vr+0Ux2AtYgp6
   xOeJ7oiE2prZZwDMm0BXoqJDHq4pKyW1V+cMu8qpGNq4WfttwqlsXOGct
   l7PH19ujVvdWjD7DOE14niZ+kdo92vuU+oGNTD0B+0hfr+bAVFe7uBR/3
   Y6R41eoYWhpW/ubiwXtzMNACJffeROomxcT+vXJAxNnxfGq5ponptLY0u
   8R9amlr2Lma0O0ufAEttCQYZp9ZxYkpWyXof3zCIUZlo3StvSANiMcCUW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="1444787"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="1444787"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 03:33:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="33239086"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Feb 2024 03:33:18 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYlbf-0005bs-1U;
	Sat, 10 Feb 2024 11:33:15 +0000
Date: Sat, 10 Feb 2024 19:33:12 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Lutomirski <luto@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [luto:net/recverr 2/2] include/net/ip.h:838:22: error: no member
 named '__sk_common' in 'struct socket'
Message-ID: <202402101949.cMkR01fr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git net/recverr
head:   d3ed76fed22d68d297a7740671c0d010f8ca205d
commit: d3ed76fed22d68d297a7740671c0d010f8ca205d [2/2] [WIP] net/ip: Consolidate RECVERR-vs-sk_err handling
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240210/202402101949.cMkR01fr-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ac0577177f053ba7e7016e1b7e44cf5932d00b03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402101949.cMkR01fr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402101949.cMkR01fr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/select.c:33:
   In file included from include/net/busy_poll.h:15:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from fs/select.c:33:
   In file included from include/net/busy_poll.h:15:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from fs/select.c:33:
   In file included from include/net/busy_poll.h:15:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from fs/select.c:33:
   In file included from include/net/busy_poll.h:18:
>> include/net/ip.h:838:22: error: no member named '__sk_common' in 'struct socket'
     838 |         if ((harderr && sk->sk_state == TCP_ESTABLISHED) || recverr) {
         |                         ~~  ^
   include/net/sock.h:381:19: note: expanded from macro 'sk_state'
     381 | #define sk_state                __sk_common.skc_state
         |                                 ^
   In file included from fs/select.c:33:
   In file included from include/net/busy_poll.h:18:
>> include/net/ip.h:839:7: error: no member named 'sk_err' in 'struct socket'
     839 |                 sk->sk_err = err;
         |                 ~~  ^
>> include/net/ip.h:840:19: error: incompatible pointer types passing 'struct socket *' to parameter of type 'struct sock *' [-Werror,-Wincompatible-pointer-types]
     840 |                 sk_error_report(sk);
         |                                 ^~
   include/net/sock.h:2513:35: note: passing argument to parameter 'sk' here
    2513 | void sk_error_report(struct sock *sk);
         |                                   ^
   12 warnings and 3 errors generated.


vim +838 include/net/ip.h

   814	
   815	/*
   816	 * When an ICMP error is received that matches a datagram socket, some combination of
   817	 * queueing an IP_RECVERR-style message, setting sk_err, and signaling POLLERR needs
   818	 * to happen.
   819	 *
   820	 * Use like this:
   821	 *
   822	 * bool recverr = inet_test_bit(RECVERR, sk) [and account for ipv6]
   823	 * int err = ...;
   824	 * bool harderr;  <- true if the error is 'hard', meaning that it should be reported
   825	 *                   for !RECVERR connected sockets
   826	 * if (recverr)
   827	 * 	ip_icmp_error() or ipv6_icmp_error() as appropriate.
   828	 * ip_error_report(sk, err, harderr, recverr);
   829	 */
   830	static inline bool ip_error_report(struct socket *sk, int err, bool harderr, bool recverr)
   831	{
   832		/*
   833		 * Linux sets sk_err for connected sockets if the error is 'hard' (which makes
   834		 * perfect sense) and for all sockets if RECVERR[6] (which does not make very
   835		 * much sense).  It does indeed make sense that sk_error_report(), which signals
   836		 * POLLERR, is called if RECVERR[6], though.
   837		 */
 > 838		if ((harderr && sk->sk_state == TCP_ESTABLISHED) || recverr) {
 > 839			sk->sk_err = err;
 > 840			sk_error_report(sk);
   841		}
   842	}
   843	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
