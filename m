Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40E723C0
	for <llvm@lists.linux.dev>; Mon, 13 Mar 2023 10:01:23 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id z5so11975670ljc.8
        for <llvm@lists.linux.dev>; Mon, 13 Mar 2023 03:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678701682;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b8EVi5ERJnamFr2Gsb+8yMGGkxRY6AZZMTHAy+zY/ds=;
        b=ZbczpPemcGtSDV7FvBq8HO4AIt6ZjSRx1dmY0hiI6opN2P7VUpcb4TN8MuyV2B1ncd
         K3tUxAHx6HrivDBc/ppDebQhOgF82D+ZyMnHn5Uw+SeWkOepa8RYoeFek+/BvBjBLDxa
         7hdOAQygmZICWG1SQ1i1+2DnVA/XLiVGo4yXsArwtRs6MNLvd0YkfqAiESypEPg7P1OU
         1AUVUwtAGqLOPaWu/faxlrSVqeFAGE+n9J+XmaJPBHGBW/v11YyHUffWeuk55EG9jg1W
         aKGxTeum6FHYvRhnKI6JWQt6RxG0jhASCAi8Ey1S6IbIQU6DHTyuz5m/IGrmxI862GDa
         ZdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678701682;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b8EVi5ERJnamFr2Gsb+8yMGGkxRY6AZZMTHAy+zY/ds=;
        b=4A1+o7yR25gMaoSf8iPVerQFOy/N/RjzXzRWB1VN2SwEFqFKwifIS5vrTLrgah11tv
         05s98sYqvj23xITO8IefxkMZanFHrBik1SiqdAyVpHuF8iCvLW/cfqaoRZF4wYqfEreS
         6JwgyAIsCKXPD52d7587cXfkGDaSZcvrUYNnvJELynBFjYmkIr27axQE5W/Jr0jS/nPB
         PTlw3d4MD9Ro3rJlPrOj9+5457pgXaZGQMid8S9QAuHLKiEG1X7RWCM2n27Eesx9YInJ
         I/Ms5OmWVzi/ovE3+qx2E8qQKYLkqKjh9ku/ycTCvTI3+MD4JqdkKmntDp8EH4NTVJbN
         cKQQ==
X-Gm-Message-State: AO0yUKVgVCTKLi02HGfYnvuiRTTj9GK5IDbRGXVvpokc18xqf+OxsEea
	OvO64UkVdStTx/2eNiLywY+dWg==
X-Google-Smtp-Source: AK7set9s0h6K73aYDAdMN5kpvI7uPOC8vE1OpRRr1Gnk+9BbSRSZRLnZIQBQj3kdkLkvJdJmi1ULYg==
X-Received: by 2002:a05:651c:304:b0:295:c3cf:e81e with SMTP id a4-20020a05651c030400b00295c3cfe81emr9979963ljp.19.1678701681807;
        Mon, 13 Mar 2023 03:01:21 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id t22-20020a2e9556000000b0029868d1820dsm923524ljh.60.2023.03.13.03.01.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 03:01:21 -0700 (PDT)
Message-ID: <13ad09ae-1995-271a-1079-f9e4f6e06eb4@linaro.org>
Date: Mon, 13 Mar 2023 11:01:19 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/5] soc: qcom: Add LLCC support for multi channel DDR
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Komal Bajaj <quic_kbajaj@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Abel Vesa <abel.vesa@linaro.org>, Rishabh Bhatnagar
 <rishabhb@codeaurora.org>, Prakash Ranjan
 <saiprakash.ranjan@codeaurora.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Gross <agross@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20230313071325.21605-5-quic_kbajaj@quicinc.com>
 <202303131722.uo5Li701-lkp@intel.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <202303131722.uo5Li701-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


[...]
>    include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
>                                                          ~~~~~~~~~~ ^
>    include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
>                                                          ~~~~~~~~~~ ^
>>> drivers/soc/qcom/llcc-qcom.c:20:10: fatal error: 'linux/qcom_scm.h' file not found
>    #include <linux/qcom_scm.h>
This moved over a month ago. Please send patches against fresh -next
and not some ancient tree.

Konrad
>             ^~~~~~~~~~~~~~~~~~
>    6 warnings and 1 error generated.
> 
> 
> vim +20 drivers/soc/qcom/llcc-qcom.c
> 
>   > 20	#include <linux/qcom_scm.h>
>     21	#include <linux/soc/qcom/llcc-qcom.h>
>     22	
> 
