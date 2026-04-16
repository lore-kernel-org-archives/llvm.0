Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E1B26560B;
	Thu, 16 Apr 2026 13:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776346858; cv=none; b=C9+9tbRrAXhJGZ5ggORI+NpiGVFq1PdbT/LT6EQmXvRddBpNY6YL5j6y4iiDVLz2BbsIbjvfOrhO3I+7W2MOGL/vUmT5OosVuoGnOjdhPRvvFRidWy2KfdBz+ShthK8mOqEvCDBF80QWbFfLho5z27lJfFZqmHzRFY0rupWRt/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776346858; c=relaxed/simple;
	bh=K8fynYYFKqGwsuWxmtoKj4vb9kpWUvzju4gohEEMQ2A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RraQ8bxRWIu69jPwYnk4mPEx4Y/HTQmkCu6nYOpgu1uRwzswYFkW+pQnW3NVUyV4B0BziXPKqLrv1Fv+pXRQFBVyhIkyK0QjvuNxEoD0O3lhDn1FUcP0fAgLuMSoa8H89TRfAszD4AEmE2DPHIXlnG5ocKoSjbeiF1ZS8cZcEEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DSqK5vt/; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DSqK5vt/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776346857; x=1807882857;
  h=date:from:to:cc:subject:message-id;
  bh=K8fynYYFKqGwsuWxmtoKj4vb9kpWUvzju4gohEEMQ2A=;
  b=DSqK5vt/HH7B3kl3C+CQaQ27GavPF/rEth3QjFC9BOAagFFX1RMb3N6V
   3Kn1EFDL3VMnrvwxVUidCDsKwTyC0f0qwvdgjyw+VIJ+XurPbOljRJTZc
   N9H9+rOiAXUs97tUnHBtcweBbnMSm95CKSfa+FfpF8JvmgHD+5m3bWoON
   dROhV7CIg+mdxMboSF88J03BttYRAHa3LEeS494WNvvhgLpNeTsszY1qh
   oUafYohcT1Aunoavd8acAgBFRpLpI+Z31YzvBQVtEEvvbyf69kWnrfB23
   hb94TrArP/nOf+CctIQ5NB34hHFQlDubEU4vvODJZ5W1s/DeZUO11jUWq
   g==;
X-CSE-ConnectionGUID: Mlu5YQggQfW7/3RQmAx4uA==
X-CSE-MsgGUID: ysYlDQavScKy7zRW2MaJRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="94751498"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="94751498"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 06:40:54 -0700
X-CSE-ConnectionGUID: FdyE6rSHRM6bDwKzJBrYyQ==
X-CSE-MsgGUID: IN6wKpNwTM+IbnNK3qKLVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="253981066"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Apr 2026 06:40:52 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDMxd-000000001dY-42uJ;
	Thu, 16 Apr 2026 13:40:49 +0000
Date: Thu, 16 Apr 2026 21:40:37 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [cilium:pr/bpf-tproxy 8/8]
 include/net/request_sock.h:117:29: error: use of undeclared identifier
 'sock_pfree_ref'; did you mean 'sock_kfree_s'?
Message-ID: <202604162150.YfOOa9lm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/cilium/linux.git pr/bpf-tproxy
head:   27d1eafb8d37f1b272a991077d3bd1bb312118a9
commit: 27d1eafb8d37f1b272a991077d3bd1bb312118a9 [8/8] bpf: Support SOCK_RCU_FREE sockets in bpf_sk_assign on egress
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260416/202604162150.YfOOa9lm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604162150.YfOOa9lm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604162150.YfOOa9lm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from init/do_mounts.c:23:
   In file included from include/linux/nfs_fs.h:32:
   In file included from include/linux/sunrpc/clnt.h:29:
   In file included from include/net/ipv6.h:12:
   In file included from include/linux/ipv6.h:103:
   In file included from include/linux/tcp.h:20:
   In file included from include/net/inet_connection_sock.h:21:
   In file included from include/net/inet_sock.h:24:
>> include/net/request_sock.h:117:29: error: use of undeclared identifier 'sock_pfree_ref'; did you mean 'sock_kfree_s'?
     117 |                               skb->destructor == sock_pfree_ref;
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
 > 117				      skb->destructor == sock_pfree_ref;
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
