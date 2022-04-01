Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0772D137F
	for <llvm@lists.linux.dev>; Fri,  1 Apr 2022 18:09:00 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id e16so6283165lfc.13
        for <llvm@lists.linux.dev>; Fri, 01 Apr 2022 11:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cDwjoGJB3uaHFuAIBFbR4ek7hmngZ+0lbW3f3iNsO5k=;
        b=GSubB+1cDMGFa8yKeGrtGxfDBtDuMLQAGjk23JJoJ8aNs5sdavXaOgYkSf/nf0GHYu
         T9cmC9jS25/yY25NF38vMALmGDwCJ4OVHfJHfTZ/KP+xOnuVkTFKAdOU0x9OOAth1IDD
         F7pkjyySGx9Kd0WmrQXZqoLAgSvKETCQlJvFe2R1OuUhJhc3r5BceFZmAnGcp1NFvIME
         G35+vdrr/R2UCa6wL0kPI+JDPrY+s7TI4B2059nKBXAWcKfZ5JmWcN69TSZYzNhuTHab
         NuOoLpLawmcoMZ0QLtXzAljTxtHGoS7Xbt33pfpqz/DnqzObRgzsHnjj/tPgwV5ZZawn
         wzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cDwjoGJB3uaHFuAIBFbR4ek7hmngZ+0lbW3f3iNsO5k=;
        b=NRehlK3+/0gvx0L5teAxL8EZnt3ftEJeyF6lxfUVAKpc4TF+uZ9mXIboNPifW9IM3E
         G/QBD60OswFEdswDqvd5f70HejJW0N1Ynjv9uTn2Gm8Iv44zfSd3nAa6LGRSqv1aVKMF
         bhamkUAlkIE0Nlt7UqLO27nCGDXOn0ojNmegsqGXoEmiQwExr9HWY09sUTy453/oVy9C
         njU51KXv3Og2FlpQGwwhb6meZuqpieFBWpNhR5MEU33fNcA5iBZaFQydOqE/LYmQ30nH
         V47Laum1tDbp4JLUSsZmcQEX42+hSE5ibiEt1AuAJzZfibMyYAAcfRRvXcz2VSXO8Mwb
         UY7g==
X-Gm-Message-State: AOAM530n0OZEAv/OzrtOjxpItlXXVAnQiZnaIjMy4kGOwkB8c9LJ2qoW
	h16bo1U9tZ5QVAYpFA+LcdWFwE8p7doTZU5djD6mCUdPQejvuw==
X-Google-Smtp-Source: ABdhPJwlceMkrvjvasAE/t3p76pX3YxX+dVr/Cqg/gCq9YskmR4L43rIg+qa98Dz12LmyDojixnBFAbHA5wej0zSUq0=
X-Received: by 2002:a05:6512:33d4:b0:44a:9971:de48 with SMTP id
 d20-20020a05651233d400b0044a9971de48mr14666255lfg.392.1648836538854; Fri, 01
 Apr 2022 11:08:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <e04d5fa.21259.17fe40edf13.Coremail.sunch20@lzu.edu.cn>
In-Reply-To: <e04d5fa.21259.17fe40edf13.Coremail.sunch20@lzu.edu.cn>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 1 Apr 2022 11:08:47 -0700
Message-ID: <CAKwvOd=UuF_PuVNUchmeUDiuupf+-11cpAm_R8NhFi2JDHCLqA@mail.gmail.com>
Subject: Re: Inquiry about how Clang supports the kernel
To: =?UTF-8?B?5a2Z6ZOW?= <sunch20@lzu.edu.cn>
Cc: clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+ our public mailing list

On Fri, Apr 1, 2022 at 12:37 AM =E5=AD=99=E9=93=96 <sunch20@lzu.edu.cn> wro=
te:
>
>     Hello=EF=BC=8CI am a graduate student at Lanzhou University in China,=
 Sun Cheng. We now have a small RTOS that is compiled with GCC by default, =
and we want to get the Clang/LLVM compiler to support it as well. But I don=
't have any idea about how to implement it, so I am sending you an email an=
d hope I can get some advice from you.
>     I would be very grateful for your help!

Hi and thanks for reaching out!

Clang is designed to be a drop in replacement for GCC (and CL.exe) in
terms of command line arguments and supported language extensions.
It's not a perfect substitute, but it does rely on LLVM for
competitive codegen and compile time with contemporary compilers.
LLVM also features substitutes for most of GNU Binutils command line
utilities, which we generally use when building the Linux kernel.

One of the first things to check for your RTOS is see if the build
system allows you to specify the compiler that's invoked.  For
instance, rather than hardcoding `gcc` in a bunch of places, if your
build system uses a placeholder or variable with default value that
can be overridden, then you would be able to specify `clang` perhaps.
From there, you might find that some command line arguments are not
supported by clang, or some code might have portability issues and
won't compile. Once it builds, code reliant on UB or unspecified
behavior might not run as expected.  But being to build+run code built
from 2 different toolchains generally leads to higher quality
implementations.

Another thing you can to to verify that you've wired up your build
system correctly is to see if you can build with clang in an
environment that does not have GCC installed. We call that a hermetic
build system, in which build dependencies have to be fully specified,
and aren't implicit based on the host.  That also helps improve
portability of the build.
--=20
Thanks,
~Nick Desaulniers
