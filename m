Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A4C15AC
	for <llvm@lists.linux.dev>; Wed, 14 Sep 2022 01:45:33 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id c11so10156352qtw.8
        for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 18:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=T56o2h08tk0PmW4ZLsH28b7hS5vDK+AW+si3O65+obo=;
        b=Oe8JnBSVgSMmqPNFrZr6uzBF/MsmXi9Nee/enb8/xccCc7JVyURajg/V5pr9jjpDW7
         RNCmRZLDsLReno9LXIN2zp/cqjkYRNiKkFHGUCvWRZQVuMInyHndbXOX6cDzDe7eizFF
         ed0a5o28Y+QxB0B+wWFcbtsD0kr8Z1mgNfJMQV6W2pBlm8vVf+OqVpXuzLoQb9Awyn+Q
         n848eZEUh9KivIQUP2Vbw4atlx7cGTXwu6KZaqbbfv06jDDBb6iGHWS2jMDIZ5mv9S4e
         jtX1571mzSZ6cyd3EA6Gyb6LQSUlEV4ZJg7eeFWROk7kqZSd7HNQ1xcryQqfBbPBgbuI
         izHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=T56o2h08tk0PmW4ZLsH28b7hS5vDK+AW+si3O65+obo=;
        b=apOB3WoeSGgOsocB6Fi/Qgtv4smjGmj6uI5IG5XPp94iR89gKZH0KW/WiiZy7RmfW7
         rMp9lS0TdIW5Gj2X96akQoIJalbp0DFPOdkNw6NvLF9xWzsha9HS8n1vO1kzl1/H7+0c
         TUWXDGVnJjzhqSFCI+IEGFy38hV4uruXQc1epj3islxAdeiKTIRXpq/6Qg+pwbIJvVBR
         1cDcmcFaTi7qq9bayu4LlPxvS4dwaEuTsoFzkQNZxNqWb03JNLxY2XpVWEFjbVI9ntGk
         Mg3jhdgNiyh2HDbNe0BEFzJDCPoyYaGQGGQaeNlu6wG5z1zVMQ7klhjvE8z+xRs/Jpep
         YuXg==
X-Gm-Message-State: ACgBeo3zSvYqS0GkoEQGQPg+YZqMgzIu1DF8KfSRDhd7GoVJHzPUZFON
	xdLqvKcH7PrFUl9Mb3EKlkO0hEMF9pax7SM5S/fJmDRAAsauOw==
X-Google-Smtp-Source: AA6agR7ZlBYQI9ZokbyfOHpFIIymY6tIse9RDdoF3wV8R9iGFdrGtQG+znlmV9nlP4yNq9O+IMb6tRKwuFxFqM6bZKg=
X-Received: by 2002:ac8:7dca:0:b0:344:5679:2dbb with SMTP id
 c10-20020ac87dca000000b0034456792dbbmr31410571qte.245.1663119932138; Tue, 13
 Sep 2022 18:45:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220912214559.929186-1-nhuck@google.com> <YyENqW9u3LxySbSk@dev-arch.thelio-3990X>
In-Reply-To: <YyENqW9u3LxySbSk@dev-arch.thelio-3990X>
From: Nathan Huckleberry <nhuck@google.com>
Date: Tue, 13 Sep 2022 18:45:00 -0700
Message-ID: <CAJkfWY6FYCNz_5+5cM2GoJdGLdBu7aPzs0e8uFmhgZRE_axLSQ@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8192u: Fix return type of ieee80211_xmit
To: Nathan Chancellor <nathan@kernel.org>
Cc: Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hey Nathan,

On Tue, Sep 13, 2022 at 4:09 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Mon, Sep 12, 2022 at 02:45:56PM -0700, Nathan Huckleberry wrote:
> > The ndo_start_xmit field in net_device_ops is expected to be of type
> > netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).
> >
> > The mismatched return type breaks forward edge kCFI since the underlying
> > function definition does not match the function hook definition.
> >
> > The return type of ieee80211_xmit should be changed from int to
> > netdev_tx_t.
> >
> > Reported-by: Dan Carpenter <error27@gmail.com>
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1703
> > Cc: llvm@lists.linux.dev
> > Signed-off-by: Nathan Huckleberry <nhuck@google.com>
>
> The protoype in drivers/staging/rtl8192u/ieee80211/ieee80211.h should be
> updated as well. With that:

Nice catch, thanks.

>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> > ---
> >  drivers/staging/rtl8192u/ieee80211/ieee80211_tx.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_tx.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_tx.c
> > index 8602e3a6c837..e4b6454809a0 100644
> > --- a/drivers/staging/rtl8192u/ieee80211/ieee80211_tx.c
> > +++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_tx.c
> > @@ -526,7 +526,7 @@ static void ieee80211_query_seqnum(struct ieee80211_device *ieee,
> >       }
> >  }
> >
> > -int ieee80211_xmit(struct sk_buff *skb, struct net_device *dev)
> > +netdev_tx_t ieee80211_xmit(struct sk_buff *skb, struct net_device *dev)
> >  {
> >       struct ieee80211_device *ieee = netdev_priv(dev);
> >       struct ieee80211_txb *txb = NULL;
> > @@ -822,13 +822,13 @@ int ieee80211_xmit(struct sk_buff *skb, struct net_device *dev)
> >                       if ((*ieee->hard_start_xmit)(txb, dev) == 0) {
> >                               stats->tx_packets++;
> >                               stats->tx_bytes += __le16_to_cpu(txb->payload_size);
> > -                             return 0;
> > +                             return NETDEV_TX_OK;
> >                       }
> >                       ieee80211_txb_free(txb);
> >               }
> >       }
> >
> > -     return 0;
> > +     return NETDEV_TX_OK;
> >
> >   failed:
> >       spin_unlock_irqrestore(&ieee->lock, flags);
>
> I see 'return 1' down here, that doesn't appear to be a valid
> 'netdev_tx_t'. Should that be 'return NETDEV_TX_BUSY'? I guess that is
> an outstanding issue though, just figured I would mention it.

I'm not sure. As far as I can tell, the dev_xmit_complete function in
include/linux/netdevice.h is used to determine whether an skb was
consumed or not. It looks like a value of 1 (NET_XMIT_DROP) would
signify that it was consumed, whereas NETDEV_TX_BUSY would not.

It's somewhat confusing that a function which returns an enum may also
return values outside of that enum.

For more info see the foillowing commits:
dc1f8bf68b311b1537cb65893430b6796118498a
572a9d7b6fc7f20f573664063324c086be310c42
7f2e870f2a48a0524a3b03b04fa019311d16a7f7

>
> > --
> > 2.37.2.789.g6183377224-goog
> >
>
> Cheers,
> Nathan

Thanks,
Huck
