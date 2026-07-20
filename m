Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70096438020
	for <llvm@lists.linux.dev>; Mon, 20 Jul 2026 16:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784566310; cv=pass; b=S7zRvHUoPKMDHA1eogbFn/Lo0DSgaFb6o1yYU0O5SiE0uBSAcGfgRp+6aRk3TgWHHKHAMrW/DM/YWUg9y8ef4JSyIe0lGGKjhoXbK8OfUWglA+zB9M+erGDiHExaIbBNEr5gdEpBTMbGBPdRe72Y1ByRckQLWRpqe5wxGTmgeDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784566310; c=relaxed/simple;
	bh=h//PlCpI0ud1F5KsjJcqmQMXG40LlSIcqpcNuGnT1H4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OYD0HFcSIgCB6Sj7b6Wnm/unM8GWuZg8+9z+0MyC7XY7XirK0RuT53/SG0VsyRhun+YLUgpWaktva5SB7S9/2VF/KH5j0NXntsK3wvtPI4wpbR6v45/qNd0fqroJH76P0jNu8XdH2mlNVNGR8GWXiTdNJdfUHSl5d3TaDJghCw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CT4Pic14; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CT4Pic14"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c15cb6f5c12so1842317366b.0
        for <llvm@lists.linux.dev>; Mon, 20 Jul 2026 09:51:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784566308; cv=none;
        d=google.com; s=arc-20260327;
        b=rQ9zEPI6iih9cUn2BOdWVtfCAS3QcW5BGLW9eQ3WdatdX358sUBLyVbUDvA/6JA1Jl
         arUMGNgLnPVICmDBRFPAp8EM+jf3dAuXaiZVAPKodHAq3tpcBGhVddNNTLEgnLQ9iByB
         uAo6+Jc4a8XFljVZog8QN0bo7cikg+A9GrD755fqR0ani+pJ1QUNf/z1FEfxYM1nE61y
         og6ezKHv/JEqsFlyn2IyzRyIztpky1Q06h6VJu+f3TN6VlhZJyjNFHtc0vPQkl2jk+Zu
         AXoD1IH4/KURla8Ob03S3uRNd0gbTJ+3EXhTrVP979mXc+HujZoAbHfFKizUKD0HjDw3
         gdWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tY6y2m6mRP/UJJ+mAovKHgHIAfizO2XUbqAv58WxDvY=;
        fh=dIBY3Ngh1vLGBNF3lkP9248nWjNN9xcQfpDAqenXXGA=;
        b=MrByZ0mRbKNTm5JuxdTP4JcpT8LjuQTplhdTAkQTL4D3LXJXEbQDBv3Zp9AU/ywLUG
         Hzf/JH39YN5Vrb+qGLjg5yYAn6cKf8wisCR+wuVVawbLkZGJ6pnYywprVxQQ87cY+h0u
         03yU+NppuZsOh4Mp6S1GMaTJMyA918EwNqJlDMGwhwTKYkS09+STFerFm0M62rxxBCif
         cE9k5vPSYJMN2CkMxsP7dQvlUn9nuLUXfmni6aT++kfeiTwTGiLkPoZhdJWLd4uBYVY4
         UWpfdYhWY1Ewn8/uafwUnC+yiNmcpqlraY8LZ+bNTyLNoL7BbU2O7PLmSb7wP/SOUwN7
         oMYQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784566308; x=1785171108; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tY6y2m6mRP/UJJ+mAovKHgHIAfizO2XUbqAv58WxDvY=;
        b=CT4Pic140GKHNzB2m5HqIVr4N2+5CMn2HZV2ID0/M6zGJbTcalnzFRolpYpHpn7w1f
         kC9jeApjVGgbT5IxjjzlGfCESg8DRmKwFYr/Y/k+mbqzTASvxxWGooSM+f84wwvPp1NQ
         ipyfHezCFxpEPbYYrDD4WJMJhHe1B3j1KgtzpUyCCm06FTBjwHMNzatpTpbLs3Qj0N1n
         /6AfNdgRyBl3bDaFuOlTSBIgytOkwsX496rot2Ytau0nuy3JkSTXWcmCmkA8g60Hlibk
         V+P7/CPqDghwBTWOyG6dxsZ+oytLLdcMbGIeNhCWPRBMCctO39lWzrOWT2/j5PC+M//u
         nKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784566308; x=1785171108;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tY6y2m6mRP/UJJ+mAovKHgHIAfizO2XUbqAv58WxDvY=;
        b=lotUGAj2qSK2Zrs+b9KdPxl8jHLJl0faOW/vJdDQWQ9H4aGp2RnGvmKoEGItN4COZX
         jjBFC5VGdXUyZeec9fRkjx0lO4f2Y+yZlfPwjqzt4zl0wrr22xfVt0UBkolhl0NVA/3X
         Asa8yfWwI1Ys1Nc1NHYj3RXTkLXwFya+iHAPJdg12R6ubvGgSeB6Q82VQaXqoAmdSdLC
         HdfcJpm5YIbw32hdudRZ0ly0GPA8mdtZaeUii032esq/fDJU0uv9oWBvDMHi8XM+hDfn
         laLkqB6hEMb6qvJigf+1pRwTtGn6djjy7SLnxYQhJ5jMoKFdmnVVIR3jNL/vXQnalLCs
         +IcA==
X-Forwarded-Encrypted: i=1; AHgh+Ro2a/yK8XqNrGnhYO4XM1RTjOaZlAFUw8bs9LI1UsqJXNVOodXjosv50EVC/Ja+aK2Mov5Y@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7hNHMON9sWXmfhRjXHWi4/7A70cJrwyDoUX7oa2B5vY9fN3Sk
	K1m5f2AoMRkiC5J8nJLGp8o59UjmyQzu9qso21pD22ZO0KqL3+dJHMcVBEzAhYPqk6yevlT/+CR
	aKRD70aAvB4QJnzLAArJGpSJO6mAxBEJGA6d2oo2X
X-Gm-Gg: AfdE7cmwx09cyUy6JSCmpFwbVM0yahTGF4oDyiKRYeTZup1RYxv/Xabe9kGtOQjXGQh
	bIh1g0OUYFc+zC5Uf60CDhRD6fW3Y8MEnhELaErJtp6Tfx05CUb/XY4XSD6tGzZ/wrKRmO/zwyu
	TNR4SWAh3d5ccI16CtaclUIgi3SkA84elFbhaNj5kRe9MHiFcTpBGsimD57+A3xsHaGcFa5iPMu
	+P6qdxjmaJN7ATeuk82hJU7cXfwm9RPCz9631i/abqnTQGrQl1LWUeex9NWfZEmksSmmnQVh5yo
	OpMe+xJzXoVEAToHhhe5mFtbupfo02ud18lcxTIyY10H+JFFXJQh/I5vgHpAwJmPE1SYf49KgBq
	v
X-Received: by 2002:a17:906:ef02:b0:c16:5e73:b3e3 with SMTP id
 a640c23a62f3a-c16b46b6f5fmr615505966b.7.1784566307098; Mon, 20 Jul 2026
 09:51:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260717141648.1007059-1-linux@yoavmoshe.com> <CAKwvOdkGYLWAR+5q+XaO6VZc3-sGEm0nX0MvXoJOghx7Gn1tRg@mail.gmail.com>
In-Reply-To: <CAKwvOdkGYLWAR+5q+XaO6VZc3-sGEm0nX0MvXoJOghx7Gn1tRg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 20 Jul 2026 09:51:35 -0700
X-Gm-Features: AUfX_myHGrPuTu_ujS6tW3mC0SHvE_GdWe_YqayLYt46d3sdd9_DfoxWORNfKQw
Message-ID: <CAKwvOdn5xgtqv9NvMew0yBnH5E0xQMLaX+Z=bX3L_a9_K5orHQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 9:49=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Jul 17, 2026 at 7:17=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com>=
 wrote:
> >
> > Relocated suspend code in OCRAM lacks compiler-generated CFI type
> > signatures. When CONFIG_CFI=3Dy is active, the indirect call to
> > imx6_suspend_in_ocram_fn triggers a strict CFI violation panic.
> >
> > Annotate imx6q_suspend_finish with __nocfi to bypass CFI checking
> > for this specific indirect call.
> >
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Yo'av Moshe <linux@yoavmoshe.com>
>
> Thanks for the patch.
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Ah, looks like I'm reviewing v1, but there's already been a v2 and v3.
Disregard.

>
> > ---
> > Tested on a Kobo Clara HD (i.MX6SLL SoC) running postmarketOS edge.
> > Before this patch, suspending the device caused an immediate silent
> > hang requiring a hard-reboot. With this patch applied, suspend and
> > resume work successfully.
> >
> >  arch/arm/mach-imx/pm-imx6.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/mach-imx/pm-imx6.c b/arch/arm/mach-imx/pm-imx6.c
> > index a671ca498..d9b0c1803 100644
> > --- a/arch/arm/mach-imx/pm-imx6.c
> > +++ b/arch/arm/mach-imx/pm-imx6.c
> > @@ -360,7 +360,7 @@ int imx6_set_lpm(enum mxc_cpu_pwr_mode mode)
> >         return 0;
> >  }
> >
> > -static int imx6q_suspend_finish(unsigned long val)
> > +static int __nocfi imx6q_suspend_finish(unsigned long val)
> >  {
> >         if (!imx6_suspend_in_ocram_fn) {
> >                 cpu_do_idle();
> > --
> > 2.55.0
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



--=20
Thanks,
~Nick Desaulniers
