Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F023ACA61;
	Thu, 16 Apr 2026 11:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776339410; cv=none; b=r58ttf92kAmRNpArETDFcQd5fIWDdI20fEKmscePBlIJSyjYDOjxcL/DTZjt8p6AlaY0iSzg4Lcda4URGen3IXTk6Hfxn8TSDN8Mj+X3clc6dt98QSeI/SOjw4UvWq35TL//AE23zgv88TWJO/m3AjH6DbuumAbrWrPypgacASo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776339410; c=relaxed/simple;
	bh=beaD3vULJxpkMqHSciyHUC2i7QKGLx7bs21LTgeCJEQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ihZ3cLcT5PxVDJY0E/X+TPabRpiBkuJSJu7waLzkoWQ/fnO1RhaEMkbFj0/3yUa1PLDTDr5q3OKD9lM0LPS9KsRKwVC1HGKHz/+D2cw9dXN0DOYZBI95F/cZCJ54b92CGwdQsfHUfUM3Ac+bFgLErg+t5KKmhF55miKkwW3GR74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YTrlp8AA; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YTrlp8AA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776339408; x=1807875408;
  h=date:from:to:cc:subject:message-id;
  bh=beaD3vULJxpkMqHSciyHUC2i7QKGLx7bs21LTgeCJEQ=;
  b=YTrlp8AAGzNXohOzF3MabkyiSjGmTBWuHfC7Hu9xR+3dDqjZeY5sd4Nl
   FrjBz7dh+KzmXe4Q8bYQtyDUuEJCtzU7f3evN6e5jy8ajx43As2trfUeD
   aOdAW2UmyS/SIpNe8ykFbDYGlxWtkVmbEkgkSIRNfsWYzGq4wE5vjZKcp
   Rgca6V+kE2i2IFMAD0TJb0sNovQEekrZ7vWqX3jmBVcCGwo6SAStzMkdp
   hx6svLjRAO324LhUT2uWQkfJ6dCjRAyILsuPZo0yV1nepfePcDtfm473I
   W68CtttCpabrDs1S7g/RosBzKNAkxQV8W8DbI3XitgeTefYoUFIfVU1+a
   Q==;
X-CSE-ConnectionGUID: 49Ayyy95R5yhvqbW/Io5pg==
X-CSE-MsgGUID: uA5jh2BpQEOIi5tqcI+/wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77408089"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="77408089"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 04:36:46 -0700
X-CSE-ConnectionGUID: fceUqi7lQJikuADQ9tPkCg==
X-CSE-MsgGUID: hqV62LG7QGCHrpxlhMXyyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="225994028"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Apr 2026 04:36:44 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDL1W-000000001X6-0aOt;
	Thu, 16 Apr 2026 11:36:42 +0000
Date: Thu, 16 Apr 2026 19:36:40 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [cilium:pr/bpf-tproxy 8/8]
 include/net/request_sock.h:117:29: error: use of undeclared identifier
 'sock_pfree_cnt'; did you mean 'sock_kfree_s'?
Message-ID: <202604161903.vnGm95M9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/cilium/linux.git pr/bpf-tproxy
head:   df7aabea1249e933d8d0f5caff085026de1cd217
commit: df7aabea1249e933d8d0f5caff085026de1cd217 [8/8] bpf: Support SOCK_RCU_FREE sockets in bpf_sk_assign on egress
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260416/202604161903.vnGm95M9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604161903.vnGm95M9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604161903.vnGm95M9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from init/do_mounts.c:23:
   In file included from include/linux/nfs_fs.h:32:
   In file included from include/linux/sunrpc/clnt.h:29:
   In file included from include/net/ipv6.h:12:
   In file included from include/linux/ipv6.h:103:
   In file included from include/linux/tcp.h:20:
   In file included from include/net/inet_connection_sock.h:21:
   In file included from include/net/inet_sock.h:24:
>> include/net/request_sock.h:117:29: error: use of undeclared identifier 'sock_pfree_cnt'; did you mean 'sock_kfree_s'?
     117 |                               skb->destructor == sock_pfree_cnt;
         |                                                  ^~~~~~~~~~~~~~
         |                                                  sock_kfree_s
   include/net/sock.h:1901:6: note: 'sock_kfree_s' declared here
    1901 | void sock_kfree_s(struct sock *sk, void *mem, int size);
         |      ^
   1 error generated.


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
