Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8895B2D321D
	for <llvm@lists.linux.dev>; Tue, 30 Dec 2025 15:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767108860; cv=none; b=goHKvydMLxdIzuR7bH7g1yNOIKKzt0XPJTN8+ArOnvneFfMLhrXQ9L/pzXDJ5tUNavnip67UcAbMreOoLLx7Stzy4Y0DpeXjnpCNuCCTIV3bZ9p6kVra03ZaPHl2HYMapxw6otDvOs3PF0ufMJtVbHx0fugZJFC4dpSJBk/egsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767108860; c=relaxed/simple;
	bh=aqzRyBn+Y3OqK77qhoorBraA99Y38CJhGBTauNcLIyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hJoFYq2y3ZAc43JIMvRKJp4iNIite3hRyNHOdMs99mx3Ey6X/3jUiCaJL6jVKkjJ8vmu+obrh9ym7+3fhmKnoW/EPiJBtu1FIb+EESIS1jiPj//OnNC1au66st4MWiUJ6CidKDxjmSAje5tST94GwfCVEvuJWoYSpRz3z4vWagQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NuEaWsHK; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NuEaWsHK"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37ba5af5951so91834731fa.1
        for <llvm@lists.linux.dev>; Tue, 30 Dec 2025 07:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767108857; x=1767713657; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nXCQAS3HJRf+jQxCM70PqHXnYYGKX1vopCn4f1WZ9cE=;
        b=NuEaWsHKG9NVGVxMpenH+k+eR0Ts6kUs1HsdIkl8fDs9nJ+l48waVAA7AcwCv0q/L7
         O7qoNbD1VEUvPIEugyvkvTNtW9oPqnzwBM+QU5fBkuUIqjO0FDVsnUbDXYnF6f5cbtHM
         VXyHj5SrxiVDmuc3u78jSQJUBV44fgqI1AxREdNdvjRGkVbdPKM2r3UgiwdSsROeqP3F
         76fcws++298Gg/e8fL8Y4fqfFGm/qpKCqlysG1dytb5zk+pZxAzk/zwgm5JhzGSjZ3C7
         nuwttYFpZR1Ba1KPUr1H8OA24wGYnvEMXihPWKFRxAfo2fu9Xnux6lT6MNncvYG8XcL0
         bGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767108857; x=1767713657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXCQAS3HJRf+jQxCM70PqHXnYYGKX1vopCn4f1WZ9cE=;
        b=Wh8sv0k5aGwH7xhkOlqZjVilY5zxb+bQTUMBjXeghfiRFb1Qofuej6kmZiLg3bNO48
         sOOCaClYJeNCWnhtgSbvpsm5g9bRrLuvjh1epysxdnsv+9jf3I8yrQgbpDAD2a6T/BBT
         p5iYsQUb81Fc+PBUNsT0+td2Gmg74IWYAmrVJrXCkNVmc/NtFCYlrdHFEUGlzUlJABWB
         TM8s4Bw4Xg44zOc/GRravIM38OXOxBvp+gQ4izsUrNnJ2zr6bLOp0tOsgKvVvkk9GPVl
         Lev1DWSRKDHSdvXCtAp3aCXpOWarPm5yvDevhanfyYscQxKPukdIYnpcZFMIP6Of9NqZ
         huFA==
X-Forwarded-Encrypted: i=1; AJvYcCXnHR4vymfDGD4DobXNb0NI2Pyb5DSpm//1HrAszZvgoLoyACHvTj6UwgP/U/SqRI8mZvKB@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/ik7LJPb99VQuoupcHrDewUPdvtgz5pVkvMHYGozJPMMudmXN
	7Wb5K70oKvwf8F2RxvopqJ0g7BQDWzG50EmvqKEfcjr7WfNruD341cTXKcc8RhvqYIX70KueuLL
	/6h70ibWFo2WJb/LJ4NO2d8Df1pXDzYTy1dYi4Iqftg==
X-Gm-Gg: AY/fxX6E/Bir2b4+8HN/IQgBmYzNjleonVrXhJSRr19xiM2fS6uoV/9cDAAHsShhTbJ
	F3RwpoJFJLGkwDWTWK6vaTxZafyViV1PQKHW1kKSHQIJFLe8Chq5Zl422FyGELSXNcA7NHsixDI
	C8WA5xMe4oMrm2TjkH96gqqw9/3gXiodrItJDH717cDhHA2tkLrccp2GDjR8+Vx25n8TgN2v2iL
	a0N0RDpzR+LvD1OdMaBTdVkTDIZruCPaqJH7FT1rrtvvv5gx6YIT0ug6+JhuFMOtN5ka/iguC/u
	KKc475Q=
X-Google-Smtp-Source: AGHT+IF8m67UtLFJYo+1Sd/5xP1asTd78BRhH0xaCX+pqytxUScESGkOS8OTTGNkp77INxT4etPPBh36TlR00OdBV7U=
X-Received: by 2002:a2e:a801:0:b0:37b:b952:5e2 with SMTP id
 38308e7fff4ca-3812158e6d1mr92229501fa.16.1767108856717; Tue, 30 Dec 2025
 07:34:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251224124431.208434-5-krzysztof.kozlowski@oss.qualcomm.com> <20251224124431.208434-8-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251224124431.208434-8-krzysztof.kozlowski@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 30 Dec 2025 16:33:39 +0100
X-Gm-Features: AQt7F2oKPch5XI3ozINSBYMELnoLnRJYzcAZlrhoJTH7OcGc0z1qpY0CIewnVRk
Message-ID: <CAPDyKFp3X0EeiGRHLQqzE3vkVoLmOwi=1813S32sLTqXab43gQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] mmc: sdhci: aspeed: Simplify with scoped for each OF
 child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Aubin Constans <aubin.constans@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Robert Richter <rric@kernel.org>, Paul Cercueil <paul@crapouillou.net>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Adrian Hunter <adrian.hunter@intel.com>, 
	Joel Stanley <joel@jms.id.au>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Dec 2025 at 13:44, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

All patches in the series applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-of-aspeed.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
> index ca97b01996b1..4296def69436 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -519,7 +519,7 @@ static struct platform_driver aspeed_sdhci_driver = {
>  static int aspeed_sdc_probe(struct platform_device *pdev)
>
>  {
> -       struct device_node *parent, *child;
> +       struct device_node *parent;
>         struct aspeed_sdc *sdc;
>         int ret;
>
> @@ -548,12 +548,11 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
>         dev_set_drvdata(&pdev->dev, sdc);
>
>         parent = pdev->dev.of_node;
> -       for_each_available_child_of_node(parent, child) {
> +       for_each_available_child_of_node_scoped(parent, child) {
>                 struct platform_device *cpdev;
>
>                 cpdev = of_platform_device_create(child, NULL, &pdev->dev);
>                 if (!cpdev) {
> -                       of_node_put(child);
>                         ret = -ENODEV;
>                         goto err_clk;
>                 }
> --
> 2.51.0
>
