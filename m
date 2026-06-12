Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A6C31F9A3
	for <llvm@lists.linux.dev>; Fri, 12 Jun 2026 08:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781252037; cv=none; b=t+rk97lqhua05+v9YGThSxAsBZF/s1mn9vK1jEviA6D9r4+WmHZOvbY6h/wZdkv+BmkGYn/7Qzq4RMLo+nxZELhMpo9sYMqwqN6jjZdndO7WMh0fy4kOXthHkq0SXGgqq06cfu9jkHpFZ1CuavaJHoZvh/nJ4bRTw+ZTRCWvQGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781252037; c=relaxed/simple;
	bh=62zbLUPIeAKMLxTE14cge4JaHS8J4tk+naOd2uv2Av4=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oTlsGu0haYJWtDxajPaRMVYLwcqqoAIKOcJmYe4Rl64PqmRDAfQBim/PO1jyt34mivi+nBQWTlgvBBMx8Kn8Putzf2mKhqF/R6DCYlPdwZPHmgO0hH5/hx8BKEpfFQbuNdJx9Z/jAyH/rHAAjtq2BtHVh4yK7aRyC+fESjGTMK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WNsUo/IN; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WNsUo/IN"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45ef41adbc1so493264f8f.0
        for <llvm@lists.linux.dev>; Fri, 12 Jun 2026 01:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781252034; x=1781856834; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iluw3zoyTSmSzkjjNukNbm680IZJrEluKhEAoUtwN5s=;
        b=WNsUo/INeR7TEOa2hAVhJGW+spL8qJh0HAT5JLHXhC0/hR1jK7xZ8qqxQq2wEY90dP
         vyDqqWxGPj66VeJts2dYxAqif7HdC7xbAOjrtg5MbzuKx5yRB/slCOchsmPUdnuojgYh
         piJC0/xI+eJfUsRIOv11sylAONxWF+yKlOXlKGkMwfhQN70gMNoVB8PD6zQug3c1mwYK
         cje+VU9ngEy9/eiDW2Beis4aa8lAc3PYGrIFgPzuTYO/FoSZgn36zRTXmOgecp4Ga0I6
         T4fDQB5lvRAajYytrgV6pGzsj7Dluj2RXNxlKOARM/eYE8e831ht0e6hry7g3cZ6cZos
         Yddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781252034; x=1781856834;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iluw3zoyTSmSzkjjNukNbm680IZJrEluKhEAoUtwN5s=;
        b=kC6eTCSGVGTRhaG9O9NlwXWMQ8lyEQ7bLi5tfH5R1jtcNfURe/9tpEP3bMwZ/hwb19
         oZRcNrxfYUvVH98ckWXv7v7lp6qRQKrdCLFbXDSdhjp3EgJFqlRQFAVjk9uW6QpnzDj8
         MeptjgxTJyebeWUhF88pdI2o9YSa5bes/QFqalSYHBDpjgLnb50+ugY8DTMs/nAnQExM
         tRaYpu3jmLoHOHv+Y3f//oWNPRECLE2Ip8Re7yQfjL1DWbqW5hcqDwkyvcuzQmBJeJ3z
         6jOJJR10L3VYsCrYX6l2Q5TkCgeLCIiX4LYxa7/leR4Hmsx/XsB6MmuhmIMaljpUK23Y
         RX5w==
X-Forwarded-Encrypted: i=1; AFNElJ+7Px10nY+aXwGykb6cZtyVQVvs0mMcN3qcJ1adzXVSVWAk3DP9uYZ+g+E3rojNFfdKQ6jZ@lists.linux.dev
X-Gm-Message-State: AOJu0Ywnh3g4MKv6qtte8kSnfKo0Xzhx3seTNKHcDCTSo4TmMl6YBPR9
	Y8iKtGaHyh0Ksrvor3HNbacg1+/eSgtMnbRC6C6sJiqFvHgpMYrXkbvE
X-Gm-Gg: Acq92OER71+vnjNCQqZOjzT0gZHeJ7DpSXwqLDpxT4VpC7Y1/MCYdEoVrrfuPBdTKHt
	SoZ6hNwindpmdd+N9kvXhmra7tqGv2f+Aps4sP07UprQM7FZ2+yOuSYup3X7ml49TgbWyW+OgYb
	cxB3Id6cttYGQhtBd6YKJDqUz7C+eRq2glqs61A/EEviQcHxHyOxAL7r3T8zC4ofVR4xUK4s9q8
	Jvf8MDZb2CuQ2UAbBM+fUpr/vx68yivtohAUH76AuhbzZvAH7SLbpWGZKZI8AyWoDGOB7vJo1G5
	oD1eNptSe6lpH0savkjEPn8iFYjtRmiJaClmnQBxNgVpOfVHnNVNw0YZPID4/TickWWj52N5K1U
	V9sLiGxWlhhfQZSn5YK9RLzLDJdWmzHH5DOf8HautVl7n5mhRiWCHcX3naDqQYJnFpnETJASc12
	Uheza40OiJGmJOB1ZPIK/tWQ==
X-Received: by 2002:a05:6000:2508:b0:45e:a314:ce0c with SMTP id ffacd0b85a97d-4606da5f2bemr2663661f8f.1.1781252033709;
        Fri, 12 Jun 2026 01:13:53 -0700 (PDT)
Received: from Ansuel-XPS. ([176.200.123.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0c35sm3661992f8f.22.2026.06.12.01.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 01:13:53 -0700 (PDT)
Message-ID: <6a2bbfc1.cf2df9a4.29e9ad.911b@mx.google.com>
X-Google-Original-Message-ID: <aiu_vQHd741aPr_E@Ansuel-XPS.>
Date: Fri, 12 Jun 2026 10:13:49 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] nvmem: airoha: add ARM64 dependency
References: <20260611125822.3386722-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611125822.3386722-1-arnd@kernel.org>

On Thu, Jun 11, 2026 at 02:58:00PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The driver already depends on HAVE_ARM_SMCCC and ARCH_AIROHA, but both
> are available for 32-bit and 64-bit targets. However, the smccc invocation
> fails on thumb2 builds with clang:
> 
> drivers/nvmem/airoha-smc-efuses.c:38:2: error: write to reserved register 'R7'
>    38 |         arm_smccc_1_1_invoke(AIROHA_SMC_EFUSE_FID,
>       |         ^
> note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
> arch/arm/include/asm/opcodes.h:215:2: note: expanded from macro '__inst_arm_thumb32'
>   215 |         __inst_thumb32(thumb_opcode)
>       |         ^
> 
> Since the driver is only used on the 64-bit an7581 soc, avoid this
> problem with a stricter dependency.
> 
> Fixes: 25e001fcc1e6 ("nvmem: airoha: Add support for SMC eFUSE")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Christian Marangi <ansuelsmth@gmail.com>

-- 
	Ansuel
