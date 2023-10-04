Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AB410963
	for <llvm@lists.linux.dev>; Wed,  4 Oct 2023 09:20:12 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-99c136ee106so336040066b.1
        for <llvm@lists.linux.dev>; Wed, 04 Oct 2023 02:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696411211; x=1697016011; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Yqai+Q7U5ay16Eb2jvAfZfgJGhV4t41ugn9yWAYt1I=;
        b=cP2QhTxZQcL0VXoebFGgonrGAxz1NgmYbCfjvHGTZHzI0FNWzNNxlBAuCFhYrDIvJj
         sdG68z7K5sZWFvZfKS1rdW12zUO7EIesoH0eDd8OxWvvadmGE/MIO9yuSQmqKXjmAqP8
         aBP7e8eszZZcToS7LA12MPf0abBiBLs1/6m34HdiDOWgkY27I8bdJQQupC1dfzzJ40k1
         c5iXvdQNjjnX0kALgEC3/3ekfg3nrmCV1hikArMRs29m3ZbCem1qBDK0csTIJ5A1EhXc
         w0kZm/lq99/rQ6aSQp0pu5RpCCDxuPeekKj/twsKISCPhs4LP3MtxMdkAkHDaQ98Z7XR
         Pf/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696411211; x=1697016011;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Yqai+Q7U5ay16Eb2jvAfZfgJGhV4t41ugn9yWAYt1I=;
        b=lvmsVYYHLG/kMuvI97FsLNxU1dZJdfYaxdpBJaKtpw8r0zNeyMXhf2W58gCRshgw8f
         Imi9OaetZw+wnM9mPLeKbV2+ap+++nmlSQKYwncr44PFv8ym0EG7zcUz5UIeoJ5VQ0NX
         qPBkoqb+AKP/3GJRGcUOr8pOh6H72wObLXFndNHNBIEnuW4OKPeHoa1PDKqUE1goTQAv
         8yfBFXk2F+9pAuS46DVdOqchB6TXAyOiXQq5MaQebdy026YPBLcm/tEZ30ho19kN16cO
         6hxveThNTqhLzl5COuBipadhqFIOJF7gBScPzOtFnKoaO6Du4OiexdWK1krIM8SJ/ME0
         6big==
X-Gm-Message-State: AOJu0YxEN4T9Gg2ArCTBlzTS8zz64PdxZqRrRcHthGzIuSYGVzDcQKw9
	ACW/u0CA19OR0krV8beLt/hIPg==
X-Google-Smtp-Source: AGHT+IGwItFXn0vwCaLEFwOWZQ2aLf/Ju1XDzngBp/NF4SJnKMLpyrtAfpiGAzwta1TRPHvVN3g/fQ==
X-Received: by 2002:a17:907:77c7:b0:9b2:b152:b0f2 with SMTP id kz7-20020a17090777c700b009b2b152b0f2mr1463348ejc.10.1696411210961;
        Wed, 04 Oct 2023 02:20:10 -0700 (PDT)
Received: from [192.168.1.197] (5-157-101-10.dyn.eolo.it. [5.157.101.10])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906945700b0099b921de301sm2442428ejx.159.2023.10.04.02.20.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Oct 2023 02:20:10 -0700 (PDT)
Message-ID: <60da3633-61f6-49c1-b656-2804c35d3e82@linaro.org>
Date: Wed, 4 Oct 2023 11:20:08 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V13 3/4] dt-bindings: mfd: qcom,tcsr: Add simple-mfd
 support for IPQ6018
Content-Language: en-US
To: Devi Priya <quic_devipriy@quicinc.com>, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, lee@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 thierry.reding@gmail.com, ndesaulniers@google.com, trix@redhat.com,
 baruch@tkos.co.il, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20231004090449.256229-1-quic_devipriy@quicinc.com>
 <20231004090449.256229-4-quic_devipriy@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231004090449.256229-4-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/10/2023 11:04, Devi Priya wrote:
> Update the binding to include pwm as the child node to TCSR block and
> add simple-mfd support for IPQ6018.
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> ---

Thank you for your patch. There is something to discuss/improve.


>    reg:
>      maxItems: 1
>  
> +  ranges: true
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +patternProperties:
> +  "pwm@[a-f0-9]+$":

type: object

> +    $ref: ../pwm/qcom,ipq6018-pwm.yaml

This should be full patch, so:
$ref: /schemas/pwm/qcom.......


> +
>  required:
>    - compatible
>    - reg

After required (but before additionalProperties), please add:

allOf:if:then: for other compatible (so use keyword "not:") which will
disallow pwm for them. Disallowing is via:

    patternProperties:
      "pwm@[a-f0-9]+$": false

See   Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml
around line 240. We need something similar.


> @@ -57,8 +74,29 @@ required:
>  additionalProperties: false
>  
>  examples:
> +  # Example 1 - Syscon node found on MSM8960
>    - |
>      syscon@1a400000 {
>          compatible = "qcom,tcsr-msm8960", "syscon";
>          reg = <0x1a400000 0x100>;
>      };
> +  # Example 2 - Syscon node found on IPQ6018
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-ipq6018.h>
> +
> +    syscon@1937000 {
> +        compatible = "qcom,tcsr-ipq6018", "syscon", "simple-mfd";
> +        reg = <0x01937000 0x21000>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges = <0 0x1937000 0x21000>;

Please put ranges just after reg.

> +
> +        pwm: pwm@a010 {
> +            compatible = "qcom,ipq6018-pwm";
> +            reg = <0xa010 0x20>;

Best regards,
Krzysztof

