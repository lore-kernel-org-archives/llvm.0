Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794359279;
	b=gpkNBb44LeY4Usx3MoM4B2aB9nFT7yQ9EUggMWQOkXYitmwBPCy/RF7zxaGDkGAv+/Tp
	 vA4QE4JHZDZcowqd8/o1kx8b/DwV3KpoloLiSdvJ2ttjiMkzubybQ2UAxXvu30oATcYdH
	 e9IeXMi9gemP5C+U2mtqX/yo5aZAN4336FobhZSJkcHq3s74OeNLP8VXBP0cN/4A0xp9H
	 WLrkf2IfwaNHx200ZpQDZ1PBKGf4ma0vpCHtZ55LdfSIG20WnS/cmC6l3UxT/yuh9CUe4
	 NtzWQ1UX8VZlmGY9VnkvLjzqocO7xSJJcLwKp2gq+snZD1GEUW91YyESSi0rmH+vZXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794359279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=8MFwGdApl0d4OiJqtJrDFLzpxo7TMPDirGuojCnnp6s=;
	b=gT7RCra+ohzigkgmb6PFd2lWpp679TYyhplwC4Ef/sKW1vHLcqYKgaoveP8T19T71WWh
	 34WxoLw7PkWpfAthatFXc9CvI7fV7oVzt8YVgUTZjUX0FWxs4YlGBo8AT4+OLyzAa7f99
	 s7pOm5sCzbMr8Gzbcg9xj9e5PuJjcY4qt1UaQVYTtj8u4LvUIhcdHQ3JlnRmG2QUARqcH
	 cHgTQjISGreuVw4xFMzQvfnUnyHN9SKesS1NXq3qqd+NjmaGutd0zDb1N3XVZiWcMM44A
	 qGux6TQIyvq+emFggMF6PMsmVy4tKsLN7g2GMhL28O0evIcv8QrWr7eFKwZNeLf3Eqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=fTRIyrqe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A997606A320
	for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 01:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A997606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=fTRIyrqe
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6e560e00a86so1661721eaf.1
        for <llvm@lists.linux.dev>; Tue, 10 Nov 2026 17:07:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794359278; cv=none;
        d=google.com; s=arc-20260327;
        b=TGFkx4kJlesQZFy2ab30BUI7dcttX9gMLMAyk9b8tpWS5k1MV5I68wD7k684HZAi0V
         nmsIVr4EuVv7tC5ACYfzjqzVfouUYWBX5OzYScg/SPN0Hn+17ZkROi2YbZYFq1xhSJHB
         2+eCBtuTHrUAXcKGGgC2TdykKoCBw+JepNdD0bFsDBPIF2FUIuhnI8c2Fa2lpBhClmVy
         C9H3ZA/esoNlCHeBHPWYFMDGbTuPZFroHxFXVuMF7BFGo55aW8o55IbZ76gLdl0d+f21
         SHoaoZDEa6hDZlECtOcxeNmuPP8P/FLvHj8vdjAwH8bpYF7klgMI73NVogBiLEgDQbdJ
         3Yzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8MFwGdApl0d4OiJqtJrDFLzpxo7TMPDirGuojCnnp6s=;
        fh=i5J+w1BUKocr9jey1zIkj2KBR4lSE38SZNmC1L+j/lA=;
        b=i8BC9MlMGw15uS2f2K2paWT4WseHrG4gb9iqcKzmhauI3T5vwWWG2YpmfgWGFl0JEP
         oJSv1/5l/3eYpS3XZHrMTaQUPgKnrpqMdjjrWLu4CKMU8RczAWnxNARgtkZV/DXG8K5P
         FS0tlk1VrIF980uCK5uS2/sIC8vmfUa+AIfJY4DUN0sqtd7pqlzJYu6+oHzQNyEQYH2c
         wQDMJ1W9/Vq/mtjorxyGFrv6LwmIDLnOuE3YeVaodymY20XHNzgTa3f1x4PNVGa4UOJY
         znQj6wGl9opJEeV/p+KNxuMAEJuYhDjGAwGQ+onB6O7utB6vJU+3N31wLa7D9PXJ7Lzl
         9GoA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794359278; x=1794964078; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8MFwGdApl0d4OiJqtJrDFLzpxo7TMPDirGuojCnnp6s=;
        b=fTRIyrqeCVxQod0OFU1ssYx1xq9Hz3Ib8R7R2x5OpB5Y/svYHPY2wLphh5A/EgEmNT
         wi6SZn07qYb9Bu6LlNQz3B6BHaYvdPqvO93NSiGa7lUqVsg4fWVrxpd6I8knL1as0e0g
         sVTcvFJ5uXzaAj6TifgF/QjfxNtuyRmCqf4sE/Pr7N5dV6JEDxQBqb+1v/31fDCx2Bdu
         15zNMeAMB2qR89D8nfpFpnIZ22mLIwxduj52RtNi4ujOKlBGW5IQoOuoxepxUfC5PV4f
         dmrdKBrkJiFGQrk4R22050eiQo2pIzb2d7434ePy5KrKQHbAQ/JCWlCPmnoblnrcApud
         VhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794359278; x=1794964078;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8MFwGdApl0d4OiJqtJrDFLzpxo7TMPDirGuojCnnp6s=;
        b=taMd1lNwB9cxARkNIniqJlsZpDueCqdyFjyK+6CboEAHUOv7duWGWS+iPdxft4nVRL
         i/6e652ucpbPKsUHRKi67QATRez9L17vHe43v84nHEayTUcZpdp88zN4+VSEtbEky7MP
         FpJyvMw7V5Clfn6kzcVqPyKh8P8BRKZVdHoyXgUKx2KKOCa66bp1tuMRg6tYDBPYccx1
         rjBGnm3gd2/hJIoyFyIjDFPoOyqDL72NJf1rEPnRDPkGjQ93Oa0tmbFPJ0v7rflDtMjI
         /hVetExvbg6QHbIxaE3pMJJRB6tVzRWb+eMNEFLoRZi+0cpKZB2CqvKAQlDtS9qCei7b
         tKLw==
X-Forwarded-Encrypted: i=1; AL+hErHL71LIEn+TXPao9qHWcDJ+XEzb3aREEbr7gKPYCOoddZkW7JAJ8/RxfDoe5kjD2QlW/SCz@lists.linux.dev
X-Gm-Message-State: APuU4Z/qxhq0q2RjsSm8PTvgNfjujPyDFsKGLJbDYWfsBevWv92CBoOw
	MOMbTYTaROCQ9iM2EDpUZUW6b2tWL2dCBVD15kg2npK4G+54adnslyxr5sYIwBMjVJyCyofmSOi
	a7A2YSeljagZMBK0Ut7ZSA4tWxUJoSJMqjHmPyRIQAQ==
X-Gm-Gg: AYBFou1kXQ/wZzf/9T7bfwcQtmqL7o5wDBMIQxBWuoSw1ZU9YdgNHFcY3KcVzatXsNM
	RoAAN4QwoSGdG5DYeZ/BcW7wJsdg1pZetc1UMMvUjjRaNVYt6UKuoVixlbTxlksepM8eEwM5pNH
	ovyOBAiiP68LULv8KZZbFHR+KzfSXjXDhfAXZDz8PRb3B0fCl+U5NVUe73NIqBWg22aBhxyBTr/
	GQ9p1a1D046m+D+iEcFu2xGiBgLd1IWRjtcN+GKEOnFI5EQ2kE9Mq8TCtX/z4dKAfxDvKj/bLrD
	WD+Orm41KVWFOOf/Fr01A3lGiEZQnFdm5Rhur1u+PjbzWFNYK54rvBFiQUsPTQJ84pMPhEsUhD6
	pBwbYIHYNvpGJwpJ2oyr7uZJsYS3nDMAOuU4KoR2/oFcqKG+HkoV42UOQLfKumG8ydq7yxKYulI
	YjxQvAiOhkUQ==
X-Received: by 2002:a05:6820:16a9:b0:716:c04a:4771 with SMTP id
 006d021491bc7-71917858218mr598043eaf.24.1794359278033; Tue, 10 Nov 2026
 17:07:58 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1794281983.git.tianyi@cloudflare.com> <avOvI8xrHI0dwyHj@devvm16445.scu0.facebook.com>
In-Reply-To: <avOvI8xrHI0dwyHj@devvm16445.scu0.facebook.com>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Wed, 11 Nov 2026 01:07:46 +0000
X-Gm-Features: AclHuK9OIHzq1A_ViLb9jLKzo-flUIoCHThbTHbypb5m7BOmw6IeVMdp_ZFoAAw
Message-ID: <CAG4wq-egD55NZDw+OKVKTKN2tQJ9oKEC504wFv=xoMXyJ-0z4g@mail.gmail.com>
Subject: Re: [PATCH bpf-next 00/15] xdp: add SKB core extensions to keep RX
 metadata until skb creation
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: bpf@vger.kernel.org, netdev@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Jakub Kicinski <kuba@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Vladimir Vdovin <deliran@verdict.gg>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Donald Hunter <donald.hunter@gmail.com>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Tushar Vyavahare <tushar.vyavahare@intel.com>, Jason Xing <kerneljasonxing@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Madalin Bucur <madalin.bucur@nxp.com>, 
	Ioana Ciornei <ioana.ciornei@nxp.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Chris J Arges <carges@cloudflare.com>, 
	Jakub Sitnicki <jakub@cloudflare.com>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	llvm@lists.linux.dev, kernel-team@cloudflare.com
Content-Type: text/plain; charset="UTF-8"

Hi Stanislav,

On 11/10, Stanislav Fomichev wrote:
> Awhile ago we discussed the alternative of adding setters for xdp
> metadata. Then the veth (or whoever turns xdp frame into an skb) can
> apply whatever metadata it needs (and there is some magic behind the
> scenes that takes it into account when creating an skb). That keeps
> the layout and most of the code outside of kernel. Have we considered
> that here?

Thanks for the reminder. Yes, we considered [1] and [2], and took
parts of them.

The alternative setter model in [1] requires a program on veth or
cpumap to call the setters for the RX metadata. We want to avoid that:

- On veth, an XDP program removes software GSO from the peer, limits
  its MTU, and can copy skbs from the peer.
- On cpumap, each entry would need a program only for this.

This series achieves the same with only the XDP program on the NIC,
which stores the values with kfuncs in the skb core extension area
after the xdp_frame. cpumap and veth take this area into account when
they create the skb, which is the "magic behind the scenes".

[1] https://lore.kernel.org/all/20250616145523.63bd2577@kernel.org/
[2] https://lore.kernel.org/all/aGvcb53APFXR8eJb@mini-arch/

Cheers,
Tianyi
