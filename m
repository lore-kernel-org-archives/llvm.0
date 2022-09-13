Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE26671B;
	Tue, 13 Sep 2022 22:33:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA317C433C1;
	Tue, 13 Sep 2022 22:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663108406;
	bh=dqukAa/QNATCYFRuSfax+0gWFcpGIvrk73Zu/gYLssU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cd2GiwwLpN00ybuNm4ICzIjRbOP/S/odTyDR9d8QBQRSHENwHENk7bl0NBkwZb5Y+
	 ccGh2Ca6tJTgJPE9gmNIZhse71WapB96qTRZL3LNOkBZTkzbqMy53uL447A+sG8JZP
	 BvzbkLCEF3AfZO5yWa2TCGkrRRwL+8JFdlKc35zh5dUk/GrgQFmvFrs446/bWl4I0a
	 qWeqCZzG8EhJKG1xr2nXJsDxbAQPXs1bEjuyhdzjZI4vDPk4Q/O5I8Su1GFgB7A96+
	 o/uvb/rQsjFQhNLsjuPZPi8YlftX29lkRtNDjEANEq19NKLfhnILYyDGwWDpEP+jdO
	 elbDs03pHfQxA==
Date: Tue, 13 Sep 2022 15:33:24 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nathan Huckleberry <nhuck@google.com>
Cc: Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: octeon: Fix return type of cvm_oct_xmit and
 cvm_oct_xmit_pow
Message-ID: <YyEFNA3nVShxwkJT@dev-arch.thelio-3990X>
References: <20220912214523.929094-1-nhuck@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220912214523.929094-1-nhuck@google.com>

On Mon, Sep 12, 2022 at 02:45:20PM -0700, Nathan Huckleberry wrote:
> The ndo_start_xmit field in net_device_ops is expected to be of type
> netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).
> 
> The mismatched return type breaks forward edge kCFI since the underlying
> function definition does not match the function hook definition.
> 
> The return type of cvm_oct_xmit and cvm_oct_xmit_pow should be changed
> from int to netdev_tx_t.
> 
> Reported-by: Dan Carpenter <error27@gmail.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1703
> Cc: llvm@lists.linux.dev
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  drivers/staging/octeon/ethernet-tx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/octeon/ethernet-tx.c b/drivers/staging/octeon/ethernet-tx.c
> index 1ad94c5060b5..a36e36701c74 100644
> --- a/drivers/staging/octeon/ethernet-tx.c
> +++ b/drivers/staging/octeon/ethernet-tx.c
> @@ -125,7 +125,7 @@ static void cvm_oct_free_tx_skbs(struct net_device *dev)
>   *
>   * Returns Always returns NETDEV_TX_OK
>   */
> -int cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
> +netdev_tx_t cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
>  {
>  	union cvmx_pko_command_word0 pko_command;
>  	union cvmx_buf_ptr hw_buffer;
> @@ -506,7 +506,7 @@ int cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
>   * @dev:    Device info structure
>   * Returns Always returns zero
>   */
> -int cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev)
> +netdev_tx_t cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev)
>  {
>  	struct octeon_ethernet *priv = netdev_priv(dev);
>  	void *packet_buffer;
> -- 
> 2.37.2.789.g6183377224-goog
> 
