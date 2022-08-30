Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0652E6100
	for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 20:43:42 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id m7so8237563lfq.8
        for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 13:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=zpTPbh+6FTpWjU33//CbUrbH55r5RpLUSqoVVWTiTkg=;
        b=pQd2svsP6AiR6HSTgGGNL7C2Z41Cr+giRe+jvUNzgWqXWB5gyTRpD6hQ7QjxyBDLmk
         kEZm17wyCgjgSJ0qaTchdgwTlPDbgUUbirEHP7JMYPqEIHKII68IzTj73W/6GOsVlasC
         1kOU/omAvQMJtW0F/QBVyDRwyf1fsyVXl+Wc0wuuAzFb/XnvdmTsHkZIaAVDJVMTTNtt
         4FrxcOZbOtlYVKL96zhHt1Uow8Z175SmbPyGDcbVW6ZOM1yGpDi23R9WaRO/iSwmgT+b
         2zw4zmuFI1782Vt03Hy5crt3m1VTjSG6rUZ4FhJzjjLVKiMILaIR3Q/wrEq6+moXIHDh
         XWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=zpTPbh+6FTpWjU33//CbUrbH55r5RpLUSqoVVWTiTkg=;
        b=ZXq08QapW9CdkvVNzXF9/isuAzXSnI3rpjO3nqjkjLH55IRDBE/n4q8A3crI8jfo1P
         bjRN52zniN/kHH/Qv1gQAxFDKe/xeltnjVXsjAMYjqm8Mx5mTr1LgR/op1nfuWFFJgB5
         9PAVY+Vxo9zvR22QkJCISsv+5PPsEHu+yiVeeIpe/giz4yc+khXfX27x7G6Vh6a1z9NN
         BPZ6w1wsJmbRh/D1c33NTghvlL+vNV9+eEDgzUd+5IviwTRMh47yTl3kPuvZ3SgZLK29
         HIh2xIVWn3FTY1StfOIYjQfWzWHXTIx33BKkmSaPRZkzonKyMWtNR4PrUIqjaVGhS/LV
         1/FQ==
X-Gm-Message-State: ACgBeo0TunLvU7cXu1GZRXbFTFKHke+8tU22e8EaJYGnoO1HZcUSE16/
	0ERy2V5PnGcleKoK1FopTb4wZA==
X-Google-Smtp-Source: AA6agR5TQdXplaX1+ZJ7P+5UuosDsU+hXEk3qfcGOu4a7qmInmeR6MkJlKrM6t5jZHhl01ECVVOaig==
X-Received: by 2002:ac2:5fb2:0:b0:492:ea4f:b73c with SMTP id s18-20020ac25fb2000000b00492ea4fb73cmr9008383lfe.296.1661892221227;
        Tue, 30 Aug 2022 13:43:41 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f13-20020ac251ad000000b0048d1101d0d6sm1720449lfk.121.2022.08.30.13.43.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 13:43:40 -0700 (PDT)
Message-ID: <c2559d11-3169-454f-8376-e4500c4e7de9@linaro.org>
Date: Tue, 30 Aug 2022 23:43:40 +0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: build failure of next-20220830 due to 5f8cdece42ff ("drm/msm/dsi:
 switch to DRM_PANEL_BRIDGE")
Content-Language: en-GB
To: Nathan Chancellor <nathan@kernel.org>,
 "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, clang-built-linux <llvm@lists.linux.dev>
References: <Yw3V8yJgAnPD8o6P@debian> <Yw4FQm6V7d3MuMKG@dev-arch.thelio-3990X>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <Yw4FQm6V7d3MuMKG@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30/08/2022 15:40, Nathan Chancellor wrote:
> Hi Sudip,
> 
> On Tue, Aug 30, 2022 at 10:18:43AM +0100, Sudip Mukherjee (Codethink) wrote:
>> Hi All,
>>
>> The builds of arm64 allmodconfig with clang have failed to build
>> next-20220830 with the error:
>>
>> drivers/gpu/drm/msm/dsi/dsi_host.c:1903:14: error: variable 'device_node' is uninitialized when used here [-Werror,-Wuninitialized]
>>          of_node_put(device_node);
>>                      ^~~~~~~~~~~
>> drivers/gpu/drm/msm/dsi/dsi_host.c:1870:44: note: initialize the variable 'device_node' to silence this warning
>>          struct device_node *endpoint, *device_node;
>>                                                    ^
>>                                                     = NULL
>>
>> git bisect pointed to 5f8cdece42ff ("drm/msm/dsi: switch to DRM_PANEL_BRIDGE")
>>
>> I will be happy to test any patch or provide any extra log if needed.
> 
> Thanks for the report. I noticed this yesterday and sent a patch:
> 
> https://lore.kernel.org/20220829165450.217628-1-nathan@kernel.org/
> https://github.com/ClangBuiltLinux/linux/issues/1700

Updated and pushed the branch to unbreak the linux-next. Thank you!

> 
> Cheers,
> Nathan

-- 
With best wishes
Dmitry

