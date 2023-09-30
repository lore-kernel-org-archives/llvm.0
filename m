Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13D0171AD
	for <llvm@lists.linux.dev>; Sat, 30 Sep 2023 15:32:48 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5310a63cf7bso19228346a12.1
        for <llvm@lists.linux.dev>; Sat, 30 Sep 2023 08:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696087967; x=1696692767; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n9FahR1RbCxBwCmJ/lLQ5Cd+JhzFuqwNXOVpJq4loJs=;
        b=fnbFxzzx4XQIW9ETajZIxU9FYPXBce3hhqeqaQMu+qan1SUqW9hGje13Iq8XIGCWTh
         ElrIcDJ07N/oPkY67HHL4yuotbIV/5Jjx3AGJoFnJFCZVmQx0B+U+zaZAFAv0wnSxQce
         pNinKtyZGY9FQNpzKRtQaODfyph1dc17ClGCnwXoRTSIUtiHrrjUywnX10XoYkNtGth+
         IfI+NIBiGQUz4gQKvZqrUZ6vRSCsWK9hT419ti5GtErcTJzSexK13aYDXtBgSXK8tN0+
         3EOTZLZpkaOQXpi4THE8o2q6hPGUFTiOlCJPX7sk6mXH4LWJmuoNAad/Amw7wBGFsaDN
         LDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696087967; x=1696692767;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n9FahR1RbCxBwCmJ/lLQ5Cd+JhzFuqwNXOVpJq4loJs=;
        b=InuTuGPQ+JJ8uYJ41oe3sYLmHnzatHJvIbUIVv/gsgVyLzCJfhE6nk2UnXSiyk7afu
         cdb4XWZA/M3lZdvxW7LoMRhu7U6vrVHFBhDHw6jrLfX0/c9Rehx+EwoDkeDsfWQnlv/o
         rz8XMBw8H/+G5laoSYN0pqsfHioLnOaM99QiZDU3B4U4AFyT2DUPA8q+4yaoJLfPQwai
         uQdgN369C1vU8QSq64G/B6mCRV9YKbengfEnQiqfEmM9chXd6nnUmh9j5nHVKpYfLJdJ
         cvhmYr8r0v+lzMJEWtrYK1fWUEpK19s9ue007XIPbqseAbOLElqcOWX5VLAhDS32ir2W
         h64Q==
X-Gm-Message-State: AOJu0Yx5c53eR/lzoHVk//23A2tp8MU+19FphLIXn1LJnYwjXhW/11QX
	gqz6mm/eKm+7Gz/EpwfgpMMojg==
X-Google-Smtp-Source: AGHT+IG+/qaOPhYPIFuSZ++srZoDqOns2tcl+RGjdB8eQw74xuHZ8AbRM4WrLpL4dnEyGkWG1/GreQ==
X-Received: by 2002:a05:6402:499:b0:523:47b0:9077 with SMTP id k25-20020a056402049900b0052347b09077mr6791383edv.38.1696087966609;
        Sat, 30 Sep 2023 08:32:46 -0700 (PDT)
Received: from [192.168.8.76] ([88.155.253.228])
        by smtp.gmail.com with ESMTPSA id l14-20020aa7cace000000b0053331f9094dsm12874069edt.52.2023.09.30.08.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Sep 2023 08:32:46 -0700 (PDT)
Message-ID: <175d9803-8ad7-4c70-ad8c-b2d661828b61@linaro.org>
Date: Sat, 30 Sep 2023 17:32:41 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V12 2/3] dt-bindings: pwm: add IPQ6018 binding
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
 <20230925065915.3467964-3-quic_devipriy@quicinc.com>
 <42338d41-1b90-4f77-958e-479d32e0ce1d@linaro.org>
 <59c9dbdb-8673-8dc7-ecca-32ff120ccf80@quicinc.com>
 <4636a990-1044-1f67-dae5-8583f96021be@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <4636a990-1044-1f67-dae5-8583f96021be@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/09/2023 10:56, Devi Priya wrote:

>>>> diff --git a/Documentation/devicetree/bindings/pwm/ipq-pwm.yaml 
>>>> b/Documentation/devicetree/bindings/pwm/ipq-pwm.yaml
>>>> new file mode 100644
>>>> index 000000000000..857086ad539e
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/pwm/ipq-pwm.yaml
>>>
>>> Filename matching compatible, so qcom,ipq6018-pwm.yaml
>> okay
> We would have other ipq compatibles (ipq9574 & ipq5332) being added to
> the binding in the upcoming series.
> So, shall we rename the binding to qcom,ipq-pwm.yaml

I prefer not.

Best regards,
Krzysztof

