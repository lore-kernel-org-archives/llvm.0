Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6621B4144;
	Thu, 30 Jan 2025 08:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738227424; cv=none; b=izaa6QLK6io19f+x2zpgU0TGeJYhw5je/Ma7Wvh6TYRF8+hDjkdRUCZrb2yAxNWviEAzh/Ef4UzTXjcviWhAwUQolxdThUsOQmHr+6TrW26HYxSjXO8drqsnGaJcdczx/NbFlZi2g4jLH0GRJDqEWbCLiYG72zY/Sn8DkZiwUjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738227424; c=relaxed/simple;
	bh=H6AeHUVjoA+VFoeRyLlW4tNiCef23TVcyY1wg2oyQUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VHuLaO3K/SkZCEGq5t+7AMx+CaBx+OX3ZpufqJcKZDKeJnb8CVJ0MgsmQA4UcY9oabnm2qnhIoG44hb69KHggWUAc6fLaQZFTHXJ+ezQqclme2iQXHSM7AjDz2ZSK6/Mp8Ug4PnNnqLBDF/QppRYtIh+AHoe5Uaw5sSjCnDqR/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5174db4e34eso1057769e0c.0;
        Thu, 30 Jan 2025 00:57:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738227420; x=1738832220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ov2YCY989UGke35/WwFQcDGlSTiE2zF57DyCrlhClqQ=;
        b=XN5LnQqfpcZVH9y1jH9a9e7XxaVmrpUd77qMIUObFmfjbhpXk7ZLpJ5+psTAdgx/35
         ZLVseI5JCSM4QZYR3fARd6mosEJ+5cnjZXdu9P++gOIAUDYPCdsVx0wdRMVj7tVELNYA
         T720AlFwAeq4Yiuo498KiJhDG30xRGC3k4iIgVL/dGs2qP9bsTa243qqTZp3mq6ILHOZ
         u7Be4AIg1Mx+tJE0YAcV5DQbzCkyHyvx7k8V/DDNQsqtnFA7PKxw4ePH8j5BBdVTrPLR
         PD3QAIJzmOJL49pP6Sv+GoBXupKY9vNqXo4m3qT3f9QUrAuMTg+7yWtvktphaLXngS9b
         bm8A==
X-Forwarded-Encrypted: i=1; AJvYcCU1A/DTCkZ0qceCZXWZn0TOv1ylTWBEJIy8jOk+N+NGAcECK+hmQLGzZxUcdWRrdpvup2/+@lists.linux.dev, AJvYcCUIlM8cl4xDjI2sDqm8+5oCMYCARn6XjDo9kXHgiZSaA4B4xqc/gQ62Xv/4r0pCH76P96i7Mp15Uyeo2Fvj7w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxDJFe2idSvafvlw2XIKV/5TkeGJk0SGxdXODdQX9ow3twoOt1G
	paAuJWhcW4q8GCRSJ/ngKWkdI1TatswpQ6uLq6EHl1ZyvWCAXpro2rtVSNS3
X-Gm-Gg: ASbGncuka1WaRmjMFM+leak/C8tDEyJs+pPOWAfMa45io7jMLYbvW2UOmmXcdhEsm4y
	k+gJNbKoPkQ7evCFnxGtAriTZQrmZqrERFgGsk4keKh1ZDSdghROUOnmUJOyvIs/+71sJOLuIMp
	kT5Mxn4Uhs2YFbTFvT0f68Z4N8+48D9eDEUfyAEVaIIgbJo7BSJIJQ5KTb2U+UKlWD82sarRh/2
	yDScdvMqGZibxIm/Ww4y0d8/xxVpbi/eD2cf9vIOGD/mV7d2pqeIg0VO6c3gueXvwuas7vrY4qf
	jH4jTqYSi0xMECB6lh3xbrvUtYXfFRwaHcxiaeoj39bQwvIwBu93Gg==
X-Google-Smtp-Source: AGHT+IEH7n37TX5sqGX+7ZpTEfahm842Yx7eO1a3LmMYyAKRXyV+wtbhp6aDiUvpj4fW9CrJnovJRg==
X-Received: by 2002:a05:6122:2504:b0:516:1ab3:700e with SMTP id 71dfb90a1353d-51eaefedfc9mr1904212e0c.3.1738227420468;
        Thu, 30 Jan 2025 00:57:00 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51eb1d8adbbsm142405e0c.39.2025.01.30.00.57.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 00:57:00 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-85ba8b1c7b9so311096241.1;
        Thu, 30 Jan 2025 00:57:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVKvTsuotDf20SMvw60Koof1BjXh5Mybq/uCgTtT88wVA29WJihCWkTu5YN0zXFaAFK4PaC+Rp5S2QlxkBtDA==@lists.linux.dev, AJvYcCWSfHPdfuiQrSMTxmnR0aFDLyOseaNmuY7lHgq2y+GcmKC/nfyxi3PXK7eQyg5ioBaxpsk9@lists.linux.dev
X-Received: by 2002:a05:6102:442a:b0:4b5:c302:37b3 with SMTP id
 ada2fe7eead31-4b9b7187ff0mr2254180137.5.1738227420046; Thu, 30 Jan 2025
 00:57:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501291646.VtwF98qd-lkp@intel.com> <CAHp75VcOYyVx=wcopvi-0iA5XePsGOrNO1wUSzYcYB4q86=7gA@mail.gmail.com>
 <CAHp75VcUEaUSeu5K2GDbkgevTkFjR8=4ppw_e5FAy28iW=NhSQ@mail.gmail.com>
In-Reply-To: <CAHp75VcUEaUSeu5K2GDbkgevTkFjR8=4ppw_e5FAy28iW=NhSQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jan 2025 09:56:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVsCt=x_3KdHKHFmr9xgqcMvFNjKGjd4WNHx+LEwiEDOA@mail.gmail.com>
X-Gm-Features: AWEUYZmbGOlHaKJVd-BR1--srbTjC39-5HvMappwqGN083hGvwhvSO18LYQeNkw
Message-ID: <CAMuHMdVsCt=x_3KdHKHFmr9xgqcMvFNjKGjd4WNHx+LEwiEDOA@mail.gmail.com>
Subject: Re: drivers/platform/surface/surface3_power.c:243:2: warning:
 'snprintf' will always be truncated; specified size is 10, but format string
 expands to at least 12
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Maximilian Luz <luzmaximilian@gmail.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 29 Jan 2025 at 13:51, Andy Shevchenko <andy.shevchenko@gmail.com> w=
rote:
> On Wed, Jan 29, 2025 at 2:45=E2=80=AFPM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Wed, Jan 29, 2025 at 10:09=E2=80=AFAM kernel test robot <lkp@intel.c=
om> wrote:
>
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git master
> > > head:   05dbaf8dd8bf537d4b4eb3115ab42a5fb40ff1f5
> > > commit: 85f7582cd484dbf491b6d9bb2af6ef1467a024d2 platform/surface: Mo=
ve Surface 3 Power OpRegion driver to platform/surface
> > > date:   4 years, 3 months ago
> > > config: x86_64-randconfig-071-20241231 (https://download.01.org/0day-=
ci/archive/20250129/202501291646.VtwF98qd-lkp@intel.com/config)
> > > compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project =
ab51eccf88f5321e7c60591c5546b254b6afab99)
> > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20250129/202501291646.VtwF98qd-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202501291646.VtwF98qd=
-lkp@intel.com/
> > >
> > > All warnings (new ones prefixed by >>):
> > >
> > > >> drivers/platform/surface/surface3_power.c:243:2: warning: 'snprint=
f' will always be truncated; specified size is 10, but format string expand=
s to at least 12 [-Wformat-truncation-non-kprintf]
> > >      243 |         snprintf(bix->serial, ARRAY_SIZE(bix->serial), "%3=
pE%6pE", buf + 7, buf);
> >
> > 3 + 'E' + 6 + 'E' + NUL, that's how the compiler thinks about this
> > formatting string...
> >
> > >          |         ^
> > >    1 warning generated.
> >
> > I do not know how to properly address this because it's false positive
> > due to the compiler not being aware of pointer extensions used in
> > Linux kernel. The w/a is to increase the buffer if we can, but is it
> > practical? OTOH, this warning will be translated to a compilation
> > error in case of default WERROR settings on `make W=3D1` builds which i=
s
> > also annoying to people who want to have that clean.
>
> Actually using %pE implies that the buffer should be 4 times bigger
> than the input string. So, with the given format string the
> ARRAY_SIZE(bix->serial) has to be equal to or greater than 3 * 4 + 6 *
> 4 + 1, i.e. 37.

    #define SURFACE_3_STRLEN                10

    struct bix {
            ...
            char    serial[SURFACE_3_STRLEN];

Oops...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
