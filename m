Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D542E836
	for <llvm@lists.linux.dev>; Thu, 18 Jan 2024 20:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705610604; cv=none; b=M/fHnigLlHD82KS3WzF6heWl0bDZHXFQmx2XwQSl9HkoOB/oihhV5Q7ZEOQski2qBnXcwhzcFfBbW01p9doFnpOCq0yrPXtsTYancktL9LTxI0eNhm8aO+318WRlpZOGfQjjPZxlNnFIKUtG9Q6et0vSKu6sj3n8WgwScmGZJ/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705610604; c=relaxed/simple;
	bh=si1Ui22ll5G3lFse8vth01kcs8pZT/4Keb7YoTaw4FU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OWEMSducdm4ATY+QAU/43FZ3BwKuHPfJMUg/BFPDnkTG2ustX000XGHJkX2CdROecpYTO70TuKcyjAHQc/pTu3G0W0fTEN/+gmXXOP0VuZ6bIyY/H68gQXUlB+883Z9KRevQQQiBvkePXaeQpOlSGMRP+YT3x+DwKzktWTOLCiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ScCGN2u+; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ScCGN2u+"
Message-ID: <036fb42d-a104-4f4e-a66d-1bc1fe17835e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1705610600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7coExLm/dMM5fu/UmGFQt9I4AbmJQqAbogUfxuBo2jk=;
	b=ScCGN2u+rK/Y6mv0kaKuWfLrMkrwTBACU5/LSob9eyAS5NqcC+g0yx7DiPU+x6vGjKiO+n
	KEzD4NAjyNtQyeu/LHcsQZ3zeb2lc/D+RFsWPEkJfUDvDSTFcn+qcD6yis077i50XnSyr/
	Q/wFZHpyNM+sna840DTUppeU38063cU=
Date: Thu, 18 Jan 2024 12:43:14 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [bpf-next:master 32/36] net/core/filter.c:11842:13: warning:
 declaration of 'struct bpf_tcp_req_attrs' will not be visible outside of this
 function
Content-Language: en-US
To: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Martin KaFai Lau <martin.lau@kernel.org>, kernel test robot <lkp@intel.com>
References: <202401180418.CUVc0hxF-lkp@intel.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Martin KaFai Lau <martin.lau@linux.dev>
In-Reply-To: <202401180418.CUVc0hxF-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 1/17/24 12:10 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
> head:   be7c19de9ecf4d93a9908003a1a3b8f1e8f8a672
> commit: b9c3eca5c086eb65f20ad92fe3aa3d556f23103b [32/36] bpf: tcp: Support arbitrary SYN Cookie.
> config: i386-randconfig-011-20240117 (https://download.01.org/0day-ci/archive/20240118/202401180418.CUVc0hxF-lkp@intel.com/config)
> compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401180418.CUVc0hxF-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401180418.CUVc0hxF-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> net/core/filter.c:11842:13: warning: declaration of 'struct bpf_tcp_req_attrs' will not be visible outside of this function [-Wvisibility]
>      11842 |                                         struct bpf_tcp_req_attrs *attrs, int attrs__sz)
>            |                                                ^
>     1 warning generated.


Hi Kuniyuki,

This looks different from the other kfunc compiler warnings. Can you take a look?

Thanks,
Martin


> 
> 
> vim +11842 net/core/filter.c
> 
>   11840	
>   11841	__bpf_kfunc int bpf_sk_assign_tcp_reqsk(struct sk_buff *skb, struct sock *sk,
>   11842						struct bpf_tcp_req_attrs *attrs, int attrs__sz)
>   11843	{
>   11844	#if IS_ENABLED(CONFIG_SYN_COOKIES)
>   11845		const struct request_sock_ops *ops;
>   11846		struct inet_request_sock *ireq;
>   11847		struct tcp_request_sock *treq;
>   11848		struct request_sock *req;
>   11849		struct net *net;
>   11850		__u16 min_mss;
>   11851		u32 tsoff = 0;
>   11852	
>   11853		if (attrs__sz != sizeof(*attrs) ||
>   11854		    attrs->reserved[0] || attrs->reserved[1] || attrs->reserved[2])
>   11855			return -EINVAL;
>   11856	
>   11857		if (!skb_at_tc_ingress(skb))
>   11858			return -EINVAL;
>   11859	
>   11860		net = dev_net(skb->dev);
>   11861		if (net != sock_net(sk))
>   11862			return -ENETUNREACH;
>   11863	
>   11864		switch (skb->protocol) {
>   11865		case htons(ETH_P_IP):
>   11866			ops = &tcp_request_sock_ops;
>   11867			min_mss = 536;
>   11868			break;
>   11869	#if IS_BUILTIN(CONFIG_IPV6)
>   11870		case htons(ETH_P_IPV6):
>   11871			ops = &tcp6_request_sock_ops;
>   11872			min_mss = IPV6_MIN_MTU - 60;
>   11873			break;
>   11874	#endif
>   11875		default:
>   11876			return -EINVAL;
>   11877		}
>   11878	
>   11879		if (sk->sk_type != SOCK_STREAM || sk->sk_state != TCP_LISTEN ||
>   11880		    sk_is_mptcp(sk))
>   11881			return -EINVAL;
>   11882	
>   11883		if (attrs->mss < min_mss)
>   11884			return -EINVAL;
>   11885	
>   11886		if (attrs->wscale_ok) {
>   11887			if (!READ_ONCE(net->ipv4.sysctl_tcp_window_scaling))
>   11888				return -EINVAL;
>   11889	
>   11890			if (attrs->snd_wscale > TCP_MAX_WSCALE ||
>   11891			    attrs->rcv_wscale > TCP_MAX_WSCALE)
>   11892				return -EINVAL;
>   11893		}
>   11894	
>   11895		if (attrs->sack_ok && !READ_ONCE(net->ipv4.sysctl_tcp_sack))
>   11896			return -EINVAL;
>   11897	
>   11898		if (attrs->tstamp_ok) {
>   11899			if (!READ_ONCE(net->ipv4.sysctl_tcp_timestamps))
>   11900				return -EINVAL;
>   11901	
>   11902			tsoff = attrs->rcv_tsecr - tcp_ns_to_ts(attrs->usec_ts_ok, tcp_clock_ns());
>   11903		}
>   11904	
>   11905		req = inet_reqsk_alloc(ops, sk, false);
>   11906		if (!req)
>   11907			return -ENOMEM;
>   11908	
>   11909		ireq = inet_rsk(req);
>   11910		treq = tcp_rsk(req);
>   11911	
>   11912		req->rsk_listener = sk;
>   11913		req->syncookie = 1;
>   11914		req->mss = attrs->mss;
>   11915		req->ts_recent = attrs->rcv_tsval;
>   11916	
>   11917		ireq->snd_wscale = attrs->snd_wscale;
>   11918		ireq->rcv_wscale = attrs->rcv_wscale;
>   11919		ireq->tstamp_ok	= !!attrs->tstamp_ok;
>   11920		ireq->sack_ok = !!attrs->sack_ok;
>   11921		ireq->wscale_ok = !!attrs->wscale_ok;
>   11922		ireq->ecn_ok = !!attrs->ecn_ok;
>   11923	
>   11924		treq->req_usec_ts = !!attrs->usec_ts_ok;
>   11925		treq->ts_off = tsoff;
>   11926	
>   11927		skb_orphan(skb);
>   11928		skb->sk = req_to_sk(req);
>   11929		skb->destructor = sock_pfree;
>   11930	
>   11931		return 0;
>   11932	#else
>   11933		return -EOPNOTSUPP;
>   11934	#endif
>   11935	}
>   11936	
> 

