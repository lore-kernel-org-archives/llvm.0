Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794495328;
	b=gCMbtQA+JMI0GkF+DtaiwerFjOUNpaPGb/+efgtzAASLfgbk4/aXDQi4mMGZM6rOWrRj
	 fiOJVXPZsF+jTi7YnGguyIlkt0ugNp2FHpfvnlS8UFPUHKDer3PndUR78HjSOLbvoLvcY
	 MsByZXO6s3cPebi7IqOywIdz4Urp2x8bZFMOXjbd8tA5TsONiq2lsRa2nk919lLAmdXxD
	 qGCtt3ANMORtobRqhFKeH/WLDmVtnffHm1t5AWGBlfMUU030WD2jcXy91N1C3QoddIFGZ
	 eJS3yPQbh2W3WYiFkCf9mqWEcpo6SPVS+AsQmtz37cuf8Uh87mC3Ea5S6XT99Ezak8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=vwPTmyMvNhiyDg4UslxzJuuKVfCT6YaQluFzq5V0j6g=;
	b=VVQOw2tKhEKVRgmWS+VNerQGJyQDjAi245J3wUI1m/gmmQZT0gGVc4lN1BK76yn1/b0r
	 j0r8r9gCtu9m6tO1i2SP4mRO7CMO1fJZwHo1P6tGzSqyTaDWoARr1Iv27+GJ0nHZCdfs1
	 Ojk0LA8hhdlOmkHQEjEMv1x7LmKSRGI3Af5WKjDW/rg5Yqp96lpwrS1PgRMXyYAJgXqIC
	 rSUnI/KcKS418grs5EcmH11I7dwJFghO0Bp1kYQemk8eGDhqbkg148cis2bcOq7Yloi/w
	 o9nA9YqnC/xJGVZFS3NsoP6qLgAIls4yJGxajN9GBqjNHG3Kih6GtB6tlNRApRzcMfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=A1AXTyo2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771B7606A321
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 14:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 771B7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=A1AXTyo2
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-706113e92f9so2474896eaf.2
        for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 06:55:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794495327; cv=none;
        d=google.com; s=arc-20260327;
        b=By9O+t00cL76dVDQbRgtSkNfS7jJO7Wl6u9AWdSD2nS9mtHJPjoKdFd0LPDQkDcZgs
         CV04R/298LhJtTq8Lh326l4TlW3DGfvHVOPzUdYkVOcYVzlV4VePS+uGUxgk5HIlcY16
         /dUPLYuonu8fESjeXbM21R4XhvB5SysGKvTES78QzZl8nMtHPAu0HJjUwYXnGXNaaUHG
         M+Gwtij8hg5c8r3YZferCuvTfn3Rj+xsY0VaaC9SlfKImkJqbVKMQ2SkzezHqlZeBSBJ
         yl68ckrP27wDpbmhYVZYhTV29iMgcXcj3qo4JN3FzyrCQ3Yq0DAZ836dDy6vqt3CGH8v
         VUYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vwPTmyMvNhiyDg4UslxzJuuKVfCT6YaQluFzq5V0j6g=;
        fh=ER9RLfGnGv75wzIuwsFdZK4K8zUBw7JKyGKb9km/mc8=;
        b=X/+QJqwLXDahnJIEh3glqZYZ9VMD4vKXK+oDcPZcl8PBrueogbvfLekxb2bARvKi5C
         LWY2Bea/7UX4NtQPb8cykGPIQIrYUPyv8efdITVfZbjd5kZfAClDjaFGaV8X7smBRmjL
         /p5ZjueP+cg0exD++7MS0xnf85JkEJ7mjwCoD5Jay5ilP9hwlAkCxscx5zdNgAW7q6QQ
         p/iS53gEjpPaLzGMEILnMsjGMOcUJCcref5ww/PmlW8ar7beQH13VlwZquK6+CgSbncc
         aIxzbwqaK2tLNegF3oWk858o+TuDjDTFy4Hit9nJ17Vl3zrEZCyduRa6/jAfcRSL092s
         proQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794495327; x=1795100127; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vwPTmyMvNhiyDg4UslxzJuuKVfCT6YaQluFzq5V0j6g=;
        b=A1AXTyo2x5bc+OKdS6vO6VVW2lQIHdiDWs6f+YiFs8w3bjbIue/1S8dDvwseyGopXG
         ze1tpuUvF8KZRfEtVBAdpB4lr+FULuQ2o1l8HSyisSbdD21VrD8XYBmQRuy9xJLhniOE
         BwxP+8NKUV0RH+9II/qd2ogrFOEhZs7VSCY4nMxZyojKK7pyk0lnZKpJY0fhP8+6dUKE
         4q6LTHqn5+1zQ/dk0qq2v26jyh3K7NoUL2WxmkF9ohsho9XHVf5ZRG7TAb7tp0F8Mduh
         01z5GTg5/7nkVR+6QryT0PxPMDnDbognNLVWTCG1OQxn4+ZfEqDo7rH1aHvUmavc3OqC
         wacg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794495327; x=1795100127;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vwPTmyMvNhiyDg4UslxzJuuKVfCT6YaQluFzq5V0j6g=;
        b=UeYJcv/26bBaHEAiKA/uUOboubkFncAP4yIJn/AI5KSz8S1PpTF2yaPX+D8yffQhZd
         Y+kJDMOLh1GrkG1ty62W29l/cyADHq25Qe7nBNaw8wuUFJNwpf/gvn3CDXx5P9nIAiNS
         uHF2LBWGlZ3t1T8hpCGf4swScHz51hPtSv1sGhhdNUbdNhVW+mZ7/hGfA+M4DkiWSQZk
         X5veSC4ThOdtElrOXgcXb0nG9Z1nS62RKrTnduJ5HBsXkcpb01lqnqJCCzkGrfIk82WV
         RcQQEZ+xyW63JpLnYZ9hQ/bQTOn9WS2qOVwTzo7fOx+40GbCBAB2OLdJboNeagHVBvDG
         xQFQ==
X-Forwarded-Encrypted: i=1; AL+hErF4MBBeEyBbEij+nijtk6GFHL+l54yiBRHInz8FoS5BL+mJJt7QS7EQ9a0yQJg7AkIyS/oJ@lists.linux.dev
X-Gm-Message-State: APuU4Z+eSeceP7OKkT/TnLQ2EmnQ8fZerzUEjuK/VGU3tWgoSgphevGE
	TSzWyPLcunF9xKCRBqOd2EOHc5jl39/J+KKAuOIgzhzSPRAdX2bi1GYed5AMqsCJn+RPrK2ZS1i
	QSsYP2XO9nV4qIkm9Bm4wkUEv2jdaalEBlTV1khRKcg==
X-Gm-Gg: AYBFou1/vdif9JiYvqgKc79nc3WIsXAyLCsfWYlbKvydnXI/sAR5hdH/ycuRB0smQS/
	BC4AICi5xVVRjcn7N6CTyMTYl+PBTKSFhlg9zMyWWqhcAX0O5JGLrHxoAYTuHqILsmESdhjk+hD
	LftG1iXsKsGT9ZnnZdlI7BjVsNgF7nJ9afoOdBOuM6CtALm1zcVgyaIGf/iGIeXtDzBLsX/ZOSr
	GNFum4niZGv7l+AVsH41JgP6Ymb/v+oaA30hhd3lESCtX4AWsO918SfLB8BFsEJZB/7t3vvH0jC
	psuXsZJVKBG2Vevq4qevGbpQMO3dZJ7PG7Zc+G0pCg7YsWjTOiUYN+7kwHyo+JlDF4/HwmjwVsc
	sv5uOsAVewMoQFznCTmxCA39orMjsMl0KdJcgOMNfgUEcdZlLpnx7+OaQ0yKgy5uiH8VFb2xZaZ
	qoWkV6QSwzMQ==
X-Received: by 2002:a05:6820:a50f:20b0:716:bb4f:9d1c with SMTP id
 006d021491bc7-719179b52cdmr2435932eaf.70.1794495327350; Thu, 12 Nov 2026
 06:55:27 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1794281983.git.tianyi@cloudflare.com> <DMST78XBB2RK.2BKP3O07GEWZQ@gmail.com>
In-Reply-To: <DMST78XBB2RK.2BKP3O07GEWZQ@gmail.com>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Thu, 12 Nov 2026 14:55:16 +0000
X-Gm-Features: AclHuK_osBWVQK63DcE7gK81kaRbLSav5BXe8bL_6Bp3W1Mewum9RV7hacJBHqc
Message-ID: <CAG4wq-cXJtTzG2GO9KTL04b=prS+X67fRBJ=nriOO0G-24Rjzw@mail.gmail.com>
Subject: Re: [PATCH bpf-next 00/15] xdp: add SKB core extensions to keep RX
 metadata until skb creation
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf@vger.kernel.org, netdev@vger.kernel.org, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Jakub Kicinski <kuba@kernel.org>, 
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
	llvm@lists.linux.dev, kernel-team@cloudflare.com
Content-Type: text/plain; charset="UTF-8"

Hi Alexei,

On Thu, 12 Nov 2026 00:34:54 +0000, Alexei Starovoitov wrote:
> I'm with Stan on this. It looks heavy.
>
> How about the following idea:

Thank you very much for the patch and the idea. I really appreciate it!

v1 uses the skb_ext-like layout mainly because of the earlier pushback
on a fixed struct [1][2]. This series adds only the three most commonly
needed types of RX metadata. A 12-byte fixed struct that takes headroom
only when any RX metadata is stored can be a reasonable middle ground.

I would like to hear from Jesper and Jakub before I move to v2.

Thanks,
Tianyi

[1] https://lore.kernel.org/all/20250805172831.213ddd8d@kernel.org/
[2] https://lore.kernel.org/all/1d5521eb-84fc-4417-a3f5-6366694d160a@kernel.org/
