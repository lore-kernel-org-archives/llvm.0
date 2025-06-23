Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7DD2475C7
	for <llvm@lists.linux.dev>; Mon, 23 Jun 2025 11:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750679625; cv=none; b=jRbRsMc8+k02CBZa/ojS0O+L0TYOT35W7efBnAZpphYaTQJCRwkzPSahfwPPxOj2463iJmbtzQa8HfPISM19Bx11JmsHxYou+VdpVDGAk/x65/5dD60teg35xAzOB2tFdGwjpT7MUf9RmfKVh2AcrkSWoGgK7tP/lvjMqz8ilGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750679625; c=relaxed/simple;
	bh=dLO58gER4/9we8S0TLinFsUMTSqy1jSiQM5gDQyH4uo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cqVgdKoeU0juxq3kbTdRRKw0xeJUlyQyFKBRSKYSXOd59gr6aomcjizpfC3A5P2X2Ee5TySr9Sxe6PxNnL2AZaCckV+3KcczAmvI898MfLLvw2UF3Y1/BscMOUu8yTEqEAs3jO/HU/xybDUGOW+hKl/aq2LLMDQXpKpjcfOW+yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ulYAmRqu; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ulYAmRqu"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e81749142b3so3452431276.3
        for <llvm@lists.linux.dev>; Mon, 23 Jun 2025 04:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750679623; x=1751284423; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B805XrZKRxPEF7q0TmzBdS99aJNQ99+WDQeiV+moFIY=;
        b=ulYAmRqurcy5Ox5FCZLSg4XwXgEb8AI1a6XXGkWQKxBa9kdtGWWdl035z+o3skS73w
         EMSM/V/de6yTBeFBoKI1EmotXNKekBefHzqGojAnmpETw8WLO7a+pdbiHE9ryAgyXUzd
         I8jgZ4U/o8VW7NeERnxMY4QaKzfTbMwOnc0YSnITjNjoQRlVrYFZzRc3pLaVBALIkWS6
         P6NPEvafF3GKryc0BDLrwBxxBOd42Lc8P/aYfQ2NuGp6TqDZN17/j0yX/0qPeADmcjUG
         ZoZZy/w2LrmsJ2CXVQhJlEcbKDucG/WgUPDI4WgImhItWZ8vXZWIWogyFYM/UwSMcXCA
         qOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750679623; x=1751284423;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B805XrZKRxPEF7q0TmzBdS99aJNQ99+WDQeiV+moFIY=;
        b=xRMQr4/F9htbrHZ38rFXtBflwsBH6xlQ43etPAl1CTz+ZFJNpUSM+iIaHWa7oXNjgf
         NEiYtgXfn9cQkKZrzj2godMd9WfG3jNMeO9YuiHXdJFrjHg7ZVQDIEYfsfPHK73xTjSN
         ZoC4PS7Y9jtodJrs7YP+zDTQPDLiDACsElikgBqhd/7JU+cKdXFuqY1zEtQNKoQ1irBS
         Hemxb32b8E2l0RJt02jIT63ysSImfa+myouoPUBSVLFl6DJ4LSZld5BPUV/ujA7BzFZE
         lv5kgYCCmVtdcX+DJTi1lz0UIQZgT9DpZcD147/8C0aDTlId5wUPte0BhS9E6ndra/c+
         cNqA==
X-Forwarded-Encrypted: i=1; AJvYcCXW5NKcssFdVsyy7uPcgIqwa+3HEmAeVuGWESMi7oZAvFD9fCGUBSW5B9Yp4qP61pvvJOuH@lists.linux.dev
X-Gm-Message-State: AOJu0YxP4GmBUTC9LJPsq4mFjJ+/pSr0jmL6ZJT3dVuQliFxiccb+Nl3
	w8WE6eYVHztPcXlG2kE0Fr2xVyyl2tNATSVpl1WF5PvOOO0C0vWxfFuyceHA4jwbVdPyzYzrOzH
	HG8dWsgHw21uZXXb5YzrhqFRXIC8iTy/TP0MGcuGtrA==
X-Gm-Gg: ASbGnctk5vnZ7YtgmT9qw4rEUh+fNqHBSNcaVMNS/X5uKFnQozDnftB/wk3Ch7JRlhM
	ugAQ4zy+y5MLQTuAUPG8C6F/GJpmOIPeYqInkSpQ6KavMIHg/KSa2wY7n2PUHHmGk1JkXyOasVw
	lOW4yNvUFlftjgspOc9aQuDnn/InhfTlzp4GejSsolrNVZLGhGT9fE4gI=
X-Google-Smtp-Source: AGHT+IELqiLxPqxfP1B6M+PoD9dckt5ie65k3DRMyhajXGBqAf5XZnld8i7QkaUB7/s6v+6stoYuis0ocxT18YOr0D8=
X-Received: by 2002:a05:6902:1612:b0:e7f:6815:ce6e with SMTP id
 3f1490d57ef6-e842bca3da2mr14607843276.20.1750679622828; Mon, 23 Jun 2025
 04:53:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250620-mmc-rtsx-usb-sdmmc-fix-clang-implicit-fallthrough-v1-1-4031d11159c0@kernel.org>
In-Reply-To: <20250620-mmc-rtsx-usb-sdmmc-fix-clang-implicit-fallthrough-v1-1-4031d11159c0@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 23 Jun 2025 13:53:06 +0200
X-Gm-Features: AX0GCFsecqypaGAnLbHfqAW49LWdYlrsXNE5tE8Z_-FA8P0SbCCQ99PmaGdH8eM
Message-ID: <CAPDyKFpavS8o8X6zYzJXuS=N_3ya7f5gWH_xQDbxbZstSAuaRA@mail.gmail.com>
Subject: Re: [PATCH] mmc: rtsx_usb_sdmmc: Fix clang -Wimplicit-fallthrough in sd_set_power_mode()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Ricky Wu <ricky_wu@realtek.com>, linux-mmc@vger.kernel.org, llvm@lists.linux.dev, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Jun 2025 at 20:25, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Clang warns (or errors with CONFIG_WERROR=y):
>
>   drivers/mmc/host/rtsx_usb_sdmmc.c:1042:2: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
>    1042 |         case MMC_POWER_UNDEFINED:
>         |         ^
>   drivers/mmc/host/rtsx_usb_sdmmc.c:1042:2: note: insert 'break;' to avoid fall-through
>    1042 |         case MMC_POWER_UNDEFINED:
>         |         ^
>         |         break;
>
> Clang is a little more pedantic than GCC, which does not warn when
> falling through to a case that is just break or return. Clang's version
> is more in line with the kernel's own stance in deprecated.rst, which
> states that all switch/case blocks must end in either break,
> fallthrough, continue, goto, or return. Add the missing break to silence
> the warning.
>
> Fixes: 2c3809bd6f65 ("mmc: rtsx_usb_sdmmc: Add 74 clocks in poweron flow")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/rtsx_usb_sdmmc.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/mmc/host/rtsx_usb_sdmmc.c b/drivers/mmc/host/rtsx_usb_sdmmc.c
> index 591d37206654..c5f6b9df066b 100644
> --- a/drivers/mmc/host/rtsx_usb_sdmmc.c
> +++ b/drivers/mmc/host/rtsx_usb_sdmmc.c
> @@ -1039,6 +1039,8 @@ static void sd_set_power_mode(struct rtsx_usb_sdmmc *host,
>         case MMC_POWER_ON:
>                 /* stop to send the clock signals */
>                 rtsx_usb_write_register(ucr, SD_BUS_STAT, SD_CLK_TOGGLE_EN, 0x00);
> +               break;
> +
>         case MMC_POWER_UNDEFINED:
>                 break;
>
>
> ---
> base-commit: f5c755ef810009b85350884c483705bd04365370
> change-id: 20250620-mmc-rtsx-usb-sdmmc-fix-clang-implicit-fallthrough-732a574554b0
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
