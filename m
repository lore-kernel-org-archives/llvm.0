Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D4B4965B;
	Wed,  5 Jun 2024 21:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717621942; cv=none; b=q10AQfaIRUPDJDpz2HR9/0iA/3Pe2aobnQ3J8/QuieVIBCs+TlPHNf15czzxiQmsBLSH3ujVSeKwqjQHJd0BvzIXUJI6qXc1zteQzVcLxnv7cS6P9QXG0zELPTOVJbZIVxMt5LJOat+gQWBcdPMaHjOX27vImPQCNliwFeft6bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717621942; c=relaxed/simple;
	bh=4IXudFV4i2Q4t3SaiFq2w0BpNh1HPjlNLzUuz+s+Xf4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r6K56R16E8kPJGGfKc5nlbJv/gxMwan084iyvc/b33d4DzyjOqGrpeP1F1qtzqNBIA/xyNzykLvk44qJJCNDIBXBw+W9q3yhOc1b1OuELJqHM8pl2IzoNYb6QCaJdLmo/K64sL5ZC+jThgCld0O6nQpexYLDSsjamgeJojxbH4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VDWo1gyT; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VDWo1gyT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717621939; x=1749157939;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4IXudFV4i2Q4t3SaiFq2w0BpNh1HPjlNLzUuz+s+Xf4=;
  b=VDWo1gyTJI3dG+MFF6c3LfHlR1a44luQee8fy6XvYSbz//lRTgSnt4G5
   HEI9+XmjopCCuypbA7ZD//vcn1SdSL79dEVE5Qr36MkkzyANzA4koj9fX
   uascO5f5eaL4ynug3qE49DbeDGYra/ObOH48LdaqtbrrEi302b96qyDZE
   rVFr+kT1/n1JERYxWZ/HNP9zk64BgGTkH1JwO/6Y3HRFeyd+gbmctmcRy
   aWEeATi0jsjfog4B8fe2idtlEvpL69mBROA36mN7UJ6zidGq0sMd1mlc4
   bsa6degCIUSlEim7DFYc3trJ/WIRUE1m1EgcZpF9DTnp7PCRlmccRgqLn
   Q==;
X-CSE-ConnectionGUID: 5J89Sl6bQImLafU/Mo49FQ==
X-CSE-MsgGUID: JJiZgc4kRxiKCDnXzxPf7Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14478107"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="14478107"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 14:12:19 -0700
X-CSE-ConnectionGUID: xVpoM+P1RBG5cJ0gnB62Aw==
X-CSE-MsgGUID: w4IMXILEQJSSAhjsKOiHjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="37830579"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 05 Jun 2024 14:12:17 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sExvb-0002Gm-14;
	Wed, 05 Jun 2024 21:12:15 +0000
Date: Thu, 6 Jun 2024 05:11:41 +0800
From: kernel test robot <lkp@intel.com>
To: Petr Machata <petrm@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:combined_queue 23/32]
 net/ipv4/sysctl_net_ipv4.c:1599:2: error: call to undeclared function
 'proc_fib_multipath_hash_set_seed'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202406060550.nCypVOEx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   f100b130c290d783d1945ed8b6a6a0d6baec69b9
commit: ed9843cdfe0f43d76a86776b998a5f78ecedc3c0 [23/32] net: ipv4: Add a sysctl to set multipath hash seed
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20240606/202406060550.nCypVOEx-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240606/202406060550.nCypVOEx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406060550.nCypVOEx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/ipv4/sysctl_net_ipv4.c:13:
   In file included from include/net/icmp.h:17:
   In file included from include/linux/icmp.h:16:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/um/include/asm/cacheflush.h:4:
   In file included from arch/um/include/asm/tlbflush.h:9:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from net/ipv4/sysctl_net_ipv4.c:13:
   In file included from include/net/icmp.h:17:
   In file included from include/linux/icmp.h:16:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from net/ipv4/sysctl_net_ipv4.c:13:
   In file included from include/net/icmp.h:17:
   In file included from include/linux/icmp.h:16:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from net/ipv4/sysctl_net_ipv4.c:13:
   In file included from include/net/icmp.h:17:
   In file included from include/linux/icmp.h:16:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> net/ipv4/sysctl_net_ipv4.c:1599:2: error: call to undeclared function 'proc_fib_multipath_hash_set_seed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1599 |         proc_fib_multipath_hash_set_seed(net, 0);
         |         ^
>> net/ipv4/sysctl_net_ipv4.c:1636:12: error: use of undeclared identifier 'proc_fib_multipath_hash_rand_seed'
    1636 |                          sizeof(proc_fib_multipath_hash_rand_seed));
         |                                 ^
   net/ipv4/sysctl_net_ipv4.c:1635:20: error: use of undeclared identifier 'proc_fib_multipath_hash_rand_seed'
    1635 |         get_random_bytes(&proc_fib_multipath_hash_rand_seed,
         |                           ^
   13 warnings and 3 errors generated.


vim +/proc_fib_multipath_hash_set_seed +1599 net/ipv4/sysctl_net_ipv4.c

  1561	
  1562	static __net_init int ipv4_sysctl_init_net(struct net *net)
  1563	{
  1564		size_t table_size = ARRAY_SIZE(ipv4_net_table);
  1565		struct ctl_table *table;
  1566	
  1567		table = ipv4_net_table;
  1568		if (!net_eq(net, &init_net)) {
  1569			int i;
  1570	
  1571			table = kmemdup(table, sizeof(ipv4_net_table), GFP_KERNEL);
  1572			if (!table)
  1573				goto err_alloc;
  1574	
  1575			for (i = 0; i < table_size; i++) {
  1576				if (table[i].data) {
  1577					/* Update the variables to point into
  1578					 * the current struct net
  1579					 */
  1580					table[i].data += (void *)net - (void *)&init_net;
  1581				} else {
  1582					/* Entries without data pointer are global;
  1583					 * Make them read-only in non-init_net ns
  1584					 */
  1585					table[i].mode &= ~0222;
  1586				}
  1587			}
  1588		}
  1589	
  1590		net->ipv4.ipv4_hdr = register_net_sysctl_sz(net, "net/ipv4", table,
  1591							    table_size);
  1592		if (!net->ipv4.ipv4_hdr)
  1593			goto err_reg;
  1594	
  1595		net->ipv4.sysctl_local_reserved_ports = kzalloc(65536 / 8, GFP_KERNEL);
  1596		if (!net->ipv4.sysctl_local_reserved_ports)
  1597			goto err_ports;
  1598	
> 1599		proc_fib_multipath_hash_set_seed(net, 0);
  1600	
  1601		return 0;
  1602	
  1603	err_ports:
  1604		unregister_net_sysctl_table(net->ipv4.ipv4_hdr);
  1605	err_reg:
  1606		if (!net_eq(net, &init_net))
  1607			kfree(table);
  1608	err_alloc:
  1609		return -ENOMEM;
  1610	}
  1611	
  1612	static __net_exit void ipv4_sysctl_exit_net(struct net *net)
  1613	{
  1614		const struct ctl_table *table;
  1615	
  1616		kfree(net->ipv4.sysctl_local_reserved_ports);
  1617		table = net->ipv4.ipv4_hdr->ctl_table_arg;
  1618		unregister_net_sysctl_table(net->ipv4.ipv4_hdr);
  1619		kfree(table);
  1620	}
  1621	
  1622	static __net_initdata struct pernet_operations ipv4_sysctl_ops = {
  1623		.init = ipv4_sysctl_init_net,
  1624		.exit = ipv4_sysctl_exit_net,
  1625	};
  1626	
  1627	static __init int sysctl_ipv4_init(void)
  1628	{
  1629		struct ctl_table_header *hdr;
  1630	
  1631		hdr = register_net_sysctl(&init_net, "net/ipv4", ipv4_table);
  1632		if (!hdr)
  1633			return -ENOMEM;
  1634	
  1635		get_random_bytes(&proc_fib_multipath_hash_rand_seed,
> 1636				 sizeof(proc_fib_multipath_hash_rand_seed));
  1637	
  1638		if (register_pernet_subsys(&ipv4_sysctl_ops)) {
  1639			unregister_net_sysctl_table(hdr);
  1640			return -ENOMEM;
  1641		}
  1642	
  1643		return 0;
  1644	}
  1645	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
