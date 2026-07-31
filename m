Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210F5357D0B
	for <llvm@lists.linux.dev>; Fri, 31 Jul 2026 21:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785534178; cv=pass; b=EU/ToRSsb1tuTrhDOOUriPGe6UWmjDSzlCFyJRpglglt5qeqFGrOFmfuOaAN+vrCsp87aSyZ8MVGqfeBirVUSs1vNrM2/Ia2jvjRfNjxrJ7OnWU4XuSZA3eaDYjywpnR5kkza4vn4tB0Cqe88wphuRzVixsZrgg3hkgtJmqqyhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785534178; c=relaxed/simple;
	bh=fJm5iExLLNg2dOOnBGa1utNmL4mzcQtyLXlrQky6wCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QEUo9/3JNyZOYkqggje6fDWCuS2qgo0E6F1gNCUzscOEUUmPwu0xgpWCizsjXk08OuYDtK2eV/s0wHYkDqucrEnfc2u0DQd+xDvpezXGX7KFV3iYkNFVqWZ1mFFo2cPOzU6XLRoZpVIaA8Ww4jQg5dKWUR4EIrxv/M+5i5bCNjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L7qDY7qN; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L7qDY7qN"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso2354881a12.3
        for <llvm@lists.linux.dev>; Fri, 31 Jul 2026 14:42:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785534175; cv=none;
        d=google.com; s=arc-20260327;
        b=ZufZG/bCKR2zQnGrnLWTOw7RpAJzfjbs0oqC8DnleAsqYBnm0bcI8aHWATEklgR5lQ
         n2nvdyPLpW1Aa4VCf67BVrAed6PsrmNmQYM6IvBLmlqMhOERFRNIhYq7iAa98CFm78Jd
         tBUG0c7zHNtzd6FaFXr/Y+gkU9nISA0VS09tabFafp16a01gWdr9pqJMsjihD1Nsrm+E
         WgCOtvmr2dLm90pOSOWAsBJKmZl/fNdMnGhVFUhVj2WVZyEHu07zpBCrKdvb2wlW0BBQ
         6fq9/sGMQVg6LhF7y4Rl2euqCe+KUoCz9siHbz/VztlVhex/e6ekP3mP+7zV3obSfzKv
         8s9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2w0TLt9QH7s0lqrlMH/OvUd0WbfPEFOdoqJKDBnB5Sw=;
        fh=aGEfzhwKYYtHPg5VgoSmy81jlrukrc+kVpiYX/J4//A=;
        b=ELQii1Vk/dkqsUHpLVTSOXHGCYqCC6Hyh73sjGbwBbZaT0+YVgI9umrlhml+jkITCn
         A8WADbL+y78+DBYlNRYIgKK/Bl5QI9IOZ2ZGPJvQRaYNbi2E8UKjAtz0d9aIVSd5fEys
         ND0hy4U/Yn9KuLOEsaQTPgLi8Tw4W1P9cY+eKtEFaU/5D8gtYj6d4Mo09qWwLj2qZLSP
         GQriszjggV39x8tRwSgazwHb2gKr3JoS/XPqK4FHWJbjpUWFSZJgWZqxE5b6hdW8Qm+m
         gdPEhagDDebbs+weHGbsPLgZOUp4fp12fr7zHlg/IVDUYJ4ppAHuB4YwKwRyA6U12KVo
         IzUQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785534175; x=1786138975; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2w0TLt9QH7s0lqrlMH/OvUd0WbfPEFOdoqJKDBnB5Sw=;
        b=L7qDY7qNYRgdXCH+TWhlfKII9U0s3LPKFdMQ8iz15v46JESCp6qw7XBw9MtS44+H2E
         hwX/pXa5eTlzoXkg3gRzdaE7VlsrhCWiQa588CtaUxK+G63MmY2p0lJIvgx2WWQLSdok
         fYy5OUQxW5ZzHyKSQmek4vwY5/ZisQGW/jH9YVh2hbG8HpiTiy8SqKWD1HHd1P7g9McU
         JtWND/J9T+Ab99MHUg0yd+UxuidgcJGbAdr8XR+M2tMg+T52OYOftgUSpcy+PEXQLBZJ
         lqxIRyZXdqI/i+0bg9Oi0bKIqd7RgIAepmCUmRFtEdMqF2VZD/2RHOxcfe2wIuWR7106
         YuCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785534175; x=1786138975;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2w0TLt9QH7s0lqrlMH/OvUd0WbfPEFOdoqJKDBnB5Sw=;
        b=bG/ePCrCgpyaydO+kBh71GGu/xa9MY1HTcQd1WmUczIgdVhiy/2fqFObOrEqcYHUXo
         p8s5g4Sux/ETQNpjho16ejxyeBqEW0TLCmSV7jIn5cM+JOP0XwCNEDeq3GpRVgmoGmB4
         6MaOTk7J0nHcPkJh0/L++jhTTuZ968f/iarIwCeHOiFj0ciP23xSdYqW/0F5LFereUud
         x9O1mUlj2yMtwZlsGEyCSVNIaJP1Ql15tdRfK9ufYwJBotH+zsQRk8tKuNfUGX89v5F2
         /X9cpM6yF2oETm9L+SyVgEqQZFQKQVec8iMo9fRydZ7JeJug3YAfyoYYq/8KLcUKzeMy
         o/Wg==
X-Forwarded-Encrypted: i=1; AHgh+RrBCsjCfzpQf21TAI2pYXPbvv+bC3Vn+hgNhkArUJ1CQQQUUwr+/JpVpSgUgrP0GuLSwkAD@lists.linux.dev
X-Gm-Message-State: AOJu0YzdkRYsFbi10HOVUdn+0C6yYIv6fcq04QE06bvqThsRnoBxm612
	Ldcijlb4TaGt7x3h4wy2UUzwqZi/IsjGn87yv4dSUaoEkJvK6mE2CyxGXIySu0q0xl2r5/ekV0l
	pNKEXbh5jVm7wsEN3dWMu9nlWZpzl2NqwXOO6Ib0j
X-Gm-Gg: AR+sD113kLj/tJ7IHf0fZFfxRMh0xrLxkcCr//WBlkT6u2xY2aS2SwMvMeGCBf6ATBa
	/xon3NMsqKy9/0isCTRo2P+/HJ4cE1VGxLQDJ7tH4Wl/Jaj36UfdyqgX4o+eOMnzd0btDDVlvJc
	tXEs2Z8Lvtong3GaheWrlsPoOFmG2r85my/QrWM5owOWUtA47vQG9dO89uK/yzBvBuUhHjQYGJb
	Nm6brY/jSX3KMkp6roPFqQkdnCGt2H6IwiUSmvQ6KdwhTVw5tQ/dk5BrFCkMdbSTOXhH0V1mHNj
	PjO8SqXbuDxekcypuct2OWK5VHX2C/sWZ1080fzGNu4qdv0UYbjQIQf2sj3FZxmulkZT3/PfToK
	sEYSaP0iyfv3X11uiLc+lFxud4ANEz8HXqyxmGEyvDEY6X1a89O5Lk4umYkE=
X-Received: by 2002:a17:907:961a:b0:c16:8aed:cec3 with SMTP id
 a640c23a62f3a-c1fe8315915mr71437266b.58.1785534174731; Fri, 31 Jul 2026
 14:42:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260731-airoha-spinlock-array-fix-v1-1-863a7e239a5f@kernel.org>
In-Reply-To: <20260731-airoha-spinlock-array-fix-v1-1-863a7e239a5f@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 31 Jul 2026 14:42:42 -0700
X-Gm-Features: AUfX_mxeDK0UjkpXMoBLEays-SsJvXAu7pPwCo_E4Ldx0HgqctY1Xwd1UgDCFnY
Message-ID: <CAKwvOdm0NpX9LXO9J=u4+S3-VzJN0_jxBMy=aDf6zUi9r5L=qQ@mail.gmail.com>
Subject: Re: [PATCH net-next] net: airoha: fix ARRAY_SIZE() division by zero
 on UP builds
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Simon Horman <horms@kernel.org>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	llvm@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 8:48=E2=80=AFAM Lorenzo Bianconi <lorenzo@kernel.or=
g> wrote:
>
> airoha_alloc_gdm_device() initializes the txq_lock[] array iterating
> over ARRAY_SIZE(dev->txq_lock). ARRAY_SIZE() expands to
> sizeof(dev->txq_lock) / sizeof((dev->txq_lock)[0]), but on UP builds
> (CONFIG_SMP unset, CONFIG_DEBUG_SPINLOCK unset) arch_spinlock_t is an
> empty struct, so sizeof(spinlock_t) is zero and the expression is a
> compile-time division by zero (undefined behavior), reported by clang
> as "division by zero is undefined [-Wdivision-by-zero]".
>
> Since the array is statically sized with AIROHA_NUM_NETDEV_TX_RINGS,
> use the named constant as loop bound instead of ARRAY_SIZE().
>
> Fixes: 78a35725e533 ("net: airoha: defer GDM3/GDM4 WAN mode and GDM2 loop=
back to QoS offload")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202607311850.6p0ZUVq4-lkp@i=
ntel.com/
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index dba7c52c0896..64619e9a704d 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -3467,7 +3467,7 @@ static int airoha_alloc_gdm_device(struct airoha_et=
h *eth,
>         netdev->dev.of_node =3D of_node_get(np);
>         dev =3D netdev_priv(netdev);
>         u64_stats_init(&dev->stats.syncp);
> -       for (i =3D 0; i < ARRAY_SIZE(dev->txq_lock); i++)
> +       for (i =3D 0; i < AIROHA_NUM_NETDEV_TX_RINGS; i++)
>                 spin_lock_init(&dev->txq_lock[i]);
>         dev->port =3D port;
>         dev->eth =3D eth;
>
> ---
> base-commit: 2fbade66245059c78daeaccfce13ecf499fffb51
> change-id: 20260731-airoha-spinlock-array-fix-d239f7841cb8
>
> Best regards,
> --
> Lorenzo Bianconi <lorenzo@kernel.org>
>


--=20
Thanks,
~Nick Desaulniers
