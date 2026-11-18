Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794962590;
	b=Omitfy1LMOAOt8GkwTd7+tb9pC7ny6n1vCM/vMArqFmqaK8IlhkWDjZS8AtlVcVzLPCc
	 bkkztDHwLYUwFwlUeGJBnAzVpuZfm59cRPanANXs5rG3IYLG1P5xn7Bnu/oTC4TmR+UvH
	 as/RaLuGPsgnWZApayYx/8rHJOvxLmMT0vFofioRJKXsmnzm/2ktwEmm5FhpVHz0R48Or
	 +vbHz4lEQGymbWSzqmiDLn5YxWRo2RvG/4CxrH7y8V85VLSiIKtLBnG+oxbvrrAqrtom1
	 0o/0WQoGX41W6zTLJ34VZTAoPK6zDd+0ZEuhYPfl27jgph3OINd2dVoGZWybqSZyYXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794962590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=puGtQjs5QpcXV8o0ei3pWVAJkBqePYnUROGDguXC5No=;
	b=U4n6yorjmcPUCr5XzdKlUa36uO2Zpwqt5J9mzIHsEfsLUDbxMGlKHeVA16u5iN6a7aJ9
	 JLx/qsjiSPy/TcWG3MR9UNk8hPl/hrV5J5RK3U2Y8khLnBbHUN3E80UVwNR4ZitazGgyz
	 VctLNORYDtbMhun4YCl+HnPi/8OdC8VTE9wKAVcr1dZFgXxYwzEkqi/A/fpnoj/Tlb42F
	 NI+DYGkaqr7VcoIs9czvVZruRXFbOAon8yhYZNitdI/MGvdMwuby5BL21cMSNT2FNh5uI
	 HFqyg9m388Bb0KnqrskyWO6WNFctR0NicWlYUS2dbDX1Wm+7yQO4GrFJfj8Na29rGxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=eoN5Y5UE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCCC606A33F
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 00:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BCCC606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=eoN5Y5UE
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-43bf9548df4so415021fac.0
        for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 16:43:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794962586; cv=none;
        d=google.com; s=arc-20260327;
        b=GblDqEJpDmrW5gwF3fjD5i3yOarb1dmWHXObHfXOVkrM6/GK3gbD7okxUi5+45YPcX
         jbtO3CTIqZ8KwJ7LNr+Z2sPXaNIScttIGB6Q6KMiwHln+UsFx6OsU38tzKeXOa9i4nyH
         /CZ3RlGYzbH2WbFaDDP/IYPfk3WBXYw1LToYz6nE9lq0Z9agIjAYqI9FSh8ZblCAqelL
         cvRkvRDtSMUqEIUjyyGCv9wDJsmH/YKMEcmRkPWbB0W/vOjQiNKWXNNIHcYYc22Agz/w
         xnNmka+VFz6x7qkVhGMWbq9vTdwmwmZPh4CBtoNKEvEzxhpkzf5Owrc9L1ml/w3Qods6
         e2Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=puGtQjs5QpcXV8o0ei3pWVAJkBqePYnUROGDguXC5No=;
        fh=qngGlSOxq7MQnfqsHZrvc+S/fCCDpAvtUGNeLwrd2Ms=;
        b=P/WGxnyca4crDH1SAAWfc+LZrWYilUOgHeA67d7EjCtnt5VedkmSkm8IwqgEYb+EJd
         6MCpR8M/CfPAtbmpxLCv3dJnZbDSej8APbP7KU3sZ+iK6l+gqHpw8XQWm87MFwUAUHG4
         Lt1GvQGMkvZtpc1zwx7okKpukYh5u2RBU5+CLaWNtiu4IL9shqfJe+jO5LYURrTHuyX9
         oovQbLmIxaT7Y2YbvdOnU+wQ9b6vsNfcDX2G7rLNdRw+cak9dI7WUuidnHerD+lRTs78
         ooWmoLacXj9PJMKXgdnfMtWs6BgY9Muc2ofzz5KaZTkwLMKXFqpk0oh0aKoFIfQ/xT42
         CNlw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794962586; x=1795567386; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=puGtQjs5QpcXV8o0ei3pWVAJkBqePYnUROGDguXC5No=;
        b=eoN5Y5UECncTzx6UB+yHF/wb4JzU2tQXp3oymLqf6z0cZvjsE11PRDb7Iowuef3DVe
         AhIJIh5sHzx16Lrhr5PkURc2xABfEXrP1irenQngVQcebkKeM42qIdooW7Jdce/fFgV4
         /VPUlb3t9ylTbzHOi9ZTa6F/rp3AHw3cMHx3GUchGK20kSsHlC3IRDQQ1mSxTwoeg8eC
         XencA9UAzYFLd0vna8g7EEoLs3ZMdrnX9FrGTMEvFST2rdqZ2RgEGzP43wVeUVRDnQ+a
         4BacsS2wf3V3GW1Wn8xhVSY9Ux7rnCsJgC5lYHkoUpZlp55WC0dc1NbtIvznOrP9kjm7
         /nmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794962586; x=1795567386;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=puGtQjs5QpcXV8o0ei3pWVAJkBqePYnUROGDguXC5No=;
        b=ItlQy5igzLf166nfHoyOtOoGJERJNHGXHncQOzJkzA54BQzkYtFPqUZdsVdBoe3B4I
         p5I2OjKGMGsn7jlIZ037PXHt1BtRTvi+Mk5Jesr8NgbqwDVR6q9Rp8LDnepmKqqa0GhW
         gSMKcqNNIst0fW9d7ZxmUB3aX90T29ahnyyHTVi+x59/GoxgZmHF0F7k7sxpcVpSy1Gy
         snUH84qsxLmRilf9akSN4uK4WSCYTzjgorWv1fHOEL9I/JycvUp39GAhYan3b2n21WLP
         +cB91VBj/Wisr1m+04Jtdv2aHu0/hkcFwfZ0aEF7bk+WWXpYz+euDsnsM8sc/NBonqPi
         w7zg==
X-Forwarded-Encrypted: i=1; AL+hErFd26yW+pffDQjzmcT/8F+pm55ohdXSMIZyHry3bd321MvMUOJQJJxqTt5h3b/TPyc138YW@lists.linux.dev
X-Gm-Message-State: APuU4Z/8nXRt7vx9JD2OKik9Lx6Nva00SVM7nYIuQg5faRCI/2pR6fRu
	Sj4NKPTDv0apF6gQwYNoChhdwBtPnkHo46EZDck2gq02SWM8XoycmF1TDAKi7KhAIGz+63cMYY5
	1vTINsSLevne2DTJmhyN3ATC4LAUQoWKx/xjWateERA==
X-Gm-Gg: AYBFou1+nl1aV/Osas8nU1W/bFFq6vIJ6U8QX5CLZokuHzpYmvjePFEGhyxmHyeTIoJ
	6Qooo3oh+UB9AIRhk7ZkXHy0j+pJMWdELmBMfjUQyg+ZDrvDrR0kt20nT4bp4t7sOsXUHMLsJzF
	r1ZOrkoVR/KYofAGvVOXrSM9Zks8ApO6nWh1Bj5pbXs2S0kta+TINBnFkKTgLzMKrJm6a8CX7Qi
	+Ky3quDf4QquuflhzhUECMhBvYW4liKieaC3h0c82HUARxz5aLtPMWZfeBiFJ9ZtXwMlzdsNrhe
	UCu65oVcLjpF265M6OQ+icmwpjh/V9W69JCopw5ZSGX23JZLclsXAnPoqLOiGeNDIihGVnJAERz
	CCywiKy5uvZy6YmHeuFSVvPsOndj4Nl+kfRi0kVMgvHaUHhBEsYYZs8sGngjuPJdNEHPXabSOp/
	rsK2bHGNELKQ==
X-Received: by 2002:a05:6871:b11:b0:491:47e1:6280 with SMTP id
 586e51a60fabf-4b75bb74ec7mr770348fac.15.1794962586147; Tue, 17 Nov 2026
 16:43:06 -0800 (PST)
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
 <CAG4wq-egD55NZDw+OKVKTKN2tQJ9oKEC504wFv=xoMXyJ-0z4g@mail.gmail.com>
 <20261115113902.4834dda6@kernel.org> <CAG4wq-dhd5a5zxQcSShaKifYd2z+pMpHaCYtZJRX1QCxEH4dfg@mail.gmail.com>
 <20261116142710.347e8571@kernel.org> <CAG4wq-cDYa2GkpWSYeOLwEPv45BtucZk+r=N2b1Srd=gUUO4MQ@mail.gmail.com>
 <20261117161856.6f6c2ce9@kernel.org>
In-Reply-To: <20261117161856.6f6c2ce9@kernel.org>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Wed, 18 Nov 2026 00:42:55 +0000
X-Gm-Features: Aa3M54r-Qn1bATmm01-LGWkLr4tuoSPVNlK5FfS3xcLFtqloul4EQ0s5CX5Sq4I
Message-ID: <CAG4wq-cQVUJgizeowhr4s4Z2Q_o0_dWfAwzXthpBATBB-7edLQ@mail.gmail.com>
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

Hi Jakub,

Thank you so much. I am really grateful for your comments, and for
spelling out your views on this problem. I learnt a lot.

I would like to share how I see the problem. I understand that you
want the setters to mirror the existing getters, so that the metadata
stays with the driver. But I see a fundamental mismatch between
reading and writing the RX metadata:

- To read it, we must go through the driver callbacks, because each
  driver keeps it in its own descriptor format.

- To write it, the target is always the xdp_frame or the skb, and
  both are the same for every driver.

So to me it is natural to set it all at once in one helper function.
This also makes it much easier to support a new driver than
implementing three callbacks in each one.

Overall, I feel this has turned into a deeper difference in design
direction. The same question has come up in several earlier series
too. I will discuss it with Jesper, and we will come back to this in
the near future.

Thanks,
Tianyi
