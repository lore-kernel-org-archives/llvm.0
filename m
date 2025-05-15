Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052C0218592
	for <llvm@lists.linux.dev>; Thu, 15 May 2025 18:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747332132; cv=none; b=YG+Uvmj+f1L3WYE0Dju7pOC93OLvzeAT20QDgUsYjWrLG/SyyQimNjPhCtamuUAKAJtMrVgI2m3vgXW0bKhU3IJ/niLWZ2Fzfbv7pqIjrjI8ZEO+f3czgz5EENtNr6xZe8bT5AChre6m++Sx2Hntg9RQhYflwjbi558JvjKOu1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747332132; c=relaxed/simple;
	bh=xYxE3KmAJuDBwEUTV/7JBSyd7GH9iHMFGQRs1lUAZlc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QgKXzeBV/tgDxLGJOx+tea9/HxzvrI0vPQRPDAX0w92GkQCNn4gk3V5sWVyUVwmhHuMVLl1cstdCluDEQ08QB8pX2toTLnpTUY5wQs6LxgwqyTQcDJ+1sT/sFzjtSdCWvS5vBpfGlAzr86xwwWdKQIUoitzEkYPlgNeUFd4xigw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQ6Ll2wz; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQ6Ll2wz"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-600210e4219so793018a12.0
        for <llvm@lists.linux.dev>; Thu, 15 May 2025 11:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747332129; x=1747936929; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNN+vfuMJJgSzRBBX1dcv69JrH0Sd8EtzpYEboDV/q8=;
        b=MQ6Ll2wzD47j4QPBTnXAlKoyDavy6g3u9gV9DbNk4QLg88McDxX94Sfbn8ApP0h60N
         /w7YtX8OaUxr3RkOAz5ch296Q2FgTM3vPQlKuOsewa18pEqzro8r+lICAI6gQIs25XBm
         oszE8qJNGbjLyavIZAOAWLbdmDTdiBV3laDI8CVBF+fyoWz12/CeT0LljWVmRvrlEgxF
         oZaq5eheasTKyKCE+VOCt3ihQlZ1YOGNUR+tmII4ErPR+ZWIcbFA/YDzJKdRbQwdjnnF
         Whrp225cWApdKGWftqFE+7Datv8t51LK1Plo0ZdD00psguHUEa9ZNqOcep+zzME0mStG
         tiEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747332129; x=1747936929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNN+vfuMJJgSzRBBX1dcv69JrH0Sd8EtzpYEboDV/q8=;
        b=R0AFWQ6g7aze8wuBMvurhAlcGWokHnMlyrscsGNQRsO6nx9J1QUbmnuSOjdDqzVNZp
         iFd8rJQdXTwK0D/6vGEvPz89yk3yJyYke7EontApL+CA8Oa5xlEEV95TGuaRiLwTa2JD
         ff70DNRn61XI4HHuacamSs5q0zsK4CO4TQ0yVkBkVwzjzoaqQKvwUdWH2GnPzuC7r/5u
         xRWsK2TUxXroX/hp38eqOUUCj1OZAR5T2B6DhOjuxmWYorOVXnvzCS6k7iTpkREBt7Tf
         R1fAmr8yKbsSyJbSXxCEK2V/tCb1IpiheFjOhGN0J/fgg1lX4J3RhNuRlzkOXHqbg9S3
         dRdA==
X-Forwarded-Encrypted: i=1; AJvYcCWTzAhnLVtEuOObL5tHchnL40cqcA9Kuj9e++c5ULieTOFTdKhYO5e6iXFj1M3B1jmlJ8Hd@lists.linux.dev
X-Gm-Message-State: AOJu0YwtHqYRgIyG08ibH0ZxqIApLcJMm3pDEnM0Vrm+eBK9sYeYjVVq
	952522CdMG8dpHTqED4uIehZTrZVvzgaKTbbI4jppFXikG6BUxlypDTHxIdcdOySuQuWB4DGNjZ
	2MF7kvW0b+RtD4b0goMCKAZ4fTEvrdTE=
X-Gm-Gg: ASbGncupxLDYJGz69KEfz++s/EIJzjcUE0u97hbO35AaxfvBhY89ev/2DNP0vnf/Nzt
	xqnfeH2rnQAi54bqL3l71oT7aU3YVUYVzgiFrhSwnpYod9Z8zpJlED5WFLFcsw7XNcDTvkce9Vp
	xcxqcB9j+yxGemONfUhZ2eDFeVhRuvVHU=
X-Google-Smtp-Source: AGHT+IGJ3VLgyC5oRyYT9SJhjLgRqlja96rlJ3f3rzeXshYp1J9lbgDhqI7B6B7Y0eDrmuUni3A/DX8mMtH0+4aqo58=
X-Received: by 2002:a17:907:980f:b0:ad2:41ae:a1e4 with SMTP id
 a640c23a62f3a-ad50f7c4f3dmr407267966b.24.1747332128837; Thu, 15 May 2025
 11:02:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250430123306.15072-1-linux.amoon@gmail.com> <aCR9RzGMWEuI0pxS@mai.linaro.org>
 <CANAwSgSA-JHMRD7-19wijOY=TSWD-sv6yyrT=mH+wkUJuvxFAw@mail.gmail.com> <92c2949e-2fc1-40e9-9dea-e3d9f7aa571d@linaro.org>
In-Reply-To: <92c2949e-2fc1-40e9-9dea-e3d9f7aa571d@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 15 May 2025 23:31:50 +0530
X-Gm-Features: AX0GCFsEAXplwRDB3NXZqHZ-d-ohJ2IJuxMQMC4KvVGNnVidBm-TZoRYGMggWAM
Message-ID: <CANAwSgQryVLdRVd9KRBnaUcjtX8xR9w9BBTCvoqKH6funkj=2A@mail.gmail.com>
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

On Thu, 15 May 2025 at 18:59, Daniel Lezcano <daniel.lezcano@linaro.org> wr=
ote:
>
> On 5/15/25 13:10, Anand Moon wrote:
> > Hi Daniel,
> >
> > On Wed, 14 May 2025 at 16:53, Daniel Lezcano <daniel.lezcano@linaro.org=
> wrote:
> >>
> >> On Wed, Apr 30, 2025 at 06:02:56PM +0530, Anand Moon wrote:
> >>> Hi All,
> >>
> >> Hi Anand,
> >>
> >> if the goal of the changes is to do cleanups, I recommend to rework
> >> how the code is organized. Instead of having the data->soc check all
> >> around the functions, write per platform functions and store them in
> >> struct of_device_id data field instead of the soc version.
> >>
> >> Basically get rid of exynos_map_dt_data by settings the different ops
> >> in a per platform structure.
> >>
> >> Then the initialization routine would be simpler to clean.
> >>
> >
> > Thanks, I had previously attempted this approach.
> > The goal is to split the exynos_tmu_data structure to accommodate
> > SoC-specific callbacks for initialization and configuration.
> >
> > In my earlier attempt, I tried to refactor the code to achieve this.
> > However, the main challenge I encountered was that the
> > exynos_sensor_ops weren=E2=80=99t being correctly mapped for each SoC.
> >
> > Some SoC have multiple sensor
> > exynos4x12
> >                      tmu: tmu@100c0000
> > exynos5420
> >                  tmu_cpu0: tmu@10060000
> >                  tmu_cpu1: tmu@10064000
> >                  tmu_cpu2: tmu@10068000
> >                  tmu_cpu3: tmu@1006c000
> >                  tmu_gpu: tmu@100a0000
> >   exynos5433
> >                  tmu_atlas0: tmu@10060000
> >                  tmu_atlas1: tmu@10068000
> >                  tmu_g3d: tmu@10070000
> > exynos7
> >                  tmu@10060000
> >
> > It could be a design issue of the structure.or some DTS issue.
> > So what I found in debugging it is not working correctly.
> >
> > static const struct thermal_zone_device_ops exynos_sensor_ops =3D {
> >          .get_temp =3D exynos_get_temp,
> >          .set_emul_temp =3D exynos_tmu_set_emulation,
> >          .set_trips =3D exynos_set_trips,
> > };
> >
> > The sensor callback will not return a valid pointer and soc id for the =
get_temp.
> >
> > Here is my earlier version of local changes.
> > [1] https://pastebin.com/bbEP04Zh exynos_tmu.c
> > [2] https://pastebin.com/PzNz5yve Odroid U3 dmesg.log
> > [3] https://pastebin.com/4Yjt2d2u    Odroid Xu4 dmesg.log
> >
> > I want to re-model the structure to improve the code.
> > Once Its working condition I will send this for review.
> >
> > If you have some suggestions please let me know.
>
> I suggest to do the conversion step by step beginning by
> exynos4210_tmu_clear_irqs, then by exynos_map_dt_data as the first
> cleanup iteration
>
Ok you want IRQ handle per SoC call back functions?
so on all the changes depending on SoC id should be moved to
respective callback functions to reduce the code.

Thank  you for having a look into my changes

Thanks
-Anand
>
> --
> <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for AR=
M SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
