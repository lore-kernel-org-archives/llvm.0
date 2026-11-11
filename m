Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794435917;
	b=naP4oOKK+y+iaBZCW8k1t1nrTH/maLQvU87RPXiigkbPVZEBVnqRaE3KJOvghUPFgkgb
	 mZSsNzX1UtI1tDbiobZSOfHGabM2yfGpZse943lG/WyEkgcQBofyJ7a1BIGzuhaKk5BsT
	 fJc6mThMQ6fZ5KCQniohwtkqSv/v3yyO32aaDUjXX/JRdDHi8pYafG2SJwc+P80I1mZXK
	 JGKdCvezyxBpf7ScR3Ke7Wolr4CPSzfxU5rmGGEhJnUVGf3JPuNeVNgJeGBz+aDSZ3rZO
	 4YCPHqMh3haxe9BEFsLhwEZseLD/W6JafCjbM5qsoU79pe3jjrAnmMT3H3nszUWZ+OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794435917;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=LcIgSNREManU20T5ds32E1qosC1xbF0e9vbPmoZw/SM=;
	b=Yg7DuqsOti9Fk3Zp/WNnJrR4+Y6sAZtvWMicma4HIZ6OH6n/CWrAa5CwXTQtreYoIquw
	 pZWbTOUdetrYT5E4B0bjf3irUkR6LdatV1I9FLL29eUzkbuH8xNaY94YHEQs1DggNQ4Uv
	 /mDLNP9HhZC7ytY7nX+zqvqXuWd2uZ0WNdLf+q91FJLPDFp0ZMTHeP0Ms45NO5DTzhng0
	 kSU08fZ7zj/KZphF7teUZm7SBD4nqphYP3eSQcmnEXK/VQO66M9s7Ypmf3MvWUuv1seO3
	 0hE19S+P1L78I+ORxTVVJfXuJDZUiCk0K5b1vrqnQIZCxZ4jyg+JEUmkKKI3F/sz4qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nWgPs/vT";
	arc=none smtp.remote-ip=74.125.229.135
Received: from mail-dl2-f7.google.com (mail-dl2-f7.google.com [74.125.229.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3AE606A32D
	for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 22:25:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE3AE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nWgPs/vT
Received: by mail-dl2-f7.google.com with SMTP id a92af1059eb24-13985f8229aso3309011c88.1
        for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 14:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794435916; x=1795040716; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LcIgSNREManU20T5ds32E1qosC1xbF0e9vbPmoZw/SM=;
        b=nWgPs/vTiv3nNs0P97T2lIBfbtDu6uwoGmdVo85c++sJTZx/Cufm0SQfyggd1HjXrZ
         ofdGI+X8kv3ezs/9uAzo7lLEIbIqQp1raXrjROjV4HwiiauY2Ca/FXLOVtDz/F2xiHWK
         0p/lHuRpWUeTYRA0Wh1kIoo3dhrwUVZCGVJCNbyFhRaRM//QjkcvSave+aPupu1g5K0r
         7rC6ZAWLSeUSq5AeSsnwjYU07kNUxrcpqBae4uIrB+9Lu9aPNQWTUZ/4BL0X53VCOlq+
         cdV894Bm3zbkg+GVuN6+jpITVIkle9npZdaa7qaBgkRaFB3PeS0o/2Dw+9M8U9veArEW
         xSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794435916; x=1795040716;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LcIgSNREManU20T5ds32E1qosC1xbF0e9vbPmoZw/SM=;
        b=WETEwCLgBEv4eLpTX5Lkz7E9y2Y537ug/KxygbxlZU4jUQbQ7Fijcw+nryn/DRJtwY
         aeVpZvRPguvIoyFfRmuFw+gQ5UMCH0UrH04+M7Oa+Mx6VF6Ph3Ll3Bor64udhEdHQym2
         KvLF+kJ4nuccw4Kz9FGZZSnWxlH4Ps9HnSNFAYvH0w4ZulNeNXmkELt274oTQTOHeQmu
         UAqKd6XfCKI3J9X/Bw8Jl9Ci9u3FDFKox91xrR4cVOranqZTqls6GPlQfrv/KLRiVgJV
         s4wS64dNYLaPQjLf6uY+qIvtaROT+g70LdSMl4jai/kWwDbLZCZqhvOcYNm/I5LTWWVs
         b1gg==
X-Forwarded-Encrypted: i=1; AL+hErFYpONPivttHE9w/YrbvZEQj8nQGRLmrB6k7KW20W3nQj5Ofyz2SWFiQ2IrSrAy2Z8IYh5D@lists.linux.dev
X-Gm-Message-State: APuU4Z8vRGzqSPPvYFkAR0NE17QueNzrKIOilQNFcVMvaJC4teuUjKSY
	JAbdEKaptq2uSxdrBzgAEpJ5ehWOnv1lWcIrWEGhN18GNRdGzs+rY6p0
X-Gm-Gg: AYBFou1e8sEWK1FlDXZyXitpcc7ijg+gCT8Wbn62uJg4Bx33WQ1lEb9ITKq+aMkjYvC
	LjoJwYkG8+AwZIcn5SK0pggXPyCDglUsZ8NR4BiFF9tzFY0pY9t6MHDmNGMYqUGskctuOYSEpnd
	/KcJnCy2JZPi7YTiMPdCg8Je42QnbcP37Yu6DZHGJl4gC3+jtuTCnYIaHY7yD5O2dMBc/32S4+n
	cbWYQ2AuMfDiyn7qTOjT606c1dn5CD1fmxOUy6ZAvWhu1i/TB9Up3BXlHWPn3ANQUvzOjHUD8Kl
	yqMG5igX+QdLz6yzn44FyqM+UJ3rmdg/vxOtAXrLG9QvQ4Mdd+1HQ9883OF1iXMr3YWNaeEcx5v
	iTeZMz8J/B0x3WwlNywptDyGbb63wAH7h8x18kSyRh8SAarxysFC0wr9VOpvI1orsJzyBMrjEDb
	35S4AqjGdLUyP+NFtnmky7cIzzgS+Ldir/sINrfybYkS69yL2eo16pxIp+N1NNzzSOzIAHBnDgW
	De6zU9cdboPvnQVl/gQj6/hVhMagTzkwrkBVut6Qm3XReZ+MfdhcXk0Tc31Oz0IwzDMdYBPqZRH
	dx+CPlYTWJfjljzYFael2zE=
X-Received: by 2002:a05:7022:286:10b0:1b3:a23a:d1f3 with SMTP id a92af1059eb24-1b3c03037a9mr3351998c88.18.1794435915687;
        Wed, 11 Nov 2026 14:25:15 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:43::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890584sm20682923c88.3.2026.11.11.14.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:25:15 -0800 (PST)
Date: Wed, 11 Nov 2026 14:25:09 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Tianyi Gao <tianyi@cloudflare.com>
Cc: bpf@vger.kernel.org, netdev@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Jakub Kicinski <kuba@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Vladimir Vdovin <deliran@verdict.gg>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Donald Hunter <donald.hunter@gmail.com>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Tushar Vyavahare <tushar.vyavahare@intel.com>, Jason Xing <kerneljasonxing@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Madalin Bucur <madalin.bucur@nxp.com>, 
	Ioana Ciornei <ioana.ciornei@nxp.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Chris J Arges <carges@cloudflare.com>, 
	Jakub Sitnicki <jakub@cloudflare.com>, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	intel-wired-lan@lists.osuosl.org, llvm@lists.linux.dev, kernel-team@cloudflare.com
Subject: Re: [PATCH bpf-next 00/15] xdp: add SKB core extensions to keep RX
 metadata until skb creation
Message-ID: <avTqb--WfUNBcEyN@devvm16445.scu0.facebook.com>
References: <cover.1794281983.git.tianyi@cloudflare.com>
 <avOvI8xrHI0dwyHj@devvm16445.scu0.facebook.com>
 <CAG4wq-egD55NZDw+OKVKTKN2tQJ9oKEC504wFv=xoMXyJ-0z4g@mail.gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAG4wq-egD55NZDw+OKVKTKN2tQJ9oKEC504wFv=xoMXyJ-0z4g@mail.gmail.com>

On 11/11, Tianyi Gao wrote:
> Hi Stanislav,
> 
> On 11/10, Stanislav Fomichev wrote:
> > Awhile ago we discussed the alternative of adding setters for xdp
> > metadata. Then the veth (or whoever turns xdp frame into an skb) can
> > apply whatever metadata it needs (and there is some magic behind the
> > scenes that takes it into account when creating an skb). That keeps
> > the layout and most of the code outside of kernel. Have we considered
> > that here?
> 
> Thanks for the reminder. Yes, we considered [1] and [2], and took
> parts of them.
> 
> The alternative setter model in [1] requires a program on veth or
> cpumap to call the setters for the RX metadata. We want to avoid that:
> 
> - On veth, an XDP program removes software GSO from the peer, limits
>   its MTU, and can copy skbs from the peer.
> - On cpumap, each entry would need a program only for this.
> 
> This series achieves the same with only the XDP program on the NIC,
> which stores the values with kfuncs in the skb core extension area
> after the xdp_frame. cpumap and veth take this area into account when
> they create the skb, which is the "magic behind the scenes".
> 
> [1] https://lore.kernel.org/all/20250616145523.63bd2577@kernel.org/
> [2] https://lore.kernel.org/all/aGvcb53APFXR8eJb@mini-arch/

My main concern is that we are adding a lot of code and one more special
way to plumb the metadata (and another metadata area), another set
of kfuncs and slowly creeping more features into xdp making it more
and more like skb.

For containers in general, and for fast af_/xdp, we seem to have been
moving into netkit with queue leasing. Maybe that's something that
can help with your veth performance?
