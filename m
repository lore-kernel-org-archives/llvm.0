Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2484693
	for <llvm@lists.linux.dev>; Wed,  9 Aug 2023 06:25:11 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-44768737671so2484841137.2
        for <llvm@lists.linux.dev>; Tue, 08 Aug 2023 23:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691562311; x=1692167111;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CH4TGJEPAdBC6NjBXoK01yC3B5N+WMqmtilRzRbkims=;
        b=f41qEX0W5lLISZ0Nfjc46G7zq/I6E34u/BND0DyKao8ZtoIeCJNHB9tivdYif2qObT
         egfnFaMP3JtWgLS3I0zr7+PPi9NIXZBqvDmRw/k28hztr4io0Agt8lMoxOJ07jAJ/bc5
         tff/XVcVWmkAzVr6cZwX1GVE4Pjt7zo4smTb5ZVbBmLIOVPHO970rQJaQaTOODytR+Od
         ohyo95yl5/+HRm7dIilW7DjUfhaao/zPZzPAIQXsyLaFHe/z5zelyb4alx0d9sPEonkB
         +/+pvYsu3XOIBMSHiM4z958wB3dfpCLqoljlYMf5G92rC5Qagx9/+8S28M7n8IaSuLe+
         bWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691562311; x=1692167111;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CH4TGJEPAdBC6NjBXoK01yC3B5N+WMqmtilRzRbkims=;
        b=OBArVt+rdRhcFoJuD1XMn/alaRcdEow+/vtcUtD1WtkOFlzvkAkAMvk242icrE6903
         vGduE5SsaGsgKDK1fnMWigeH+HaHwba71kXR+OLkGqRDgmUvl7aKbsaSdXASIcStmezY
         xQ2l9c2hWkwAJI3IPKQy9xBpZwPFRewkPFUfe8aUIz0/Ij8vYjTU3V4peVJM/oi+IVH4
         XvGX2vUtNdX9V7NZi2mLASr2Xrzs7iSbW217wq5TitdPTd6Jts/vEm6jvhjQW4egkP7t
         k257id8NQg/BQLTdlhHcLZ17HKmh5/mfAr3VC8cpkFCz9z+vxDhMZsct/aMKtC4bGn5w
         VSdw==
X-Gm-Message-State: AOJu0YzlmtgYooJ5MzVeGtYK3iF55N1iaYjaUT2A1jHEt3HguC7HFMwk
	BD1KfHX7jAw1ArLwdL/WGSJy/cEwWqIzfnoW104CIw==
X-Google-Smtp-Source: AGHT+IEollPvCnxSCgZPUkQFllEv9ntre1aTV2g6cdDF/eJM4k4KOdW/tK4KVfKouozYky01aD7Wp2qDzz/Xi+cjCLc=
X-Received: by 2002:a05:6102:3168:b0:443:8a7b:f76d with SMTP id
 l8-20020a056102316800b004438a7bf76dmr2057531vsm.28.1691562310886; Tue, 08 Aug
 2023 23:25:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYsdUeNu-gwbs0+T6XHi4hYYk=Y9725-wFhZ7gJMspLDRA@mail.gmail.com>
In-Reply-To: <CA+G9fYsdUeNu-gwbs0+T6XHi4hYYk=Y9725-wFhZ7gJMspLDRA@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 9 Aug 2023 11:54:59 +0530
Message-ID: <CA+G9fYvDa-u22+gXt7VRWcQkCJFHvt2FPnjFmbwLX0bY__QrLg@mail.gmail.com>
Subject: Re: ld.lld: error: ./arch/x86/kernel/vmlinux.lds:191: at least one
 side of the expression must be absolute
To: linux-stable <stable@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

also noticed on stable-rc 5.15 and 5.10.

On Wed, 9 Aug 2023 at 11:40, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> While building Linux stable rc 6.1 x86_64 with clang-17 failed due to
> following warnings / errors.
>
> make --silent --keep-going --jobs=8
> O=/home/tuxbuild/.cache/tuxmake/builds/2/build ARCH=x86_64 SRCARCH=x86
> CROSS_COMPILE=x86_64-linux-gnu- 'HOSTCC=sccache clang' 'CC=sccache
> clang' LLVM=1 LLVM_IAS=1
>
> arch/x86/lib/retpoline.o: warning: objtool: .altinstr_replacement:
> unexpected end of section
> ld.lld: error: ./arch/x86/kernel/vmlinux.lds:191: at least one side of
> the expression must be absolute
> ld.lld: error: ./arch/x86/kernel/vmlinux.lds:192: at least one side of
> the expression must be absolute
> ld.lld: error: ./arch/x86/kernel/vmlinux.lds:191: at least one side of
> the expression must be absolute
> ld.lld: error: ./arch/x86/kernel/vmlinux.lds:192: at least one side of
> the expression must be absolute
> ld.lld: error: ./arch/x86/kernel/vmlinux.lds:191: at least one side of
> the expression must be absolute
> ld.lld: error: ./arch/x86/kernel/vmlinux.lds:192: at least one side of
> the expression must be absolute
> make[2]: *** [scripts/Makefile.vmlinux:34: vmlinux] Error 1
> make[2]: Target '__default' not remade because of errors.
> make[1]: *** [Makefile:1255: vmlinux] Error 2
>
>
> Build links,
>  - https://storage.tuxsuite.com/public/linaro/lkft/builds/2TiTUgExGs7SrTm9Lb4fakgeTfw/
>  - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.1.y/build/v6.1.44-117-g74848b090997/testrun/18917095/suite/build/test/clang-lkftconfig/details/
>  - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.1.y/build/v6.1.44-117-g74848b090997/testrun/18917095/suite/build/test/clang-lkftconfig/history/
>
> Steps to reproduce:
>   tuxmake --runtime podman --target-arch x86_64 --toolchain clang-17
> --kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/2TiTUgExGs7SrTm9Lb4fakgeTfw/config
> LLVM=1 LLVM_IAS=1
>   https://storage.tuxsuite.com/public/linaro/lkft/builds/2TiTUgExGs7SrTm9Lb4fakgeTfw/tuxmake_reproducer.sh
>
>
> --
> Linaro LKFT
> https://lkft.linaro.org
