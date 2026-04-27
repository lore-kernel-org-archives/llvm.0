Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D993B38A4;
	Mon, 27 Apr 2026 23:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777331547; cv=none; b=Q+iUGxPTnA8UdeykplQ3jNIG51vKjGec0I8LZWo5yYhiYxG52u/qe4sOOad7T7qPOxJkZ8zhunJT9BRx3T2HCbe7Ct/n2vG7sulSTJ1cFe6n/BkgzT1vhkC08BHnH7XXfcI+v8XRBoHhxD6eOFK0vcD6bc2u5gl90f7xX+kxCQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777331547; c=relaxed/simple;
	bh=a4u4bsTMz7Y1mi+A9kY+/Kr+61AU/arZRiruc3ne8Hk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZkwwB6NPfF+/6GQZyMcX64a0QWXYOBI8/l1ckvMIsGdiHq0q6cIytV3QEgE0yZYs3v1h+AmlcqQju/AXzpkZbUwVFZ3pkhxfFUG6zgbQgr2ZBhHspNAemqtbvV8SpVHkKAvHtxLdoBns9YEiskckG1XI4Bx380R6wzwwdgLvykI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=haahVws5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="haahVws5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777331546; x=1808867546;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a4u4bsTMz7Y1mi+A9kY+/Kr+61AU/arZRiruc3ne8Hk=;
  b=haahVws5JVMAK9v7LzUSdHlu1yA3dPekZZbkB1YRcVKtoZkLejwBmN1U
   hDCokUrLDli2oI5kBt2TOLJDcoNVBEbawdpn9STgUZUGYxiMNjOV0SoVd
   ALYkC0+zm59hpRalZVoY3+RolSdOiSuhIbJQ/Dw1Lq4PiWCBZj34iPJ3E
   qrGlm3mSxH5BNssyxqo5mDh9KYZrnTBVZBKI3EjxnAX8LfhlnZDMUB63f
   vxErfJNgLhr2WEEQ00dFec4YqjC5mKWjg78xWDzKGU19Dq/olHmUAFJJP
   yKj4FN/RdgbISVLI0W1HbEmwQd0ibcLqPVnw45S+w8PS6b++AFfuBOGsL
   g==;
X-CSE-ConnectionGUID: GbhqSxjpTkOKUD3rr652Cg==
X-CSE-MsgGUID: oh1mI3D7Qy+ywKKeyKNCXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="77262179"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="77262179"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 16:12:25 -0700
X-CSE-ConnectionGUID: NpexpGSERg+KHNu/6jWHFA==
X-CSE-MsgGUID: mAWcOxQDTkCNmFJnrO9W+Q==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Apr 2026 16:12:23 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHV7l-000000009HN-0Zci;
	Mon, 27 Apr 2026 23:12:21 +0000
Date: Tue, 28 Apr 2026 07:12:19 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] rhashtable: Bounce deferred worker kick through
 irq_work when insecure_elasticity is set
Message-ID: <202604280709.2xKuz7sZ-lkp@intel.com>
References: <67fedbf2-914b-44f7-9422-1fe97d833705@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67fedbf2-914b-44f7-9422-1fe97d833705@kernel.org>

Hi Tejun,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on v7.0]
[also build test ERROR on linus/master]
[cannot apply to tj-sched-ext/for-7.1-fixes next-20260427]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tejun-Heo/rhashtable-Bounce-deferred-worker-kick-through-irq_work-when-insecure_elasticity-is-set/20260426-103416
base:   v7.0
patch link:    https://lore.kernel.org/r/67fedbf2-914b-44f7-9422-1fe97d833705%40kernel.org
patch subject: [RFC PATCH] rhashtable: Bounce deferred worker kick through irq_work when insecure_elasticity is set
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260428/202604280709.2xKuz7sZ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260428/202604280709.2xKuz7sZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604280709.2xKuz7sZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/rhashtable.c:25:
>> include/linux/rhashtable.h:768:12: error: no member named 'insecure_elasticity' in 'struct rhashtable_params'
     768 |         if (ht->p.insecure_elasticity)
         |             ~~~~~ ^
>> lib/rhashtable.c:1095:12: error: no member named 'insecure_elasticity' in 'struct rhashtable_params'
    1095 |         if (ht->p.insecure_elasticity)
         |             ~~~~~ ^
   lib/rhashtable.c:1162:12: error: no member named 'insecure_elasticity' in 'struct rhashtable_params'
    1162 |         if (ht->p.insecure_elasticity)
         |             ~~~~~ ^
   3 errors generated.
--
   In file included from lib/test_rhashtable.c:20:
>> include/linux/rhashtable.h:768:12: error: no member named 'insecure_elasticity' in 'struct rhashtable_params'
     768 |         if (ht->p.insecure_elasticity)
         |             ~~~~~ ^
   1 error generated.
--
   In file included from drivers/net/ethernet/intel/igc/igc_main.c:12:
   In file included from include/linux/bpf_trace.h:5:
   In file included from include/trace/events/xdp.h:288:
   In file included from include/net/xdp_priv.h:5:
>> include/linux/rhashtable.h:768:12: error: no member named 'insecure_elasticity' in 'struct rhashtable_params'
     768 |         if (ht->p.insecure_elasticity)
         |             ~~~~~ ^
   drivers/net/ethernet/intel/igc/igc_main.c:1264:14: warning: division by zero is undefined [-Wdivision-by-zero]
    1264 |         cmd_type |= IGC_SET_FLAG(tx_flags, IGC_TX_FLAGS_VLAN,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1265 |                                  IGC_ADVTXD_DCMD_VLE);
         |                                  ~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1254:30: note: expanded from macro 'IGC_SET_FLAG'
    1254 |          ((u32)((_input) & (_flag)) / ((_flag) / (_result))))
         |                                     ^ ~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1268:14: warning: division by zero is undefined [-Wdivision-by-zero]
    1268 |         cmd_type |= IGC_SET_FLAG(tx_flags, IGC_TX_FLAGS_TSO,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1269 |                                  (IGC_ADVTXD_DCMD_TSE));
         |                                  ~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1254:30: note: expanded from macro 'IGC_SET_FLAG'
    1254 |          ((u32)((_input) & (_flag)) / ((_flag) / (_result))))
         |                                     ^ ~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1274:14: warning: division by zero is undefined [-Wdivision-by-zero]
    1274 |         cmd_type |= IGC_SET_FLAG(tx_flags, IGC_TX_FLAGS_TSTAMP,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1275 |                                  (IGC_ADVTXD_MAC_TSTAMP));
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1254:30: note: expanded from macro 'IGC_SET_FLAG'
    1254 |          ((u32)((_input) & (_flag)) / ((_flag) / (_result))))
         |                                     ^ ~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1277:14: warning: division by zero is undefined [-Wdivision-by-zero]
    1277 |         cmd_type |= IGC_SET_FLAG(tx_flags, IGC_TX_FLAGS_TSTAMP_1,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1278 |                                  (IGC_ADVTXD_TSTAMP_REG_1));
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1254:30: note: expanded from macro 'IGC_SET_FLAG'
    1254 |          ((u32)((_input) & (_flag)) / ((_flag) / (_result))))
         |                                     ^ ~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1280:14: warning: division by zero is undefined [-Wdivision-by-zero]
    1280 |         cmd_type |= IGC_SET_FLAG(tx_flags, IGC_TX_FLAGS_TSTAMP_2,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1281 |                                  (IGC_ADVTXD_TSTAMP_REG_2));
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1254:30: note: expanded from macro 'IGC_SET_FLAG'
    1254 |          ((u32)((_input) & (_flag)) / ((_flag) / (_result))))
         |                                     ^ ~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1283:14: warning: division by zero is undefined [-Wdivision-by-zero]
    1283 |         cmd_type |= IGC_SET_FLAG(tx_flags, IGC_TX_FLAGS_TSTAMP_3,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1284 |                                  (IGC_ADVTXD_TSTAMP_REG_3));
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1254:30: note: expanded from macro 'IGC_SET_FLAG'
    1254 |          ((u32)((_input) & (_flag)) / ((_flag) / (_result))))
         |                                     ^ ~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1287:14: warning: division by zero is undefined [-Wdivision-by-zero]
    1287 |         cmd_type ^= IGC_SET_FLAG(skb->no_fcs, 1, IGC_ADVTXD_DCMD_IFCS);
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1254:30: note: expanded from macro 'IGC_SET_FLAG'
    1254 |          ((u32)((_input) & (_flag)) / ((_flag) / (_result))))
         |                                     ^ ~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1299:19: warning: division by zero is undefined [-Wdivision-by-zero]
    1299 |         olinfo_status |= IGC_SET_FLAG(tx_flags, IGC_TX_FLAGS_CSUM,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1300 |                                       (IGC_TXD_POPTS_TXSM << 8));
         |                                       ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1254:30: note: expanded from macro 'IGC_SET_FLAG'
    1254 |          ((u32)((_input) & (_flag)) / ((_flag) / (_result))))
         |                                     ^ ~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1303:19: warning: division by zero is undefined [-Wdivision-by-zero]
    1303 |         olinfo_status |= IGC_SET_FLAG(tx_flags, IGC_TX_FLAGS_IPV4,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1304 |                                       (IGC_TXD_POPTS_IXSM << 8));
         |                                       ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1254:30: note: expanded from macro 'IGC_SET_FLAG'
    1254 |          ((u32)((_input) & (_flag)) / ((_flag) / (_result))))
         |                                     ^ ~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:2971:25: warning: division by zero is undefined [-Wdivision-by-zero]
    2971 |                 meta_req->cmd_type |= IGC_SET_FLAG(tx_flags,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~
    2972 |                                                    IGC_TX_FLAGS_TSTAMP,
         |                                                    ~~~~~~~~~~~~~~~~~~~~
    2973 |                                                    (IGC_ADVTXD_MAC_TSTAMP));
         |                                                    ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1254:30: note: expanded from macro 'IGC_SET_FLAG'
    1254 |          ((u32)((_input) & (_flag)) / ((_flag) / (_result))))
         |                                     ^ ~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:2974:25: warning: division by zero is undefined [-Wdivision-by-zero]
    2974 |                 meta_req->cmd_type |= IGC_SET_FLAG(tx_flags,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~
    2975 |                                                    IGC_TX_FLAGS_TSTAMP_1,
         |                                                    ~~~~~~~~~~~~~~~~~~~~~~
    2976 |                                                    (IGC_ADVTXD_TSTAMP_REG_1));
         |                                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1254:30: note: expanded from macro 'IGC_SET_FLAG'
    1254 |          ((u32)((_input) & (_flag)) / ((_flag) / (_result))))
         |                                     ^ ~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:2977:25: warning: division by zero is undefined [-Wdivision-by-zero]
    2977 |                 meta_req->cmd_type |= IGC_SET_FLAG(tx_flags,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~
    2978 |                                                    IGC_TX_FLAGS_TSTAMP_2,
         |                                                    ~~~~~~~~~~~~~~~~~~~~~~
    2979 |                                                    (IGC_ADVTXD_TSTAMP_REG_2));
         |                                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1254:30: note: expanded from macro 'IGC_SET_FLAG'
--
   In file included from igc_main.c:12:
   In file included from include/linux/bpf_trace.h:5:
   In file included from include/trace/events/xdp.h:288:
   In file included from include/net/xdp_priv.h:5:
>> include/linux/rhashtable.h:768:12: error: no member named 'insecure_elasticity' in 'struct rhashtable_params'
     768 |         if (ht->p.insecure_elasticity)
         |             ~~~~~ ^
   igc_main.c:1264:14: warning: division by zero is undefined [-Wdivision-by-zero]
    1264 |         cmd_type |= IGC_SET_FLAG(tx_flags, IGC_TX_FLAGS_VLAN,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1265 |                                  IGC_ADVTXD_DCMD_VLE);
         |                                  ~~~~~~~~~~~~~~~~~~~~
   igc_main.c:1254:30: note: expanded from macro 'IGC_SET_FLAG'
    1254 |          ((u32)((_input) & (_flag)) / ((_flag) / (_result))))
         |                                     ^ ~~~~~~~~~~~~~~~~~~~~~
   igc_main.c:1268:14: warning: division by zero is undefined [-Wdivision-by-zero]
    1268 |         cmd_type |= IGC_SET_FLAG(tx_flags, IGC_TX_FLAGS_TSO,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1269 |                                  (IGC_ADVTXD_DCMD_TSE));
         |                                  ~~~~~~~~~~~~~~~~~~~~~~
   igc_main.c:1254:30: note: expanded from macro 'IGC_SET_FLAG'
    1254 |          ((u32)((_input) & (_flag)) / ((_flag) / (_result))))
         |                                     ^ ~~~~~~~~~~~~~~~~~~~~~
   igc_main.c:1274:14: warning: division by zero is undefined [-Wdivision-by-zero]
    1274 |         cmd_type |= IGC_SET_FLAG(tx_flags, IGC_TX_FLAGS_TSTAMP,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1275 |                                  (IGC_ADVTXD_MAC_TSTAMP));
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~
   igc_main.c:1254:30: note: expanded from macro 'IGC_SET_FLAG'
    1254 |          ((u32)((_input) & (_flag)) / ((_flag) / (_result))))
         |                                     ^ ~~~~~~~~~~~~~~~~~~~~~
   igc_main.c:1277:14: warning: division by zero is undefined [-Wdivision-by-zero]
    1277 |         cmd_type |= IGC_SET_FLAG(tx_flags, IGC_TX_FLAGS_TSTAMP_1,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1278 |                                  (IGC_ADVTXD_TSTAMP_REG_1));
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~
   igc_main.c:1254:30: note: expanded from macro 'IGC_SET_FLAG'
    1254 |          ((u32)((_input) & (_flag)) / ((_flag) / (_result))))
         |                                     ^ ~~~~~~~~~~~~~~~~~~~~~
   igc_main.c:1280:14: warning: division by zero is undefined [-Wdivision-by-zero]
    1280 |         cmd_type |= IGC_SET_FLAG(tx_flags, IGC_TX_FLAGS_TSTAMP_2,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1281 |                                  (IGC_ADVTXD_TSTAMP_REG_2));
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~
   igc_main.c:1254:30: note: expanded from macro 'IGC_SET_FLAG'
    1254 |          ((u32)((_input) & (_flag)) / ((_flag) / (_result))))
         |                                     ^ ~~~~~~~~~~~~~~~~~~~~~
   igc_main.c:1283:14: warning: division by zero is undefined [-Wdivision-by-zero]
    1283 |         cmd_type |= IGC_SET_FLAG(tx_flags, IGC_TX_FLAGS_TSTAMP_3,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1284 |                                  (IGC_ADVTXD_TSTAMP_REG_3));
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~
   igc_main.c:1254:30: note: expanded from macro 'IGC_SET_FLAG'
    1254 |          ((u32)((_input) & (_flag)) / ((_flag) / (_result))))
         |                                     ^ ~~~~~~~~~~~~~~~~~~~~~
   igc_main.c:1287:14: warning: division by zero is undefined [-Wdivision-by-zero]
    1287 |         cmd_type ^= IGC_SET_FLAG(skb->no_fcs, 1, IGC_ADVTXD_DCMD_IFCS);
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   igc_main.c:1254:30: note: expanded from macro 'IGC_SET_FLAG'
    1254 |          ((u32)((_input) & (_flag)) / ((_flag) / (_result))))
         |                                     ^ ~~~~~~~~~~~~~~~~~~~~~
   igc_main.c:1299:19: warning: division by zero is undefined [-Wdivision-by-zero]
    1299 |         olinfo_status |= IGC_SET_FLAG(tx_flags, IGC_TX_FLAGS_CSUM,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1300 |                                       (IGC_TXD_POPTS_TXSM << 8));
         |                                       ~~~~~~~~~~~~~~~~~~~~~~~~~~
   igc_main.c:1254:30: note: expanded from macro 'IGC_SET_FLAG'
    1254 |          ((u32)((_input) & (_flag)) / ((_flag) / (_result))))
         |                                     ^ ~~~~~~~~~~~~~~~~~~~~~
   igc_main.c:1303:19: warning: division by zero is undefined [-Wdivision-by-zero]
    1303 |         olinfo_status |= IGC_SET_FLAG(tx_flags, IGC_TX_FLAGS_IPV4,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1304 |                                       (IGC_TXD_POPTS_IXSM << 8));
         |                                       ~~~~~~~~~~~~~~~~~~~~~~~~~~
   igc_main.c:1254:30: note: expanded from macro 'IGC_SET_FLAG'
    1254 |          ((u32)((_input) & (_flag)) / ((_flag) / (_result))))
         |                                     ^ ~~~~~~~~~~~~~~~~~~~~~
   igc_main.c:2971:25: warning: division by zero is undefined [-Wdivision-by-zero]
    2971 |                 meta_req->cmd_type |= IGC_SET_FLAG(tx_flags,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~
    2972 |                                                    IGC_TX_FLAGS_TSTAMP,
         |                                                    ~~~~~~~~~~~~~~~~~~~~
    2973 |                                                    (IGC_ADVTXD_MAC_TSTAMP));
         |                                                    ~~~~~~~~~~~~~~~~~~~~~~~~
   igc_main.c:1254:30: note: expanded from macro 'IGC_SET_FLAG'
    1254 |          ((u32)((_input) & (_flag)) / ((_flag) / (_result))))
         |                                     ^ ~~~~~~~~~~~~~~~~~~~~~
   igc_main.c:2974:25: warning: division by zero is undefined [-Wdivision-by-zero]
    2974 |                 meta_req->cmd_type |= IGC_SET_FLAG(tx_flags,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~
    2975 |                                                    IGC_TX_FLAGS_TSTAMP_1,
         |                                                    ~~~~~~~~~~~~~~~~~~~~~~
    2976 |                                                    (IGC_ADVTXD_TSTAMP_REG_1));
         |                                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~
   igc_main.c:1254:30: note: expanded from macro 'IGC_SET_FLAG'
    1254 |          ((u32)((_input) & (_flag)) / ((_flag) / (_result))))
         |                                     ^ ~~~~~~~~~~~~~~~~~~~~~
   igc_main.c:2977:25: warning: division by zero is undefined [-Wdivision-by-zero]
    2977 |                 meta_req->cmd_type |= IGC_SET_FLAG(tx_flags,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~
    2978 |                                                    IGC_TX_FLAGS_TSTAMP_2,
         |                                                    ~~~~~~~~~~~~~~~~~~~~~~
    2979 |                                                    (IGC_ADVTXD_TSTAMP_REG_2));
         |                                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~
   igc_main.c:1254:30: note: expanded from macro 'IGC_SET_FLAG'


vim +768 include/linux/rhashtable.h

   757	
   758	/*
   759	 * Kick the deferred rehash worker. With insecure_elasticity the caller may
   760	 * hold a raw spinlock. schedule_work() under a raw spinlock records
   761	 * caller_lock -> pool->lock -> pi_lock -> rq->__lock. If any of these
   762	 * locks is acquired in the reverse direction elsewhere, the cycle closes.
   763	 * Bounce through irq_work so schedule_work() runs from hard IRQ context
   764	 * with the caller's lock no longer held.
   765	 */
   766	static void rhashtable_kick_deferred_worker(struct rhashtable *ht)
   767	{
 > 768		if (ht->p.insecure_elasticity)
   769			irq_work_queue(&ht->run_irq_work);
   770		else
   771			schedule_work(&ht->run_work);
   772	}
   773	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
