Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3421C1FAA
	for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 00:57:27 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id k9so5447372ils.12
        for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 17:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=3FYZZ9kIkwc/JXTwVRSMlvQxtVggGrYH2HuC/wMgOdI=;
        b=NYFdQ/VJ7Ustan9+kh9NBj5xKkAcAprM+EvkVz+OEu9s2jc6odB1P1d9eCn3LB1BSF
         HVwiHNCWN9cjxHJmBFkuGDtng69dDzlhKuC2jwgo4GQZxAVPJBs8HWj0t+V1LaxAxs0h
         fFzq8E+L/Iwynedl8mokiGkDK8GhKaqxYO4+06Qzopn3UqEYs4e3QSLI98/TP93vRhnH
         p/3tjR4/o30yQRI+pgkK66f9TPe2ty2CUVfUKB9vVPaN12bYG5fpQzr1r6zU60mkOa4r
         tHT7faSnWb7dT6wgasw41T4hZHlyYGkxCRjjtSc6R2brP983LSm90ZpydP1mFqjapNg4
         x0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=3FYZZ9kIkwc/JXTwVRSMlvQxtVggGrYH2HuC/wMgOdI=;
        b=HWFjgLvK3Y9O6iTLQ3V4ZYEafQ1Jnu0rAAglqMtnF4qP7CgRoDPNjZ1uQPCTR1Birl
         XOOtFd+Vdw14g/gCAxTrpVnaLyL8u2LKqu7T0ZLEzjHw04DvdFrdiathJ15A+YBH8uuz
         qKRTmjS6qwg8IfII+g8JIYUum2hhK6RS8DaUJpx/20vZ0Hzpsl2/V6o72LumXmV8H0bu
         GPbF6WBdttxY6LxRlHypWwj23T3KkNYWzwOLXTOqXygyXC0HYk/SqUEDIlJt07Ue7A/V
         29VgMW42XCtoF2qV9PlCJ5SFnC9rJDIFFn0SjMZClt3rytwsABMa6+gUwJWyTlZI5F/i
         0rVA==
X-Gm-Message-State: ACgBeo1zYIsIfW5+NjApXrf1uMZJavjBFNMbYVRmXFFewm4ucEOBK7CD
	l5RcrILpkXciKdPNdn2gHe+AmTIXQp6IyVmra5U=
X-Google-Smtp-Source: AA6agR6SJcFGOPeHNpTXOJTMM+Xw4YyKLch0Jy65glm5EtFs0KwR0qKARwrTjxI1ZMWWuta6h3Fz3P1HYwtmdRzoY7o=
X-Received: by 2002:a92:ca0b:0:b0:2f1:da1d:c229 with SMTP id
 j11-20020a92ca0b000000b002f1da1dc229mr12079489ils.145.1663030646372; Mon, 12
 Sep 2022 17:57:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220912214510.929070-1-nhuck@google.com>
In-Reply-To: <20220912214510.929070-1-nhuck@google.com>
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Date: Tue, 13 Sep 2022 03:57:17 +0300
Message-ID: <CAHNKnsQFdd6uuqYfYcwLRY_RViOFWoT_mSK7v6sb02LeNvY5WQ@mail.gmail.com>
Subject: Re: [PATCH] net: wwan: t7xx: Fix return type of t7xx_ccmni_start_xmit
To: Nathan Huckleberry <nhuck@google.com>
Cc: Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev, 
	Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>, Intel Corporation <linuxwwan@intel.com>, 
	Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>, Liu Haijun <haijun.liu@mediatek.com>, 
	M Chetan Kumar <m.chetan.kumar@linux.intel.com>, 
	Ricardo Martinez <ricardo.martinez@linux.intel.com>, Loic Poulain <loic.poulain@linaro.org>, 
	Johannes Berg <johannes@sipsolutions.net>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 13, 2022 at 12:45 AM Nathan Huckleberry <nhuck@google.com> wrote:
> The ndo_start_xmit field in net_device_ops is expected to be of type
> netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).
>
> The mismatched return type breaks forward edge kCFI since the underlying
> function definition does not match the function hook definition.
>
> The return type of t7xx_ccmni_start_xmit should be changed from int to
> netdev_tx_t.
>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1703
> Cc: llvm@lists.linux.dev
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>

Acked-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>
