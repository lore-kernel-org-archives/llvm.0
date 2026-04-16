Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD783939D9;
	Thu, 16 Apr 2026 11:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776340730; cv=none; b=M3C5NXwnvVa7mjMD8VKCVRIUVOr9dXZijDQGV1/QApV8UoC9EOAc0uvsqcaVHm55dH7alMF36jCA7RDm1tlFJLKHOWhvUuLLtv/VqcRtyxphESfer7gxXurbdrrIc1oykjVbO2a0IlZPh/N+7poYi0CzYiQQCFQAe7nnfMjzwvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776340730; c=relaxed/simple;
	bh=OmtF2gMiSBhisvxYRuoo/ZSFSR0ExmHQNX9hbD1Yb7I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BDzpeynTKoGhiwzQeFBCxvI3Ts3GClTwniA09lEi/9CUZYAOTRFNSyeBr/tNsv0wT5brRlr2D271yTgSIeS/HM2uC8GmUfrqixTAOVv3uD0f9GKqn+ps0FVwAEQXGMth6icCCBhQyLt0BUXG1pjSVrsspNr4h39s0impF/thIgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cPm+Oj3P; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cPm+Oj3P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776340727; x=1807876727;
  h=date:from:to:cc:subject:message-id;
  bh=OmtF2gMiSBhisvxYRuoo/ZSFSR0ExmHQNX9hbD1Yb7I=;
  b=cPm+Oj3PjKB3xcRhIR/0x3I0ghnjbwtgKhnIyIFBGcdJYEwH2sQBT8+C
   M8RhyHPLCp+vdBHUoRdnkzFb9LBR3h5dmFC5DhBHADx4MfP0pWAPSn5RY
   D9mBH0oAeo2Ok3VmJbewvJOSfdAeBoYtordMI3DapCAOfh2BA4sLStWIm
   dYuRpCyQvEd2JO8v5pYAdcdr4hgA7GJZdrHJnTAeQ6SweVL7W64EtXZiI
   V8Aai+wruU9MiD7F0OAudsRMct8SpxSQRCfhHnTflwqZ6RYa1xaJ0yvgo
   ihXplJoqRiucJDhfE/6WJ1dEfCIUstCkKDyACGOhad+yEOdtYZE9o95i7
   Q==;
X-CSE-ConnectionGUID: 1i+sRhrXS0+NFGb/UJxosw==
X-CSE-MsgGUID: ztcv98RKSrGPcSek+cSYtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="94904186"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="94904186"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 04:58:46 -0700
X-CSE-ConnectionGUID: V2fHd0uTSEqjEJc0kkIKyA==
X-CSE-MsgGUID: 9S1tpvSETgmR5NRlIFVPEg==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="234728189"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Apr 2026 04:58:45 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDLMp-000000001Y2-0VOE;
	Thu, 16 Apr 2026 11:58:43 +0000
Date: Thu, 16 Apr 2026 19:57:43 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [cilium:pr/bpf-tproxy 8/8]
 include/net/request_sock.h:117:26: warning: comparison of distinct pointer
 types ('void (*)(struct sk_buff *)' and 'void (*)(struct sock *, void *,
 int)')
Message-ID: <202604161920.Uz2i97b3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/cilium/linux.git pr/bpf-tproxy
head:   27d1eafb8d37f1b272a991077d3bd1bb312118a9
commit: df7aabea1249e933d8d0f5caff085026de1cd217 [8/8] bpf: Support SOCK_RCU_FREE sockets in bpf_sk_assign on egress
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260416/202604161920.Uz2i97b3-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604161920.Uz2i97b3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604161920.Uz2i97b3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from init/do_mounts.c:23:
   In file included from include/linux/nfs_fs.h:32:
   In file included from include/linux/sunrpc/clnt.h:29:
   In file included from include/net/ipv6.h:12:
   In file included from include/linux/ipv6.h:103:
   In file included from include/linux/tcp.h:20:
   In file included from include/net/inet_connection_sock.h:21:
   In file included from include/net/inet_sock.h:24:
   include/net/request_sock.h:117:29: error: use of undeclared identifier 'sock_pfree_cnt'; did you mean 'sock_kfree_s'?
     117 |                               skb->destructor == sock_pfree_cnt;
         |                                                  ^~~~~~~~~~~~~~
         |                                                  sock_kfree_s
   include/net/sock.h:1901:6: note: 'sock_kfree_s' declared here
    1901 | void sock_kfree_s(struct sock *sk, void *mem, int size);
         |      ^
   In file included from init/do_mounts.c:23:
   In file included from include/linux/nfs_fs.h:32:
   In file included from include/linux/sunrpc/clnt.h:29:
   In file included from include/net/ipv6.h:12:
   In file included from include/linux/ipv6.h:103:
   In file included from include/linux/tcp.h:20:
   In file included from include/net/inet_connection_sock.h:21:
   In file included from include/net/inet_sock.h:24:
>> include/net/request_sock.h:117:26: warning: comparison of distinct pointer types ('void (*)(struct sk_buff *)' and 'void (*)(struct sock *, void *, int)') [-Wcompare-distinct-pointer-types]
     117 |                               skb->destructor == sock_pfree_cnt;
         |                               ~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +117 include/net/request_sock.h

    86	
    87	/**
    88	 * skb_steal_sock - steal a socket from an sk_buff
    89	 * @skb: sk_buff to steal the socket from
    90	 * @refcounted: is set to true if the socket is reference-counted
    91	 * @prefetched: is set to true if the socket was assigned from bpf
    92	 */
    93	static inline struct sock *skb_steal_sock(struct sk_buff *skb,
    94						  bool *refcounted, bool *prefetched)
    95	{
    96		struct sock *sk = skb->sk;
    97	
    98		if (!sk) {
    99			*prefetched = false;
   100			*refcounted = false;
   101			return NULL;
   102		}
   103	
   104		*prefetched = skb_sk_is_prefetched(skb);
   105		if (*prefetched) {
   106	#if IS_ENABLED(CONFIG_SYN_COOKIES)
   107			if (sk->sk_state == TCP_NEW_SYN_RECV && inet_reqsk(sk)->syncookie) {
   108				struct request_sock *req = inet_reqsk(sk);
   109	
   110				*refcounted = false;
   111				sk = req->rsk_listener;
   112				req->rsk_listener = NULL;
   113				return sk;
   114			}
   115	#endif
   116			*refcounted = sk_is_refcounted(sk) ||
 > 117				      skb->destructor == sock_pfree_cnt;
   118		} else {
   119			*refcounted = true;
   120		}
   121	
   122		skb->destructor = NULL;
   123		skb->sk = NULL;
   124		return sk;
   125	}
   126	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
