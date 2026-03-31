Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F774C81
	for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 00:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774916274; cv=pass; b=C9A1DznXBzbNUiaqMexvhl47bdK6dSdFoYvW6sxyDKr0xMF63HVsiTJu8X+W2dtfXTQA1wTBZXoQwP8ggtbC2lZAZSaMSONjvOzw5qrn2KxjJ19MhD13E3Gcgk5P7nPxFL1+azIL/K1xmcbz/dCvPHBf/VfpTJxU0f2OWUGlMag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774916274; c=relaxed/simple;
	bh=n0+3yt8ogyNgCzzLsaG2fLhsr37EqQgBrSZLNfws7pk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uFvbh+5O+AhqjEPADMV1ByRxw6ri4vFkrXbdcDbOxG3iyKHStYQHkociTrWT2SJdxe4u/NnkRU41HkQDYU0A9g1InFAeVxN5S9XHG7KIpBG3R5o1my2tMAaowROsZW+eOJg0qvtHnUE/fDgguW+n8PEm4FG0cnb3o3J0cfVQKHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JljfpkpH; arc=pass smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JljfpkpH"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56ce1880202so3462889e0c.1
        for <llvm@lists.linux.dev>; Mon, 30 Mar 2026 17:17:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774916272; cv=none;
        d=google.com; s=arc-20240605;
        b=KKM5tXfGlHKd6Cz9vjgNy91V+s5lrEqo9b3HrTIemTN0LpQ7++f5WCWl/wrhYSkv/9
         sg70G53pDymrb3RVwc42/nKQsWvFeP9Wu3EuDXVGHPAxLuX/qWDFC0X2/CCsJNuACdwW
         eM5tCYstHNA4MWQGgcUGFCSsnYsq3TzaQ2w1ma8BtcB9x8HWqRkvf8O9e0TvtMFGtg1K
         Oaxgj5WmpsqF5jmj0sh8jvZgzD7Y8x6sxilah6e34mRXxt4EYpe4KXmlYvd4DeHVX4nV
         HtSY+wWTDFG6WR3xjLoqdGVj/cCVVl87PAb9eJvJITAIGM+0QzWaTEWnT6Z0sepdPP7t
         RzEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n0+3yt8ogyNgCzzLsaG2fLhsr37EqQgBrSZLNfws7pk=;
        fh=QGP6KoO3LmVYvNYtbLVlcjKSsVwIdl1LhM9qQlRMwFc=;
        b=BpiXelImfI3bcRQDVxk5DHwTn0WWkIzEu0P76oE6Z0e7OncUt4qH4TglPOORPLUWOD
         xkYs8qXIExmcpa385IQKNki7qELt2IHUF0SN/a2lxOSNmxJKxvJbWxW5ozM1ZxPEavWZ
         2FOFcTyIf+8aVNGlIUmAtg2q7RUZ9uSMei6JC2gk6xBwAoe8LRf2usGzq762hOBD6E/3
         NXgmEVAyPMfTPZ3XgY0rTMxAyh0Z5quwUXDNyXcGgwKSeylR8wTyYL885sEsQhiOD7M1
         CT4n/jpkJR/Yxi3kzK37+SIxBkeQP3XSUYV+APJFh0gLabLMyjpzx1ORxjDCg2m5D9fa
         Fmvg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774916272; x=1775521072; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n0+3yt8ogyNgCzzLsaG2fLhsr37EqQgBrSZLNfws7pk=;
        b=JljfpkpHDOGiyJMzv2klLRQZu0WKmxuYbp4urEINZYZce/1Vy9XX+brW1+253uY3IG
         rrJqWw9ixt/7DTlRwf48qWIv3USdEv729cCaLqZUmjFt+ikv/6Q+TD85fB5XiaMgsC1E
         dAOFC9Xe2qTBLjxqsyH3fb+K8dAUltczux5f2z4lid6BbOBpT+mXhLKEArGoQ9+S+gmu
         +vinDyrmwjtK6ux9eEQPc4W2fn3B5xGCkL5Az2NVve9kBPZr84s6j1cX0Ll6woAGEYVD
         DYP7Qh3Z7SlVqspwni1J/I/tY8rMxcSyRHTEC4GJYHmW7QGZn7hKibvp+ScE/dwztMAk
         SoQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774916272; x=1775521072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n0+3yt8ogyNgCzzLsaG2fLhsr37EqQgBrSZLNfws7pk=;
        b=MxYXwi94pI8fUjMISUxLNqqYa9kA2KE6tZfQPVcCdSRmxrWOV2L/zgijaHZVaRj8SS
         cLkXah38k3N1dXWYTcz17oiJ7GR5PgH64QpiN2J8V5uB7MOVqN064XdZs/jDqolkjjhf
         nIu8Kat+AlhpWXikTA1XJXw64yL6/I+agdZGSgGPY9jIY1A4S9TPHAXLy3IVpikg76T5
         IzwViDGtoktXfxU2ormvfyoHS1VDs4+GH6ne5PJZe+83fS+aFM9NyzHHND9MlhFkr+Q1
         MfCV8rQY9Pm++2CQX5F7tYDKfDLGQhglFEgh51kjE8srSAUcnJzIsCu+/sWYlCOEKj3v
         lTJg==
X-Forwarded-Encrypted: i=1; AJvYcCW3GJjgSLB7KvSCqGrckOJD5oCxMb3TXx7FSwRC1vk5LbycaGIzib0jswLUzXooiCbhgHZM@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9aJ3J2uHPdQ/Ddz3PT0W+z26sq06Z0tvNfFfbLDCCqDZ6X1P+
	8v4pDMkjW70IgJO9qoDREtpNLsOa1y3BZZFOmL7WVKpOcjhMk76qK7PJ61daaWil9B20dkMu9oj
	b1UUcUX45uTHn6fRg9iUsNH8gTV6IlPdMQR20CdAu
X-Gm-Gg: ATEYQzyZh0vaeZ4VNRl02HmKqGRrjF1qFfbXGEeM8pFPReQ6Exo43rRBCkWWm71seH4
	cp0Z6HbAeJMZFbBIY5PX+swnLNuZM+eSUf8XwDk1/V92e5gxf9anizF+fOkut5XXX5zOQBfME8V
	MwMyasvH+GcdlpZWC7wJ6Jy5ZS8bY+aPnUoVmzXTDc5SDLzGzGkA9rR5ObOeFqyCI065KZqEFJW
	cm2xbjXsDa+lESj2pV+BC4ZoRSJv8SQ9kkPFj01d3CL1onUv3p5ufgqqv+YP2FKxPQ7v2vncQwv
	ITm2El8=
X-Received: by 2002:a05:6122:4698:b0:56a:ef51:4cae with SMTP id
 71dfb90a1353d-56d4a4cab86mr6574629e0c.4.1774916271243; Mon, 30 Mar 2026
 17:17:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260327-kbuild-show-inlining-v1-1-730ac2cae571@google.com>
 <20260327221837.GA3622500@ax162> <CAFhGd8pWwbjjLt=FSaDtFysqRU5k_YozDgBFMJBN4YmnAEaktw@mail.gmail.com>
 <202603292059.01A4CB14F2@keescook> <20260330053604.GA879042@ax162> <202603301156.19EEEBE@keescook>
In-Reply-To: <202603301156.19EEEBE@keescook>
From: Justin Stitt <justinstitt@google.com>
Date: Mon, 30 Mar 2026 17:17:37 -0700
X-Gm-Features: AQROBzDfJ75j20Pt0fiuvNJg-VsI_kuMnBSed2bUkXNP6__lPP5g9i7kLDwy34I
Message-ID: <CAFhGd8qUoYnpfMcaUy8=Xde1hkch50MD6WMSsmc7BJqNXz1FyQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add -fdiagnostics-show-inlining-chain for FORTIFY_SOURCE
To: Kees Cook <kees@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 30, 2026 at 11:56=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Mon, Mar 30, 2026 at 07:36:04AM +0200, Nathan Chancellor wrote:
> > On Sun, Mar 29, 2026 at 08:59:51PM -0700, Kees Cook wrote:
> > > On Fri, Mar 27, 2026 at 03:29:18PM -0700, Justin Stitt wrote:
> > > > On Fri, Mar 27, 2026 at 3:18=E2=80=AFPM Nathan Chancellor <nathan@k=
ernel.org> wrote:
> > > > The compile time impact is not measurable (within expected noise). =
The
> > > > peak memory usage may increase by somewhere in the 0.5% to 1.5% ran=
ge
> > > > depending on build configuration.
> > > >
> > > > I bundled this under fortify to limit initial impact as its had
> > > > virtually no real-world testing and may produce unhelpful diagnosti=
c
> > > > notes under its heuristic mode. I don't expect folks to use `-g1` i=
n
> > > > the kernel (which would enable full-proof diagnostic notes).
> > > >
> > > > > If not, maybe worth adding a Kconfig option that is force selecte=
d by FORTIFY_SOURCE with
> > > > > clang or can be optionally enabled by a user?
> > > >
> > > > I'll defer to you on this one. We could add
> > > > CONFIG_SHOW_INLINING_CHAIN_NOTES or something similar?
> > >
> > > I would prefer to just unconditionally enable this when it is support=
ed.
> >
> > Agreed. It cannot possibly be worse than the status quo, right? :) This
> > feels very similar to -fdiagnostics-show-context=3D2, so maybe add it n=
ear
> > there?
>
> Yeah, similar. That'd be a good place for it. :)

Thanks both of you for the suggestion:

Here's [v2] :)

>
> --
> Kees Cook

[v2]: https://lore.kernel.org/all/20260330-kbuild-show-inlining-v2-1-c0c481=
a4ea7b@google.com/

Justin
