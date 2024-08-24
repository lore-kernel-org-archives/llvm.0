Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B8F446CF;
	Sat, 24 Aug 2024 20:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724531417; cv=none; b=CJsyXnetPXD5/q2WiRUnpQdLwTWOuR5CLE4wV174QzcxX/XdgTiLpV0PXt7JkxwPo8+fyH0moc86O7WF5WPz6f283phebWCaLB7BHj071U9MciwVbFIVQl01qAgyDNkB/gykJVNDkweT+arXtS94ZP56HAI0MbTgfcnPtIYl0bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724531417; c=relaxed/simple;
	bh=T/vcE2sVvtU/mXUdiR01tPzOz5j6s3jhgvX6EgsmHyM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ORAjDbow91czTFVdiXpBxaiDWtxkxqN2aH8NzJm48vB5wdXPmNHHFuEsp4h02HAFC36rsD9v0jYHJzd3FgopYSUxUfqKLqz+oajklKU1vZmIj+bNOoonAjTuh+yX3f3nwYz/TmPgffDzzO95nQdX6mHqnyMZOwYIEt1896lPTsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m1DE4e1U; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m1DE4e1U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724531416; x=1756067416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T/vcE2sVvtU/mXUdiR01tPzOz5j6s3jhgvX6EgsmHyM=;
  b=m1DE4e1UxF85aOZK/Oadi8DLz/fUqIBVkxd7psT7ELFklD3kmqHFSVDO
   +BJIsoLvetOmplFXKCo00cvoce/NomcycUsq8ht4jhzo5Pxg+TYtHUvkH
   RartPD9zHyQ5Kpv4Q8yAO7sV2VSItPM3McIoPi9vmjqwDxD8sijuovODg
   49t8zETwTB4El4qYiQtKNwcs2gQBIp+dUkgjW+lPSE1sSemfQr8yMmGTm
   Q5x5KfPPR87ZawiRUzf4jM6HlNLLRSMjz6oJXAOG8JyNVDnvBj3wExE7o
   O1uVh2hgD3vs2Pcbe0deGUA/9U6VX5s106gm35iST9Na10CZbaRkceMDx
   g==;
X-CSE-ConnectionGUID: c6JQJcQPSHWi7w7Dcnbi6w==
X-CSE-MsgGUID: iMuomOvRTzGCRU5+k6e01g==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="40500113"
X-IronPort-AV: E=Sophos;i="6.10,174,1719903600"; 
   d="scan'208";a="40500113"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2024 13:30:16 -0700
X-CSE-ConnectionGUID: gQm6J1WHSnaEk/mvyeWq5A==
X-CSE-MsgGUID: N6QygZUGRwyqwkyD5xlV1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,174,1719903600"; 
   d="scan'208";a="66320456"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Aug 2024 13:30:14 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shxOm-000EjP-0u;
	Sat, 24 Aug 2024 20:30:12 +0000
Date: Sun, 25 Aug 2024 04:30:04 +0800
From: kernel test robot <lkp@intel.com>
To: Cong Wang <cong.wang@bytedance.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [congwang:net-next 7/7] drivers/net/gtp.c:1684:1: warning: unused
 label 'out_rel_sock'
Message-ID: <202408250446.zDtBQu8x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/congwang/linux.git net-next
head:   838946abe3f368da7b47c1af57777bc172657cf8
commit: 838946abe3f368da7b47c1af57777bc172657cf8 [7/7] l2tp: refactor setup_udp_tunnel_sock()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240825/202408250446.zDtBQu8x-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240825/202408250446.zDtBQu8x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408250446.zDtBQu8x-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/gtp.c:1684:1: warning: unused label 'out_rel_sock' [-Wunused-label]
    1684 | out_rel_sock:
         | ^~~~~~~~~~~~~
   1 warning generated.


vim +/out_rel_sock +1684 drivers/net/gtp.c

459aa660eb1d8c Pablo Neira       2016-05-09  1642  
49ecc587dca275 Jonas Bonn        2021-02-03  1643  static struct sock *gtp_encap_enable_socket(int fd, int type,
1e3a3abd8b28cf Andreas Schultz   2017-03-09  1644  					    struct gtp_dev *gtp)
459aa660eb1d8c Pablo Neira       2016-05-09  1645  {
459aa660eb1d8c Pablo Neira       2016-05-09  1646  	struct udp_tunnel_sock_cfg tuncfg = {NULL};
49ecc587dca275 Jonas Bonn        2021-02-03  1647  	struct socket *sock;
1e3a3abd8b28cf Andreas Schultz   2017-03-09  1648  	struct sock *sk;
49ecc587dca275 Jonas Bonn        2021-02-03  1649  	int err;
49ecc587dca275 Jonas Bonn        2021-02-03  1650  
49ecc587dca275 Jonas Bonn        2021-02-03  1651  	pr_debug("enable gtp on %d, %d\n", fd, type);
49ecc587dca275 Jonas Bonn        2021-02-03  1652  
49ecc587dca275 Jonas Bonn        2021-02-03  1653  	sock = sockfd_lookup(fd, &err);
49ecc587dca275 Jonas Bonn        2021-02-03  1654  	if (!sock) {
49ecc587dca275 Jonas Bonn        2021-02-03  1655  		pr_debug("gtp socket fd=%d not found\n", fd);
49ecc587dca275 Jonas Bonn        2021-02-03  1656  		return NULL;
49ecc587dca275 Jonas Bonn        2021-02-03  1657  	}
459aa660eb1d8c Pablo Neira       2016-05-09  1658  
940ba14986657a Eric Dumazet      2020-01-21  1659  	sk = sock->sk;
940ba14986657a Eric Dumazet      2020-01-21  1660  	if (sk->sk_protocol != IPPROTO_UDP ||
940ba14986657a Eric Dumazet      2020-01-21  1661  	    sk->sk_type != SOCK_DGRAM ||
940ba14986657a Eric Dumazet      2020-01-21  1662  	    (sk->sk_family != AF_INET && sk->sk_family != AF_INET6)) {
49ecc587dca275 Jonas Bonn        2021-02-03  1663  		pr_debug("socket fd=%d not UDP\n", fd);
49ecc587dca275 Jonas Bonn        2021-02-03  1664  		sk = ERR_PTR(-EINVAL);
49ecc587dca275 Jonas Bonn        2021-02-03  1665  		goto out_sock;
459aa660eb1d8c Pablo Neira       2016-05-09  1666  	}
459aa660eb1d8c Pablo Neira       2016-05-09  1667  
999cb275c807b9 Pablo Neira Ayuso 2024-05-07  1668  	if (sk->sk_family == AF_INET6 &&
999cb275c807b9 Pablo Neira Ayuso 2024-05-07  1669  	    !sk->sk_ipv6only) {
999cb275c807b9 Pablo Neira Ayuso 2024-05-07  1670  		sk = ERR_PTR(-EADDRNOTAVAIL);
999cb275c807b9 Pablo Neira Ayuso 2024-05-07  1671  		goto out_sock;
999cb275c807b9 Pablo Neira Ayuso 2024-05-07  1672  	}
999cb275c807b9 Pablo Neira Ayuso 2024-05-07  1673  
940ba14986657a Eric Dumazet      2020-01-21  1674  	lock_sock(sk);
459aa660eb1d8c Pablo Neira       2016-05-09  1675  
459aa660eb1d8c Pablo Neira       2016-05-09  1676  	tuncfg.sk_user_data = gtp;
1e3a3abd8b28cf Andreas Schultz   2017-03-09  1677  	tuncfg.encap_type = type;
459aa660eb1d8c Pablo Neira       2016-05-09  1678  	tuncfg.encap_rcv = gtp_encap_recv;
459aa660eb1d8c Pablo Neira       2016-05-09  1679  	tuncfg.encap_destroy = gtp_encap_destroy;
838946abe3f368 Cong Wang         2024-08-23  1680  	if (setup_udp_tunnel_sock(sock_net(sock->sk), sock, &tuncfg))
838946abe3f368 Cong Wang         2024-08-23  1681  		sk = ERR_PTR(-EBUSY);
838946abe3f368 Cong Wang         2024-08-23  1682  	else
838946abe3f368 Cong Wang         2024-08-23  1683  		sock_hold(sk);
49ecc587dca275 Jonas Bonn        2021-02-03 @1684  out_rel_sock:
49ecc587dca275 Jonas Bonn        2021-02-03  1685  	release_sock(sock->sk);
49ecc587dca275 Jonas Bonn        2021-02-03  1686  out_sock:
1e3a3abd8b28cf Andreas Schultz   2017-03-09  1687  	sockfd_put(sock);
49ecc587dca275 Jonas Bonn        2021-02-03  1688  	return sk;
1e3a3abd8b28cf Andreas Schultz   2017-03-09  1689  }
459aa660eb1d8c Pablo Neira       2016-05-09  1690  

:::::: The code at line 1684 was first introduced by commit
:::::: 49ecc587dca2754571791bebd36e9e36e2a0d973 Revert "GTP: add support for flow based tunneling API"

:::::: TO: Jonas Bonn <jonas@norrbonn.se>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
