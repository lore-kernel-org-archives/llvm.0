Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264D524F47
	for <llvm@lists.linux.dev>; Wed,  2 Nov 2022 19:09:56 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id u8-20020a17090a5e4800b002106dcdd4a0so3030037pji.1
        for <llvm@lists.linux.dev>; Wed, 02 Nov 2022 12:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qNhnJbXAJF4UzyH8g8T6ZxMpszM79ChXkqdNt8W8NYI=;
        b=VwmffTXNNVk9OBe+Hnb1vM8Qkem8njG1t/7NVdWtvzLrL7Silwy1LUoeD738n3tOxs
         iK3jGMKaUFT7YdCmh+Gc9iJ/YxnaQ2rljYHzLP0L65O3V7/zav62TcWDBN+p4X1FC2G3
         eyyWgcMxBcpZxnBLphn5OoB8FI5JAsGow22/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qNhnJbXAJF4UzyH8g8T6ZxMpszM79ChXkqdNt8W8NYI=;
        b=DAWCdIreTqBUA4cnXxdSh2Tdbdb398nr5h7jn+DyNu3TjSkVSJMnyQiMBurct7eCQX
         lvlNfg5g274S2UfvxSIPkIf9bcm9jlW7+YkqAQO5zc3WFiI8CL0pAQb5oZsRwNYDV2uc
         xG60rVMWVyFFHRBXK3yLgVlEPipBu0e973vKPNlQqRP2Yl02fsVBSlnubpf1cQ/E2V7G
         MnI1PKRbrnT/elTE/XNv5llcRT6g0rZcq2q4NH/RBi/ZXObJJoHVTsKDZIxYfEr6cCRf
         zDSbqekQB14JyNqEmVe07f1X8TRMmVwJO7VdtsWZkZx16BkAdrA2OabB69pg2iEyHUp0
         kKhA==
X-Gm-Message-State: ACrzQf12yuCSOZuK/LF8V31McugS4rT9akRsRAqHqSu+Ny/XvugHicoc
	55nX7d32d9mJ+kyXvj24ppikOw==
X-Google-Smtp-Source: AMsMyM4DStPKStM8pFzW0+6/3LvqImBH8Zv6MGJVHGEF5VEN77SWeQxRJeBNzvxONcQowosistNujg==
X-Received: by 2002:a17:902:e883:b0:187:27a7:c8a3 with SMTP id w3-20020a170902e88300b0018727a7c8a3mr14846919plg.32.1667416195682;
        Wed, 02 Nov 2022 12:09:55 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a16-20020aa794b0000000b005627d995a36sm8805579pfl.44.2022.11.02.12.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 12:09:55 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:09:54 -0700
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alexandra Winter <wintera@linux.ibm.com>,
	Wenjia Zhang <wenjia@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
	netdev@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Sami Tolvanen <samitolvanen@google.com>,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: Re: [PATCH 2/3] s390/netiucv: Fix return type of netiucv_tx()
Message-ID: <202211021209.8BAB0ABFCE@keescook>
References: <20221102163252.49175-1-nathan@kernel.org>
 <20221102163252.49175-2-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102163252.49175-2-nathan@kernel.org>

On Wed, Nov 02, 2022 at 09:32:51AM -0700, Nathan Chancellor wrote:
> With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
> indirect call targets are validated against the expected function
> pointer prototype to make sure the call target is valid to help mitigate
> ROP attacks. If they are not identical, there is a failure at run time,
> which manifests as either a kernel panic or thread getting killed. A
> proposed warning in clang aims to catch these at compile time, which
> reveals:
> 
>   drivers/s390/net/netiucv.c:1854:21: error: incompatible function pointer types initializing 'netdev_tx_t (*)(struct sk_buff *, struct net_device *)' (aka 'enum netdev_tx (*)(struct sk_buff *, struct net_device *)') with an expression of type 'int (struct sk_buff *, struct net_device *)' [-Werror,-Wincompatible-function-pointer-types-strict]
>           .ndo_start_xmit         = netiucv_tx,
>                                     ^~~~~~~~~~
> 
> ->ndo_start_xmit() in 'struct net_device_ops' expects a return type of
> 'netdev_tx_t', not 'int'. Adjust the return type of netiucv_tx() to
> match the prototype's to resolve the warning and potential CFI failure,
> should s390 select ARCH_SUPPORTS_CFI_CLANG in the future.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1750
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
