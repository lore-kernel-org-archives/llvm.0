Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28F2101C8;
	Tue, 27 May 2025 01:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748308991; cv=none; b=cCjJnOaSnvXUw6JNOK5ty1JFOl5/6O7VATly7at1thBCrZBcN6PWdDs7WJeC4M9H1TDB7wNTIRWDVny5nEM0A+hc67e60mJsMuEFTizV30Rcnk6NEwn2iD0Bxa9HETRxSUXSH49p6XMY/iIj87WKFIVQq2320wZ8qLc05oMareA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748308991; c=relaxed/simple;
	bh=V6+53TGRbaY13qQpLbT62lVQ1KrJgP5UhOGbZ87q4vU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HuXHz8hUF5cl0cbnhuFXVzI1MZJhg7I2niCgBl+7W1BghLliL9HUz2TKALY9HfTnuxzeEVnFJVldpMgGhVz7xkcUouecOgyYCWz1MZJN1iJmLT2JkI/JKDYrFmCNLLkHYCCXV8gf5XzKPsoQJoBGnsFVeip7WNbx7jQe6mI5s2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FOS3GFz7; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FOS3GFz7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748308990; x=1779844990;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V6+53TGRbaY13qQpLbT62lVQ1KrJgP5UhOGbZ87q4vU=;
  b=FOS3GFz7cYeSB4PVJg31ctdffCXUP50WUHyKbKqPTuLyL6H3BcigFtjQ
   GO5d/XzrDr4vZl1TaFJZo3o6S5K+ZwtzXGrPJzDQIoOZeb+YZgkpnJII8
   R87M3EXo/twlcYvVGSoEFEfuGuKodOcds9K1ozWpsmhuW7k/7BUTnnGbL
   sUNKINnUmNyurg1fSSkv9yEv/V+35OPF3uVwoESLtVtzHhX39QePCPYHT
   h4K5g/PltsCAveGsl697if0w6C87+yQ97dqBaR3t+KPN0nmRaqmfWAes2
   d9YTsGhWYRL1KS/ip3jECn8IxqhpqEwwVooQBLcciY1V3K682e9gQpsBp
   Q==;
X-CSE-ConnectionGUID: pl4oGcrqTLC8Vu0KhOsbPQ==
X-CSE-MsgGUID: QKSiVyLfShud3e/oG66GRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="50332954"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="50332954"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 18:23:10 -0700
X-CSE-ConnectionGUID: HaVu3naQQpSISTceqEZbKQ==
X-CSE-MsgGUID: dWvFHSgvTnqILb6eJEZmNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="143546099"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 May 2025 18:23:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJj1z-000Sn2-1P;
	Tue, 27 May 2025 01:23:03 +0000
Date: Tue, 27 May 2025 09:22:14 +0800
From: kernel test robot <lkp@intel.com>
To: Subbaraya Sundeep <sbhatta@marvell.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, saikrishnag@marvell.com,
	gakula@marvell.com, hkelam@marvell.com, sgoutham@marvell.com,
	lcherian@marvell.com, bbhushan2@marvell.com, jerinj@marvell.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, Subbaraya Sundeep <sbhatta@marvell.com>
Subject: Re: [net PATCH] octeontx2-pf: Avoid typecasts by simplifying
 otx2_atomic64_add macro
Message-ID: <202505270941.xkydqqTv-lkp@intel.com>
References: <1748274232-20835-1-git-send-email-sbhatta@marvell.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1748274232-20835-1-git-send-email-sbhatta@marvell.com>

Hi Subbaraya,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Subbaraya-Sundeep/octeontx2-pf-Avoid-typecasts-by-simplifying-otx2_atomic64_add-macro/20250526-234505
base:   net/main
patch link:    https://lore.kernel.org/r/1748274232-20835-1-git-send-email-sbhatta%40marvell.com
patch subject: [net PATCH] octeontx2-pf: Avoid typecasts by simplifying otx2_atomic64_add macro
config: x86_64-buildonly-randconfig-006-20250527 (https://download.01.org/0day-ci/archive/20250527/202505270941.xkydqqTv-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505270941.xkydqqTv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505270941.xkydqqTv-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/marvell/octeontx2/nic/otx2_ptp.c:10:
>> drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:804:9: warning: ISO C does not allow indirection on operand of type 'void *' [-Wvoid-ptr-dereference]
     804 |         return otx2_atomic64_add(incr, ptr);
         |                ^                       ~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:751:42: note: expanded from macro 'otx2_atomic64_add'
     751 | #define otx2_atomic64_add(incr, ptr)            ({ *ptr += incr; })
         |                                                    ^~~~
>> drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:804:9: error: invalid operands to binary expression ('void' and 'u64' (aka 'unsigned long long'))
     804 |         return otx2_atomic64_add(incr, ptr);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:751:47: note: expanded from macro 'otx2_atomic64_add'
     751 | #define otx2_atomic64_add(incr, ptr)            ({ *ptr += incr; })
         |                                                    ~~~~ ^  ~~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_ptp.c:451:14: warning: shift count >= width of type [-Wshift-count-overflow]
     451 |                 cc->mask = CYCLECOUNTER_MASK(64);
         |                            ^~~~~~~~~~~~~~~~~~~~~
   include/linux/timecounter.h:14:59: note: expanded from macro 'CYCLECOUNTER_MASK'
      14 | #define CYCLECOUNTER_MASK(bits) (u64)((bits) < 64 ? ((1ULL<<(bits))-1) : -1)
         |                                                           ^ ~~~~~~
   2 warnings and 1 error generated.
--
   In file included from drivers/net/ethernet/marvell/octeontx2/nic/otx2_vf.c:13:
>> drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:804:9: warning: ISO C does not allow indirection on operand of type 'void *' [-Wvoid-ptr-dereference]
     804 |         return otx2_atomic64_add(incr, ptr);
         |                ^                       ~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:751:42: note: expanded from macro 'otx2_atomic64_add'
     751 | #define otx2_atomic64_add(incr, ptr)            ({ *ptr += incr; })
         |                                                    ^~~~
>> drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:804:9: error: invalid operands to binary expression ('void' and 'u64' (aka 'unsigned long long'))
     804 |         return otx2_atomic64_add(incr, ptr);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:751:47: note: expanded from macro 'otx2_atomic64_add'
     751 | #define otx2_atomic64_add(incr, ptr)            ({ *ptr += incr; })
         |                                                    ~~~~ ^  ~~~~
   1 warning and 1 error generated.
--
   In file included from drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c:17:
>> drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:804:9: warning: ISO C does not allow indirection on operand of type 'void *' [-Wvoid-ptr-dereference]
     804 |         return otx2_atomic64_add(incr, ptr);
         |                ^                       ~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:751:42: note: expanded from macro 'otx2_atomic64_add'
     751 | #define otx2_atomic64_add(incr, ptr)            ({ *ptr += incr; })
         |                                                    ^~~~
>> drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:804:9: error: invalid operands to binary expression ('void' and 'u64' (aka 'unsigned long long'))
     804 |         return otx2_atomic64_add(incr, ptr);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:751:47: note: expanded from macro 'otx2_atomic64_add'
     751 | #define otx2_atomic64_add(incr, ptr)            ({ *ptr += incr; })
         |                                                    ~~~~ ^  ~~~~
>> drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c:34:17: warning: ISO C does not allow indirection on operand of type 'void *' [-Wvoid-ptr-dereference]
      34 |         stats->bytes = otx2_atomic64_add(incr, ptr);
         |                        ^                       ~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:751:42: note: expanded from macro 'otx2_atomic64_add'
     751 | #define otx2_atomic64_add(incr, ptr)            ({ *ptr += incr; })
         |                                                    ^~~~
>> drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c:34:17: error: invalid operands to binary expression ('void' and 'u64' (aka 'unsigned long long'))
      34 |         stats->bytes = otx2_atomic64_add(incr, ptr);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:751:47: note: expanded from macro 'otx2_atomic64_add'
     751 | #define otx2_atomic64_add(incr, ptr)            ({ *ptr += incr; })
         |                                                    ~~~~ ^  ~~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c:37:16: warning: ISO C does not allow indirection on operand of type 'void *' [-Wvoid-ptr-dereference]
      37 |         stats->pkts = otx2_atomic64_add(incr, ptr);
         |                       ^                       ~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:751:42: note: expanded from macro 'otx2_atomic64_add'
     751 | #define otx2_atomic64_add(incr, ptr)            ({ *ptr += incr; })
         |                                                    ^~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c:37:16: error: invalid operands to binary expression ('void' and 'u64' (aka 'unsigned long long'))
      37 |         stats->pkts = otx2_atomic64_add(incr, ptr);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:751:47: note: expanded from macro 'otx2_atomic64_add'
     751 | #define otx2_atomic64_add(incr, ptr)            ({ *ptr += incr; })
         |                                                    ~~~~ ^  ~~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c:47:17: warning: ISO C does not allow indirection on operand of type 'void *' [-Wvoid-ptr-dereference]
      47 |         stats->bytes = otx2_atomic64_add(incr, ptr);
         |                        ^                       ~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:751:42: note: expanded from macro 'otx2_atomic64_add'
     751 | #define otx2_atomic64_add(incr, ptr)            ({ *ptr += incr; })
         |                                                    ^~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c:47:17: error: invalid operands to binary expression ('void' and 'u64' (aka 'unsigned long long'))
      47 |         stats->bytes = otx2_atomic64_add(incr, ptr);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:751:47: note: expanded from macro 'otx2_atomic64_add'
     751 | #define otx2_atomic64_add(incr, ptr)            ({ *ptr += incr; })
         |                                                    ~~~~ ^  ~~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c:50:16: warning: ISO C does not allow indirection on operand of type 'void *' [-Wvoid-ptr-dereference]
      50 |         stats->pkts = otx2_atomic64_add(incr, ptr);
         |                       ^                       ~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:751:42: note: expanded from macro 'otx2_atomic64_add'
     751 | #define otx2_atomic64_add(incr, ptr)            ({ *ptr += incr; })
         |                                                    ^~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c:50:16: error: invalid operands to binary expression ('void' and 'u64' (aka 'unsigned long long'))
      50 |         stats->pkts = otx2_atomic64_add(incr, ptr);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:751:47: note: expanded from macro 'otx2_atomic64_add'
     751 | #define otx2_atomic64_add(incr, ptr)            ({ *ptr += incr; })
         |                                                    ~~~~ ^  ~~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c:873:9: warning: ISO C does not allow indirection on operand of type 'void *' [-Wvoid-ptr-dereference]
     873 |                 val = otx2_atomic64_add(incr, ptr);
         |                       ^                       ~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:751:42: note: expanded from macro 'otx2_atomic64_add'
     751 | #define otx2_atomic64_add(incr, ptr)            ({ *ptr += incr; })
         |                                                    ^~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c:873:9: error: invalid operands to binary expression ('void' and 'u64' (aka 'unsigned long long'))
     873 |                 val = otx2_atomic64_add(incr, ptr);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:751:47: note: expanded from macro 'otx2_atomic64_add'
     751 | #define otx2_atomic64_add(incr, ptr)            ({ *ptr += incr; })
         |                                                    ~~~~ ^  ~~~~
   6 warnings and 6 errors generated.
--
   In file included from drivers/net/ethernet/marvell/octeontx2/nic/qos_sq.c:11:
   In file included from drivers/net/ethernet/marvell/octeontx2/nic/cn10k.h:11:
>> drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:804:9: warning: ISO C does not allow indirection on operand of type 'void *' [-Wvoid-ptr-dereference]
     804 |         return otx2_atomic64_add(incr, ptr);
         |                ^                       ~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:751:42: note: expanded from macro 'otx2_atomic64_add'
     751 | #define otx2_atomic64_add(incr, ptr)            ({ *ptr += incr; })
         |                                                    ^~~~
>> drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:804:9: error: invalid operands to binary expression ('void' and 'u64' (aka 'unsigned long long'))
     804 |         return otx2_atomic64_add(incr, ptr);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:751:47: note: expanded from macro 'otx2_atomic64_add'
     751 | #define otx2_atomic64_add(incr, ptr)            ({ *ptr += incr; })
         |                                                    ~~~~ ^  ~~~~
>> drivers/net/ethernet/marvell/octeontx2/nic/qos_sq.c:159:8: warning: ISO C does not allow indirection on operand of type 'void *' [-Wvoid-ptr-dereference]
     159 |         val = otx2_atomic64_add(incr, ptr);
         |               ^                       ~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:751:42: note: expanded from macro 'otx2_atomic64_add'
     751 | #define otx2_atomic64_add(incr, ptr)            ({ *ptr += incr; })
         |                                                    ^~~~
>> drivers/net/ethernet/marvell/octeontx2/nic/qos_sq.c:159:8: error: invalid operands to binary expression ('void' and 'u64' (aka 'unsigned long long'))
     159 |         val = otx2_atomic64_add(incr, ptr);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:751:47: note: expanded from macro 'otx2_atomic64_add'
     751 | #define otx2_atomic64_add(incr, ptr)            ({ *ptr += incr; })
         |                                                    ~~~~ ^  ~~~~
   2 warnings and 2 errors generated.
--
   In file included from drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c:22:
>> drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:804:9: warning: ISO C does not allow indirection on operand of type 'void *' [-Wvoid-ptr-dereference]
     804 |         return otx2_atomic64_add(incr, ptr);
         |                ^                       ~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:751:42: note: expanded from macro 'otx2_atomic64_add'
     751 | #define otx2_atomic64_add(incr, ptr)            ({ *ptr += incr; })
         |                                                    ^~~~
>> drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:804:9: error: invalid operands to binary expression ('void' and 'u64' (aka 'unsigned long long'))
     804 |         return otx2_atomic64_add(incr, ptr);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:751:47: note: expanded from macro 'otx2_atomic64_add'
     751 | #define otx2_atomic64_add(incr, ptr)            ({ *ptr += incr; })
         |                                                    ~~~~ ^  ~~~~
>> drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c:1314:9: warning: ISO C does not allow indirection on operand of type 'void *' [-Wvoid-ptr-dereference]
    1314 |                 val = otx2_atomic64_add((qidx << 44), ptr);
         |                       ^                               ~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:751:42: note: expanded from macro 'otx2_atomic64_add'
     751 | #define otx2_atomic64_add(incr, ptr)            ({ *ptr += incr; })
         |                                                    ^~~~
>> drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c:1314:9: error: invalid operands to binary expression ('void' and 'u64' (aka 'unsigned long long'))
    1314 |                 val = otx2_atomic64_add((qidx << 44), ptr);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:751:47: note: expanded from macro 'otx2_atomic64_add'
     751 | #define otx2_atomic64_add(incr, ptr)            ({ *ptr += incr; })
         |                                                    ~~~~ ^  ~~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c:1353:9: warning: ISO C does not allow indirection on operand of type 'void *' [-Wvoid-ptr-dereference]
    1353 |                 val = otx2_atomic64_add((qidx << 44), ptr);
         |                       ^                               ~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:751:42: note: expanded from macro 'otx2_atomic64_add'
     751 | #define otx2_atomic64_add(incr, ptr)            ({ *ptr += incr; })
         |                                                    ^~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c:1353:9: error: invalid operands to binary expression ('void' and 'u64' (aka 'unsigned long long'))
    1353 |                 val = otx2_atomic64_add((qidx << 44), ptr);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:751:47: note: expanded from macro 'otx2_atomic64_add'
     751 | #define otx2_atomic64_add(incr, ptr)            ({ *ptr += incr; })
         |                                                    ~~~~ ^  ~~~~
   3 warnings and 3 errors generated.


vim +804 drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h

4c236d5dc8b8622 Geetha sowjanya   2021-02-11  797  
caa2da34fd25a37 Sunil Goutham     2020-01-27  798  /* Alloc pointer from pool/aura */
caa2da34fd25a37 Sunil Goutham     2020-01-27  799  static inline u64 otx2_aura_allocptr(struct otx2_nic *pfvf, int aura)
caa2da34fd25a37 Sunil Goutham     2020-01-27  800  {
22f5790bc6ba331 Subbaraya Sundeep 2025-05-26  801  	void __iomem *ptr = otx2_get_regaddr(pfvf, NPA_LF_AURA_OP_ALLOCX(0));
caa2da34fd25a37 Sunil Goutham     2020-01-27  802  	u64 incr = (u64)aura | BIT_ULL(63);
caa2da34fd25a37 Sunil Goutham     2020-01-27  803  
caa2da34fd25a37 Sunil Goutham     2020-01-27 @804  	return otx2_atomic64_add(incr, ptr);
caa2da34fd25a37 Sunil Goutham     2020-01-27  805  }
caa2da34fd25a37 Sunil Goutham     2020-01-27  806  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
