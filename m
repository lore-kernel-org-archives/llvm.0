Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793986984;
	b=rLghdFhgoK5xadIOpBAtBU7rIJFPEjPm4TYfyn2l++vkslzuqWhArwR4gWYjDGbxofMh
	 mKJWwExC33Io4QRZAaSZ9mEM05lE//3CDahkSvbCssvfH62dBaLaxcFUd8UobYFqzykgE
	 1swYtfmf5c7bQsEEJFL/xNPwdFG4//gSrEQa6/voDe8yzIGmzVAt6po+Fa9xWScoSHraQ
	 VnBOTLvz9Z9KgelzZTBoZyrWSoKkzmX4dXYxBy6uIGQUYtuf/KlRH+XwXz9QFlWUoaiA1
	 hRJg9Uoaiue7belcJlsEbxHOp93pq5350QtLVG0YnwAM1VhWcWnBdgmJ7kpSeZKdDIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=zCfrwF+d0gm8FLK7Blq7MpU0ABelay9GJEspD8JPZms=;
	b=Mt60jJsAbBImI9JPOCHAt8WF8P20bdVJqTVgvl4J8oXPCS8uegq9bANoYT+rZ9+M8vVp
	 my+vMhz0lznje1il6koTKH2Orkwc7qMXWwdIXo6nGbcvJxM9aLGcJjDm6+OXvV46K3lBc
	 IzvQQmXQqRKE2kTc+zMnZPCGSjScJ7gXydTA/63S/4sAsoZjtihLFRMosK9GgVZpLfBGI
	 pi7qXEFiX6SW1ImgawfIKPspGo/qo72enVxBx0Cgv8A7BZx6TVwHo+J87syVPnCsRinnW
	 87Rao30DeLlTzQTirPqAbXygk1W7tuzznBnIOlSfqyEgRoxZltZw8MIF5aFzDcgX5fg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NVGu9oug;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11961606A337
	for <llvm@lists.linux.dev>; Fri,  6 Nov 2026 17:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11961606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NVGu9oug
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b571a45a2aso3901a12.0
        for <llvm@lists.linux.dev>; Fri, 06 Nov 2026 09:43:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793986982; cv=none;
        d=google.com; s=arc-20260327;
        b=EvtgBCSdwspmqP4HXBoe0NgHvjqTz3th/oKct48N+4k/hDcKLkF8vgsQVHFYchL9P/
         VPSj/2PG+Y78TeBsPKJt14Sr3L9f+RGDKZPk4Ny3CePOctD5Yqy4NII61z20CpRLWq+K
         8VzaXiRYVZOFJaIBUGsPf3jU9o9HctWWm9hxNywt6zQQM/CCFA+LxhPmAnjE+IINA5gA
         4Fm72Fiklijw3ZjGAwnoXU5lFlvYw4dy0BlEbiAk499WsMxT+RQrJrhtG3FgEUivD7iX
         xa0+xKjnSOQ6X1XoMc81tXfOrBOWkPh2mqf7erj/p1j9KXmeml8PHP+yAXoc6O4bW/Jn
         zSJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zCfrwF+d0gm8FLK7Blq7MpU0ABelay9GJEspD8JPZms=;
        fh=kdb+xlaTyCxmlOUI7uip5iC3rXXfP/sAjtTCt4JxtsI=;
        b=bb3Je7uZ860DH7LM7t1hkXPINsMM2lEzBbulurA4E4e15/9/Qs9PuCobpzYkdlTl0W
         FiGaYrPtGIvki8M8EMbKEIRA7wMuziiXFcfbBjwNP0pXr17UYzKznwKJYO6CDhz4DDSy
         Lc5wq28oEz/YMiv7clzBwHOQ3h4gRG4wtCNWkI7MX7geL+n1NmtGow1OsxT79Vcnw09Z
         lW1XL8UiKNon9rqUsd8Oq4XtJqc3unezrSluuP8P9LHPUMmAfmRtOpxg5sSJlOrCFk+M
         iJfeFRsYCmeMqyZLyWHIGiH/TXOhDtkeCiRTwszZEqAz72cG97ELK+vTekjXL8spk55a
         ZakA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793986982; x=1794591782; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zCfrwF+d0gm8FLK7Blq7MpU0ABelay9GJEspD8JPZms=;
        b=NVGu9ougIbApRjgSOcW2gjdvXas/0JcNqO4DUsMByB89ypdLj9mGOXqlb4Ez/qXepe
         wsho/mXKSxN+pCjDdeoufspmqIzGHGxlPTyiG1MW0waRrsinYqkFMyNEvstRx3XYgeoh
         iqxOqq3Mv9y7dX05Dx1TDiYrtXmJxAXdm2THz0CqUR2HND6nXKJxq0t8Axwq0TL/qVv9
         0TXDKhBYUF2X1yeKT3FpwmajvBDC6MoyP+jDyCkkJVtOySMX77q7yIcqaHfF2Cyd6jQU
         Vw5y3vx0hfYMX4K2OlqCfep3Nr9FXzPXUeYs+ol4/JLqQtq6bRvXFuLm3UcydW2SGdC/
         70iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986982; x=1794591782;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zCfrwF+d0gm8FLK7Blq7MpU0ABelay9GJEspD8JPZms=;
        b=S6m5ULQcO2EBIUzMFJj9bPEMdFnAAO7gt2oTjCubOZulGLvOh443zeQU03wa9wB1IJ
         Fv0/teCTwh6onTAHACIChX3DVOVMbbmiTVKXe8OHZUU19jkorK1yOUYIVrdKJBw/EgVr
         JUQLr14y/zstyVcK45NI5hz9P2dLke5orNv6PEomdBzDH2CFScxibrr0pPpB56NDbuzu
         rojCuTXbre12YdwziPujo/CqVuFik3F8JmD+0NBMBGuk0tsfW7lBfqcrvy9AXwnUude0
         VJIBB071FwkPiL+mAKzyT+x4ZuGsaum6YAc6QS4QkBVI6R+OThVAFHXcL3IYbxYn60F6
         3igw==
X-Gm-Message-State: APuU4Z8ReEZCNDlAqrVpLIXksXg6nlClRIVy9gSdRI8P1Dn4OVx0Gz5O
	bHnN6Z375mEqVPtEKxFFvKtL7L4LYWCqQ4dkKPl/RJAR2qyATqEzJJuKjPsZ2cDtXwYkB8DQQ2L
	YvobxiaPdBnYIXKTrWQtU8SxbfDYLQkPjSXNXszGL
X-Gm-Gg: AYBFou0qSmLeszDUI67AFKtSyKRBp8F5HBSNrvBcHUp+7mNg8C+ahml3iAMHIe8Z2hS
	iUwV+qMciV9VjojwjNYiFfHqRlV1rjG8CxmvqLnGAbgM6sH84D+Ed5wmRJRYB+s99KvZ2uAVL/j
	8T7fJ21btVjELSWT7IIu2KmjpwQbhrgGZTn4r/R3XvCDXAgvhq83TU2xMHw1NLxulvlQi10xFG0
	XAg1fHXA1nA1e0qglIhR+FzsJtBO8ZPd5g003FwKWaauh++N4tizCExlrECpROG+KdY1ZJS+esS
	h2Ex/Vd8wrETlXh5ppOr7a2gqShsntUZw18xP/eu1+Pyrw+HtARiS+2C0poqDLHfG8c8UXyY2d3
	m29WqSWYRhoOduolIAH9fCW6IbAZx3oXs6JunLe1qC/iom2p87sz4jR0e9j8h1Kae9HsxYpGiM5
	I5LxSOgdG/S6NU
X-Received: by 2002:aa7:d790:0:b0:6af:b196:68bf with SMTP id
 4fb4d7f45d1cf-6b6f841a8e9mr5248a12.7.1793986981869; Fri, 06 Nov 2026 09:43:01
 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261105151159.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid>
 <CAF1bQ=QkGntJu8G67ssH2dS3Sn200_JuYitjtAfNPBu_hn0fZA@mail.gmail.com>
In-Reply-To: <CAF1bQ=QkGntJu8G67ssH2dS3Sn200_JuYitjtAfNPBu_hn0fZA@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Fri, 6 Nov 2026 09:42:50 -0800
X-Gm-Features: AclHuK-wkGWa84CFDmjnSjcaCwRdnzfHPz195HdzeZhErhZwgCS6NVR4XJm0nNw
Message-ID: <CAF1bQ=QiP4fb-+Kn8wzEH7wqjAjZaagxUd3sYpv2SkwDcnFPWQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-profi)
To: Douglas Anderson <dianders@chromium.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Han Shen <shenhan@google.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Han Wang <nesthanwang@google.com>, 
	Snehasish Kumar <snehasishk@google.com>, Nilanjana Basu <nilanjana.basu87@gmail.com>, 
	Yabin Cui <yabinc@google.com>, stable@vger.kernel.org, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Just one thing: I think we should also have this flag for Rust so Rust
and c are consistent.

Rong

On Fri, Nov 6, 2026 at 9:38=E2=80=AFAM Rong Xu <xur@google.com> wrote:
>
> This looks good to me. Thanks!
>
> Reviewed-by: Rong Xu <xur@google.com>
>
> -Rong
>
> On Thu, Nov 5, 2026 at 3:12=E2=80=AFPM Douglas Anderson <dianders@chromiu=
m.org> wrote:
> >
> > Starting in Clang 21 (LLVM commit 2fc4a4a9d3a8 ("[Driver][SamplePGO]
> > Enable -fsample-profile-use-profi (#146795)") [1]), the Clang driver
> > automatically passes -mllvm -sample-profile-use-profi whenever
> > -fprofile-sample-use is specified, enabling LLVM's flow-based profile
> > inference algorithm (Profi) by default.
> >
> > However, as Rong Xu noted [2], the kernel's AutoFDO implementation uses
> > flow-sensitive discriminators (FS-AFDO), and Profi has known issues wit=
h
> > FS-AFDO that degrade runtime performance compared to LLVM's original
> > profile propagation algorithm. In addition, Profi's min-cost max-flow
> > solver (applyFlowInference) can hit pathological compile times (30+
> > minutes or hangs) on certain kernel control-flow graphs when profiles
> > drift slightly or when combined with GCOV [3].
> >
> > Pass -fno-sample-profile-use-profi to disable Profi and restore the
> > original profile propagation behavior that kernel AutoFDO was tested
> > with. Guard the flag with clang-min-version 210000 since it was
> > introduced in Clang 21 alongside the default change, whereas
> > CONFIG_AUTOFDO_CLANG supports Clang 17+. Note that cc-option cannot be
> > used to probe for the flag because cc-option invokes Clang with -Werror
> > but without -fprofile-sample-use, causing Clang to fail the probe with
> > -Werror,-Wunused-command-line-argument.
> >
> > RUSTFLAGS_AUTOFDO_CLANG and KBUILD_LDFLAGS do not need changes because
> > SampleProfileUseProfi remains false by default in the LLVM backend and
> > is only enabled by the Clang driver.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 315ad8780a12 ("kbuild: Add AutoFDO support for Clang build")
> > Suggested-by: Rong Xu <xur@google.com>
> > Link: https://github.com/llvm/llvm-project/commit/2fc4a4a9d3a87a9e11c48=
ef25522aa17c2a71003 [1]
> > Link: https://lore.kernel.org/r/CAF1bQ=3DS52KWHopqxksctbBirFEr5Mz1dKKMA=
oWh-dqLHii3Nig@mail.gmail.com [2]
> > Link: https://github.com/ClangBuiltLinux/linux/issues/2188 [3]
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >  scripts/Makefile.autofdo | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
> > index 57a3aba6ffc2..8754b60ad2ab 100644
> > --- a/scripts/Makefile.autofdo
> > +++ b/scripts/Makefile.autofdo
> > @@ -13,6 +13,7 @@ endif
> >  ifdef CLANG_AUTOFDO_PROFILE
> >    CFLAGS_AUTOFDO_CLANG +=3D -fprofile-sample-use=3D$(CLANG_AUTOFDO_PRO=
FILE) -ffunction-sections
> >    CFLAGS_AUTOFDO_CLANG +=3D -fsplit-machine-functions
> > +  CFLAGS_AUTOFDO_CLANG +=3D $(if $(call clang-min-version,210000),-fno=
-sample-profile-use-profi)
> >    RUSTFLAGS_AUTOFDO_CLANG +=3D -Zprofile-sample-use=3D$(CLANG_AUTOFDO_=
PROFILE) -Zfunction-sections=3Dy
> >    RUSTFLAGS_AUTOFDO_CLANG +=3D -Cllvm-args=3D-split-machine-functions
> >  endif
> > --
> > 2.56.0.455.g6c5a503b38-goog
> >
