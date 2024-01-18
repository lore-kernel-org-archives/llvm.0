Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com [207.171.184.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C282E84E;
	Thu, 18 Jan 2024 21:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.171.184.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705611926; cv=none; b=Cps34a9HZpgOTC1l19kYGv6YXWP9Dw13hXlKh5n4h9fpAyMXydaE9dBZ8gSnsMrh9YZOam7RM8mjSqjMbNGKu2R05rZTY6T+NR7zOyShHzkOfopeU7V2qmXj1WAI+cHvcA9XaBGuxkzzcuczAsSLnl2xxs5hptSlfvuKkJgY9Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705611926; c=relaxed/simple;
	bh=tFJRUiA0tVwkYi1FQlr+WSepoEJuUieDS8eB+sRlVGU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DacrZYxX3aGOnCThYk6Kb3DX6uF0g3ZcvFwBDn19wgpMi96YTiHmfPuULr3GhCSyTGpGwZ7Y61bBGTKgaLfEibMNYO/FXFC4wAzsr0338h+bEJvcmFT7b6s0S+hr+t6SpKHcxnw6aqYFbtWrpXLXtP0FulHCLiCkRZ272B1Q+5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.co.jp; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=qD18p5SP; arc=none smtp.client-ip=207.171.184.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="qD18p5SP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1705611922; x=1737147922;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=68pe+VlC5ubDZY200aT+GsMbLsq2yC21PqJftalEdPo=;
  b=qD18p5SPFtHcGr96vizaYPsfNrc/o2kOq+0NrSDYkglVAm1MRYUtzF4L
   yqkRye/Oi2gATN2mMgZ2BuNOyVekj61FUF1Is30na5OxA5a49tB2s07oj
   KS5D0gcLtSdx6M7iVmGgMHpy+DzKtDjO5vIdjTUvZYLpU4yi/FAX1yFA8
   w=;
X-IronPort-AV: E=Sophos;i="6.05,203,1701129600"; 
   d="scan'208";a="390809184"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO email-inbound-relay-pdx-2a-m6i4x-af372327.us-west-2.amazon.com) ([10.25.36.214])
  by smtp-border-fw-9102.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 21:05:16 +0000
Received: from smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev (pdx2-ws-svc-p26-lb5-vlan2.pdx.amazon.com [10.39.38.66])
	by email-inbound-relay-pdx-2a-m6i4x-af372327.us-west-2.amazon.com (Postfix) with ESMTPS id 75DAF60AAB;
	Thu, 18 Jan 2024 21:05:15 +0000 (UTC)
Received: from EX19MTAUWA002.ant.amazon.com [10.0.21.151:17241]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.24.5:2525] with esmtp (Farcaster)
 id 5426b456-b98b-4e60-b287-dce80d6cd5b9; Thu, 18 Jan 2024 21:05:15 +0000 (UTC)
X-Farcaster-Flow-ID: 5426b456-b98b-4e60-b287-dce80d6cd5b9
Received: from EX19D004ANA001.ant.amazon.com (10.37.240.138) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 18 Jan 2024 21:05:14 +0000
Received: from 88665a182662.ant.amazon.com (10.88.183.204) by
 EX19D004ANA001.ant.amazon.com (10.37.240.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 18 Jan 2024 21:05:12 +0000
From: Kuniyuki Iwashima <kuniyu@amazon.com>
To: <martin.lau@linux.dev>
CC: <kuniyu@amazon.com>, <lkp@intel.com>, <llvm@lists.linux.dev>,
	<martin.lau@kernel.org>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [bpf-next:master 32/36] net/core/filter.c:11842:13: warning: declaration of 'struct bpf_tcp_req_attrs' will not be visible outside of this function
Date: Thu, 18 Jan 2024 13:05:03 -0800
Message-ID: <20240118210503.24167-1-kuniyu@amazon.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <036fb42d-a104-4f4e-a66d-1bc1fe17835e@linux.dev>
References: <036fb42d-a104-4f4e-a66d-1bc1fe17835e@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D033UWC001.ant.amazon.com (10.13.139.218) To
 EX19D004ANA001.ant.amazon.com (10.37.240.138)

From: Martin KaFai Lau <martin.lau@linux.dev>
Date: Thu, 18 Jan 2024 12:43:14 -0800
> On 1/17/24 12:10 PM, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
> > head:   be7c19de9ecf4d93a9908003a1a3b8f1e8f8a672
> > commit: b9c3eca5c086eb65f20ad92fe3aa3d556f23103b [32/36] bpf: tcp: Support arbitrary SYN Cookie.
> > config: i386-randconfig-011-20240117 (https://download.01.org/0day-ci/archive/20240118/202401180418.CUVc0hxF-lkp@intel.com/config)
> > compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401180418.CUVc0hxF-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202401180418.CUVc0hxF-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >>> net/core/filter.c:11842:13: warning: declaration of 'struct bpf_tcp_req_attrs' will not be visible outside of this function [-Wvisibility]
> >      11842 |                                         struct bpf_tcp_req_attrs *attrs, int attrs__sz)
> >            |                                                ^
> >     1 warning generated.
> 
> 
> Hi Kuniyuki,
> 
> This looks different from the other kfunc compiler warnings. Can you take a look?

Probably because I moved #if guard into bpf_sk_assign_tcp_reqsk() but
struct bpf_tcp_req_attrs is defined under #ifdef CONFIG_SYN_COOKIES.

I'll post a fix soon.

Thanks!

> 
> Thanks,
> Martin
> 
> 
> > 
> > 
> > vim +11842 net/core/filter.c
> > 
> >   11840	
> >   11841	__bpf_kfunc int bpf_sk_assign_tcp_reqsk(struct sk_buff *skb, struct sock *sk,
> >   11842						struct bpf_tcp_req_attrs *attrs, int attrs__sz)
> >   11843	{
> >   11844	#if IS_ENABLED(CONFIG_SYN_COOKIES)
> >   11845		const struct request_sock_ops *ops;
> >   11846		struct inet_request_sock *ireq;
> >   11847		struct tcp_request_sock *treq;
> >   11848		struct request_sock *req;
> >   11849		struct net *net;
> >   11850		__u16 min_mss;
> >   11851		u32 tsoff = 0;
> >   11852	
> >   11853		if (attrs__sz != sizeof(*attrs) ||
> >   11854		    attrs->reserved[0] || attrs->reserved[1] || attrs->reserved[2])
> >   11855			return -EINVAL;
> >   11856	
> >   11857		if (!skb_at_tc_ingress(skb))
> >   11858			return -EINVAL;
> >   11859	
> >   11860		net = dev_net(skb->dev);
> >   11861		if (net != sock_net(sk))
> >   11862			return -ENETUNREACH;
> >   11863	
> >   11864		switch (skb->protocol) {
> >   11865		case htons(ETH_P_IP):
> >   11866			ops = &tcp_request_sock_ops;
> >   11867			min_mss = 536;
> >   11868			break;
> >   11869	#if IS_BUILTIN(CONFIG_IPV6)
> >   11870		case htons(ETH_P_IPV6):
> >   11871			ops = &tcp6_request_sock_ops;
> >   11872			min_mss = IPV6_MIN_MTU - 60;
> >   11873			break;
> >   11874	#endif
> >   11875		default:
> >   11876			return -EINVAL;
> >   11877		}
> >   11878	
> >   11879		if (sk->sk_type != SOCK_STREAM || sk->sk_state != TCP_LISTEN ||
> >   11880		    sk_is_mptcp(sk))
> >   11881			return -EINVAL;
> >   11882	
> >   11883		if (attrs->mss < min_mss)
> >   11884			return -EINVAL;
> >   11885	
> >   11886		if (attrs->wscale_ok) {
> >   11887			if (!READ_ONCE(net->ipv4.sysctl_tcp_window_scaling))
> >   11888				return -EINVAL;
> >   11889	
> >   11890			if (attrs->snd_wscale > TCP_MAX_WSCALE ||
> >   11891			    attrs->rcv_wscale > TCP_MAX_WSCALE)
> >   11892				return -EINVAL;
> >   11893		}
> >   11894	
> >   11895		if (attrs->sack_ok && !READ_ONCE(net->ipv4.sysctl_tcp_sack))
> >   11896			return -EINVAL;
> >   11897	
> >   11898		if (attrs->tstamp_ok) {
> >   11899			if (!READ_ONCE(net->ipv4.sysctl_tcp_timestamps))
> >   11900				return -EINVAL;
> >   11901	
> >   11902			tsoff = attrs->rcv_tsecr - tcp_ns_to_ts(attrs->usec_ts_ok, tcp_clock_ns());
> >   11903		}
> >   11904	
> >   11905		req = inet_reqsk_alloc(ops, sk, false);
> >   11906		if (!req)
> >   11907			return -ENOMEM;
> >   11908	
> >   11909		ireq = inet_rsk(req);
> >   11910		treq = tcp_rsk(req);
> >   11911	
> >   11912		req->rsk_listener = sk;
> >   11913		req->syncookie = 1;
> >   11914		req->mss = attrs->mss;
> >   11915		req->ts_recent = attrs->rcv_tsval;
> >   11916	
> >   11917		ireq->snd_wscale = attrs->snd_wscale;
> >   11918		ireq->rcv_wscale = attrs->rcv_wscale;
> >   11919		ireq->tstamp_ok	= !!attrs->tstamp_ok;
> >   11920		ireq->sack_ok = !!attrs->sack_ok;
> >   11921		ireq->wscale_ok = !!attrs->wscale_ok;
> >   11922		ireq->ecn_ok = !!attrs->ecn_ok;
> >   11923	
> >   11924		treq->req_usec_ts = !!attrs->usec_ts_ok;
> >   11925		treq->ts_off = tsoff;
> >   11926	
> >   11927		skb_orphan(skb);
> >   11928		skb->sk = req_to_sk(req);
> >   11929		skb->destructor = sock_pfree;
> >   11930	
> >   11931		return 0;
> >   11932	#else
> >   11933		return -EOPNOTSUPP;
> >   11934	#endif
> >   11935	}
> >   11936	
