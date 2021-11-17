Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076EF2C89
	for <llvm@lists.linux.dev>; Wed, 17 Nov 2021 18:21:18 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id f18so12854747lfv.6
        for <llvm@lists.linux.dev>; Wed, 17 Nov 2021 10:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rxZZyaqSeECbHShUU1e6nyZolvCataFx7XMR5EnugzQ=;
        b=nV6v3kvHfDOsEHa//unuk7hKY+T8Ur2ySWyOBtNUwXxGo0Q+OZS2LIzQDzIbLzJ+Dm
         j/dOowu1LlkmuceMaozN0Jwv9xLst7l/Paoe/ND/GUMSezAzhHMjzKwEGCXqcT1kStLQ
         nnRJvjqZWtSNg4jDeQydDlmuCmtoZVNmVrCT1u4hJ6hlqfx8Ki4rUqp1dxQgiE7elSfH
         CDRRP8Lr/nS2+RawPguXhxIfRYQZ2ITy8MaFmJAlQfOk0e8+kdpdWprwhyMwJtFK32Ss
         aD8T4mLfBwvcw2mGvQVIB52ntFSDqcarxp8kHMzHD4um+7z7u+2np3tCbrnDO6vbgEO3
         T2xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rxZZyaqSeECbHShUU1e6nyZolvCataFx7XMR5EnugzQ=;
        b=lavFYlefa8AhaA7R7Ru+HeSDZayURWIqfrzA54Isb7/IXRZRgBxm+oyOZNGqaUZ4vu
         yuo0FbE2lpQebz8+8Mw/ZQUV3U1u1il4sKrmH4Muv0xn32TdRFVLYB3++mtCIny1NKpF
         /92iDxxBM+GaQko5eGPcMihOL9I2VC4Cq8i7S5E+soqQsu45VjP1RAdT11JoxmYMt+Zw
         M+5S/0R13nw2V1QKKYkWLk4/kPCuzCUCqtHcZz3U+4qiT4Lo90QLu7oD7WA2wiJdPjRC
         o0yfVFaNvFeo1Pm/i6cFVzcNflyFs4l06x2SbavqeuMcKjMIFsjcZWQPo7nlXAOFHoYD
         W41A==
X-Gm-Message-State: AOAM531pLtt+22Ab2o+UbL/5ixu7k3W3RCsRqdljrvPd6MpC+57TDUPl
	Y0c5fTERkXjJpyRoSEViCY0DGrlERk40Pwuvj2neHg==
X-Google-Smtp-Source: ABdhPJyFikjXXqzOj6YkMgayYjCdOOLM33cYMaMMto7XQuyQf9aixUnlVx2PnbTYswd4ixaLlpqH/pKdJwSf4lvJCf0=
X-Received: by 2002:a05:6512:3b9c:: with SMTP id g28mr17505579lfv.651.1637173276868;
 Wed, 17 Nov 2021 10:21:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211021214500.2388146-1-nathan@kernel.org>
In-Reply-To: <20211021214500.2388146-1-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 17 Nov 2021 10:21:05 -0800
Message-ID: <CAKwvOd=Y50SvJiu=cxtEoogxJabdREh2tEX+wYn8FWs0si8vSg@mail.gmail.com>
Subject: Re: [PATCH] soc/tegra: fuse: Fix bitwise vs. logical OR warning
To: Nathan Chancellor <nathan@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

+ Anders (combining
https://lore.kernel.org/all/20211117142115.694316-1-anders.roxell@linaro.org/).

On Thu, Oct 21, 2021 at 2:45 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> A new warning in clang points out two instances where boolean
> expressions are being used with a bitwise OR instead of logical OR:
>
> drivers/soc/tegra/fuse/speedo-tegra20.c:72:9: warning: use of bitwise '|' with boolean operands [-Wbitwise-instead-of-logical]
>                 reg = tegra_fuse_read_spare(i) |
>                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
>                                                ||
> drivers/soc/tegra/fuse/speedo-tegra20.c:72:9: note: cast one or both operands to int to silence this warning
> drivers/soc/tegra/fuse/speedo-tegra20.c:87:9: warning: use of bitwise '|' with boolean operands [-Wbitwise-instead-of-logical]
>                 reg = tegra_fuse_read_spare(i) |
>                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
>                                                ||
> drivers/soc/tegra/fuse/speedo-tegra20.c:87:9: note: cast one or both operands to int to silence this warning
> 2 warnings generated.
>
> The motivation for the warning is that logical operations short circuit
> while bitwise operations do not. In this case, it does not seem like
> short circuiting is harmful so implement the suggested fix of changing
> to a logical operation to fix the warning.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1488
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Fixes: 25cd5a391478 ("ARM: tegra: Add speedo-based process identification")

> ---
>  drivers/soc/tegra/fuse/speedo-tegra20.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/tegra/fuse/speedo-tegra20.c b/drivers/soc/tegra/fuse/speedo-tegra20.c
> index 2546bddbab93..4984246605ae 100644
> --- a/drivers/soc/tegra/fuse/speedo-tegra20.c
> +++ b/drivers/soc/tegra/fuse/speedo-tegra20.c
> @@ -69,7 +69,7 @@ void __init tegra20_init_speedo_data(struct tegra_sku_info *sku_info)
>
>         val = 0;
>         for (i = CPU_SPEEDO_MSBIT; i >= CPU_SPEEDO_LSBIT; i--) {
> -               reg = tegra_fuse_read_spare(i) |
> +               reg = tegra_fuse_read_spare(i) ||
>                         tegra_fuse_read_spare(i + CPU_SPEEDO_REDUND_OFFS);
>                 val = (val << 1) | (reg & 0x1);
>         }
> @@ -84,7 +84,7 @@ void __init tegra20_init_speedo_data(struct tegra_sku_info *sku_info)
>
>         val = 0;
>         for (i = SOC_SPEEDO_MSBIT; i >= SOC_SPEEDO_LSBIT; i--) {
> -               reg = tegra_fuse_read_spare(i) |
> +               reg = tegra_fuse_read_spare(i) ||
>                         tegra_fuse_read_spare(i + SOC_SPEEDO_REDUND_OFFS);
>                 val = (val << 1) | (reg & 0x1);
>         }
>
> base-commit: 519d81956ee277b4419c723adfb154603c2565ba
> --
> 2.33.1.637.gf443b226ca
>


-- 
Thanks,
~Nick Desaulniers
