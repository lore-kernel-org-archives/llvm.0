Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95865566A
	for <llvm@lists.linux.dev>; Sat,  2 Mar 2024 08:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709369189; cv=none; b=ioi/Fv3ndUovO+z+rN24bOLtTPov1Ppq2MGrfEq1y2ch3tsTsS12xLesgloCGVi8UxeEn53aFd3myr3qUZ7J6JZgOokFHVjB9GbkO9Bp1lbHvhiI1rhLnyAF4tk3WuHnACfmIxK51uAK2K6M5htKrNaP/tClAjmbFMkntw/4/24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709369189; c=relaxed/simple;
	bh=FC6OiEUkH9b5NHVhavEjgmP4qQcLGemI6CzYGmZXnI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M9OFUETETjq/aiivSmo0Xv7YjMbT90FDKMUcPm3k/keTcNeQ8ugGMXYIUiSDnVbLs2UdBgYNunHEnrVYr0V2lPvjaG+FaYG92/X5TCItTFAAMjWwUO+Mtq98AzqE0zuzDsJyFIq/9uo2XnxzQHHfTrX6uuKCdLQXLPBks+4bF1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eZTJsEsF; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eZTJsEsF"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dcbf82cdf05so2954813276.2
        for <llvm@lists.linux.dev>; Sat, 02 Mar 2024 00:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709369186; x=1709973986; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FC6OiEUkH9b5NHVhavEjgmP4qQcLGemI6CzYGmZXnI8=;
        b=eZTJsEsFWcEMUjpaRZhP+vTJAhWN2ZND/SqxAPyYdidbZOt4fqt2oB4B5Pb00jtitR
         +gSIzK88V73i4PbAq6E/x+9yX7TpTi5xCluvuE5esOnsUv3zCtdJaa4KUNPYOuafx+RY
         7pf0cww+Fx+2vGAaXyPMKg/3MFinZidnOT6lznYRD8n9BlshIVIf4kvoqJVPnHIZMlNg
         xDY89V4VjESaj6MAxhBr33/OEZ7ou0JtwOZuNmZmhMl0mIvSSkoe7/g5SwB/eWW5Fr85
         mPRwxsd8VrgujIk+rxYFgtvGTE+Kkt3jNAQHhuyE9T1I1BA52SR4njToKxS5O2DzEoxV
         8qpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709369186; x=1709973986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FC6OiEUkH9b5NHVhavEjgmP4qQcLGemI6CzYGmZXnI8=;
        b=GNvkLy6XdjjmLttJ0BVfONlrz1UFcaedSsWW/h3XWdtyywV6sI/AK+woxXLgoxjcM2
         kuJ+ZUPBTtVJs5IKn/FqfkhrqNs0j9evrC0+bSFN6S4nBtBM2DXl/nqBD3kg6CD8+sRG
         mdgZq675DKvXbILDbEUbOL9dhvvvxQrKeTeja7Mb3Jipz/pfxqqRMobaMD9JIX+gyzfW
         xZg3qgSEB8bmDwcsbDpO5pGUdurcuu4tumzkWZYsg5SmmNqCs9tdRDoHbFIbqCReaiJj
         fc/Pmjo8YRAyzy/rGoaFKQLDcDe43ztS8E5WPZgjEAYlVw5y3Rl4qqUwEiDiKdnG9PLg
         XbWg==
X-Forwarded-Encrypted: i=1; AJvYcCUH18Cph3X/uQ/vBs9D0FsDjcuBtUvFKsw32y/AKNiJJjtIxAzYuvH7ACx3W9XIo8v1D2gQhK4xgiTuTNb+hqwGeXe7bw==
X-Gm-Message-State: AOJu0YyqBASqD5+bK0zJ8BJ9VaF3zznTDEDYvLIgy4BDM85Wv/hYgKPQ
	pv+RpKQYKC3/8hFKV/FNTXuDup18qETsW7UNDx3UxXuFbNWMAyjdElm2eQW4Mbas1WJFZuNLlBO
	qxy9WgnYZty1c4m5bjMYB0zVA9eTpB600ACs2pA==
X-Google-Smtp-Source: AGHT+IGeWX1WfX9z22cosBtPiK+LqKpgW2IVKs7tMkQDJX9hXC1b8ohExXbrEl1oGUm6FlU8kF2ewPNkgVH/7HUnzE8=
X-Received: by 2002:a25:7b83:0:b0:dc6:9b9f:d3c0 with SMTP id
 w125-20020a257b83000000b00dc69b9fd3c0mr3174459ybc.10.1709369186622; Sat, 02
 Mar 2024 00:46:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240225-arm32-cfi-v1-0-6943306f065b@linaro.org>
 <202402261703.695B87E6@keescook> <CACRpkdYZsBQwUCEKsspkZ=M0Goo9omMH=LM=pWyOJ0U1WtySYg@mail.gmail.com>
 <CABCJKuenWs=11OdBL-+bRWEW2YjTUA9rt=OjUcbKX1PwpEyQKQ@mail.gmail.com>
In-Reply-To: <CABCJKuenWs=11OdBL-+bRWEW2YjTUA9rt=OjUcbKX1PwpEyQKQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 2 Mar 2024 09:46:15 +0100
Message-ID: <CACRpkdZGo+9n4w=yTcCo90Z607h-uZ8JWf=xCe=-zQxCfCuCGA@mail.gmail.com>
Subject: Re: [PATCH 0/7] CFI for ARM32 using LLVM
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Kees Cook <keescook@chromium.org>, Russell King <linux@armlinux.org.uk>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 6:44=E2=80=AFPM Sami Tolvanen <samitolvanen@google.=
com> wrote:
> On Tue, Feb 27, 2024 at 1:48=E2=80=AFPM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> > On Tue, Feb 27, 2024 at 2:06=E2=80=AFAM Kees Cook <keescook@chromium.or=
g> wrote:
> >
> > > I wasn't able to build with CONFIG_FTRACE=3Dy; I got this link error:
> > > ld.lld: error: undefined symbol: ftrace_stub_graph
> > > (FWIW, I'm building against v6.8-rc2, maybe I need a different base?)
> >
> > I get that too, from the buildbots, but I'm clueless about what it is.
> > All of it is in generic code, nothing ARM32-specific, maybe some bug
> > in v6.8-rc1 that was fixed (I wish...) Sami?
>
> You need to just define a separate stub for graph tracing with KCFI to
> avoid type mismatches. Something like this:
>
> https://lore.kernel.org/all/20230710183544.999540-11-samitolvanen@google.=
com/

I managed to fix this so all compiles work now! Thanks Sami.

Yours,
Linus Walleij
