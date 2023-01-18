Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31B415B6
	for <llvm@lists.linux.dev>; Wed, 18 Jan 2023 06:49:25 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so698136wml.3
        for <llvm@lists.linux.dev>; Tue, 17 Jan 2023 22:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X3j7TK4o15smaY9j7yBCCWkNi0k481whvm/a6xLSW68=;
        b=qEgfCW2osBy04NQeCBEIzIVQ3BSrHa19rj4E/ZwZb6l+m5MuPKXkWFRMxxgTrwNlKF
         S+agjzMsDo44oOWxavGbaBVcclkBQrIsfWcGyseeMgDIYMHHVGCIN+q/Zxis9KpdXobk
         TgHGo7d39AHHzsyNFI2dBUlqXpNRiLjTw+Pb/h+aVhFo1fBW2C/kyhtQjELfcrpHqj3q
         L72Mzo6enk84zTLrMNkYFKkQq+Rgjzr2W5c0KBz4mV2akothtYIt2d/Qwof2KsxlbT4u
         F3safktAdjdtFHT5z3rGV5OrGy9N6pkvsLd8iNVfoyUL1FCe9pvor4BjK37Y5kChox1Z
         hH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X3j7TK4o15smaY9j7yBCCWkNi0k481whvm/a6xLSW68=;
        b=XeHKUg2KASV7Hd9HTHzcYuGz2NmhkQEnKAIrvFgcOExewowmmdHTnKezDp2KhJWgqa
         0NXWGj+lO26jpQIuN8f+S0IYgFZjuRIHiJVhriwflm1spNSKyM/G+748iDnXOQgrGwTf
         1VGxQQ0jO1ui2bqd9xi2uIE189pynVKH5OLuMA37dVfNpKruxHm75IRraRdAG8ozhm+w
         EVrXK7tvpTx4x3yQY0KBezsxwb3Ej1z+fSVBaWNgJA+P8Yl70v+226K3TejNuAuyokUm
         gQUjAEFkHugBYfGHq0bteCW5oRyY2gFuv8VXqRndGtNaOnZMfyknNVHYMkmZcqYUSmDE
         LXjg==
X-Gm-Message-State: AFqh2kq0URr2LXYxrdoKOZ+6Wi0Ty3jME95sbhXfvlougadoZfSzaKBi
	00Mc5Fphl36b1fMXtE0pdCc=
X-Google-Smtp-Source: AMrXdXsIkAT4mygynpSuSNgl7Bn0qYNULYecV3TnXtqIIyJ/+LBrwp9/iDLLEBDAyljXZZCAC7j8Kw==
X-Received: by 2002:a05:600c:3acc:b0:3d9:efe8:a424 with SMTP id d12-20020a05600c3acc00b003d9efe8a424mr5780077wms.34.1674024563807;
        Tue, 17 Jan 2023 22:49:23 -0800 (PST)
Received: from [192.168.0.103] ([77.126.105.148])
        by smtp.gmail.com with ESMTPSA id o7-20020a5d62c7000000b002bbeda3809csm24594261wrv.11.2023.01.17.22.49.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 22:49:23 -0800 (PST)
Message-ID: <c3fac862-2f5a-6be8-5be2-19bf5866c067@gmail.com>
Date: Wed, 18 Jan 2023 08:49:20 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] [v2] mlx5: reduce stack usage in mlx5_setup_tc
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 Tariq Toukan <tariqt@nvidia.com>, Maxim Mikityanskiy <maximmi@nvidia.com>,
 Gal Pressman <gal@nvidia.com>, Lama Kayal <lkayal@nvidia.com>,
 Moshe Tal <moshet@nvidia.com>, netdev@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20230117210324.1371169-1-arnd@kernel.org>
From: Tariq Toukan <ttoukan.linux@gmail.com>
In-Reply-To: <20230117210324.1371169-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 17/01/2023 23:01, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Clang warns about excessive stack usage on 32-bit targets:
> 
> drivers/net/ethernet/mellanox/mlx5/core/en_main.c:3597:12: error: stack frame size (1184) exceeds limit (1024) in 'mlx5e_setup_tc' [-Werror,-Wframe-larger-than]
> static int mlx5e_setup_tc(struct net_device *dev, enum tc_setup_type type,
> 
> It turns out that both the mlx5e_setup_tc_mqprio_dcb() function and
> the mlx5e_safe_switch_params() function it calls have a copy of
> 'struct mlx5e_params' on the stack, and this structure is fairly
> large.
> 
> Use dynamic allocation for the inner one.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: simplify the patch
> ---
>   .../net/ethernet/mellanox/mlx5/core/en_main.c   | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
> 

Thanks for your patch.
Reviewed-by: Tariq Toukan <tariqt@nvidia.com>
