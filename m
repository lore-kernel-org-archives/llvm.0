Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9453AA8C
	for <llvm@lists.linux.dev>; Thu, 22 Jun 2023 11:23:21 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-98d34f1e54fso53090666b.2
        for <llvm@lists.linux.dev>; Thu, 22 Jun 2023 04:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687433000; x=1690025000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4UocAtdDWcFQBDQbyMRTlVN+OJ+gn9xShV1KG/UJtLY=;
        b=rN2btcZTRGffzs30pcg7ygyRKMBqDI/BwxntPxdDURMQnIf6Vmp6s9TY7fBuFJ0+t2
         saPDH6X3kBpMxPo8mt1Cj6nMFXWeYuR0qPiLezKRrYPeR4NA3tVfugkPoztw2O5O4A/p
         rkOdAh4PzAAHVoF0kASmBqHmyPCzddMiR8IHZtb8ruafeZYGhvLy42xNPPPvguh7WhtI
         tr+Qz3OMtcHafMAuzoOFOOtTwuEjhjbm2QTlBfWB+6L0fenh2xs9FSHd4FcS3f6rFDAq
         r8Ss10UeHNWGzMZJcSa4D+YS6aerXMS760IDUiIm1de/s8NfxM/AF2FMqq7ZoeXV2R06
         F0TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687433000; x=1690025000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4UocAtdDWcFQBDQbyMRTlVN+OJ+gn9xShV1KG/UJtLY=;
        b=NnsVqpRGf6SMx/cJYzUVLbDqHT49cd4xCp6rJ6uTfZwwQNG8Zxaq+nbsw91MQzDZ4r
         sEuEsvHNb/dbn/xb1LJte8Fb3vhTm6U/tH+JPjqGhlA5LU2KhFkjZyMrQnC0YXAXMMs1
         El6bwWRTT9QELteXP6GvbsoTztAm0VTOY/+FTfc4kDewjeyX07chYYWuOdQd7wXW+WOT
         nR5i8dR7rBZJ6VGe/SXD1HaUmab2WhMFsZE3LfcfOEyG8Mu3rH5kWCXngFCBLgDvrB5L
         /zEro3ELj/CpXS+AQC3yD0SkKjKX5tREf6nC2VotVroinIki29TV7vZXp1icAEN1wlAX
         7XpQ==
X-Gm-Message-State: AC+VfDyZCTM4K7JrSHDSIvUuyrzHPgpJH3jVPLa4DEqef0HJ4Iw/L+qV
	28wiGLH2cnF/rDBltomW2Us=
X-Google-Smtp-Source: ACHHUZ5+/XDr7zjREO9Rhn687ZoQED5eTf5whc9kFKCn75VYd+gw1XZkapdK2ttJ5aWQgvOkcTXkuQ==
X-Received: by 2002:a17:907:3684:b0:969:e95e:e4f3 with SMTP id bi4-20020a170907368400b00969e95ee4f3mr14767392ejc.55.1687432999409;
        Thu, 22 Jun 2023 04:23:19 -0700 (PDT)
Received: from localhost ([45.139.122.241])
        by smtp.gmail.com with ESMTPSA id kk10-20020a170907766a00b00988a6421831sm4502765ejc.93.2023.06.22.04.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 04:23:18 -0700 (PDT)
Date: Thu, 22 Jun 2023 14:23:17 +0300
From: Maxim Mikityanskiy <maxtram95@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Tariq Toukan <tariqt@nvidia.com>,
	Adham Faris <afaris@nvidia.com>, netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] mlx5: avoid integer overflow warning for large page size
Message-ID: <ZJQvJZxZkYfqGAJu@mail.gmail.com>
References: <20230622101525.3321642-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622101525.3321642-1-arnd@kernel.org>

On Thu, 22 Jun 2023 at 12:15:02 +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Build testing with 'make LLVM=1 W=1' shows a warning about a
> condition that is always true on configurations with 64KB
> pages:
> 
> drivers/net/ethernet/mellanox/mlx5/core/en/xsk/setup.c:32:22: error: result of comparison of constant 65536 with expression of type 'u16' (aka 'unsigned short') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
> 
> Change the condition in a way that lets clang know this
> is intentional.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/net/ethernet/mellanox/mlx5/core/en/xsk/setup.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/xsk/setup.c b/drivers/net/ethernet/mellanox/mlx5/core/en/xsk/setup.c
> index 36826b5824847..b9f62e531bd4c 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/en/xsk/setup.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en/xsk/setup.c
> @@ -29,7 +29,8 @@ bool mlx5e_validate_xsk_param(struct mlx5e_params *params,
>  			      struct mlx5_core_dev *mdev)
>  {
>  	/* AF_XDP doesn't support frames larger than PAGE_SIZE. */
> -	if (xsk->chunk_size > PAGE_SIZE || xsk->chunk_size < MLX5E_MIN_XSK_CHUNK_SIZE) {
> +	if ((PAGE_SIZE < U16_MAX && xsk->chunk_size > PAGE_SIZE)
> +	    || xsk->chunk_size < MLX5E_MIN_XSK_CHUNK_SIZE) {

I recall you already sent a fix to silence this warning before:

https://lore.kernel.org/netdev/20211015152056.2434853-1-arnd@kernel.org/

I prefer that old one, as it's more future-proof to cast to size_t here
in place (chunk_size won't be bigger than size_t for sure). With your
new patch, if chunk_size is ever changed from u16 to u32, it's likely
that this place will be unnoticed, and a bug will be introduced.

>  		mlx5_core_err(mdev, "XSK chunk size %u out of bounds [%u, %lu]\n", xsk->chunk_size,
>  			      MLX5E_MIN_XSK_CHUNK_SIZE, PAGE_SIZE);
>  		return false;
> -- 
> 2.39.2
> 
