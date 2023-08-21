Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903EEF9C1
	for <llvm@lists.linux.dev>; Mon, 21 Aug 2023 18:15:40 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-64c5f5d6f04so16982956d6.3
        for <llvm@lists.linux.dev>; Mon, 21 Aug 2023 11:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692641739; x=1693246539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f16g3dlm3PDplDbtrkl45zO6RDrmmDTeYGTidmrzBQ0=;
        b=JnVy9ycYPdyi6i70GY4h9cgWRRBCu1PFK2qdsvIOwnkOIqL6yV5yPaOgBlAFcZgsey
         wZq9BTY/2y0Mz054D2FiExeHpfNiaEJ1R6zu5FTGyKyHENgKEgwx+kN1ZUz0dV9GxPXy
         3RxdPczZtF+QNsR9zcapLA0COJ45oZOuD6G9rj+ladY41B6l3BfO4mLlMfOxYqO5w77R
         UxR/BSUpUdlMXS+9nHAbqqr2a7ef5Im0Gm35CJu9RVgAMaCCGOnHXk7/6wG3QGy5Mbem
         9+WWe4CdeIBov7vOa1XGLHoUDjsD+k7T9mkB0DZUYkpcMLvnjksUjXMPhWxTYYPsdUQe
         T6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692641739; x=1693246539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f16g3dlm3PDplDbtrkl45zO6RDrmmDTeYGTidmrzBQ0=;
        b=bEGQ+ntmXdC7h3rV6bFp3EeRhno7PyJ0dDOmlD4eX3KDPKvCZ43nSglevQKEXPdMAi
         IF4055okzVBd1evMb4wmMPYzT9+as/4NOulvlk9IBzHw2HNqma+gykHekKoorNwcAbGq
         vhPKm5Kkz/LPkSnHnbHvgW/4HVIJD4SgokS+EHaEPlk0L4cgUS163QjiWfu2b6e9i3AU
         OqWWtsBVoP3n1E8NqGTayirVU42AFm3eT8TQnMDv5e+04p1UCD1FXmSZb5/P6iZhWwtR
         WgYDE4LfHGlIQURMsoWpRvdz8rYofKWOwNheYQxVFqgpscnbj6tGd1Itr8ICmQLVCIqj
         oKrg==
X-Gm-Message-State: AOJu0YxIvjIZgtT7P5PIQDqfoEnmIBso5dPk2FXmReeikarVveXOeWYG
	ln66Mi717hMp3Ew42DUc4rSH5ZGI15Pz780GpMvBxQ==
X-Google-Smtp-Source: AGHT+IHZJDN20DzukhtxuIQhSEd9Yr13VQln9/JtmGVrNYcDpo6lHrVJl3E0IepjoM+TAKRmiv7avS5d3deTVxlN9ak=
X-Received: by 2002:a0c:f483:0:b0:64f:4be7:b6c7 with SMTP id
 i3-20020a0cf483000000b0064f4be7b6c7mr655466qvm.4.1692641738964; Mon, 21 Aug
 2023 11:15:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYtdRe5x=mS4Xonb+ZZsArO2o7vuNL+qJsv5DkNvcirQbA@mail.gmail.com>
In-Reply-To: <CA+G9fYtdRe5x=mS4Xonb+ZZsArO2o7vuNL+qJsv5DkNvcirQbA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 21 Aug 2023 11:15:28 -0700
Message-ID: <CAKwvOdmMYzDNK0+un0xossc4f7-A3=EZo11VnVx5Bf0THWhhpw@mail.gmail.com>
Subject: Re: clang-17: selftests: sgx: clang: error: -z noexecstack: 'linker'
 input unused [-Werror,-Wunused-command-line-argument]
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: clang-built-linux <llvm@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Nathan Chancellor <nathan@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 21, 2023 at 6:52=E2=80=AFAM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> Recently we have updated the toolchain clang-17 version.
>
> While building selftests sgx following warnings / errors noticed on the
> Linux next with clang-17.
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> sgx/main.o
> clang: error: -z noexecstack: 'linker' input unused
> [-Werror,-Wunused-command-line-argument]

Hi Naresh,
Thanks for the report.

I think in general for the kselftests, these aren't really
regressions; we've simply not spent the time to sit down and get them
all building.

That said, we should.

Since this isn't a recent regression, would you mind instead of
emailing the list instead file an individual issue at our issue
tracker per diagnostic identified?

https://github.com/ClangBuiltLinux/linux/issues

We are very active in tracking the progress on issues there. I would
love for you and the LKFT team to participate with us there.

https://github.com/ClangBuiltLinux/linux/issues/1698 is the meta issue
tracking the kselftest targets.

When we have a target building that regresses, then we should notify
the list, but until then I think it may be less noisy to get issues on
file.

>
> Links:
>  - https://storage.tuxsuite.com/public/linaro/lkft/builds/2UHhSg0TPLhjp9U=
q9EFceoQd0VL/
>
> Steps to reproduce:
>  - https://storage.tuxsuite.com/public/linaro/lkft/builds/2UHhSg0TPLhjp9U=
q9EFceoQd0VL/tuxmake_reproducer.sh
>
> tuxmake --runtime podman --target-arch x86_64 --toolchain clang-17
> --kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/2UHhSg0T=
PLhjp9Uq9EFceoQd0VL/config
> LLVM=3D1 LLVM_IAS=3D1 debugkernel cpupower headers kernel kselftest
> modules

Any chance you can extract the invocation of `make` from the above for
the bug reports?  I'm guessing

`make LLVM=3D1 debugkernel cpupower headers kernel kselftest`?
(LLVM_IAS=3D1 should be obsolete on mainline)

>
>
> --
> Linaro LKFT
> https://lkft.linaro.org



--=20
Thanks,
~Nick Desaulniers
