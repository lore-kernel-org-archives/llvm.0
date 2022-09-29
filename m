Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07DD53B5
	for <llvm@lists.linux.dev>; Thu, 29 Sep 2022 18:44:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E786BC433D6;
	Thu, 29 Sep 2022 18:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664477098;
	bh=GhiMP37z6iD9dr2AzNoaCONOVGPUM81UxwDaptwk07M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RHTCEw8u6eFHH5yhzKSVA2uqMxZqS/Y3MXr3srRfTRDcnnkuuRId5pPr55qgV6qM8
	 gXAQqGpC5apfQcHqr3TLsJ2NK8o+EqJll4z6J4lDtt7oiZQUrEy4AbyW8YtFUogxTT
	 2vOJaRua/SSmHtvKHB+BSsPCz9prq0Ow1AznHHy8lyZZX/MtmLZGsbPt5EtuRalSbh
	 t5xonO7CSRbEfbfZNpqwBzwP+dWUGZ908qVusv1K9NiEvkRwMwQugoK7VY3yPeh+hP
	 Lx8CUu3LgFKCzg4hBbX1HdfMfvf1m/mynq7IR5ZkQb1Hs5rIvLRWlg+eUnKbeKKLT9
	 b8czLCXht1xnA==
Date: Thu, 29 Sep 2022 11:44:56 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nathan Huckleberry <nhuck@google.com>
Cc: Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	UNGLinuxDriver@microchip.com,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: lan966x: Fix return type of lan966x_port_xmit
Message-ID: <YzXnqJ+fdogA1GHs@dev-arch.thelio-3990X>
References: <20220929182704.64438-1-nhuck@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220929182704.64438-1-nhuck@google.com>

On Thu, Sep 29, 2022 at 11:27:03AM -0700, Nathan Huckleberry wrote:
> The ndo_start_xmit field in net_device_ops is expected to be of type
> netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).
> 
> The mismatched return type breaks forward edge kCFI since the underlying
> function definition does not match the function hook definition.
> 
> The return type of lan966x_port_xmit should be changed from int to
> netdev_tx_t.
> 
> Reported-by: Dan Carpenter <error27@gmail.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1703
> Cc: llvm@lists.linux.dev
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  drivers/net/ethernet/microchip/lan966x/lan966x_main.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> index b98d37c76edb..be2fd030cccb 100644
> --- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> @@ -344,7 +344,8 @@ static void lan966x_ifh_set_timestamp(void *ifh, u64 timestamp)
>  		IFH_POS_TIMESTAMP, IFH_LEN * 4, PACK, 0);
>  }
>  
> -static int lan966x_port_xmit(struct sk_buff *skb, struct net_device *dev)
> +static netdev_tx_t lan966x_port_xmit(struct sk_buff *skb,
> +				     struct net_device *dev)
>  {
>  	struct lan966x_port *port = netdev_priv(dev);
>  	struct lan966x *lan966x = port->lan966x;
> -- 
> 2.38.0.rc1.362.ged0d419d3c-goog
> 
