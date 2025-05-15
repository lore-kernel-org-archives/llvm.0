Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB26B72622
	for <llvm@lists.linux.dev>; Thu, 15 May 2025 13:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747315744; cv=none; b=clI1Jy+KCL5zDvlfZSvFGRnAAIGW6kYO2TkoXZhboseWv/0XO9hx2dMU7z5/cphrSlaPUHKm2lEfGsT+zm6EC4vhagdGwhOHAZTd2taTqCZhZIXi6AqDz68dbC+4TQT1nbDTlUHiEaoKTMJl2E06dggIPeuGG7C0PffNnXGW+Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747315744; c=relaxed/simple;
	bh=0OxqwkoXyk4pMEZB+3Be/QzVD7EbaVm3mM/XisR5KNc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cUs+b9bWeh9e/MLVDWkqNWaOY4zDrNYGcEKQCiM2eY8TZp1OobY0jtSuj9GCpymElQrSDcaYCO7fwBllbWvlgaLODLnlSqzC5zAMslqu3H6uJglcXebQO1oI/U9xB0vH7b98wjcDo43ZVUhSe+02CqroGkewzgc/UEcl3rUKOWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q2aZPB1V; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q2aZPB1V"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso6877265e9.2
        for <llvm@lists.linux.dev>; Thu, 15 May 2025 06:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747315741; x=1747920541; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gXeqa887aZIuoR48uoN7BEsLTRu+NlEEvV/bSAfKqmQ=;
        b=Q2aZPB1VWUWWltfOzFFYZl8FhLbzkySX7i0HX78Un4ntcSkTezVkt6wm1qwKC3WOE8
         5cION4EaYcWOf2mbFff3pCopPAswdcREJ+Bj/UDAzaNQWGE24iKnIxYpMkIUIX4deORg
         QViwHYqal+Iigynt1k+nKqPKwXRaBnECHRXnkWVF7cjhRmDCEufVQodbLMz+Wr1VzWs3
         9bqxi/z7uaVH0TmxWMjeI4UsXDV3Lz0wBBikDYvY2j+iM3vFvvRsXmm4iQDucRG71BqK
         8K1HHai2mB0vD2rvvipX0BTU4RRWkiZi2JX/L+KwZo7mVf/6zXw6N7eAyoe41CePfmoY
         coxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747315741; x=1747920541;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gXeqa887aZIuoR48uoN7BEsLTRu+NlEEvV/bSAfKqmQ=;
        b=nBTSMd/jbJIR6+CUf4hJaGkNQIrXDTL8PdNJ2dQKaaFSQy/xkkk4DNPrh08O/Vbl/6
         H7jxBRcUglSH5r4t97cCHYDFUrpjXAHHeMmqLDxxEixAtbISuODgQmhPy5+w8NpwvxqY
         wQ4VEqCg+eaPK7DSMN8Z+B7LK5jSii4Q1earPwtU1a5CWSCE01JaZDum7nszrpf4vfxR
         kUZ2onK+F5oBBJCG+yL3U+gJUhbiv9Jv3aNxeletWCMGwcYWH40hVbhClUNqar/wW7kk
         Y1S/sAC9pfrIXKREXbb4lORj1AfTGZp8WJ4Sbsbmy9WBHkt6e9/WfOvrY7z5IGiXOYl7
         NRfw==
X-Forwarded-Encrypted: i=1; AJvYcCXHYrp/0PezUa2SP87JlA4No9KVYSOFdKD4QZ73em/dNrfd0Pp9Hs3Lubiko7Zy9VKjQPvk@lists.linux.dev
X-Gm-Message-State: AOJu0YxzhBKVvAxDkRfzy3PdwtJESzjakP2l98UGdqXIzF6ZuW9KAMf1
	fzrN4PzQHsPXPfICyCBQLOZ+lRPIPQ22wZ+ZfIwMMSdA0DGsHn6zgcX8cnY6aDI=
X-Gm-Gg: ASbGncuUlosgnHa2a3Ec/XvP98bEZC2ApytEaw9dVQATT3KcSE4xoaP3D66mXcFn32J
	rKuEqVKnuQIqvjDDQ+uHnQLbBVTGWT/pU+K3RVDQAua6nnCqgjBOgSA82joVvcN5RDTFcgblWSG
	VHC8ZzmPteydCt2fngQ8WcoJNzbAndGEqOPqHHUPAkryk9JGLI7z4W/bsfGKKk1PkbkMZYE8CuM
	3IK06u7XI5v9M8GUdPgd9msoWAZlGaJkXcTCBmLxYXt6tdTxjQaaUq9szIogYTYXgcDCd+U3S4i
	iAkYg+1daoxDkXdsirtazdUJnOLSGcC4Y3iJrko5hBJtDcqE1mhKAHlE8QlQJ589fbNlfas0tD0
	nLVmObOQAR5ZE6jc0TmUcLZw=
X-Google-Smtp-Source: AGHT+IEjQRVUhGojBwI+97YBtdmsQnt5mRPLvJ6XJl4UcLoxhfGfGLJJ2ddgeOKQqlG0CKXA5mxG9g==
X-Received: by 2002:a05:600c:348a:b0:43c:fa0e:4713 with SMTP id 5b1f17b1804b1-442f20bb25dmr78852185e9.2.1747315741090;
        Thu, 15 May 2025 06:29:01 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f3368d1csm73524575e9.8.2025.05.15.06.28.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 06:28:59 -0700 (PDT)
Message-ID: <92c2949e-2fc1-40e9-9dea-e3d9f7aa571d@linaro.org>
Date: Thu, 15 May 2025 15:28:55 +0200
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
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <CANAwSgSA-JHMRD7-19wijOY=TSWD-sv6yyrT=mH+wkUJuvxFAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/15/25 13:10, Anand Moon wrote:
> Hi Daniel,
> 
> On Wed, 14 May 2025 at 16:53, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>>
>> On Wed, Apr 30, 2025 at 06:02:56PM +0530, Anand Moon wrote:
>>> Hi All,
>>
>> Hi Anand,
>>
>> if the goal of the changes is to do cleanups, I recommend to rework
>> how the code is organized. Instead of having the data->soc check all
>> around the functions, write per platform functions and store them in
>> struct of_device_id data field instead of the soc version.
>>
>> Basically get rid of exynos_map_dt_data by settings the different ops
>> in a per platform structure.
>>
>> Then the initialization routine would be simpler to clean.
>>
> 
> Thanks, I had previously attempted this approach.
> The goal is to split the exynos_tmu_data structure to accommodate
> SoC-specific callbacks for initialization and configuration.
> 
> In my earlier attempt, I tried to refactor the code to achieve this.
> However, the main challenge I encountered was that the
> exynos_sensor_ops weren’t being correctly mapped for each SoC.
> 
> Some SoC have multiple sensor
> exynos4x12
>                      tmu: tmu@100c0000
> exynos5420
>                  tmu_cpu0: tmu@10060000
>                  tmu_cpu1: tmu@10064000
>                  tmu_cpu2: tmu@10068000
>                  tmu_cpu3: tmu@1006c000
>                  tmu_gpu: tmu@100a0000
>   exynos5433
>                  tmu_atlas0: tmu@10060000
>                  tmu_atlas1: tmu@10068000
>                  tmu_g3d: tmu@10070000
> exynos7
>                  tmu@10060000
> 
> It could be a design issue of the structure.or some DTS issue.
> So what I found in debugging it is not working correctly.
> 
> static const struct thermal_zone_device_ops exynos_sensor_ops = {
>          .get_temp = exynos_get_temp,
>          .set_emul_temp = exynos_tmu_set_emulation,
>          .set_trips = exynos_set_trips,
> };
> 
> The sensor callback will not return a valid pointer and soc id for the get_temp.
> 
> Here is my earlier version of local changes.
> [1] https://pastebin.com/bbEP04Zh exynos_tmu.c
> [2] https://pastebin.com/PzNz5yve Odroid U3 dmesg.log
> [3] https://pastebin.com/4Yjt2d2u    Odroid Xu4 dmesg.log
> 
> I want to re-model the structure to improve the code.
> Once Its working condition I will send this for review.
> 
> If you have some suggestions please let me know.

I suggest to do the conversion step by step beginning by 
exynos4210_tmu_clear_irqs, then by exynos_map_dt_data as the first 
cleanup iteration


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
