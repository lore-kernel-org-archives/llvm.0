Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FE320DC4
	for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 22:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711665571; cv=none; b=UqeJFteLsWFQUumYERZHzUsQ/auWDuwD1uobzEeDWPKln7w3cs3tgg7arqSxACgXoSJd9Da/mJUvksg/XiySaLfY1JtAV/P/C5csO7xIn27+1PmCIjdQUkHXTZ8BrOKFdWRGDI+3gd+UUivFfDfyE+jIVcGbqhW6033fROZr9Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711665571; c=relaxed/simple;
	bh=SItJvabCDnAcEk1FDDPnUYg29uH0ygr0YwnH/xLN6Lg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bSEANzzWJoRLF2RHsL1HXcuKLtFFJJ3NAuEOujZvhvmmUir9aSaUnhSEJUJS3/Dt9U5ExuODxtfh5SxoAa1B30QzZwpOVKJ83Dvviu8Np6HH1h4GNPVrbtDYHv+fkt7cByb5bdPX8nwX8Ah4w4EbbwOJ5Hij/2zK8F7tR4itJHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=foF0Bzvm; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="foF0Bzvm"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4149521d76aso10042985e9.3
        for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 15:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711665568; x=1712270368; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DxAkMuGKIXRo2hx02pxk/kvCrTlB4fgMbIxtUPHcx7A=;
        b=foF0Bzvmx4X+6qGDHA3Eq3ggIks8cvBdx8rdFazUrAPS5iSO+zcYeX1wYm07Ayy8hK
         U3iVHIUjjeQMtTXhIefBiocd+oQl/rzAfSIEcgrhccmH+lpyYjFB4jS+Ntsk2QfiLxwC
         kqMJuW2BVQhckm/fz5gmyDSNPHLq+gfBp2Xy/xBf4VprAB5YdUYzr3Ay9u2dWXy+SQog
         l500vIY2MMiCiggYphwsIstSnRxbQ0qqC74hBKLjczAaiVrpZrCnctaZMZihapP6rB7M
         Ioyz1Z+2Nq1/hlaPLKqzKAavT0V9gSqH3CkcxJHyqDK+kh9qeHKgCd/StUT3XdO6s+ke
         peZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711665568; x=1712270368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DxAkMuGKIXRo2hx02pxk/kvCrTlB4fgMbIxtUPHcx7A=;
        b=WP7P983NyOEAiB05UJyObs/2Bic9Lb8Q9fRMQ3yijX4NPHTKXLINByB5kHj0cF1GDQ
         t5jEofhqChxIuN+dJMaNfOoTICyW59Dse87+pi0SS+Nvh9g5gn3ZeQEwsSlSqqL/BJ33
         uH+aQW9ZncRuM+wEHbhgt+oTStpAu2T0CR5VywhB793voFmRjb9hXxlLs/g0Ijuo6HpW
         QGv+Hqr0yV4qDqmJn4OPdatkeFzfW1X6dhhMSAMsu7VM10dC8Kh1FRqShShUQBcMq3xy
         Pydf0yoAauol3aNy6lGrtGyQYBb8CJgwjesKmytFxDHbrugnhjEn0FUh4RXn5tAjX21h
         /J/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUyWg95CtBczv6M0aYlFW/7YOKSg5orRixsXPkmLALTeYfjfm0MuYur/wZV6XpV7Set9GIlp/m9Hadndjgi8ckRoJOT4Q==
X-Gm-Message-State: AOJu0YxgCi/XH23/KhN0wyfByIhBiX17zOhocR9834/+cn/10+YtQo1b
	bSHhrqA3teCOCgmrVJ2PHUKPwBjDen8qFN/mey9tlKxXQTAI9eu7
X-Google-Smtp-Source: AGHT+IGtuupE/qp9ctW5zpvMpCcAD6pw+81arQy9Ewg8HbRTEXTfNfS1uS63GnRpo9iBoBdI63Whow==
X-Received: by 2002:a05:600c:4f85:b0:414:8a28:6c88 with SMTP id n5-20020a05600c4f8500b004148a286c88mr433614wmq.14.1711665568247;
        Thu, 28 Mar 2024 15:39:28 -0700 (PDT)
Received: from [172.27.34.173] ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id u8-20020a05600c19c800b0041478393b8fsm6625632wmq.42.2024.03.28.15.39.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 15:39:28 -0700 (PDT)
Message-ID: <d8381c87-6123-4df0-97d3-ea8d0e17c6bb@gmail.com>
Date: Fri, 29 Mar 2024 00:39:23 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] mlx5: stop warning for 64KB pages
To: Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
 Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Jonathan Lemon <jonathan.lemon@gmail.com>,
 Maxim Mikityanskiy <maxtram95@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Nick Desaulniers
 <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Gal Pressman <gal@nvidia.com>,
 netdev@vger.kernel.org, linux-rdma@vger.kernel.org, llvm@lists.linux.dev,
 Tariq Toukan <tariqt@nvidia.com>
References: <20240328143051.1069575-1-arnd@kernel.org>
 <20240328143051.1069575-9-arnd@kernel.org>
Content-Language: en-US
From: Tariq Toukan <ttoukan.linux@gmail.com>
In-Reply-To: <20240328143051.1069575-9-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28/03/2024 16:30, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When building with 64KB pages, clang points out that xsk->chunk_size
> can never be PAGE_SIZE:
> 
> drivers/net/ethernet/mellanox/mlx5/core/en/xsk/setup.c:19:22: error: result of comparison of constant 65536 with expression of type 'u16' (aka 'unsigned short') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>          if (xsk->chunk_size > PAGE_SIZE ||
>              ~~~~~~~~~~~~~~~ ^ ~~~~~~~~~
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

Thanks for your patch.

Reviewed-by: Tariq Toukan <tariqt@nvidia.com>

