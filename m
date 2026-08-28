Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F293358D32
	for <llvm@lists.linux.dev>; Fri, 28 Aug 2026 20:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787948378; cv=pass; b=aP2/dCn22t2z9fABzf/t9xM3DhK3tt5E1rG4GVoBSShngnb+86vY2blTQ15U93vzsSPJvZFhREK1mq+tgMhRetyrtgN/YDxLoVD8VKFrnoTtp2QYecXhPoh00BCBse0xlddq2ehSqLIzv/OO/aWKkYo9v3nfNBiahjKFgL8pFUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787948378; c=relaxed/simple;
	bh=8opc2QShzrVS0PXZRlPRkpu6htUMy/gJ4UTVKwzCsDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nkgr9SOErkd9xooKzWqiktEUhK9ewh2ss9UZ/OXyGSY6owFbIsQZymKIG3AfHToIBFvmuPFsNiqD0ccdxTSsnI5kmZNYgLNXkQZdxpVj60n8y4Eq1bjP6fIdgb4TlAOypPFMhTHH5DKnX4D51G7+yff64q3Qi6GClVsTiam7mNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a1slBYzS; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a1slBYzS"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so835788f8f.1
        for <llvm@lists.linux.dev>; Fri, 28 Aug 2026 13:19:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787948376; cv=none;
        d=google.com; s=arc-20260327;
        b=kosSGHa/XCKzbNGWiIgWGSrDpq09IntXa4F9FS7+y69MwgtnbX/TBy7vqfwIVEPqW/
         IpkQZfp3hlo4JnDKv5z7akXeepP7KujYFfabXb4HDu7rPvZ2BrG3AWF1+enQOfNa8mP4
         /FQ6gQgRX4ZlCw73bItV3wyjR2gif0jIVrt9xvXCdHVsDP8si8cr9cM0NgbnYxrSlUbt
         rtPT2o5ZwglTo6gkVp5gt51q/2rANqTBrDhd5mtuq4QwUuRaI4LHz+w20ZjX6/jMeVn2
         mUSUyuEGQnr3uHBYER+BkR442OYwry2S4ug+7z1s7M3DGNqwP8tB0LFSlo3HEPNYBSwX
         XZmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AqevhQmDUlAlxZrxi7igRupcRfpHxunuXttW6NuOQbw=;
        fh=tXl4ltFp7S6wACSJImYZqETyKFfQME4GdZBHKFghCBk=;
        b=dqGbOPd0/HicC7SO7ioC++UqFsYMlek+DYwe/i/EIJetniT4WOlQZlLn8BkIklx8l6
         5kVKY/1QbG+yqN8dHS7APevfYKdBxs4n4gwxnW/lPrL2TOXiTn9u1iyJ3OO+ZTqbCp/5
         DaGOpiwYCyY12pfe/jOS6hTCdQfZkHv+RGJetaK0RCL+HwcEZubqNqCXD/bFIC61Szg4
         tB1wk6jL7iX070KB3fWfHhoCvJ9+fqMSRjaI/DE+K+26paQ68dtFwjQypB/1o5Hs/11f
         fSwe1AyZT3gscF/WbSbj8Rsh5PMIQYzQhgpMXv2gm13fB15LSjOWhSxWfhAy1n6bVXVT
         Ex/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787948376; x=1788553176; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AqevhQmDUlAlxZrxi7igRupcRfpHxunuXttW6NuOQbw=;
        b=a1slBYzSKomMjlDgKft0ykbD0TfQ0TLd1ZTu1uso3QnkjFXMyr/VuW9jVcPAHUjGX3
         NdqsgGKDF24Gv0aJriiNK+FPJOKwxVsO3v+Ei5oFL04XwX3NogSV0G4BuKd5C0eOA423
         7TJ0waN2QuscEFGoN0vaDvFH79tHGK6Wu2W/tO3stfjT8KuUaW9kt+NTx9PX9a8ldHHy
         6qrgYjnkkBiAp4BB99jXNE9LAzMbSEHbOFLwrrBLuEUoN/aP0k9wvjA0vPlbWwjeSeEq
         ub41aBcOBKQgljEHq2t6rtdP4a/YeaKJEB/V7O+XSQ0Kx1TuYzN6G3nnmPDalsMGrKKo
         49JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787948376; x=1788553176;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AqevhQmDUlAlxZrxi7igRupcRfpHxunuXttW6NuOQbw=;
        b=d3UwC+8RoK2ES6s/PxavI4DWwnIt42qb1rsUKcbriNGx8Gi9MTHYFKq71e+ZAtC9b5
         wbgabUlLE1sGvxTBrvwAZU1Ep1ieL0XRQRfjhpxjRSRd+WEJpcff+A5Xm49gQP1boKCS
         qlqC8hanmtyxYzR3zhbx32yOkUKQ7cDNfBoRccRRelR1OpqntVyJGkldTiLkHbep3Ayw
         p2IMdR78ZXQ+I5bbKgfBcmLkLWZzx2qT7+HuQ7VYuk8o9+CQFjmP32nBJZv9KY9Kg8FM
         B/2yZiCyU6omnCfpxHqB5BvvU4yHnLfKZtsqhBRC0nLu4ijwblrtPApkjN9+wFKRtO6e
         o4OA==
X-Forwarded-Encrypted: i=1; AKwUvBz6PhCeLscP0IyL6B/sD01lAWBGK+SZRkrVx3HousBOavfVEBfyeVwAE8UpMpW+3EuD2ihU@lists.linux.dev
X-Gm-Message-State: AFuF++kbeEFjJxWpBg4QstOLgdA6O+LnrdjefUzardsarq6lP/cUACJ0
	wp5otKbykVr0d5RSzeZc83ziMEBb6h9aE1T92Z0oc8btELWvQibjrQvwrijwpHCkXFRBSan7CeE
	9fF3/CPYNOKMj9Laq75Lt+HB8813zIyiIWYUBm7m5
X-Gm-Gg: AYBFou3BYZy4j96aUhK+zRHfl8MpnbCIyES3dJXlsdz8iTAXMMLrETgkFH7cj63rZ2B
	+9d2DJtWsHfJ39xXxDP471q2iBGWkHzIOdMcUfpmfI5nKrbRBGJisnJbZk6yRADFAhYPNqRUrpI
	QNALKjh2ZVt0Hi0YLsM6J+drC3GisNMn6t2qgE1zlUvgcaUqhtorxwPsSdqvrqYPQQFiBKTKJ6E
	77nkCHxrWCUOVvKAa/cHxaMRM50j07jXGOC0LUz5jY3+T4dmDss8mRp5tBe6nmElLRXES9ff/ef
	But6QPNMStwlkFFMuW8QLcOfBJcQXGZoEUSpmk3Mbl9zHR0NGFLARNcfA+98+ZqfCP9AwYCV19P
	gdInTSww/c6VXv2RBtApkKi76sBS9AhWP2DivHGCTyc6mLAVQO2xUD2QZ6Q==
X-Received: by 2002:adf:e191:0:b0:482:e6b5:61c with SMTP id
 ffacd0b85a97d-482f7983567mr15853702f8f.8.1787948375179; Fri, 28 Aug 2026
 13:19:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <20260827194508.446733-1-linux@yoavmoshe.com>
 <CAKwvOdkSZBbq=e916=efx8G-CTzZ5b31AhyUytO6eJjjkEdMow@mail.gmail.com> <CABCJKuc0cWWdkA7zrCcuze4AE-qTSETuUi-eRewPnn_ivHEADQ@mail.gmail.com>
In-Reply-To: <CABCJKuc0cWWdkA7zrCcuze4AE-qTSETuUi-eRewPnn_ivHEADQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 28 Aug 2026 13:19:23 -0700
X-Gm-Features: AcwNN1V_2kf8BqMVIZlH3wMy_YFAxnJPsfByyKc8QzliKU08PTCWPTO7ull2SPI
Message-ID: <CAKwvOdnA7Ej_uppSL7U2xwxyUQoDMvO+RArj4HCUSOziH0rCqA@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: imx: Fix suspend/resume crash with Clang CFI
To: Sami Tolvanen <samitolvanen@google.com>
Cc: "Yo'av Moshe" <linux@yoavmoshe.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 11:45=E2=80=AFAM Sami Tolvanen <samitolvanen@google=
.com> wrote:
>
> On Fri, Aug 28, 2026 at 11:29=E2=80=AFAM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Thu, Aug 27, 2026 at 12:46=E2=80=AFPM Yo'av Moshe <linux@yoavmoshe.c=
om> wrote:
> > >
> > > Note: linux/uaccess.h is included before linux/cfi.h because
> > > cfi_get_func_hash() uses get_kernel_nofault() and cfi.h does not
> > > include uaccess.h itself.
> >
> > Ah, no, we (you) should fix that. include/linux/cfi.h should IWYU.
>
> Nathan fixed this here:
>
> https://lore.kernel.org/lkml/20260604-tracing-fix-cfi-h-build-error-v1-1-=
b27015390901@kernel.org/

Ah! Then this series should probably be rebased or include that patch.

>
> > > -ENTRY(imx6_suspend)
> > > +#ifdef CONFIG_CFI
> > > +       /*
> > > +        * Pad the location counter so that the type hash emitted by
> > > +        * SYM_TYPED_FUNC_START() below ends on an 8-byte boundary:
> > > +        * fncpy() requires the function entry to be 8-byte aligned.
> > > +        */
> > > +       .align  3
> > > +       .4byte  0
> >
> > I still don't like these assembler directives inline like this; this
> > feels like we should have perhaps a new macro in
> > include/linux/cfi_types.h. Thoughts, Sami?
> >
> > One that garuntees the 8B alignment of the symbol for w/e that
> > function patching routine requires?
>
> Sounds like arm should override SYM_TYPED_FUNC_START to add whatever
> alignment is needed?

The 8B alignment seems to be a requirement of fncopy() for 32b ARM.
But functions in ARM can have 4B or even 2B alignment w/ Thumb, I
think.

Doing such an override would add unnecessary padding for each use of
SYM_TYPED_FUNC_START where probably none of them have this fncopy()
constraint.

```
    #ifdef CONFIG_CFI

    #define SYM_TYPED_START_ALIGNED(name, linkage, align)        \
        linkage(name) ASM_NL                    \
        .balign align ASM_NL                    \
        .fill (align) - 4, 1, 0 ASM_NL                \
        __CFI_TYPE(name) ASM_NL                    \
        name:

    #else /* CONFIG_CFI */

    #define SYM_TYPED_START_ALIGNED(name, linkage, align)        \
        SYM_START(name, linkage, .balign align)

    #endif /* CONFIG_CFI */
    #define SYM_TYPED_FUNC_START_ALIGNED(name, align)        \
        SYM_TYPED_START_ALIGNED(name, SYM_L_GLOBAL, align)
```
then this driver could do
```
// fncopy needs 8B alignment; see arch/arm/include/asm/fncpy.h.
SYM_TYPED_FUNC_START_ALIGNED(imx6_suspend, 8)
```
--=20
Thanks,
~Nick Desaulniers
