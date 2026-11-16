Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794852098;
	b=TmLdFHubDFRYZz9RV8bxz/6clx1h4MdN5GOJKyQ68TTco2Bn3VwJLkfGidzARfhEmonj
	 zVGala2HoXRbAnK4dW6uEUNRPp1puwVYqbnF+xc8TID8X4ObRNq2gsNhwmb6ec63JNsxy
	 3Yiz8TTwfO4KAEHIaqq4MuFDLYKv7sZE5N6YF+i75Dhcrpgzi7l1hTe5dqquUGhEjBxKp
	 5QIid3qurT15g5WARUF3Jwi0B+8VnVsWQL/NEzs6Rdz0sAdOYASC1FBUJfga4u4/LH1Oe
	 edu0OaOnPFitMShxA4Tm+LKZx6JV48WAT6U96U8GZ/u47CkfN0fu8LfcxIxUhqwEWcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852098;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=6bHNbn+AnrGcdiIjb4Ht7xasuv47Ac5iq3Lki+QWU7A=;
	b=UVy7HjvZhgMmMuL2Ss0o86bFpRi/RFL4VRimbwZjxUmeW8n76RKnjp7dXrgc3q0heuPp
	 penLMhlaLlUwLQorLLtdVQcKKiPP279dCJ3qxOg781W0BRmHgNjVL9tUZ7KZSV+1PdRfL
	 YgyfBMXycM0PiKXkigfS9hSk7UKs8K2hChutMBS9RnskEVw6VvkwwNJ8dIpn/M1Q35/xJ
	 Jz8VXIfSNRkM/czrayCMxJOtRiCTjTk+dePncDjbzxqnuEY2MISxGxcpyc+0nQbsUWjT0
	 IELe4yK4Czr4uLx0vEDfVsb8YVgWkeiDOqb/klKxhwD56RjUXbKmLfrm1jK6lqSW49A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I37liP1F;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C79606A33D;
	Mon, 16 Nov 2026 18:01:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8C79606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I37liP1F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794852097; x=1826388097;
  h=date:from:to:cc:subject:message-id;
  bh=Bg5KF6+w4I+oh0aPQlU7TVcauuHaFzXGt0EAR5oTkWg=;
  b=I37liP1Fs0u5RYysPepew9Ql8oPIrdQQEdHvsJOhB5Qhv2k85zo/NkFc
   jdzCXnlL8Hk5LaANrRfE+A64Hj7zMtltTeganOQsQ3dCSZKQ+X9mK1h9Z
   nJNpXzwT/QMDfU2A0JZpsP3cd2nKDiOHZK+8VjoQ5NeurNo2avDGy87qo
   2Jr0+MgwCw8XVl/Gm/+M5AKABVRvnpjcixy23RhvI10sEFJJidmGrIWXQ
   vS9wcP0f/AM6e9BXLL1HxPe95rfEvSw7yPP7OQ0cqC0jJJR6ym1Ely8FG
   WfjSD5H/90AfOVBLnN5wO3xStJJkI9Zfyk7EMrW5C0fX6ohpIMG3gYCs7
   w==;
X-CSE-ConnectionGUID: igjwPxFyTb6heH/5EfwJLw==
X-CSE-MsgGUID: 6gflfacgSuyS8RYolM7a2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3676528"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3676528"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 10:01:36 -0800
X-CSE-ConnectionGUID: Z73Ks279RpG/76Q/XeAxsA==
X-CSE-MsgGUID: 7DtGVnf3Saes/RgnsGWDFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="11328297"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 16 Nov 2026 10:01:34 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT11H-000000019Bo-2nNl;
	Mon, 16 Nov 2026 18:01:31 +0000
Date: Tue, 17 Nov 2026 02:00:44 +0800
From: kernel test robot <lkp@intel.com>
To: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-doc@vger.kernel.org
Subject: [cornelisnetworks:for-upstream_20261115-1518 35/35] Warning:
 drivers/infiniband/hw/hfi2/bulksvc_user.c:1291 This comment starts with
 '/**', but isn't a kernel-doc comment. Refer to
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202611170154.glIRRQ3t-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

Hi Dennis,

First bad commit (maybe != root cause):

tree:   https://github.com/cornelisnetworks/linux.git for-upstream_20261115-1518
head:   16b51e7cd1a98a98348c7b3d5824a3507c8132fa
commit: 16b51e7cd1a98a98348c7b3d5824a3507c8132fa [35/35] RDMA/hfi2: Add tracepoints and enable hfi2 driver build
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20261117/202611170154.glIRRQ3t-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project ca14e3d05c4e63d6e8103945c86b958ed2f55d5f)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611170154.glIRRQ3t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611170154.glIRRQ3t-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/infiniband/hw/hfi2/bulksvc.c:1205:44: error: use of undeclared identifier 'HFI_RVT_WQ_PERCPU'
    1205 |                             (svc->num_lanes == 1 ? WQ_UNBOUND : HFI_RVT_WQ_PERCPU);
         |                                                                 ^~~~~~~~~~~~~~~~~
   1 error generated.
--
>> drivers/infiniband/hw/hfi2/bulksvc_verbs.c:2214:6: warning: variable 'err_rc' set but not used [-Wunused-but-set-variable]
    2214 |         int err_rc = 0;
         |             ^
   drivers/infiniband/hw/hfi2/bulksvc_verbs.c:2458:6: warning: variable 'err_rc' set but not used [-Wunused-but-set-variable]
    2458 |         int err_rc = 0;
         |             ^
   2 warnings generated.
--
>> drivers/infiniband/hw/hfi2/dms_roce.c:562:13: warning: unused variable 'roce_pio_movdir64b' [-Wunused-variable]
     562 | static bool roce_pio_movdir64b;
         |             ^~~~~~~~~~~~~~~~~~
   1 warning generated.
--
>> drivers/infiniband/hw/hfi2/chip.c:6483:28: warning: variable 'extended_vl' set but not used [-Wunused-but-set-variable]
    6483 |         unsigned int qpns_per_vl, extended_vl, ctxt, i, qpn, n, m;
         |                                   ^
   1 warning generated.
--
>> drivers/infiniband/hw/hfi2/eth_ethtool.c:1050:12: error: no member named 'ptp_clock' in 'struct ether_device'
    1050 |         if (edev->ptp_clock) {
         |             ~~~~  ^
   drivers/infiniband/hw/hfi2/eth_ethtool.c:1051:43: error: no member named 'ptp_clock' in 'struct ether_device'
    1051 |                 info->phc_index = ptp_clock_index(edev->ptp_clock);
         |                                                   ~~~~  ^
   2 errors generated.
--
>> drivers/infiniband/hw/hfi2/eth_main.c:214:10: error: call to undeclared function 'cne_ptp_get_ts_config'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     214 |                 return cne_ptp_get_ts_config(ndev, req);
         |                        ^
   drivers/infiniband/hw/hfi2/eth_main.c:214:10: note: did you mean 'cne_get_vf_config'?
   drivers/infiniband/hw/hfi2/eth_main.h:345:5: note: 'cne_get_vf_config' declared here
     345 | int cne_get_vf_config(struct net_device *ndev, int vf, struct ifla_vf_info *ivf);
         |     ^
>> drivers/infiniband/hw/hfi2/eth_main.c:216:10: error: call to undeclared function 'cne_ptp_set_ts_config'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     216 |                 return cne_ptp_set_ts_config(ndev, req);
         |                        ^
   2 errors generated.
--
>> drivers/infiniband/hw/hfi2/eth_tx.c:227:23: error: no member named 'ptp_config' in 'struct ether_device'
     227 |                 if (READ_ONCE(edev->ptp_config.tx_type) == HWTSTAMP_TX_ON &&
         |                               ~~~~  ^
>> drivers/infiniband/hw/hfi2/eth_tx.c:227:23: error: no member named 'ptp_config' in 'struct ether_device'
     227 |                 if (READ_ONCE(edev->ptp_config.tx_type) == HWTSTAMP_TX_ON &&
         |                               ~~~~  ^
>> drivers/infiniband/hw/hfi2/eth_tx.c:227:23: error: no member named 'ptp_config' in 'struct ether_device'
     227 |                 if (READ_ONCE(edev->ptp_config.tx_type) == HWTSTAMP_TX_ON &&
         |                               ~~~~  ^
>> drivers/infiniband/hw/hfi2/eth_tx.c:227:23: error: no member named 'ptp_config' in 'struct ether_device'
     227 |                 if (READ_ONCE(edev->ptp_config.tx_type) == HWTSTAMP_TX_ON &&
         |                               ~~~~  ^
>> drivers/infiniband/hw/hfi2/eth_tx.c:227:23: error: no member named 'ptp_config' in 'struct ether_device'
     227 |                 if (READ_ONCE(edev->ptp_config.tx_type) == HWTSTAMP_TX_ON &&
         |                               ~~~~  ^
>> drivers/infiniband/hw/hfi2/eth_tx.c:227:23: error: no member named 'ptp_config' in 'struct ether_device'
     227 |                 if (READ_ONCE(edev->ptp_config.tx_type) == HWTSTAMP_TX_ON &&
         |                               ~~~~  ^
>> drivers/infiniband/hw/hfi2/eth_tx.c:227:23: error: no member named 'ptp_config' in 'struct ether_device'
     227 |                 if (READ_ONCE(edev->ptp_config.tx_type) == HWTSTAMP_TX_ON &&
         |                               ~~~~  ^
>> drivers/infiniband/hw/hfi2/eth_tx.c:228:40: error: no member named 'ptp_in_progress' in 'struct ether_device'
     228 |                     !test_and_set_bit_lock(1, &edev->ptp_in_progress)) {
         |                                                ~~~~  ^
>> drivers/infiniband/hw/hfi2/eth_tx.c:230:21: error: no member named 'ptp_tx_skb' in 'struct ether_device'
     230 |                         WRITE_ONCE(edev->ptp_tx_skb, skb_get(skb));
         |                                    ~~~~  ^
>> drivers/infiniband/hw/hfi2/eth_tx.c:230:21: error: no member named 'ptp_tx_skb' in 'struct ether_device'
     230 |                         WRITE_ONCE(edev->ptp_tx_skb, skb_get(skb));
         |                                    ~~~~  ^
>> drivers/infiniband/hw/hfi2/eth_tx.c:230:21: error: no member named 'ptp_tx_skb' in 'struct ether_device'
     230 |                         WRITE_ONCE(edev->ptp_tx_skb, skb_get(skb));
         |                                    ~~~~  ^
>> drivers/infiniband/hw/hfi2/eth_tx.c:230:21: error: no member named 'ptp_tx_skb' in 'struct ether_device'
     230 |                         WRITE_ONCE(edev->ptp_tx_skb, skb_get(skb));
         |                                    ~~~~  ^
>> drivers/infiniband/hw/hfi2/eth_tx.c:230:21: error: no member named 'ptp_tx_skb' in 'struct ether_device'
     230 |                         WRITE_ONCE(edev->ptp_tx_skb, skb_get(skb));
         |                                    ~~~~  ^
>> drivers/infiniband/hw/hfi2/eth_tx.c:230:21: error: no member named 'ptp_tx_skb' in 'struct ether_device'
     230 |                         WRITE_ONCE(edev->ptp_tx_skb, skb_get(skb));
         |                                    ~~~~  ^
>> drivers/infiniband/hw/hfi2/eth_tx.c:230:21: error: no member named 'ptp_tx_skb' in 'struct ether_device'
     230 |                         WRITE_ONCE(edev->ptp_tx_skb, skb_get(skb));
         |                                    ~~~~  ^
>> drivers/infiniband/hw/hfi2/eth_tx.c:231:21: error: no member named 'ptp_tx_start' in 'struct ether_device'
     231 |                         WRITE_ONCE(edev->ptp_tx_start, get_jiffies_64());
         |                                    ~~~~  ^
>> drivers/infiniband/hw/hfi2/eth_tx.c:231:21: error: no member named 'ptp_tx_start' in 'struct ether_device'
     231 |                         WRITE_ONCE(edev->ptp_tx_start, get_jiffies_64());
         |                                    ~~~~  ^
>> drivers/infiniband/hw/hfi2/eth_tx.c:231:21: error: no member named 'ptp_tx_start' in 'struct ether_device'
     231 |                         WRITE_ONCE(edev->ptp_tx_start, get_jiffies_64());
         |                                    ~~~~  ^
>> drivers/infiniband/hw/hfi2/eth_tx.c:231:21: error: no member named 'ptp_tx_start' in 'struct ether_device'
     231 |                         WRITE_ONCE(edev->ptp_tx_start, get_jiffies_64());
         |                                    ~~~~  ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
>> drivers/infiniband/hw/hfi2/vf2pf.c:472:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     472 |         int ret;
         |             ^
   1 warning generated.
--
>> drivers/infiniband/hw/hfi2/rvt_qp.c:2507:6: warning: variable 'j' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    2507 |         if (unlikely(num_sge > max_sge))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:22: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/hfi2/rvt_qp.c:2526:9: note: uninitialized use occurs here
    2526 |         while (j) {
         |                ^
   drivers/infiniband/hw/hfi2/rvt_qp.c:2507:2: note: remove the 'if' if its condition is always false
    2507 |         if (unlikely(num_sge > max_sge))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2508 |                 goto bad_lkey;
         |                 ~~~~~~~~~~~~~
   drivers/infiniband/hw/hfi2/rvt_qp.c:2495:10: note: initialize the variable 'j' to silence this warning
    2495 |         int i, j, ret;
         |                 ^
         |                  = 0
   1 warning generated.
--
>> Warning: drivers/infiniband/hw/hfi2/eth_sriov.c:74 function parameter 'ivf' not described in 'cne_get_vf_config'
>> Warning: drivers/infiniband/hw/hfi2/eth_sriov.c:74 function parameter 'ivf' not described in 'cne_get_vf_config'
--
>> Warning: drivers/infiniband/hw/hfi2/roce_verbs.c:207 Incorrect use of kernel-doc format:  * hfi2_roce_resolve_ah - resolve L2/L3 addressing from a RoCE AH
>> Warning: drivers/infiniband/hw/hfi2/roce_verbs.c:217 function parameter 'dd' not described in 'hfi2_roce_resolve_ah'
>> Warning: drivers/infiniband/hw/hfi2/roce_verbs.c:217 function parameter 'ah' not described in 'hfi2_roce_resolve_ah'
>> Warning: drivers/infiniband/hw/hfi2/roce_verbs.c:217 function parameter 'udp_sport' not described in 'hfi2_roce_resolve_ah'
>> Warning: drivers/infiniband/hw/hfi2/roce_verbs.c:217 function parameter 'addr' not described in 'hfi2_roce_resolve_ah'
>> Warning: drivers/infiniband/hw/hfi2/roce_verbs.c:217 expecting prototype for hfi2_roce_modify_qp(). Prototype was for hfi2_roce_resolve_ah() instead
>> Warning: drivers/infiniband/hw/hfi2/roce_verbs.c:655 function parameter 'rdi' not described in 'hfi2_roce_mtu_from_qp'
>> Warning: drivers/infiniband/hw/hfi2/roce_verbs.c:655 function parameter 'qp' not described in 'hfi2_roce_mtu_from_qp'
>> Warning: drivers/infiniband/hw/hfi2/roce_verbs.c:655 function parameter 'pmtu' not described in 'hfi2_roce_mtu_from_qp'
>> Warning: drivers/infiniband/hw/hfi2/roce_verbs.c:668 function parameter 'rdi' not described in 'hfi2_roce_get_pmtu_from_attr'
>> Warning: drivers/infiniband/hw/hfi2/roce_verbs.c:668 function parameter 'qp' not described in 'hfi2_roce_get_pmtu_from_attr'
>> Warning: drivers/infiniband/hw/hfi2/roce_verbs.c:668 function parameter 'attr' not described in 'hfi2_roce_get_pmtu_from_attr'
>> Warning: drivers/infiniband/hw/hfi2/roce_verbs.c:716 function parameter 'qp' not described in 'hfi2_roce_do_send_from_rvt'
>> Warning: drivers/infiniband/hw/hfi2/roce_verbs.c:655 function parameter 'rdi' not described in 'hfi2_roce_mtu_from_qp'
>> Warning: drivers/infiniband/hw/hfi2/roce_verbs.c:655 function parameter 'qp' not described in 'hfi2_roce_mtu_from_qp'
>> Warning: drivers/infiniband/hw/hfi2/roce_verbs.c:655 function parameter 'pmtu' not described in 'hfi2_roce_mtu_from_qp'
>> Warning: drivers/infiniband/hw/hfi2/roce_verbs.c:668 function parameter 'rdi' not described in 'hfi2_roce_get_pmtu_from_attr'
>> Warning: drivers/infiniband/hw/hfi2/roce_verbs.c:668 function parameter 'qp' not described in 'hfi2_roce_get_pmtu_from_attr'
>> Warning: drivers/infiniband/hw/hfi2/roce_verbs.c:668 function parameter 'attr' not described in 'hfi2_roce_get_pmtu_from_attr'
>> Warning: drivers/infiniband/hw/hfi2/roce_verbs.c:716 function parameter 'qp' not described in 'hfi2_roce_do_send_from_rvt'
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
