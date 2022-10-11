Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98473207
	for <llvm@lists.linux.dev>; Tue, 11 Oct 2022 12:20:14 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id f22so4111517qto.3
        for <llvm@lists.linux.dev>; Tue, 11 Oct 2022 05:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/YakFhNpLpumvOh5oHDunclA+gkTRZwRtWWXCJ8zRl8=;
        b=jhOz86q+hE4Tl/6wOHJGFEWqFbyw8x+EKAvrco08gfgBy80fcwjZipZU2w4+1Lk12g
         imuWft0S/KkaxjwCRHY1jWIUwzvF+UpZzGnnLYBSXOMalVKtYq8YMYcvNd5Bjz7Wa12s
         cATv6WR2Ib0WgHHUEdbDPxaYu5kCo/58kmY3tY7CAF01NjR/iOHwMCZNT0n7qKcf0mOs
         isz4f2ku3VuewEFctR0EF319aMwEaBLIXgZ7w8k+LGFKXHqhW0+6WAeYE5/bLm/t3Agy
         GLNkifIVQMprhorNHpNbmZKGst0y9Bbn13nDtpzP5VPLu964O02c8oZmng/MXZ39W1/8
         UejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/YakFhNpLpumvOh5oHDunclA+gkTRZwRtWWXCJ8zRl8=;
        b=vT6N8Cyjksby6REFaDA+NZkVjNh3e7C/7XX0Eh27hrX33MXsBUIxMNU+FpeeYKO1Y3
         lei57GRUsg2Uru1cZpMfXHiPRTkfwPRfGSfni0OWUlfmxq2js+y7/US/jg5pAduZCFX0
         gajHkzKW1H7j9OWCADn3ChFKQTR948b7wazZR7w/8nJX/nm9tKQAVmXUnchvF+bwseqy
         aYr9VQQguYm9GvNdjiV516ICAUGoO9UK0WiovANFem2+JwFJ6pvqmnRXcJD6e9VtX4I6
         6zivRuQTT1YgDZcfQmL47d6hqDcPKurzEJi3Q5EE8DQ/TJB4sONUlj4F8HDl64M+sNES
         gzzQ==
X-Gm-Message-State: ACrzQf1TDhPri5+evrxNdWvk1IIqros12mj4vcYgwDSp9z3lTO1PJzqa
	VIf5qk14NFuVO7V1Nc6zWh968A==
X-Google-Smtp-Source: AMsMyM6fRbj6X+C2Y6tfih+FThJWoSnfBLJ6Ysf+7CiShQzNRCRB2RKBkJpFjOd2eRKG+uoLu3GezA==
X-Received: by 2002:ac8:7f4b:0:b0:35c:bfa2:8bd2 with SMTP id g11-20020ac87f4b000000b0035cbfa28bd2mr18401847qtk.644.1665490813776;
        Tue, 11 Oct 2022 05:20:13 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id dt39-20020a05620a47a700b006ec59941acasm7243990qkb.11.2022.10.11.05.20.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 05:20:13 -0700 (PDT)
Message-ID: <f479acd6-457c-5242-432b-10fec91f0c3b@linaro.org>
Date: Tue, 11 Oct 2022 08:18:02 -0400
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v6 1/2] dt-bindings: input: document Qualcomm PMI8998
 haptics driver
Content-Language: en-US
To: Caleb Connolly <caleb@connolly.tech>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 devicetree@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Jeff LaBundy <jeff@labundy.com>, Konrad Dybcio
 <konrad.dybcio@somainline.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Rob Herring
 <robh+dt@kernel.org>, Tom Rix <trix@redhat.com>
References: <20221010162945.1325770-1-caleb@connolly.tech>
 <20221010162945.1325770-2-caleb@connolly.tech>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221010162945.1325770-2-caleb@connolly.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/10/2022 12:30, Caleb Connolly wrote:
> Add bindings for qcom PMIC PMI8998 haptics driver.
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  .../bindings/input/qcom,pmi8998-haptics.yaml  | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/qcom,pmi8998-haptics.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/qcom,pmi8998-haptics.yaml b/Documentation/devicetree/bindings/input/qcom,pmi8998-haptics.yaml
> new file mode 100644
> index 000000000000..9f51c527595c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/qcom,pmi8998-haptics.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2020 Unisoc Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/qcom,pmi8998-haptics.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm PMI8998/PM660 Haptics
> +
> +maintainers:
> +  - Caleb Connolly <caleb@connolly.tech>
> +
> +description: |
> +  Qualcomm SPMI haptics is a peripheral on some QTI PMICs. It supports linear resonant
> +  actuators and eccentric rotating mass type haptics commonly found in mobile devices.
> +  It supports multiple sources of wave data such as an internal buffer, direct play
> +  (from kernel or userspace) as well as an audio output mode.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - qcom,pmi8998-haptics
> +          - qcom,pm660-charger
> +          - qcom,pmi8996-haptics
> +          - qcom,pmi8941-haptics
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 2
> +
> +  interrupt-names:
> +    items:
> +      - const: short
> +      - const: play
> +
> +  qcom,wave-play-rate-us:

s/rate/duration/
?

> +    description: |
> +      Wave sample duration in microseconds, 1/f where f
> +      is the resonant frequency of the actuator.
> +    minimum: 0
> +    maximum: 20475
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - qcom,wave-play-rate-us
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +      #include <dt-bindings/interrupt-controller/irq.h>

Align it with -| above.

> +
> +      spmi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        pmi8998_haptics: haptics@c000 {
> +          compatible = "qcom,pmi8998-haptics";
> +          reg = <0xc000>;
> +
> +          interrupts = <0x3 0xc0 0x0 IRQ_TYPE_EDGE_BOTH>,
> +                      <0x3 0xc0 0x1 IRQ_TYPE_EDGE_BOTH>;

Align with previous <

> +          interrupt-names = "short", "play";
> +
> +          qcom,wave-play-rate-us = <4255>;
> +        };
> +      };
> --
> 2.38.0
> 
> 

Best regards,
Krzysztof

