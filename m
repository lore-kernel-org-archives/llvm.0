Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C5C111AB
	for <llvm@lists.linux.dev>; Wed, 27 Sep 2023 15:57:38 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3af609c3e74so308533b6e.2
        for <llvm@lists.linux.dev>; Wed, 27 Sep 2023 08:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695830257; x=1696435057; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U12JJAnjiahk1YYSHY2AOK7uoafy6UzrARbQWR95I14=;
        b=cx/gWELnucpFTgkZ8Q7fG2VSGF3eE2COxN11yyRmZWIEAJu94AweEfbEK+I9M7nPkB
         lSXRsrrCSResJ4qaG2Qd8zlVwoKTrL3vYgN6Gleyn+sYa6p66Int32b0sIIR1k8+0o89
         xu4JNHJSV8P6tuj63Ovn1bcxuoeE7L234qCTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695830257; x=1696435057;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U12JJAnjiahk1YYSHY2AOK7uoafy6UzrARbQWR95I14=;
        b=ebw4WOS4qvDAZQdnaZUV//Rg0kQ6lejui1IRW9yXAmF1r/hMcUwndrgX1Po9BI6h27
         d4y/3937bUG/D9H4kgerIdvd/QA+OtuE+AugQZSL6OjnL0vhTzoi93VnUNF9QhW/N4EE
         KeC2RsVpO+BGCdueY7Iw2WAu9hh5iR/JO6RFi0w4Y5BEAFrf2tnUD0rd+tUJwazlbxdg
         MhHZszb38xev0P9RvBa2sldmk+zzsOp3/qr3e0ohR04ByVYYC51ZeRVmU+KVjJRB7yDa
         D+CwbDPAoYYVKNVt2m0/GNAu8x0DuC0v/KbkO6qkI17v7x21R0cxBb48VNaexjPeNnqw
         sOSw==
X-Gm-Message-State: AOJu0YzXZwcmuwd3vnvMZj88mOtbMtJ4lQQw2TwPRH5+4k3D1e9vM9Ao
	T33tpdg8+pXp5zjrmR6gINcBVA==
X-Google-Smtp-Source: AGHT+IEwJW0cXq1CpxTK5Y460G4lfkt5QpcCMRT3yT0/yChvW5lXfO7XfXAcPyN2gr3gGMerxBJmgQ==
X-Received: by 2002:a05:6808:1807:b0:3a0:5e17:4311 with SMTP id bh7-20020a056808180700b003a05e174311mr2931489oib.5.1695830257420;
        Wed, 27 Sep 2023 08:57:37 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id bf25-20020a056a000d9900b00690ca4356f1sm11628516pfb.198.2023.09.27.08.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 08:57:36 -0700 (PDT)
Date: Wed, 27 Sep 2023 08:57:36 -0700
From: Kees Cook <keescook@chromium.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Yisen Zhuang <yisen.zhuang@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Ajay Sharma <sharmaajay@microsoft.com>,
	Alex Elder <elder@kernel.org>, Pravin B Shelar <pshelar@ovn.org>,
	Shaokun Zhang <zhangshaokun@hisilicon.com>,
	Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org,
	dev@openvswitch.org, linux-parisc@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 00/14] Batch 1: Annotate structs with __counted_by
Message-ID: <202309270854.67756EAC2@keescook>
References: <20230922172449.work.906-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230922172449.work.906-kees@kernel.org>

On Fri, Sep 22, 2023 at 10:28:42AM -0700, Kees Cook wrote:
> This is the batch 1 of patches touching netdev for preparing for
> the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by to structs that would
> benefit from the annotation.
> 
> Since the element count member must be set before accessing the annotated
> flexible array member, some patches also move the member's initialization
> earlier. (These are noted in the individual patches.)

Hi, just checking on this batch of changes. Is it possible to take the
1-13 subset:

> Kees Cook (14):
>   ipv4: Annotate struct fib_info with __counted_by
>   ipv4/igmp: Annotate struct ip_sf_socklist with __counted_by
>   ipv6: Annotate struct ip6_sf_socklist with __counted_by
>   net: hns: Annotate struct ppe_common_cb with __counted_by
>   net: enetc: Annotate struct enetc_int_vector with __counted_by
>   net: hisilicon: Annotate struct rcb_common_cb with __counted_by
>   net: mana: Annotate struct mana_rxq with __counted_by
>   net: ipa: Annotate struct ipa_power with __counted_by
>   net: mana: Annotate struct hwc_dma_buf with __counted_by
>   net: openvswitch: Annotate struct dp_meter_instance with __counted_by
>   net: enetc: Annotate struct enetc_psfp_gate with __counted_by
>   net: openvswitch: Annotate struct dp_meter with __counted_by
>   net: tulip: Annotate struct mediatable with __counted_by

I'll respin 14 and add it to the next batch:

>   net: sched: Annotate struct tc_pedit with __counted_by

After these 13, there are  32 more patches to various drivers and
protocols...

Thanks!

-Kees

-- 
Kees Cook
