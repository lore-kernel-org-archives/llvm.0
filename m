Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201902DCF74;
	Sat, 11 Jul 2026 11:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.133.104.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783768542; cv=none; b=pn7ZqQr3XkTdS8Z+6e8n43oYykU70GVw3COT2NkdjP+SpmEZRcNzfOLDgrJy75xsRZAdZqxfKADZd/wEOg0OOrdzuVVXP6trvqwvSvjhpCPGZQBo28aHTThdiaXwTf+uO1PdGdvlJyInK5sKzNqVohi6/R9GoktkI7dguxXJEYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783768542; c=relaxed/simple;
	bh=nNKLrOI72yM5AnxvHC1zCk7NFEuWtvbwgS6oLVQAaWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G18H0gIZQCowSc9LXcEPfgnC4GXuqOvhlmIO7PS9Xcy8lGn30OFK5rMEKNhfJndjMSUjPvJn13D5tRftM1OmvZZhqihAaA2HOvPOZmAFCeibW1DvQwcJlY2hjE55xbDip8EaSnSpVCgBTkkgVa7LTvsBA2YsoY4sqaWQ+UQbXRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iogearbox.net; spf=pass smtp.mailfrom=iogearbox.net; dkim=pass (2048-bit key) header.d=iogearbox.net header.i=@iogearbox.net header.b=SfBWqNZs; arc=none smtp.client-ip=213.133.104.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iogearbox.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iogearbox.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iogearbox.net header.i=@iogearbox.net header.b="SfBWqNZs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iogearbox.net; s=default2302; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=kVATrJVnMaLlkQx0+dZm5Lvaz00wwL8+rHpAjBJdPxw=; b=SfBWqNZsZePpYtjbfKNSXd5aoo
	P10UEsvFsBKlPybSv3J3o2YLjG4A0VEdSqb7vauNVsAxz+n0XiA9rjNYgTRym/OlFw2BzS18es0N4
	O0rA4vEPQrOSPQVrFGl125n5wSW42xHzKy0MJ751FT6V3lZzU6bykHb0DI+STWv9S3FP0V6C3TBDq
	gaYJJw512RFXo1uMfEtzEWwMK7RnKXGMOUt32OFTmlfofa9/ggU2wr54JuhJN1grq2x4dxrIN5XYf
	9e1cTpVRdnyR7/EqK2oMi2/ZbOuSD3Inu5EWsA3qpPJkOz2yEozVFXevGEKMR4vgcIqppF2uC/qAG
	vd/vMwDg==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www62.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <daniel@iogearbox.net>)
	id 1wiVg8-000Ofa-2H;
	Sat, 11 Jul 2026 13:15:28 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <daniel@iogearbox.net>)
	id 1wiVg8-000436-2C;
	Sat, 11 Jul 2026 13:15:28 +0200
Message-ID: <b58e3248-30ed-4d2b-88e6-8d23381405b6@iogearbox.net>
Date: Sat, 11 Jul 2026 13:15:27 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 5404/5655] net/core/filter.c:12578:18:
 warning: unused variable 'nskb'
To: kernel test robot <lkp@intel.com>, Mahe Tardy <mahe.tardy@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Emil Tsalapatis <emil@etsalapatis.com>, Jordan Rife <jordan@jrife.io>
References: <202607110140.JeJZ6GIa-lkp@intel.com>
Content-Language: en-US
From: Daniel Borkmann <daniel@iogearbox.net>
Autocrypt: addr=daniel@iogearbox.net; keydata=
 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
In-Reply-To: <202607110140.JeJZ6GIa-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28057/Sat Jul 11 08:24:05 2026)

On 7/10/26 7:37 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   bee763d5f341b99cf472afeb508d4988f62a6ca1
> commit: f3603df9aebb2a2fe2f745bd71ca38aeca60e6e7 [5404/5655] bpf: Add bpf_icmp_send kfunc
> config: i386-buildonly-randconfig-001-20260710 (https://download.01.org/0day-ci/archive/20260711/202607110140.JeJZ6GIa-lkp@intel.com/config)
> compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607110140.JeJZ6GIa-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202607110140.JeJZ6GIa-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> net/core/filter.c:12578:18: warning: unused variable 'nskb' [-Wunused-variable]
>      12578 |         struct sk_buff *nskb;
>            |                         ^~~~
>     1 warning generated.

oh well, pls send a fix, Mahe.

> 
> vim +/nskb +12578 net/core/filter.c
> 
>   12553	
>   12554	/**
>   12555	 * bpf_icmp_send - Send an ICMP control message
>   12556	 * @skb_ctx: Packet that triggered the control message
>   12557	 * @type: ICMP type (only ICMP_DEST_UNREACH/ICMPV6_DEST_UNREACH supported)
>   12558	 * @code: ICMP code (0-15 except ICMP_FRAG_NEEDED for IPv4, 0-6 for IPv6)
>   12559	 *
>   12560	 * Sends an ICMP control message in response to the packet. The original packet
>   12561	 * is cloned before sending the ICMP message, so the BPF program can still let
>   12562	 * the packet pass if desired.
>   12563	 *
>   12564	 * Currently only ICMP_DEST_UNREACH (IPv4) and ICMPV6_DEST_UNREACH (IPv6) are
>   12565	 * supported.
>   12566	 *
>   12567	 * Return: 0 on success (send attempt), negative error code on failure:
>   12568	 *         -EBUSY: Recursion detected
>   12569	 *         -EPROTONOSUPPORT: Non-IP protocol
>   12570	 *         -EOPNOTSUPP: Unsupported ICMP type
>   12571	 *         -EINVAL: Invalid code parameter
>   12572	 *         -ENETUNREACH: No usable route/dst for the ICMP reply
>   12573	 *         -ENOMEM: Memory allocation failed
>   12574	 */
>   12575	__bpf_kfunc int bpf_icmp_send(struct __sk_buff *skb_ctx, int type, int code)
>   12576	{
>   12577		struct sk_buff *skb = (struct sk_buff *)skb_ctx;
>   12578		struct sk_buff *nskb;
>   12579		struct sock *sk;
>   12580	
>   12581		sk = skb_to_full_sk(skb);
>   12582		if (sk && sk->sk_kern_sock &&
>   12583		    (sk->sk_protocol == IPPROTO_ICMP || sk->sk_protocol == IPPROTO_ICMPV6))
>   12584			return -EBUSY;
>   12585	
>   12586		if (!skb_valid_dst(skb))
>   12587			return -ENETUNREACH;
>   12588	
>   12589		switch (skb->protocol) {
>   12590	#if IS_ENABLED(CONFIG_INET)
>   12591		case htons(ETH_P_IP): {
>   12592			if (type != ICMP_DEST_UNREACH)
>   12593				return -EOPNOTSUPP;
>   12594			if (code < 0 || code > NR_ICMP_UNREACH ||
>   12595			    code == ICMP_FRAG_NEEDED) /* needs a valid next-hop MTU */
>   12596				return -EINVAL;
>   12597	
>   12598			nskb = skb_clone(skb, GFP_ATOMIC);
>   12599			if (!nskb)
>   12600				return -ENOMEM;
>   12601	
>   12602			memset(IPCB(nskb), 0, sizeof(*IPCB(nskb)));
>   12603			icmp_send(nskb, type, code, 0);
>   12604			consume_skb(nskb);
>   12605			break;
>   12606		}
>   12607	#endif
>   12608	#if IS_ENABLED(CONFIG_IPV6)
>   12609		case htons(ETH_P_IPV6):
>   12610			if (type != ICMPV6_DEST_UNREACH)
>   12611				return -EOPNOTSUPP;
>   12612			if (code < 0 || code > ICMPV6_REJECT_ROUTE)
>   12613				return -EINVAL;
>   12614	
>   12615			nskb = skb_clone(skb, GFP_ATOMIC);
>   12616			if (!nskb)
>   12617				return -ENOMEM;
>   12618	
>   12619			memset(IP6CB(nskb), 0, sizeof(*IP6CB(nskb)));
>   12620			icmpv6_send(nskb, type, code, 0);
>   12621			consume_skb(nskb);
>   12622			break;
>   12623	#endif
>   12624		default:
>   12625			return -EPROTONOSUPPORT;
>   12626		}
>   12627	
>   12628		return 0;
>   12629	}
>   12630	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

