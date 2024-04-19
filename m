Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9F013D636;
	Fri, 19 Apr 2024 23:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713569597; cv=none; b=FpCoGnx12oOkJHZ6npxNbUQSTmTqU7escLCpvIFg+oSzKj65L4hlOyagiR4/8wbvfDsS2iyF9wUAd7fEcEvOjKzUvbHjLJD8hO8C9qULJSeEGFL3SfVkBLxRgSmSqYxppfwD1DpI5cZrUXcN1iT+L0suOX04qPKVJ4KRkxG0Voo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713569597; c=relaxed/simple;
	bh=p9PcV8CaiJqkqkxAEC/MTB/4jxJzVJ0pmX/VP344N1I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CpySMMy2kIGnZ2oCGf1y5KKpReesiRiwCYbbP1gZe5PoKCAZGi/As/eJoukJKlZgpoHYXV5oKtiFq15es00vCcfr+Cv6ntV1QhmgRRUmApBS2NvW8doxtmq6mA3CVtZn6n0/gXEZkcmtmtDgTpu3LWcenW+TSx7Vj5m442vmbJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K3HVbbXv; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K3HVbbXv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713569596; x=1745105596;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p9PcV8CaiJqkqkxAEC/MTB/4jxJzVJ0pmX/VP344N1I=;
  b=K3HVbbXvD7F4S2mLoQEacvzxE1OJonShovtIKCFxCTr7ICwXo7WFPfWo
   HVVchMxB4zP1kXLSI1/mh+6Zhv5Y7lYxQ93cB+c3xuA4xq7nFdJgQTPXt
   1CRn1kBH2RUgv89bVUpoOyeztPkPRME0UFNu2eURE8ND+vMNtKXwFnmue
   nIOoGCtAdHsGknAj8mCAZI1uQG6ScFwZGd82oUsvwWGbEMoVDPoeqdebk
   I5GlE+CU09uq06ghMqiRlYOddfUjmnb+TlNzgQ4uxGU2LRqOjFFiZrol2
   pwEv+AGV/cH9623IfQe/3eUC2WAWWFgPv0pceR7M+TFgs2nTyXLkqC+My
   A==;
X-CSE-ConnectionGUID: lHln6TrOQbmotwWx+7rdbQ==
X-CSE-MsgGUID: 6h2gfmx6T/2d9FJ+RWalAQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="13031433"
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; 
   d="scan'208";a="13031433"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 16:33:15 -0700
X-CSE-ConnectionGUID: qwOukgM3TsK+gNu8JFQrog==
X-CSE-MsgGUID: wzfoGRYZTRqTzPbNOKkpTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; 
   d="scan'208";a="54684400"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 19 Apr 2024 16:33:13 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxxjD-000AYG-0z;
	Fri, 19 Apr 2024 23:33:11 +0000
Date: Sat, 20 Apr 2024 07:32:11 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alobakin:pr/24 1/2] drivers/net/ethernet/intel/idpf/xdp.c:524:4:
 error: call to undeclared function 'idpf_assign_bpf_prog'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202404200709.1HflRxNq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux pr/24
head:   42a12ce7cb33457d91d1e6d17fd99720031d4385
commit: 74fabbe0878bc78e5d903a1824a6c6d0b953f462 [1/2] idpf: handle xdp unloading while the driver is being removed
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240420/202404200709.1HflRxNq-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240420/202404200709.1HflRxNq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404200709.1HflRxNq-lkp@intel.com/

All errors (new ones prefixed by >>):

     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/intel/idpf/xdp.c:4:
   In file included from drivers/net/ethernet/intel/idpf/idpf.h:12:
   In file included from include/net/pkt_sched.h:7:
   In file included from include/linux/if_vlan.h:10:
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
   In file included from drivers/net/ethernet/intel/idpf/xdp.c:4:
   In file included from drivers/net/ethernet/intel/idpf/idpf.h:12:
   In file included from include/net/pkt_sched.h:7:
   In file included from include/linux/if_vlan.h:10:
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
   In file included from drivers/net/ethernet/intel/idpf/xdp.c:4:
   In file included from drivers/net/ethernet/intel/idpf/idpf.h:12:
   In file included from include/net/pkt_sched.h:7:
   In file included from include/linux/if_vlan.h:10:
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
>> drivers/net/ethernet/intel/idpf/xdp.c:524:4: error: call to undeclared function 'idpf_assign_bpf_prog'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     524 |                         idpf_assign_bpf_prog(current_prog, prog);
         |                         ^
>> drivers/net/ethernet/intel/idpf/xdp.c:524:25: error: use of undeclared identifier 'current_prog'
     524 |                         idpf_assign_bpf_prog(current_prog, prog);
         |                                              ^
   17 warnings and 2 errors generated.


vim +/idpf_assign_bpf_prog +524 drivers/net/ethernet/intel/idpf/xdp.c

   500	
   501	/**
   502	 * idpf_xdp_setup_prog - Add or remove XDP eBPF program
   503	 * @vport: vport to setup XDP for
   504	 * @xdp: XDP program and extack
   505	 */
   506	static int
   507	idpf_xdp_setup_prog(struct idpf_vport *vport, struct netdev_bpf *xdp)
   508	{
   509		struct idpf_netdev_priv *np = netdev_priv(vport->netdev);
   510		struct idpf_adapter *adapter = np->adapter;
   511		struct bpf_prog *prog = xdp->prog;
   512		struct xdp_attachment_info *info;
   513		bool needs_reconfig, vport_is_up;
   514		u16 idx = vport->idx;
   515		int err;
   516	
   517		vport_is_up = np->state == __IDPF_VPORT_UP;
   518	
   519		info = &vport->adapter->vport_config[idx]->user_config.xdp;
   520		needs_reconfig = !!info->prog != !!prog;
   521	
   522		if (test_bit(IDPF_REMOVE_IN_PROG, adapter->flags)) {
   523			if (!prog) {
 > 524				idpf_assign_bpf_prog(current_prog, prog);
   525				libeth_xdp_set_redirect(vport->netdev, prog);
   526	
   527				return 0;
   528			} else {
   529				return -EINVAL;
   530			}
   531		}
   532	
   533		if (!needs_reconfig) {
   534			idpf_copy_xdp_prog_to_qs(vport, prog);
   535			xdp_attachment_setup(info, xdp);
   536	
   537			return 0;
   538		}
   539	
   540		if (!vport_is_up) {
   541			idpf_send_delete_queues_msg(vport);
   542		} else {
   543			set_bit(IDPF_VPORT_DEL_QUEUES, vport->flags);
   544			idpf_vport_stop(vport);
   545		}
   546	
   547		idpf_deinit_rss(vport);
   548		xdp_attachment_setup(info, xdp);
   549	
   550		err = idpf_xdp_reconfig_queues(vport);
   551		if (err) {
   552			NL_SET_ERR_MSG_MOD(xdp->extack,
   553					   "Could not reconfigure the queues after XDP setup");
   554			return err;
   555		}
   556	
   557		libeth_xdp_set_redirect(vport->netdev, prog);
   558	
   559		if (vport_is_up) {
   560			err = idpf_vport_open(vport, false);
   561			if (err) {
   562				NL_SET_ERR_MSG_MOD(xdp->extack,
   563						   "Could not reopen the vport after XDP setup");
   564				return err;
   565			}
   566		}
   567	
   568		return 0;
   569	}
   570	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
