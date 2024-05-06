Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9288815CD79
	for <llvm@lists.linux.dev>; Mon,  6 May 2024 23:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715038244; cv=none; b=BKaSgGERk9GGbK9Ge2hNWx7rDIY5s39S8WuX5KvPLdyW572HFxznRNvadxIUD+ACELKskOdjwC/lbhF8YfiWFVHHl7rgsfeQ2hXt+WBooxTkrtsQ8IYKwEilx4zAMh7e4lGFKm20Hk3Z5zmdSGDWRmnXdXXA/ak55KB8DECzezc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715038244; c=relaxed/simple;
	bh=dC5gmNPxNSH+aIEWUfqlcoUV3/RSi8n3oR46/xve6dA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qi62R9jNJERojl/JXLKWCJ1li7mqltu1r98mQ3W8vRKp2NUGaeH4HpjSsmbvNRTdKlN8ggtsPYGB4elE8jNfnhoUMUT9gGYdCvdjbG4eFG3qeQgGBsl8czlqIyzFc34sh0fdXJQ5Q5yWOWrUZ8lkSXo2LGUz3NPxQoJHKGD/m7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=evG4G0FP; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="evG4G0FP"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-572f6c56cdaso8480a12.0
        for <llvm@lists.linux.dev>; Mon, 06 May 2024 16:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715038241; x=1715643041; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rday+enGpH1mUN4w1iIrCf7IG9Q6aF8QR6lBBrCyZ7g=;
        b=evG4G0FPVzsxb5p4tvOZawbyuhtZW2nPxgRsDfMhdzPix8NG/M/cjgOlRFe5l5MydI
         mLOrCmedIhQ500qnCheDmN1IUws2OzpETdtJnloYZQjEe6r50wlJHu5+wTlTw/Pd/aRy
         I/W0soSgPNdPpMiCiLCsLnD0GudLD7rmHvGUSsTai4PyRGyHV7VOIahdiG0JYx5ROYJg
         jMwbjbeBvxAFwtPA6rye5dV37Yn5nlTnchLYTS93InJXrI/5+XykYGd3GZkg+h8s1LIB
         Nh3EKA1OWAi51epegzBHtBwLxxt2IlIp5RQjA3ld8iU8j8bR8VYUxotSl6c3FgVuHmyR
         tsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715038241; x=1715643041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rday+enGpH1mUN4w1iIrCf7IG9Q6aF8QR6lBBrCyZ7g=;
        b=OQ9PW3w2S7G8hvDJOxmD2CCSeQMIDfQX3lZrv/IKp9r90xEWM0u+9Zb140Ohp+b7nc
         xb9r4XTsAYfnu/qhV1Oeh/ahlw4TCcfGbJRR7Bb5B2jB/bOnveouqKViOEFz/jKaBvXw
         7Xht1kkZd18FAEFuSfc4UM3DXkmqmjJTKEVTkg70W0Gkh3ns0MkW8EZ50Wi1bA3sSF5R
         b3xlAjaowiHt03Rq5LI+C/HAYCpwgV2UIdIecyWQxLRRwJx6CC0bGENYiEWOb2pIgfjW
         wqWJSOvEzhmKWUpsSPlSm6ocB346RYwwOO60vAlQBsLqMgdkf01crs3D0xQdOBHR2WQo
         bfJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUl4RDSa6YdCrmR5AE86AleCL1WZZWyhR8DAJvsM2s0tVwUp4Hl0gehVmKWv9mj9JauHSupVvYXvjCZFgxX21CpWrYqSA==
X-Gm-Message-State: AOJu0YxN+94ATlb2MaZcUm0H7TQ20X2A1DB/MwSw3w9S+o2bHLC9CS9E
	RMYKadONk1lbg3sN/ju7+rcgemMcsOhGW1YctKGYzEh9rLv2fJNV/PySMb5Br7WSFoiqMARIb3J
	7VofiZJMjVPT5sgdGuwHYiLBAN0qxSWmnsQn6
X-Google-Smtp-Source: AGHT+IFPtbSaAcsaOKbHp6npYdFSTUzqld8pO8i1uwvZe0pXCtMxJsE/ukQM7Zz7NLIcHgg7/XYVun1u85SF7+71r+g=
X-Received: by 2002:aa7:d389:0:b0:572:554b:ec4f with SMTP id
 4fb4d7f45d1cf-5731316c507mr37653a12.3.1715038240800; Mon, 06 May 2024
 16:30:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240416152831.3199999-1-usama.anjum@collabora.com> <202404161027.63F4D4FDEB@keescook>
In-Reply-To: <202404161027.63F4D4FDEB@keescook>
From: Fangrui Song <maskray@google.com>
Date: Mon, 6 May 2024 16:30:27 -0700
Message-ID: <CAFP8O3Jjkh0U94CbS=epXELMtCBpYt4fGejX3spH4=GdF7zVSw@mail.gmail.com>
Subject: Re: [PATCH v2] selftests: exec: make binaries position independent
To: Kees Cook <keescook@chromium.org>, Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Eric Biederman <ebiederm@xmission.com>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Yang Yingliang <yangyingliang@huawei.com>, 
	kernel@collabora.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2024 at 10:28=E2=80=AFAM Kees Cook <keescook@chromium.org> =
wrote:
>
> On Tue, Apr 16, 2024 at 08:28:29PM +0500, Muhammad Usama Anjum wrote:
> > The -static overrides the -pie and binaries aren't position independent
> > anymore. Use -static-pie instead which would produce a static and
> > position independent binary. This has been caught by clang's warnings:
> >
> >   clang: warning: argument unused during compilation: '-pie'
> >   [-Wunused-command-line-argument]
> >
> > Tested with both gcc and clang after this change.
> >
> > Fixes: 4d1cd3b2c5c1 ("tools/testing/selftests/exec: fix link error")
> > Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>
> Thanks for this!
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
>
> --
> Kees Cook

GCC versions before 8.1 do not support -static-pie,
while https://www.kernel.org/doc/html/next/process/changes.html says
the minimal version is GCC 5.1.
Is this a problem?

If not, and CFLAGS is guaranteed to include -fpie/-fpic/-fPIE/-fPIC
(PIC), using -static-pie looks good to me.


--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
