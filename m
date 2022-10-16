Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE7F1C01
	for <llvm@lists.linux.dev>; Sun, 16 Oct 2022 14:53:35 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id s3so6415975qtn.12
        for <llvm@lists.linux.dev>; Sun, 16 Oct 2022 07:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M617hUvDTpcFldbMirW8IIk1uyeowTMveYy1yVY2fm0=;
        b=oYhVG46jOla5tkhSF0Jlqh1Ynjmnbw+LFwUsB7noqbu1FtN/o3MmL7qYcuQH0uSLrc
         GvnSlCwIAg0klW50RN7piUw2pKm1pRUAjggKPHWSrZ3wr+fQXRHIkzOmywtrkQc3Qi3v
         10n5fzQ+MNMTwNwyimpRkOKhav1ndvI8sGJhxQc5uGCO7WrAF7LLTlSrIgaA+00GQ/yt
         NehaavngrV8ziMgWWXnnSJrB6pEA9mzD5Y4HX6y5AdMQHS8jnpfijk4mp0vD7OLLXVvn
         2IOiQ0rQowYB4v7k4K1cLwpWz+pOM83ZUOvAn0wkjA51hddD7S5pnnEh5DU26EtCPZZk
         WPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M617hUvDTpcFldbMirW8IIk1uyeowTMveYy1yVY2fm0=;
        b=jOlvaM1yB02YYRfHRuB6+NmwvZfAgGaCC+TB3fyYacCc0hLrHboBmysgUZusjREehZ
         zfAjBV8la/5ywLLwEJXcPgTfwolFJXE24Ft4wsJWjIw7i4aRRr/lk7B1xoH1L6zalyM+
         5vOhrWZ3e4C+Olo2yvGmkJCvMdY8MPP7r2VI/fjOS/aSsXyvzQjWRErKwwU96MduV1JH
         oddgaYtLZa7h8WAkwlH8yhUENW4ICgpjREKpUxKxbVHkrpFGKTPmmYK/6AVnmatwxBZ3
         S99MwPyxJ3H+OiZLUAXoz4HlljKZLDVoC4+QY2UrtX1WqyiSJWVK9Ef+foFzZip2Rlyl
         WNDQ==
X-Gm-Message-State: ACrzQf0McGj+1SR5yWR3AIN02In3yTVJn64Ezjsot5B+kMoqFQK9jKQq
	9BDY522+K9orQKpXaaNfPwDEOA==
X-Google-Smtp-Source: AMsMyM7EoF905CSD7P1QLRs54RDbWyurGOEQ+o4lDGC81gASGR8Yp7CprIB3QIAQlpjWkVq0WSEwrQ==
X-Received: by 2002:a05:622a:651:b0:398:5034:9e85 with SMTP id a17-20020a05622a065100b0039850349e85mr5406552qtb.277.1665932014173;
        Sun, 16 Oct 2022 07:53:34 -0700 (PDT)
Received: from ?IPV6:2601:42:0:3450:9b13:d679:7b5b:6921? ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id de4-20020a05620a370400b006e07228ed53sm6890016qkb.18.2022.10.16.07.53.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Oct 2022 07:53:32 -0700 (PDT)
Message-ID: <bc1aa679-7173-c9a3-c35c-1da8b6c6f1f2@linaro.org>
Date: Sun, 16 Oct 2022 10:53:28 -0400
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v7 1/2] dt-bindings: input: document Qualcomm PMI8998
 haptics driver
To: Caleb Connolly <caleb@connolly.tech>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 devicetree@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Jeff LaBundy <jeff@labundy.com>, Konrad Dybcio
 <konrad.dybcio@somainline.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Rob Herring
 <robh+dt@kernel.org>, Tom Rix <trix@redhat.com>
References: <20221015172915.1436236-1-caleb@connolly.tech>
 <20221015172915.1436236-2-caleb@connolly.tech>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221015172915.1436236-2-caleb@connolly.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/10/2022 13:30, Caleb Connolly wrote:
> Add bindings for qcom PMIC PMI8998 haptics driver.
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

