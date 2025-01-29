Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCF85C96;
	Wed, 29 Jan 2025 12:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738155085; cv=none; b=OJZ7jLmSXq8tpkDcOUiK1NzqTZxMCe/vzLZuN5Q9o2Uw+vrPr0mb2LlSxN7bC0YwuL2pAJwrBTpXVT7u5rOqDtrfOxiBHjYFfm7U8kW2aaZvmJPPxSWX6Z+tRqsNIgaWscUe1tUmQ/QW8fLuAY/eb/FiFEBBaCHBsDHgjv9NsxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738155085; c=relaxed/simple;
	bh=/BvvYMJVxHgyIQYJ25vJZnHAoKA2dprtmC8M8nyIzlo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nzFXauVm+ur0WXIP9iiGCQPPJBdeWdmoXFijjaAc1VPlM3pVHnlTL7weJC3r069vXO5MWIVJTHkuwV2FBWZGFiF7a2mAsoILzZyxH2vPjPKG896Laehn3ChnpzIrFOd1aQ5E7kPxJkuFRhH55sVLk3r8c9QaTBAC3adlabMJ5KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DODWrfnp; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DODWrfnp"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaee0b309adso335456266b.3;
        Wed, 29 Jan 2025 04:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738155082; x=1738759882; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FanCwFPzbcPnVRjW9s5tqNLHpgFG0FzkxFM4ckxI4js=;
        b=DODWrfnpAjMEG26simU6cwhx9f78N0RwcE6v6z7WTgqci48+oXcQj0AyN+D7CM3oww
         ldQRDk/3hP4BbiQy22ntMh8cSpaAwpePd559sQwshBtyOZUJmgMJUJYq99BEzGhhrSVR
         f5CFgKcBmwsGlGpQIYKsdHHD1eFKde28bm2Z0sbXXjhQLtmkpyI9ICl4PQi+lSHhDIiS
         ULCWogcOQoiFls80ijNcnXz3pgV1UI7PyMDSxVVMtuz0CNyt/7Jmo1flYu7Hk67W7rcB
         iviX2ViHw5+RuSYG7bNwtdbyYMRlIXuCakbcN16Y41XI8PQgy4/12T9x3cPMPV9EskqV
         SNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738155082; x=1738759882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FanCwFPzbcPnVRjW9s5tqNLHpgFG0FzkxFM4ckxI4js=;
        b=QFl1QQPEvkp6vQDeb1Ma2NUUpYD2pFA7Zw+bPyTr3ibs9T3qCAwyYEknL+LUv8DhPV
         gtdOZG3mtydYM+B/C9htPLz46zeeYVRAsMyVF70YE1KqTeIeX7rB2wJeodJFpuuGq7KW
         Tb/xTeq0qnl9W/0bGVXxr+EZt5UPqBMosCP3J6QvA1hBv2ikGoy8hflD/vlGbzsnw7bd
         XdPvbTIll4ztCX0ndjSo8KbJpKOzZn8kb9CmOVNQf8LBXPB7u+zo8PpU15nyCzu93qOd
         1k3Af5IDUmuyN8KwqUFM84OR6UInz6EIlVDCMBJwTglAChjriTXDJ/PqC5jU9xOhUUUP
         jmhA==
X-Forwarded-Encrypted: i=1; AJvYcCVEUn/7sdelWa2ASG32VU8J5mrIb+vW9Yhiiunz9q+9WONTOdoeECgupOFzfp4JCShFc06NlNuUgVw+LNjwIA==@lists.linux.dev, AJvYcCXb8yZ0jBLO2wk/K+xfEb5CarNj5hHAiuy2XFApjXEoKQWtRt8ZFBtoERimY8GjASAmHmZQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5EHo6LRL0SOVS/Ev1V6foNzEEBgVvKwo55DbJz6VUQPrtosKM
	6n3kizhv+muDpqbq1HJIIYcqAqMhimLqxeFac7jSyEXQ9ActPASdDRYnLpNgdXWb4vxzGJM8+Za
	9OenYCyX+PMhLAaGvHkLSy8Jkj8LZninkJQU=
X-Gm-Gg: ASbGncvBxapW3SmHmtcGqoIQ8SVt0C/B54/BoR2beyAIaIpeOxEGpMyNEx0Tik+0qOu
	Fd0of3jsiYNQdDeC5sUG0mr4ueMbkgP80XFBHUiXBT5UrufbUJ/WZibp5VycCIcm2zZlZICRn3n
	w=
X-Google-Smtp-Source: AGHT+IEcGWLKcr+am9UM30QmyJxngJATQyXwiUm/mspZNyTEJR1JppSBetjluBtyM3FoBe1JX3Hz7xp7J6CubfHqGD4=
X-Received: by 2002:a17:907:1c21:b0:aa6:80ed:e9a3 with SMTP id
 a640c23a62f3a-ab6cfdbc4demr324382866b.35.1738155081884; Wed, 29 Jan 2025
 04:51:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501291646.VtwF98qd-lkp@intel.com> <CAHp75VcOYyVx=wcopvi-0iA5XePsGOrNO1wUSzYcYB4q86=7gA@mail.gmail.com>
In-Reply-To: <CAHp75VcOYyVx=wcopvi-0iA5XePsGOrNO1wUSzYcYB4q86=7gA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 29 Jan 2025 14:50:45 +0200
X-Gm-Features: AWEUYZmW_0VbPnN6nRm6EhSLIDCGBxPcf6z0HbvMFPUaLWrUoSom5VktXE6dlkU
Message-ID: <CAHp75VcUEaUSeu5K2GDbkgevTkFjR8=4ppw_e5FAy28iW=NhSQ@mail.gmail.com>
Subject: Re: drivers/platform/surface/surface3_power.c:243:2: warning:
 'snprintf' will always be truncated; specified size is 10, but format string
 expands to at least 12
To: kernel test robot <lkp@intel.com>
Cc: Maximilian Luz <luzmaximilian@gmail.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 2:45=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Jan 29, 2025 at 10:09=E2=80=AFAM kernel test robot <lkp@intel.com=
> wrote:

> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> > head:   05dbaf8dd8bf537d4b4eb3115ab42a5fb40ff1f5
> > commit: 85f7582cd484dbf491b6d9bb2af6ef1467a024d2 platform/surface: Move=
 Surface 3 Power OpRegion driver to platform/surface
> > date:   4 years, 3 months ago
> > config: x86_64-randconfig-071-20241231 (https://download.01.org/0day-ci=
/archive/20250129/202501291646.VtwF98qd-lkp@intel.com/config)
> > compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab=
51eccf88f5321e7c60591c5546b254b6afab99)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250129/202501291646.VtwF98qd-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202501291646.VtwF98qd-l=
kp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> > >> drivers/platform/surface/surface3_power.c:243:2: warning: 'snprintf'=
 will always be truncated; specified size is 10, but format string expands =
to at least 12 [-Wformat-truncation-non-kprintf]
> >      243 |         snprintf(bix->serial, ARRAY_SIZE(bix->serial), "%3pE=
%6pE", buf + 7, buf);
>
> 3 + 'E' + 6 + 'E' + NUL, that's how the compiler thinks about this
> formatting string...
>
> >          |         ^
> >    1 warning generated.
>
> I do not know how to properly address this because it's false positive
> due to the compiler not being aware of pointer extensions used in
> Linux kernel. The w/a is to increase the buffer if we can, but is it
> practical? OTOH, this warning will be translated to a compilation
> error in case of default WERROR settings on `make W=3D1` builds which is
> also annoying to people who want to have that clean.

Actually using %pE implies that the buffer should be 4 times bigger
than the input string. So, with the given format string the
ARRAY_SIZE(bix->serial) has to be equal to or greater than 3 * 4 + 6 *
4 + 1, i.e. 37.

--=20
With Best Regards,
Andy Shevchenko
