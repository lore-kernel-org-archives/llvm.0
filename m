Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15862FAF
	for <llvm@lists.linux.dev>; Wed, 22 Mar 2023 16:40:58 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id y14so19617383ljq.4
        for <llvm@lists.linux.dev>; Wed, 22 Mar 2023 09:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679503256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=scYlvuYnUfIO+ytvcQ1WgmMTc6bJHOSg7B8uMz0Bpnw=;
        b=ENhKu62sEGygmpYVXYnyZ+wza3E6eVReMpyEbPfstSh3doe6+xBn0m3mh4kNzH44z8
         mhbZcXA5KQbpToKHUsMRVU7iRNXGq9rl9zm3u8NF14qmHh8y8aP+dRwGiv2QXqpBKAHu
         KofmS5ShKQVEFrbRhKF3zWynciqo9qDTYgN7Bu3qanZCYEcuiCCFk4lfzbGFujMgaYZj
         XJu+oTbAIz+xLoOreu608scgXFJjub5oUUjPScYvbhQ7hS+6Jqs5eP9XRPu9oBPXqLAj
         Cix2i1PqZyYigtNMYcaS5KMrkP0Gvk7vDJJbtLHeyvzP89jHDP5NSA3FrrbmgYytRi1m
         lXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679503256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=scYlvuYnUfIO+ytvcQ1WgmMTc6bJHOSg7B8uMz0Bpnw=;
        b=EwtB12FsOqQ+GL3VUcahxw+NGIrRlKHwuq8+Cz1E5qR2rhaLAk3YVG3t7w+gQHcyjM
         BQWRsBGDsmwrJbP+d9Wrb3aJaLDeT8+nmOEqhM6W5QOn5TgPF0RXPBO+3rqWn2J7pJ0g
         3UNrlLZz275soltSXLpwLJvgFIPVEnqlteTmKWr18JK4Ht/c104Pa7zClQl8UK9N8e43
         qcZhN9UsWvmpTj+4hDzU1V15J5uNPvd5fH9/JJolNQIrDDXvzzJ8D7EB23i9xgjwh6YL
         Pd1g0hpDG54HcQHsOde7GDJGBudZ3GarElFaM1IGGDCgdwidHW9M8c7nWSc+D/Jj+wqO
         zVIg==
X-Gm-Message-State: AO0yUKWqcfKYYUqy1/G+a9Bx+Qobh0DT+luPeWdPFHaZz1030Q4SdDnS
	lACmMrk92u7G0NnJWniKsUYiqzqzab2H1z75i4M=
X-Google-Smtp-Source: AK7set+PkDCGdPW8BcSm3drm+jFs+5IZP+ddpS2jxDz62nJJg0paKgp1Wv52fMUBHaESCZ7BfXnmXdkhyl5LO/JRib8=
X-Received: by 2002:a2e:9ece:0:b0:298:7034:836e with SMTP id
 h14-20020a2e9ece000000b002987034836emr2170491ljk.8.1679503256122; Wed, 22 Mar
 2023 09:40:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=wiPd8R8-zSqTOtJ9KYeZLBByHug7ny3rgP-ZqzpP_KELg@mail.gmail.com>
 <20230320180501.GA598084@dev-arch.thelio-3990X> <CAHk-=wgSqpdkeJBb92M37JNTdRQJRnRUApraHKE8uGHTqQuu2Q@mail.gmail.com>
 <20230320185337.GA615556@dev-arch.thelio-3990X> <87pm91uf9c.fsf@kernel.org>
In-Reply-To: <87pm91uf9c.fsf@kernel.org>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Wed, 22 Mar 2023 17:40:15 +0100
Message-ID: <CA+icZUUYyqhV2HFzVtpi_KjBoYxjk7OB0UBVd2mX6abjmYhDjg@mail.gmail.com>
Subject: Re: Linux 6.3-rc3
To: Kalle Valo <kvalo@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-toolchains@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 1:49=E2=80=AFPM Kalle Valo <kvalo@kernel.org> wrote=
:
>
> Nathan Chancellor <nathan@kernel.org> writes:
>
> > On Mon, Mar 20, 2023 at 11:26:17AM -0700, Linus Torvalds wrote:
> >> On Mon, Mar 20, 2023 at 11:05=E2=80=AFAM Nathan Chancellor <nathan@ker=
nel.org> wrote:
> >> >
> >> > On the clang front, I am still seeing the following warning turned e=
rror
> >> > for arm64 allmodconfig at least:
> >> >
> >> >   drivers/gpu/host1x/dev.c:520:6: error: variable 'syncpt_irq' is un=
initialized when used here [-Werror,-Wuninitialized]
> >> >           if (syncpt_irq < 0)
> >> >               ^~~~~~~~~~
> >>
> >> Hmm. I do my arm64 allmodconfig builds with gcc, and I'm surprised
> >> that gcc doesn't warn about this.
> >
> > Perhaps these would make doing allmodconfig builds with clang more
> > frequently less painful for you?
> >
> > https://lore.kernel.org/llvm/20230319235619.GA18547@dev-arch.thelio-399=
0X/
>
> Thank you, at least for me this is really helpful. I tried now clang for
> the first time but seeing a strange problem.
>
> I prefer to define the compiler in GNUmakefile so it's easy to change
> compilers and I don't need to remember the exact command line. So I have
> this in the top level GNUmakefile (all the rest commented out):
>
> LLVM=3D/opt/clang/llvm-16.0.0/bin/
>

Welcome to the LLVM/Clang world!

First try - First Cry...

In my build-environment I add (export) /path/to/llvm/bin to $PATH and
pass single CC LD AR etc. (what is substituted by LLVM=3D1):

make CC=3Dclang LD=3Dld.lld AR=3Dllvm-ar NM=3Dllvm-nm STRIP=3Dllvm-strip \
 OBJCOPY=3Dllvm-objcopy OBJDUMP=3Dllvm-objdump READELF=3Dllvm-readelf \
 HOSTCC=3Dclang HOSTCXX=3Dclang++ HOSTAR=3Dllvm-ar HOSTLD=3Dld.lld

Equivalent to:

make LLVM=3D1

I cannot comment on `make LLVM=3D/path/to/llvm/` and/or combinations
with `LLVM=3D1` as I have never used it

> If I run 'make oldconfig' it seems to use clang but after I run just
> 'make' it seems to switch back to the host GCC compiler and ask for GCC
> specific config questions again. Workaround for this seems to be adding
> 'export LLVM' to GNUmakefile, after that also 'make' uses clang as
> expected.
>

You have to pass `make LLVM=3D1` in any case... to `oldconfig` or when
adding any MAKEFLAGS like -j${number-of-available-cpus}.

Hope that helps.

Best regards,
-Sedat-

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/kbuild/llvm.rst
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/kbuild/llvm.rst#n52
