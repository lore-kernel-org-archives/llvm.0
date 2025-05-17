Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AB015E8B
	for <llvm@lists.linux.dev>; Sat, 17 May 2025 19:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747510888; cv=none; b=D1j62QOuYGpWV8dd2Zo9ZoayZzVZZuuWw+Ljkid/oygxVwy7XP0mBT+eUwFd6mcY5Tp2OXN9gkgDC1CPX9A/uPRE11qBzf/BU09N6saevmqJNvSFoymAC+qEfc+ar+5tzPmwFQrUVIEv+bX9QxKqZZPMrVUiLYxmbk0aRDmZJsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747510888; c=relaxed/simple;
	bh=xPLtXQunlgveTeRsuhOJV/+kOS5p9tvCwVH7pRipu2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oqj9CZ+Gt8/pMim2bq2/NgpeV3EzdtVDKXuKj25uzwhnm5Rq45WaGwj5uNcyXg1MYM7Q5DUwvKE5LBSs46Wq03rGkk1hAwmJBakgHF2pgtSlluIEcGGaFJcXqoyuxUofPhcjYByw4fm/hIsViR0uZFcTDhb9WCsV3dDpomA/Aaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mXEaMNQx; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXEaMNQx"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ad5297704aaso434679666b.2
        for <llvm@lists.linux.dev>; Sat, 17 May 2025 12:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747510885; x=1748115685; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOaJS8qDeTvR+yb6xG8mvyDJYIWOLLbeVsAQNEudTm4=;
        b=mXEaMNQx4JphgTdkrt6U9Qp3KJZZGNvVwzCP4FWFw4Xv0Qem7Ps465kKxNzFMMMfea
         Wig7Y4n8CsJUFeYX4H/vDc+V51JwmW+vaVIJn9aZ23krpxoj7N5rgbgYX7I9iNG+T2y9
         GhlhEbVLe3bViA+1zLuxQazH7ZOEUMvc2ugp2XayWmviMAK3uhJmj/jLt3b2cO/DjzKv
         Q/kb9xyd6zNDyEtdnD9kfRePGDnvNZ8TYjoNDDadlhPRZbUaB+q8uaJJjDHyvG0rzznV
         pVLiyg58mhys9lpceS50/t/lMeyXgu7IewiLurlMNDJExcmrSWsl4acczj8BVu6QbHim
         9aig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747510885; x=1748115685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOaJS8qDeTvR+yb6xG8mvyDJYIWOLLbeVsAQNEudTm4=;
        b=KdlyyF+7Pou8Ai0gZypkDIKolky+A1fCommETXSWyKrDOJA3UmsuG7ZR0ioOcWS9+p
         cLRzCaldTeYt2cujPE5XynhCSArls4fL7hqZALwUpLOjmeEGb/HzsYaLXuo4SFUpCqDM
         a+oPttIj9faZy2XmPOxu7RbjSM+oT+dytEz8YXaRvwgz7gCvbgfJ/TLRX/o7BU8uwhxd
         3r4IEUmMbBi9xN2FTD2spnQ1XcOB+BkdTI14/1Au1ZT+BH01ecWpzkL2b2EF5adr0FkV
         gPspJGHxuuINZj+aLaCNyk4PK+W7xrI3pHGViovs7qgJv1ZDR3qgc/XYNT6cwoNS8Tun
         eYCw==
X-Forwarded-Encrypted: i=1; AJvYcCVvMch8A083PBaSNLVCdZhN+zmRG6ytXKd4w5yvGpCglhzCcveVDtMUZCzmwKEb3FskKpCY@lists.linux.dev
X-Gm-Message-State: AOJu0YyDcpT65zyht/VfcmzgtFf+WO6LeUEmvnOlb+67n7ww5ELE+QAy
	NWA/NCPfvtONhgA/E4BCSDrfhkPhhLRl/1AHmqTa6naukY+1z9AQ6e2oti7BE4G5LRklHkyXfcY
	BzW2gWBpHoSR1B56cfpcaLHF89KUU0JE=
X-Gm-Gg: ASbGncvcfSF38vBXtKAlsfPw4VQtSySJquYvcHmFsz1TYz96OpcxtU3OCcjITmb6Lv4
	oVQGtVISwBaFDngseFFqkrrHd2PU6bCR3A6UzM9cv2HlMILZ4vBJ1dbbFd+l4Vnh0Fd4Fukd9NZ
	1kTLYlOXoBqMYPamDa0gvRr29Gvp8NPLg=
X-Google-Smtp-Source: AGHT+IG2h9FdAqyLAeDMlVgp77wyUY3I3sfyW0h4u8fCLKBnBw3n5d3cWdiSpQGUgrrGQ4d5vHrpjCNIEbTBvGh6C/I=
X-Received: by 2002:a17:907:74a:b0:ad2:43b6:dd6d with SMTP id
 a640c23a62f3a-ad52d45adddmr556931466b.12.1747510884424; Sat, 17 May 2025
 12:41:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250430123306.15072-1-linux.amoon@gmail.com> <aCR9RzGMWEuI0pxS@mai.linaro.org>
 <CANAwSgSA-JHMRD7-19wijOY=TSWD-sv6yyrT=mH+wkUJuvxFAw@mail.gmail.com>
 <92c2949e-2fc1-40e9-9dea-e3d9f7aa571d@linaro.org> <CANAwSgQryVLdRVd9KRBnaUcjtX8xR9w9BBTCvoqKH6funkj=2A@mail.gmail.com>
 <3c44154c-7261-4b03-bd12-bddf4d493e74@linaro.org>
In-Reply-To: <3c44154c-7261-4b03-bd12-bddf4d493e74@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sun, 18 May 2025 01:11:07 +0530
X-Gm-Features: AX0GCFskBeR8WK9jkalSvJrYI5c9Nua4Ww8iaYWYJnYOXYU21l3OTo_PXNe7k2c
Message-ID: <CANAwSgRnRPb9kPT1rxHFUEvyzoCLTrD5JZVtLHZ9A6gV00dOCw@mail.gmail.com>
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

On Fri, 16 May 2025 at 20:15, Daniel Lezcano <daniel.lezcano@linaro.org> wr=
ote:
>
> On 5/15/25 20:01, Anand Moon wrote:
> > Hi Daniel,
> >
> > On Thu, 15 May 2025 at 18:59, Daniel Lezcano <daniel.lezcano@linaro.org=
> wrote:
> >>
> >> On 5/15/25 13:10, Anand Moon wrote:
> >>> Hi Daniel,
> >>>
> >>> On Wed, 14 May 2025 at 16:53, Daniel Lezcano <daniel.lezcano@linaro.o=
rg> wrote:
> >>>>
> >>>> On Wed, Apr 30, 2025 at 06:02:56PM +0530, Anand Moon wrote:
> >>>>> Hi All,
> >>>>
> >>>> Hi Anand,
> >>>>
> >>>> if the goal of the changes is to do cleanups, I recommend to rework
> >>>> how the code is organized. Instead of having the data->soc check all
> >>>> around the functions, write per platform functions and store them in
> >>>> struct of_device_id data field instead of the soc version.
> >>>>
> >>>> Basically get rid of exynos_map_dt_data by settings the different op=
s
> >>>> in a per platform structure.
> >>>>
> >>>> Then the initialization routine would be simpler to clean.
> >>>>
> >>>
> >>> Thanks, I had previously attempted this approach.
> >>> The goal is to split the exynos_tmu_data structure to accommodate
> >>> SoC-specific callbacks for initialization and configuration.
> >>>
> >>> In my earlier attempt, I tried to refactor the code to achieve this.
> >>> However, the main challenge I encountered was that the
> >>> exynos_sensor_ops weren=E2=80=99t being correctly mapped for each SoC=
.
> >>>
> >>> Some SoC have multiple sensor
> >>> exynos4x12
> >>>                       tmu: tmu@100c0000
> >>> exynos5420
> >>>                   tmu_cpu0: tmu@10060000
> >>>                   tmu_cpu1: tmu@10064000
> >>>                   tmu_cpu2: tmu@10068000
> >>>                   tmu_cpu3: tmu@1006c000
> >>>                   tmu_gpu: tmu@100a0000
> >>>    exynos5433
> >>>                   tmu_atlas0: tmu@10060000
> >>>                   tmu_atlas1: tmu@10068000
> >>>                   tmu_g3d: tmu@10070000
> >>> exynos7
> >>>                   tmu@10060000
> >>>
> >>> It could be a design issue of the structure.or some DTS issue.
> >>> So what I found in debugging it is not working correctly.
> >>>
> >>> static const struct thermal_zone_device_ops exynos_sensor_ops =3D {
> >>>           .get_temp =3D exynos_get_temp,
> >>>           .set_emul_temp =3D exynos_tmu_set_emulation,
> >>>           .set_trips =3D exynos_set_trips,
> >>> };
> >>>
> >>> The sensor callback will not return a valid pointer and soc id for th=
e get_temp.
> >>>
> >>> Here is my earlier version of local changes.
> >>> [1] https://pastebin.com/bbEP04Zh exynos_tmu.c
> >>> [2] https://pastebin.com/PzNz5yve Odroid U3 dmesg.log
> >>> [3] https://pastebin.com/4Yjt2d2u    Odroid Xu4 dmesg.log
> >>>
> >>> I want to re-model the structure to improve the code.
> >>> Once Its working condition I will send this for review.
> >>>
> >>> If you have some suggestions please let me know.
> >>
> >> I suggest to do the conversion step by step beginning by
> >> exynos4210_tmu_clear_irqs, then by exynos_map_dt_data as the first
> >> cleanup iteration
> >>
> > Ok you want IRQ handle per SoC call back functions?
> > so on all the changes depending on SoC id should be moved to
> > respective callback functions to reduce the code.
>
> I think you can keep the same irq handler function but move the
> tmu_intstat, tmu_intclear in the persoc structure and remove the
> exynos4210_tmu_clear_irqs function.
>
> You should end up with something like:
>
> static irqreturn_t exynos_tmu_threaded_irq(int irq, void *id)
> {
>         struct exynos_tmu_data *data =3D id;
>         unsigned int val_irq;
>
>         thermal_zone_device_update(data->tzd, THERMAL_EVENT_UNSPECIFIED);
>
>         mutex_lock(&data->lock);
>         clk_enable(data->clk);
>
>         val_irq =3D readl(data->base + data->tmu_intstat);
>          writel(val_irq, data->base + data->tmu_intclear);
>
>         clk_disable(data->clk);
>         mutex_unlock(&data->lock);
>
>         return IRQ_HANDLED;
> }

No this will not work,
>
> But if the irq handler has some soc specific code, then it should be a
> separate function
>

INTSTAT interrupt status register holds the pending status of
rising and falling edge of IRQ

#define INTSTAT_FALL2   BIT(24)
#define INTSTAT_FALL1   BIT(20)
#define INTSTAT_FALL0   BIT(16)
#define INTSTAT_RISE2   BIT(8)
#define INTSTAT_RISE1   BIT(4)
#define INTSTAT_RISE0   BIT(0)

#define INTCLEAR_FALL2  BIT(24)
#define INTCLEAR_FALL1  BIT(20)
#define INTCLEAR_FALL0  BIT(16)
#define INTCLEAR_RISE2  BIT(8)
#define INTCLEAR_RISE1  BIT(4)
#define INTCLEAR_RISE0  BIT(0)

static void exynos4210_tmu_clear_irqs(struct exynos_tmu_data *data)
{
        u32 tmu_intstat, tmu_intclear;
        u32 val_irq =3D 0, clear_mask =3D 0;

        if (data->soc =3D=3D SOC_ARCH_EXYNOS5260) {
                tmu_intstat =3D EXYNOS5260_TMU_REG_INTSTAT;
                tmu_intclear =3D EXYNOS5260_TMU_REG_INTCLEAR;
        } else if (data->soc =3D=3D SOC_ARCH_EXYNOS7) {
                tmu_intstat =3D EXYNOS7_TMU_REG_INTPEND;
                tmu_intclear =3D EXYNOS7_TMU_REG_INTPEND;
        } else if (data->soc =3D=3D SOC_ARCH_EXYNOS5433) {
                tmu_intstat =3D EXYNOS5433_TMU_REG_INTPEND;
                tmu_intclear =3D EXYNOS5433_TMU_REG_INTPEND;
        } else {
                tmu_intstat =3D EXYNOS_TMU_REG_INTSTAT;
                tmu_intclear =3D EXYNOS_TMU_REG_INTCLEAR;
        }

        val_irq =3D readl(data->base + tmu_intstat);
        /*
         * Clear the interrupts.  Please note that the documentation for
         * Exynos3250, Exynos4412, Exynos5250 and Exynos5260 incorrectly
         * states that INTCLEAR register has a different placing of bits
         * responsible for FALL IRQs than INTSTAT register.  Exynos5420
         * and Exynos5440 documentation is correct (Exynos4210 doesn't
         * support FALL IRQs at all).
         */

        /* Map INTSTAT bits to INTCLEAR bits */
        if (val_irq & BIT(24))
                clear_mask |=3D BIT(24);
        else if (val_irq & BIT(20))
                clear_mask |=3D BIT(20);
        else if (val_irq & BIT(16))
                clear_mask |=3D BIT(16);
        else if (val_irq & BIT(8))
                clear_mask |=3D BIT(8);
        else if (val_irq & BIT(4))
                clear_mask |=3D BIT(4);
        else if (val_irq & BIT(0))
                clear_mask |=3D BIT(0);

        /* Perform proper task for decrease temperature */
        if (clear_mask)
                writel(clear_mask, data->base + tmu_intclear);
}

TMU clears the rising and falling interrupt according to the user manual.

Thanks
-Anand
> --
> <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for AR=
M SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
