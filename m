Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FD82DECA3
	for <llvm@lists.linux.dev>; Fri, 13 Mar 2026 12:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773405640; cv=pass; b=l1S6JU80C8EA8+5bzEuu9wZy4ksvnI7bQ1xkLu0DewCM7Nhp22knE2rAfRe15+3lW/Cf0uHOJyu/NE3CR9rwqAFqVGd3kYWzAVlkxO0cerrnImho3dzlPItoQ/T2u4AK1D2TuXKBL3F/iOIOSZH0czsFE0MzLKYUNI78dsaNpC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773405640; c=relaxed/simple;
	bh=BH2Tt+ZzgX13lYh/CBBIQ3E5W7P3MU6/b8YCQdgOaCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WLHZwoxp4WTlzxUxNBN9ToBt6Yvthh4thBqBwJ8uPJpA/aXkdX+jbTb4LNh+/LUQVEZUc9SDmNw5ZzluSn1T5H94o229akpaqu5IMpkxo7mI2O4Wd/juk1gH5uejo6qLHYdxpOL0sU3Wb2VZe7ASFAOG92/rPupQGp/kkr7HTNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mw4ktRgr; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mw4ktRgr"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-660a4aa2aa9so10635a12.0
        for <llvm@lists.linux.dev>; Fri, 13 Mar 2026 05:40:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773405638; cv=none;
        d=google.com; s=arc-20240605;
        b=fynGrB4k/+PFpr9GYc49Uf4dzI8HG2hnCnt5q7DEkwZnkgUWtw6qhMbL3+flnGlid9
         I+X5mAKCFO3LEpNrPp+OGtx+FRuLNKEKsAuzoGZLhgNwMbHLRjtKCg7h9DaYQfdsV2B2
         62B47L6+6yT04zOPLYKsHDnblSbBypoVF0USrLpqOffcWkXAqh2zO01Gk4Ds92hoT/uB
         7e4ds/KXkMLlTupKvufwmA30XxOJZ7DvmKfbzkQuFP0GU1tgbRWKvMkYzkjSm+UYrvAh
         9F7Wfrjfs/BdZMOlhF1n9OoSx3cLvDg7dLpq75kiF9S5gHf91h3CjjN8sjkmSemOcT8a
         iIAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TiD2EX4E5GX5UawpYTJv+Z9RV3pyP1GtHitgeXF1tTQ=;
        fh=pejMvz+KE2yts/RVHTA0d9syMpexUOMXZXgfPl7EmT0=;
        b=IJp56cqfo9sxMFnLBM+GZC3S0gLRz4jbODQATjqZskSi5Yzj9P8vkJkuTCXbGGv3bV
         gkImPyoK1nLmI61QGka6uiQ4ifpyS+2Mv/1ElndNI5bYD8OcR1itxVUlowWVlWuAT03l
         J9f3cof3j/pRf+8d9/RO+0gmQ+VNCxwfUCsuNDlFMxHDouF5q3JJQDEvurkc7GynWtWo
         E8DiY+mL2lIggOrWMsH6zQzWVGyf6+uKxIfsOXBogcW4+FtZcURoYthRuvd3MBsXL78I
         ITg8e+Y6n6zAa77ttA8zNBI0zvSERiZe9enmQ5xFKqAGpQooiwqlX6atndVbJvdIrBfV
         sh4A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773405638; x=1774010438; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TiD2EX4E5GX5UawpYTJv+Z9RV3pyP1GtHitgeXF1tTQ=;
        b=mw4ktRgrsooYQVhk96rKd3qizd4zN6b0YQSQvJfFFI0m9LVuWo+ZqrKq/eCwf6DMJB
         zRCLbNZglXKsO7/t2dc/ggs8jNE8brb0aUo53lNCAWwL/1LFDzHCNqzmy7m6KV/yzc+g
         ZeycCofnp5MPe7rCJSDHD0QLnZJfNNYb+iJ9oSQAq2rThHV5t3QhoObaagHYJYNe3mCD
         ggzlUs86cTxfR0KeGApIRYGzLGUX+3iD4Eip1sPuTUgEIXc+v7tnU3bjUc9o+lL/eiTI
         oUBFHy0l0Vh6FPEQz0uitvVs3mkb+etiHj1amiMmFFTovH7+C8nlh7eGsWJf5BPm2qJA
         CPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773405638; x=1774010438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TiD2EX4E5GX5UawpYTJv+Z9RV3pyP1GtHitgeXF1tTQ=;
        b=VC8NvHailXSHNp/BfvKreA+NQKARBUnN/u/5dg6I3EnGDS4AQO6j45XBWetwjHmPTG
         071fqnS3AO6lV5VqwrHj/pEmCtm8ZzfgjMLPpNBjWEmMhP29nlJWiA26CVDBfThUPk/r
         e10bg567aWZZZ0T6BKPlDkoF/cmEgUfB3piqm+pRqJIQrWkBjMzDlJWEWDnuqm4Y0I9C
         /s5IwVBOMKiapK1w2+IhekoO58lK3JX+M6pLdreRdu4KHUadGLBXxzz3938uKkKoiH6W
         tEwjZ1SechzlYZBHZT2GSJpZWu94rhHwo19Pyepi+7Lg51YccMHuJ/n+k0lNUqJcxg/9
         VMrA==
X-Forwarded-Encrypted: i=1; AJvYcCVgB2CC+BxaFzJJgLfEf3MPwpq/ozWdccoyHqGYxah31G3npVOElBWzlHNvHHFLe5MPxGOQ@lists.linux.dev
X-Gm-Message-State: AOJu0YxWHoFNuAnqGXVj5ybAgw/Ma8H0uTMkDf8MCHOvSXJLL+N6Z9iG
	vlQZZO2W3LN4QNSpCbrYeJXCYuD8GohFJWAFQRe2qYX7OJBwlVYMs4s8235yfGMGIcGo7y5F9uQ
	pr+3GS5CoJqTvH0sXXbrHx+tEyUcXTittoFAEUuus1xlzAre+bRvMjAap
X-Gm-Gg: ATEYQzyioS8Xvms1dclSjHXyRZtsQQQ2AVRIZex4IfgHjhnfWFz9dHOmGbVreQCaBUm
	7wAgoZ1cIC4yzBLAkG9k2+9KbnngSjac6ehf1KB4uEc92JqQNFQtoQRn4KCOPjqZPmMQAupCbJ4
	p6O7uwjeSAPyDod4Cx9BKk1ypcwtQRgTg4w+kyqYx4Amn51VXqGtgnbC4LtPIcnuMcNvAqmJ87/
	NDFJhYyHAvvYcamjGW/45OPP/UHqsm/f/qXopRxWGmHodoxdJN4MpXa9Ba4sz+jmLuaF7zOpngo
	vSuDQXigDkXaOY3Gpti+8QuOrrN4CUR/6H1+
X-Received: by 2002:a05:6402:a591:10b0:663:a627:3ef4 with SMTP id
 4fb4d7f45d1cf-663bccd4116mr27920a12.4.1773405637372; Fri, 13 Mar 2026
 05:40:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260311-kcov-extrecord-v1-0-68f03c4a05ad@google.com>
 <20260311-kcov-extrecord-v1-2-68f03c4a05ad@google.com> <CACT4Y+aLx-ZG7FqYNrhrABi1bgNo6AnG5JL9tq+mCPRAnx37Tg@mail.gmail.com>
In-Reply-To: <CACT4Y+aLx-ZG7FqYNrhrABi1bgNo6AnG5JL9tq+mCPRAnx37Tg@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 13 Mar 2026 13:40:01 +0100
X-Gm-Features: AaiRm50m_KKY-Ui-GtFJVc8fktrbZ1qfcaOrt70ftdmrqPSIAcrmjDuP-BlI1cY
Message-ID: <CAG48ez18oqEBcNoSJP1=-HUEBbberz2--Wds4gDMd0c+=evDsA@mail.gmail.com>
Subject: Re: [PATCH 2/3] kcov: wire up compiler instrumentation for CONFIG_KCOV_EXT_RECORDS
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, llvm@lists.linux.dev, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 8:54=E2=80=AFAM Dmitry Vyukov <dvyukov@google.com> =
wrote:
> On Wed, 11 Mar 2026 at 22:06, Jann Horn <jannh@google.com> wrote:
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index 93f356d2b3d9..dddc330ad3ca 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -2215,6 +2215,20 @@ config KCOV
> >
> >           For more details, see Documentation/dev-tools/kcov.rst.
> >
> > +config KCOV_EXT_RECORDS
> > +       bool "Support extended KCOV records with function entry/exit re=
cords"
> > +       depends on KCOV
> > +       depends on 64BIT
> > +       # TODO: check CLANG_VERSION instead once this has landed in an =
LLVM
> > +       # release
>
> I think the compiler option check is actually better, since it will
> allow us to test earlier and supports compiler backports.

Makes sense, I'll remove the TODO. (I was thinking about it from the
perspective that every compiler flag test increases the kernel build
time a tiny bit, because it causes an extra compiler invocation at the
start of the build.)

> But it may be good to add a reference to the compiler patch in the
> commit description.

Ack, will add that.

> Otherwise:
>
> Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

Thanks!
