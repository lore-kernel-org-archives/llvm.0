Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A17A37A498
	for <llvm@lists.linux.dev>; Fri, 31 Jul 2026 20:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785530384; cv=pass; b=h8Av+YSq0yuWX6HaEiw0dpzmN4QyxPiJ5HVbvfdQ/e1ZMwZH1HKbFegEPwF5sX9wURxNFw6oPHtlv1/AKjkhMNwoRkmGjOSiboiVmRLDHRwn3UJp/1BAk8b8NdlFqxgmD9ILlbdHvlyULF08y5Tv4RS80tXU8LkPa+8h/WqZ7Rw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785530384; c=relaxed/simple;
	bh=H8MZFv0NlxX8AAFiW92wo8pS7F9Nxis4TWuHY0ym0Ls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FTxm/C0f25EWC+Byqd71YKRILV4YCAoKvHy2b9pjIr++6UN+dNfikkRlY4bOgCAO1xGlbJ4Qxr5pTgr7wTYmwcY0iaSNHmKe9w1o4TIHLWnbiojsPQRGCTMzGiHmXIDDoxuJqsf9Ksf6oRIRDy+a8J4VgDJJT0ltxI5ZqOfZvaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4EhRfum; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4EhRfum"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a051904222so2201450a12.2
        for <llvm@lists.linux.dev>; Fri, 31 Jul 2026 13:39:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785530380; cv=none;
        d=google.com; s=arc-20260327;
        b=mYpmx79Ri56g7J1rAHIqOfMt244K8TqMxR0n4mJ+CPQ0HsKpahOWVb34yXkb2fAohm
         7VT7gq/ffyRwR7lJAGL2DXSnGuHgMefKLWoWJDFz9q9nOOtQWEMd9CY6Nrq1hzMnNTxN
         JH9yF0Wob24cjZ6QDGMporH/y9ggKXSD9uwsuhmUFZpaCJOdfw+9cs43pj+dWqGBOnSx
         bgKQ2queTZAgGFE6w3ozvu3C2X8J6a02yB2IPY4i7cOLeLnVgsGD3eIqCy5nQfovHH7B
         by5wnWQTumxypVJxwIJ3e2mlGWMNXSUIoJh0KEBFLHZrzjc/SM3Gp5oK8meQ6+qTdOZd
         o00g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FNr3QEOyUa22hJiDCuM7GWGwzbMpwlCTnE3ShI9qpY8=;
        fh=kJqV+iR/FCNxztoxVqeS/feJhM0Q/m0c4gH/wcoEkaE=;
        b=NhsrQZI59J1kJqDYc9AQALes16yqw1D58Mh2N/kZbs+ABGQDncvjUrn4CStS6gLWGf
         Dfgi9xj6Viaylfx+aq6OmlJ5gcLY+ZxZxvBSFhGxtEBK4CVaubgayS8xq2ayKX449sLm
         y7GrCTq5N/qfUq/XIw30MQaYOM/vKP4/Gp/GO3TMWpFgA1DD6LptOmFkCiRAQUy1cAsq
         HAe3rEYcLKSRMrDBouDGZM3DPpxK/F3vii7KgfuoCVNsUoPxUlFJ3QxgTvuowRcHf8i3
         78pOj96JYpo0PRWnsVFDdNPbSM0HvgL4yg3eJfAMb6IWD6USDFoz7YafaGpF0cqfqx/x
         i+dQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785530380; x=1786135180; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FNr3QEOyUa22hJiDCuM7GWGwzbMpwlCTnE3ShI9qpY8=;
        b=W4EhRfumj3QZ6KmvUVPUuNLtXNjVbEaJmbYaqPzbOmaQ3zlUqZSghE2QzrsUZtrCoU
         MyOcyVvQ/m9lka0fXCX1rwk20Z2wR8UO9kmUWF3fbzzfdyAcDR6cWgQ2DT2YtTQFXtTH
         CD9QILhipL6joQPFGel7ldpcBlX7xzu34q4Za1+oPoAY9i1g32ZLx4XXYTtaIYlD3WPF
         UtCUTdky7QG7oMUhfBGehzOnDNsQr6UZVNm7LLBCU18eMEz3lxcFnIKNBfKBx3P/yPY3
         uFI046kiBBSAu/36tA3zNqqPsYiuGRLpaEOGeEjvf1aZ2ePDC/ngNEExlQRtkF1y4NYX
         EM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785530380; x=1786135180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNr3QEOyUa22hJiDCuM7GWGwzbMpwlCTnE3ShI9qpY8=;
        b=rPqVNPG4nNUrp4U4Rs0c46+mtVmkQG56EY/LN0GVQ3ly6yOt/45t46yRyvzfyuKEr6
         KzFXw+Y6sd2nUZTbzI3/4aNnUARCwChFPF4aGe30R+Ki7EDLHxU7pKO1X74Duo1emKxS
         POyJK3bPvjijOdLOzvm9cG1Neyh4/fxMGDdcyN/ICbfCKAamhEI5h7reIa0v9YW/KtZq
         SzJFg8nlXfYMhXb04t61kOQ+zPg99kmlATZZpY4uz2x6c9FLFcDmUNznjm805YVBeolR
         DeBLldklyI549bYMno3OZ8V5RouH3Ovz/9HB4+uQfeHG7dpJiyUDPixcgDTBYuwZAlOl
         Fsdg==
X-Forwarded-Encrypted: i=1; AHgh+RqnIFVomrD97Z9EcoiszbcvbLu27xrMN0sCTEbnR8vRj4Uyv3xEsNqh5Kc+YWymfSGRc3CF@lists.linux.dev
X-Gm-Message-State: AOJu0YxVjxUxIwyZfa501ssMWZ6gZInzf/e79wRGv7gvC2fljGiO474d
	z/oszyFzkr/NiDg60oAzDdYvIziH0jvDWFeblSTscJbSDdoesxQl+WswkkHyymDf9la3eBp5tIf
	bHzFBOpoYYq1AwnlW8SeLO7Tui7P4ptk=
X-Gm-Gg: AR+sD12faQy9kSTRK1yeW8e4bfG4ocKhLic8PYxm5qALi2q9no1wRGhQA8uysv2U+j4
	CiKzTNUsMKXhGapKWwi1ipn/HC+ExQFvAwPhhOISHVC8rpTDEQZFiE6El6NuUkiVVpMe8mPspyf
	ABrBTgYE3rRg4/jr2vhYBmJK/PGTsjOGTgFOKGWFAFIxzCBgpnOIgOiPUOuUi6AQj5Elq6IaU59
	LjZ5de+auT7YyYxhzsTpig6MGYoD9Ev5FCSZsa1GSx3EPYjUmMD3UFXjU7J7nn1H6Y3TIT/EjWu
	KyUAi1s1K/ljwQh5uJn8mw97JSIuemINlVulEEW7IQw+8iBEknmA3QF0Jvd6t0ByCYWKhCWqVWs
	s4xQHbilPAsX6kzXKq1Jjkh1HCQ9+1NUC7jAAHMPr60UXHnrIwy1pYbVAClpzNZY38lYQlLqZhN
	uCCd6tKAT0uKu6EX+az9ayTXUo095DHzHCis9G2M0i5U7JSLLDRDk5Kr8=
X-Received: by 2002:a05:6402:40c9:b0:698:56e7:8eb3 with SMTP id
 4fb4d7f45d1cf-6a0a7c72578mr560606a12.14.1785530380407; Fri, 31 Jul 2026
 13:39:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260731012130.1212640-1-rosenp@gmail.com> <20260731012130.1212640-4-rosenp@gmail.com>
 <amy3yueMqBFVCz3T@SMW015318>
In-Reply-To: <amy3yueMqBFVCz3T@SMW015318>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 31 Jul 2026 13:39:28 -0700
X-Gm-Features: AUfX_mytarzAXc_eavVZLWZPAYjlwauapJxxWfxCCdbUg0_v8GNzgaIDe_yz5Tw
Message-ID: <CAKxU2N_+tBqqngTepnTQy7his_2UTAAc36cMjgfZsOG94ryt+A@mail.gmail.com>
Subject: Re: [PATCHv2 3/3] EDAC/fsl_ddr: restore MC error registers on probe failure
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-edac@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, York Sun <york.sun@nxp.com>, 
	"open list:EDAC-FSL_DDR" <imx@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 7:57=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Thu, Jul 30, 2026 at 06:21:30PM -0700, Rosen Penev wrote:
> > fsl_mc_err_probe() clears FSL_MC_ERR_DISABLE and, in EDAC_OPSTATE_INT
> > mode, sets FSL_MC_ERR_INT_EN to enable error reporting. If a later
> > initialization step fails and jumps to the err/err2 labels, the cleanup
> > only frees driver memory and does not restore these hardware registers.
> >
> > This leaves the memory controller configured to generate interrupts whi=
le
> > no handler is successfully registered, which can cause an unhandled
> > interrupt storm on the shared IRQ line. Restore FSL_MC_ERR_DISABLE,
> > FSL_MC_ERR_INT_EN and the SBE threshold in both error paths.
> >
> > Do not pre-initialize orig_ddr_err_disable/orig_ddr_err_sbe to 0; the
> > err path must only restore registers that were actually modified.
> > Split the error labels so early failures (before the first hardware
> > write at line ~~580) jump to err_free, which does cleanup without
> > touching hardware registers. Save orig_ddr_err_sbe alongside
> > orig_ddr_err_disable so the err label correctly restores both
> > registers, avoiding stale bootloader state clobbers.
> >
> > Built for arm64 (defconfig + CONFIG_EDAC_FSL_DDR) with LLVM=3D1;
> > drivers/edac/fsl_ddr_edac.o compiles cleanly.
>
> You can put this after ---, this is redunctant, every patch must pass
> build.
Will remove.
>
> Frank
> >
> > Fixes: ea2eb9a8b620 ("EDAC, fsl-ddr: Separate FSL DDR driver from MPC85=
xx")
> > Assisted-by: opencode:hy3-free
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/edac/fsl_ddr_edac.c | 14 +++++++++-----
> >  1 file changed, 9 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
> > index c505fb268474..139277c4e2f0 100644
> > --- a/drivers/edac/fsl_ddr_edac.c
> > +++ b/drivers/edac/fsl_ddr_edac.c
> > @@ -577,23 +577,22 @@ int fsl_mc_err_probe(struct platform_device *op)
> >       pdata->orig_ddr_err_disable =3D ddr_in32(pdata, FSL_MC_ERR_DISABL=
E);
> >       ddr_out32(pdata, FSL_MC_ERR_DISABLE, 0);
> >
> > +     /* store the original SBE threshold */
> > +     pdata->orig_ddr_err_sbe =3D ddr_in32(pdata, FSL_MC_ERR_SBE) & 0xf=
f0000;
> > +
> >       /* clear all error bits */
> >       ddr_out32(pdata, FSL_MC_ERR_DETECT, ~0);
> >
> >       res =3D edac_mc_add_mc_with_groups(mci, fsl_ddr_dev_groups);
> >       if (res) {
> >               edac_dbg(3, "failed edac_mc_add_mc()\n");
> > -             goto err;
> > +             goto err1;
> >       }
> >
> >       if (edac_op_state =3D=3D EDAC_OPSTATE_INT) {
> >               ddr_out32(pdata, FSL_MC_ERR_INT_EN,
> >                         DDR_EIE_MBEE | DDR_EIE_SBEE);
> >
> > -             /* store the original error management threshold */
> > -             pdata->orig_ddr_err_sbe =3D ddr_in32(pdata,
> > -                                                FSL_MC_ERR_SBE) & 0xff=
0000;
> > -
> >               /* set threshold to 1 error per interrupt */
> >               ddr_out32(pdata, FSL_MC_ERR_SBE, 0x10000);
> >
> > @@ -621,6 +620,11 @@ int fsl_mc_err_probe(struct platform_device *op)
> >
> >  err2:
> >       edac_mc_del_mc(&op->dev);
> > +     ddr_out32(pdata, FSL_MC_ERR_INT_EN, 0);
> > +err1:
> > +     ddr_out32(pdata, FSL_MC_ERR_DISABLE,
> > +               pdata->orig_ddr_err_disable);
> > +     ddr_out32(pdata, FSL_MC_ERR_SBE, pdata->orig_ddr_err_sbe);
> >  err:
> >       edac_mc_free(mci);
> >       return res;
> > --
> > 2.55.0
> >
> >
