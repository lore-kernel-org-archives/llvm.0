Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC45D2E8B98
	for <llvm@lists.linux.dev>; Wed, 20 Aug 2025 16:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755708252; cv=none; b=nnpGH9D7HeNtvo+kXjyLL7H0ocHmyw6/yIiXnu5gkLBgVEc9hbJ/CtfVyDQnO8JbUlFr6I+Cw3LpM7AuI0AbSYJ8PdsNIvYwuXu7kgSM7pDmdj0ZnzJYl1LuSn1kTlPVaXpuWR+iIrl2JXJ0qLwYJQ7Oj301XM8hIGaSfgTI1CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755708252; c=relaxed/simple;
	bh=rlf4MbI1vwsNRKdLc8cJukyH+as7zfttKIVUPC62vTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YM1zQQy0B6rQvz5U1w6GdJjpAiPfM+wD9crk0bb3aSmVpefvYVYMwsD5JAuFPCWFBQCcPMxv5ZUMdBX1T6wn/yrS5n0YsQHB4U7Lp09vkvkx6WDFXLspJKCJ6FM10wyAFTqrlrUBTMq0q3ecKM8WI9mzu61Xn2Vr7idwjcF1wqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jVICrITj; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jVICrITj"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-71fab75fc97so92337b3.3
        for <llvm@lists.linux.dev>; Wed, 20 Aug 2025 09:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755708248; x=1756313048; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5lasJ3h7RVrddAHM1lvs/E5g0tBvN03o3fKd+WqO+A=;
        b=jVICrITjT9ZNDqntJ81y23SKN9vnWnj0m1IaxAqpit4jRFF3k475R424Yx0m/goa0V
         FzGDUyF9eRKOivFqoGysF++xgEh+EjkR3f6TqODMI7NKC4VCpv2tuXu2oWgiSq1nbGmt
         e4BFn1SL/WPa9kuirng2dYudPHzoZEe8tWtIM47m5TDXHX2R+qPVlLPEY04EvG0LOdfA
         xthaBNbxi9ahl7LkKrWlqt2FQOigOgT3ItRZyT+udYoPu9t6TlCy4v0aY9kLGGBIY55k
         6MOz+8i2/TlP5FUO0nEWa28DMLyMTHXBT9Eaqn6sK3l5CmD6Uyw8rYoFIdBTwRxhh5eI
         neBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755708248; x=1756313048;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q5lasJ3h7RVrddAHM1lvs/E5g0tBvN03o3fKd+WqO+A=;
        b=WyDWHPYN3gSJqhO/qvubBBFvaSZMt0CQNPLu2UMCYFgfuNQjEJbzcWA9zY1vVDz/fP
         R8YXaVqiEE2+kdF+Cdy9uqQh3dryiasOl/AdQKH0IWelTY0ExKTUU96d7r5/4+txRt4x
         hjoT/w/sEjiccOd5yh0AUEBOER3AVR1ieoQMUoJzFqZMUAOPFRl62xu/70/YJ2SpvHgS
         PqkmqoDFWkxGVr9MuuUcCrSgM6edUBrSuiHpqLoIQbFnKtSBYJxLs/3LpuAHL4e9L1CA
         1C4s2fT1iIjaLgr0kb5a3n6DGyhUC2cJh1k5sKmiIligV0g2/Qnww7VoyxeEqlCYZLcz
         bfcg==
X-Forwarded-Encrypted: i=1; AJvYcCXGBHAzALfO7koTSqxxfIHBvzDqMitM6v+hsjsoOg+eGRuL5wj1mEXj2/sq3nLiNrPi3qz4@lists.linux.dev
X-Gm-Message-State: AOJu0YzKJMR8WyyBgLQ6AG25e4iSb32oQ2yWheexXRnODJ40w2hZpTUo
	ZSgkffBPHnuQov65fAQAUUh17D1STAFGj52UoQmcoF2WrwjN8mQ+s9TuPexOC1ZDZVMiGn4munm
	6RLN9AjS+y15taDNMAaUsdPnAOpQaBDply3aejW4TWA==
X-Gm-Gg: ASbGncsrT+2zEIa/gSBkQmYcEoY6mqjqbxiuJQJYtV8iNgKFHB6TKREDWY3LxxXq2xK
	WVDtvUGKjgVJ2BR5TX8pzTDPqMOFJ6QXZGX2OOqfw6HSOUXFf2XQp846488qRtrEFTFAmH/6OgM
	bVr10vTtVzcqZd+5oCfCYDoISQn70nGeITs4IdIbdV53UXv4dk1RABVMR+n50UOXhkbWTLfIx6m
	bR+r/L1
X-Google-Smtp-Source: AGHT+IH6m3Ww+OjQuVs+Bfy8fafay2w24/TuXvOFcHZfUby02NoUSl9x/4nPk4fk2gOIDJz6QPD6Mw+/dyMYSAB7qgc=
X-Received: by 2002:a05:690c:94:b0:71e:727d:7dc5 with SMTP id
 00721157ae682-71fb322b559mr43302807b3.36.1755708247693; Wed, 20 Aug 2025
 09:44:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250819-mmc-sdhci-cadence-fix-uninit-hrs37_mode-v1-1-94aa2d0c438a@kernel.org>
In-Reply-To: <20250819-mmc-sdhci-cadence-fix-uninit-hrs37_mode-v1-1-94aa2d0c438a@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 20 Aug 2025 18:43:31 +0200
X-Gm-Features: Ac12FXy7rDHN8USe2ZYWKKe_XNpSU7YSWOYPW1bMeT7tRaJLRvVitFbGjplVTcY
Message-ID: <CAPDyKFoHOWrrwud-gxQdN6TJjCwheWqv2XPj+B2jHTO4CBU4Ew@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-cadence: Fix -Wuninitialized in sdhci_cdns_tune_blkgap()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>, =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
	linux-mmc@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Aug 2025 at 19:29, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Clang warns (or errors with CONFIG_WERROR=y):
>
>   drivers/mmc/host/sdhci-cadence.c:297:9: error: variable 'hrs37_mode' is uninitialized when used here [-Werror,-Wuninitialized]
>     297 |         writel(hrs37_mode, hrs37_reg);
>         |                ^~~~~~~~~~
>   drivers/mmc/host/sdhci-cadence.c:291:16: note: initialize the variable 'hrs37_mode' to silence this warning
>     291 |         u32 hrs37_mode;
>         |                       ^
>         |                        = 0
>
> A previous revision assigned SDHCI_CDNS_HRS37_MODE_MMC_HS200 to
> hrs37_mode in a switch statement but the final revision moved to a
> simple if statement. Pass that as the value to writel() and
> remove hrs37_mode, clearing up the warning.
>
> Fixes: 60613a8b9b81 ("mmc: sdhci-cadence: implement multi-block read gap tuning")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Applied for next, thanks!

Kind regards
Uffe

> ---
>  drivers/mmc/host/sdhci-cadence.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-cadence.c b/drivers/mmc/host/sdhci-cadence.c
> index a2a4a5b0ab96..eaa88897a256 100644
> --- a/drivers/mmc/host/sdhci-cadence.c
> +++ b/drivers/mmc/host/sdhci-cadence.c
> @@ -288,13 +288,12 @@ static int sdhci_cdns_tune_blkgap(struct mmc_host *mmc)
>         void __iomem *hrs38_reg = priv->hrs_addr + SDHCI_CDNS_HRS38;
>         int ret;
>         u32 gap;
> -       u32 hrs37_mode;
>
>         /* Currently only needed in HS200 mode */
>         if (host->timing != MMC_TIMING_MMC_HS200)
>                 return 0;
>
> -       writel(hrs37_mode, hrs37_reg);
> +       writel(SDHCI_CDNS_HRS37_MODE_MMC_HS200, hrs37_reg);
>
>         for (gap = 0; gap <= SDHCI_CDNS_HRS38_BLKGAP_MAX; gap++) {
>                 writel(gap, hrs38_reg);
>
> ---
> base-commit: 7138017038c42feb682445407974ed736e1ff308
> change-id: 20250819-mmc-sdhci-cadence-fix-uninit-hrs37_mode-cc1246cb39d8
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
