Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FF9297B86
	for <llvm@lists.linux.dev>; Thu, 15 May 2025 11:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747307449; cv=none; b=fvN9WBKYEzJsr4roo7QEyeM+AjiAfsPqhOGwJYMU0M6dDibQUDg3o3QNe1XdbkCov71QqNq0aglWCrGjx00zEtvXTxInzHq/+cry9/HvoBhJMoXgvS7bdDx1HHCh7kNXTig8/nKENfVu1sqNb9cKR5EEasaWK5Amzf6/o2eHWBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747307449; c=relaxed/simple;
	bh=8MM7pRUzi/+tIllmEpUGU5whAaivVspfR2Lc0gn83vM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hipGmudiU4ASbTeZuOQkkuJRo8MdaSsrZHJX2XWwdxM0TgK/Rd+fwTEEokA7H+EnbK3fgqgghKBytHay7/k3HtSE2/Tl57zkymdKpwgLNjNOcIp3Ggwybc98dNHvsBciDK9VBQI0XiOPKsQpL7frXv/+hCBCtcChugEGlHAy0u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ViW8klSl; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ViW8klSl"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad21c5d9db2so134531366b.3
        for <llvm@lists.linux.dev>; Thu, 15 May 2025 04:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747307446; x=1747912246; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wH93pyrIEPQfVMzkjhmhq8lcyU/jh4Z97QhhnrcpdMM=;
        b=ViW8klSl8FUfz3y4nQdSM/mEXo6DS2iRg0V8xiMgRFfEIkSIe96FXarRbpdBCUkvAd
         vLsw2wnZDv2LJXCGQSHLg4JPzPlI2wFVmk77cdavLTI4AgBtUY6iEIyA1SEp8eaxwJYb
         O9Sdi90uJ5wv14ZfrMHncj8AjC4Ku6HDfUc6BX6NAbLeTUCEMrSMJZPxcWEv3Qv93wyn
         WMcACsxP2OqyCVJgACcY6bau7BQ/0PI4xEMwr3F8aFH3TGC+uapnMoVwdtDSAWIzBWIo
         MC+ssGiRm5l5+3s1KFGBANH6zIZvAQ2rLGX+lnlERlM4ZKUvYflk8Wj6qKu9Tc2+SXDB
         hx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747307446; x=1747912246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wH93pyrIEPQfVMzkjhmhq8lcyU/jh4Z97QhhnrcpdMM=;
        b=BbOZdRAsI63glQ9Cflz1k5wVKyYV9ZAkZnPaW3LUWedY+bTv9SPvZ+ysIMvth7L9/K
         NK5o4YxGI7OuxQDbhtJGPj6SHA8ThcTmSxMQyboTjKOg4nB6e4jYn+VuwxR8Tvr5xxyW
         Ax+E9IBO1F9c1I4IAdF5vQtzLDpaqgcOf/8dWLLQZwEkLYErIto+uv/ouBQYG8XcIf9S
         FjcPlH/nXZVS3OisVvt3wBzIzO9tNarJfUz/AlKC0DE9BbIPeCuQcgvyDFWyd8FDS17G
         OgrJygm/1yxZE7FQRCauLC6OhZg0C/xY4XtBvJeolKl34f3NLkkgqUuWgFsAlEMQBAP7
         3pXg==
X-Forwarded-Encrypted: i=1; AJvYcCWOJLiqVy1HVG+lIBF25yQPA2z6L79cHm4O4B/S1M8up8NGVkXP2UeYr64bikf59JzxJyD0@lists.linux.dev
X-Gm-Message-State: AOJu0Yx03KJW3RldBxo9TNn7wko1eD0qgQVpBA8yqKbcoZp9fBzUt2XQ
	+XlZw+l5RghwJ8l48Lu1OhlVrCS1Gn8EbyEoGz8DthkuZKFvmh+h96/T7nExZl8kYrUilTNyHGw
	TGriBFOwTX4hAVPS4P3/aP5PFeiQ=
X-Gm-Gg: ASbGncuEc3j1Y5BulzKfC1U/sc7H2U0QtTalJVLu5obEwffTydi/cFbarpekIza5b1d
	ZKwlz1h3gioCYpBIGbJgSXq6CIR8FYHm8j1Ei3pHfZMjqcZk/ZHLyoiYsciloR2QU7PEI4/dVe4
	2yae5vTiqQTJX/UqNwxRUKKpuTnaY9ssQf7R00KKCRKw==
X-Google-Smtp-Source: AGHT+IE0xGxRoRc2hiMiqEaYs/R8BerbabBDK4/6SGlmW7kn9vsBtzHGwphHTBRO8aoYTAxznhm63Sb3LeSpgXFd/NQ=
X-Received: by 2002:a17:906:730e:b0:ac7:e815:6e12 with SMTP id
 a640c23a62f3a-ad4f717d80dmr692300366b.33.1747307445484; Thu, 15 May 2025
 04:10:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250430123306.15072-1-linux.amoon@gmail.com> <aCR9RzGMWEuI0pxS@mai.linaro.org>
In-Reply-To: <aCR9RzGMWEuI0pxS@mai.linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 15 May 2025 16:40:27 +0530
X-Gm-Features: AX0GCFs2e1Pkh4MEeMLO4mfbxvj7Hh0TOcnvMLseg8q2U30qPhgLXLwcneYB4S8
Message-ID: <CANAwSgSA-JHMRD7-19wijOY=TSWD-sv6yyrT=mH+wkUJuvxFAw@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] Exynos Thermal code improvement
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-pm@vger.kernel.org>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Wed, 14 May 2025 at 16:53, Daniel Lezcano <daniel.lezcano@linaro.org> wr=
ote:
>
> On Wed, Apr 30, 2025 at 06:02:56PM +0530, Anand Moon wrote:
> > Hi All,
>
> Hi Anand,
>
> if the goal of the changes is to do cleanups, I recommend to rework
> how the code is organized. Instead of having the data->soc check all
> around the functions, write per platform functions and store them in
> struct of_device_id data field instead of the soc version.
>
> Basically get rid of exynos_map_dt_data by settings the different ops
> in a per platform structure.
>
> Then the initialization routine would be simpler to clean.
>

Thanks, I had previously attempted this approach.
The goal is to split the exynos_tmu_data structure to accommodate
SoC-specific callbacks for initialization and configuration.

In my earlier attempt, I tried to refactor the code to achieve this.
However, the main challenge I encountered was that the
exynos_sensor_ops weren=E2=80=99t being correctly mapped for each SoC.

Some SoC have multiple sensor
exynos4x12
                    tmu: tmu@100c0000
exynos5420
                tmu_cpu0: tmu@10060000
                tmu_cpu1: tmu@10064000
                tmu_cpu2: tmu@10068000
                tmu_cpu3: tmu@1006c000
                tmu_gpu: tmu@100a0000
 exynos5433
                tmu_atlas0: tmu@10060000
                tmu_atlas1: tmu@10068000
                tmu_g3d: tmu@10070000
exynos7
                tmu@10060000

It could be a design issue of the structure.or some DTS issue.
So what I found in debugging it is not working correctly.

static const struct thermal_zone_device_ops exynos_sensor_ops =3D {
        .get_temp =3D exynos_get_temp,
        .set_emul_temp =3D exynos_tmu_set_emulation,
        .set_trips =3D exynos_set_trips,
};

The sensor callback will not return a valid pointer and soc id for the get_=
temp.

Here is my earlier version of local changes.
[1] https://pastebin.com/bbEP04Zh exynos_tmu.c
[2] https://pastebin.com/PzNz5yve Odroid U3 dmesg.log
[3] https://pastebin.com/4Yjt2d2u    Odroid Xu4 dmesg.log

I want to re-model the structure to improve the code.
Once Its working condition I will send this for review.

If you have some suggestions please let me know.

Thanks
-Anand
