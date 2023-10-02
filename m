Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B8F200D9
	for <llvm@lists.linux.dev>; Mon,  2 Oct 2023 20:29:46 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-690bd8f89baso142475b3a.2
        for <llvm@lists.linux.dev>; Mon, 02 Oct 2023 13:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696278586; x=1696883386; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l0WqvxjZPFgnTMVefi0EvUmMzg28kKmDEueowRCLoP8=;
        b=jzP5cfUNJqCoVGU7wMcwQ4lFNmq11pjH6jtdPVNuceNOf+IwU9SVyfZBA7Q/iZAAW9
         TPA8/fBm+ocMLH5j8GtWNIj8cWtNYRkJBUmjFwhriVnn3cCOHS9Ck2G9i+yZcaJHodHR
         4fa4E6fm73zoTuUWXU24VCzvUiUbZfW2tLtW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696278586; x=1696883386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0WqvxjZPFgnTMVefi0EvUmMzg28kKmDEueowRCLoP8=;
        b=vRmJV9hyjZoPa7LrCGiRBve6wE4eYm1opa2UjBuHwTtJVUjM+shNXhK7gF4SNrpplM
         hLXK/2OQbKPv2ZkpVjz7oiP1igk+et6jtA5gJq85Y61zJ1uKjGMXDHFpzAuAI/1/iIYX
         j4+QL8p5VAN0ptlvl8o8aPiafj1j144itfbFofGV213qwpa0WqejPWp6CMHcCJbR5WX1
         lTIH/u16VFXImVhKt+03A2sBoFH4KgkDWVdqFr3FjXVfqxyqlBgkmMSdHicVQKM0ozm+
         U3ZXIF5P8C1/PofAJcJvFb7uSuysYO8F08alGlvg60YxQiN6qAKywzFTw0oukrVaCGEA
         MDpg==
X-Gm-Message-State: AOJu0YxosjXjSRZ7uB/XfIOjdDESYwJycWgVOz2hcfRW9+O8qqmzAJu1
	FMu7+bbVWfCN1zRoFOC3Lq7llQ==
X-Google-Smtp-Source: AGHT+IH7EJAFcR/dE+fR2pl8ERxWFWJidFnQyrbZorlL1KyxD/iU349CYKdzcSGq8EAl/ms6FiBQWQ==
X-Received: by 2002:a05:6a21:35c4:b0:165:a34a:ce20 with SMTP id ba4-20020a056a2135c400b00165a34ace20mr1436405pzc.29.1696278585958;
        Mon, 02 Oct 2023 13:29:45 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id p23-20020a170902a41700b001c32fd9e412sm10598281plq.58.2023.10.02.13.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 13:29:45 -0700 (PDT)
Date: Mon, 2 Oct 2023 13:29:40 -0700
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
Message-ID: <202310021329.56BE32B19@keescook>
References: <20230922172449.work.906-kees@kernel.org>
 <202309270854.67756EAC2@keescook>
 <20231002112635.7daf13ef@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231002112635.7daf13ef@kernel.org>

On Mon, Oct 02, 2023 at 11:26:35AM -0700, Jakub Kicinski wrote:
> On Wed, 27 Sep 2023 08:57:36 -0700 Kees Cook wrote:
> > > Since the element count member must be set before accessing the annotated
> > > flexible array member, some patches also move the member's initialization
> > > earlier. (These are noted in the individual patches.)  
> > 
> > Hi, just checking on this batch of changes. Is it possible to take the
> > 1-13 subset:
> 
> On it, sorry for the delay.

No worries; thanks for grabbing them!

-- 
Kees Cook
