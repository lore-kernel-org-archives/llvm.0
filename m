Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42D2671E
	for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 23:26:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA731C433D6;
	Tue, 13 Sep 2022 23:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663111568;
	bh=MKctTCCNB0zUHFjYAFLnoWEYFaMOJC3oZ8vlBp9GnrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=En+foSMdKI8Cm8iTxy3UXjB0XEFCrepqECzxWueLigjoRHXBzHkbaVNaKVMpRJTYF
	 gYiLEZb4sVQLj0BkH3s9jiXTtX/QZjTVnZnABCaW8/4OubH+THJrxKF1Gd9WUnOCMS
	 Y/sMQ8XW18aKmN52aVxdeoVh2igiNs0bZM5ixvYd5GCP/eUNbwVl2e/hsNTV+uOjYo
	 u24C4q72ArBYHA+blb6JhpKCZvb8rDjdZxmCEQuRm6wUXn6JlbqA6pVswoxoC4mj1V
	 7JJS+nXBHr125rUu874rnRQHdVIh+lTZgyNx+17Z4kpDfohOrEol6lj34kfqG4kVDt
	 49X9IX4ziNShg==
Date: Tue, 13 Sep 2022 16:26:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nathan Huckleberry <nhuck@google.com>
Cc: Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev,
	Pravin B Shelar <pshelar@ovn.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, netdev@vger.kernel.org,
	dev@openvswitch.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] openvswitch: Change the return type for vport_ops.send
 function hook to int
Message-ID: <YyERjpSlz+MVCULd@dev-arch.thelio-3990X>
References: <20220913230739.228313-1-nhuck@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913230739.228313-1-nhuck@google.com>

On Tue, Sep 13, 2022 at 04:07:38PM -0700, Nathan Huckleberry wrote:
> All usages of the vport_ops struct have the .send field set to
> dev_queue_xmit or internal_dev_recv.  Since most usages are set to
> dev_queue_xmit, the function hook should match the signature of
> dev_queue_xmit.
> 
> The only call to vport_ops->send() is in net/openvswitch/vport.c and it
> throws away the return value.
> 
> This mismatched return type breaks forward edge kCFI since the underlying
> function definition does not match the function hook definition.
> 
> Reported-by: Dan Carpenter <error27@gmail.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1703
> Cc: llvm@lists.linux.dev
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  net/openvswitch/vport-internal_dev.c | 2 +-
>  net/openvswitch/vport.h              | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/net/openvswitch/vport-internal_dev.c b/net/openvswitch/vport-internal_dev.c
> index 35f42c9821c2..74c88a6baa43 100644
> --- a/net/openvswitch/vport-internal_dev.c
> +++ b/net/openvswitch/vport-internal_dev.c
> @@ -190,7 +190,7 @@ static void internal_dev_destroy(struct vport *vport)
>  	rtnl_unlock();
>  }
>  
> -static netdev_tx_t internal_dev_recv(struct sk_buff *skb)
> +static int internal_dev_recv(struct sk_buff *skb)
>  {
>  	struct net_device *netdev = skb->dev;
>  
> diff --git a/net/openvswitch/vport.h b/net/openvswitch/vport.h
> index 7d276f60c000..6ff45e8a0868 100644
> --- a/net/openvswitch/vport.h
> +++ b/net/openvswitch/vport.h
> @@ -132,7 +132,7 @@ struct vport_ops {
>  	int (*set_options)(struct vport *, struct nlattr *);
>  	int (*get_options)(const struct vport *, struct sk_buff *);
>  
> -	netdev_tx_t (*send) (struct sk_buff *skb);
> +	int (*send)(struct sk_buff *skb);
>  	struct module *owner;
>  	struct list_head list;
>  };
> -- 
> 2.37.2.789.g6183377224-goog
> 
