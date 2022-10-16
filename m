Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C2C7B
	for <llvm@lists.linux.dev>; Sun, 16 Oct 2022 22:58:24 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id l5so10476451oif.7
        for <llvm@lists.linux.dev>; Sun, 16 Oct 2022 15:58:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JbWnEAg2SsNDRgsWcVmOmhtdqCGa97ZPW4mtEP7xswI=;
        b=4xOk5Gjjea68WlUacnSVhrkFEfpqtlGFq5KxHLazS4u/w8DFJwUMJjOLA7nBYY0bg+
         9PnjKkE1KIDox38wkON+kc7YV7dJpAVuUetmCUwru/4egoi0GQ3F7aUmXje1ePECVuZl
         Z2BikS97O1yK2uFITcgd4tnnFy7OLBoiz8hJFBI+hz2NxvSO0z7NiVcjNfM6bMNrcwoS
         TtYtvJGrkSrP0WCav6TACpuYzbVt4mN5d15BsC5jaZjKlt2U6lBqNZd66itPkS3q7eot
         HFCfC5W9zOvSn06sZIYmlVY+28lmAKPya1DrO55yiF1bgRw94BVzpNbsMJSKyNdvFen6
         hB/w==
X-Gm-Message-State: ACrzQf2iZdvBjlTW5WoJBBuJUF3TQ/QY4UpuUUfrpJ/O6qlLsE0zZVBZ
	ip5PwgwSHI6d5PgwR7v/Vw==
X-Google-Smtp-Source: AMsMyM5DZEcLmoIsH9mR3NcXBcaWogJ6YxxwoyjU1pdlK/LhDADAEonvdWGthzXuvxjU3uP3KayFtQ==
X-Received: by 2002:a05:6808:2107:b0:354:6fd3:af02 with SMTP id r7-20020a056808210700b003546fd3af02mr3738887oiw.176.1665961103599;
        Sun, 16 Oct 2022 15:58:23 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bh19-20020a056808181300b0035468f2d410sm3662748oib.55.2022.10.16.15.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 15:58:23 -0700 (PDT)
Received: (nullmailer pid 3904630 invoked by uid 1000);
	Sun, 16 Oct 2022 22:58:18 -0000
From: Rob Herring <robh@kernel.org>
To: Caleb Connolly <caleb@connolly.tech>
Cc: linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, krzysztof.kozlowski@linaro.org, devicetree@vger.kernel.org, Tom Rix <trix@redhat.com>, linux-input@vger.kernel.org, Andy Gross <agross@kernel.org>, Jeff LaBundy <jeff@labundy.com>, ~postmarketos/upstreaming@lists.sr.ht, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, llvm@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20221015172915.1436236-2-caleb@connolly.tech>
References: <20221015172915.1436236-1-caleb@connolly.tech> <20221015172915.1436236-2-caleb@connolly.tech>
Message-Id: <166596080545.3896335.8438401170127513761.robh@kernel.org>
Subject: Re: [PATCH v7 1/2] dt-bindings: input: document Qualcomm PMI8998 haptics driver
Date: Sun, 16 Oct 2022 17:58:18 -0500
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

On Sat, 15 Oct 2022 17:30:35 +0000, Caleb Connolly wrote:
> Add bindings for qcom PMIC PMI8998 haptics driver.
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  .../bindings/input/qcom,pmi8998-haptics.yaml  | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/qcom,pmi8998-haptics.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/qcom,pmi8998-haptics.example.dtb: haptics@c000: 'qcom,wave-play-rate-us' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/qcom,pmi8998-haptics.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

