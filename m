Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CFA3FE50
	for <llvm@lists.linux.dev>; Thu, 23 Nov 2023 17:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dKR9Z3D1"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so1063626276.1
        for <llvm@lists.linux.dev>; Thu, 23 Nov 2023 09:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700759948; x=1701364748; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QzfEo5WBvdgfB1Az5F9u3yyf28qwDoy9yb7+zzh0FnU=;
        b=dKR9Z3D1mlNeD2eMUhuFDz6wSApRB9zkxFNwEnuUuDcLcgi3jv9ColshzT6qkhQo3q
         d3m88i+uQxhSPTTPJ/HKDDxcEMoEfz4TvNi05ZhVxNgHDRw63FVed4VPCimQWmZ0dFDP
         ACimezwKprpN9cwlYOBbhDnOX4zDY0kgJwdBjpORRpJQF7/waStrmqx2k1vM5zIjzU4k
         4g33lZHMtqbRFu3QcjvM/a1C7rn9zKCAGhex0mfsZZLrxq+gN/a7WoZ93ZwoG80zxWkp
         3cR8TsSNChgZC51av9g2XHwTE9kFP3oLj7EpnDsWgg/3LusyqtZcLGd+u49xAoHSLP7r
         wm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700759948; x=1701364748;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QzfEo5WBvdgfB1Az5F9u3yyf28qwDoy9yb7+zzh0FnU=;
        b=Y4SftXDGUNsxWG5o7CRSvLAQMXDra3viepJgVORDHGIwuJ0HD2Go9Cz0qIHzACsgRg
         QllfWYknLnrihhUGXafDGmq6MdO0WoIw2J+3hNU/ClnVFYrpkS/Xb2YhLf+BP/rGX0qo
         WxVXH9c0ZpkbXUux1crl0Hep3Q6tmIefjAcZ8Oks15tRtuV3nn5Wca07tCXVt/9e7pQ6
         C8jl2Rg8L1tOtYLMJiKZXw7VCrpzua7sOjcb0mey0KS3jiH5obqPyW7tlkYvlBLrDyrD
         yEUR1KaZGTvkxHn3kGORlx0OntICm6ZDR1soGiuqPQw1Gq6ZZCJPx0e90NwWYK84ep6k
         RpsA==
X-Gm-Message-State: AOJu0Yxp6FbyMdp5ZIguzZytmGCizQ2jVhnLUjxEZYuhp89ZHOfz+7qu
	wuuEc+98i9KMZCMNoIfQuKRSKvmJt/b0SwM1dgAPaw==
X-Google-Smtp-Source: AGHT+IEmXW41Yp+RFIjdjtRm1iq8rHwdxF6zrXwjU0rUmegEetlfzR0xiq7PtKWXXUYlM7wUx54oeIEvylixkhQM9x4=
X-Received: by 2002:a25:24e:0:b0:d9a:485f:5852 with SMTP id
 75-20020a25024e000000b00d9a485f5852mr5831926ybc.13.1700759948302; Thu, 23 Nov
 2023 09:19:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231116-sdhci-of-dwcmshc-fix-wbitwise-instead-of-logical-v1-1-7e1a7f4ccaab@kernel.org>
In-Reply-To: <20231116-sdhci-of-dwcmshc-fix-wbitwise-instead-of-logical-v1-1-7e1a7f4ccaab@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 23 Nov 2023 18:18:32 +0100
Message-ID: <CAPDyKFosve2awkdzzsCJb38tt2154kKKKneXiaBNqQATwdUupw@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-of-dwcmshc: Use logical OR instead of bitwise
 OR in dwcmshc_probe()
To: Nathan Chancellor <nathan@kernel.org>
Cc: adrian.hunter@intel.com, dfustini@baylibre.com, linux-mmc@vger.kernel.org, 
	llvm@lists.linux.dev, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Nov 2023 at 02:46, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Clang warns (or errors with CONFIG_WERROR=y):
>
>   drivers/mmc/host/sdhci-of-dwcmshc.c:873:7: error: use of bitwise '|' with boolean operands [-Werror,-Wbitwise-instead-of-logical]
>     873 |                 if ((device_property_read_bool(dev, "mmc-ddr-1_8v")) |
>         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     874 |                     (device_property_read_bool(dev, "mmc-hs200-1_8v")) |
>         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>         |                                                                        ||
>     875 |                     (device_property_read_bool(dev, "mmc-hs400-1_8v")))
>         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/mmc/host/sdhci-of-dwcmshc.c:873:7: note: cast one or both operands to int to silence this warning
>   drivers/mmc/host/sdhci-of-dwcmshc.c:873:7: error: use of bitwise '|' with boolean operands [-Werror,-Wbitwise-instead-of-logical]
>     873 |                 if ((device_property_read_bool(dev, "mmc-ddr-1_8v")) |
>         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>         |                                                                      ||
>     874 |                     (device_property_read_bool(dev, "mmc-hs200-1_8v")) |
>         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/mmc/host/sdhci-of-dwcmshc.c:873:7: note: cast one or both operands to int to silence this warning
>   2 errors generated.
>
> There is little reason for this if statement to use bitwise ORs, as the
> short circuiting of logical OR does not need to be avoided in this
> context; it would be wasteful to call device_property_read_bool() three
> times if the first two calls returned true. Switch to logical OR to fix
> the warning.
>
> While in the area, the parentheses around the calls to
> device_property_read_bool() are not necessary and make the if statement
> harder to read, so remove them.
>
> Closes: https://github.com/ClangBuiltLinux/linux/issues/1960
> Fixes: aff35fbc7830 ("mmc: sdhci-of-dwcmshc: Add support for T-Head TH1520")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-of-dwcmshc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
> index 0eb72544c09e..a1f57af6acfb 100644
> --- a/drivers/mmc/host/sdhci-of-dwcmshc.c
> +++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
> @@ -870,9 +870,9 @@ static int dwcmshc_probe(struct platform_device *pdev)
>         if (pltfm_data == &sdhci_dwcmshc_th1520_pdata) {
>                 priv->delay_line = PHY_SDCLKDL_DC_DEFAULT;
>
> -               if ((device_property_read_bool(dev, "mmc-ddr-1_8v")) |
> -                   (device_property_read_bool(dev, "mmc-hs200-1_8v")) |
> -                   (device_property_read_bool(dev, "mmc-hs400-1_8v")))
> +               if (device_property_read_bool(dev, "mmc-ddr-1_8v") ||
> +                   device_property_read_bool(dev, "mmc-hs200-1_8v") ||
> +                   device_property_read_bool(dev, "mmc-hs400-1_8v"))
>                         priv->flags |= FLAG_IO_FIXED_1V8;
>                 else
>                         priv->flags &= ~FLAG_IO_FIXED_1V8;
>
> ---
> base-commit: 3f00051234f02d0d9d1f63b9a334d0fd4c65b6ca
> change-id: 20231116-sdhci-of-dwcmshc-fix-wbitwise-instead-of-logical-bf8fed73b5bb
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
