Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794785806;
	b=vedB++kLubzhjMisbbrYFrLVzUPDyuUaXzCP/Jrfux+zSUDcqcsDvHX+WDgIHlq9GuuP
	 jq9GGglHFPUo18Pg7vGrV0NVXWN0657fa1xbbmGakPnY7tMVQ3/t9gy44r8tHN8S3jSa6
	 aziMd2vrtWXLlCdO0KxiRpVrM3QAJ+garO452yx9AOaCNfx+oq7kdjtfhD92EOu5wbqhd
	 foq3BsYUjZX0IA4EXulDjmpYvZG57F7QznrQBrCERX9tBa0G5VKlTQFLEqjYnUSFjIrbl
	 tXgISWOoIEeedLiOtVWILf55kcy9fGGCWPkSmLYtwB0a47Icb7fJKNd8kKAljyyhpFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794785806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=eiEJgJLTePDasa4fCxlIDYNvy/YXg5RoYnLKMhW0V1k=;
	b=VASRkwV/B5YRd7V8zelxSqLeQxnXfEZM0qQJSPoHkt9lxtnu+6W+Nrzaj31YvQW61pEh
	 oaqACWo65CXulXB8DoHTRmSlXEAWphzZJYh5nvlsuLuSwOBDUz9WWb5rVGfCyQCpPoE7O
	 XrUXoVqvnVrhtNpujzS3mnvzxmzFS01eGi5qev0yuGXgt9d4Wpwlk52WeiLuNzSjrj0gZ
	 50wP70C6phCZnRowe7J51Quh3Iy1Aab5s9jmV+c45YAQSKeekFJ6KuG5hX44XC8MQrBnY
	 T5aoJ7TPYUIh7k+xuTuEoC8vqE6qReqXlO6vEIlKTKNmceviGWMYFckvlb4+VTmMT3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=T1SZRk9A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73857606A323
	for <llvm@lists.linux.dev>; Sun, 15 Nov 2026 23:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73857606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=T1SZRk9A
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso2558296eaf.1
        for <llvm@lists.linux.dev>; Sun, 15 Nov 2026 15:36:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794785805; cv=none;
        d=google.com; s=arc-20260327;
        b=gZU3nPWnizZGlqXXHSFGjMrXwP6TgvKigJVdUJ0Pt9WR+a/lqDmeY3RcUCelJx909y
         kYwUqpGk2/HNthkciSNPCVVRzpp9+5EEYgunHjyidcThcSj8jiSUPaqOupKkKL5TJ95U
         OxGPwGoOHkaxUrlk7U3W2tEVTD7A8Kgp5QKFtFTPUzsCwamhicd1LSZdn3Lf/qFlPcHc
         rJ7fvBJCSMPpc0AfPag1OnaZIpx7t3sANI5No176p2AWuFkCOQs2CmhTKpQPlUscTe/E
         CjnvacW56PWtK+4FFavU7NL8kWrwCdyozGNU+BZCIlJiyymnxvnYMb5gw1lA91aJVXpI
         xxhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eiEJgJLTePDasa4fCxlIDYNvy/YXg5RoYnLKMhW0V1k=;
        fh=v3aPdw/RFbRAfmrdQztXx1dvdz13s/i3yxurOATVN2w=;
        b=dcDCBJ3PvCbM9SNkUF2kAbi0rWCl0XeEC/fnmyrwJllBi4+bfZbdLHGw0Vfm7/VzcQ
         B+7GWdo6w40n3Sn3zpJGL7ktWUJDhnM3PDJCGz/U4w3o6tBhhwZ0yY3x0hjTbDygghBk
         BmQbjhicdP6+hz1vJiYgrUvF+MucLV7TXOVnvWnmelm2/Gg2AFop1gZpkMXg4dg+qjyo
         YRBVXEEwLPO39HGWUgSC1r3qPcgOlWdalSXoU+V7g/9sqJ7ZPzaPT56sr8tHAuAkjyh0
         VD4Vga0nxUJkLaWzjqLFYZM+WGEn5FEX08F0IWutzzNdGADhlx5c/PHspmv/ig7k+7Fw
         cVYQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794785805; x=1795390605; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eiEJgJLTePDasa4fCxlIDYNvy/YXg5RoYnLKMhW0V1k=;
        b=T1SZRk9ASqdUBxjr674bQkHmymgFUHKkjuAvvSXPEfu5nZ8uUkEizYMQoSWmhA4ha1
         834a4Fa3UOpUxpquGb+2jignSOFUWQTdH89udQSdSj4hLHhy1M8FMU2r9rYoLcTOOddF
         TPJ0nzSfRmquhlBiyTh9Ji30I18W05uzb+IphLW0nc1h5eQaNMQz9rgUn2ThUjQfEYWh
         9278lTFjFr37gsSzoNAnwU072ZUeUPXTceWalwpbOwN64JdQNe4/w9Q4PN/sPyUji703
         GBzTyzTmt2k+4tXCuDU0iAad67YjZE4wHa67dLFtZ47gdLlEsLXwDYM+c49zBoU13Pk3
         Cf4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794785805; x=1795390605;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eiEJgJLTePDasa4fCxlIDYNvy/YXg5RoYnLKMhW0V1k=;
        b=OQyfoP8dZGTw/ac62Rztk1HtvBhEvFwVfUooOh0meucMTmqIpVxlncCovU28sAPMJ3
         37pwQPWlBdWhxMEM27Rj48eL+kmEV009LbaCNsaaJL4Fj5oc4iasUrUIMuJKzqKdYDK7
         m+AjSLfVuckJQ72a+0HYJ759OblZLNXBCHwbHTANytuXru4rrQooAu08eGvS6/LAxHYH
         eZZo03JG1FauKljT7HMzbR1NJpSgJonDJ+nM2Uj3diWpZIL1RM7VOlZNJE5F9y6N55Ae
         UuZCHbNm3Q3nkSI7AJ8zr7MddVpV9lwm3APs32bZ0yGicbQqDIj8hVdV59bgKBDLIF76
         H+ZQ==
X-Forwarded-Encrypted: i=1; AL+hErF4DK0SBe/nipAI3c0qFmN5w7iM5OMQ5iMGkkhwatm6Dh2R1m14VGJdgTmJOCxPszs48joQ@lists.linux.dev
X-Gm-Message-State: APuU4Z+QzgSbK2AVujC1PkRXZv0wM3jW0cmLkQadnCRfrxOoKiwpYKHN
	XS3z72Pd2X1JpqpTc0arUWaabSGoRtdjYShE+czeum8dAPoTxNs/vSM5R5dn0DeKsiNxxYR+VVB
	3E2b7m0n3SkWrIYTHWsQ04wAoj+fbkFh1PkE/HOSuLA==
X-Gm-Gg: AYBFou1gtCMOgdAu7O9J0jlkD2dU/J5ReVRh5AaZWqnq3JQwGkRw9E/35Gte8+bB6Mc
	ucek3WUPzQawIkxsplQfGhoa50jVFFHweNS7p+0MtvmsBj6ysoMwUQdDvbIrljF0r2NVXIiZyS9
	cOOEPw65U5TuO1ZdaL0jcKosUaPhD5d7sPZdnSZU/t1byGEA1b1s/qJxXkyDAh22DgB5c+MCvtE
	50D1wVe7oZ+p7vFK0tZks49fnRq6oA84C+UTWpMcgna3fjPzPTe+fg6276vzsFoTs4vvFIR4nQI
	EdKiXwSVpnDdO5s6Pi4JdTBe33B7AssOgtj1T/hY38e8AcBz4HIeSyy1RrTBzqoBusc9mxoCJ1z
	TD4mBvHtNcXOyXxZZDd+PYz1mGPs4nSRSSiYlUp45BqXPG65EjXVeNHy4LxnndmfUUCQHl+TO1f
	1cQLPBxK5ylXs2spmdht59wbTPmcup8rI=
X-Received: by 2002:a05:6820:3411:20b0:71a:f794:49af with SMTP id
 006d021491bc7-71af7944afamr223598eaf.56.1794785805311; Sun, 15 Nov 2026
 15:36:45 -0800 (PST)
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
 <CAG4wq-egD55NZDw+OKVKTKN2tQJ9oKEC504wFv=xoMXyJ-0z4g@mail.gmail.com> <20261115113902.4834dda6@kernel.org>
In-Reply-To: <20261115113902.4834dda6@kernel.org>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Sun, 15 Nov 2026 23:36:34 +0000
X-Gm-Features: AclHuK-Ta2Fkr4hOVhZX_y8Xr7mXxa9_sbD5R_U1pL1RP64y3ME0zGRwgXOH1aQ
Message-ID: <CAG4wq-dhd5a5zxQcSShaKifYd2z+pMpHaCYtZJRX1QCxEH4dfg@mail.gmail.com>
Subject: Re: [PATCH bpf-next 00/15] xdp: add SKB core extensions to keep RX
 metadata until skb creation
To: Jakub Kicinski <kuba@kernel.org>
Cc: Stanislav Fomichev <sdf.kernel@gmail.com>, bpf@vger.kernel.org, netdev@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Vladimir Vdovin <deliran@verdict.gg>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
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
	llvm@lists.linux.dev, kernel-team@cloudflare.com, 
	Tianyi Gao <tianyi.gao@linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sun, 15 Nov 2026 11:39:02 -0800 Jakub Kicinski wrote:
> On Wed, 11 Nov 2026 01:07:46 +0000 Tianyi Gao wrote:
> > - On veth, an XDP program removes software GSO from the peer, limits
> >   its MTU, and can copy skbs from the peer.
>
> Could you remind us why you XDP_REDIRECT xdp_frames to the veth
> if you end up allocating the skb on the veth, anyway?
>
> I thought that was to let veth run its own prog before skb is allocated
> but you're saying that you want to avoid veth having a prog, so clearly
> it's not that.

Thank you for your comment!

XDP_REDIRECT into a veth without a program on it has been supported
since commit 0e672f306a28 ("veth: check for NAPI instead of xdp_prog
before xmit of XDP frame"). There is demand for it [1].

With or without a program on the veth, and on cpumap, this series
keeps the RX metadata from the NIC until the skb is built.

[1] https://lore.kernel.org/all/20210416175929.35c3c389@carbon/

Thanks,
Tianyi
