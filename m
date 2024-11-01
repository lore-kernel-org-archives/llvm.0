Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6091A256E;
	Fri,  1 Nov 2024 10:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730457338; cv=none; b=KZhA8Tlheua4mE0iWgsm+eFoTkv6j06/90psOKVxCOFHxNMnGVZiiIevQciLiYxYu75fyQiZkCzKw4GTI3k8ZB+taeFhtHCG4el8thf1tw+ryPVjMCDKW8R8LicI3S91UdTWbo3vn/xCEdCq0l5R6rURdD58+rdVELvJFkSMYEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730457338; c=relaxed/simple;
	bh=JyJXZQCkxKMMHfAul0u8B8RER5DiEXxSwxV6g5m+kC8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N/aDrNVpUrYwM2EafSDszdPWRdDIf9ggsVd6KylPepKEKSXp1NI72Jd9zpR1mKcFN03el4KPvZOhlLNvW171HbvuFkSydz9jvP7U5My0qV2cWkkpB5TWJW7hrhKlOaKUDvWyRsQU+oQY+tiU5vmpRWzZART9FTyCo+S6xwGczxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iii0pdh3; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iii0pdh3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730457335; x=1761993335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JyJXZQCkxKMMHfAul0u8B8RER5DiEXxSwxV6g5m+kC8=;
  b=iii0pdh3yuTPlkWRh6H32GxJBNytQh7oZG8LGNz/PGe6umttVcjvSbiq
   CYiBOTzcUoHQFELzT4lcoroBB0x79Om0PkqI1PXtNYxDu4tielieUpHPQ
   Jqm5rDDWvbbvb8ZfmT7WjgFUDkvn0bZRp3/Yg4HGdd971GpWdEAmstghG
   G5C26i3MNNEz8Xe/Sm7TseJ4fmHlTxZ4uviCN3i25qQabnyoLDup83tiU
   A8s1CG6219gmf/Ig4CudW6aRP1JDhRMwKayZnzY/fCWMQ3DmoWqjesER0
   a0JpK2GzbHrT7uIuyhssKb7w8/91BNtt0vFhk2r/DOq83S75v1MIwr9aj
   A==;
X-CSE-ConnectionGUID: huowafbsRH2YS5SEP/ICBQ==
X-CSE-MsgGUID: 19LZTSW2ReSnyEXqJfbt9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="29650545"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="29650545"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 03:35:34 -0700
X-CSE-ConnectionGUID: ZClcIM8vTnyirhx4VgI3PQ==
X-CSE-MsgGUID: 1GbgM62zQWmIAvYCcnBsiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="82842150"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Nov 2024 03:35:33 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6p06-000hQ9-2P;
	Fri, 01 Nov 2024 10:35:30 +0000
Date: Fri, 1 Nov 2024 18:35:00 +0800
From: kernel test robot <lkp@intel.com>
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Paul Moore <paul@paul-moore.com>
Subject: [linux-next:master 8660/8858]
 net/netfilter/nf_conntrack_netlink.c:673:41: warning: variable 'len' is
 uninitialized when used here
Message-ID: <202411011845.Wwx4YZ8h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c88416ba074a8913cf6d61b789dd834bbca6681c
commit: 95a3c11eb6709db6a0e06ef17bfbcc32c7cc7b27 [8660/8858] lsm: replace context+len with lsm_context
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241101/202411011845.Wwx4YZ8h-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411011845.Wwx4YZ8h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411011845.Wwx4YZ8h-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/netfilter/nf_conntrack_netlink.c:25:
   In file included from include/linux/security.h:33:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from net/netfilter/nf_conntrack_netlink.c:25:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
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
   In file included from net/netfilter/nf_conntrack_netlink.c:25:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
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
   In file included from net/netfilter/nf_conntrack_netlink.c:25:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
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
>> net/netfilter/nf_conntrack_netlink.c:673:41: warning: variable 'len' is uninitialized when used here [-Wuninitialized]
     673 |                + nla_total_size(sizeof(char) * len); /* CTA_SECCTX_NAME */
         |                                                ^~~
   net/netfilter/nf_conntrack_netlink.c:666:9: note: initialize the variable 'len' to silence this warning
     666 |         int len, ret;
         |                ^
         |                 = 0
   8 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/len +673 net/netfilter/nf_conntrack_netlink.c

d26e6a02835aff Jiri Pirko        2010-04-01  662  
4a96300cec8872 Pablo Neira Ayuso 2016-04-15  663  static inline int ctnetlink_secctx_size(const struct nf_conn *ct)
1cc63249adfa95 Eric Paris        2010-10-13  664  {
cba85b532e4aab Pablo Neira Ayuso 2011-01-06  665  #ifdef CONFIG_NF_CONNTRACK_SECMARK
cba85b532e4aab Pablo Neira Ayuso 2011-01-06  666  	int len, ret;
1cc63249adfa95 Eric Paris        2010-10-13  667  
95a3c11eb6709d Casey Schaufler   2024-10-23  668  	ret = security_secid_to_secctx(ct->secmark, NULL);
95a3c11eb6709d Casey Schaufler   2024-10-23  669  	if (ret < 0)
cba85b532e4aab Pablo Neira Ayuso 2011-01-06  670  		return 0;
1cc63249adfa95 Eric Paris        2010-10-13  671  
cba85b532e4aab Pablo Neira Ayuso 2011-01-06  672  	return nla_total_size(0) /* CTA_SECCTX */
cba85b532e4aab Pablo Neira Ayuso 2011-01-06 @673  	       + nla_total_size(sizeof(char) * len); /* CTA_SECCTX_NAME */
cba85b532e4aab Pablo Neira Ayuso 2011-01-06  674  #else
cba85b532e4aab Pablo Neira Ayuso 2011-01-06  675  	return 0;
1cc63249adfa95 Eric Paris        2010-10-13  676  #endif
cba85b532e4aab Pablo Neira Ayuso 2011-01-06  677  }
1cc63249adfa95 Eric Paris        2010-10-13  678  

:::::: The code at line 673 was first introduced by commit
:::::: cba85b532e4aabdb97f44c18987d45141fd93faa netfilter: fix export secctx error handling

:::::: TO: Pablo Neira Ayuso <pablo@netfilter.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
