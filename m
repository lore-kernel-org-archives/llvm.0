Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E94A1E5B63
	for <llvm@lists.linux.dev>; Sat, 11 Jul 2026 12:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783772326; cv=none; b=P9JvtKLbRXK0cXY0VLQ1x0TGL+Q6ZcmK2pXA1DBWSoJv3vUVnm4yNmKEiW1Bu+9XwsBzrzs8qjL1X4DR0uS8U57q95XgsRcMNykUm7+PQUZTeWBdvRxBFeu9SNgC/szWDAH6e3ku+TlaAzn7EN1bjoYfkjZR+wOkGYhjH89k96w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783772326; c=relaxed/simple;
	bh=dr3TJcfdJk+bpPiAAqFoTZfvx7w+mxrLChWOghmEMbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n7yx5mf3JBDTwYmf9y2sWLzt8KlYRy1bS7ZdWoqrmmAqyE0mzehwLsn9hsKqeaZZo/leLyRbL2tuxjfFFzxJCRY/l4MsnCr91aBT1hobohTVC5Y73ywrompWanzWZbrEHgWPYtp0398fYeWN3/SYsJZJLOGfy4Kz1bCfTlrEx/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JkRLz3gp; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkRLz3gp"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493c19bad03so14902925e9.2
        for <llvm@lists.linux.dev>; Sat, 11 Jul 2026 05:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783772324; x=1784377124; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V6jXOkA9dt2F1sZHa1k5nI0GE5lU7z58l2+/jSAj9v8=;
        b=JkRLz3gp8ZecG7pICerGxhJ51xLeSPQDcDLrDaL6ZfBCJSQj9F8M9x+rKlBesAIzun
         QztK1fKQcpdLsGLbkhjUoBs3lC+DGO3CNs3591w7nYJmGYB1Zrqzh8lJI8qINB4VLqMA
         kMB9g4EHjJayVwkR3qwdTLla+90Ymvn3TqfB1fXA+rtOCEebU8lD/ktXLO/e/BZihuGt
         QPlv1LJHyPHRo1/FfND5hWgLEAVdfhgTSwzHli4vpDEkGCZocuzXpimWELqAsfeilsGs
         /X2sMn4VO48vGmxzhgV9yys5C8d8m/wXjb+w1BYRz0b77emKhWeCn5UkOoVeYbhHDNST
         +f2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783772324; x=1784377124;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V6jXOkA9dt2F1sZHa1k5nI0GE5lU7z58l2+/jSAj9v8=;
        b=WDcnAJPiNvrkAWDMy5nF7emNpksV/PHNlfaQcYPuypCz0AJetJbMGiiCf3MnKl+Nxc
         lvYqjnjA0Eflr+o86TVxuU7grh5qeQGWrCyDaCPppPIm08domgwDe+Si7Z/N8sQAdSbZ
         vqXy4MYYDxlM0g6rdDJgVMTrOI4o0Nf+0XBriWp0JYHiYl49AHDuc5K9ZUHcPkp04il0
         l4lD+0VfJzf4AL2sLma+IsS3OdGkP1jxFlx4CN7LyvmrSXMjQDxV9dKO5ioaN+vy5fyp
         rFsqw2sgzL+qEcYrtmjizlYce3X4QltZIuk08oE3BgoV8CofeX/scBWRn3qoyfoNQiMK
         VAng==
X-Forwarded-Encrypted: i=1; AHgh+RrFa4VlmuEJPYp3KgmpSNRpfYA4XgbS+u8VtxyshS1gdWX+22am26d/yar6GmX+Qiom+NFz@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2bpFB6dJvEeHIbry32AlU4qXrKQSg+Y0CU16d6FdOm6/6UW3O
	/FHOMmHqOyI/H29CziUtJ4n+DCIBGjfFEoIPncXa0dmMyeJZ85hhCYOE
X-Gm-Gg: AfdE7cl1e7OPrT5nEMa3/v6GtZ5mjRJwpyq9o/vdRlIzuBY6a0htswOuLDkmgfSBBho
	DdZyBTwNacqwU/pNTYJ4xbkgt1gP7Oiz0zJlAZSBAEMWVYA1+xRyHuduVUTkuV6Xm4O1aBmUHut
	8ymdvvJwtm4M6qkwe9jlqzE3eg1ahYZXq+OWpQMLf4KYnsLMWetaIOSk8r0MZLn9e3wesoF5I3N
	3Adcp5Z2/AosG2tgg1PP8jEnFb5+h1MhtrBwZ6hMyWq74gJq4LNfzUAKZCWZZpkV3jgYqXnEpdB
	LxY17VB6dMh4CzEO9QNQeBMwuEreWJGOrni1LDYB9gg5vupbblVPoUOyrSJxoWDgaTNuwSm57hb
	A2FNNbSJm/OgjrQHhSESGjVB7WbKpGJ68A/smWrIqbyIqFO4zQMj13aux/m7fl/X3yqrlFVIGOS
	IaEbRapbzX42HV7JsWH1j6z8DvrXbg
X-Received: by 2002:a05:600c:1906:b0:493:c8a6:b517 with SMTP id 5b1f17b1804b1-493f883b7e8mr24576725e9.38.1783772323335;
        Sat, 11 Jul 2026 05:18:43 -0700 (PDT)
Received: from gmail.com ([2a01:e0a:488:3510:c939:9319:b6be:3b6f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2e0eff1sm86011345e9.0.2026.07.11.05.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 05:18:42 -0700 (PDT)
Date: Sat, 11 Jul 2026 14:18:40 +0200
From: Mahe Tardy <mahe.tardy@gmail.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Jordan Rife <jordan@jrife.io>
Subject: Re: [linux-next:master 5404/5655] net/core/filter.c:12578:18:
 warning: unused variable 'nskb'
Message-ID: <alI0oJ93SjUaEHPH@gmail.com>
References: <202607110140.JeJZ6GIa-lkp@intel.com>
 <b58e3248-30ed-4d2b-88e6-8d23381405b6@iogearbox.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b58e3248-30ed-4d2b-88e6-8d23381405b6@iogearbox.net>

On Sat, Jul 11, 2026 at 01:15:27PM +0200, Daniel Borkmann wrote:
> On 7/10/26 7:37 PM, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   bee763d5f341b99cf472afeb508d4988f62a6ca1
> > commit: f3603df9aebb2a2fe2f745bd71ca38aeca60e6e7 [5404/5655] bpf: Add bpf_icmp_send kfunc
> > config: i386-buildonly-randconfig-001-20260710 (https://download.01.org/0day-ci/archive/20260711/202607110140.JeJZ6GIa-lkp@intel.com/config)
> > compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607110140.JeJZ6GIa-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202607110140.JeJZ6GIa-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > > > net/core/filter.c:12578:18: warning: unused variable 'nskb' [-Wunused-variable]
> >      12578 |         struct sk_buff *nskb;
> >            |                         ^~~~
> >     1 warning generated.
> 
> oh well, pls send a fix, Mahe.

Yep saw that yesterday, sent the fix and got it merged by Kumar [^1].
See the commit on bpf-next[^2].

[^1]: https://lore.kernel.org/bpf/DJV5GU2AGDJB.2YWAL2MA7FM6T@gmail.com/T/#u
[^2]: https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?id=30f77a0419382ce061b2418de81526e93be4ecf9

> 
> > 
> > vim +/nskb +12578 net/core/filter.c
> > 
> >   12553	
> >   12554	/**
> >   12555	 * bpf_icmp_send - Send an ICMP control message
> >   12556	 * @skb_ctx: Packet that triggered the control message
> >   12557	 * @type: ICMP type (only ICMP_DEST_UNREACH/ICMPV6_DEST_UNREACH supported)
> >   12558	 * @code: ICMP code (0-15 except ICMP_FRAG_NEEDED for IPv4, 0-6 for IPv6)
> >   12559	 *
> >   12560	 * Sends an ICMP control message in response to the packet. The original packet
> >   12561	 * is cloned before sending the ICMP message, so the BPF program can still let
> >   12562	 * the packet pass if desired.
> >   12563	 *
> >   12564	 * Currently only ICMP_DEST_UNREACH (IPv4) and ICMPV6_DEST_UNREACH (IPv6) are
> >   12565	 * supported.
> >   12566	 *
> >   12567	 * Return: 0 on success (send attempt), negative error code on failure:
> >   12568	 *         -EBUSY: Recursion detected
> >   12569	 *         -EPROTONOSUPPORT: Non-IP protocol
> >   12570	 *         -EOPNOTSUPP: Unsupported ICMP type
> >   12571	 *         -EINVAL: Invalid code parameter
> >   12572	 *         -ENETUNREACH: No usable route/dst for the ICMP reply
> >   12573	 *         -ENOMEM: Memory allocation failed
> >   12574	 */
> >   12575	__bpf_kfunc int bpf_icmp_send(struct __sk_buff *skb_ctx, int type, int code)
> >   12576	{
> >   12577		struct sk_buff *skb = (struct sk_buff *)skb_ctx;
> >   12578		struct sk_buff *nskb;
> >   12579		struct sock *sk;
> >   12580	
> >   12581		sk = skb_to_full_sk(skb);
> >   12582		if (sk && sk->sk_kern_sock &&
> >   12583		    (sk->sk_protocol == IPPROTO_ICMP || sk->sk_protocol == IPPROTO_ICMPV6))
> >   12584			return -EBUSY;
> >   12585	
> >   12586		if (!skb_valid_dst(skb))
> >   12587			return -ENETUNREACH;
> >   12588	
> >   12589		switch (skb->protocol) {
> >   12590	#if IS_ENABLED(CONFIG_INET)
> >   12591		case htons(ETH_P_IP): {
> >   12592			if (type != ICMP_DEST_UNREACH)
> >   12593				return -EOPNOTSUPP;
> >   12594			if (code < 0 || code > NR_ICMP_UNREACH ||
> >   12595			    code == ICMP_FRAG_NEEDED) /* needs a valid next-hop MTU */
> >   12596				return -EINVAL;
> >   12597	
> >   12598			nskb = skb_clone(skb, GFP_ATOMIC);
> >   12599			if (!nskb)
> >   12600				return -ENOMEM;
> >   12601	
> >   12602			memset(IPCB(nskb), 0, sizeof(*IPCB(nskb)));
> >   12603			icmp_send(nskb, type, code, 0);
> >   12604			consume_skb(nskb);
> >   12605			break;
> >   12606		}
> >   12607	#endif
> >   12608	#if IS_ENABLED(CONFIG_IPV6)
> >   12609		case htons(ETH_P_IPV6):
> >   12610			if (type != ICMPV6_DEST_UNREACH)
> >   12611				return -EOPNOTSUPP;
> >   12612			if (code < 0 || code > ICMPV6_REJECT_ROUTE)
> >   12613				return -EINVAL;
> >   12614	
> >   12615			nskb = skb_clone(skb, GFP_ATOMIC);
> >   12616			if (!nskb)
> >   12617				return -ENOMEM;
> >   12618	
> >   12619			memset(IP6CB(nskb), 0, sizeof(*IP6CB(nskb)));
> >   12620			icmpv6_send(nskb, type, code, 0);
> >   12621			consume_skb(nskb);
> >   12622			break;
> >   12623	#endif
> >   12624		default:
> >   12625			return -EPROTONOSUPPORT;
> >   12626		}
> >   12627	
> >   12628		return 0;
> >   12629	}
> >   12630	
> > 
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
