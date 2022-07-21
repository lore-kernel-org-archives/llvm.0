Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF7D4680
	for <llvm@lists.linux.dev>; Thu, 21 Jul 2022 16:12:01 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id 7so3615036ybw.0
        for <llvm@lists.linux.dev>; Thu, 21 Jul 2022 09:12:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LlrLvrHdgIqpNgzIDfPP4ldd7eYPYAt16clK0JtUg4w=;
        b=ZNgFaDMNtpihPADUXR2Cu+lj8wMsvWtjII2SS9P8TYMHD25qbmWPuctSMMudBcGmvD
         eGdRVHRzs5LTcSEKz9TKh/bMnczPA7RMKdxL9nNC31h/qWwgxvJEdOeITpgOSjkXBePV
         TXRwztm0vzYLetO2hl5Lu5sKjvRuNmOuiAfSPbaMSLSfF+C4CC+IOaBmB2ex90tCpUj9
         LYlzArty4Dt7ZYEOjp5+YbhtuiuGeBwVbucK12LKLh9S6Xe2ixoWiYac3hqggphPKzVz
         Au8kyfgc/OXImSXnccz7/cF/k2q0LSS+8QAksKx78QuOjKHxt/FK5cXrgcZJPTZ0oDw7
         0n7w==
X-Gm-Message-State: AJIora8AcRC/ac9ND6Yh+ishJmDye4vXRKI/yqFJTNUTNnMI6zg+Iz02
	qlmi22mvSI1fTtBj6RaJn52ZpNg1TdnJjmP5QG4=
X-Google-Smtp-Source: AGRyM1strfzaUt2Yd+j6aqpspsXBSpVAh5Odj5eP4TjM0pFLiQTGdS8F+goiBkBgWiSksV8nouUyAX389jRLAFGMf4M=
X-Received: by 2002:a5b:ed0:0:b0:670:7cd1:a756 with SMTP id
 a16-20020a5b0ed0000000b006707cd1a756mr14575967ybs.151.1658419920250; Thu, 21
 Jul 2022 09:12:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220720081034.3277385-1-mkl@pengutronix.de> <20220720081034.3277385-19-mkl@pengutronix.de>
 <YtlwSpoeT+nhmhVn@dev-arch.thelio-3990X> <20220721154725.ovcsfiio7e6hts2n@pengutronix.de>
In-Reply-To: <20220721154725.ovcsfiio7e6hts2n@pengutronix.de>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Fri, 22 Jul 2022 01:11:49 +0900
Message-ID: <CAMZ6RqLdYCqag_MDp7dj=u1SEjx1r=bs_xHG26w11_A_D_SumQ@mail.gmail.com>
Subject: Re: [PATCH net-next 18/29] can: pch_can: do not report txerr and
 rxerr during bus-off
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, netdev@vger.kernel.org, davem@davemloft.net, 
	kuba@kernel.org, linux-can@vger.kernel.org, kernel@pengutronix.de, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri. 22 Jul. 2022 at 00:49, Marc Kleine-Budde <mkl@pengutronix.de> wrote:
> On 21.07.2022 08:27:06, Nathan Chancellor wrote:
> > On Wed, Jul 20, 2022 at 10:10:23AM +0200, Marc Kleine-Budde wrote:
> > > From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> > >
> > > During bus off, the error count is greater than 255 and can not fit in
> > > a u8.
> > >
> > > Fixes: 0c78ab76a05c ("pch_can: Add setting TEC/REC statistics processing")
> > > Link: https://lore.kernel.org/all/20220719143550.3681-2-mailhol.vincent@wanadoo.fr
> > > Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> > > Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
> > > ---
> > >  drivers/net/can/pch_can.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/net/can/pch_can.c b/drivers/net/can/pch_can.c
> > > index fde3ac516d26..497ef77340ea 100644
> > > --- a/drivers/net/can/pch_can.c
> > > +++ b/drivers/net/can/pch_can.c
> > > @@ -496,6 +496,9 @@ static void pch_can_error(struct net_device *ndev, u32 status)
> > >             cf->can_id |= CAN_ERR_BUSOFF;
> > >             priv->can.can_stats.bus_off++;
> > >             can_bus_off(ndev);
> > > +   } else {
> > > +           cf->data[6] = errc & PCH_TEC;
> > > +           cf->data[7] = (errc & PCH_REC) >> 8;
> > >     }
> > >
> > >     errc = ioread32(&priv->regs->errc);
> > > @@ -556,9 +559,6 @@ static void pch_can_error(struct net_device *ndev, u32 status)
> > >             break;
> > >     }
> > >
> > > -   cf->data[6] = errc & PCH_TEC;
> > > -   cf->data[7] = (errc & PCH_REC) >> 8;
> > > -
> > >     priv->can.state = state;
> > >     netif_receive_skb(skb);
> > >  }
> > > --
> > > 2.35.1
> > >
> > >
> > >
> >
> > Apologies if this has been reported already, I didn't see anything on
> > the mailing lists.
> >
> > This commit is now in -next as commit 3a5c7e4611dd ("can: pch_can: do
> > not report txerr and rxerr during bus-off"), where it causes the
> > following clang warning:
> >
> >   ../drivers/net/can/pch_can.c:501:17: error: variable 'errc' is uninitialized when used here [-Werror,-Wuninitialized]
> >                   cf->data[6] = errc & PCH_TEC;
> >                                 ^~~~
> >   ../drivers/net/can/pch_can.c:484:10: note: initialize the variable 'errc' to silence this warning
> >           u32 errc, lec;
> >                   ^
> >                    = 0
> >   1 error generated.
> >
> > errc is initialized underneath this now, should it be hoisted or is
> > there another fix?

Thanks for reporting and sorry for the bug.

That said, I have one complaint: this type of warning is reported at
W=2 *but* W=2 output is heavily polluted, mostly due to a false
positive on linux/bits.h's GENMASK_INPUT_CHECK(). Under the current
situation, the relevant warings become invisible with all the
flooding.
I tried to send a patch to silence a huge chunk of the W=2 spam in [1]
but it got rejected. I am sorry but even with the best intent, I might
repeat a similar mistake in the future. The W=2 is just not usable.

[1] https://lore.kernel.org/all/20220426161658.437466-1-mailhol.vincent@wanadoo.fr/

> Doh! I'll send a fix.

Thanks Marc for the patch!
