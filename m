Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008C031ED68;
	Fri, 17 Apr 2026 07:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776411741; cv=none; b=hPH2NZRg2srFB2Bz8OQFIj0v2714v2AeM+OStatEbxT/LQJn6oY6yrneIMTYIJ6WIftX0iT02113N7W1AN/6EfF912LN9qcUcE8NiC5gC5olSrBOkQagi+Sdd0BsuTzYp4bTQ8EahPrRxu50eAZmW9NeGyyvJw0zJyg3b4x4DDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776411741; c=relaxed/simple;
	bh=ejDOge0l5QaCfEcVJ7Z2q2z2Ssz0ehB7V+UpyCB6eBY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p8ltp30iFOFRf1M+n1JGxrcgbOewVfY/S1+IGtZ5q7HC+57bX8gkgdRY3VWAETSqn6+TFQKKl+RCFeX67XHEn62dkG/IhELyJYNHo6Gr9/qYn7vyGnNrAIUTFADdRmEDMPAcshjrzLn05MwlIIjt6LbVmoKMw3XihvYiymSAspk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TzwHp+lO; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TzwHp+lO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776411738; x=1807947738;
  h=date:from:to:cc:subject:message-id;
  bh=ejDOge0l5QaCfEcVJ7Z2q2z2Ssz0ehB7V+UpyCB6eBY=;
  b=TzwHp+lOw1mHClEpIwILOEI4iTooX7SYlzCH9kBMqKT1HMI3EoeKNBXN
   St5XaCCQ9EVOEI6G9ef9cD9VxLWQ1TBgCGM99IxOo1+pOoKliDS33pmY9
   8PjeQNc5sCHrBmfYcBHhyLBybx0rU+C2FjkF4UazjNs9m43lJtJFFzuxy
   Ihh759N39WPJgLYWBk9pvJgstw84lCX7tnjIM+8BvGhVq6FBzepsu4VLl
   P7fpRNfkzl9pODNV5KlZHyms9XF1hqAcD5Ees0Ail9f22xyvyZDJWOLzG
   xlyqWH6OP8YFn+rnaErF4VeJbmRJwm2835yrwLzNpK3boabKoUMiKrx0m
   Q==;
X-CSE-ConnectionGUID: Xwo1li3mSYqL0mq1LSKX3A==
X-CSE-MsgGUID: qvzgTWSGRS+ak7bSzEEcBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="94992336"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="94992336"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 00:42:17 -0700
X-CSE-ConnectionGUID: b0QfZt8zRPaOG6sU3/Aclw==
X-CSE-MsgGUID: pERZDLasTzuXFgBCTqe3Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="268988678"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Apr 2026 00:42:17 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDdqA-0000000005d-49k9;
	Fri, 17 Apr 2026 07:42:15 +0000
Date: Fri, 17 Apr 2026 15:41:16 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [cilium:pr/bpf-tproxy 8/8]
 drivers/net/ethernet/intel/fm10k/fm10k_main.c:885:16: warning: division by
 zero is undefined
Message-ID: <202604171545.woUYCIGr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/cilium/linux.git pr/bpf-tproxy
head:   27d1eafb8d37f1b272a991077d3bd1bb312118a9
commit: 27d1eafb8d37f1b272a991077d3bd1bb312118a9 [8/8] bpf: Support SOCK_RCU_FREE sockets in bpf_sk_assign on egress
config: powerpc64-randconfig-001-20260417 (https://download.01.org/0day-ci/archive/20260417/202604171545.woUYCIGr-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260417/202604171545.woUYCIGr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604171545.woUYCIGr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/fm10k/fm10k_main.c:6:
   In file included from include/net/ipv6.h:12:
   In file included from include/linux/ipv6.h:103:
   In file included from include/linux/tcp.h:20:
   In file included from include/net/inet_connection_sock.h:21:
   In file included from include/net/inet_sock.h:24:
   include/net/request_sock.h:117:29: error: use of undeclared identifier 'sock_pfree_ref'; did you mean 'sock_kfree_s'?
     117 |                               skb->destructor == sock_pfree_ref;
         |                                                  ^~~~~~~~~~~~~~
         |                                                  sock_kfree_s
   include/net/sock.h:1901:6: note: 'sock_kfree_s' declared here
    1901 | void sock_kfree_s(struct sock *sk, void *mem, int size);
         |      ^
   In file included from drivers/net/ethernet/intel/fm10k/fm10k_main.c:6:
   In file included from include/net/ipv6.h:12:
   In file included from include/linux/ipv6.h:103:
   In file included from include/linux/tcp.h:20:
   In file included from include/net/inet_connection_sock.h:21:
   In file included from include/net/inet_sock.h:24:
   include/net/request_sock.h:117:26: warning: comparison of distinct pointer types ('void (*)(struct sk_buff *)' and 'void (*)(struct sock *, void *, int)') [-Wcompare-distinct-pointer-types]
     117 |                               skb->destructor == sock_pfree_ref;
         |                               ~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/fm10k/fm10k_main.c:885:16: warning: division by zero is undefined [-Wdivision-by-zero]
     885 |         desc_flags |= FM10K_SET_FLAG(tx_flags, FM10K_TX_FLAGS_CSUM,
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     886 |                                      FM10K_TXD_FLAG_CSUM);
         |                                      ~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/fm10k/fm10k_main.c:877:26: note: expanded from macro 'FM10K_SET_FLAG'
     877 |          ((u32)(_input & _flag) / (_flag / _result)))
         |                                 ^ ~~~~~~~~~~~~~~~~~
   2 warnings and 1 error generated.


vim +885 drivers/net/ethernet/intel/fm10k/fm10k_main.c

76a540d4728a379 Alexander Duyck 2014-09-20  873  
76a540d4728a379 Alexander Duyck 2014-09-20  874  #define FM10K_SET_FLAG(_input, _flag, _result) \
76a540d4728a379 Alexander Duyck 2014-09-20  875  	((_flag <= _result) ? \
76a540d4728a379 Alexander Duyck 2014-09-20  876  	 ((u32)(_input & _flag) * (_result / _flag)) : \
76a540d4728a379 Alexander Duyck 2014-09-20  877  	 ((u32)(_input & _flag) / (_flag / _result)))
76a540d4728a379 Alexander Duyck 2014-09-20  878  
76a540d4728a379 Alexander Duyck 2014-09-20  879  static u8 fm10k_tx_desc_flags(struct sk_buff *skb, u32 tx_flags)
76a540d4728a379 Alexander Duyck 2014-09-20  880  {
76a540d4728a379 Alexander Duyck 2014-09-20  881  	/* set type for advanced descriptor with frame checksum insertion */
76a540d4728a379 Alexander Duyck 2014-09-20  882  	u32 desc_flags = 0;
76a540d4728a379 Alexander Duyck 2014-09-20  883  
76a540d4728a379 Alexander Duyck 2014-09-20  884  	/* set checksum offload bits */
76a540d4728a379 Alexander Duyck 2014-09-20 @885  	desc_flags |= FM10K_SET_FLAG(tx_flags, FM10K_TX_FLAGS_CSUM,
76a540d4728a379 Alexander Duyck 2014-09-20  886  				     FM10K_TXD_FLAG_CSUM);
76a540d4728a379 Alexander Duyck 2014-09-20  887  
76a540d4728a379 Alexander Duyck 2014-09-20  888  	return desc_flags;
76a540d4728a379 Alexander Duyck 2014-09-20  889  }
76a540d4728a379 Alexander Duyck 2014-09-20  890  

:::::: The code at line 885 was first introduced by commit
:::::: 76a540d4728a379e022fb2e2e8766d502b6d345c fm10k: Add support for netdev offloads

:::::: TO: Alexander Duyck <alexander.h.duyck@intel.com>
:::::: CC: Jeff Kirsher <jeffrey.t.kirsher@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
