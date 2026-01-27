Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94916EAC7;
	Tue, 27 Jan 2026 01:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769478812; cv=none; b=o5OM5x71M7hm3Oc2tC4aCW0+I0GvAFZa3//lby74vlyuHmUj/97eGnB0tBvqbj1Tg7JXmLYICWxaMXiUWGV9UnitzM5t0J+q/xlp5IbFkax8rDE4WYdGUhpjzmeYM/I7gsQRoXOT0K3LHplScvumo3qpaTew+RjBlsBB5GtWLls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769478812; c=relaxed/simple;
	bh=AzPHhaBQwWv32goGNVNkzZUVRFaJxGw+1JFp4qsfDuY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AqqexxZxxCW+I1yCJ+i6WzhvJtwp81Qa/rreIxqePjuPByH0Vjf34bhD+iRoTP1BxYz2GNuU0Rw15MbiL07z1GCUXXD+UlqytoT3K2uvl8mAEp/30ndluYrMw4W5KQLXeEA9K4E+GmR9I3qMj5OcaYU1va9fozikklkkyR4osrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B9PVGcFZ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B9PVGcFZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769478808; x=1801014808;
  h=date:from:to:cc:subject:message-id;
  bh=AzPHhaBQwWv32goGNVNkzZUVRFaJxGw+1JFp4qsfDuY=;
  b=B9PVGcFZhKDLou3XUoUDD/TM5V1wN+2v1qfa7zBvrx9gp3oY33bj7JHj
   +zYz4vK7x6Clw7aROz7JePcpW9HTsYPJ2s69ZcfgHIiTSmybClEEMxeKq
   v8392ZtLnZaysiJxNwue/FKtykXj8vdlcXcqt+Dt4z5etBQ5Nf+e+0Ze2
   WZeVjOJiABdl95UnuytjeHX6LtAspbTqqCDovToyaO61mAjbZ0xviVxRc
   qyKhPEdl++N4ZvgoDRFfTRSQtGMvojOXTEWCkzZNZ4pCeQZkvAaZWTUEP
   vJa4+8h+f3wQGzWsDqMKwO3NlWCz3ECHqes65mpcBfY9uiv2d3DBuRSzG
   Q==;
X-CSE-ConnectionGUID: lU1guCoCT8CKsF4O3xp8nw==
X-CSE-MsgGUID: tdxns30MR0GHgBqku3b8og==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="96128460"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="96128460"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 17:53:28 -0800
X-CSE-ConnectionGUID: zQb18h6KRGqvltRugLO9Jw==
X-CSE-MsgGUID: PvmrX+FyQCqoDrYz18ljTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="208196999"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 26 Jan 2026 17:53:26 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkYGi-000000001en-1BHN;
	Tue, 27 Jan 2026 01:53:24 +0000
Date: Tue, 27 Jan 2026 02:53:02 +0100
From: kernel test robot <lkp@intel.com>
To: Drew Fustini <fustini@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [fustini:b4/ssqosid-cbqri 14/18]
 drivers/net/ethernet/intel/igb/igb_main.c:6201:14: warning: division by zero
 is undefined
Message-ID: <202601270222.bq7egn37-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git b4/ssqosid-cbqri
head:   8182dddb709d03a64b99b430d05f8f21103aa9b3
commit: 60aed9e92fe0ca93b56a46ae251eb1ff851d572f [14/18] acpi: pptt: Add helper to find a cache from id
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260127/202601270222.bq7egn37-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601270222.bq7egn37-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601270222.bq7egn37-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/igb/igb_main.c:39:
   In file included from include/linux/i2c.h:13:
   include/linux/acpi.h:1582:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct acpi_pptt_cache *' [-Wint-conversion]
    1582 |         return -EINVAL;
         |                ^~~~~~~
>> drivers/net/ethernet/intel/igb/igb_main.c:6201:14: warning: division by zero is undefined [-Wdivision-by-zero]
    6201 |         cmd_type |= IGB_SET_FLAG(tx_flags, IGB_TX_FLAGS_VLAN,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6202 |                                  (E1000_ADVTXD_DCMD_VLE));
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igb/igb_main.c:6191:26: note: expanded from macro 'IGB_SET_FLAG'
    6191 |          ((u32)(_input & _flag) / (_flag / _result)))
         |                                 ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igb/igb_main.c:6205:14: warning: division by zero is undefined [-Wdivision-by-zero]
    6205 |         cmd_type |= IGB_SET_FLAG(tx_flags, IGB_TX_FLAGS_TSO,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6206 |                                  (E1000_ADVTXD_DCMD_TSE));
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igb/igb_main.c:6191:26: note: expanded from macro 'IGB_SET_FLAG'
    6191 |          ((u32)(_input & _flag) / (_flag / _result)))
         |                                 ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igb/igb_main.c:6209:14: warning: division by zero is undefined [-Wdivision-by-zero]
    6209 |         cmd_type |= IGB_SET_FLAG(tx_flags, IGB_TX_FLAGS_TSTAMP,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6210 |                                  (E1000_ADVTXD_MAC_TSTAMP));
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igb/igb_main.c:6191:26: note: expanded from macro 'IGB_SET_FLAG'
    6191 |          ((u32)(_input & _flag) / (_flag / _result)))
         |                                 ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igb/igb_main.c:6213:14: warning: division by zero is undefined [-Wdivision-by-zero]
    6213 |         cmd_type ^= IGB_SET_FLAG(skb->no_fcs, 1, E1000_ADVTXD_DCMD_IFCS);
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igb/igb_main.c:6191:26: note: expanded from macro 'IGB_SET_FLAG'
    6191 |          ((u32)(_input & _flag) / (_flag / _result)))
         |                                 ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igb/igb_main.c:6229:19: warning: division by zero is undefined [-Wdivision-by-zero]
    6229 |         olinfo_status |= IGB_SET_FLAG(tx_flags,
         |                          ^~~~~~~~~~~~~~~~~~~~~~
    6230 |                                       IGB_TX_FLAGS_CSUM,
         |                                       ~~~~~~~~~~~~~~~~~~
    6231 |                                       (E1000_TXD_POPTS_TXSM << 8));
         |                                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igb/igb_main.c:6191:26: note: expanded from macro 'IGB_SET_FLAG'
    6191 |          ((u32)(_input & _flag) / (_flag / _result)))
         |                                 ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igb/igb_main.c:6234:19: warning: division by zero is undefined [-Wdivision-by-zero]
    6234 |         olinfo_status |= IGB_SET_FLAG(tx_flags,
         |                          ^~~~~~~~~~~~~~~~~~~~~~
    6235 |                                       IGB_TX_FLAGS_IPV4,
         |                                       ~~~~~~~~~~~~~~~~~~
    6236 |                                       (E1000_TXD_POPTS_IXSM << 8));
         |                                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igb/igb_main.c:6191:26: note: expanded from macro 'IGB_SET_FLAG'
    6191 |          ((u32)(_input & _flag) / (_flag / _result)))
         |                                 ^ ~~~~~~~~~~~~~~~~~
   6 warnings and 1 error generated.
--
   In file included from drivers/net/ethernet/intel/igb/igb_ptp.c:9:
   In file included from drivers/net/ethernet/intel/igb/igb.h:17:
   In file included from include/linux/i2c.h:13:
   include/linux/acpi.h:1582:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct acpi_pptt_cache *' [-Wint-conversion]
    1582 |         return -EINVAL;
         |                ^~~~~~~
>> drivers/net/ethernet/intel/igb/igb_ptp.c:1323:22: warning: shift count >= width of type [-Wshift-count-overflow]
    1323 |                 adapter->cc.mask = CYCLECOUNTER_MASK(64);
         |                                    ^~~~~~~~~~~~~~~~~~~~~
   include/linux/timecounter.h:14:59: note: expanded from macro 'CYCLECOUNTER_MASK'
      14 | #define CYCLECOUNTER_MASK(bits) (u64)((bits) < 64 ? ((1ULL<<(bits))-1) : -1)
         |                                                           ^ ~~~~~~
   1 warning and 1 error generated.


vim +6201 drivers/net/ethernet/intel/igb/igb_main.c

9d5c824399dea8 drivers/net/igb/igb_main.c                Auke Kok        2008-01-24  6187  
1d9daf45b474a7 drivers/net/ethernet/intel/igb/igb_main.c Alexander Duyck 2012-11-13  6188  #define IGB_SET_FLAG(_input, _flag, _result) \
1d9daf45b474a7 drivers/net/ethernet/intel/igb/igb_main.c Alexander Duyck 2012-11-13  6189  	((_flag <= _result) ? \
1d9daf45b474a7 drivers/net/ethernet/intel/igb/igb_main.c Alexander Duyck 2012-11-13  6190  	 ((u32)(_input & _flag) * (_result / _flag)) : \
1d9daf45b474a7 drivers/net/ethernet/intel/igb/igb_main.c Alexander Duyck 2012-11-13  6191  	 ((u32)(_input & _flag) / (_flag / _result)))
1d9daf45b474a7 drivers/net/ethernet/intel/igb/igb_main.c Alexander Duyck 2012-11-13  6192  
1d9daf45b474a7 drivers/net/ethernet/intel/igb/igb_main.c Alexander Duyck 2012-11-13  6193  static u32 igb_tx_cmd_type(struct sk_buff *skb, u32 tx_flags)
e032afc80ca16e drivers/net/ethernet/intel/igb/igb_main.c Alexander Duyck 2011-08-26  6194  {
e032afc80ca16e drivers/net/ethernet/intel/igb/igb_main.c Alexander Duyck 2011-08-26  6195  	/* set type for advanced descriptor with frame checksum insertion */
1d9daf45b474a7 drivers/net/ethernet/intel/igb/igb_main.c Alexander Duyck 2012-11-13  6196  	u32 cmd_type = E1000_ADVTXD_DTYP_DATA |
1d9daf45b474a7 drivers/net/ethernet/intel/igb/igb_main.c Alexander Duyck 2012-11-13  6197  		       E1000_ADVTXD_DCMD_DEXT |
1d9daf45b474a7 drivers/net/ethernet/intel/igb/igb_main.c Alexander Duyck 2012-11-13  6198  		       E1000_ADVTXD_DCMD_IFCS;
e032afc80ca16e drivers/net/ethernet/intel/igb/igb_main.c Alexander Duyck 2011-08-26  6199  
e032afc80ca16e drivers/net/ethernet/intel/igb/igb_main.c Alexander Duyck 2011-08-26  6200  	/* set HW vlan bit if vlan is present */
1d9daf45b474a7 drivers/net/ethernet/intel/igb/igb_main.c Alexander Duyck 2012-11-13 @6201  	cmd_type |= IGB_SET_FLAG(tx_flags, IGB_TX_FLAGS_VLAN,
1d9daf45b474a7 drivers/net/ethernet/intel/igb/igb_main.c Alexander Duyck 2012-11-13  6202  				 (E1000_ADVTXD_DCMD_VLE));
1d9daf45b474a7 drivers/net/ethernet/intel/igb/igb_main.c Alexander Duyck 2012-11-13  6203  
1d9daf45b474a7 drivers/net/ethernet/intel/igb/igb_main.c Alexander Duyck 2012-11-13  6204  	/* set segmentation bits for TSO */
1d9daf45b474a7 drivers/net/ethernet/intel/igb/igb_main.c Alexander Duyck 2012-11-13  6205  	cmd_type |= IGB_SET_FLAG(tx_flags, IGB_TX_FLAGS_TSO,
1d9daf45b474a7 drivers/net/ethernet/intel/igb/igb_main.c Alexander Duyck 2012-11-13  6206  				 (E1000_ADVTXD_DCMD_TSE));
e032afc80ca16e drivers/net/ethernet/intel/igb/igb_main.c Alexander Duyck 2011-08-26  6207  
e032afc80ca16e drivers/net/ethernet/intel/igb/igb_main.c Alexander Duyck 2011-08-26  6208  	/* set timestamp bit if present */
1d9daf45b474a7 drivers/net/ethernet/intel/igb/igb_main.c Alexander Duyck 2012-11-13  6209  	cmd_type |= IGB_SET_FLAG(tx_flags, IGB_TX_FLAGS_TSTAMP,
1d9daf45b474a7 drivers/net/ethernet/intel/igb/igb_main.c Alexander Duyck 2012-11-13  6210  				 (E1000_ADVTXD_MAC_TSTAMP));
e032afc80ca16e drivers/net/ethernet/intel/igb/igb_main.c Alexander Duyck 2011-08-26  6211  
1d9daf45b474a7 drivers/net/ethernet/intel/igb/igb_main.c Alexander Duyck 2012-11-13  6212  	/* insert frame checksum */
1d9daf45b474a7 drivers/net/ethernet/intel/igb/igb_main.c Alexander Duyck 2012-11-13  6213  	cmd_type ^= IGB_SET_FLAG(skb->no_fcs, 1, E1000_ADVTXD_DCMD_IFCS);
e032afc80ca16e drivers/net/ethernet/intel/igb/igb_main.c Alexander Duyck 2011-08-26  6214  
e032afc80ca16e drivers/net/ethernet/intel/igb/igb_main.c Alexander Duyck 2011-08-26  6215  	return cmd_type;
e032afc80ca16e drivers/net/ethernet/intel/igb/igb_main.c Alexander Duyck 2011-08-26  6216  }
e032afc80ca16e drivers/net/ethernet/intel/igb/igb_main.c Alexander Duyck 2011-08-26  6217  

:::::: The code at line 6201 was first introduced by commit
:::::: 1d9daf45b474a7db7a2f850ab03def2d0721095d igb: Update igb Tx flags to improve code efficiency

:::::: TO: Alexander Duyck <alexander.h.duyck@intel.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
