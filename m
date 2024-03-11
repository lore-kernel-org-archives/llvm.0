Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A305829424
	for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 10:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710152689; cv=none; b=P80a4uTgqL47bBCUOTDrzNtLD86W3O1jA5gzkTduWudxVozqGZCOHhadd7CJ6l9hjjNxWSUSrYizN/SLmxoirP7lfj8Lv7vR4QPdiV1IvjZJ95z2asAYLo/QJ3KKm1DWbXDhF+X1eIbFtrEF02HnS6umb20yACcQ0N7EAbE+EPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710152689; c=relaxed/simple;
	bh=DYE2NR7bHfN4M8+qfrNz3QdTU2br77nWaUKWxiGAsjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WTmU5hemix1V8m38WTcy42/Rk67jSIsedVD0oy6BAN3FYgCko0oMMaqQqgtqiJvov83qDrS3gYE3BbxaEyEV8pd/uPIn0aVceUg5LajFofb4gz296gEtt6eAAy8xCcD38WUaUinLM39cI+fQgedi6noucaZhEvsRUZQGxdPZUus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oxlzMPxv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oxlzMPxv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C011C433F1
	for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 10:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710152689;
	bh=DYE2NR7bHfN4M8+qfrNz3QdTU2br77nWaUKWxiGAsjk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oxlzMPxvWg4B8XJETl8O8un9opdcHl+E5o0XluVcp5yF7yCMGmDhsH1AriE2zYm3c
	 YE7ml7UoO0X/7lBGEHp1HUGCkPnpOjkvXtpnqa+w5pkvyx0DnRNSk5DTObeEVtWmKp
	 cK8rS9TvjNxo17Ia8Z6QcIk2yIcgyZEaPt/WK9m/C0Ov5lngggWJWOR1Nt4MqqGOTe
	 4OiW1Vy7iOeUDu1FyZnUhwD45CSZHbbaMceYa4zl8XuXmEYS5L8zdcCsddm2i5HBKK
	 cwhJYq0QLb4xDHTKoGgBplf7s9YnX1Db+u6abQuoT0IucJR27mJ/7lb53zyY5jFCNf
	 kzGiz+70i0lZw==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d21cdbc85bso65158491fa.2
        for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 03:24:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWS4yB4WMnlVGhOwIrPfRdbUEaj5REdi++tA6T3NnoJBWO1ebRT6VryX6tO5X7TalUilNEGQt7zBYeCfTQ5Y6S3mWjBuw==
X-Gm-Message-State: AOJu0YzNIGH+2qGrcshMpS3x4ByQZf6oI/Y/1rJiBp1NTp6x8PXTnUNR
	syMo5H/JRRC7TZ77SJFU/MNHSFo525eqndRz9YJuct/iyJBlUrq4lF7+vS0OXKgnwpexouwv3Ua
	9GRi4iJ2sb+mXNskQqjt+wWGYajg=
X-Google-Smtp-Source: AGHT+IEOvppBNdR5CkMUCH7CZRE0OCRKctbaFTVto+1xsXqCXdD0wH6vBWY1u5/dhgvfEpb1EEY01lmj32XkSbqKkT8=
X-Received: by 2002:a05:651c:608:b0:2d3:cb1c:a5eb with SMTP id
 k8-20020a05651c060800b002d3cb1ca5ebmr3277413lje.7.1710152687750; Mon, 11 Mar
 2024 03:24:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240311-arm32-cfi-v3-0-224a0f0a45c2@linaro.org> <20240311-arm32-cfi-v3-1-224a0f0a45c2@linaro.org>
In-Reply-To: <20240311-arm32-cfi-v3-1-224a0f0a45c2@linaro.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 11 Mar 2024 11:24:36 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFmn3Op5_L7=1h4BtNV4wdACE+kn2X=cWPxGxbWb6LndQ@mail.gmail.com>
Message-ID: <CAMj1kXFmn3Op5_L7=1h4BtNV4wdACE+kn2X=cWPxGxbWb6LndQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ARM: Support CLANG CFI
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Mar 2024 at 10:15, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Support Control Flow Integrity (CFI) when compiling with
> CLANG.
>
> In the as-of-writing LLVM CLANG implementation (v17)
> the 32-bit ARM platform is supported by the generic CFI
> implementation, which isn't tailored specifically for ARM32
> but works well enough to enable the feature.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  arch/arm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>

This patch should go last no?

> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 0af6709570d1..1216656a40bc 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -34,6 +34,7 @@ config ARM
>         select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
>         select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT if CPU_V7
>         select ARCH_SUPPORTS_ATOMIC_RMW
> +       select ARCH_SUPPORTS_CFI_CLANG
>         select ARCH_SUPPORTS_HUGETLBFS if ARM_LPAE
>         select ARCH_SUPPORTS_PER_VMA_LOCK
>         select ARCH_USE_BUILTIN_BSWAP
>
> --
> 2.34.1
>
