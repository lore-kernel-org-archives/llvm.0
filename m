Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C322E3AFD
	for <llvm@lists.linux.dev>; Wed, 20 Aug 2025 13:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755696544; cv=none; b=sdckGUDM4DzAfn7VlU++ezW75Uu/F8te5jATpi8lbXNMCU0gbV+0Hu872Um5i6fSMmnW2Eh685Yad6olueWeGFfEAl1Z07hooA/QJetalfT07a5vld9cGTHsmBozMVatbX+iwoLSJhs9FM7Ow/MpPfR46LJDvVtgy2jm4nkvZbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755696544; c=relaxed/simple;
	bh=AJIjVE+9x/GkFggg+E+VOL6kHUa36rZ+tFjynAzQJkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s90562Zn05XXVuHermmzFssZ8pwNGjo1YZZj4grNdjSd30TJXfNU8bvDmptzJAOwZD7Wl4sWpA/w3n/YVGq4heXBxHlpsC85TYSgtbi3bZF5xfDgLINIY9EqVzjiqVxFAIbTYZ/R9B3kkd6pICz81DdfioeBxu1P8xd30j8pHv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KDjrkOOZ; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KDjrkOOZ"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-61a2a5b0689so6674404a12.1
        for <llvm@lists.linux.dev>; Wed, 20 Aug 2025 06:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755696541; x=1756301341; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0nVpFwznHMpNpqwkISsWqIDhkZo9GN/5f7ypKNFeZFY=;
        b=KDjrkOOZrtvw/CSpTQSUg8NZn666XLFzR9FYQ1E1ET7kgWgvvoDDeYGvSvWWlQojPH
         GCO22KWhTLQcjQq27JKm6tGm1Ls6pawbQXxoNKazYn6tPfhma74TaE6ZVk25VOMqOCJN
         hf77y5sreQf161ROEEJHhF/WNSbccWmxG1oTGRK98WynX5w/IbcHaMRm+DPt2sm5FNoN
         +GqfnHrHGcdTPdMVk2XO6LmaZr8aiZXkXv1hHp9wW+g9zSO57MEqcFehznew3Ng4uziC
         v7B1Oof7JC45P7ayR16i3/VomcherEALRkELZKrsgHn+9pqiDGJ7sdSc4phSP2qYkGLi
         zbCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755696541; x=1756301341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0nVpFwznHMpNpqwkISsWqIDhkZo9GN/5f7ypKNFeZFY=;
        b=PLk7gzBkyKT/KYpWf+rLqs8PytbKBwoVmoMm+FrY0Y2WNXAv2I+oIK+XVOvsp6us++
         mQ236g0hh8DJLqGX97mpECpCU+EHJuWQw8Yx1khKAywVug1TNBocW4sZH2EoDYIuvp2/
         1msoFkVT/P24uxKOArPVYMVvwbdF7+VlDG42SP6U2J7tdlVFO4oiafFW0gdc/+NYufhI
         DfbNFCpeg8lK0M6bY9sjN8dfHNmw9XgjfEEoRWma1i//GvwmPTzgZMIZPUaCi//NjtkD
         xlCwer3JRfRwbGBsjeZh8/xdZJHRy6ueqBfDaR2WCxq0GuzT4lN/we/mcDTiYHfYiyjn
         yWQA==
X-Forwarded-Encrypted: i=1; AJvYcCVxjQZcwQwaiZisU+1r2jsCIUGwcmrVOOGZ9+VzKn7Mcxtr7lprXLvV7kIC4xdZznC7RX7O@lists.linux.dev
X-Gm-Message-State: AOJu0Yzp6zk5RM8fh2VPc+mtOclfoFa+JCzntx8iAaxREyZ+LZ6WXLWF
	tOj+QHuAjzKeDdonIe2zCI2KzALxsf5pveRI3wWfn2VO4h0jud9MHW4FIy2BzoJQIma1w/C9j3J
	maXCve5ZbZHkEeOd+BnDNzK+fmfaAIdo=
X-Gm-Gg: ASbGnctnAy92ngJ3xervZBj+I4n4L1Pqkt2dtV1pFoHMoMujB8UG+HZjxy2VIFoucpd
	DpCh1GAwVVbhptiJ5VW9gdPiL7xS8BrnD9vCgSG/7AgYaRpQaIAHgB5VFOrxafV+2WS80XSwC36
	ZsOyvP3d/9h4W3n+DXncZgpVBej8D+xX46gSQlNdUMEn7g80+m/d7yFJcuLZCmIGAAPGAfTjksY
	csZag==
X-Google-Smtp-Source: AGHT+IE1YhFYDwX8RTFqCBvI/O0nzvU66srlAToMGQhCnvv7ApS2NTfh2GSqAw7utXfVWbtfNzrw3Bn9dL0oJJc7q1g=
X-Received: by 2002:a05:6402:460a:b0:612:b742:5bba with SMTP id
 4fb4d7f45d1cf-61a975521a9mr2385263a12.13.1755696540707; Wed, 20 Aug 2025
 06:29:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CGME20250819131732eucas1p26bd491e9b6b747a4857905bfd50420a9@eucas1p2.samsung.com>
 <20250813131007.343402-7-linux.amoon@gmail.com> <20250819131704.19780-1-m.majewski2@samsung.com>
In-Reply-To: <20250819131704.19780-1-m.majewski2@samsung.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 20 Aug 2025 18:58:43 +0530
X-Gm-Features: Ac12FXxJk9FiRDbaSI1KGn0qHUotnyfsd3cxseyNycA4dBDFvpr7OUkV8SN9KUE
Message-ID: <CANAwSgSjkP_wZ2Wvk1bZ2j6GHwAqEw1f5ZXLfQyEWgzcBzb6Mw@mail.gmail.com>
Subject: Re: [PATCH v7 6/7] thermal/drivers/exynos: Handle temperature
 threshold IRQs with SoC-specific mapping
To: Mateusz Majewski <m.majewski2@samsung.com>
Cc: alim.akhtar@samsung.com, bzolnier@gmail.com, daniel.lezcano@linaro.org, 
	justinstitt@google.com, krzk@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, llvm@lists.linux.dev, lukasz.luba@arm.com, 
	morbo@google.com, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	rafael@kernel.org, rui.zhang@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mateusz,

Thanks for your review comments..

On Tue, 19 Aug 2025 at 18:47, Mateusz Majewski <m.majewski2@samsung.com> wr=
ote:
>
> Hello :)
>
> > +/* Map Rise and Falling edges for IRQ Clean */
> > +struct tmu_irq_map {
> > +     u32 fall[3];
> > +     u32 rise[3];
> > +};
>
Ops, this is an overkill approach that could be simplified further.

static void exynos4412_tmu_clear_irqs(struct exynos_tmu_data *data)
{
        unsigned int val_irq, clear_irq =3D 0;
        u32 tmu_intstat =3D data->tmu_intstat;
        u32 tmu_intclear =3D data->tmu_intclear;
        static const u32 irq_bits[] =3D {
                BIT(0), BIT(4), BIT(8),   /* Rising edge */
                BIT(12), BIT(16), BIT(20) /* Falling edge */
        };

        val_irq =3D readl(data->base + tmu_intstat);

        /* Set SoC-specific interrupt bit mappings */
        for (int i =3D 0; i < ARRAY_SIZE(irq_bits); i++) {
                if (val_irq & irq_bits[i])
                        clear_irq |=3D irq_bits[i];
        }

        if (clear_irq)
                writel(clear_irq, data->base + tmu_intclear);
}

> Hmm, we can probably get away with less interrupts. We actually only
> enable one fall interrupt in tmu_set_low_temp and one rise interrupt in
> tmu_set_high_temp.

Got it =E2=80=94 we need to enable INTEN for both rising and falling edges,
specific to each SoC.
So each SoC has a one-to-one mapping of INTEN with INTSTAT and INTCLEAR bit=
s
for rising and falling edge detection:.

Exynos4412
   Falling edge: bits 20, 16, 12
   Rising edge: bits 8, 4, 0
Exynos5422
  Falling edge: bits 24, 20, 16
  Rising edge: bits 8, 4, 0
Exynos5433
  Falling edge: bits 23, 17, 16
  Rising edge: bits 7, 1, 0

So we need to enable INTEN like below.

 static void exynos4412_tmu_set_low_temp(struct exynos_tmu_data *data, u8 t=
emp)
 {
        exynos_tmu_update_temp(data, EXYNOS_THD_TEMP_FALL, 0, temp);
-       exynos_tmu_update_bit(data, EXYNOS_TMU_REG_INTEN,
-                             EXYNOS_TMU_INTEN_FALL0_SHIFT, true);
+       for (int i =3D 0; i < 3; i++)
+               exynos_tmu_update_bit(data, EXYNOS_TMU_REG_INTEN,
+                                     EXYNOS_TMU_INTEN_FALL0_SHIFT + i
* 4, true);
 }

 static void exynos4412_tmu_set_high_temp(struct exynos_tmu_data *data, u8 =
temp)
 {
        exynos_tmu_update_temp(data, EXYNOS_THD_TEMP_RISE, 8, temp);
-       exynos_tmu_update_bit(data, EXYNOS_TMU_REG_INTEN,
-                             EXYNOS_TMU_INTEN_RISE0_SHIFT + 4, true);
+       for (int i =3D 0; i < 3; i++)
+               exynos_tmu_update_bit(data, EXYNOS_TMU_REG_INTEN,
+                             EXYNOS_TMU_INTEN_RISE0_SHIFT + 1 * 4, true);
 }

>
> Regarding tmu_set_crit_temp, on SoCs that have hardware thermal tripping
> there is nothing to clear. On others we will reboot immediately anyway,
> though maybe there is nothing wrong with clearing the interrupt
> beforehand? Regardless of this, there is only a rise critical
> temperature interrupt, we never set a matching fall interrupt.
>
As per my understanding, it depends on the calibration consists of reading =
the
measured data from e-fuse and wrote the calibrated threshold temperature to
generate interrupts into trigger level 0-3

THRES_TEMP_RISE and THRES_TEMP_FALL.

When the current temperature exceeds a threshold rise temperature,
 then it generates the corresponding interrupt (INTREQ_RISE[2:0]).
When the current temperature goes below a threshold fall temperature, t
hen it generates a corresponding interrupt (INTREQ_FALL[2:0].

It also depends on the sample interval

> Maybe it would also be good to add a bool to this struct containing
> information about whether a fall interrupt is in use, and reuse
> the same logic for 4210?
>
> (Nitpick: I am not a native speaker of English, but I think "clean" and
> "clear" have slightly different meanings, and the rest of the code
> consistently uses "clear", so it would be worthwhile to also use "clear"
> here.)
>
> > +             break;
>
> Maybe put irq_map inside exynos_tmu_data? exynos_map_dt_data has a
> switch block that is quite similar, in that it also matches on the SoC
> type. This way also there is no need to have a fallback.
>
I want to avoid this If you have any design feedback, plz let me know.

I had attempted to refactor exynos_tmu_data by splitting it per-SoC,
assigning dedicated callback functions for each variant. The goal was
to eliminate
the need for data->soc checks and make the code more modular.
However, the approach didn=E2=80=99t work as expected=E2=80=94devm_thermal_=
of_zone_register()
wouldn=E2=80=99t bind the sensor-specific callbacks correctly.

static const struct thermal_zone_device_ops exynos_sensor_ops =3D {
.get_temp =3D exynos_get_temp,
.set_emul_temp =3D exynos_tmu_set_emulation,
.set_trips =3D exynos_set_trips,
};

> Kind regards,
> Mateusz Majewski

Thanks
-Anand
