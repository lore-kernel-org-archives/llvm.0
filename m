Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458133C3B
	for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 20:47:50 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id ml1so10228669qvb.1
        for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 13:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=sIW0jOj9f2zyE3XbbwArWS7yU2vU8DbR4RLobl61rlE=;
        b=W19uCO3pR1SMidtgHfI2O4k1qUJbea2ZLFaTiP0KGphrTeFlMLoWfLAqyba3T3gqeF
         dEFpxJsRqVtLXCtxqDzQAOGCVN0Yxq4ZqfxC/qRxDbdfDrlqUH1Bzl2ojo47NXaGoq4h
         oPGH9U3AupA0OVh9Ugk6917bb3ZPxCvjl2KRub1j+Gli78hK7lPmGJINicWKftGyVqsr
         Zk2rd/A2eL7/uqErExT8IoUOuj2yGO3M5HRHEGOtnkstq2NN5cHkAZ/lSd6R8ofmo9wH
         V9Vopl3ru4YRwy7gadCWVvNzNpIZJ/mqCBp03s5dEzKgccIJ1lcAz9BuW9po56qg4bz5
         WxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=sIW0jOj9f2zyE3XbbwArWS7yU2vU8DbR4RLobl61rlE=;
        b=6ZwZ1c/rr7eyIc/yrsJ/cPg0RQ7DfsBlabbPjnjpU7YNKC/tjxuwmeqn48qUUL+cdO
         RAHkgwgP/E6Q2xUPhYSq9s5e103Emfhr9siEZ3PntxyofnDpXL4iymsrJWe4yXjJDDbG
         e4Twi0XUFJ1Mc1P1pgK1KrJ0qLBThDGh3RsojFyC1SjLVEEmZILrrNK5fTrhh7BM3iG1
         cjrB/izl79oKtVRJlMSgxuKnLzfC0ae7Pl0Ydbt1Ozz0K1tvhQ1X7aF3dLy6gU7dGXkH
         +XssEjwPmjcnI6d7UV1kYcLaC107QuhpPOkp/3RoaDYHVoybCeOKhGEjQf0LW+CdcQ6p
         AGeg==
X-Gm-Message-State: ACgBeo2PTlxlEdB5B8XqAEM4FkXj/oqvyuTNYvSjxC5qtTVcmY/h9UIy
	qbkOiN2DkrosAoxq+WsqLMQ9aEqx8W4di9KY/8ymxg==
X-Google-Smtp-Source: AA6agR6xLK8C4qJdigsd8yEHH+TKpLgN5MT9yfh5GJuDfSkVGSo1vafy06eImNkjtngmdW4n+PDEfxLUFOM32v1oeZA=
X-Received: by 2002:ad4:5ce9:0:b0:49f:ee02:50c7 with SMTP id
 iv9-20020ad45ce9000000b0049fee0250c7mr28733575qvb.105.1663102069229; Tue, 13
 Sep 2022 13:47:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220912214432.928989-1-nhuck@google.com> <20220913081548.gmngjwuagbt63j7h@wse-c0155>
In-Reply-To: <20220913081548.gmngjwuagbt63j7h@wse-c0155>
From: Nathan Huckleberry <nhuck@google.com>
Date: Tue, 13 Sep 2022 13:46:00 -0700
Message-ID: <CAJkfWY7dGXV=YPaCKqZ0YguRGTN2JA+n9jyVWk8LPj3dgtC=tA@mail.gmail.com>
Subject: Re: [PATCH] net: sparx5: Fix return type of sparx5_port_xmit_impl
To: Casper Andersson <casper.casan@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Lars Povlsen <lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	UNGLinuxDriver@microchip.com, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hey Casper,

On Tue, Sep 13, 2022 at 1:15 AM Casper Andersson <casper.casan@gmail.com> wrote:
>
> Hi,
>
> On 2022-09-12 14:44, Nathan Huckleberry wrote:
> > The ndo_start_xmit field in net_device_ops is expected to be of type
> > netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).
> >
> > The mismatched return type breaks forward edge kCFI since the underlying
> > function definition does not match the function hook definition.
> >
> > The return type of sparx5_port_xmit_impl should be changed from int to
> > netdev_tx_t.
>
> I noticed that the functions that assign the return value inside
> sparx5_port_xmit_impl also have return type int, which would ideally
> also be changed. But a bigger issue might be that
> sparx5_ptp_txtstamp_request and sparx5_inject (called inside
> sparx5_port_xmit_impl) returns -EBUSY (-16), when they should return
> NETDEV_TX_BUSY (16). If this is an issue then it also needs to be fixed.

It's not clear to me what happens when returning an error vs
NETDEV_TX_BUSY. The netdev_tx_t enum allows negative values, so
returning an error might be valid. If anyone more familiar with this
code has insight into why it's done like this, that'd be useful.

The important bit here for me is changing the return type on the
hooked function since the current code will cause panics.

>
> sparx5_fdma_xmit also has int return type, but always returns
> NETDEV_TX_OK right now.
>
> Best Regards,
> Casper
>

Thanks,
Huck
