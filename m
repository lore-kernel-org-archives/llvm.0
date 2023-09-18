Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7898E23C7
	for <llvm@lists.linux.dev>; Mon, 18 Sep 2023 05:21:09 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2c012573498so4272911fa.2
        for <llvm@lists.linux.dev>; Sun, 17 Sep 2023 22:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695014467; x=1695619267; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nUqOvKW20gasQsATUUwUlctmLMbjgvZAK+yffD5Uyfg=;
        b=wfEWEsI472Jqdxx86lFDgiL0h+wvxduqNOiF44GRXar6gWis00YvEG2q1EqFbPkFoM
         LPCK5h5GXOL2uIkp2mPlozsAfxGHwrLvgDd1w2yrfmCKskSUSc0BbhVpQxf7pPnKBChF
         hOs+QdfVSdpMGpJZ3/yPxXJLgo4W5UFqvMkVdEPbBHBmM79mYDjK1bU6IeEflWCeQtmb
         sdJa0ShgPy5aQ7e/xb0pKYdS6MaswmtzetjuElwACniLRKHlvQXos18llf1atC959es5
         ifcQlcvJFOI+ostJWQxODruP2uw6a61H35nAHkHRR7Ljtf6gZqnuY0M8FAzJ0lEXEJjs
         RJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695014467; x=1695619267;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nUqOvKW20gasQsATUUwUlctmLMbjgvZAK+yffD5Uyfg=;
        b=gMC8rmkDJtAe4UVWxz84UC8kOckjYSv5HUpkVABj8glXDYfsHfoSmeNHP3W0npCI7c
         JujIG+g1coaCYd/7E9rN+qfxl/EeoT7SPXULHbHMIyWACpHVIz0bEvwPP5jWrb2R23tA
         KKoME7u6XS/ura/DRTu1pYtFJqMrf5bmgJeDdnztai/S7Dexjm19gFyWB8Ez+cXWeG82
         T6Ec4+X/t5qJtmwepvGHQqvQhEPC0cle6sgeFtA11U1fieSNCaJlzjsLk/lxKqPAtlDM
         dNCIO8wKDVPhD4VnIkNhAZWD13Xc8Ow0Rkubfq+mWXfI4ndFJojLotQb8wBFu7Fkja7s
         uJKw==
X-Gm-Message-State: AOJu0Yz0F7o2/BTmnCJBZaspaxya+4/tvv8euH/z7RyTztO6/B4H02tq
	XHwYsu1PHaWDcwx8NR5BYxkdOw==
X-Google-Smtp-Source: AGHT+IGxZSTVlGdgiAqlRYsJc9cSkiCTCX8EBP3s1HUqt8CLrGGNYHaHF7CoPnJ2bp65LJ0taBT0pw==
X-Received: by 2002:a05:651c:97:b0:2b6:d6e1:a191 with SMTP id 23-20020a05651c009700b002b6d6e1a191mr6585652ljq.23.1695014467372;
        Sun, 17 Sep 2023 22:21:07 -0700 (PDT)
Received: from [172.20.10.8] ([213.233.104.217])
        by smtp.gmail.com with ESMTPSA id u23-20020aa7d997000000b0052a3edff5c3sm5483584eds.87.2023.09.17.22.21.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Sep 2023 22:21:07 -0700 (PDT)
Message-ID: <92da7e0d-0096-7407-1fc5-fc026c5e446d@linaro.org>
Date: Mon, 18 Sep 2023 08:21:03 +0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] mtd: rawnand: atmel: Annotate struct atmel_nand with
 __counted_by
To: Kees Cook <keescook@chromium.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230915201219.never.352-kees@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <20230915201219.never.352-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 15.09.2023 23:12, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct atmel_nand.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/mtd/nand/raw/atmel/nand-controller.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
> index 3f494f7c7ecb..4cb478bbee4a 100644
> --- a/drivers/mtd/nand/raw/atmel/nand-controller.c
> +++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
> @@ -165,7 +165,7 @@ struct atmel_nand {
>  	struct atmel_pmecc_user *pmecc;
>  	struct gpio_desc *cdgpio;
>  	int numcs;
> -	struct atmel_nand_cs cs[];
> +	struct atmel_nand_cs cs[] __counted_by(numcs);
>  };
>  
>  static inline struct atmel_nand *to_atmel_nand(struct nand_chip *chip)
