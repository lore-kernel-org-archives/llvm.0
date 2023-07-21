Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906FE27F00
	for <llvm@lists.linux.dev>; Fri, 21 Jul 2023 17:46:58 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-444c42f608aso881201137.1
        for <llvm@lists.linux.dev>; Fri, 21 Jul 2023 10:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689961617; x=1690566417;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3iE2bAwWgeCJ+z5V0WOIFlzbI5xYOdhtW9D3laGhsM=;
        b=iixWGnZiYEfXnoL+u0dFQQKocn4uaP4Osx9uXJ1Vz9iWe+Ec4qOIsNUTA6xzrMyBfJ
         HXcXmg1YoQtQu+xXKt7W5jsf+ooOdIl6SHzg2D6ITu2Zm5l0NwfQhmY5KLmEjhBWDQXu
         x/OCgzPPznINuQICCFHvydxYs0Y633cuZfyOjsXn1DUjiYwmBby9MLbHXzHPkR6+1Gw+
         E/23WvFKEdLzo7BdZTaUqzRbafhWnqrSLRf1mPR7zQb9m4I9Fp3nmGfboR3IiDeKo5Ey
         0Sqj72RJSwvI8gYu59B8BfBL9Kd7x0Zrr1q3gtfiHWs0BOObeY7xdcmrqvdtOrkb+M0h
         GAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689961617; x=1690566417;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3iE2bAwWgeCJ+z5V0WOIFlzbI5xYOdhtW9D3laGhsM=;
        b=lCzBLUy/rXmFqmwwv9N9auZIFUnR1/Dw/zqLiglHnYX6ehxmLGzpLakdarcjNigkVz
         LoTBWqot6Jp5FALLZIofNMe2jhOJRmZaOnpl1xwIhnR6EwxHTKfZiDEwQb6zIde3idLI
         uGxRKCPBkfOiG1jNVEy62dPammAL62uqIbnfFC4OPyeELZM/Qvo6i3uGxRRE/4Cvu3gl
         PfSG6SpRmQcQ5SZ+vpjJOFmcUuB+77bBzQOKNZPapyypqYjThI10wBKtTVoh1JChAsuV
         6o1QvYhexVBQFNdM9A+1CJRzFeUh3wCInAsOrJCen1mylzAIhdXeo7Trt7Kt2EWUltBi
         iUmg==
X-Gm-Message-State: ABy/qLaHBgLF1uJhOos9kzJ6soGsv35QfxOhWqWKQa81hAm2i6VeM9T0
	gQ/bqeGE7AkprMXoxSYPL2DxTZhimsi+9/eFjHk6d8deCJD1Lw1grps=
X-Google-Smtp-Source: APBJJlFdaAB3Yyns7cvTNLplrvAfU9+7jv8Sq1gJ2F6Ui6pc1BWcvZiMadJ5dLipoMm6Py1UTjt2oMyaLOyPp2XuEAg=
X-Received: by 2002:a67:fb58:0:b0:443:5bec:a2fd with SMTP id
 e24-20020a67fb58000000b004435beca2fdmr609390vsr.18.1689961616945; Fri, 21 Jul
 2023 10:46:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <e04d1d5b-518b-bebd-aa7a-70b87bc4e867@kernel.org> <e185087d-8df2-2457-0c93-4b638fdee05c@collabora.com>
In-Reply-To: <e185087d-8df2-2457-0c93-4b638fdee05c@collabora.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 21 Jul 2023 10:46:45 -0700
Message-ID: <CAKwvOdk6jUhwtrks5SYh59eD3o+Z4uxwJgeyOZHLTG6p_vzqqg@mail.gmail.com>
Subject: Fwd: [ANNOUNCE/CFP] Kernel Testing & Dependability Micro-conference
 at LPC 2023
To: clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Note the "Using Clang for better testing coverage" suggestion below.

---------- Forwarded message ---------
From: Guillaume Tucker <guillaume.tucker@collabora.com>
Date: Fri, Jul 21, 2023 at 10:16=E2=80=AFAM
Subject: Re: [ANNOUNCE/CFP] Kernel Testing & Dependability
Micro-conference at LPC 2023
To: shuah <shuah@kernel.org>, <linux-kselftest@vger.kernel.org>,
<linux-kernel@vger.kernel.org>, kernelci@lists.linux.dev
<kernelci@lists.linux.dev>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>


+kernelci

On 19/07/2023 23:34, shuah wrote:
> Hello,
>
> I am reaching out to announce that we are once again planning to
> gather to discuss testing and dependability related topics at the
> Kernel Testing & Dependability Micro-conference at LPC 2023.
>
> We invite you to submit proposals for discussion:
> - https://lpc.events/event/17/abstracts/1430/
>
> The Linux Plumbers 2023 Kernel Testing & Dependability track focuses on
> advancing the current state of testing of the Linux Kernel and its relate=
d
> infrastructure. The main purpose is to improve software quality and
> dependability for applications that require predictability and trust.
>
> We aim to create connections between folks working on similar projects,
> and help individual projects make progress.
>
> This track is intended to promote collaboration between all the communiti=
es
> and people interested in the Kernel testing & dependability. This will he=
lp
> move the conversation forward from where we left off at the LPC 2022 Kern=
el
> Testing & Dependability MC.
>
> We ask that any topic discussions focus on issues/problems they are facin=
g
> and possible alternatives to resolving them. The Micro-conference is open=
 to
> all topics related to testing on Linux, not necessarily in the kernel spa=
ce.
>
> Suggested topics:
>
> - KernelCI: Topics on improvements and enhancements for test coverage
> - Growing KCIDB, integrating more sources (https://kernelci.org/docs/kcid=
b/)
> - Sanitizers
> - Using Clang for better testing coverage
> - How to spread KUnit throughout the kernel?
> - Building and testing in-kernel Rust code.
> - Explore ways to improve testing framework and tests in the kernel
>   with a specific goal to increase traceability and code coverage.
> - Explore how do SBOMs figure into dependability?
>
> Proposals can be submitted here, by August 20th:
> - https://lpc.events/event/17/abstracts/
>
> Please reach out to MC leads:
>      Shuah Khan (shuah@kernel.org)
>      Sasha Levin <sashal@kernel.org>
>      Guillaume Tucker <guillaume.tucker@collabora.com>
>
> thank you,
> -- Shuah




--=20
Thanks,
~Nick Desaulniers
