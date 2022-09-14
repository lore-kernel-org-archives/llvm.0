Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC3D3D61
	for <llvm@lists.linux.dev>; Wed, 14 Sep 2022 12:07:00 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id w4so11533223qvp.2
        for <llvm@lists.linux.dev>; Wed, 14 Sep 2022 05:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=2seAi8p9cHTQ5grUkwewK+XdzcnHWiXhnN5EOp8ed1M=;
        b=dwVpg4cqBY0+c9XrNnlYb7uyYW8DoeEJtl5JT2pRFd16SN6bHT7Cl20p6HTwD8cR4P
         +3DmJ/tjHNIGlq4usUb/aMaDOZtRKeAhnuZMJLSB84JCtPLk9K+ExSEhWd6pV/K9j9hF
         QX/nqvHMFBz0rT8Wfbc3hwvmjwEziEvweO1XoqmVAD2tLonoTF+3w5kIQ0x7OKVJrihv
         lwS27Tjndm+nR7G3gp4DZJpFqKVI2fpWuvk9N1JVrHDjB9pwD+0HSQwu1IP4RFtLCohW
         jer/4LYVGMXOHKdtpsDCCOHTgo4LZVl3dAYiZNgR+c7GA/Ek2rYIReSwvmTObibAySzv
         VFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=2seAi8p9cHTQ5grUkwewK+XdzcnHWiXhnN5EOp8ed1M=;
        b=i6eOEZotmW0Tz56zRakLeVukljkFS/jRFghDBefPGUBXXJm63x5EeSRkMI/sAmOFWI
         5HIUTljMz6MyxbgjidIynb8KWeZPs0UusjSjKPlZLSs2O8IdwoDb4LP+oY4LpF3ADZ2p
         UoYzk7GzNDBXHjVx+wOakO1i0mYgFaf2Iw5zLZdmfSdvwQdjFFY+ZoChBv55f7VxY7a6
         A3Z8lq94MY5yZziXpaDBK45nxykVqDXLIyatI2gFbXvM4r2yjMmzxaZbnk0dLp9V94Cf
         TOl5kCTEd4nGhKjd73f7n0E6BFuwzFs0qiWThUDxA6PnqtmNpEXYWKq+riTTYKA2fcPr
         UgfA==
X-Gm-Message-State: ACgBeo1JpvxveNEPxT+vOqDPWGDqsBF5nZMt7WtiNcXHRU2CcWpACQiy
	oJdkKXAgQ9ExLWYPbcuOJUg=
X-Google-Smtp-Source: AA6agR4qM8+4xZ8JfYFrFjrKKP+AQwRkgUoluvJ40CPzqYuFfl1kgsgy8xlZMg6+Rjj/AkbVhMNsOA==
X-Received: by 2002:a0c:e152:0:b0:4ac:8080:215c with SMTP id c18-20020a0ce152000000b004ac8080215cmr24791308qvl.2.1663157219360;
        Wed, 14 Sep 2022 05:06:59 -0700 (PDT)
Received: from errol.ini.cmu.edu (pool-72-77-81-136.pitbpa.fios.verizon.net. [72.77.81.136])
        by smtp.gmail.com with ESMTPSA id i10-20020ac84f4a000000b0031eb5648b86sm1452330qtw.41.2022.09.14.05.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 05:06:58 -0700 (PDT)
Date: Wed, 14 Sep 2022 08:06:56 -0400
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nathan Huckleberry <nhuck@google.com>,
	Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Karol Gugala <kgugala@antmicro.com>,
	Mateusz Holenko <mholenko@antmicro.com>,
	Joel Stanley <joel@jms.id.au>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: ethernet: litex: Fix return type of
 liteeth_start_xmit
Message-ID: <YyHD4MX0Pvckb6XW@errol.ini.cmu.edu>
References: <20220912195307.812229-1-nhuck@google.com>
 <YyEErzoi9+8NMRCP@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyEErzoi9+8NMRCP@dev-arch.thelio-3990X>
X-Clacks-Overhead: GNU Terry Pratchett

On Tue, Sep 13, 2022 at 03:31:11PM -0700, Nathan Chancellor wrote:
> On Mon, Sep 12, 2022 at 12:53:07PM -0700, Nathan Huckleberry wrote:
> > The ndo_start_xmit field in net_device_ops is expected to be of type
> > netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).
> > 
> > The mismatched return type breaks forward edge kCFI since the underlying
> > function definition does not match the function hook definition.
> > 
> > The return type of liteeth_start_xmit should be changed from int to
> > netdev_tx_t.
> > 
> > Reported-by: Dan Carpenter <error27@gmail.com>
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1703
> > Cc: llvm@lists.linux.dev
> > Signed-off-by: Nathan Huckleberry <nhuck@google.com>
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Acked-by: Gabriel Somlo <gsomlo@gmail.com>

Thanks,
--G

 
> > ---
> >  drivers/net/ethernet/litex/litex_liteeth.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/litex/litex_liteeth.c b/drivers/net/ethernet/litex/litex_liteeth.c
> > index fdd99f0de424..35f24e0f0934 100644
> > --- a/drivers/net/ethernet/litex/litex_liteeth.c
> > +++ b/drivers/net/ethernet/litex/litex_liteeth.c
> > @@ -152,7 +152,8 @@ static int liteeth_stop(struct net_device *netdev)
> >  	return 0;
> >  }
> >  
> > -static int liteeth_start_xmit(struct sk_buff *skb, struct net_device *netdev)
> > +static netdev_tx_t liteeth_start_xmit(struct sk_buff *skb,
> > +				      struct net_device *netdev)
> >  {
> >  	struct liteeth *priv = netdev_priv(netdev);
> >  	void __iomem *txbuffer;
> > -- 
> > 2.37.2.789.g6183377224-goog
> > 
