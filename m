Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D40154A5
	for <llvm@lists.linux.dev>; Mon,  8 May 2023 08:24:24 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3f427118644so3994385e9.0
        for <llvm@lists.linux.dev>; Mon, 08 May 2023 01:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683534263; x=1686126263;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m5LglcJTmAOL674iFSW91v8iQ+c+VWN66eezYdcY/eo=;
        b=FkoBtct+K+FHjRPlHL9ykOQXt4jjYt99V2O+8Vje8XlvSQzc6v+6j4rXJJruHwHd5I
         wj2Hp+C2JBQLstF/iJcFcUWQRCc1HgKdzlVL4cXoWSeXlt0Z5chr0kXEnr/CttPDrlbY
         x2QIlOimiAyMBchumS0veYf//2RtScWx9T2KoBIqrvzBuKroy1jh6B5sGhEZg3rpDDwW
         4JtorSK0X+Dzb8JNk9ZJ4KEx3ovHxrpZF3/S01fHY/WUoBD8Iy3Xff68c6hi21Ii+H/1
         51Bt4xy/tufm5jMIKbRql0n/WodjbVuz0M9OOYXrUP1Y5dTSFRLbwg5KNCSV0fIg2hbg
         ERbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683534263; x=1686126263;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m5LglcJTmAOL674iFSW91v8iQ+c+VWN66eezYdcY/eo=;
        b=bXG/Syqs0wn56LmKvLB6yvwG8RKmuG6oZYEO6b0oYhEbLAH/bh1sz04gDi7hWyTX0X
         MA9YRTNTQ5zDY/k5FoDfInwfBKFoKlN0XPEbdZUzYRumFhV3V7z1uKBN3t40ndUk8C1g
         eBnIkksvQWJRJfB9Xe/KudKrtdVQA3tv1RHe5dSOtie9Grea6iUcVYBMA43usdcJUr/C
         pK2l3boJFTAg//QfG/fXa6PfVCmsQN+3HK5Sqa4quku5D0nq9rFhvZ0bhn7RPGl99DJh
         mHxnome6gxGPY9Q/787ZX8MSHVt68hg4KZn85bT5z75twvJrFIHCFJafyqliyd0AG+ca
         RzHg==
X-Gm-Message-State: AC+VfDzsv84PumbXah/CimarViIL05ZiA0zMs3sbr4ifpPDS5HRu11O5
	XeIHTk8PO4HIx1Cs2jZSU9g=
X-Google-Smtp-Source: ACHHUZ7qgZXuInT52CBe2fdIODHvN3TsFZFGNC53yWfuzxRIbJsq0WD/6yJNKLgPzMeJ/5eb9LSI8A==
X-Received: by 2002:a05:600c:2191:b0:3f4:1a97:ab1d with SMTP id e17-20020a05600c219100b003f41a97ab1dmr4138816wme.1.1683534262558;
        Mon, 08 May 2023 01:24:22 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id s13-20020a05600c45cd00b003f1738d0d13sm19383989wmo.1.2023.05.08.01.24.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 01:24:21 -0700 (PDT)
Message-ID: <f5cf30b2-c29c-03ac-e7fc-4c7da2cd0c5b@gmail.com>
Date: Mon, 8 May 2023 10:24:19 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] phy: mediatek: fix returning garbage
Content-Language: en-US, ca-ES, es-ES
To: Vinod Koul <vkoul@kernel.org>
Cc: Tom Rix <trix@redhat.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, chunfeng.yun@mediatek.com, kishon@kernel.org,
 angelogioacchino.delregno@collabora.com, nathan@kernel.org,
 ndesaulniers@google.com, granquet@baylibre.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20230414122253.3171524-1-trix@redhat.com>
 <ZFTMPWp8LhwA9uHz@matsya> <db9c3190-28d8-199f-f4f0-a12524d0451e@gmail.com>
 <ZFipVfhLVyye/eud@matsya>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <ZFipVfhLVyye/eud@matsya>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08/05/2023 09:48, Vinod Koul wrote:
> On 05-05-23, 17:37, Matthias Brugger wrote:
>>
>>
>> On 05/05/2023 11:28, Vinod Koul wrote:
>>> On 14-04-23, 08:22, Tom Rix wrote:
>>>> clang reports
>>>> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable
>>>>     'ret' is uninitialized when used here [-Werror,-Wuninitialized]
>>>>           if (ret)
>>>>               ^~~
>>>> ret should have been set by the preceding call to mtk_hdmi_pll_set_hw.
>>>
>>> I have applied "phy: mediatek: hdmi: mt8195: fix uninitialized variable
>>> usage in pll_calc"
>>
>> Thanks Vinod, that was on my list for today as well. I was a bit puzzled
>> because you took the patch that added it, but I wasn't sure if you would
>> take the fix. How do you want to handle things like this in the future?
> 
> Fixes should be sent as Fixes patch
> 

I'm not sure what do you mean. Patch subject includes the word fix and the patch 
has a fixes tag. What was missing here?

Does this mean you will take fixes for this driver in the future or do you want 
me to take care of them?

Regards,
Matthias
