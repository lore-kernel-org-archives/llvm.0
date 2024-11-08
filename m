Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A52199385
	for <llvm@lists.linux.dev>; Fri,  8 Nov 2024 18:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731091811; cv=none; b=nD/A8oV9BUdrVT0YBGJkk4sAXk3oQ50oUMzw18cXJ0rUKBtupFY5MO0MhiUAC2kLACSAgGdNCGjRhVmvCNL5Kld5t7ZugWrGfKPMV5mu2Oj8Rb7FC4BoINXCdb3FcSEvC5kVPW9MjsbF4Zeo9RYLPIj5sfWtcIL56YFHdTD4z6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731091811; c=relaxed/simple;
	bh=pdMqJFn4xYar/ogW6iZpxVVKTHsKKJNMZLA6/IYtp+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tHUB7RKhjRrFyjYe23MInTng4urKW15FckGxxIttZJ1kRdEY5mYThxYAvaHh8mobqT5b1PeeAK6WoI+LiqvTRmw5Zir0udLSAcntZe3/wTkvCzAJgwNNDRADCYvOh+Co8BvlAUZ8CCQiOrEv07QOvIUw3z5EnzzeyFNvKslthyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DE1vDGgb; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DE1vDGgb"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-460969c49f2so19521cf.0
        for <llvm@lists.linux.dev>; Fri, 08 Nov 2024 10:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731091809; x=1731696609; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcZtVBPmVQL+MAycw/KU0YJN3A6fi37snUPr/mVBUXk=;
        b=DE1vDGgbDc3ElDGrUZYcMsoKDWmbkJfbjMb1TbMxFiH/9ImX2yfbAcCeMWm1QuAYRZ
         l5GnOvJJzQb3M4C4vzRQfJcD04A8u10BDAeMCamNEjZAFDBu9np3BNl43kcWTIFI9o+H
         Qwca6xutM4OVqpWLHLlHivsYDpQWBN6SnOmXqWXew8RCNKrOXGqkqv1VBTC27eb04RSc
         CJ6kPjGzmPKCgIg7spkHjdgKYLNLsHuMemwuhHUftWPcOE2hJ3LMlaRzvdJltTrjICpp
         U/GeV7fMRpMME7nF1C3HoTTJOdgo4G61SaFi6pjiSsiDpcyEyWb+J7FL+Wttb2iVb0A1
         dGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731091809; x=1731696609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UcZtVBPmVQL+MAycw/KU0YJN3A6fi37snUPr/mVBUXk=;
        b=YnSEQYivhJXbsWmRPUNVC7uCQ6yl9yDrSA6Yjesn6+4Yida9vXu7FJcgev0kHJ2bIb
         JDu3vDI8JAEmtxDq5ZkBXdVYssX/d96lFGIllvLM5r+Ftz5LU7Q/VZmsDS0VqI9P1vnP
         ubS9b3fR/MfN8VItd5vXOzpMiCDo2REyrDueZ6cs4geDzwvDs5ycGHjRrvuuLZpzd6lV
         0uzGH/wd5EGSk9VpKCUWPY331+LxNSCco5TFAI34wOHpFzJB6fgNfazQ+b9wIybKt2AB
         c2cp9mXw8J71I1jW6zywwHUjntaht6oa2AL53ccNHf3Qu3+z6wsAD015Pqr7pyu71Xft
         5bqg==
X-Forwarded-Encrypted: i=1; AJvYcCUVStjE6TzLbiDsRqB4DfF0WFnOn36/Eu/QVNZ/9+H3uHu3JZwUDVDjVaVTzQXFCHKY5Wrj@lists.linux.dev
X-Gm-Message-State: AOJu0YzYWg/Q4nDFIxFUR5H7KPLPs8TYzxOcH5yv4Z5ALWza6QmPS/MX
	6sjCHo/hOD04t1agNWrEoGY0bG4RvJXZE2F7a6EtWVY03BJXAlXfcCzhw4OR57jTzuRy2Ow8xQX
	/gyxCDrqc2GD3BFNN5j0tW71G7dVPwGhwiFUt
X-Gm-Gg: ASbGncuBwQiigMn/Tsub5ft1DaOQ1wc7vuMRcn7iiEkxsFs1FaU/l3JR3ahDoy7BptF
	5LSD7DjhNdNHm166kZ2Kru5vpPkmHnBz7obkyW8vFHQ4k9wZJiqWcVqxytg72Fw==
X-Google-Smtp-Source: AGHT+IHayooXKesO/jmhc3MISQUMRHTU7foDBtuIeVmlZz6ij29U3/xla28tsA7vLuZJNNWCnO4txRPiTygml+GwUa4=
X-Received: by 2002:ac8:588f:0:b0:461:32e9:c5ee with SMTP id
 d75a77b69052e-4631685e147mr96211cf.0.1731091808671; Fri, 08 Nov 2024 10:50:08
 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241108051030.2918950-1-xur@google.com> <20241108174638.GC2564051@thelio-3990X>
In-Reply-To: <20241108174638.GC2564051@thelio-3990X>
From: Rong Xu <xur@google.com>
Date: Fri, 8 Nov 2024 10:49:56 -0800
Message-ID: <CAF1bQ=Rh51kUaNk3zQbPAe6H_buNv3jU9kcyMmJ8csXbZYQqWQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Fix Propeller build option
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Han Shen <shenhan@google.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Nathan, thank you a lot for helping with the patch!

I will send an updated patch that integrates your suggestion shortly.

-Rong

On Fri, Nov 8, 2024 at 9:46=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> Hi Rong,
>
> Thanks for the quick patch!
>
> On Thu, Nov 07, 2024 at 09:10:30PM -0800, Rong Xu wrote:
> > The '-fbasic-block-sections=3Dlabels' option has been deprecated with
> > the following llvm patch:
> > https://github.com/llvm/llvm-project/pull/110039
> >
> > The old option still works, but with a warning like
> >   clang: warning: argument '-fbasic-block-sections=3Dlabels' \
> >   is deprecated, use '-fbasic-block-address-map' instead [-Wdeprecated]
> >
> > Currently, the option change is only in the ToT clang (v20) and not yet
> > released in v19.
>
> I think this whole block could be a little easier to read and understand
> with some more standard kernel commit message practices. I would combine
> the first and third block into one sentence and I would unwrap the
> warning text (it is okay to be long for a little clarity). Perhaps
> something like this?
>
>   | The '-fbasic-block-sections=3Dlabels' option has been deprecated in t=
ip of
>   | tree clang (20.0.0) [1]. While the option still works, a warning is
>   | emitted:
>   |
>   |   clang: warning: argument '-fbasic-block-sections=3Dlabels' is depre=
cated, use '-fbasic-block-address-map' instead [-Wdeprecated]
>
> then putting:
>
>   | Link: https://github.com/llvm/llvm-project/pull/110039 [1]
>
> right above your Signoff.
>
> > This patch adds a check to the Makefile to set the proper option.
>
> Try to avoid saying "this patch" in kernel commit messages, it is
> implicit. It would be cleaner to say something like:
>
>   | Add a version check to set the proper option.
>
> You can see some more commit message tips in sections 4.2.3 to 4.2.6 in
> the tip documentation:
>
> https://docs.kernel.org/process/maintainer-tip.html#changelog
>
> > If the option change is later integrated in v19.x, we need to update th=
e
> > check accordingly.
>
> I think it is worth dropping this sentence entirely, as I would argue
> that it is pretty unlikely that this option gets backported to
> release/19.x, since it would basically accelerate the deprecation
> timeline, which seems unreasonable to do in a stable release.
>

These are excellent suggestions that make the message more clear.
I'll update the patch description.

> > Signed-off-by: Rong Xu <xur@google.com>
> > Reported-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> >  scripts/Makefile.propeller | 14 ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> >
> > diff --git a/scripts/Makefile.propeller b/scripts/Makefile.propeller
> > index 344190717e47..1a68ea0d1fe4 100644
> > --- a/scripts/Makefile.propeller
> > +++ b/scripts/Makefile.propeller
> > @@ -5,7 +5,13 @@ ifdef CLANG_PROPELLER_PROFILE_PREFIX
> >    CFLAGS_PROPELLER_CLANG :=3D -fbasic-block-sections=3Dlist=3D$(CLANG_=
PROPELLER_PROFILE_PREFIX)_cc_profile.txt -ffunction-sections
> >    KBUILD_LDFLAGS +=3D --symbol-ordering-file=3D$(CLANG_PROPELLER_PROFI=
LE_PREFIX)_ld_profile.txt --no-warn-symbol-ordering
> >  else
> > -  CFLAGS_PROPELLER_CLANG :=3D -fbasic-block-sections=3Dlabels
> > +  # Staring with clang v20, the '-fbasic-block-sections=3Dlabels' opti=
on is
> > +  # deprecated. Use the recommended '-fbasic-block-address-map' option=
.
>
> Might be worth linking the specific change here for archeology sake.
>

I will add the link in the comments.

> > +  ifeq ($(call clang-min-version, 200000),y)
> > +    CFLAGS_PROPELLER_CLANG :=3D -fbasic-block-address-map
> > +  else
> > +    CFLAGS_PROPELLER_CLANG :=3D -fbasic-block-sections=3Dlabels
> > +  endif
> >  endif
> >
> >  # Propeller requires debug information to embed module names in the pr=
ofiles.
> > @@ -21,7 +27,11 @@ ifdef CONFIG_LTO_CLANG_THIN
> >    ifdef CLANG_PROPELLER_PROFILE_PREFIX
> >      KBUILD_LDFLAGS +=3D --lto-basic-block-sections=3D$(CLANG_PROPELLER=
_PROFILE_PREFIX)_cc_profile.txt
> >    else
> > -    KBUILD_LDFLAGS +=3D --lto-basic-block-sections=3Dlabels
> > +    ifeq ($(call clang-min-version, 200000),y)
>
> Would it be better/more accurate to check the LLD version here? I doubt
> it would really happen but it is possible for someone to have LLVM=3D1
> (using their system wide ld.lld and LLVM tools) and CC=3Dclang-20 to just
> use an updated clang. Perhaps:
>
>   ifeq ($(call test-ge, $(CONFIG_LLD_VERSION), 200000),y)
>
> here?

I agree: checking the LLD version makes more sense here.

>
> > +       KBUILD_LDFLAGS +=3D --lto-basic-block-address-map
> > +    else
> > +       KBUILD_LDFLAGS +=3D --lto-basic-block-sections=3Dlabels
> > +    endif
> >    endif
> >  endif
> >
> >
> > base-commit: 0dcc2d1066150787017a71f035145c566597dec7
> > --
> > 2.47.0.277.g8800431eea-goog
> >
