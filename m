Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE3579945;
	Fri, 10 May 2024 10:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715337906; cv=none; b=mySNobIrecyv7o9UcgB4GA8dJgw19Meto5LW+XQl0u0es+xGM6crpEoyKpwoa58tmlCE6p+6zgeVtPUGzEWMNKQwn8rY75sTB2TXQrYXIZNqqihzbTfq9ip9SkZviXKu4JCvBIjfkgH2+C/x7sE+olrT8H6o0f+T57qErHEkTh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715337906; c=relaxed/simple;
	bh=T7ZtC+vGMyQ/+wuI6ftBVsMeg0ZlzMnIPWP5N3+ZoFE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bvw4Z7GfimNjGcZpf7TAK1CaQziUeRcfur5OLGpxwWsciOpmB9FVxxcCH6gike+ojFdHVC94H3J7qcN1LNYyuAKSj/J/1z/ANlNwWzhQSzUC1UJ8b/ctCdinmMV/6okRUoZ0JIPPYA9bdOaiVGXuhJNEi2ScTaU2qvLJh6r8BxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LYJ9Qp8B; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LYJ9Qp8B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715337904; x=1746873904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T7ZtC+vGMyQ/+wuI6ftBVsMeg0ZlzMnIPWP5N3+ZoFE=;
  b=LYJ9Qp8BOdFKu1dwfKGwjh6FY32K8J/PxMFRBciYv935zynT9oIJBhs6
   RRcm9/YtyOlRynAv4FSjYsuAA5WeRYg98W9RqXBe47BfjRBElj9rR27Vh
   OL/I6KVQ0Qu63gnmqHIHsYOOS28nKPpv6SvWzQyg6LrZ30dwh0uSNHEi5
   zpil9e9i35dSGxPaK5sAIL9heCH7GCwTLbvZo3ZIX/2DkZ6dQCO2ujqux
   JGjYint6f2I6mbkZo1QKW+YFmgvg936CZ/ss9QLDGTCW3FS3+A65P/or9
   y+VebsHfXgV/ZPLmZ5QtP0hhj7WBkuyoU/EE4rEm/oMdwcX7pX5c+026S
   A==;
X-CSE-ConnectionGUID: oxOeIH5xQMCbnSwQMaxyZQ==
X-CSE-MsgGUID: +mS2cYDZQAacYkDmd1na2Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="33822830"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="33822830"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 03:45:03 -0700
X-CSE-ConnectionGUID: FaP6gwTqQm+Kh4Gkfg/5sA==
X-CSE-MsgGUID: s0eqluv6QDyP6OpIu25kNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="29683496"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 May 2024 03:45:02 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5NkJ-00060d-2l;
	Fri, 10 May 2024 10:44:59 +0000
Date: Fri, 10 May 2024 18:44:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:net-accept-more 3/6] net/mptcp/protocol.c:3902:10:
 warning: variable 'err' is uninitialized when used here
Message-ID: <202405101828.RbNqkFlt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jens,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git net-accept-more
head:   3b4f987e70b3ba8a6da0a425daf61c9cac61f55d
commit: 11129a54ba83064e7ba3157cb5d12febfdf813df [3/6] net: change proto and proto_ops accept type
config: powerpc-canyonlands_defconfig (https://download.01.org/0day-ci/archive/20240510/202405101828.RbNqkFlt-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project b910bebc300dafb30569cecc3017b446ea8eafa0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405101828.RbNqkFlt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405101828.RbNqkFlt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/mptcp/protocol.c:11:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/powerpc/include/asm/cacheflush.h:7:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> net/mptcp/protocol.c:3902:10: warning: variable 'err' is uninitialized when used here [-Wuninitialized]
    3902 |                 return err;
         |                        ^~~
   net/mptcp/protocol.c:3888:9: note: initialize the variable 'err' to silence this warning
    3888 |         int err;
         |                ^
         |                 = 0
   2 warnings generated.


vim +/err +3902 net/mptcp/protocol.c

2303f994b3e187 Peter Krystad  2020-01-21  3882  
cf7da0d66cc1a2 Peter Krystad  2020-01-21  3883  static int mptcp_stream_accept(struct socket *sock, struct socket *newsock,
11129a54ba8306 Jens Axboe     2024-05-09  3884  			       struct proto_accept_arg *arg)
cf7da0d66cc1a2 Peter Krystad  2020-01-21  3885  {
cf7da0d66cc1a2 Peter Krystad  2020-01-21  3886  	struct mptcp_sock *msk = mptcp_sk(sock->sk);
1f6610b92ac3c4 Paolo Abeni    2023-08-11  3887  	struct sock *ssk, *newsk;
cf7da0d66cc1a2 Peter Krystad  2020-01-21  3888  	int err;
cf7da0d66cc1a2 Peter Krystad  2020-01-21  3889  
cf7da0d66cc1a2 Peter Krystad  2020-01-21  3890  	pr_debug("msk=%p", msk);
cf7da0d66cc1a2 Peter Krystad  2020-01-21  3891  
5b825727d0871b Paolo Abeni    2023-05-31  3892  	/* Buggy applications can call accept on socket states other then LISTEN
61761231695309 Paolo Abeni    2023-04-14  3893  	 * but no need to allocate the first subflow just to error out.
61761231695309 Paolo Abeni    2023-04-14  3894  	 */
1f6610b92ac3c4 Paolo Abeni    2023-08-11  3895  	ssk = READ_ONCE(msk->first);
1f6610b92ac3c4 Paolo Abeni    2023-08-11  3896  	if (!ssk)
71ba088ce0aa87 Paolo Abeni    2022-01-06  3897  		return -EINVAL;
cf7da0d66cc1a2 Peter Krystad  2020-01-21  3898  
8e2b8a9fa51270 Davide Caratti 2023-12-19  3899  	pr_debug("ssk=%p, listener=%p", ssk, mptcp_subflow_ctx(ssk));
11129a54ba8306 Jens Axboe     2024-05-09  3900  	newsk = inet_csk_accept(ssk, arg);
e76c8ef5cc5b77 Paolo Abeni    2023-05-17  3901  	if (!newsk)
e76c8ef5cc5b77 Paolo Abeni    2023-05-17 @3902  		return err;
e76c8ef5cc5b77 Paolo Abeni    2023-05-17  3903  
8e2b8a9fa51270 Davide Caratti 2023-12-19  3904  	pr_debug("newsk=%p, subflow is mptcp=%d", newsk, sk_is_mptcp(newsk));
8e2b8a9fa51270 Davide Caratti 2023-12-19  3905  	if (sk_is_mptcp(newsk)) {
8e2b8a9fa51270 Davide Caratti 2023-12-19  3906  		struct mptcp_subflow_context *subflow;
8e2b8a9fa51270 Davide Caratti 2023-12-19  3907  		struct sock *new_mptcp_sock;
e76c8ef5cc5b77 Paolo Abeni    2023-05-17  3908  
8e2b8a9fa51270 Davide Caratti 2023-12-19  3909  		subflow = mptcp_subflow_ctx(newsk);
8e2b8a9fa51270 Davide Caratti 2023-12-19  3910  		new_mptcp_sock = subflow->conn;
8e2b8a9fa51270 Davide Caratti 2023-12-19  3911  
8e2b8a9fa51270 Davide Caratti 2023-12-19  3912  		/* is_mptcp should be false if subflow->conn is missing, see
8e2b8a9fa51270 Davide Caratti 2023-12-19  3913  		 * subflow_syn_recv_sock()
8e2b8a9fa51270 Davide Caratti 2023-12-19  3914  		 */
8e2b8a9fa51270 Davide Caratti 2023-12-19  3915  		if (WARN_ON_ONCE(!new_mptcp_sock)) {
8e2b8a9fa51270 Davide Caratti 2023-12-19  3916  			tcp_sk(newsk)->is_mptcp = 0;
8e2b8a9fa51270 Davide Caratti 2023-12-19  3917  			goto tcpfallback;
8e2b8a9fa51270 Davide Caratti 2023-12-19  3918  		}
8e2b8a9fa51270 Davide Caratti 2023-12-19  3919  
8e2b8a9fa51270 Davide Caratti 2023-12-19  3920  		newsk = new_mptcp_sock;
8e2b8a9fa51270 Davide Caratti 2023-12-19  3921  		MPTCP_INC_STATS(sock_net(ssk), MPTCP_MIB_MPCAPABLEPASSIVEACK);
8e2b8a9fa51270 Davide Caratti 2023-12-19  3922  
11129a54ba8306 Jens Axboe     2024-05-09  3923  		newsk->sk_kern_sock = arg->kern;
8e2b8a9fa51270 Davide Caratti 2023-12-19  3924  		lock_sock(newsk);
e76c8ef5cc5b77 Paolo Abeni    2023-05-17  3925  		__inet_accept(sock, newsock, newsk);
0397c6d85f9c6f Paolo Abeni    2020-11-19  3926  
a5ef058dc4d9a3 Paolo Abeni    2022-10-20  3927  		set_bit(SOCK_CUSTOM_SOCKOPT, &newsock->flags);
8e2b8a9fa51270 Davide Caratti 2023-12-19  3928  		msk = mptcp_sk(newsk);
b6985b9b82954c Paolo Abeni    2023-03-09  3929  		msk->in_accept_queue = 0;
a5ef058dc4d9a3 Paolo Abeni    2022-10-20  3930  
cf7da0d66cc1a2 Peter Krystad  2020-01-21  3931  		/* set ssk->sk_socket of accept()ed flows to mptcp socket.
cf7da0d66cc1a2 Peter Krystad  2020-01-21  3932  		 * This is needed so NOSPACE flag can be set from tcp stack.
cf7da0d66cc1a2 Peter Krystad  2020-01-21  3933  		 */
190f8b060ee38f Geliang Tang   2020-08-03  3934  		mptcp_for_each_subflow(msk, subflow) {
cf7da0d66cc1a2 Peter Krystad  2020-01-21  3935  			struct sock *ssk = mptcp_subflow_tcp_sock(subflow);
cf7da0d66cc1a2 Peter Krystad  2020-01-21  3936  
cf7da0d66cc1a2 Peter Krystad  2020-01-21  3937  			if (!ssk->sk_socket)
cf7da0d66cc1a2 Peter Krystad  2020-01-21  3938  				mptcp_sock_graft(ssk, newsock);
cf7da0d66cc1a2 Peter Krystad  2020-01-21  3939  		}
63740448a32eb6 Paolo Abeni    2023-04-17  3940  
63740448a32eb6 Paolo Abeni    2023-04-17  3941  		/* Do late cleanup for the first subflow as necessary. Also
63740448a32eb6 Paolo Abeni    2023-04-17  3942  		 * deal with bad peers not doing a complete shutdown.
63740448a32eb6 Paolo Abeni    2023-04-17  3943  		 */
39880bd808ad2d Paolo Abeni    2023-08-11  3944  		if (unlikely(inet_sk_state_load(msk->first) == TCP_CLOSE)) {
63740448a32eb6 Paolo Abeni    2023-04-17  3945  			__mptcp_close_ssk(newsk, msk->first,
63740448a32eb6 Paolo Abeni    2023-04-17  3946  					  mptcp_subflow_ctx(msk->first), 0);
39880bd808ad2d Paolo Abeni    2023-08-11  3947  			if (unlikely(list_is_singular(&msk->conn_list)))
c693a851642990 Geliang Tang   2023-12-22  3948  				mptcp_set_state(newsk, TCP_CLOSE);
63740448a32eb6 Paolo Abeni    2023-04-17  3949  		}
8e2b8a9fa51270 Davide Caratti 2023-12-19  3950  	} else {
8e2b8a9fa51270 Davide Caratti 2023-12-19  3951  tcpfallback:
11129a54ba8306 Jens Axboe     2024-05-09  3952  		newsk->sk_kern_sock = arg->kern;
8e2b8a9fa51270 Davide Caratti 2023-12-19  3953  		lock_sock(newsk);
8e2b8a9fa51270 Davide Caratti 2023-12-19  3954  		__inet_accept(sock, newsock, newsk);
8e2b8a9fa51270 Davide Caratti 2023-12-19  3955  		/* we are being invoked after accepting a non-mp-capable
8e2b8a9fa51270 Davide Caratti 2023-12-19  3956  		 * flow: sk is a tcp_sk, not an mptcp one.
8e2b8a9fa51270 Davide Caratti 2023-12-19  3957  		 *
8e2b8a9fa51270 Davide Caratti 2023-12-19  3958  		 * Hand the socket over to tcp so all further socket ops
8e2b8a9fa51270 Davide Caratti 2023-12-19  3959  		 * bypass mptcp.
8e2b8a9fa51270 Davide Caratti 2023-12-19  3960  		 */
8e2b8a9fa51270 Davide Caratti 2023-12-19  3961  		WRITE_ONCE(newsock->sk->sk_socket->ops,
8e2b8a9fa51270 Davide Caratti 2023-12-19  3962  			   mptcp_fallback_tcp_ops(newsock->sk));
cf7da0d66cc1a2 Peter Krystad  2020-01-21  3963  	}
e76c8ef5cc5b77 Paolo Abeni    2023-05-17  3964  	release_sock(newsk);
cf7da0d66cc1a2 Peter Krystad  2020-01-21  3965  
e76c8ef5cc5b77 Paolo Abeni    2023-05-17  3966  	return 0;
cf7da0d66cc1a2 Peter Krystad  2020-01-21  3967  }
cf7da0d66cc1a2 Peter Krystad  2020-01-21  3968  

:::::: The code at line 3902 was first introduced by commit
:::::: e76c8ef5cc5b77debe711717f61a3fbf24904873 mptcp: refactor mptcp_stream_accept()

:::::: TO: Paolo Abeni <pabeni@redhat.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
