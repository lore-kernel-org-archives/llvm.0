Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795196472;
	b=rFJvOmGaILsu5+EjuqD/ZPWC6Fsx4OIeVJT0f2JenGZHgRFrf6aLHMKuiSGadknGxbp/
	 LzXpRCSw3yKNs+H+i1EHFZ85SD+49sQhcuRmdlG3ycZOF2dFHGAZRBWDmEGYKm9Cm6LEH
	 saQN15l3eGaoNpHBjqzdSxukIOWE4ODNoeYmUb5jDLQXlvGyglFpIE/Pfw9taN6r0+xrT
	 umXA5XzYKxwtzJDD5FTKqc0GzVG7gysmTDyOJRR9X2gSTszXjcx7AAKMMBNErnSxpnisX
	 n7lEfk2KNoxXa54iPiZzt52e+foacmj99pWwo4UaCIaGDnYwBnD3nXAisBF0qlCDgeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NBhJnzU/KValBhhwaOLZ41OrcrxNBBfePnpP/eKtfYY=;
	b=SNbAzRGjQiKLucRpjFr/HpMkwH9CVxbpBf76JHtVOKxKzVBPNQfhdVBpSR889WtrVKHl
	 KpW5gKo2OxU1GBqgHkOioSTh+Z5jEsd4l5hmPwRve1Dwf3wr9622XxLhoLeIZZc5bTZc6
	 bRvtsdmLW4qpRmoM/vHz9+dXE7OCQ2TxANnGc+jisCxFf6wmF4EU2UR3JQfIOC3up1TkK
	 ec1JhBLsiACLCXNsVrrbYr5YL7vYKgHm7yWcVxs3O1QfXcYbaQy0Vu+tAQjcyZ1cnsIPt
	 39uzEgjRP8CGbNGZCU+g9REoYfWnzljLnUC61/nV61GuDUyX6tlFGypma0xyJeQs4Vw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="U/ILQT3L";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8108606A330
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 17:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8108606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=U/ILQT3L
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-533202fe429so161cf.0
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 09:41:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795196470; cv=none;
        d=google.com; s=arc-20260327;
        b=KmmBfFFrkA3vnkhiFFzVkaDd3xUo8tN2s6sP7TeHQ9/KFDA5phAcf87akXYb3S8Ij5
         7tXYsDwtHzUzetD78TXO4ErYBSjXY66mZ3ZNgQvh87+m4/iyJORK3gy1FFZYnOzw1CpI
         ewgGk7KFxkcpDFNPpZicLqxRjWPSdBD+gbeRFP56L0t3KIr3+JA21NCLc1Y1U+lfANXc
         Ay1zlB0JnEfZDFhimbmfsNoG2yJCdaY/v9uMBEWSvgk1HKcBqy+VHBqLddEkB0Lf8gey
         YTAlRoukiASMZvfZfikoHBhXymvVjq1NXOpW39TZPgpAE6gzWdGqeyJOei6xUQd6RTi0
         MIAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NBhJnzU/KValBhhwaOLZ41OrcrxNBBfePnpP/eKtfYY=;
        fh=PDaPOD/xsPgagLt5oNsFVjsF+nx0k/2pZsYc+Eq+kwc=;
        b=h1biQpGsqOkDd5kbyO1odSqe3JYMdkcBuEXkdFkp2p4NC5CKdjRv6bFnSYOJNEWeaQ
         rvtVyPooCp0DRPeXDktvOCSlkc2ll+bBPjDd8WmNEVDMBiGXip4hPuquoJNeOWQTvqNG
         On9UpKKPlRr/GOZAuWkP6u0R/lMR4ajvwtQRlRGHQbvUjGZeAsBcKrRHroFUiWasbExJ
         sELUHfw0nl9I9bgugTsUXVPEO3Nc2MWD73e9Z5ee6h4a6eLy5NxgEF3LD5U869rDSC1Y
         BR/FkSVF79IwOm/l0s2Qw3NswmLCTYd+NkfR3V7pjkLjNujDOwy/VOIdv3ftuVN5Czbb
         N+yA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795196470; x=1795801270; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NBhJnzU/KValBhhwaOLZ41OrcrxNBBfePnpP/eKtfYY=;
        b=U/ILQT3LbBKpU1aN37q0D3OaSRyowUopg3BasIsOTw5NYFNOzwF/+b+wJ8dNYX9kef
         ykyGLu1THiRNvKoFPgyN1Bvq1A0EkKdY6Oq5I0xw8plJVDc297CkdY9WLmjMMFz9VsTn
         ZWwgQlG31n+7pxErvLJ5yHouIPWEjvJlCjgXoOkT2jJuSJ8GmtAw5VN+tiecX8Y1bN6z
         MzwoQL/SmYjPxgHZ/vocYG+t3ljt/4MjBhRxkQHPVV6v2YAwSIEcVlFS7SDTAXoxHfJs
         HUFgFWm3kjSyVobaaNheF/BUVDE502fC1GdZU+TAudqnZ+5JNNcQVrcPTUjjdW1gmrA3
         9wKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196470; x=1795801270;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NBhJnzU/KValBhhwaOLZ41OrcrxNBBfePnpP/eKtfYY=;
        b=jHkS4R2c8Wikb+CKldvlS0ASRjRJW9Z5Wv1a1Rdih6tWPwtrz7VoDSd+ZoxwE4uiAt
         o5INgbG3Nc1YFU1DH4vIxBtZib9lfdqHCyM13QD/k+1Ctan9PMPFuWGVmJeFFAZzTfpJ
         L2FfggcwL4g+GJ2yDa0D10jSnknNhT7o73qn5iIfftiUGCxVW7F1m/2W5IA/RK8ENArv
         S/0R8n/DD7Org3pE6y9QhFM5AvuGLxTm+rY99Zz4/94wRZud1wrETpaigncYvzhx7jQZ
         mZLNridsSax+grLhJSEStelBvema+naQNth0VmA3g76mSQCD8dR7eyQVSKrHJ5c8nStx
         dXcg==
X-Forwarded-Encrypted: i=1; AL+hErEKBJuGejIOQh7z3zSw+Ixl7Lw70ovy0DeK+4Fj9qHdo26/iaMAQAzlD5inQ970gidU6fI9@lists.linux.dev
X-Gm-Message-State: APuU4Z9dvLD4nTPcZK/rliIanqAmq+kBxyKo99KMajC88iruBpF+3l7C
	75mRGYMDSsbCRkwW5Kj9E6EF+VFAPAOP0NUB9p4V1pBPVjPA2tm/9iafO+gZjmT6pTf1ObcCoND
	3t8h9E5XZO+/zf/JOU11DKhnsnBwQX1XUDjFad3cf
X-Gm-Gg: AYBFou2njAHHgPyY3QqH4TQD7LHZchGWgbqTIFXqPrNMPavxPbZmdrrc/n85TPTLtG4
	91zGoP9n5ZTGmdzOoC6zz422m9601W1uvPqhh8aIl4ZwgfEZIWjX5U3RFdzbD0h2NPbMKL8dopK
	6dtAFYeGOwkXB6R62bhtwjZCZtjFNoKWj7kp6TCnCfFEvVTh9NjxiItsDGmaWjMRE891cinwxKN
	1u4KVukR8YHgU1lrf7k+lva2FjOM+xPu/a7WFe2tu7lV3rBQLy7GhSMzGfqPY1Mj7OLmwGknZ5S
	LSebntJfOeLHqf5Ug5HjXW1cgw0GN5LCV3g5sxo7BkTXo89TApaj0AU6zKhCTJLBlEInZfXqVC0
	aUp6zcygV4NT1GLg+y+nH/Jhh8w6W/TYKpKBV
X-Received: by 2002:a05:622a:58c8:b0:55b:d494:187f with SMTP id
 d75a77b69052e-55d7911a3d1mr23325621cf.5.1795196469202; Fri, 20 Nov 2026
 09:41:09 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261119170729.1524516-1-irogers@google.com> <20261120095750.njqvupqpfuh443rh@DEN-DL-M70577.microsemi.net>
In-Reply-To: <20261120095750.njqvupqpfuh443rh@DEN-DL-M70577.microsemi.net>
From: Ian Rogers <irogers@google.com>
Date: Fri, 20 Nov 2026 09:40:57 -0800
X-Gm-Features: Aa3M54oOzjegUxdpX7VNYBH8UxXyKYAg5jEgHWesrq6ha6qjCQCMQopqRhJhoB8
Message-ID: <CAP-5=fWXrX+VTWP4r4daZPf8QHEEWEyfWaQ9L+oa80Y3YAZcBA@mail.gmail.com>
Subject: Re: [PATCH net] net: lan966x: Free skb when PTP TX timestamp request
 fails in xmit
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Horatiu Vultur <horatiu.vultur@microchip.com>, UNGLinuxDriver@microchip.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 1:57=E2=80=AFAM Daniel Machon
<daniel.machon@microchip.com> wrote:
>
> > When all LAN966X_MAX_PTP_ID timestamp slots are in flight,
> > lan966x_ptp_txtstamp_request() returns -EBUSY without queuing or freein=
g
> > skb, and lan966x_port_xmit() returns that negative errno directly from
> > .ndo_start_xmit. Because dev_xmit_complete() treats negative return cod=
es
> > (< NET_XMIT_MASK) as packets already consumed by the driver, skb is nev=
er
> > freed or requeued, permanently leaking the sk_buff and its socket
> > sk_wmem_alloc accounting.
> >
> > Free skb with dev_kfree_skb_any(), increment tx_dropped, and return
> > NETDEV_TX_OK when lan966x_ptp_txtstamp_request() fails.
> >
> > Found via an x86_64 LLVM=3D1 (Clang 21.1.8) allyesconfig audit with
> > -Wimplicit-int-enum-cast enabled; fix and changelog drafted with an AI
> > coding assistant. Build-tested under LLVM=3D1 W=3D1 (-Werror) and
> > -Wimplicit-int-enum-cast; not tested on Microchip LAN966x hardware.
> >
> > Fixes: 77eecf25bd9d ("net: lan966x: Update extraction/injection for tim=
estamping")
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  .../net/ethernet/microchip/lan966x/lan966x_main.c  | 14 +++++++++-----
> >  1 file changed, 9 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c b/dr=
ivers/net/ethernet/microchip/lan966x/lan966x_main.c
> > index b8696fc7e9b9..9c722d23e0bb 100644
> > --- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> > +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> > @@ -392,6 +392,7 @@ static netdev_tx_t lan966x_port_xmit(struct sk_buff=
 *skb,
> >       struct lan966x_port *port =3D netdev_priv(dev);
> >       struct lan966x *lan966x =3D port->lan966x;
> >       __be32 ifh[IFH_LEN];
> > +     netdev_tx_t ret;
> >       int err;
> >
> >       memset(ifh, 0x0, sizeof(__be32) * IFH_LEN);
> > @@ -404,8 +405,11 @@ static netdev_tx_t lan966x_port_xmit(struct sk_buf=
f *skb,
> >
> >       if (port->lan966x->ptp && skb_shinfo(skb)->tx_flags & SKBTX_HW_TS=
TAMP) {
> >               err =3D lan966x_ptp_txtstamp_request(port, skb);
> > -             if (err)
> > -                     return err;
> > +             if (err) {
> > +                     dev_kfree_skb_any(skb);
> > +                     dev->stats.tx_dropped++;
> > +                     return NETDEV_TX_OK;
> > +             }
> >
> >               lan966x_ifh_set_rew_op(ifh, LAN966X_SKB_CB(skb)->rew_op);
> >               lan966x_ifh_set_oam_type(ifh, LAN966X_SKB_CB(skb)->pdu_ty=
pe);
> > @@ -414,12 +418,12 @@ static netdev_tx_t lan966x_port_xmit(struct sk_bu=
ff *skb,
> >
> >       spin_lock(&lan966x->tx_lock);
> >       if (port->lan966x->fdma)
> > -             err =3D lan966x->ops->fdma_xmit(skb, ifh, dev);
> > +             ret =3D lan966x->ops->fdma_xmit(skb, ifh, dev);
> >       else
> > -             err =3D lan966x_port_ifh_xmit(skb, ifh, dev);
> > +             ret =3D lan966x_port_ifh_xmit(skb, ifh, dev);
> >       spin_unlock(&lan966x->tx_lock);
> >
> > -     return err;
> > +     return ret;
> >  }
> >
> >  static int lan966x_port_change_mtu(struct net_device *dev, int new_mtu=
)
> > --
> > 2.56.1.708.g77570a6a1d-goog
> >
>
> Hi Ian,
>
> Thanks for the fix. The issue is real, and also on my backlog of work to
> upstream.
>
> Just a heads up, I expect the AI review to flag issues in this area. The =
lan966x
> PTP TX path has a number of known problems that I am are going to address=
 in a
> PTP series soon. I'll go through the findings once the review is in and f=
ollow
> up on this one.

Thanks for the heads-up, Daniel! Feel free to fold or supersede this
in your upcoming PTP series if that's easier than taking it
standalone.

Thanks,
Ian

> /Daniel
