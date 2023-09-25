Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9ED910E4
	for <llvm@lists.linux.dev>; Mon, 25 Sep 2023 07:13:07 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9b27bc8b65eso173994766b.0
        for <llvm@lists.linux.dev>; Mon, 25 Sep 2023 00:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695625986; x=1696230786; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/8iCV0HKXYgLSBrZA3lOs4wADg7WAuFH2qTQMoH5xB0=;
        b=oqOMOivl4I/9IeXeUlXeJRZbh85UWFEVuZ5vb+HUkq4z6sIUVTizhIcutgXtUK1CCS
         tWrKwt0K3GjyLLmlfsfoO4WVT+CbTnXRmsA8muF5UYskoi0dJXXqcnpz0+Yx6UhTpaLL
         lkuN4J4b49mHko+ebJ05XsKdaJc0DEupXNKAwAW6pGBxM/XalSbFX2n9iS6sE59O6+iH
         I3dV6J12VKnF8L2EZCNINUq38z4Wf4u8FYRVlsGPEYuXjylVvINufVdsnf7zOvv6YW8D
         Tly3AehNzOvHw1ehuK7xFJ9sNA7P263pYaCfbbqDGgeeHkguccL1GRYgz4Jc++smoPsx
         XzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695625986; x=1696230786;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/8iCV0HKXYgLSBrZA3lOs4wADg7WAuFH2qTQMoH5xB0=;
        b=axUcMsVWEOXkuRjFJGo3U6h8o47NN7HQ32RxR7NopzNvkZAQrSEZiK94po/D7s7jRb
         pzxu0oueePLRYQdXuLPHFH0McAUpz8cHX09+UfyfnkQTbSQ3Ff9R15LLVNZfTj2+d5eX
         n50/IXMen2HeItbpNlet+KPYv9dGmwA6eddRPI7IWkWpr1frayCRQgRkhGgAYGqoPo0F
         3ys9F+DnZsFCRmMyoJ8H9wpfDYXovy/HyOyC1J0TzKhocOjJ+IS4s5BiJ9ZCq48bWVm9
         WjdwQxmB6PYW6EaBMbn8gTq36PJGjKk53qllr1WTCDARBlvGcK+uEjf15GGoKrTsgB6i
         M5Pw==
X-Gm-Message-State: AOJu0YxtZZnAzUl3LYApikCCA09mvDKo982lCZDks0+hFsxgt77pd7O3
	7zhgeZraB/cdH/sE5ctdRY7tPQ==
X-Google-Smtp-Source: AGHT+IFCtJJhX6fU8/rXziSQQ+7DvYnxiDLCucOeAO55eZt9WPXeY0oCE7rgZDiyG+dIObNt+y7Zww==
X-Received: by 2002:a17:906:c143:b0:9a1:f81f:d0d5 with SMTP id dp3-20020a170906c14300b009a1f81fd0d5mr6385597ejc.54.1695625986178;
        Mon, 25 Sep 2023 00:13:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id i13-20020a170906090d00b0099cbfee34e3sm5906887ejd.196.2023.09.25.00.13.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 00:13:05 -0700 (PDT)
Message-ID: <80692b04-9f60-4112-a594-f405adb27cdd@linaro.org>
Date: Mon, 25 Sep 2023 09:13:04 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V12 3/3] arm64: dts: ipq6018: add pwm node
Content-Language: en-US
To: Devi Priya <quic_devipriy@quicinc.com>, thierry.reding@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
 ndesaulniers@google.com, trix@redhat.com, baruch@tkos.co.il,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev
Cc: linux-pwm@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 nathan@kernel.org
References: <20230925065915.3467964-1-quic_devipriy@quicinc.com>
 <20230925065915.3467964-4-quic_devipriy@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20230925065915.3467964-4-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/09/2023 08:59, Devi Priya wrote:
> Describe the PWM block on IPQ6018.
> 
> The PWM is in the TCSR area. Make &tcsr "simple-mfd" compatible, and add
> &pwm as child of &tcsr.
> 
> Add also ipq6018 specific compatible string.
> 
> Co-developed-by: Baruch Siach <baruch.siach@siklu.com>
> Signed-off-by: Baruch Siach <baruch.siach@siklu.com>
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> ---
> v12: 
> 
>   No change
> 
> v11:
> 
>   No change
> 
> v10:
> 
>   No change
> 
> v9:
> 
>   Add 'ranges' property (Rob)
> 
> v8:
> 
>   Add size cell to 'reg' (Rob)
> 
> v7:
> 
>   Use 'reg' instead of 'offset' (Rob)
> 
>   Add qcom,tcsr-ipq6018 (Rob)
> 
>   Drop clock-names (Bjorn)
> 
> v6:
> 
>   Make the PWM node child of TCSR (Rob Herring)
> 
>   Add assigned-clocks/assigned-clock-rates (Uwe Kleine-König)
> 
> v5: Use qcom,pwm-regs for TCSR phandle instead of direct regs
> 
> v3: s/qcom,pwm-ipq6018/qcom,ipq6018-pwm/ (Rob Herring)
> 
>  arch/arm64/boot/dts/qcom/ipq6018.dtsi | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> index 47b8b1d6730a..cadd2c583526 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> @@ -398,8 +398,21 @@ tcsr_mutex: hwlock@1905000 {
>  		};
>  
>  		tcsr: syscon@1937000 {
> -			compatible = "qcom,tcsr-ipq6018", "syscon";
> +			compatible = "qcom,tcsr-ipq6018", "syscon", "simple-mfd";

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check W=1` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).

Best regards,
Krzysztof

