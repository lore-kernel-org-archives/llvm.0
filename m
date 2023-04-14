Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE4E29A8
	for <llvm@lists.linux.dev>; Fri, 14 Apr 2023 15:43:51 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id hg25-20020a05600c539900b003f05a99a841so17959508wmb.3
        for <llvm@lists.linux.dev>; Fri, 14 Apr 2023 08:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681487030; x=1684079030;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YIbNvnDJkbKIDG9W40wHYyYsAJM6e0/VxMfL2/QQhNY=;
        b=QXpobAtYXuuja8eAnUitUYYdJFXqaConoab7s3RSbwHCOgxUoVFacXpnQJBcpA+JQb
         5N5tvC74yxQMqIqvqsop1XuZ4P+M7IaoRPqSbiY/1c2NeOfnuh57dPnBNRYtuvpOuOYQ
         d4ovTXDqN0R67vvA11ZrTveMDsLXR57NkWxMv0PtrbwpGTIEWGxabu7b6Kc4D1VC/yVL
         ftBSnh4ajvZ0aKZhcFea4GRL9sEGf22K7vufTD/WbjkwkdvB2NQi/q4ApF1oXBGDeC/I
         rZ1ZyK37G8LoSePqAYSqaAqTRIwbVHk0FT/40JaT1ZT4QJ2nRUPTFVGP/TsKf+MDR3mA
         gvvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681487030; x=1684079030;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YIbNvnDJkbKIDG9W40wHYyYsAJM6e0/VxMfL2/QQhNY=;
        b=io5YQvl3oTfiS3K8mZqKriP+tCEjw8ivkDzhJ0IOfsRUDu9V8hnFFL1VeLEYgUQUXC
         cgCsPx1FpMDqi4bTmxI09+0KdGpm5TF1I8HP6KlvF5FuQbkypDPho/uh+q65zED4gYtC
         tUip60ZE6nNOMD0K77jTPy1qquOxk6qKIAYt7goRb56R5jR/5iXk4avb/bNhWFLStkY+
         AFYLt/n+kGDx3vG28zZfbDgen2UZisefcMbV0PAfyz30Lx4gsD2L0rq/Ke13wYc4QESH
         TA03Ss9V+rxm2CTaWjuJ1E0k+gZR2UzWz9JsUB5aGBljcXSw886oTMkylpDgAZRhkp1m
         6hOQ==
X-Gm-Message-State: AAQBX9d1G6dvfa58cLKdm2ipKKrQx5OBMlIIu/ktnPawH3R0lTV7SYrG
	G6JK+hAJm+Zu6n6FUBKz768=
X-Google-Smtp-Source: AKy350a/b5Qg3ihzSVs/aHO9rCG1Yz359ZRWoVzo+MEmLSGdlhob8RT2eGiZbxTyHZHZZ5H4owZGGA==
X-Received: by 2002:a1c:770d:0:b0:3ed:95a5:3257 with SMTP id t13-20020a1c770d000000b003ed95a53257mr5261946wmi.2.1681487029517;
        Fri, 14 Apr 2023 08:43:49 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id r4-20020a05600c458400b003f0a090d798sm6510629wmo.18.2023.04.14.08.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 08:43:48 -0700 (PDT)
Message-ID: <3242b862-0e7c-b7e9-14cd-3fbcbb87ba04@gmail.com>
Date: Fri, 14 Apr 2023 17:43:46 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] phy: mediatek: fix returning garbage
Content-Language: en-US
To: Tom Rix <trix@redhat.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, angelogioacchino.delregno@collabora.com,
 nathan@kernel.org, ndesaulniers@google.com, granquet@baylibre.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20230414122253.3171524-1-trix@redhat.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230414122253.3171524-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/04/2023 14:22, Tom Rix wrote:
> clang reports
> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable
>    'ret' is uninitialized when used here [-Werror,-Wuninitialized]
>          if (ret)
>              ^~~
> ret should have been set by the preceding call to mtk_hdmi_pll_set_hw.
> 
> Fixes: 45810d486bb4 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
> Signed-off-by: Tom Rix <trix@redhat.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> index abfc077fb0a8..c63294e451d6 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> @@ -292,9 +292,9 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
>   	if (!(digital_div <= 32 && digital_div >= 1))
>   		return -EINVAL;
>   
> -	mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
> -			    PLL_FBKDIV_HS3, posdiv1, posdiv2, txprediv,
> -			    txposdiv, digital_div);
> +	ret = mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
> +				  PLL_FBKDIV_HS3, posdiv1, posdiv2, txprediv,
> +				  txposdiv, digital_div);
>   	if (ret)
>   		return -EINVAL;
>   
