Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE088F72
	for <llvm@lists.linux.dev>; Wed,  9 Nov 2022 11:18:37 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id a14so25261378wru.5
        for <llvm@lists.linux.dev>; Wed, 09 Nov 2022 03:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AvtdKEg5HPVz3X+JgHtwGowTHYk1pgsNrv53DSwRrFA=;
        b=dr/5x8PeQugDwz9zS/lRvw1wyHROVXsoNERq/mQA55Cw10aTLyWLE2xDhkrbNtQfQb
         9U9ZeAtu6osFQScxobESpVYxg9LEmAVE8HEeNV5p0q8b4wIrmlq4NAjb049xmjXOe1z7
         f6tt9aEucdDBFAC9y9DQzKLxobC2tK3YuO/tXHFlQuO4OttdIbIrcQ7PLQHLWcoTSIX5
         4LRqPSf5D/ez+6dfzAV/pliSjSzX1x6uV8vwhTnTSb3I9zeOhmnYC+BCqQ/uWSAlyx75
         ZbaBIF5K4KGAXl2kKxGIGpEx0+rNm7F0+l2rI2FHW6EQ8Uve+1vm+vmcKfayY/uFAjzA
         mtyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AvtdKEg5HPVz3X+JgHtwGowTHYk1pgsNrv53DSwRrFA=;
        b=nz5WSo4yE9Flkda6JncVpE231e24pAewapUTF6oakvs5B4/4I1Isg0ga4rnhye5Ano
         kvpOx0S2ju5Rtg9DAmRhsXTo/i12YhdaSMrKU8BezZLS6HehXbc09zUiQcvloEyxmxZN
         QhEKMjOoNwJcbZ8pWrAMDfcjjbcRQS/wr0I2QJFiillJxwxwAtPmQ2LGnts5j2Xc/SQ9
         JObhkx2zGrv12UiXIbycDLstxn5kqI0CTkl1cxRP/8Q/KF2q5Yvg1OZXWGyYVU/eGpls
         gjna6+7ZftpMm8P9N8zZqjJ2uTpvyI6vdmb4Aghx52tO2sBDXGD78CPiyCOFyF6Aw5H7
         8RoQ==
X-Gm-Message-State: ACrzQf39h6MEkLqdDiwwOVkGv04VeNmgKcp+9m5/lSnlXiY7QwkZUE4p
	3Bkp0++7GwBqcHbJfbdnSjM=
X-Google-Smtp-Source: AMsMyM6WJqLIdMRVHiViy2TilAyD/0aBmIfS1ZkVy/xQ6rNS2kHQtvnt87DvaPbI24ekuh55jHC+Hw==
X-Received: by 2002:adf:eec6:0:b0:236:aabb:8c90 with SMTP id a6-20020adfeec6000000b00236aabb8c90mr31041409wrp.199.1667992715589;
        Wed, 09 Nov 2022 03:18:35 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id h4-20020a05600c350400b003c6f426467fsm1333419wmq.40.2022.11.09.03.18.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 03:18:34 -0800 (PST)
Message-ID: <7eac9be2-a880-8971-117d-ec533eebaf4a@gmail.com>
Date: Wed, 9 Nov 2022 12:18:33 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v28 04/11] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys1
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux@roeck-us.net, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, singo.chang@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221107072243.15748-1-nancy.lin@mediatek.com>
 <20221107072243.15748-5-nancy.lin@mediatek.com>
 <90d8dfb1-2a37-e79a-b912-c77076e493c6@gmail.com>
 <20221108191008.lsasjskm7tzvpa42@notapiano>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221108191008.lsasjskm7tzvpa42@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 08/11/2022 20:10, Nícolas F. R. A. Prado wrote:
> On Tue, Nov 08, 2022 at 06:46:54PM +0100, Matthias Brugger wrote:
>> On 07/11/2022 08:22, Nancy.Lin wrote:
> [..]
>>> --- a/drivers/soc/mediatek/mtk-mmsys.c
>>> +++ b/drivers/soc/mediatek/mtk-mmsys.c
>>> @@ -80,6 +80,12 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
>>>    	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
>>>    };
>>> +static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
>>> +	.clk_driver = "clk-mt8195-vdo1",
>>> +	.routes = mmsys_mt8195_vdo1_routing_table,
>>> +	.num_routes = ARRAY_SIZE(mmsys_mt8195_vdo1_routing_table),
>>> +};
>>> +
>>>    static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
>>>    	.clk_driver = "clk-mt8365-mm",
>>>    	.routes = mt8365_mmsys_routing_table,
>>> @@ -292,6 +298,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
>>>    		.compatible = "mediatek,mt8195-vdosys0",
>>>    		.data = &mt8195_vdosys0_driver_data,
>>
>> It seems we are missing a patch in the series. vdosys0 also correct was
>> never introduced in the driver...
> 
> Hi Matthias,
> 
> as mentioned in the cover letter, this series is based on the series "Change
> mmsys compatible for mt8195 mediatek-drm" [1], which introduces vdosys0. This
> compatible entry specifically is added on patch 3 of that series [2].
> 
> [1] https://lore.kernel.org/all/20220927152704.12018-1-jason-jh.lin@mediatek.com/

My bad. Thanks for the link. I realized that yesterday but had to leave 
urgently. I'll have a look on this series now.

Regards,
Matthias

> [2] https://lore.kernel.org/all/20220927152704.12018-4-jason-jh.lin@mediatek.com/
> 
> Thanks,
> Nícolas
> 
>>
>>>    	},
>>> +	{
>>> +		.compatible = "mediatek,mt8195-vdosys1",
>>> +		.data = &mt8195_vdosys1_driver_data,
>>> +	},
>>>    	{
>>>    		.compatible = "mediatek,mt8365-mmsys",
>>>    		.data = &mt8365_mmsys_driver_data,
