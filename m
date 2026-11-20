Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795196253;
	b=tdkKD3aov78RvuoGLOSG2EC6a27aaETep4S8PrR6DitJmYyJN7/Qi8Gy22N2RRg7t7SK
	 tdU5sHfKv8p8mHPXg2qLQspzfI1Mpj/udB04SalkD4WVnnyVmethIwUCSByIPP00I0cIT
	 JRRD80cqgo2JiTadAw+Un6GgQvmc1W3WXVU/OUjw5Nt8aYMmM/HttEOFvQdHFJgMIsG+h
	 Bss9KbydZSvUzyFk0YxKctXTZ1rI3Yvbx0tWDc4AV9WhpERdYn5BdnQUtShBw8GAaH5tO
	 Z6aecZT0WuHGNCWdXJptmUVq5+fptbyy1U54DU8pzLgkMjNjLPq1mDL1ewPVMn3d6NQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QRKvnlsdzu3jXDaX4UB8D7CCbipvvMVl8tWANK/PyeU=;
	b=lJkGCsViBRNWO07aN8KpzRxytElg1Mu682SZcsrBDCGjt2ZbpyGHgCwFQtfRVUYwlDH5
	 v1K57TM+P7nyz6qrjXoipclbDlo3M9nAk05ww++YEtNFpVMVxW3z68X6KW8HGgqduDb8c
	 ZTBoPUlDBZ4i4shcSYRDi4ScLQtMAOlTeV5+3KiTOROs86i7N94LGZeFJRFDRJXnuy76j
	 1x8U863p0a/1YwEHocuBE+TOnLKusQyr7tNZzJ4KKuPVS57kXgboEji3IsDfuUHz8otQB
	 EEGONwNgN6Soyr8116b8+tImsUQyzwlgcmQezEqNNraQs52LbiFmClfkN7rxkB4bDZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=J3R05DCR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19FF606A331
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 17:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C19FF606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=J3R05DCR
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-533202fe429so375191cf.0
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 09:37:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795196252; cv=none;
        d=google.com; s=arc-20260327;
        b=gqhRz9nuKY/KRCpa9KARTExJi2wmyF0lCHDjiqswepHuFLoc9JVxS4MVzoANejZNxJ
         pK1qpFLFxe7iqgAm6NbS6Q66SsDUNXeo7uuix2yubqNmABPJgtEwagl+1C+cY4PjYFvy
         CTSitgYf5aurfQihsX+shCWMVvSOoYp94f7CIWI6izubmFvtwQUBsOzxuGud/tJMWpQa
         eojVS5ue81rAzmPlkFmC3pkFMK43l7C4lu4VZRzkesDJ/hqeeqdLbePxDF5OBN1t7mjN
         NQuE1wWW99i4i8Px9fDRxZAYXkh8RKrLXoFtdVs7DifKO1Y/U/GUOS8f7C1pq5Wi3eNT
         SRwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QRKvnlsdzu3jXDaX4UB8D7CCbipvvMVl8tWANK/PyeU=;
        fh=hRuASEquagY+sT9ccX6ncS1haeLSevzoh3uM7pOhAoE=;
        b=A8Q5dtpk8jqUt7DEYKRgmJYIuaLvuaKprqi5rXFyfzrQiyKbLWntxVal5jnfwOXonH
         S5jw2LmhuTObNI51I6U+PEnX9vbWu9SdfXkZxbhcv7rxHDcgjkukS+mUpi5SsSZDqMSk
         5pTDbdRc2rvNwhl/vEFZMKf21WgD4aAiFMVx7DHJAZrZFGwUqPwAlzkEnYlCYWs1sNg/
         BxX7DJYHC3ANTiK7G/TmiEz9x1VioFT2bxeSY0+wt1EvNOAeMH7GALljwCCTczXFJVRj
         MP51XHI8MlAa2yBAmm73luTugjiFvyubkXXBoEhsrcOIm5dBIRIPZquj/nU7S27c5ljx
         hcVQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795196252; x=1795801052; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QRKvnlsdzu3jXDaX4UB8D7CCbipvvMVl8tWANK/PyeU=;
        b=J3R05DCRXGvp80fAhvb4oq7mjilnsYDQmMkzOA0GUN6e+esRUxQPfrw5WjBmU6Axdr
         spVKRr2zh0zn2FyysBc5b5ATrdUOGizvjyG0bmTjKkap98nNIYrEjGq0S7YotSqLb1aj
         QjreZGxLdb0hZH2qvMjiP97egyMpw/YmSRH7enYvu5Ep6RVfxTkYHmCbcjWnifhzol6q
         zrU93PU1Blqx3I/hZwNY+zfmG3iUbiB2LaUoHkh2RUygdSaN76huTKeVsiAicC+80+oc
         8HcZKC7M3QQDKql6ormQGrNhAMD5vLmEJnS1C3DcCbmZgPjotnrV3rb+tHNj55cdcbgi
         orAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196252; x=1795801052;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QRKvnlsdzu3jXDaX4UB8D7CCbipvvMVl8tWANK/PyeU=;
        b=HHNAk7IjtANO68NzsBEeikcbmj7uiatlwZAFGt+28W2KrMwg9q/PpjEMXF7hxnnzhq
         3CaD22fHuZr7cws+RQoFx7l9TFUBPMhz3UwYgro5XIQpCeMfM2WzT2vlxxIZMYSHigXK
         oRo+v/zrQcpySuK7EFaNuMuN+FaRiVqIBBCEKdBH5A0UdL87M7uuzqi403U+82WuznJw
         FUoa03mWoOu6V5U/c2+6b/HQlxMl0baZp4Tcqrhrf2pUfw3s17ypLvlux30N2xQIli2Y
         MNwaoR5NT5eAmlrYVVmTY/bPHZj1t1i2VQCFgTyPx7j5gYH5LtUYajtfN2i3+Rru/tdW
         xrTw==
X-Forwarded-Encrypted: i=1; AL+hErEnLRVvYL9LNvQvwSJ/JjSeaoujDkDq0TcplkOO1Qgy3QBzjpMv/q48ONOH/5pGvrqNZ6Zv@lists.linux.dev
X-Gm-Message-State: APuU4Z+r7casHM3JG8KNlI9lNPMrmeWAXp8ylLAgUFwUGpT2yB5qEu2Q
	v8+m1tqNqdJhSrM8hKzR4gf4vDgVEVE/HnnVPmGroX5qwnhnowibv/UTEqqol0jW/mNAydaytFG
	q4Q3DJcgw567PdbN+nHFt0Wvq7IoDSzeh5GMximUv
X-Gm-Gg: AZFdTZe8f67QnpuBTOta2HI3BwW33w70r7gEM+ouym6t7cHkr3cwZBp6AJAFBtKxNaa
	P9NOgONOpNPW7LEryiRaMC0zYpXov3M4x9aDCJy81cWTN99GkJPNpkEmO++bm9r356qyx8iu8/o
	86xJQtU8uaSygSYDklxCnSdObc0+LO/cw6SPIgGBjBiUmsY9Wb13iso3U4KJkvVJjAu+1qrGhCe
	kJbgetIsqPTSBDbagNDNyI3dlkUzWsivYLwW+vGCgQsPXrgeKIXMrckzjLy7Sc+Hj/+U2Z10L1a
	I6JginvlWyOvH/Mpqy8z9SqrkAIwotAYUAH4jrlOVaJqidxapBDR4C8V4+tjWjq5UQmLHYB+49X
	o5+kG4QwuPUCiQCfGD0diycT//X+Nw893Ie/b
X-Received: by 2002:a05:622a:420a:b0:536:934f:7da2 with SMTP id
 d75a77b69052e-55d78e6fe63mr22944711cf.2.1795196250681; Fri, 20 Nov 2026
 09:37:30 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261119170354.1509589-1-irogers@google.com> <BL1PPFB0715B38BE20BB0B4087ABC66BD9EDB792@BL1PPFB0715B38B.namprd18.prod.outlook.com>
In-Reply-To: <BL1PPFB0715B38BE20BB0B4087ABC66BD9EDB792@BL1PPFB0715B38B.namprd18.prod.outlook.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 20 Nov 2026 09:37:18 -0800
X-Gm-Features: Aa3M54r5Jmnt4Ssp-wBby_ZlWdHK7iMTTCVJuGgQMqW36wSMvbgVZ0tFQ-QRjgE
Message-ID: <CAP-5=fVj+nAvGW9m9L2AxPqzw63PDqCawS=9a6jVh1fc7ob-dw@mail.gmail.com>
Subject: Re: [EXTERNAL] [PATCH net] net: marvell: prestera: Fix skb leak on
 error in prestera_rxtx_xmit()
To: Elad Nachman <enachman@marvell.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 9:39=E2=80=AFAM Elad Nachman <enachman@marvell.com>=
 wrote:
>
> > prestera_rxtx_xmit() is invoked directly from prestera_port_xmit(), the
> > driver's .ndo_start_xmit() callback, whose return type is netdev_tx_t.
> > When skb_cow_head() or prestera_dsa_build() fails, prestera_rxtx_xmit()
> > returns NET_XMIT_DROP (0x01, a qdisc congestion code rather than a
> > netdev_tx_t value) without freeing skb.
> >
> > In dev_hard_start_xmit(), any return code other than NETDEV_TX_OK (0x00=
)
> > is treated as a busy/requeue condition unless dev_xmit_complete() holds=
;
> > for an unrecognized positive value like 0x01, the core neither frees no=
r
> > requeues the skb (or hits the unrecognized-return WARN path), leaking
> > the packet buffer.
>
> Did you check it yourself or was this sentence AI generated?
>
> Please check here:
> https://elixir.bootlin.com/linux/v7.4-rc1/source/include/linux/netdevice.=
h#L122
>
> and here:
> https://elixir.bootlin.com/linux/v7.4-rc1/source/include/linux/netdevice.=
h#L144
>
> You indeed need to free the SKB, but as long as rc < 0xf (which is true f=
or both the
> NET_XMIT_DROP and the NETDEV_TX_OK cases), the behavior of dev_hard_start=
_xmit() is the same:
> https://elixir.bootlin.com/linux/v7.4-rc1/source/net/core/dev.c#L4074

My mistake on that paragraph - you are completely right. Because
NET_XMIT_DROP (0x01) is < NET_XMIT_MASK (0x0f), dev_xmit_complete()
returns true and dev_hard_start_xmit() assumes the driver already
consumed the skb, which is why returning without freeing skb leaks it.

> >
> > Free the skb with dev_kfree_skb_any(), increment the core tx_dropped
> > counter via dev_core_stats_tx_dropped_inc() (so .ndo_get_stats64 report=
s
> > the software drop), and return NETDEV_TX_OK.
> >
> > Found by enabling Clang's -Wassign-enum on an x86_64 allyesconfig build=
,
> > with AI coding assistant help to audit the warning and prepare the fix.
> > Build-tested with Clang; not runtime-tested on Prestera switch hardware=
.
> >
> > Fixes: 501ef3066c89 ("net: marvell: prestera: Add driver for Prestera f=
amily ASIC devices")
> > Signed-off-by: Ian Rogers <mailto:irogers@google.com>
> > ---
> >  drivers/net/ethernet/marvell/prestera/prestera_rxtx.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c b/dr=
ivers/net/ethernet/marvell/prestera/prestera_rxtx.c
> > index c4ea247d2470..7ac9220d33c5 100644
> > --- a/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c
> > +++ b/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c
> > @@ -817,13 +817,18 @@ netdev_tx_t prestera_rxtx_xmit(struct prestera_po=
rt *port, struct sk_buff *skb)
> >       dsa.port_num =3D port->hw_id;
> >
> >       if (skb_cow_head(skb, PRESTERA_DSA_HLEN) < 0)
> > -             return NET_XMIT_DROP;
> > +             goto drop_skb;
> >
> >       skb_push(skb, PRESTERA_DSA_HLEN);
> >       memmove(skb->data, skb->data + PRESTERA_DSA_HLEN, 2 * ETH_ALEN);
> >
> >       if (prestera_dsa_build(&dsa, skb->data + 2 * ETH_ALEN) !=3D 0)
> > -             return NET_XMIT_DROP;
> > +             goto drop_skb;
> >
> >       return prestera_sdma_xmit(&port->sw->rxtx->sdma, skb);
> > +
> > +drop_skb:
> > +     dev_kfree_skb_any(skb);
> > +     dev_core_stats_tx_dropped_inc(port->dev);
> > +     return NETDEV_TX_OK;
>
> For the sake of clarity I would return here NET_XMIT_DROP . The behavior =
in dev_hard_start_xmit() would be the same.
> There are 53 drivers which currently return this value, this is not an is=
olated case of just the prestera switchdev one:
> https://elixir.bootlin.com/linux/v7.4-rc1/C/ident/NET_XMIT_DROP
>
> The rest of the patch is fine.

Sounds good (I had used NETDEV_TX_OK to match prestera_sdma_xmit()
just above and avoid Clang's -Wassign-enum on netdev_tx_t, which is
how I spotted the missing free). I'll send a [PATCH net v2] keeping
'return NET_XMIT_DROP;' and fixing the commit message.

Thanks,
Ian

> >  }
> > --
> > 2.56.1.708.g77570a6a1d-goog
> >
>
> Elad.
