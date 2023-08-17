Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D1714011
	for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 15:54:53 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-649edb3a3d6so4137386d6.0
        for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 08:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692287693; x=1692892493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdyk/H9C92iJ/nBsFz7KxfsAvK+nt2wqCERHewxGWDU=;
        b=cSQl7yt9otQXr+oR1mB0nAUMSggLBbl+x+yeuUh1BRvaPLY+5BVUHA9XY5vpaXnLwQ
         I+HaTYsLWZHnC7qtaOHGmjwLl2/5BHmdv59N00yHP6YIcH7jJklGoMStSDd1TVKHohCi
         pampRnwpD239s80gaLdHchFzC+a0w1oyAyFF1jWVzncrcQ0lgekpayKIU84Rd1wDjF4I
         2/9khJ3u2ek6tzpqBd6IcgbZJC/89kWqNXeD8h1HeTAz3F/rP/W+L+zXszK4BEOLJ0b4
         3bbWj4Gz0sm0DQOMRz2udncq5GAXL9t8Thff9BLCqlRWq9CksSuetZI7++mKz8RzoAHd
         WVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692287693; x=1692892493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdyk/H9C92iJ/nBsFz7KxfsAvK+nt2wqCERHewxGWDU=;
        b=PjbW/+wo5s5cK6CuCl5r5cPvm9s/tC+uiV22ZJiYMj2pmglxE2+J6CIgs82+56V3Gs
         FY2I4tdMcNuFNcPXcJbBk94vs9hB6FNL8JGcrQDHyyHJKEpup2bnXkqUw0NMVEfHnFZm
         7MOxiSluIa/2IX8msEyjaHNoiIysBtSE1Q1+H1NFwsb+7UNe5PPL43A9tr2qRL8dedlq
         mPHVl3I2AByy4+nF7y1dvaUgy1EIbb/Jjft3EXuOz+XOQbTWMeUydr680tW+SBDlYTPH
         Ki0sGY5YgKP2ksE3BRwHuZpWhj717PVPyHLteDGqYeS2Vt8VGvZPRwLgWZHOV+OqXtR3
         F8sA==
X-Gm-Message-State: AOJu0Yzd9Xdw0N42bguh0qzG1oZyQQgra3e2hB0pq5CMIJeMTyGAS77r
	dTdXyDjWoAkE/zCyBHNZI2oG9PVs6QTUj5eMFBJ1fw==
X-Google-Smtp-Source: AGHT+IHBoKIXOzw8g/P24SXKwipUqCn2o2dUKOdGE5ZCNm3euEjtUFmlPq+7vYSmTIjnuxYVtNffFqtgOHvxVmtNMww=
X-Received: by 2002:a0c:e094:0:b0:61b:65f4:2a15 with SMTP id
 l20-20020a0ce094000000b0061b65f42a15mr4345292qvk.12.1692287692656; Thu, 17
 Aug 2023 08:54:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYvFD-kE0+EGWkwcnR1DXRxh7p7OwQThJ6KWxYWVROJ4+A@mail.gmail.com>
In-Reply-To: <CA+G9fYvFD-kE0+EGWkwcnR1DXRxh7p7OwQThJ6KWxYWVROJ4+A@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 17 Aug 2023 08:54:41 -0700
Message-ID: <CAKwvOd=h4aFisiY0w0awKkxk+i-aJM5+QbExYnboqzojLigx1Q@mail.gmail.com>
Subject: Re: landlock: fs_test: fs_test.c:4524:9: error: initializer element
 is not a compile-time constant
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: clang-built-linux <llvm@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	lkft-triage@lists.linaro.org, Shuah Khan <shuah@kernel.org>, 
	Anders Roxell <anders.roxell@linaro.org>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 17, 2023 at 3:51=E2=80=AFAM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> While building selftests landlock following warnings / errors noticed on =
the
> Linux next with clang-17.
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> Build errors:
> ------------
> landlock/fs_test
> fs_test.c:4524:9: error: initializer element is not a compile-time consta=
nt

Hi Naresh,
Can you tell me more about your specific version of clang-17?

I believe a fix of mine to clang should address this. It landed in
clang-18, and was backported to clang-17 recently.
https://github.com/llvm/llvm-project-release-prs/commit/0b2d5b967d983757938=
97295d651f58f6fbd3034

I suspect your clang-17 might need a rebuild.  Thanks for the report.

>  4524 |         .mnt =3D mnt_tmp,
>       |                ^~~~~~~
> 1 error generated.
>
> Links:
>  - https://storage.tuxsuite.com/public/linaro/lkft/builds/2U69ue7AaypfY7e=
RU4UUygecrDx/
>
> Steps to reproduce:
> tuxmake --runtime podman --target-arch arm64 --toolchain clang-17
> --kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/2U69ue7A=
aypfY7eRU4UUygecrDx/config
> LLVM=3D1 LLVM_IAS=3D1 dtbs dtbs-legacy headers kernel kselftest modules
>
> --
> Linaro LKFT
> https://lkft.linaro.org
>


--=20
Thanks,
~Nick Desaulniers
