Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7950A18C03F
	for <llvm@lists.linux.dev>; Fri, 16 May 2025 14:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747406726; cv=none; b=kV7nMAmJfZeT144cxG+tijdYcvPWGZhjWafS3KhEDET1jlv4BToek8Kd6VpPAo7b0ZxdWz6lwVpzEY4/6+i16Apy0TZIapwR6EjSlx88YbUe5pV0ij53ywSg7xlJl7z1YtScAci8oLbbwVHWH2pITLaT3PuVCBv/u/PDMfbfU0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747406726; c=relaxed/simple;
	bh=N7Liw7c36pTdZuHiUAWTD2kfaxk2DuwfaFnr0fCGPWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=smLkef8amhrHyOsh39dZCqe1raRmG4XFMeVgTOeJ8xVaIIVim2W//2AToxkPAmO23tPCdPax332Eoon/z/AOMB2wKjc2BL1E7CNy/ghOpGqFydbKOS/QZqDmFU4GmBpGf3nPUsIQy6D5TWDhc5jd7ykAWoW1iAfv9zd2JaYbwlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SLdcAVY0; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SLdcAVY0"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-441d1ed82faso16508235e9.0
        for <llvm@lists.linux.dev>; Fri, 16 May 2025 07:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747406723; x=1748011523; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8DPdNi4T7V/yvBz4It+xorfOv4L6Xc1BemGmrvImCwg=;
        b=SLdcAVY0D0Ez6U1jEMnuho9sRi0yQMbJtQGR/8wVFz2+eYe+ob07mlkc7n62HmXcTt
         Poq8nDy38KR+E4uES8vTvd/IlDzxcgMiLFdw68zjifyyuOj/1tdN85zJnWoEHoo0N5Fi
         30qj7qfJlWGUPa4C0V+Klh/QwKgf5bLo0C+Bh1+8EtEYuNhBG4YRYmIHej4fzCPB+dVq
         l9iNEz4PFhAcSqrYeXOCYQL1iuvfbsnPPr0UjEhHVzKSOIVYuC+z6FKkl7dMFZMpwG5F
         DTU/BMeXYfD9C1PbJsOFgnXhTcR2oMZwtgbkXdF3BrC08SRQb/x4ozcDJObsY7azDQRv
         /RNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747406723; x=1748011523;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8DPdNi4T7V/yvBz4It+xorfOv4L6Xc1BemGmrvImCwg=;
        b=KLfCwIdwAlM54L93kclnxwDhwVuDPxNuTNSfXI44EU4Ks8tj8wjfnQgWxnyYX1eFjk
         hRBvjjSXdXOsdEfmS08Jsyg5BaFxcRI0chIKFnj06dggt+yk9vZQ0L+fx9WHPrxxarFv
         VlNRFOwjkE+D05JCNoFd2QeIi/NY3MxaABa8qO8pg0V+3ziwc/lviB7Jrnuf7Y6aInl1
         d+IGryIfGOTA97jx6ovAtq6Egp7mvnagh2PquenxDmJM9tDxOOUx8mT6GHmTBubWC1nX
         Vpp4b7rn8vBX/dlqXRt1lduEvjhVk4QGqhwcdYJFRcZmCI/yiSTXiM64Hp/3IdABhNhP
         5PaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXvxFs1VONU07M0U/y+I9cnbfZ1zh3reSAGngDpQeg1LvAlsexTMAiTd1a9fhmdwGXGI4B@lists.linux.dev
X-Gm-Message-State: AOJu0YxfjeGjVGzdiNHqTBaJrFyERhJakc5dV20SisQ4xNejj+uS9K1m
	AzV0oGU3QyrDR4SaXUR8VE+onpt+ipJKjU9WCJ798rcBxeufejGt+vFdLwIcmIfa4Pc=
X-Gm-Gg: ASbGncsAEcT6nLkH2OXOqYjwPQM88tzic7qSA1VPKsKtbNL7aT+B/LNvAkoFImHtL1k
	IWD8eVMOgCURm4EcA/OM+slWDtceG3pQow8VFpoBm4kcGBCpbOt63sZVZkEhmne+immLR1LYJg+
	HtGdxeGxoyeEFjkS/YbZUa9wODyYsN596FosCmXJe+adRzzaVq7LLuE7eHztjbR1KAKOKxx3Pwn
	TNH6ZnMzXg5QmsWR7gs3/GIn7MyOKleiOk1DoHhNRdBUcu48+beGp50LGmXlxIWeOzMumAOQELe
	w5Rsd0HcAxgpIzZMDGSqqpADVQ3iLrqdTemIa0XoAZV/ukdzqwT1APGPPOVhnflyXei+XuGAtlB
	CFGjCdLoFVAHl
X-Google-Smtp-Source: AGHT+IE+e8uUfU2U7RrsspDQy+hqfnS3XZDgVHe+ewX3FxYMCsEn5Vbv/9CZ6GBFRep73wxKvvMGnw==
X-Received: by 2002:a05:600c:34d5:b0:43c:e7a7:1e76 with SMTP id 5b1f17b1804b1-442fefd5e7fmr30145935e9.1.1747406722689;
        Fri, 16 May 2025 07:45:22 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f39e84acsm112377585e9.25.2025.05.16.07.45.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 07:45:22 -0700 (PDT)
Message-ID: <3c44154c-7261-4b03-bd12-bddf4d493e74@linaro.org>
Date: Fri, 16 May 2025 16:45:17 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] Exynos Thermal code improvement
To: Anand Moon <linux.amoon@gmail.com>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-pm@vger.kernel.org>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b"
 <llvm@lists.linux.dev>
References: <20250430123306.15072-1-linux.amoon@gmail.com>
 <aCR9RzGMWEuI0pxS@mai.linaro.org>
 <CANAwSgSA-JHMRD7-19wijOY=TSWD-sv6yyrT=mH+wkUJuvxFAw@mail.gmail.com>
 <92c2949e-2fc1-40e9-9dea-e3d9f7aa571d@linaro.org>
 <CANAwSgQryVLdRVd9KRBnaUcjtX8xR9w9BBTCvoqKH6funkj=2A@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <CANAwSgQryVLdRVd9KRBnaUcjtX8xR9w9BBTCvoqKH6funkj=2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/15/25 20:01, Anand Moon wrote:
> Hi Daniel,
> 
> On Thu, 15 May 2025 at 18:59, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>>
>> On 5/15/25 13:10, Anand Moon wrote:
>>> Hi Daniel,
>>>
>>> On Wed, 14 May 2025 at 16:53, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>>>>
>>>> On Wed, Apr 30, 2025 at 06:02:56PM +0530, Anand Moon wrote:
>>>>> Hi All,
>>>>
>>>> Hi Anand,
>>>>
>>>> if the goal of the changes is to do cleanups, I recommend to rework
>>>> how the code is organized. Instead of having the data->soc check all
>>>> around the functions, write per platform functions and store them in
>>>> struct of_device_id data field instead of the soc version.
>>>>
>>>> Basically get rid of exynos_map_dt_data by settings the different ops
>>>> in a per platform structure.
>>>>
>>>> Then the initialization routine would be simpler to clean.
>>>>
>>>
>>> Thanks, I had previously attempted this approach.
>>> The goal is to split the exynos_tmu_data structure to accommodate
>>> SoC-specific callbacks for initialization and configuration.
>>>
>>> In my earlier attempt, I tried to refactor the code to achieve this.
>>> However, the main challenge I encountered was that the
>>> exynos_sensor_ops weren’t being correctly mapped for each SoC.
>>>
>>> Some SoC have multiple sensor
>>> exynos4x12
>>>                       tmu: tmu@100c0000
>>> exynos5420
>>>                   tmu_cpu0: tmu@10060000
>>>                   tmu_cpu1: tmu@10064000
>>>                   tmu_cpu2: tmu@10068000
>>>                   tmu_cpu3: tmu@1006c000
>>>                   tmu_gpu: tmu@100a0000
>>>    exynos5433
>>>                   tmu_atlas0: tmu@10060000
>>>                   tmu_atlas1: tmu@10068000
>>>                   tmu_g3d: tmu@10070000
>>> exynos7
>>>                   tmu@10060000
>>>
>>> It could be a design issue of the structure.or some DTS issue.
>>> So what I found in debugging it is not working correctly.
>>>
>>> static const struct thermal_zone_device_ops exynos_sensor_ops = {
>>>           .get_temp = exynos_get_temp,
>>>           .set_emul_temp = exynos_tmu_set_emulation,
>>>           .set_trips = exynos_set_trips,
>>> };
>>>
>>> The sensor callback will not return a valid pointer and soc id for the get_temp.
>>>
>>> Here is my earlier version of local changes.
>>> [1] https://pastebin.com/bbEP04Zh exynos_tmu.c
>>> [2] https://pastebin.com/PzNz5yve Odroid U3 dmesg.log
>>> [3] https://pastebin.com/4Yjt2d2u    Odroid Xu4 dmesg.log
>>>
>>> I want to re-model the structure to improve the code.
>>> Once Its working condition I will send this for review.
>>>
>>> If you have some suggestions please let me know.
>>
>> I suggest to do the conversion step by step beginning by
>> exynos4210_tmu_clear_irqs, then by exynos_map_dt_data as the first
>> cleanup iteration
>>
> Ok you want IRQ handle per SoC call back functions?
> so on all the changes depending on SoC id should be moved to
> respective callback functions to reduce the code.

I think you can keep the same irq handler function but move the 
tmu_intstat, tmu_intclear in the persoc structure and remove the 
exynos4210_tmu_clear_irqs function.

You should end up with something like:

static irqreturn_t exynos_tmu_threaded_irq(int irq, void *id)
{
	struct exynos_tmu_data *data = id;
	unsigned int val_irq;

	thermal_zone_device_update(data->tzd, THERMAL_EVENT_UNSPECIFIED);

	mutex_lock(&data->lock);
	clk_enable(data->clk);

	val_irq = readl(data->base + data->tmu_intstat);
         writel(val_irq, data->base + data->tmu_intclear);

	clk_disable(data->clk);
	mutex_unlock(&data->lock);

	return IRQ_HANDLED;
}

But if the irq handler has some soc specific code, then it should be a 
separate function

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
