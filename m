Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4CB6AA3;
	Tue, 13 Sep 2022 23:09:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94563C433C1;
	Tue, 13 Sep 2022 23:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663110572;
	bh=pcH19MK6ESI/9MZwdBzNsbd8GjA8eDK+xjnqH2krCP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tIATb4ijmbgnmb9gCpxebU0lphb4lYu3ILc1nFy44RfIxfsWEjJWZL5XWwCT/aQJl
	 yNLwMhVcFsh9/WFjwLmdNc/ZIiNSVkSMb1B0+S3+sZn4G38TQ1wcjTs56RDZtAflP9
	 zbhJx4Fh1y08Z2RvmQ3FjLxeSReIS6PGnDYtvjmwr3Mpahp6u639iiTY/MNlXplCY6
	 8IYhDG93rMRtT/MGufRw09D+ZVvPbwWm7zWK8ovzUlq4dYKmvsp9pO2CJKTcjBs3Ic
	 TDdeUMfHSCiAm3/tLJEE0V1n9eLwGdPzxGFpr4mPlJuft8VRYBZ+M1osxDXSCO8g9h
	 LBE+e9mA+DuMw==
Date: Tue, 13 Sep 2022 16:09:29 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nathan Huckleberry <nhuck@google.com>
Cc: Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192u: Fix return type of ieee80211_xmit
Message-ID: <YyENqW9u3LxySbSk@dev-arch.thelio-3990X>
References: <20220912214559.929186-1-nhuck@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220912214559.929186-1-nhuck@google.com>

On Mon, Sep 12, 2022 at 02:45:56PM -0700, Nathan Huckleberry wrote:
> The ndo_start_xmit field in net_device_ops is expected to be of type
> netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).
> 
> The mismatched return type breaks forward edge kCFI since the underlying
> function definition does not match the function hook definition.
> 
> The return type of ieee80211_xmit should be changed from int to
> netdev_tx_t.
> 
> Reported-by: Dan Carpenter <error27@gmail.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1703
> Cc: llvm@lists.linux.dev
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>

The protoype in drivers/staging/rtl8192u/ieee80211/ieee80211.h should be
updated as well. With that:

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  drivers/staging/rtl8192u/ieee80211/ieee80211_tx.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_tx.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_tx.c
> index 8602e3a6c837..e4b6454809a0 100644
> --- a/drivers/staging/rtl8192u/ieee80211/ieee80211_tx.c
> +++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_tx.c
> @@ -526,7 +526,7 @@ static void ieee80211_query_seqnum(struct ieee80211_device *ieee,
>  	}
>  }
>  
> -int ieee80211_xmit(struct sk_buff *skb, struct net_device *dev)
> +netdev_tx_t ieee80211_xmit(struct sk_buff *skb, struct net_device *dev)
>  {
>  	struct ieee80211_device *ieee = netdev_priv(dev);
>  	struct ieee80211_txb *txb = NULL;
> @@ -822,13 +822,13 @@ int ieee80211_xmit(struct sk_buff *skb, struct net_device *dev)
>  			if ((*ieee->hard_start_xmit)(txb, dev) == 0) {
>  				stats->tx_packets++;
>  				stats->tx_bytes += __le16_to_cpu(txb->payload_size);
> -				return 0;
> +				return NETDEV_TX_OK;
>  			}
>  			ieee80211_txb_free(txb);
>  		}
>  	}
>  
> -	return 0;
> +	return NETDEV_TX_OK;
>  
>   failed:
>  	spin_unlock_irqrestore(&ieee->lock, flags);

I see 'return 1' down here, that doesn't appear to be a valid
'netdev_tx_t'. Should that be 'return NETDEV_TX_BUSY'? I guess that is
an outstanding issue though, just figured I would mention it.

> -- 
> 2.37.2.789.g6183377224-goog
> 

Cheers,
Nathan
