Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255BD671F;
	Tue, 13 Sep 2022 23:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F147C433D6;
	Tue, 13 Sep 2022 23:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663110761;
	bh=As3E/5cVHJLb20FXFderpxKGHqSXrRunlE+X5ctrt8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=klS7TgFo8gwWLAQxxz2ru+T8tfcS/nLmWqn//q7EReQUj/9yBnt4XG9w6/sW0AAnF
	 k0gmaCvVa0PGaGSPASl3vvx9yhMHxhYGboCTQWVdzWpWakkrmtUOaBWVANvAYX7HwB
	 /a/RwX3C5PS7tDhogxj5Ihtble/uKDcYqfsgyCZhRLr/6bNo1Gnpj1CWLzSKX9zzs8
	 y2u/qVFQdV7fqThAgA9eBqos0ofHe3SddlINXLqv9Jc+Iki8Zz8Jks10eT6NFc5Fml
	 8ILlX9xWgsPNMQnB6wvA4izBd0hfs7RgjC82QG/qNFKRJdb0+bfJtILPw0vWWgDEW2
	 hSCv+C+TvD9Aw==
Date: Tue, 13 Sep 2022 16:12:39 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nathan Huckleberry <nhuck@google.com>
Cc: Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Sathish Kumar <skumark1902@gmail.com>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8712: Fix return type of r8712_xmit_entry
Message-ID: <YyEOZ+u/T8rP6o9S@dev-arch.thelio-3990X>
References: <20220912214607.929211-1-nhuck@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220912214607.929211-1-nhuck@google.com>

On Mon, Sep 12, 2022 at 02:46:03PM -0700, Nathan Huckleberry wrote:
> The ndo_start_xmit field in net_device_ops is expected to be of type
> netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).
> 
> The mismatched return type breaks forward edge kCFI since the underlying
> function definition does not match the function hook definition.
> 
> The return type of r8712_xmit_entry should be changed from int to
> netdev_tx_t.
> 
> Reported-by: Dan Carpenter <error27@gmail.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1703
> Cc: llvm@lists.linux.dev
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>

The prototype in drivers/staging/rtl8712/xmit_osdep.h should be updated
as well. With that:

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  drivers/staging/rtl8712/xmit_linux.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8712/xmit_linux.c b/drivers/staging/rtl8712/xmit_linux.c
> index 4a93839bf947..e84b9fa231cd 100644
> --- a/drivers/staging/rtl8712/xmit_linux.c
> +++ b/drivers/staging/rtl8712/xmit_linux.c
> @@ -140,7 +140,7 @@ void r8712_xmit_complete(struct _adapter *padapter, struct xmit_frame *pxframe)
>  	pxframe->pkt = NULL;
>  }
>  
> -int r8712_xmit_entry(_pkt *pkt, struct  net_device *netdev)
> +netdev_tx_t r8712_xmit_entry(_pkt *pkt, struct  net_device *netdev)
>  {
>  	struct xmit_frame *xmitframe = NULL;
>  	struct _adapter *adapter = netdev_priv(netdev);
> @@ -165,11 +165,11 @@ int r8712_xmit_entry(_pkt *pkt, struct  net_device *netdev)
>  	}
>  	xmitpriv->tx_pkts++;
>  	xmitpriv->tx_bytes += xmitframe->attrib.last_txcmdsz;
> -	return 0;
> +	return NETDEV_TX_OK;
>  _xmit_entry_drop:
>  	if (xmitframe)
>  		r8712_free_xmitframe(xmitpriv, xmitframe);
>  	xmitpriv->tx_drop++;
>  	dev_kfree_skb_any(pkt);
> -	return 0;
> +	return NETDEV_TX_OK;
>  }
> -- 
> 2.37.2.789.g6183377224-goog
> 
