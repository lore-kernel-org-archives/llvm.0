Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B213210
	for <llvm@lists.linux.dev>; Fri, 13 Jan 2023 11:20:00 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id ss4so44305969ejb.11
        for <llvm@lists.linux.dev>; Fri, 13 Jan 2023 03:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UVemH/+n0aJ7yrCrT3xpnKXM2hgC6V4Q+8fb69hwAOk=;
        b=HN33jyjNY76i+LmfFBLXwMrJnAzRKg4pfO2NpJJS1nn6PmfyMNwshrXZx9YqEjRVYU
         jAxgiZUHuZX+hj9PxL8Q265xOrOVw6Lt9h0Ii9YvBxYnGvt1UpW115w7DFNFDF2KmvWo
         aP/GvHAjt5Q0w6Ay24UpdYig+C0+cAPhXG2ud4EdeYYRRbpe7YIF+8BDiNJiudCdNx2O
         JMKT1pF0kHr0WGSn6n0oruAJqA+gan1xxHoZNg/ap7PjxyMZ97HHy0Ct+l1+JIdr64F3
         //ir3yRDNNDlRnCvRBdR5c9dmhnAo/k31psfuedl+viz/MS0gHRMYjCzcC2Lf6896ytL
         GRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UVemH/+n0aJ7yrCrT3xpnKXM2hgC6V4Q+8fb69hwAOk=;
        b=OIY7obbnGNSNqlRov7ch6IQaotcegCzbaWnk+QZ3CdMAfQEbXxoUz6dGlVUZft8awD
         uUX/vx4mHuIDLnP++kNimWBo2vrU3UgnlUczuob0WcVs+9LUSDeuKaenfIIpaaFKJtX5
         xciPiYTtB8em4pWyRvTrgPklPMgsjkyUKStCwBHomaBEAyglTTvLoO8BtJ/I9FAmN/07
         sb97ploquDETZis6wp9kLtCohxccrF9G9N0ytzC3M9BKJY1lksqXvrmvDpT2X57Zk8Bi
         AFqPzKK9aIQyZWEo58I4NE/pZh5SWda3X4ue4SuU+aRBt2YotCEOOl+1PFhRrr+nLOmq
         AAHA==
X-Gm-Message-State: AFqh2krHgH/ai9Qyv7Ghu7cKqzDis8lAKqIXbHoHbA7fBPIO7XGzb4s2
	yspe9xlAgLBHft6UaeG+cAoZqg==
X-Google-Smtp-Source: AMrXdXuBDV8ne84njqmvaISRnt4bQg7QL0cfZ+DV1EG8StSnyW43wySSBQBImvGeW9CNIaH+VYgy3Q==
X-Received: by 2002:a17:907:8b11:b0:81b:fbff:a7cc with SMTP id sz17-20020a1709078b1100b0081bfbffa7ccmr69306280ejc.18.1673608799052;
        Fri, 13 Jan 2023 03:19:59 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id k8-20020a1709062a4800b0083ffb81f01esm8397495eje.136.2023.01.13.03.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 03:19:58 -0800 (PST)
Message-ID: <72b30123-300d-0751-9725-6cd8e2a18f4d@linaro.org>
Date: Fri, 13 Jan 2023 12:19:56 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v30 01/11] dt-bindings: arm: mediatek: mmsys: add vdosys1
 compatible for MT8195
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Nathan Lu <nathan.lu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Xinlei Lee <xinlei.lee@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, llvm@lists.linux.dev,
 singo.chang@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230113104434.28023-1-nancy.lin@mediatek.com>
 <20230113104434.28023-2-nancy.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230113104434.28023-2-nancy.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/01/2023 11:44, Nancy.Lin wrote:
> Add vdosys1 mmsys compatible for MT8195 platform.
> 
> For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding to
> 2 different power domains, different clock drivers and different
> mediatek-drm drivers.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

