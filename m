Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29761397937
	for <llvm@lists.linux.dev>; Fri, 28 Aug 2026 20:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787950255; cv=pass; b=C2FDa1pWDcdR3tU7nqGWWHy2usEthzjdF//JlPau50txCdM4YpCykEx9k4U5bLI1yByYbqVAJXjxEVcHw/T7BrGFhm9HSTlu2OIMn5ALp68NABbjAArXYrzah3/XjP/40hmTp86KPzTybmIe1GvxJ4dbc5Gme2d0DKfTBBRVJB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787950255; c=relaxed/simple;
	bh=DZ/xG6lf3TV658IbkqgJtug/TnD1W4FxX/TVgttLamo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f9tirmlN4JOTOr1c8r1EVghyXxWb+nO6yj9doJUt2EIvKlG0nR1ARxwQAtqWDS295qI/VC/xmFoMoi+dQrIzj7JHp7NV8pnBlyMmc1lVOr6pdpUEjHja3hdeygDLWIdXuXSzldtwW63YIC5JlJL8OR+Wlm6U6n7SJwxSnLrw6oA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s+ZYEMpr; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s+ZYEMpr"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-499add6348fso3465e9.1
        for <llvm@lists.linux.dev>; Fri, 28 Aug 2026 13:50:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787950252; cv=none;
        d=google.com; s=arc-20260327;
        b=KTx/fX7asJ0Ux/OQcO+NKUk4YqctKNSCqVdkeMuRWcAjaO2FXT3EqGsjXDtMwOOTOA
         1NWnVcM5Fwx6+d7bBTPJzBXUPREuxxqz3wkjSF1X9tHpTUIF0l0pkj+MI2ug8fbcI/Cp
         bXjeiL+VtMYsqNiToxT/AnEuog1hvQfUt27vY5KNVahQvDEjIwf+lWC75fc9+tbddlgH
         IgecsHT7ZQLHr9Y32O6HvXAJLSadwmRA2byivHK3VxdvBtDrEnwrD7rEzk6a7FDKlu8N
         Z/Ptkwy6xORWYrpIZwXUr3RDJhtg39llV7Iycv2t1UXkYMSL+1mEPlgbpmY+d7pnZjtZ
         2aCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jz/R80xhYUJ0EJWe3D+HLAqSfz1N+6Poi2/4tJO2Abk=;
        fh=lOdTc0NJOWHcwHWVIUXRFRgAmjPoM2hxG2iViO8TbDM=;
        b=CfXd1LGx/gvIHFPfGXWPNi9EMPmDbtRZwEV6gQ9CxBgR9tzRDqDsef6fLNr8cyRVhp
         42OCHIJYwe2gleAa4RyXTzud4pLlewOo7ZFYHtEfCq/PlOcS+Qq5bAs5vP9yQJTAFX+F
         yakJtQTTGwifJoa5aGfJHgKikPLXCS1dIZif5VH6n/CiE/Zt4fAt4/afgXKLKkH4/D9N
         i0H48f8I1H2tIk303SMEPB0zOMRZxlG3coIxKgnlDVqhIKZ0egbzd3rLNodlOx6Dp8EB
         AQvFq9EpuPqSnrpGTtBGmO0x7G+VGARfmAZLyWuujsVI7OEXoeMW7GaW64wMCqQIzGPO
         joMw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787950252; x=1788555052; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jz/R80xhYUJ0EJWe3D+HLAqSfz1N+6Poi2/4tJO2Abk=;
        b=s+ZYEMprWo21vnHcpixpYn1Q3KmMpiyS3XdaKsPvK5Fay4ZyV/N089tNAi2t5NPhQ/
         QD1kdstsPx0js87jaIYb9EAoh8FZz6fJ1rbkhiyTQe51RLBRw5hOkQd1c3hrAputfqxc
         zxf1fhBLWVzV+CdTYn7lhH/xi4sTt4KZ08T1+2wUsOA+i+fObANVfdNT+RHUME3hE5cB
         ixeDPwOTqiAemVP8aBjICOAjH75/S4F5i2Vlqp0st7trGbBSeEK2iCDByERY/o4Hy8xj
         YkBcTw5j6Cdy8vSxk1Y3u6ZeM7H34uArDAurfXXphNN5UsTwMemB4MHWj2UG++MnJZXy
         xQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787950252; x=1788555052;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jz/R80xhYUJ0EJWe3D+HLAqSfz1N+6Poi2/4tJO2Abk=;
        b=dMYxwC6Z2Re8PYSmq+9WKi+zqcBJ37N/zdTrLq5jIBmMZPRCwtd/hv4RtUflhJkC6K
         7suxdXIapxhHHP0TahmfYLSMQ26GoM6267qLvml73aDRhNQIcOBTif22hGDotbuELX3E
         GIsGYDbzKdJwjgLPeyv6Uv7/KFDRLkRzwp3uj2ts9RMEle4xMXmkiljYR9I88U4bb9UD
         jhgqkh1pnfnIyiy73G/yORdblgGTVKl9nq4MNyly9TmDbiWJS00kBSRCbLqS4vv2BAT8
         5qCfySutSfyNSMgYfHgWx3n4kY2Ulm+xdt/+eQbJBnDbi5H0mhYaDIQyyUUTpzBECq/x
         T/3g==
X-Forwarded-Encrypted: i=1; AHgh+Roxd0ope47tA72IhzHxO3UmkgupA/RNIwlKnSpRNIWGNi6BTM8GL6dv9+tS9mtkouixMJH2@lists.linux.dev
X-Gm-Message-State: AFuF++kX05B2XgUYiJvTneRN8yEJChl78ijf3RGjI6kVq68W6gVAYpdP
	69IvIvtJh7ckv/yQtGW4tqNdC5NdA41CzLY58jCGSDHtDhfvgTbDjpWYmIEfPelFPRK1ubY0R6o
	YGEr1JjJGSB5+T6LwVyVwSJ+y1uIjUZFtqvnFy0yd1NsUpsMo1GZBIYgw
X-Gm-Gg: AR+sD10uZ7mXsP+HX6Eh9KDu0p8SZVHS26pqaLOxSsj0awSIhWoQ9mbGTpjTH0Rquvh
	Ou4gLY3irSWbunyjfcyR8S3xdItnP3j/6zrJ70LkehxFVs1of28SNd8irUSM4oUC0Gqr4QcKpnI
	GjbN+mzg+9Aa1yEUMBbiP2mHY5zkcyHGcq5N/rAOUlz4rz8Wj7Jf40XduSXPy/xCx5W9Idmv1Av
	Uf7+K8tlVmObCrfiStlOieoyceWSUCddf0JQgEKo4MGl8d9BFd+nUV8J/HfXmRxozV7qRfdG+JF
	6ZfsGOo6rrGF5MR8CNobt2oV27tgQxWRVfdkLqNvvw==
X-Received: by 2002:a05:600c:21ce:b0:499:c3da:6f40 with SMTP id
 5b1f17b1804b1-49ccbb10d13mr260135e9.4.1787950251892; Fri, 28 Aug 2026
 13:50:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <20260827194508.446733-1-linux@yoavmoshe.com>
 <CAKwvOdkSZBbq=e916=efx8G-CTzZ5b31AhyUytO6eJjjkEdMow@mail.gmail.com>
 <CABCJKuc0cWWdkA7zrCcuze4AE-qTSETuUi-eRewPnn_ivHEADQ@mail.gmail.com> <CAKwvOdnA7Ej_uppSL7U2xwxyUQoDMvO+RArj4HCUSOziH0rCqA@mail.gmail.com>
In-Reply-To: <CAKwvOdnA7Ej_uppSL7U2xwxyUQoDMvO+RArj4HCUSOziH0rCqA@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 28 Aug 2026 13:50:14 -0700
X-Gm-Features: AcwNN1VOtvX9Y95_BvBjuOVh8z76AnKrtJFeJUv6jycw2oA0qmipRhZ22a1HmKs
Message-ID: <CABCJKuezb0HtOcMBsObczS=HBaRvMszagkOZGHyOVbXBqtJi5g@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: imx: Fix suspend/resume crash with Clang CFI
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: "Yo'av Moshe" <linux@yoavmoshe.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 1:19=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> The 8B alignment seems to be a requirement of fncopy() for 32b ARM.
> But functions in ARM can have 4B or even 2B alignment w/ Thumb, I
> think.
>
> Doing such an override would add unnecessary padding for each use of
> SYM_TYPED_FUNC_START where probably none of them have this fncopy()
> constraint.
>
> ```
>     #ifdef CONFIG_CFI
>
>     #define SYM_TYPED_START_ALIGNED(name, linkage, align)        \
>         linkage(name) ASM_NL                    \
>         .balign align ASM_NL                    \
>         .fill (align) - 4, 1, 0 ASM_NL                \
>         __CFI_TYPE(name) ASM_NL                    \
>         name:
>
>     #else /* CONFIG_CFI */
>
>     #define SYM_TYPED_START_ALIGNED(name, linkage, align)        \
>         SYM_START(name, linkage, .balign align)
>
>     #endif /* CONFIG_CFI */
>     #define SYM_TYPED_FUNC_START_ALIGNED(name, align)        \
>         SYM_TYPED_START_ALIGNED(name, SYM_L_GLOBAL, align)
> ```
> then this driver could do
> ```
> // fncopy needs 8B alignment; see arch/arm/include/asm/fncpy.h.
> SYM_TYPED_FUNC_START_ALIGNED(imx6_suspend, 8)

Looks reasonable, but this still feels ARM-specific to me. How about
adding the macro to arch/arm/include/asm/linkage.h unless you have
other users in mind?

Sami
