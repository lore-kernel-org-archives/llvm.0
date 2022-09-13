Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294586AA5;
	Tue, 13 Sep 2022 23:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09C7AC433D6;
	Tue, 13 Sep 2022 23:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663111018;
	bh=3akCnlPgGO2b94vai2rGkaY0WUN32BXWSzV+OlLrLqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oCck64zae9cjer4LrijeWD2DGLe3zG6FLrq+Tm2YyOvzNZ+BklYTVD2BuOWVKoOqy
	 AIc4Z/uJJFlI85RtIZ5J1Yd888ZONiS8VOC8edKRoML9A5Tc8ZA+r622f0uPjVjiVi
	 va0IVi7pRJn/PkAyStD0ryb9aAxDMFbGP2YmXp1biBqCLzO7maxxdP50Yyb1/2IpA4
	 cnwbJu1x2p3ey30bxivvFjUahcggLq22Gd69mreKueyzod0vH4JeKv81C7YaO1TxyS
	 O+zQzLegDkJiExDHKBCusvLd8fEVEP+2UOopc9B5CU9vLONxW6M7yHCebeqw/6gRRZ
	 ZYkp5mcSLHbqQ==
Date: Tue, 13 Sep 2022 16:16:56 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nathan Huckleberry <nhuck@google.com>
Cc: namcaov@gmail.com, Larry.Finger@lwfinger.net, error27@gmail.com,
	gregkh@linuxfoundation.org, insafonov@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	llvm@lists.linux.dev, makvihas@gmail.com, ndesaulniers@google.com,
	paskripkin@gmail.com, phil@philpotter.co.uk,
	saurav.girepunje@gmail.com, trix@redhat.com
Subject: Re: [PATCH v2] staging: r8188eu: Fix return type of rtw_xmit_entry
Message-ID: <YyEPaMVRmdGQdoql@dev-arch.thelio-3990X>
References: <CA+sZ8B8RStBhofQ0=vvzH5FeQ66fj90DdCj9EQSaVErbVPLi7g@mail.gmail.com>
 <20220913193322.18776-1-nhuck@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913193322.18776-1-nhuck@google.com>

On Tue, Sep 13, 2022 at 12:33:22PM -0700, Nathan Huckleberry wrote:
> The ndo_start_xmit field in net_device_ops is expected to be of type
> netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).
> 
> The mismatched return type breaks forward edge kCFI since the underlying
> function definition does not match the function hook definition.
> 
> The return type of rtw_xmit_entry should be changed from int to
> netdev_tx_t.
> 
> Reported-by: Dan Carpenter <error27@gmail.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1703
> Cc: llvm@lists.linux.dev
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>

The prototype in drivers/staging/r8188eu/include/xmit_osdep.h should be
updated as well. With that:

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> Changes v1 -> v2:
>  - Rebased onto linux-next/master
> 
> ---
>  drivers/staging/r8188eu/core/rtw_xmit.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
> index 98864fc55b25..ea13f11b231b 100644
> --- a/drivers/staging/r8188eu/core/rtw_xmit.c
> +++ b/drivers/staging/r8188eu/core/rtw_xmit.c
> @@ -2289,7 +2289,7 @@ static int rtw_mlcst2unicst(struct adapter *padapter, struct sk_buff *skb)
>  	return true;
>  }
>  
> -int rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)
> +netdev_tx_t rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)
>  {
>  	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(pnetdev);
>  	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
> @@ -2323,5 +2323,5 @@ int rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)
>  	dev_kfree_skb_any(pkt);
>  
>  exit:
> -	return 0;
> +	return NETDEV_TX_OK;
>  }
> -- 
> 2.37.2.789.g6183377224-goog
> 
