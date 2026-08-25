Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF6C330647
	for <llvm@lists.linux.dev>; Tue, 25 Aug 2026 17:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787679225; cv=pass; b=t3YvwkBMWptQ+gZkAJiYo8DtxvPT2fW3ynONpGnUFC39qMh7gTx8mCxdtidSrfrY/nZNJO8RPOp09YZfbwSjWMobcUNIFqsByZcz/4HWOV2mxKNDQ/FmkYrGnhNqyTSIB46EPPckrReBhF2EYhoVlC/4nWH7NWTBX7OxnBPZRa8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787679225; c=relaxed/simple;
	bh=zz7+m/XFvaCyh9sM/yu1NkCUrr2P3uDfYLbdRpy1i0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WGoyHl79r+WafIikps6pOTYHfvwMAOhXnL6X0yI0QYMXPO8+uyKBKh6+dEm03j/TDowoB9M8+K3zCtGuFpV95TiUw6YumrgZbtBqMKclT47105tOnF51KqascBe7AemX64b5zLPugTSfHXqBPq9R3qCsTW/2XBJOcfQ/0XPDS7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rUWl8SHb; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rUWl8SHb"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso7338885e9.0
        for <llvm@lists.linux.dev>; Tue, 25 Aug 2026 10:33:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787679221; cv=none;
        d=google.com; s=arc-20260327;
        b=Daed5qsaZXwWC8abzRBWCMwjs9yx+3BZ6DUtaeW1ZDCKRwLrTBjCVo/nL0HFKh1+e0
         s1Wqh01vXMM9RA7sXGl7MJRZjjKRbGHmrM237B0eLH33o42GvAH8n9aRSyTFRiCWgAES
         9EyT6Du/Vwb3EKduqu63k1CI7zEWXqlzz3AsQWNOqtpMdHkPlcgKf1VFb2P+INX77Amu
         gGp9sTn39vJPGQ7AriIF3AyTpLZp9lEiPnwAMrq6pkuPU7k24oSbQL7/Y4iiXOuwiaky
         +9P5B+GDM210byYXVLpsvI50Nfk7a1P85H2DrkqdpZmQb6aHC4mqi71s0+7fOG0C7rlv
         mbSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+C3oMNTxKING+oxnIVuwTvyrIfPtnlGjd1Gmndygo7I=;
        fh=tD/4lQHn5Xf8PtVCQdfdF+Tw1darByZk1G+d/4+cMUg=;
        b=C42XgWqo9gbTc39JizSNnJjN3XKkx2MVHwH1ljLSBLfZeRXzOMxnxC1hEjC+uBejU1
         0RBWRpI9uAyMbzyctBYlxebf0x9ueu3dyVgNu+EDqCZiZByTYEC6ZxhbSTFmgs18kSWk
         cjItqXQQ70ylLVKsU4cZFJSL8V8S7Xx+Hh36DrJ19FEi4JNu6k0g65ijT9AAX7OSxP6H
         YniC8Anu1UTW8YLPkeFzIgKM6G5WNUdfd7zOVBS+ZtK0WMhaHgOY797H3o7wgNVHI+jk
         4kyts7ayzR4GVZfBe7EuvHmiwlI01vQcylom9/pVjdu3iZK3UT24GX5f308aPvtfEUOk
         7VpQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787679221; x=1788284021; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+C3oMNTxKING+oxnIVuwTvyrIfPtnlGjd1Gmndygo7I=;
        b=rUWl8SHbwSwNWsXqcanvpbpZYAv97+ZMbvnPHwR48uptrxv27mRr28WGYrPnQomXI4
         +yU9gR2iP8yCYg6R8UZTTkY6t2PeLV0xpzhK7OcWamp7Xok9DgGN9U0jVAmGt5edg060
         UcdbQy/nwxci0kJHlRsIubyLFNh0633+93pHz5Q69MJ6OydHzeM8g1+ifOYOftx4egfh
         khIxp8YsLNlC40ah30+vHTxtqGUXB3Mt3DQwENp9dF9UZH8BLS9+uj6w27NiCGMRY6Pw
         ysMBZxkObLj1M41+2gLxLZ0v0s57/ZWnt1PAd3JprGbVId+ytd1e2tZ/MQjJasjyUUVq
         J2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787679221; x=1788284021;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+C3oMNTxKING+oxnIVuwTvyrIfPtnlGjd1Gmndygo7I=;
        b=QHNHl9dU7JivGnBVYwRUKeiwPDqQ6p7Vw61LrKEAsi0aLNKXqxEYFZr7OOsw8CM/9k
         JiBgBvWc9X7K30Zj/HjOKMXGz1KRbBSpD+yXHrpcJm0dqPGpNYNw+7VA6Uk4m2XLGn5Z
         TqeG4Qo0pprtu82AYWQvOWh4i86mIKFjkZgkXuScXC5be7oxQmoGGJoGqWoPselshGfM
         gUyyPJaL+7ohVzd0wUUYvdgCdqj4MjU8qzz/nEYrs7wiihScgQDjOGVAqtng09ohsTic
         UNRV3QaivESeM/xq2nbwU05pGIX1CsICVQfP6W1+t1YSivepLk18OiFv9elSvmjOqBtT
         4ong==
X-Forwarded-Encrypted: i=1; AHgh+RrTTYaJ3qc2h3A+xjZ/BpK+6Js+/9EcbUNqXBxmFJt4YyFWgdGp12/cBw5jVgMousv/pcl7@lists.linux.dev
X-Gm-Message-State: AFuF++mvUB5qK8MwlVo/1UUs+6TvkI6cBJDaPRVFdjGW7cdCJD8lD21x
	vxAZHV9VA0G+GQlLazrqJsK4q9v02QdirHgxw/nBQ5U1BqHEIDf0zqIFCuUulqqZ72W6SkXe+85
	jDcJ9KC7jd7IVrUe2YFQWN0uq1SDDwYqa/zRx7SFp
X-Gm-Gg: AR+sD13Yc2qIvG0L1w9Qk6zAVTUBMKpdO/j2bukdDt7qStNk8IVA51od3gE7jpLdvLa
	wBUkrB8JtZ9HsrFKwgpwxYMKRYvHwZ0EcGi6SPJuVS+df/HtuhjuwUbSco/tuL7+2FgWhlAog/9
	5oa/kJEIv+EGsozGUesctjludjxVv4/CP8mkhb0je+y3VTunemMQfip2HlzlY6nnaBoRDtO5Pdd
	JU6bsVYLJElJg9TVxAsXA7hSQjnc7FGP4gj0ukNLdetan+r2WLQTc97mqyhtSjxkhwDl9LIXZgY
	/mtDRmw83lhu7HByed3+GctnA1qZEpr3KaGc+bRqX1tZ+vuFX2KWAbCtDwhqd1a/Eg7U87QaEMz
	3P85/YIyzcI4FmHP988zobxDl5lZ1q1oeRTobYlFb1of898zKEruqo7GrCYBt+A==
X-Received: by 2002:a05:600c:4c9a:b0:499:b81d:f580 with SMTP id
 5b1f17b1804b1-499d630abbbmr70390245e9.2.1787679220347; Tue, 25 Aug 2026
 10:33:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <CABCJKudqGL+BFFcz3qsuoJB6S_OAt-vs2yqePC_=oy+JzmPpVw@mail.gmail.com>
 <3046e60d-509f-471f-bd15-3ce78c87500b@yoavmoshe.com> <20260721180950.GA3684684@ax162>
 <180001f5-bddd-4e58-8442-f7ef3c979500@yoavmoshe.com> <CABCJKufhvTxmVm8y7xr4RWWKsoZk0h8UGBnem+F5fknnimaqPA@mail.gmail.com>
 <7f273a08-b29c-4e15-b340-898b251efe57@yoavmoshe.com> <CABCJKud+GsBVv+XMTsi_4QAaTHo7jXD2Hyvi9wqKd7x3i2xyAg@mail.gmail.com>
 <415ffa24-a30b-43b2-aa6a-a1cde3bd4ef0@yoavmoshe.com> <CABCJKud9B8vB-J8f0HLHw6EgEKVWzy+Q1PrNxpO_6yCGtEyi8A@mail.gmail.com>
 <12a46993-82a5-4109-87fa-61b8fcf764aa@yoavmoshe.com> <CABCJKufoQ0fX797M01t7CkTgMEwNCELY1=ptZsxr=jWOR-KAyA@mail.gmail.com>
 <CAKwvOdnaOy-nyZ=8oLw4N-_hA9JZVdP2BhR8cweCAOhsy4VG6w@mail.gmail.com>
 <91cb0f21-e78a-4931-b123-937c6a01592c@yoavmoshe.com> <CAKwvOdk-JmqjhZWBiLjXTxKhEV+T3BAB6An+3Ara8oybmhAMpA@mail.gmail.com>
 <da6bffba-6c44-4ee7-a1a8-842f9e6de408@yoavmoshe.com>
In-Reply-To: <da6bffba-6c44-4ee7-a1a8-842f9e6de408@yoavmoshe.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 25 Aug 2026 10:33:28 -0700
X-Gm-Features: AcwNN1VhEAk5JMtsG9Q-WQf39WhqqMQXw7xm3opvD6bBF_aO5cN6dQw8NYVOTcc
Message-ID: <CAKwvOdmT=Q+etTTJUna4ZAg1=eXwaT9cSDy=U0s15UT-3TOu1Q@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 7:10=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com> w=
rote:
>
> Sorry it took so long, I finally got it to work using your method!

Great! (It's somewhat funny to me the level of effort going into this;
I love it. Keep up the good work).  It's also good to hear that we can
keep this working _with_ CFI still enabled.

>
> On 2026-08-17 11:58 PM, Nick Desaulniers wrote:
> > Can you share that diff? I would have expected that to work. Perhaps a
> > minor mistake in your implementation?
>
> I started with something very simple: using SYM_TYPED_FUNC_START and
> copying the 4-byte hash into OCRAM before fncpy(). But that didn't boot
> on my hardware (Kobo Clara HD, i.MX6SLL).
>
> I think the issues were:
> 1. My first attempt wrote the hash to suspend_ocram_base +
> sizeof(*pm_info) - 4, which I suspect overwrote the last member of
> struct imx6_cpu_pm_info, corrupting the memory controller setup.
> 2. Moving the hash after pm_info and offsetting fncpy by +4 still failed
> =E2=80=94 I think because fncpy requires 8-byte aligned source and destin=
ation
> addresses (FNCPY_ALIGN, with a BUG_ON check).
> 3. Offsetting by +8 for alignment also failed. I suspect it is because
> SYM_TYPED_FUNC_START emits the 4-byte hash after the .align directive,
> which shifts the imx6_suspend label out of 8-byte alignment, again
> triggering fncpy's source alignment BUG_ON.
>
> The version that finally boots on hardware emits the hash manually with
> explicit alignment padding, instead of using SYM_TYPED_FUNC_START:
>
> diff --git a/arch/arm/mach-imx/pm-imx6.c b/arch/arm/mach-imx/pm-imx6.c
> index a671ca4..b500922 100644
> --- a/arch/arm/mach-imx/pm-imx6.c
> +++ b/arch/arm/mach-imx/pm-imx6.c
> @@ -515,7 +515,7 @@ static int __init imx6q_suspend_init(const struct imx=
6_pm_socdata *socdata)
>         pm_info =3D suspend_ocram_base;
>         pm_info->pbase =3D ocram_pbase;
>         pm_info->resume_addr =3D __pa_symbol(v7_cpu_resume);
> -       pm_info->pm_info_size =3D sizeof(*pm_info);
> +       pm_info->pm_info_size =3D sizeof(*pm_info) + 8;

I wonder if it would be better to modify the `struct imx6_cpu_pm_info`
struct definition instead to add explicit padding there?  The comment
below about reserving padding seems to make more sense for this hunk
here than down there.

Like add a `u32 cfi_type;` member last, maybe?  That's not 8 bytes,
but I think it fits in the padding, then you might not need +/- 8 in
your pointer arithmetic anymore? I _think_.

>
>         /*
>          * ccm physical address is not used by asm code currently,
> @@ -568,10 +568,16 @@ static int __init imx6q_suspend_init(const struct i=
mx6_pm_socdata *socdata)
>                         mmdc_offset_array[i]);
>         }
>
> +       /* Reserve 8 bytes between pm_info and the function copy in OCRAM=
:
> +        * 4 bytes padding + 4 bytes kCFI type hash, so that the hash sit=
s
> +        * at fncpy_dest - 4 and fncpy_dest remains 8-byte aligned. */
> +       *(u32 *)(suspend_ocram_base + sizeof(*pm_info) + 4) =3D
> +               *(((u32 *)&imx6_suspend) - 1);

This is incredibly hard to follow.  This is copying the hash, not
reserving anything?

Is cfi_get_func_hash() something we can use here?

```
#include <linux/cfi.h>

#ifdef CONFIG_CFI
    // Make sure to clear the thumb bit!
    pm_info->cfi_type =3D cfi_get_func_hash((void
*)((uintptr_t)&imx6_suspend & ~1));
#endif
```

then remove the below hunk?

> +
>         imx6_suspend_in_ocram_fn =3D fncpy(
> -               suspend_ocram_base + sizeof(*pm_info),
> +               suspend_ocram_base + sizeof(*pm_info) + 8,
>                 &imx6_suspend,
> -               MX6Q_SUSPEND_OCRAM_SIZE - sizeof(*pm_info));
> +               MX6Q_SUSPEND_OCRAM_SIZE - sizeof(*pm_info) - 8);
>
>         __arm_iomem_set_ro(suspend_ocram_base, MX6Q_SUSPEND_OCRAM_SIZE);
>
> diff --git a/arch/arm/mach-imx/suspend-imx6.S b/arch/arm/mach-imx/suspend=
-imx6.S
> index 63ccc2d..c06e474 100644
> --- a/arch/arm/mach-imx/suspend-imx6.S
> +++ b/arch/arm/mach-imx/suspend-imx6.S
> @@ -3,6 +3,7 @@
>   * Copyright 2014 Freescale Semiconductor, Inc.
>   */
>
> +#include <linux/cfi_types.h>
>  #include <linux/linkage.h>
>  #include <asm/assembler.h>
>  #include <asm/asm-offsets.h>
> @@ -148,6 +149,15 @@
>
>         .endm
>
> +#ifdef CONFIG_CFI
> +       /*
> +        * Emit kCFI type hash before imx6_suspend with padding to preser=
ve
> +        * the 8-byte alignment that fncpy requires for the source addres=
s.
> +        */
> +       .align  3
> +       .4byte  0
> +       __CFI_TYPE(imx6_suspend)
> +#endif
>  ENTRY(imx6_suspend)

Should you replace ENTRY (and everything you added to this file) with
SYM_TYPED_START?  Or perhaps we should add a new macro to cfi_types.h
for this?  ENTRY_TYPED or something?

>         ldr     r1, [r0, #PM_INFO_PBASE_OFFSET]
>         ldr     r2, [r0, #PM_INFO_RESUME_ADDR_OFFSET]
>
>
> > How did you verify this? Can you share the command line invocations and=
 output?
> I tested each iteration on postmarketOS by building the kernel with
> pmbootstrap (Clang/LLVM, CONFIG_CFI=3Dy), replacing the vmlinuz on the SD
> card, and booting the Kobo Clara HD. The earlier attempts all failed to
> boot (though they worked fine in QEMU, which doesn't emulate the i.MX6
> MMDC hardware I guess?).
>
> I'm not really sure which approach is better now. The version above
> preserves CFI on the indirect call, but it's quite involved compared to
> the v3 __nocfi wrapper. If you think this is the better way to go, I'm
> happy to clean it up and resubmit as v4.

I do think it's better, but probably still needs revision.

FWIW, I still have a bunch of i.mx8 family boards in a box under my
desk.  I have a wafer gifted to me from my best man that we think is
some i.mx chip from his time at NXP.  Out of nostalgia for that line,
let's get this wrapped up neatly with a bow.

>
> Yo'av



--=20
Thanks,
~Nick Desaulniers
