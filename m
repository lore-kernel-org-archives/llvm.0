Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2B14B141
	for <llvm@lists.linux.dev>; Wed,  6 Dec 2023 20:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ACNG2Oks"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-59067f03282so101680eaf.0
        for <llvm@lists.linux.dev>; Wed, 06 Dec 2023 12:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701894642; x=1702499442; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9eq3jqNRCjgDA+wj0K2ttPPKrFl4QLO2GecqrdxVpmM=;
        b=ACNG2Oksi1RRwgdi0EWZwIMuvXjlnlp4G3n0d3lohgz0vXP1FRhUl2MabeARYtUseu
         hm+Iffn9DTO3+GNyFrtGaFjK1ifNxKcfuENDSY9SCQS82G+AM636XC0nogNZlROYWLXm
         j0+fL4MPQUT3dQb4N29Iv4ZyUkPGW1GJ5o+sE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701894642; x=1702499442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9eq3jqNRCjgDA+wj0K2ttPPKrFl4QLO2GecqrdxVpmM=;
        b=l/z5waEudVvF0NlqHUPiKlQ+GcuXPcRy+7b+w5ZXqQLuzq0XhRQa7YwcC8/bnV3R5C
         YiHFJJIc4VG4PPp6ffo3Im2igrlEqLUFVkOwRkrHIXNF6AaFtHujvTVxO7gPjMzLP/bd
         ZiL9BTZqKdrF5ZgujQHuDntdQgfEtbDf/nA1gfCQIum8IzMDU4YIRMYxjUer4ZKamcmH
         PRAdjohR1a/O1Wb0F+jREs+HMBb3APPfjnCxk3hmSQ8UqwZyheNgEL1mNHsP7reqvbGK
         8mG8fKogMkXA3GuAMoufWmpvGS7bd32uqD2CG1iAtLhba6hZdSjbV45NTO9fD4B0WIKm
         1OYA==
X-Gm-Message-State: AOJu0YxF0cNiJrH6rWkjSWDB+osCPIK5MP0pCK5+DHjaLvgKUv775ys9
	LGK8q84Apcy5qRcAlDp5NIpF6A==
X-Google-Smtp-Source: AGHT+IFGDciLiie8hITCaZXsYxSpfeRhcGKgK1VIpxFeS541PLhc+AxSmpmQIejdL0xr3/qkQpn0lA==
X-Received: by 2002:a05:6358:7504:b0:170:61c5:f2fa with SMTP id k4-20020a056358750400b0017061c5f2famr2348359rwg.38.1701894642121;
        Wed, 06 Dec 2023 12:30:42 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id r17-20020a63a011000000b005b9083b81f0sm309450pge.36.2023.12.06.12.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 12:30:41 -0800 (PST)
Date: Wed, 6 Dec 2023 12:30:40 -0800
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, morbo@google.com,
	justinstitt@google.com, samitolvanen@google.com, nicolas@fjasle.eu,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
	patches@lists.linux.dev, kernel test robot <lkp@intel.com>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, richard@nod.at,
	johannes@sipsolutions.net, linux-um@lists.infradead.org
Subject: Re: [PATCH v2 1/2] um: net: Fix return type of uml_net_start_xmit()
Message-ID: <202312061230.2210A1FE@keescook>
References: <20231206-enable-wincompatible-function-pointer-types-strict-w-1-v2-0-91311b4c37b0@kernel.org>
 <20231206-enable-wincompatible-function-pointer-types-strict-w-1-v2-1-91311b4c37b0@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206-enable-wincompatible-function-pointer-types-strict-w-1-v2-1-91311b4c37b0@kernel.org>

On Wed, Dec 06, 2023 at 09:49:46AM -0700, Nathan Chancellor wrote:
> With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
> indirect call targets are validated against the expected function
> pointer prototype to make sure the call target is valid to help mitigate
> ROP attacks. If they are not identical, there is a failure at run time,
> which manifests as either a kernel panic or thread getting killed. A
> warning in clang aims to catch these at compile time, which reveals:
> 
>   arch/um/drivers/net_kern.c:353:21: warning: incompatible function pointer types initializing 'netdev_tx_t (*)(struct sk_buff *, struct net_device *)' (aka 'enum netdev_tx (*)(struct sk_buff *, struct net_device *)') with an expression of type 'int (struct sk_buff *, struct net_device *)' [-Wincompatible-function-pointer-types-strict]
>     353 |         .ndo_start_xmit         = uml_net_start_xmit,
>         |                                   ^~~~~~~~~~~~~~~~~~
>   1 warning generated.
> 
> ->ndo_start_xmit() in 'struct net_device_ops' expects a return type of
> 'netdev_tx_t', not 'int'. Adjust the return type of uml_net_start_xmit()
> to match the prototype's to resolve the warning. While UML does not
> currently implement support for kCFI, it could in the future, which
> means this warning becomes a fatal CFI failure at run time.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202310031340.v1vPh207-lkp@intel.com/
> Acked-by: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Yes please. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
