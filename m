Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E39F1B0411
	for <llvm@lists.linux.dev>; Sun,  9 Mar 2025 11:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741520626; cv=none; b=Ro4jyKwKdyKirRwvhQ+lpe/rvbt8OANddbgltrFn1W78B1+hxk9ewQWMxRpKB/z5cGp7WyACuME+ybmKx9x6eNRkkXJvGTcBdZbzGUrffusFKC4KZVrTmY3Ug+W4SM+AJWkmpwTQSO34okBMNqAlYDyCR1tbRq/80hkAyeXJPc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741520626; c=relaxed/simple;
	bh=2sv+Z6u0e63RMs+eEz2YCcrjaLa9sh0py9xQ9g7VzTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XbavF3MBzKbc/4LlBMhtTw/y4NOgdAG7ON5eZXp0JnJ4tbtBJ+rlfWWd2F7Nx03l7X8jPfPhzGnRSbcUjQD1dfuH8WFeLGFoyYv/vczum/zYOXOgj9X9jDq/FnpGkFOMy5LJoio5/YPGA98dxKisDK+sm1wIUIi+vcIOISvfN8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O4ojojVG; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O4ojojVG"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e64700a38cso1090172a12.1
        for <llvm@lists.linux.dev>; Sun, 09 Mar 2025 04:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741520623; x=1742125423; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p2Foe3XwhvNs3FCKXrg4j2vvhvp7L38WiHksGts8MLY=;
        b=O4ojojVG0z7CFT9VI39L9J1LNjIr9inn1pm5KioCp72WBK6y954XjZT4NQz23Jz8oa
         VpdR2LSxFLJAP+b15XJYCAbmXI7DfCcFoKkLv/ZJjqN4SVRNzVU4k/iQkOtUtX2Ybhd1
         xIXe4GphZhsONQKemYiQfQN7bQrfuHNCD7AQuollBaVzGbC5CSrnckqwfTGyCLw9ZEbx
         96uwj2sCgpVxjSsYwiDexViN+tOohIQNv5za5Om4kzQQ1TB0iKrLF7dcscP+k6jynKdZ
         T/DEOO0cFzTF9dKy9a8W0MSJ7iI8265fmjdOupHE1z1pvmsUFjtdccaGI2kUQhBB7eMd
         fQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741520623; x=1742125423;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p2Foe3XwhvNs3FCKXrg4j2vvhvp7L38WiHksGts8MLY=;
        b=SHQi2hptFMXgLIwnOKQ1CbpA4IenCYvlKNmqQbu1hjjF2WpP4hhDv663Y3AO1TJLJs
         e2ad2BhuQdAuj5b7T3jCtobc8WGB+i6/snGORBqvlbKGW6yN+2zq36lxkxPqbgBBym1b
         QBQVvEnmcTpCtRSVpAy0HnMmdGdOK1c2tXQLv6OGxvdPkPtvXeDxRmJUSZwogCBRJR4a
         7KyWSI5AHU7S8Qo0TA3BJzI4kx7hKJ+hiCtKP4XiZXk5AGjwOEJTpJxrR35uSYtRMl1Q
         469BcO3qMblx5oSU7PtP8ZG2ExJ2Bu+JfskBhPR/4jDC3P7wot64ti4bNtwVB30/pttw
         B79A==
X-Forwarded-Encrypted: i=1; AJvYcCUw9LWV36EPNdrJUgzU5aDe4qn4/w9hQfvzQtkjTQhtlKKP8NkQPCv/Pn9bMbdJS8L7ySRX@lists.linux.dev
X-Gm-Message-State: AOJu0YzrQ1PnuDDkDvTiLg+0lccV9TpxPSri8DbUzTBE/aeD94js32HI
	ABTT78ZlM4xPLVD8H8agZp5NEt3R7mp6//qL5hZmlAsPRjgoQOO+
X-Gm-Gg: ASbGnctC+flPsR7Cm3/Ty0iZDCcSxy/Ps5oXpkzbnF+kb+f3VW5ZWqngO+jXyWB3O4Q
	0EgHoFxbBaePlotB21zONnLJTzCd8DY3HUGloyRkx52KzmoCs2l1wXkRdykqVaBI7xBHmFNC/LQ
	Om9ypyDrh22SvR9/IMJokuWjsqn/zqyQ65fLNBjM8/yjbBGPj+6+XI/BkA2At0DNcNsM7Tg1Eur
	3xOIOx4gSaKB1I+qhaDxCJzuuFc7l7UGjKZ9L+fI0G+Ag1an/3akMDiqwDYtWvlavu2iTy2zvZp
	0gyBDsav/Z8RKc9MOLSlTBd+1ilJ+FL0s6aVSe3oQxQDrJP7xgu6BbdmL2n1WqT0oQ==
X-Google-Smtp-Source: AGHT+IGCkQvpCYvt8DAq7HNsPYTi3N6A3lqWQRF/jPpIMAUqN8kHt8G03ChJPrJbXKeLJIlJ8+vj8w==
X-Received: by 2002:a05:6402:50c9:b0:5e5:db72:122a with SMTP id 4fb4d7f45d1cf-5e5e24d6e07mr10815399a12.20.1741520622082;
        Sun, 09 Mar 2025 04:43:42 -0700 (PDT)
Received: from [172.27.60.223] ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c768fa17sm5153804a12.72.2025.03.09.04.43.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Mar 2025 04:43:41 -0700 (PDT)
Message-ID: <fd6b1fef-8854-451f-9b7a-94df82adebc4@gmail.com>
Date: Sun, 9 Mar 2025 13:43:37 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net/mlx5: Avoid unnecessary use of comma
 operator
To: Simon Horman <horms@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>, Tariq Toukan <tariqt@nvidia.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 netdev@vger.kernel.org, linux-rdma@vger.kernel.org, llvm@lists.linux.dev
References: <20250307-mlx5-comma-v1-1-934deb6927bb@kernel.org>
Content-Language: en-US
From: Tariq Toukan <ttoukan.linux@gmail.com>
In-Reply-To: <20250307-mlx5-comma-v1-1-934deb6927bb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/03/2025 14:39, Simon Horman wrote:
> Although it does not seem to have any untoward side-effects,
> the use of ';' to separate to assignments seems more appropriate than ','.
> 
> Flagged by clang-19 -Wcomma
> 
> No functional change intended.
> Compile tested only.
> 
> Signed-off-by: Simon Horman <horms@kernel.org>
> ---
>   drivers/net/ethernet/mellanox/mlx5/core/lib/fs_chains.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/lib/fs_chains.c b/drivers/net/ethernet/mellanox/mlx5/core/lib/fs_chains.c
> index c862dd28c466..e8cc91a9bd82 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/lib/fs_chains.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/lib/fs_chains.c
> @@ -700,7 +700,7 @@ mlx5_chains_create_global_table(struct mlx5_fs_chains *chains)
>   		goto err_ignore;
>   	}
>   
> -	chain = mlx5_chains_get_chain_range(chains),
> +	chain = mlx5_chains_get_chain_range(chains);
>   	prio = mlx5_chains_get_prio_range(chains);
>   	level = mlx5_chains_get_level_range(chains);
>   
> 
> 

Reviewed-by: Tariq Toukan <tariqt@nvidia.com>

Thanks.
