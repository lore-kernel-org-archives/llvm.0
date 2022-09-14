Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062A24423
	for <llvm@lists.linux.dev>; Wed, 14 Sep 2022 19:15:08 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id ay9so1245575qtb.0
        for <llvm@lists.linux.dev>; Wed, 14 Sep 2022 12:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=imU6N/sbMDNwpxG/ml2ujPHotZONSIOXltM3qdyiYEg=;
        b=U/9GmOj+GfMD2TH7b2IpkKELRpqmUZkeeowz2SRbmL0+H33N8eIBdCjO6GVRzC4RWs
         RM5ovijGZKdH676/OXn4ERY5DkZ5B11052NL2Yg5tSB72ujaPk2nG/GiuvuuV9lze7DW
         1yQd3M7zdbC2InodbaDWm4SojuJ+6EegEtV5JrB2nvWqBtIh+s5RBl8ikaydAiyV5ylK
         H8nWybPSTACWUlkQCsz3ylFyi6I+Zp2NrYd4hfzKeIYgUcRwEa2NOLnaLmPotcUoI4iO
         //ram+OjsBORt9GKCVbhvW2nXwaiqsQU/uxqQdArJKgnpDJc+bdrT2MoPfMVXKZEUiWE
         8PzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=imU6N/sbMDNwpxG/ml2ujPHotZONSIOXltM3qdyiYEg=;
        b=LrkpQG12pLSXY+9k+xDHSq47zqwKWSrKakr/e0xTa9ZmFfaChjaZ3jwXXZ2cVSbOu7
         ZQ7u18ZAKE7JJ0/UQnwBHlpQkMkRB2cg12t5SPtLUhKOXxKI8JQEX1oGw9CXqG/UIqxn
         G8dahU8XjxI5jSf3DyE16N3iBlelW3dUeLz1HoLUmLnu9YC5+013+4ZA+ohjvQDQjqSC
         ZGyrGOOTX7leL570FBgt5FS0uA3XFsPjKker6uXRmJ9VKuzAo/TiHeiKLeai7nNBRY+Q
         LSwlFkfD1uRxjCjOcDCLXvameQ8vSkxilZ9DTv/6gfXybarBt1O/eAHz+nLZ3ORYhOLs
         TARw==
X-Gm-Message-State: ACgBeo0AAWwKfqwCQsIkQsTsXLzOWWNpxo/TaKsBsE1el4kVY8Gq67uG
	/FVhVgGLVHuOAewg5NzL3/fljEl6IP2LrSDw7TNjCQ==
X-Google-Smtp-Source: AA6agR7vZKjaZzM24rYovfFQyKuHAPFpHIzjRs5BIEUSYEB8YPicvGP6DCoHcRyQaHhwg57ssIZpTiuY6MFOUK+AAYs=
X-Received: by 2002:ac8:7dca:0:b0:344:5679:2dbb with SMTP id
 c10-20020ac87dca000000b0034456792dbbmr34760646qte.245.1663182907940; Wed, 14
 Sep 2022 12:15:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220912214617.929240-1-nhuck@google.com> <YyEO01+suq0Wl/2F@dev-arch.thelio-3990X>
In-Reply-To: <YyEO01+suq0Wl/2F@dev-arch.thelio-3990X>
From: Nathan Huckleberry <nhuck@google.com>
Date: Wed, 14 Sep 2022 12:14:00 -0700
Message-ID: <CAJkfWY7SAOMgKH68ffVeQxd94BxnqnkYp3Q1oW7XLV3Zc=9K4Q@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: Fix rtw_xmit_entry return type
To: Nathan Chancellor <nathan@kernel.org>
Cc: Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Looks like this was already fixed in a90044ef5605bc0961356548526c44964bc819a7

Ignore this patch.


On Tue, Sep 13, 2022 at 4:14 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Mon, Sep 12, 2022 at 02:46:14PM -0700, Nathan Huckleberry wrote:
> > The ndo_start_xmit field in net_device_ops is expected to be of type
> > netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).
> >
> > The mismatched return type breaks forward edge kCFI since the underlying
> > function definition does not match the function hook definition.
> >
> > The return type of rtw_xmit_entry should be changed from int to
> > netdev_tx_t.
> >
> > Reported-by: Dan Carpenter <error27@gmail.com>
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1703
> > Cc: llvm@lists.linux.dev
> > Signed-off-by: Nathan Huckleberry <nhuck@google.com>
>
> The prototype in drivers/staging/rtl8723bs/include/xmit_osdep.h should
> be updated as well. With that:
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> > ---
> >  drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 13 +++++--------
> >  1 file changed, 5 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> > index 530e7a6c67c5..472d3ac0179b 100644
> > --- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> > +++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> > @@ -181,7 +181,7 @@ static int rtw_mlcst2unicst(struct adapter *padapter, struct sk_buff *skb)
> >       return true;
> >  }
> >
> > -int _rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)
> > +netdev_tx_t _rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)
> >  {
> >       struct adapter *padapter = rtw_netdev_priv(pnetdev);
> >       struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
> > @@ -217,15 +217,12 @@ int _rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)
> >       dev_kfree_skb_any(pkt);
> >
> >  exit:
> > -     return 0;
> > +     return NETDEV_TX_OK;
> >  }
> >
> > -int rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)
> > +netdev_tx_t rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)
> >  {
> > -     int ret = 0;
> > -
> >       if (pkt)
> > -             ret = _rtw_xmit_entry(pkt, pnetdev);
> > -
> > -     return ret;
> > +             return _rtw_xmit_entry(pkt, pnetdev);
> > +     return NETDEV_TX_OK;
> >  }
> > --
> > 2.37.2.789.g6183377224-goog
> >
