Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8D529A8
	for <llvm@lists.linux.dev>; Fri, 14 Apr 2023 15:46:25 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id d8-20020a05600c3ac800b003ee6e324b19so10025138wms.1
        for <llvm@lists.linux.dev>; Fri, 14 Apr 2023 08:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681487183; x=1684079183;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4YvFDcXCxH0IHAlEOnTr7X8C2ZaoaLvqC8PQViNwb+0=;
        b=CGo8j1W2FmAqMnJH4qAKnNiqxbf8gAuLuQXj3WINrZZa2nZXrtKScsRfz+ZfBs9CJu
         MstNB5C5MjYfLqx24lPYBblayV3WVt+GN1vWPW01aBZVxvxBw5r4ib8Zz1hDE2aqM/Ru
         BoLvB6Nn6II6x/0EBKVFKSgjHR4yB9IODMTVz1Uw+YsgEDSzyLVvnJ4pH+dlKuFJ8p3J
         VHg5q6CWFrUmLJuFQUV4+K9vZefK0Qc0huP8lmoyJiSIN8YJ/Gq0l0b+4tjwm+gsPfc2
         eWJLWXDMnQ2cflu3GD3SF2QCB2aYePTtkw9lpn0G+jRsKYxRZDRjkH7YiBeMfXg04ooF
         f9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681487183; x=1684079183;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4YvFDcXCxH0IHAlEOnTr7X8C2ZaoaLvqC8PQViNwb+0=;
        b=O/B5sgVjwNIbsPFeEqkM+aLveY7t0ZwdU76DZeA6fZWODHV/6OtaeIYH85gGeHkmBH
         WgSi0W48BwOrUPfOWs30muArbDyQzAH+U8QfRo8bDFjDyeFqRt/Y2puqa6X8vyxAV5vf
         OGAC2u91QELyjg2/Kd6otOkvHCSmsopjjv9cFGeSB6f6BXWnLhZiD6h3UxDiOF0v24VM
         MsIqC36wYjxMAbn53pBSvkbMMQ8cKu3zI/U/rc1GTIYGOQz6dKgruj1cIYLZieMWkAPW
         QipvppqK/UjcWIno+mFG7BfdM3wiFVASDdsL9h2BPXrscqjta9rU7jgNHwb7GgPcCwsG
         yQnA==
X-Gm-Message-State: AAQBX9d2TlTqv4ksJRGtMWFng1BtUwL6IdUqThWhnPrYhHfeDFewLQUk
	A2NSmQMg1D3WmXNM6NdLCp8=
X-Google-Smtp-Source: AKy350ax94Q0q1onTnwQMV5EE3TpgRfQw3R3Ni+6sgIb+LfrPtBcUh9No7WTr/RfBPPvrV2RcFkbIA==
X-Received: by 2002:a05:600c:231a:b0:3ef:1745:518e with SMTP id 26-20020a05600c231a00b003ef1745518emr4976351wmo.26.1681487183309;
        Fri, 14 Apr 2023 08:46:23 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id n21-20020a7bc5d5000000b003e91b9a92c9sm4607383wmk.24.2023.04.14.08.46.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 08:46:22 -0700 (PDT)
Message-ID: <40cf026f-61db-2fe0-f941-bfe5c9aa20e7@gmail.com>
Date: Fri, 14 Apr 2023 17:46:19 +0200
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
From: Matthias Brugger <matthias.bgg@gmail.com>
To: Tom Rix <trix@redhat.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, angelogioacchino.delregno@collabora.com,
 nathan@kernel.org, ndesaulniers@google.com, granquet@baylibre.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20230414122253.3171524-1-trix@redhat.com>
 <3242b862-0e7c-b7e9-14cd-3fbcbb87ba04@gmail.com>
In-Reply-To: <3242b862-0e7c-b7e9-14cd-3fbcbb87ba04@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 14/04/2023 17:43, Matthias Brugger wrote:
> 
> 
> On 14/04/2023 14:22, Tom Rix wrote:
>> clang reports
>> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable
>>    'ret' is uninitialized when used here [-Werror,-Wuninitialized]
>>          if (ret)
>>              ^~~
>> ret should have been set by the preceding call to mtk_hdmi_pll_set_hw.
>>
>> Fixes: 45810d486bb4 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
>> Signed-off-by: Tom Rix <trix@redhat.com>
> 
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> 

Please also add
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

see CA+G9fYu4o0-ZKSthi7kdCjz_kFazZS-rn17Z2NPz3=1Oayr9cw@mail.gmail.com

Regards,
Matthias

>> ---
>>   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c 
>> b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
>> index abfc077fb0a8..c63294e451d6 100644
>> --- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
>> +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
>> @@ -292,9 +292,9 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy 
>> *hdmi_phy, struct clk_hw *hw,
>>       if (!(digital_div <= 32 && digital_div >= 1))
>>           return -EINVAL;
>> -    mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
>> -                PLL_FBKDIV_HS3, posdiv1, posdiv2, txprediv,
>> -                txposdiv, digital_div);
>> +    ret = mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
>> +                  PLL_FBKDIV_HS3, posdiv1, posdiv2, txprediv,
>> +                  txposdiv, digital_div);
>>       if (ret)
>>           return -EINVAL;
