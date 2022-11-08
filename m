Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1EF8C19
	for <llvm@lists.linux.dev>; Tue,  8 Nov 2022 17:47:02 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id a14so22164956wru.5
        for <llvm@lists.linux.dev>; Tue, 08 Nov 2022 09:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4S8EZJDZbtM3oCAAcuZ31iTmiTXYW1L+lPMVCWl/GDk=;
        b=dhZDqwf14fe2j9UdiqdGAWf/ff1Enkmy8X7284TTYgt4vFS5oxwGlWCk44cjNOIWeh
         C7X1k7EWwaNcYfTW7s6c2Asy79xj6KnQhtDGuXcw6iRSMJnLb8BfC1BPXc+f1CpfS3xD
         lGHz09ZV17PRqZYjpnOERIqukj8eVPBJfhKQbBWMtYRHGTA2BqHThsVGAsJoCZH8Saxk
         dDc3M+rhEaszbLQntXKf7vAtyFZzlOb0phkUD/JBrSuEPQMbGR379flWMVr+i7RBWLq8
         IS6zMymo8wmzuP+pZh5NlJ7HuVoFGgidpe7eW2S/X4l4ByZdmR+JdBMjOyeIJPvKh4lp
         jVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4S8EZJDZbtM3oCAAcuZ31iTmiTXYW1L+lPMVCWl/GDk=;
        b=k/xgsk2np/Khz/Zwwf16+iBFei/QTZGTaWqrWV4K+mQSMD3Oxhc7f+j3pijU+5MX1U
         9ywpNGjWg1s2fl5PTDp98XRGVu/x/+AhTrKpOBmljpLvi60/EgMq/Z7eHjEKb3TI6WGe
         0kxzKwP/Uqd4G8+oaSwRsbKuQHsHYsXswzdrdGvouLo85Rj6H2UkfOgVeuMXwCW1ke7w
         2UK6jKk+sC8FcVVdukqvxNMVPP56UEwI4oQptlBVUiv+A5NCenXKwvf5Kwb+TIXmfrhA
         +uRBd1jXvTVoeHzqFm/tKN1e24rQGyR5Efl21v5ADDU5sDAIxcTkKlfTPD6zrlwOn2Qy
         8gVw==
X-Gm-Message-State: ACrzQf3e/bNsvWHPL/vjqjGrqnOIJM5Ux2yKhEp6ZHjYLyXz/AdVVw8Z
	+dORLlBVuIe4NbADmsbnvQE=
X-Google-Smtp-Source: AMsMyM6KcCnDX4sMDQZ66dZ+DyYmTDlrlRon5/4mXWx4R8J1wOheJBCVno0GUU2uAy7tiO5R+7rzEQ==
X-Received: by 2002:adf:f392:0:b0:236:2c41:d3f5 with SMTP id m18-20020adff392000000b002362c41d3f5mr37236832wro.596.1667929620336;
        Tue, 08 Nov 2022 09:47:00 -0800 (PST)
Received: from [192.168.0.25] ([37.222.251.204])
        by smtp.gmail.com with ESMTPSA id r17-20020a05600c35d100b003c6cd82596esm16687600wmq.43.2022.11.08.09.46.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 09:46:58 -0800 (PST)
Message-ID: <c6297a1c-e282-4a18-f16c-fa2df08b440a@gmail.com>
Date: Tue, 8 Nov 2022 18:46:55 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux@roeck-us.net, nfraprado@collabora.com
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, singo.chang@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221107072243.15748-1-nancy.lin@mediatek.com>
 <20221107072243.15748-2-nancy.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v28 01/11] dt-bindings: arm: mediatek: mmsys: add vdosys1
 compatible for MT8195
In-Reply-To: <20221107072243.15748-2-nancy.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 07/11/2022 08:22, Nancy.Lin wrote:
> Add vdosys1 mmsys compatible for MT8195 platform.
> 
> For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding to
> 2 different power domains, different clock drivers and different
> mediatek-drm drivers.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml      | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index 0711f1834fbd..aaabe2196185 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -48,7 +48,9 @@ properties:
>             - const: syscon
>   
>         - items:
> -          - const: mediatek,mt8195-vdosys0
> +          - enum:
> +              - mediatek,mt8195-vdosys0
> +              - mediatek,mt8195-vdosys1
>             - const: mediatek,mt8195-mmsys
>             - const: syscon
>   

I think we had that several times already:
https://lore.kernel.org/all/6bbe9527-ae48-30e0-fb45-519223a744d7@linaro.org/

We will something like this, but please check that this does not give any 
errors/warnings:

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml 
b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index eb451bec23d3d..8e9c4f4d7c389 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -32,13 +32,22 @@ properties:
                - mediatek,mt8183-mmsys
                - mediatek,mt8186-mmsys
                - mediatek,mt8192-mmsys
-              - mediatek,mt8195-mmsys
                - mediatek,mt8365-mmsys
            - const: syscon
        - items:
            - const: mediatek,mt7623-mmsys
            - const: mediatek,mt2701-mmsys
            - const: syscon
+      - items:
+          - const: mediatek,mt8195-vdosys0
+          - const: syscon
+      - items:
+          - const: mediatek,mt8195-vdosys1
+          - const: syscon
+      - items:
+          - const: mediatek,mt8195-mmsys
+          - const: syscon
+      deprecated: true

    reg:
      maxItems: 1
