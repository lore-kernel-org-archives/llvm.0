Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1941E34D4D2;
	Thu, 16 Apr 2026 21:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776374185; cv=none; b=p+n3Tg9nTSb8kcc77+NFOXmUiP8vnrs21rHLl3Nmce6mLOypTru8nDPhaLnddhBVmdmzrEQerwBwUnvZi8EnlMwpsymJ4dBvsCnpNL/fr27PFNhzFMZjQaUBAcWpbyMjsGVmksUSSqHpUWj1MxgTejm2A0z9l7o9vTQ1oFiZCR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776374185; c=relaxed/simple;
	bh=pjOVTrjSgTBnJO30F92ln+eB8kzfhich64N01vt/uXQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pys36YADKvoWqRmh6HO5XZW6n13qalE4Z2ls275Zv0KwUmml+AHTYhI/ReibK7gT/2gXG/gd81qGid5Sv6gfXu+Xgq7gkitwAFTaJ1q+Pmy8mrL8Vr20SEyEUJGxrZOCvJviFqqXfeb9MPZbigkhbleEHH7NSdjh50rgE0JdFs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h6xN6Ryq; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h6xN6Ryq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776374184; x=1807910184;
  h=date:from:to:cc:subject:message-id;
  bh=pjOVTrjSgTBnJO30F92ln+eB8kzfhich64N01vt/uXQ=;
  b=h6xN6RyqwmuFjsNvoMBFl7TShoC17jPcnBqe5N2QhWzEGZrPHZiHRZPh
   HAkzwa/6Wg6YhayuuNvYbjj7MATOTU3C0HFj7Oa3GI7xqk8Jxu4Ykspo3
   mWgzggdts10P5PFi4ocHiLmmEVdXSO6OSy2kOFbS/n7aoc8YIOKtUsspw
   L/6oXjrcySCV9ihIrID7JEQ4CXTUdiTJetuixL5u5O7dDmAvFx7UFyckw
   WLZC/4waGhL8Mb/c7j0oaysD/1V+0DXC67jIFr1dHO6wuNiJqafMAZgYW
   EaIl4FE5TOsiSh+E6j8GKHrDBoaazFLzfhFi96zLUgOrnCPXAGDktECL1
   Q==;
X-CSE-ConnectionGUID: idhDEBreT8y2wyAVKcDvQw==
X-CSE-MsgGUID: 0Fdu2lRhQjenQbYAv0rTEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77568396"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="77568396"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 14:16:23 -0700
X-CSE-ConnectionGUID: aVh895c1Rfi2fYDTUq90LQ==
X-CSE-MsgGUID: nPgs5eRoRVKF2EkL1wAFFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="228178718"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Apr 2026 14:16:20 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDU4Q-000000001xQ-0sMY;
	Thu, 16 Apr 2026 21:16:18 +0000
Date: Fri, 17 Apr 2026 05:15:20 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [cilium:pr/bpf-tproxy 8/8]
 drivers/net/ethernet/sfc/ef100_rx.c:176:3: warning: shift count is negative
Message-ID: <202604170525.XFv5pb6f-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/cilium/linux.git pr/bpf-tproxy
head:   27d1eafb8d37f1b272a991077d3bd1bb312118a9
commit: 27d1eafb8d37f1b272a991077d3bd1bb312118a9 [8/8] bpf: Support SOCK_RCU_FREE sockets in bpf_sk_assign on egress
config: i386-buildonly-randconfig-003-20260416 (https://download.01.org/0day-ci/archive/20260417/202604170525.XFv5pb6f-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260417/202604170525.XFv5pb6f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604170525.XFv5pb6f-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/sfc/ef100_rx.c:11:
   In file included from drivers/net/ethernet/sfc/net_driver.h:28:
   In file included from include/net/busy_poll.h:18:
   In file included from include/net/ip.h:29:
   In file included from include/net/inet_sock.h:24:
   include/net/request_sock.h:117:29: error: use of undeclared identifier 'sock_pfree_ref'; did you mean 'sock_kfree_s'?
     117 |                               skb->destructor == sock_pfree_ref;
         |                                                  ^~~~~~~~~~~~~~
         |                                                  sock_kfree_s
   include/net/sock.h:1901:6: note: 'sock_kfree_s' declared here
    1901 | void sock_kfree_s(struct sock *sk, void *mem, int size);
         |      ^
>> drivers/net/ethernet/sfc/ef100_rx.c:176:3: warning: shift count is negative [-Wshift-count-negative]
     176 |                 EFX_QWORD_FIELD(*p_event, ESF_GZ_EV_RXPKTS_NUM_PKT);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:231:26: note: expanded from macro 'EFX_QWORD_FIELD'
     231 | #define EFX_QWORD_FIELD         EFX_QWORD_FIELD32
         |                                 ^
   drivers/net/ethernet/sfc/bitfield.h:183:2: note: expanded from macro 'EFX_QWORD_FIELD32'
     183 |         EFX_EXTRACT_QWORD32(qword, EFX_LOW_BIT(field),          \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     184 |                             EFX_HIGH_BIT(field))
         |                             ~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:163:4: note: expanded from macro 'EFX_EXTRACT_QWORD32'
     163 |           EFX_EXTRACT32((qword).u32[1], 32, 63, low, high)) &           \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:143:2: note: expanded from macro 'EFX_EXTRACT32'
     143 |         EFX_EXTRACT_NATIVE(le32_to_cpu(element), min, max, low, high)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:128:20: note: expanded from macro 'EFX_EXTRACT_NATIVE'
     128 |          (native_element) >> ((low) - (min)) :                          \
         |                           ^  ~~~~~~~~~~~~~~~
>> drivers/net/ethernet/sfc/ef100_rx.c:176:3: warning: shift count >= width of type [-Wshift-count-overflow]
     176 |                 EFX_QWORD_FIELD(*p_event, ESF_GZ_EV_RXPKTS_NUM_PKT);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:231:26: note: expanded from macro 'EFX_QWORD_FIELD'
     231 | #define EFX_QWORD_FIELD         EFX_QWORD_FIELD32
         |                                 ^
   drivers/net/ethernet/sfc/bitfield.h:183:2: note: expanded from macro 'EFX_QWORD_FIELD32'
     183 |         EFX_EXTRACT_QWORD32(qword, EFX_LOW_BIT(field),          \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     184 |                             EFX_HIGH_BIT(field))
         |                             ~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:163:4: note: expanded from macro 'EFX_EXTRACT_QWORD32'
     163 |           EFX_EXTRACT32((qword).u32[1], 32, 63, low, high)) &           \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:143:2: note: expanded from macro 'EFX_EXTRACT32'
     143 |         EFX_EXTRACT_NATIVE(le32_to_cpu(element), min, max, low, high)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:129:20: note: expanded from macro 'EFX_EXTRACT_NATIVE'
     129 |          (native_element) << ((min) - (low)))
         |                           ^  ~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/ef100_rx.c:205:3: warning: shift count is negative [-Wshift-count-negative]
     205 |                 EFX_POPULATE_QWORD_1(*rxd, ESF_GZ_RX_BUF_ADDR, rx_buf->dma_addr);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:440:2: note: expanded from macro 'EFX_POPULATE_QWORD_1'
     440 |         EFX_POPULATE_QWORD_2(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:438:2: note: expanded from macro 'EFX_POPULATE_QWORD_2'
     438 |         EFX_POPULATE_QWORD_3(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:436:2: note: expanded from macro 'EFX_POPULATE_QWORD_3'
     436 |         EFX_POPULATE_QWORD_4(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 21 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/net/ethernet/sfc/bitfield.h:258:3: note: expanded from macro 'EFX_INSERT_NATIVE'
     258 |          EFX_INSERT_NATIVE64(min, max, low, high, value) :      \
         |          ^
   drivers/net/ethernet/sfc/bitfield.h:247:21: note: expanded from macro 'EFX_INSERT_NATIVE64'
     247 |           (((u64) (value)) << (low - min)) :            \
         |                            ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
      34 | #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
         |                                                   ^
   drivers/net/ethernet/sfc/ef100_rx.c:205:3: warning: shift count is negative [-Wshift-count-negative]
     205 |                 EFX_POPULATE_QWORD_1(*rxd, ESF_GZ_RX_BUF_ADDR, rx_buf->dma_addr);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:440:2: note: expanded from macro 'EFX_POPULATE_QWORD_1'
     440 |         EFX_POPULATE_QWORD_2(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:438:2: note: expanded from macro 'EFX_POPULATE_QWORD_2'
     438 |         EFX_POPULATE_QWORD_3(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:436:2: note: expanded from macro 'EFX_POPULATE_QWORD_3'
     436 |         EFX_POPULATE_QWORD_4(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 21 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/net/ethernet/sfc/bitfield.h:259:3: note: expanded from macro 'EFX_INSERT_NATIVE'
     259 |          EFX_INSERT_NATIVE32(min, max, low, high, value))
         |          ^
   drivers/net/ethernet/sfc/bitfield.h:253:21: note: expanded from macro 'EFX_INSERT_NATIVE32'
     253 |           (((u32) (value)) << (low - min)) :            \
         |                            ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
      34 | #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
         |                                                   ^
   drivers/net/ethernet/sfc/ef100_rx.c:205:3: warning: shift count >= width of type [-Wshift-count-overflow]
     205 |                 EFX_POPULATE_QWORD_1(*rxd, ESF_GZ_RX_BUF_ADDR, rx_buf->dma_addr);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:440:2: note: expanded from macro 'EFX_POPULATE_QWORD_1'
     440 |         EFX_POPULATE_QWORD_2(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:438:2: note: expanded from macro 'EFX_POPULATE_QWORD_2'
     438 |         EFX_POPULATE_QWORD_3(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:436:2: note: expanded from macro 'EFX_POPULATE_QWORD_3'
     436 |         EFX_POPULATE_QWORD_4(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 21 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/net/ethernet/sfc/bitfield.h:259:3: note: expanded from macro 'EFX_INSERT_NATIVE'
     259 |          EFX_INSERT_NATIVE32(min, max, low, high, value))
         |          ^
   drivers/net/ethernet/sfc/bitfield.h:254:21: note: expanded from macro 'EFX_INSERT_NATIVE32'
     254 |           (((u32) (value)) >> (min - low))))
         |                            ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
      34 | #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
         |                                                   ^
   drivers/net/ethernet/sfc/ef100_rx.c:205:3: warning: shift count is negative [-Wshift-count-negative]
     205 |                 EFX_POPULATE_QWORD_1(*rxd, ESF_GZ_RX_BUF_ADDR, rx_buf->dma_addr);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:440:2: note: expanded from macro 'EFX_POPULATE_QWORD_1'
     440 |         EFX_POPULATE_QWORD_2(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:438:2: note: expanded from macro 'EFX_POPULATE_QWORD_2'
     438 |         EFX_POPULATE_QWORD_3(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:436:2: note: expanded from macro 'EFX_POPULATE_QWORD_3'
     436 |         EFX_POPULATE_QWORD_4(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 21 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/net/ethernet/sfc/bitfield.h:258:3: note: expanded from macro 'EFX_INSERT_NATIVE'
     258 |          EFX_INSERT_NATIVE64(min, max, low, high, value) :      \
--
   In file included from drivers/net/ethernet/sfc/mcdi_port.c:12:
   In file included from drivers/net/ethernet/sfc/efx.h:12:
   In file included from drivers/net/ethernet/sfc/net_driver.h:28:
   In file included from include/net/busy_poll.h:18:
   In file included from include/net/ip.h:29:
   In file included from include/net/inet_sock.h:24:
   include/net/request_sock.h:117:29: error: use of undeclared identifier 'sock_pfree_ref'; did you mean 'sock_kfree_s'?
     117 |                               skb->destructor == sock_pfree_ref;
         |                                                  ^~~~~~~~~~~~~~
         |                                                  sock_kfree_s
   include/net/sock.h:1901:6: note: 'sock_kfree_s' declared here
    1901 | void sock_kfree_s(struct sock *sk, void *mem, int size);
         |      ^
>> drivers/net/ethernet/sfc/mcdi_port.c:41:9: warning: shift count >= width of type [-Wshift-count-overflow]
      41 |         return MCDI_DWORD(outbuf, GET_LINK_OUT_MAC_FAULT) != 0;
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/mcdi.h:257:2: note: expanded from macro 'MCDI_DWORD'
     257 |         EFX_DWORD_FIELD(*_MCDI_DWORD(_buf, _field), EFX_DWORD_0)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:187:2: note: expanded from macro 'EFX_DWORD_FIELD'
     187 |         EFX_EXTRACT_DWORD(dword, EFX_LOW_BIT(field),            \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     188 |                           EFX_HIGH_BIT(field))
         |                           ~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:168:3: note: expanded from macro 'EFX_EXTRACT_DWORD'
     168 |          EFX_MASK32((high) + 1 - (low)))
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:73:16: note: expanded from macro 'EFX_MASK32'
      73 |          (((((u32) 1) << (width))) - 1))
         |                       ^  ~~~~~~~
   1 warning and 1 error generated.
--
   In file included from drivers/net/ethernet/sfc/ef100.c:12:
   In file included from drivers/net/ethernet/sfc/net_driver.h:28:
   In file included from include/net/busy_poll.h:18:
   In file included from include/net/ip.h:29:
   In file included from include/net/inet_sock.h:24:
   include/net/request_sock.h:117:29: error: use of undeclared identifier 'sock_pfree_ref'; did you mean 'sock_kfree_s'?
     117 |                               skb->destructor == sock_pfree_ref;
         |                                                  ^~~~~~~~~~~~~~
         |                                                  sock_kfree_s
   include/net/sock.h:1901:6: note: 'sock_kfree_s' declared here
    1901 | void sock_kfree_s(struct sock *sk, void *mem, int size);
         |      ^
>> drivers/net/ethernet/sfc/ef100.c:118:8: warning: shift count >= width of type [-Wshift-count-overflow]
     118 |         bar = EFX_OWORD_FIELD32(entry, ESF_GZ_CFGBAR_CONT_CAP_BAR);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:179:2: note: expanded from macro 'EFX_OWORD_FIELD32'
     179 |         EFX_EXTRACT_OWORD32(oword, EFX_LOW_BIT(field),          \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     180 |                             EFX_HIGH_BIT(field))
         |                             ~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:155:4: note: expanded from macro 'EFX_EXTRACT_OWORD32'
     155 |         ((EFX_EXTRACT32((oword).u32[0], 0, 31, low, high) |             \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:143:2: note: expanded from macro 'EFX_EXTRACT32'
     143 |         EFX_EXTRACT_NATIVE(le32_to_cpu(element), min, max, low, high)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:128:20: note: expanded from macro 'EFX_EXTRACT_NATIVE'
     128 |          (native_element) >> ((low) - (min)) :                          \
         |                           ^  ~~~~~~~~~~~~~~~
>> drivers/net/ethernet/sfc/ef100.c:118:8: warning: shift count is negative [-Wshift-count-negative]
     118 |         bar = EFX_OWORD_FIELD32(entry, ESF_GZ_CFGBAR_CONT_CAP_BAR);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:179:2: note: expanded from macro 'EFX_OWORD_FIELD32'
     179 |         EFX_EXTRACT_OWORD32(oword, EFX_LOW_BIT(field),          \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     180 |                             EFX_HIGH_BIT(field))
         |                             ~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:155:4: note: expanded from macro 'EFX_EXTRACT_OWORD32'
     155 |         ((EFX_EXTRACT32((oword).u32[0], 0, 31, low, high) |             \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:143:2: note: expanded from macro 'EFX_EXTRACT32'
     143 |         EFX_EXTRACT_NATIVE(le32_to_cpu(element), min, max, low, high)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:129:20: note: expanded from macro 'EFX_EXTRACT_NATIVE'
     129 |          (native_element) << ((min) - (low)))
         |                           ^  ~~~~~~~~~~~~~~~
>> drivers/net/ethernet/sfc/ef100.c:118:8: warning: shift count >= width of type [-Wshift-count-overflow]
     118 |         bar = EFX_OWORD_FIELD32(entry, ESF_GZ_CFGBAR_CONT_CAP_BAR);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:179:2: note: expanded from macro 'EFX_OWORD_FIELD32'
     179 |         EFX_EXTRACT_OWORD32(oword, EFX_LOW_BIT(field),          \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     180 |                             EFX_HIGH_BIT(field))
         |                             ~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:156:4: note: expanded from macro 'EFX_EXTRACT_OWORD32'
     156 |           EFX_EXTRACT32((oword).u32[1], 32, 63, low, high) |            \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:143:2: note: expanded from macro 'EFX_EXTRACT32'
     143 |         EFX_EXTRACT_NATIVE(le32_to_cpu(element), min, max, low, high)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:128:20: note: expanded from macro 'EFX_EXTRACT_NATIVE'
     128 |          (native_element) >> ((low) - (min)) :                          \
         |                           ^  ~~~~~~~~~~~~~~~
>> drivers/net/ethernet/sfc/ef100.c:118:8: warning: shift count is negative [-Wshift-count-negative]
     118 |         bar = EFX_OWORD_FIELD32(entry, ESF_GZ_CFGBAR_CONT_CAP_BAR);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:179:2: note: expanded from macro 'EFX_OWORD_FIELD32'
     179 |         EFX_EXTRACT_OWORD32(oword, EFX_LOW_BIT(field),          \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     180 |                             EFX_HIGH_BIT(field))
         |                             ~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:156:4: note: expanded from macro 'EFX_EXTRACT_OWORD32'
     156 |           EFX_EXTRACT32((oword).u32[1], 32, 63, low, high) |            \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:143:2: note: expanded from macro 'EFX_EXTRACT32'
     143 |         EFX_EXTRACT_NATIVE(le32_to_cpu(element), min, max, low, high)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:129:20: note: expanded from macro 'EFX_EXTRACT_NATIVE'
     129 |          (native_element) << ((min) - (low)))
         |                           ^  ~~~~~~~~~~~~~~~
>> drivers/net/ethernet/sfc/ef100.c:118:8: warning: shift count is negative [-Wshift-count-negative]
     118 |         bar = EFX_OWORD_FIELD32(entry, ESF_GZ_CFGBAR_CONT_CAP_BAR);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:179:2: note: expanded from macro 'EFX_OWORD_FIELD32'
     179 |         EFX_EXTRACT_OWORD32(oword, EFX_LOW_BIT(field),          \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     180 |                             EFX_HIGH_BIT(field))
         |                             ~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:158:4: note: expanded from macro 'EFX_EXTRACT_OWORD32'
     158 |           EFX_EXTRACT32((oword).u32[3], 96, 127, low, high)) &          \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:143:2: note: expanded from macro 'EFX_EXTRACT32'
     143 |         EFX_EXTRACT_NATIVE(le32_to_cpu(element), min, max, low, high)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:128:20: note: expanded from macro 'EFX_EXTRACT_NATIVE'
     128 |          (native_element) >> ((low) - (min)) :                          \
         |                           ^  ~~~~~~~~~~~~~~~
>> drivers/net/ethernet/sfc/ef100.c:118:8: warning: shift count >= width of type [-Wshift-count-overflow]
     118 |         bar = EFX_OWORD_FIELD32(entry, ESF_GZ_CFGBAR_CONT_CAP_BAR);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:179:2: note: expanded from macro 'EFX_OWORD_FIELD32'
     179 |         EFX_EXTRACT_OWORD32(oword, EFX_LOW_BIT(field),          \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     180 |                             EFX_HIGH_BIT(field))
         |                             ~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:158:4: note: expanded from macro 'EFX_EXTRACT_OWORD32'
     158 |           EFX_EXTRACT32((oword).u32[3], 96, 127, low, high)) &          \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:143:2: note: expanded from macro 'EFX_EXTRACT32'
     143 |         EFX_EXTRACT_NATIVE(le32_to_cpu(element), min, max, low, high)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:129:20: note: expanded from macro 'EFX_EXTRACT_NATIVE'
     129 |          (native_element) << ((min) - (low)))
         |                           ^  ~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/ef100.c:120:11: warning: shift count >= width of type [-Wshift-count-overflow]
     120 |         offset = EFX_OWORD_FIELD64(entry, ESF_GZ_CFGBAR_CONT_CAP_OFFSET) <<
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:171:2: note: expanded from macro 'EFX_OWORD_FIELD64'
     171 |         EFX_EXTRACT_OWORD64(oword, EFX_LOW_BIT(field),          \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     172 |                             EFX_HIGH_BIT(field))
         |                             ~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:146:4: note: expanded from macro 'EFX_EXTRACT_OWORD64'
     146 |         ((EFX_EXTRACT64((oword).u64[0], 0, 63, low, high) |             \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:136:2: note: expanded from macro 'EFX_EXTRACT64'
     136 |         EFX_EXTRACT_NATIVE(le64_to_cpu(element), min, max, low, high)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:128:20: note: expanded from macro 'EFX_EXTRACT_NATIVE'
     128 |          (native_element) >> ((low) - (min)) :                          \
         |                           ^  ~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/ef100.c:120:11: warning: shift count is negative [-Wshift-count-negative]
     120 |         offset = EFX_OWORD_FIELD64(entry, ESF_GZ_CFGBAR_CONT_CAP_OFFSET) <<
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:171:2: note: expanded from macro 'EFX_OWORD_FIELD64'
     171 |         EFX_EXTRACT_OWORD64(oword, EFX_LOW_BIT(field),          \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     172 |                             EFX_HIGH_BIT(field))
         |                             ~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:146:4: note: expanded from macro 'EFX_EXTRACT_OWORD64'
     146 |         ((EFX_EXTRACT64((oword).u64[0], 0, 63, low, high) |             \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:136:2: note: expanded from macro 'EFX_EXTRACT64'
     136 |         EFX_EXTRACT_NATIVE(le64_to_cpu(element), min, max, low, high)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:129:20: note: expanded from macro 'EFX_EXTRACT_NATIVE'
     129 |          (native_element) << ((min) - (low)))
         |                           ^  ~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/ef100.c:120:11: warning: shift count is negative [-Wshift-count-negative]
     120 |         offset = EFX_OWORD_FIELD64(entry, ESF_GZ_CFGBAR_CONT_CAP_OFFSET) <<
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:171:2: note: expanded from macro 'EFX_OWORD_FIELD64'
     171 |         EFX_EXTRACT_OWORD64(oword, EFX_LOW_BIT(field),          \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     172 |                             EFX_HIGH_BIT(field))
         |                             ~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:147:4: note: expanded from macro 'EFX_EXTRACT_OWORD64'
     147 |           EFX_EXTRACT64((oword).u64[1], 64, 127, low, high)) &          \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:136:2: note: expanded from macro 'EFX_EXTRACT64'
     136 |         EFX_EXTRACT_NATIVE(le64_to_cpu(element), min, max, low, high)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:129:20: note: expanded from macro 'EFX_EXTRACT_NATIVE'
     129 |          (native_element) << ((min) - (low)))
         |                           ^  ~~~~~~~~~~~~~~~
   9 warnings and 1 error generated.
..


vim +176 drivers/net/ethernet/sfc/ef100_rx.c

8e57daf70671e4 Edward Cree 2020-08-03  171  
8e57daf70671e4 Edward Cree 2020-08-03  172  void efx_ef100_ev_rx(struct efx_channel *channel, const efx_qword_t *p_event)
8e57daf70671e4 Edward Cree 2020-08-03  173  {
8e57daf70671e4 Edward Cree 2020-08-03  174  	struct efx_rx_queue *rx_queue = efx_channel_get_rx_queue(channel);
8e57daf70671e4 Edward Cree 2020-08-03  175  	unsigned int n_packets =
8e57daf70671e4 Edward Cree 2020-08-03 @176  		EFX_QWORD_FIELD(*p_event, ESF_GZ_EV_RXPKTS_NUM_PKT);
8e57daf70671e4 Edward Cree 2020-08-03  177  	int i;
8e57daf70671e4 Edward Cree 2020-08-03  178  
8e57daf70671e4 Edward Cree 2020-08-03  179  	WARN_ON_ONCE(!n_packets);
8e57daf70671e4 Edward Cree 2020-08-03  180  	if (n_packets > 1)
8e57daf70671e4 Edward Cree 2020-08-03  181  		++channel->n_rx_merge_events;
8e57daf70671e4 Edward Cree 2020-08-03  182  
8e57daf70671e4 Edward Cree 2020-08-03  183  	channel->irq_mod_score += 2 * n_packets;
8e57daf70671e4 Edward Cree 2020-08-03  184  
8e57daf70671e4 Edward Cree 2020-08-03  185  	for (i = 0; i < n_packets; ++i) {
8e57daf70671e4 Edward Cree 2020-08-03  186  		ef100_rx_packet(rx_queue,
8e57daf70671e4 Edward Cree 2020-08-03  187  				rx_queue->removed_count & rx_queue->ptr_mask);
8e57daf70671e4 Edward Cree 2020-08-03  188  		++rx_queue->removed_count;
8e57daf70671e4 Edward Cree 2020-08-03  189  	}
8e57daf70671e4 Edward Cree 2020-08-03  190  }
8e57daf70671e4 Edward Cree 2020-08-03  191  

:::::: The code at line 176 was first introduced by commit
:::::: 8e57daf70671e482209b5d231a181f04845cf73e sfc_ef100: RX path for EF100

:::::: TO: Edward Cree <ecree@solarflare.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
