Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC33154BF0;
	Thu, 30 Jan 2025 16:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738255899; cv=none; b=nHFBvZpfCBwrgmitiHvnVxQVSo9gyCY6LymFGidTlE+HbosI1HRIS34kiHRhOk2Dd9P5cL4LreaWEUfL+gv/IBE+yMNnxKxR1Nk9Gh3wyNGdnSHRMVvyQ+pjU555hv2wl8QVOLwG2GRI8u6jvUZGZvicdikhufnx6zonnMMpl2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738255899; c=relaxed/simple;
	bh=2bRUWw2O9Noy/C1Q5lFO5hLXAY9YkzOTUGuuFGIficY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FkAxvWRel24P/vgrZSJsPJ74ilGlU3xDsFpXWzKRILaXAQQkUR76z7Zj+Z4DXgWMPSxy68iJHB834fB+sxbOEi19hBq9aYQ32hEdTWcuSw9ka8Da5cZbsiQ5+53J1nlKrukmFwYUPkjzpg0A9BF0zhf7GjcpfQvJTjmf+3MlypE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+65w+8R; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+65w+8R"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ab2c9b8aecaso177156266b.0;
        Thu, 30 Jan 2025 08:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738255895; x=1738860695; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81HSDWEdiMAQgD6KhXnAvyTh/gnHSXEcWZxUzDH+tPE=;
        b=D+65w+8RXgmglZANiHqlnFd2nip3gapAR9tVJtn3Zbu62aNusSccquPOlfgq0j8++w
         Xi/HNiNSeigVptqLv0eCykmWi12Ekp99OFhrnZleAGf9GgCAVqUymnXXW6qQCtANIbkU
         i7FuSSSa/CwfBBhGMrRAlmMq2BPTPh1tA0bRT48azMfIq/BwWhnDXqv2JLXy0UdXIrvD
         mm7eAXK07uduekG6dZ1COdJIaHVqPUExv1t/hca6BuKR9r695hcKpl7iipIkuyzgjmRl
         y2PDVblMP+5cUVlGhi8z4PMOglx0UCOwGryYVCNol6b9+koZiJ77ugBaHWhcUsix5yLG
         oP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738255895; x=1738860695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81HSDWEdiMAQgD6KhXnAvyTh/gnHSXEcWZxUzDH+tPE=;
        b=c5gc07XRnNT8PNcMY6uXUIhBFScfbOkupc8Vj9jo6o7dG1wdWBYX3wShLHNrJRSdjK
         4kCwxnDkIpkUM0cRzc9QyGWSc4G3zNtILKBTpk2zZ0rwKtz3++/6PwBCmCast98iQuVu
         ln+mWNMJHFE5QysW8226tNFDFKRB1Kb6bB3gx8Gd0soUxhl0f6JRpusHaB+TpnDJrnwB
         x3D1YdY9+5ph7SISQz27UVFwLt/6bopQCCngAYeWGvViSssM0q1HbaBce33N7qP+WRCT
         CKMkru2gecAQOiTUjckzP9RXNlCFx5Q3XM+TCMY3Aqrp8wacgKiG2FyrQl8GzipWCTkO
         GirA==
X-Forwarded-Encrypted: i=1; AJvYcCVBh9VEEYKamt8ja5BRtCHNOWsNAwAkkewvfgRNBkwcNTDbh5Q7dgCIMSiLuuKkyhvh9J09GC9iE//t3ARoFg==@lists.linux.dev, AJvYcCWSsVYcZZQ5cpa7/2ei4R6E64wisfyTz0eLq5yoxu+2ABev+PpJY2RvsL8b/nmRmWZy34jN@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4nFQEG9Mi8wL5NIsONsLfiiBAOZLccE2ua4qYUv3Amcz8L2+r
	dISYT/9av/lH/dPtdP83DJsI5yMAjLouwhGxJeKpEUGMdNcDC4d7uSMm0OHXo5bYqn35NkKTKOG
	ZTXqSkTWZFfiYSspItYCMzYbz5ZY=
X-Gm-Gg: ASbGnctQqnwUDqYiKUzR3XNdtvRbmDLo7DpNdQ6rALhWLfszvNiAG/ICB6BZLG46Hnj
	julNdgVhCO/tFrzrd1lD2LkA0hB57kM6QHQDt3arkCV687QcwSLZ9O25dzEf50mUm1dr1rrne
X-Google-Smtp-Source: AGHT+IHcvuC0uEwgAU5Pv5wffcB1EVUbDGkSKyYmw4kAdumq2eCkcdMgs4YHeNNiGeLdokpjp5siFjdtJlL/G8kwOXw=
X-Received: by 2002:a17:907:1c13:b0:ab6:36fd:942a with SMTP id
 a640c23a62f3a-ab6cfe27037mr883979966b.50.1738255895318; Thu, 30 Jan 2025
 08:51:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501291646.VtwF98qd-lkp@intel.com> <CAHp75VcOYyVx=wcopvi-0iA5XePsGOrNO1wUSzYcYB4q86=7gA@mail.gmail.com>
 <CAHp75VcUEaUSeu5K2GDbkgevTkFjR8=4ppw_e5FAy28iW=NhSQ@mail.gmail.com> <CAMuHMdVsCt=x_3KdHKHFmr9xgqcMvFNjKGjd4WNHx+LEwiEDOA@mail.gmail.com>
In-Reply-To: <CAMuHMdVsCt=x_3KdHKHFmr9xgqcMvFNjKGjd4WNHx+LEwiEDOA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 30 Jan 2025 18:50:59 +0200
X-Gm-Features: AWEUYZn0zOWPpu25GOiVPEugFi9n6vxgdNY0v-zO10JxexKk9vaGfgUqQMagZZw
Message-ID: <CAHp75VecdT+p3GANoYphVea67j6mFSXAPSxvO=fNjbcha8o-jA@mail.gmail.com>
Subject: Re: drivers/platform/surface/surface3_power.c:243:2: warning:
 'snprintf' will always be truncated; specified size is 10, but format string
 expands to at least 12
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: kernel test robot <lkp@intel.com>, Maximilian Luz <luzmaximilian@gmail.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 10:57=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Wed, 29 Jan 2025 at 13:51, Andy Shevchenko <andy.shevchenko@gmail.com>=
 wrote:
> > On Wed, Jan 29, 2025 at 2:45=E2=80=AFPM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Wed, Jan 29, 2025 at 10:09=E2=80=AFAM kernel test robot <lkp@intel=
.com> wrote:
> >
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git master
> > > > head:   05dbaf8dd8bf537d4b4eb3115ab42a5fb40ff1f5
> > > > commit: 85f7582cd484dbf491b6d9bb2af6ef1467a024d2 platform/surface: =
Move Surface 3 Power OpRegion driver to platform/surface
> > > > date:   4 years, 3 months ago
> > > > config: x86_64-randconfig-071-20241231 (https://download.01.org/0da=
y-ci/archive/20250129/202501291646.VtwF98qd-lkp@intel.com/config)
> > > > compiler: clang version 19.1.3 (https://github.com/llvm/llvm-projec=
t ab51eccf88f5321e7c60591c5546b254b6afab99)
> > > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci=
/archive/20250129/202501291646.VtwF98qd-lkp@intel.com/reproduce)
> > > >
> > > > If you fix the issue in a separate patch/commit (i.e. not just a ne=
w version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202501291646.VtwF98=
qd-lkp@intel.com/
> > > >
> > > > All warnings (new ones prefixed by >>):
> > > >
> > > > >> drivers/platform/surface/surface3_power.c:243:2: warning: 'snpri=
ntf' will always be truncated; specified size is 10, but format string expa=
nds to at least 12 [-Wformat-truncation-non-kprintf]
> > > >      243 |         snprintf(bix->serial, ARRAY_SIZE(bix->serial), "=
%3pE%6pE", buf + 7, buf);
> > >
> > > 3 + 'E' + 6 + 'E' + NUL, that's how the compiler thinks about this
> > > formatting string...
> > >
> > > >          |         ^
> > > >    1 warning generated.
> > >
> > > I do not know how to properly address this because it's false positiv=
e
> > > due to the compiler not being aware of pointer extensions used in
> > > Linux kernel. The w/a is to increase the buffer if we can, but is it
> > > practical? OTOH, this warning will be translated to a compilation
> > > error in case of default WERROR settings on `make W=3D1` builds which=
 is
> > > also annoying to people who want to have that clean.
> >
> > Actually using %pE implies that the buffer should be 4 times bigger
> > than the input string. So, with the given format string the
> > ARRAY_SIZE(bix->serial) has to be equal to or greater than 3 * 4 + 6 *
> > 4 + 1, i.e. 37.
>
>     #define SURFACE_3_STRLEN                10
>
>     struct bix {
>             ...
>             char    serial[SURFACE_3_STRLEN];
>
> Oops...

It works because IRL we haven't seen the broken strings that %pE
escapes with help of an octal code. But if one doesn't trust that
input and uses %pE they should provide enough buffer for that
translation to happen.

--=20
With Best Regards,
Andy Shevchenko
