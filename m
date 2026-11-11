Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794440811;
	b=jYa4NcSK32xcfE/dLubqJ9782XTRxAWQNvbeTsUjNZ4cO2jSLxbzoHliWtCGErIpkCso
	 yJaGdBzJs/PPEMkagWRU+votY/K0I4o/dFDOIVfKz5fA/WvyfNUqRG6oAvbIt/w1gls2R
	 Rg/EmzhojmG5OQV0t1tTmL2noWJqwCQV0uSNkuoWQZPGG3OgZmOEmymrO8QJ4vLvI+KcK
	 QuobNztnFoYtcsSz74Y8Tcji7fgYdyuB9ya/4DnU6zZX+5hPLodPZ0rhBW6SBoRN8Dvw0
	 jLTN+13I/II9dP733PffMAaihm6Ao66f+P3f1RNJFPhtcah854DmOmNejLjLGrBYqwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794440811;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=qNTqvp880V1AzQPjbJWvL9f9zomucT2LF6ZlJcI1BTI=;
	b=012nVDYASQE4lvveRodgP8Vmb99ru+U8cLxBSy7cHDrmp5yWqX3ZIDGjWoTWMTC6i3hP
	 ZNs5rlyXZPOntRr+GSO6+jQK64Xmrspz1loLHES0fdCTWfzZS4vTSNzu3tkRJ3Zsr6hcl
	 /FUQIXev46B0EWWoNZjeUTSpmFm0YlCmB+pUjG322Put/oXW5Axm0r3/sp/KGkrnw51nM
	 bbEdNCvI6kaw7uV5dBf0KmHKuRvYYVf0EJspnbYvLRu2IILGCMeMs4ulXhla4lCdBGpV4
	 oj91fZr2G4hR15/U87aRaAqY/384rt3Nk9Z6FbiNdK08ysFJJjuO0LtLRqSaxhmrAfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=P8QxZVHk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44628606A88B
	for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 23:46:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44628606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=P8QxZVHk
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4a76f63b243so296987fac.0
        for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 15:46:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794440810; cv=none;
        d=google.com; s=arc-20260327;
        b=h+JvRG5nAJjGpavDAN6RwJqjUdIKADZKncgRVZLdW2kLGBJL6XHM3FjqvG0X/8ml/k
         ydfqfSbcNpDTdUs9yrjwBbdJuNaQJBLXc6POP2pVSQA/npMaRawFVocCdARUvH9/ULfO
         BYcUqRuuC5oHQccuonIB0MMbOUoUTx6+9iyr9I3q142bAqCxVpB1Pkp6pl4jNXqIj/XT
         nFzLCFphUf425FeLxbT2YhoZRk3o54GKbOofwA8XrBc0hlPknW7w3Zc7EwDBVvA5U+mh
         GCqkG79/n3Lp2c1LyMMwkgDIy4KnBqTG/tcLSpjXPYq0OmPF3qBFjPfJ2bnuJWV/6i2U
         go7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qNTqvp880V1AzQPjbJWvL9f9zomucT2LF6ZlJcI1BTI=;
        fh=ltihvYOX5QTebVjR/AqrHzO927teOu8oEYsDDWZOYfI=;
        b=mRl0KtpLQW7vCR0FwXSaiqhCQSZGh4ttNczx7RNfxwTouNGfqltK9RXBbDMXCgH/Sx
         ZQNDX6jdF1aowoH0W6ilIE/TBI6zxHFFUeO30fCXY8yHXPx+/rDxjaX/5HGT6IGHFQIk
         JAact0sDU4fZghsCso0HHnnZ02hH66P8VHPX7DxVAT4RctGG+WVuVBe5N5r+yayCtzgd
         ylTUkQXhk19kUoVsi3SYuE/BP+Pa6MpwypB95wNbSIPTBRvXQmZTb0q9h9EsjMladC4a
         SuNPbzGM1dvQVJGNAvC8nFJdW0iRLrlCO8vjb7brfVvk7q4Xyg2cVJHafCqmXqG8SSyg
         zfjQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794440810; x=1795045610; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qNTqvp880V1AzQPjbJWvL9f9zomucT2LF6ZlJcI1BTI=;
        b=P8QxZVHkTwg9l1fRPYenPhMzM1IKAK0K2f6XKipVq3AvnucHYKpnwRzhZcoyvM41Un
         gqO7HKpjfb6raoEgvWPRgazR01gLg/LVU9jiZgZdRWdKHuRa8fSlKbBx1z6JHb5+GCRO
         LptdsXpej78SRXHPPMXmVyjZDlPXgrK+8XLek+t/fHIUAmYRcq2axCwpE3ceQ6yVZmfA
         RcUvYoYvNr4CHOz/AvxHTZuMQ18NtQspulSL1vX9erfLFwklbiPOK4cpUkPN8IP8WfnS
         +Vx0yAFEJ2Aag3Z+O1q3n8Othztg8W0u58wLuVN0f7TveyP42f5OI2GRbwmN2kpV7jPc
         DetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794440810; x=1795045610;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qNTqvp880V1AzQPjbJWvL9f9zomucT2LF6ZlJcI1BTI=;
        b=UQw8scAMJ+aYg4miMjt8z9mIzXo5d8dqnKt41LtJvoBTfFcPZQnoja4hV1nLDMRkua
         axqXv0MrkZvLLwP7aLCdkrKKj/xL08YE7iCuZJGBQDLUIdNEOR5nltmFLS+O3mqMI93U
         CYvocdmMCRRS9aSJDPkgibLHnBTwXAdYwZDf6DB/IQ/o6pjaFcDUJc77kaCc7Gpc4uOd
         EWfqybKu9xbwb7ZbSbf2pyRvonEbjgjL29Xas7s9kFLNx7Bsa+U7vw2fgSGJi1rPCNOH
         Mzmn2xhl5nwN6qex4Sh9iIZBEr8SNaEclAQb58FC77RXO/jDR/ctPiIR7EYjO0BElp08
         2J0w==
X-Forwarded-Encrypted: i=1; AL+hErG9YYLhIYEDgyNqRS2yqX+LGsRNkKAfIhvCWKg6rFUkw2/1S8WMRj7cpoFh43XAwBb2SiPn@lists.linux.dev
X-Gm-Message-State: APuU4Z+nftKXgv4btJL2wGK9tMGQhC2cWjkMCXq++6ggQeCz7wX4V+VS
	t36I8fnPec5YWEaIaxa7w577vGyAzqAjvCVNvi8V+L32WXvxreJ9hD+oNmistO2J8uP7iNqvq4P
	iEpK8DtnBG5KXuH5ug2rpQ9NRCGkhd+0o2Dd2oqOr/A==
X-Gm-Gg: AYBFou13FEfPlxCIah8ZvQ0YiGp6MDbJqOoH0QEPjGtKlP9y5wlVQVt+nzgmh14oNyV
	k9i4jgr2HUWyYHnwP3ClRMpedRFWQqz7KIuYPFh6X3HuWiLbwmnVdOgLSo30PhATf85OgoRqe4J
	/6/JhJOOtpTGrj8pIU9Ey8Gk1ZG51BDKlN66ebTYpPp3upCroh1zeXJJt8r+xbUuuL4fdnO5eGx
	eeV5oVIL9Z+9XdmtKseOrqA31cuwq6BpLZejhH6lUu0UNOXQzBXbG0IgyJY6dDcdYSZ1l3WbERl
	7H2ZjeaTxDfsKfNfPWIFDHkSbAMdBqgC1TAcdX7FdxrsAD1GSD8//LIP7MoGLkeXg2tW4CEEu6J
	2HHydjrwU3anHRzvl/J3CRebYGyHUOT/G+vuzVPKk4lVOGbrsdonWLpmr97ExKfseyXdwgoxDys
	ztAgwZcsbREA==
X-Received: by 2002:a05:6820:f004:b0:719:1627:6c16 with SMTP id
 006d021491bc7-7196b62ab2dmr743911eaf.12.1794440810117; Wed, 11 Nov 2026
 15:46:50 -0800 (PST)
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
 <CAG4wq-egD55NZDw+OKVKTKN2tQJ9oKEC504wFv=xoMXyJ-0z4g@mail.gmail.com> <avTqb--WfUNBcEyN@devvm16445.scu0.facebook.com>
In-Reply-To: <avTqb--WfUNBcEyN@devvm16445.scu0.facebook.com>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Wed, 11 Nov 2026 23:46:39 +0000
X-Gm-Features: AclHuK98I8l2CyqIug_hRhhYiDHFe7Xrim7_SwhM5rRiI9ms5coKAG0rV8Jl2JY
Message-ID: <CAG4wq-dw8VqiVTbi-fSJTnwj+amkfE_56ndKCYk4v31z2ppcTA@mail.gmail.com>
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

On 11/11, Stanislav Fomichev wrote:
> My main concern is that we are adding a lot of code and one more
> special way to plumb the metadata (and another metadata area), another
> set of kfuncs

The RX metadata can be stale on XDP_PASS and lost on XDP_REDIRECT.
There are already separate attempts to fix it:

- the RX hash and the VLAN tag [1],
- a checksum assertion [2],
- the checksum invalidation that you suggested [3].

For me, the question is not whether to plumb the metadata, but how.
It is not great to have fragmented mechanisms. The skb core extension
area aims to unify them.

That is my view. What do you think is the best way to solve these
problems?

> and slowly creeping more features into xdp making it
> more and more like skb.

I will leave this to Jesper.

> For containers in general, and for fast af_/xdp, we seem to have been
> moving into netkit with queue leasing. Maybe that's something that
> can help with your veth performance?

Thank you for the suggestion. Unfortunately, it does not fit our case.
Our XDP program decides where each packet goes, from the inner
headers after decap or even partial decryption [4]. Hardware queue
steering cannot do this.

This series also covers cases without containers: XDP_PASS on the NIC
and cpumap load balancing.

[1] https://lore.kernel.org/all/175146824674.1421237.18351246421763677468.stgit@firesoul/
[2] https://lore.kernel.org/all/20260630191510.81402-1-deliran@verdict.gg/
[3] https://lore.kernel.org/all/amEojEGsIGkUjIWn@devvm7509.cco0.facebook.com/
[4] https://lore.kernel.org/all/ca38f2ed-999f-4ce1-8035-8ee9247f27f2@kernel.org/

Cheers,
Tianyi
