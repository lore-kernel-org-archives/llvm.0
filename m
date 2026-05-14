Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8E834B183;
	Thu, 14 May 2026 09:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778749987; cv=none; b=gUWjP+1S7LVV3TPbMBTsvq9bZWz3gj4pbEGKM/KDeWqwMFjkLy5LA0AUk6/QiH9PcX+SQQqF4iaFnVloaDdx1SWukjbZBn4acXaujvClbkXKyN+N3I3V1AWKN1CqNWn4YI6Q931MVLHcqBVE26xjaPMnXX/auZU181XejomnZ74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778749987; c=relaxed/simple;
	bh=J9Te1i/wLFrUhF6kdfpAxdw05WjKxBQMUGiIXj86oGs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Wli1t5bQ4Z/RSEn1VC2hOegYphdz04sQU2hdQi6dGmWQbDeor2NVBNMDwf6c0hCN6S35yowRirBVDQLv4VRYGWIUArIaUHUfOq3OYEkSu7B7KXeGQR+ob2+o+3lCGLh5CHRxGyR6pOFIYZ0CWJPXW5+3b7XF7VLSnXIEu5LvSII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KQn6pWyw; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KQn6pWyw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778749985; x=1810285985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J9Te1i/wLFrUhF6kdfpAxdw05WjKxBQMUGiIXj86oGs=;
  b=KQn6pWywyzmS/YwrQAW/wOrgLDg6bROMoshkRzE27zC6efbJct27PyXZ
   XleNPwODUICsDfv85VfvDE9BvamtYR3JyA0lUBrN2u0LjVpB5SYcs/r+G
   hO4BqPXvWzTtZ/KEFz6x8MqdN5bDz/7lRkrvBnmCgGkZ2hxfAYMSsRLdW
   EjiLjttbEcxgttzGXgqMj8DlifMNeJL6b2KetBlR7Sinzo3A79SEFQ0rx
   nYOGydMKVlH8fMi6+pQUFH3bh+Bs94Jym1ZMjL4olNC1Y386ZcL8vH2lc
   cKnr1rfvNiEO/lzTZG/xU9xHUTWOnYshG2kWSDfAkm2oyUu5vX4Qk7T9v
   g==;
X-CSE-ConnectionGUID: qnbaZGlbT56ywDReBkK1wA==
X-CSE-MsgGUID: JnAk81T9RlyCjNUGi6ggng==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="91150359"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="91150359"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 02:13:05 -0700
X-CSE-ConnectionGUID: 3ZJO0L0hQB+mDvW4reWsIw==
X-CSE-MsgGUID: twGHYTAORhinqErrvTPaYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="243317563"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 May 2026 02:13:03 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNS7o-000000006GR-2wJr;
	Thu, 14 May 2026 09:13:00 +0000
Date: Thu, 14 May 2026 17:12:04 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>,
 "Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen"?= <toke@toke.dk>
Subject: [netdev-net-next:main 114/116] include/net/sock.h:1861:56:
 error: use of undeclared identifier '__sock_wfree'; did you mean
 'sock_wfree'?
Message-ID: <202605141714.4ghTxgEO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git main
head:   18dc8e6d15d7a30888beec46a1e01ca0f98508fa
commit: f0de88303d5e7e04a1224bc7a00512b5a1c4fe7a [114/116] net: make is_skb_wmem() available to modules
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260514/202605141714.4ghTxgEO-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141714.4ghTxgEO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605141714.4ghTxgEO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from init/do_mounts.c:23:
   In file included from include/linux/nfs_fs.h:32:
   In file included from include/linux/sunrpc/clnt.h:29:
   In file included from include/net/ipv6.h:12:
   In file included from include/linux/ipv6.h:103:
   In file included from include/linux/tcp.h:19:
>> include/net/sock.h:1861:56: error: use of undeclared identifier '__sock_wfree'; did you mean 'sock_wfree'?
    1861 |                (IS_ENABLED(CONFIG_INET) && skb->destructor == __sock_wfree) ||
         |                                                               ^~~~~~~~~~~~
         |                                                               sock_wfree
   include/net/sock.h:1853:6: note: 'sock_wfree' declared here
    1853 | void sock_wfree(struct sk_buff *skb);
         |      ^
>> include/net/sock.h:1862:56: error: use of undeclared identifier 'tcp_wfree'; did you mean 'sock_wfree'?
    1862 |                (IS_ENABLED(CONFIG_INET) && skb->destructor == tcp_wfree);
         |                                                               ^~~~~~~~~
         |                                                               sock_wfree
   include/net/sock.h:1853:6: note: 'sock_wfree' declared here
    1853 | void sock_wfree(struct sk_buff *skb);
         |      ^
   2 errors generated.


vim +1861 include/net/sock.h

  1850	
  1851	struct sk_buff *sock_wmalloc(struct sock *sk, unsigned long size, int force,
  1852				     gfp_t priority);
  1853	void sock_wfree(struct sk_buff *skb);
  1854	#ifdef CONFIG_INET
  1855	void __sock_wfree(struct sk_buff *skb);
  1856	void tcp_wfree(struct sk_buff *skb);
  1857	#endif
  1858	static inline bool is_skb_wmem(const struct sk_buff *skb)
  1859	{
  1860		return skb->destructor == sock_wfree ||
> 1861		       (IS_ENABLED(CONFIG_INET) && skb->destructor == __sock_wfree) ||
> 1862		       (IS_ENABLED(CONFIG_INET) && skb->destructor == tcp_wfree);
  1863	}
  1864	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
