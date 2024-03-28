Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702B281754
	for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 15:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711640252; cv=none; b=p7PIwPCZD4fFMZSWhGP/CoFmGu/pWaR/iToDAlVuW5bAAltB7INMgDvlp2zUqTdjV0rGBpMPoX2Br0bBubjwXVcwwaExhjGwbTn9ro6VQ3GOg52rGxGUI4J2aR+Qc75N/pg0vc1PtbldrUIDlR/DGLPf1EUK0GAD7+PB1JKsI8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711640252; c=relaxed/simple;
	bh=ZfXVRtq1u5vymjiT7ojVTA9XFtGE28bgjB/onGJZ8hU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MzV4KXU6OwrgL06Q9iOLOoI47L47zRJeHM0Ov6UrVxNBl9JQgCUYkr+ggPdXhIKhsUR+ypQgOsyxKouczB5HRKj/fvOjgID+8v+F1rfikJj4w7Z/I+7JesH6eOe9EJc4FQm5kQPjUjcelIkngoPJ8ri9hV4tkVACjmGvFRYWz/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O5L5Nvfd; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5L5Nvfd"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so152068166b.0
        for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 08:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711640249; x=1712245049; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RhS2REDAhTzWK8iAd8IyYrz11N45EIO/J79cDyAdowQ=;
        b=O5L5NvfdI8+su4m8NsAs116zCl7Fz2EVUdj1oTghy/gXdK5h0Oe0r7HAkhilJHQKKH
         Esr5clLYLWez2Tn0qeEw6JJvQNzgeBTeH0IlGkpiPJs9MnK0bzzbeevKvDwfPh6lQMNe
         HJ8pbHd4AYseo180QGqBXiQ9h0/vQq3tKqDwwlxTFQddM6cgd3hH+JfkwM4mgdfK7nb2
         yEWZ4F0tIIyvtFXlqvjfF572n+gdmkx0jKdPKF5z7GGi26J0eqt2mzryIB6S6C72GVkR
         sgio3aGCnhtNHdxep4S53QCf2UQpgDcUWoG2YVPafLuqdUbUrA3Y/noPsawW4DPdH0LZ
         5ZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711640249; x=1712245049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RhS2REDAhTzWK8iAd8IyYrz11N45EIO/J79cDyAdowQ=;
        b=F/PfivbUzKK7aZmdX47uIgkOVWOvRBpE//mlQTvoAu41iipQsE5xxmDfMVB/2khJzW
         JPXQdvZvskhBxrgXxw0mq8f7gPVaWpEdsQqS1p7toZQWFKGPDovHMXr4TPOpT95+7dWe
         8pLsaJb9LeQZZ1Y3ysohZK0ggTV7HKzJ7ZVTi0E+juGd6ZMwlMMK+nzBvmWLxoSdAvJ1
         8SQi/MhlGsN8nu7HitSTPx6FTqsR1Gh3hD957t4HKvyfVpyAOYribHt6ooXoWIhPw+IS
         OR5ZQip5pTfzVyLgDo5YM0K/BuGE48r05u7Ahgq2Mv5ZqFJdTYtTUCi+ROQqgpV77Rrd
         0AUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpxeCbHZ1ZOfmtiqI6dVhQCJNVlX8ZOSWfdzcb6i60YZpk6FSqlg+8vLvTVus8d0G1NjgTdhm/8B6bro9KqkZJIgsNxw==
X-Gm-Message-State: AOJu0Yxp9NRJRy7ISvetkUgag6/w6PJ+mlYK61SZyg0DDsaEilVFMDp2
	vwZE/dKTjJki/QQQ3r9DI5sSb+IZ9XlTs1yf64m0kpRp/+COHotm
X-Google-Smtp-Source: AGHT+IHLAX8H+QbTYqezSKW4j0ZnyixcNtPA+A5huNZM9xWL44hJRChQo43XVH2PzR2CA3U0ALz53g==
X-Received: by 2002:a17:906:f0d0:b0:a4e:e20:df53 with SMTP id dk16-20020a170906f0d000b00a4e0e20df53mr2174114ejb.59.1711640248640;
        Thu, 28 Mar 2024 08:37:28 -0700 (PDT)
Received: from localhost ([185.220.101.129])
        by smtp.gmail.com with ESMTPSA id u14-20020a1709064ace00b00a46b8cd9b51sm877653ejt.185.2024.03.28.08.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 08:37:28 -0700 (PDT)
Date: Thu, 28 Mar 2024 17:37:15 +0200
From: Maxim Mikityanskiy <maxtram95@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Jonathan Lemon <jonathan.lemon@gmail.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Tariq Toukan <tariqt@nvidia.com>, Gal Pressman <gal@nvidia.com>,
	netdev@vger.kernel.org, linux-rdma@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 8/9] mlx5: stop warning for 64KB pages
Message-ID: <ZgWOqwZpNFzLT-VS@mail.gmail.com>
References: <20240328143051.1069575-1-arnd@kernel.org>
 <20240328143051.1069575-9-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328143051.1069575-9-arnd@kernel.org>

On Thu, 28 Mar 2024 at 15:30:46 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When building with 64KB pages, clang points out that xsk->chunk_size
> can never be PAGE_SIZE:
> 
> drivers/net/ethernet/mellanox/mlx5/core/en/xsk/setup.c:19:22: error: result of comparison of constant 65536 with expression of type 'u16' (aka 'unsigned short') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>         if (xsk->chunk_size > PAGE_SIZE ||
>             ~~~~~~~~~~~~~~~ ^ ~~~~~~~~~
> 
> In older versions of this code, using PAGE_SIZE was the only
> possibility, so this would have never worked on 64KB page kernels,
> but the patch apparently did not address this case completely.
> 
> As Maxim Mikityanskiy suggested, 64KB chunks are really not all that
> useful, so just shut up the warning by adding a cast.
> 
> Fixes: 282c0c798f8e ("net/mlx5e: Allow XSK frames smaller than a page")
> Link: https://lore.kernel.org/netdev/20211013150232.2942146-1-arnd@kernel.org/
> Link: https://lore.kernel.org/lkml/a7b27541-0ebb-4f2d-bd06-270a4d404613@app.fastmail.com/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/net/ethernet/mellanox/mlx5/core/en/xsk/setup.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/xsk/setup.c b/drivers/net/ethernet/mellanox/mlx5/core/en/xsk/setup.c
> index 06592b9f0424..9240cfe25d10 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/en/xsk/setup.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en/xsk/setup.c
> @@ -28,8 +28,10 @@ bool mlx5e_validate_xsk_param(struct mlx5e_params *params,
>  			      struct mlx5e_xsk_param *xsk,
>  			      struct mlx5_core_dev *mdev)
>  {
> -	/* AF_XDP doesn't support frames larger than PAGE_SIZE. */
> -	if (xsk->chunk_size > PAGE_SIZE || xsk->chunk_size < MLX5E_MIN_XSK_CHUNK_SIZE) {
> +	/* AF_XDP doesn't support frames larger than PAGE_SIZE,
> +	 * and xsk->chunk_size is limited to 65535 bytes.
> +	 */
> +	if ((size_t)xsk->chunk_size > PAGE_SIZE || xsk->chunk_size < MLX5E_MIN_XSK_CHUNK_SIZE) {

Acked-by: Maxim Mikityanskiy <maxtram95@gmail.com>

>  		mlx5_core_err(mdev, "XSK chunk size %u out of bounds [%u, %lu]\n", xsk->chunk_size,
>  			      MLX5E_MIN_XSK_CHUNK_SIZE, PAGE_SIZE);
>  		return false;
> -- 
> 2.39.2
> 
