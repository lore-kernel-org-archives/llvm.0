Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0B82417D9;
	Sat,  6 Jun 2026 16:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780761949; cv=none; b=i9Ln6YFqYI0Qh3KYIKMcgCCdLtHgKPmaxSHPXmCzsyxZOtNMMHT0rIq0VsULPpCFg7nDoARwIJYhLQ25ORtfCuOBArtWhQxRk/Xqom+nj7SyBaIFMDOSf4lF9nDKc/CgB3ddUCrRAb9wUsANFs2EwQIYqGLIjiWEQFyg00WhWCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780761949; c=relaxed/simple;
	bh=qck3VGwtanayo+mzSiuespD4+SxqXf05q/sUV1W5FDI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sD5tliPPl+Mi+vm/gN2i8/BF/o6/qUAfeQowm/TrHHr/UPKbGnZDw8UuQhdwEHt+A7Cy5Hd2rh3t0U5O8KfhObRGwrL4ek3t2XMepQJRo4PJBumhgr+JQvcBghk/LXeYE4i6PqpegDH42LYGPd5lfr0NhZ9/z/jgiPkNBE/ehRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mXVCzWRs; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mXVCzWRs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780761948; x=1812297948;
  h=date:from:to:cc:subject:message-id;
  bh=qck3VGwtanayo+mzSiuespD4+SxqXf05q/sUV1W5FDI=;
  b=mXVCzWRs6ihi/0tt8wkHGAevD/W9XDj3pAzES6dE/NmUtBfFRm4UxZvB
   9ZS4zVWZeBDtgaNaVJFRRHS1wPnQkIlbRk6PkOT81/RjL8I6v2k5KVpH0
   GeyJoXLnSCmm+UUSLFTOuZhYESH4348OjdOOdxcRsKs4JvxzT1608fIEU
   xOZrREKPkvKnuFh4MYssCbgpEzoZ/plufVdKRqw0sA3xjTpqggk/FZU9q
   7SdKqMKsvBJ0PwES4oF28vBYldyLqXc8I4kG7IlqkbQ5WChCWsm8rOGTJ
   YYULzxxWQzPd81HoTL/Jn0TtLY6N4Ma8TUOfqh3IU9FmAhIc9mipsJ5gb
   Q==;
X-CSE-ConnectionGUID: VSvnARfXRe6hvjoHrvsbhg==
X-CSE-MsgGUID: JNAU2kXmQCCSjlQGk5cWkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11809"; a="107004331"
X-IronPort-AV: E=Sophos;i="6.24,191,1774335600"; 
   d="scan'208";a="107004331"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2026 09:05:47 -0700
X-CSE-ConnectionGUID: tlzF6OdARY+GnvTnmpHJxA==
X-CSE-MsgGUID: 0TmvJCo6Q76j7Kqnb/K+oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,191,1774335600"; 
   d="scan'208";a="269058660"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Jun 2026 09:05:46 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVtWp-00000000H8Y-1GmC;
	Sat, 06 Jun 2026 16:05:43 +0000
Date: Sun, 07 Jun 2026 00:04:51 +0800
From: kernel test robot <lkp@intel.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>
Subject: [linux-next:master 10754/11755] drivers/net/geneve.c:778:12:
 error: no member named 'local_ip6' in 'struct udp_port_cfg'
Message-ID: <202606070019.yx2LhZPU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6e845bcb78c95af935094040bd4edc3c2b6dd784
commit: afabbb56a7262979a75259e2710019aa8ced3e8a [10754/11755] geneve: Introduce IFLA_GENEVE_LOCAL and IFLA_GENEVE_LOCAL6.
config: hexagon-randconfig-001-20260606 (https://download.01.org/0day-ci/archive/20260607/202606070019.yx2LhZPU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260607/202606070019.yx2LhZPU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606070019.yx2LhZPU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/geneve.c:778:12: error: no member named 'local_ip6' in 'struct udp_port_cfg'
     778 |                 udp_conf.local_ip6 = info->key.u.ipv6.src;
         |                 ~~~~~~~~ ^
   1 error generated.


vim +778 drivers/net/geneve.c

   763	
   764	static struct sock *geneve_create_sock(struct net *net,
   765					       struct geneve_dev *geneve, bool ipv6)
   766	{
   767		struct ip_tunnel_info *info = &geneve->cfg.info;
   768		struct udp_port_cfg udp_conf;
   769		struct socket *sock;
   770		int err;
   771	
   772		memset(&udp_conf, 0, sizeof(udp_conf));
   773	
   774		if (ipv6) {
   775			udp_conf.family = AF_INET6;
   776			udp_conf.ipv6_v6only = 1;
   777			udp_conf.use_udp6_rx_checksums = geneve->cfg.use_udp6_rx_checksums;
 > 778			udp_conf.local_ip6 = info->key.u.ipv6.src;
   779		} else {
   780			udp_conf.family = AF_INET;
   781			udp_conf.local_ip.s_addr = info->key.u.ipv4.src;
   782		}
   783	
   784		udp_conf.local_udp_port = info->key.tp_dst;
   785	
   786		/* Open UDP socket */
   787		err = udp_sock_create(net, &udp_conf, &sock);
   788		if (err < 0)
   789			return ERR_PTR(err);
   790	
   791		udp_allow_gso(sock->sk);
   792		return sock->sk;
   793	}
   794	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
