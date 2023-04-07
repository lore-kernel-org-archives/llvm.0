Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11665AD22
	for <llvm@lists.linux.dev>; Fri,  7 Apr 2023 20:00:00 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id y19so24958734pgk.5
        for <llvm@lists.linux.dev>; Fri, 07 Apr 2023 13:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680897600; x=1683489600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjAQpZ3P5/kgKKUseQN+C8hGKXm2+H7ZkT4BzbfR8Fo=;
        b=Lb0Ga8zwodeySz593bYtheEuGKpvcY9YIXjoyyX4mT7x1LcGMW8lQ73BAyRoMkJnuA
         U5T1u9GmsxTQAZOozZHmonZOwP0+bMUoml8iOUwm67MOPu+l4fkHa9D9R07CCR5xOaXI
         7SG492wt3w3Lb0ogFOK6ZvRt6eJB+tC/EQY5whtZCgIXHeykH6Dy43GD3CMz0Z8QA0s0
         3Ppi6/BvkgLMSqg1XzB+Dk8D7Zllt9a++P7+nVEvfIzIXMe+Pur8W5M2FpFGGGxE3hkN
         GnJtv8J/KuMck0GPF9JDcQc1WBETo82PqLSek7HpSu6mYUEj8hjKp6wyzBWLOzo1+vPi
         0mYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680897600; x=1683489600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JjAQpZ3P5/kgKKUseQN+C8hGKXm2+H7ZkT4BzbfR8Fo=;
        b=78VhlQ6FtduNrrlur9nwsRuf0z4Fs5/ggfeJRY6SoyqnbI9o4ZCG0mrYemVeVmltg6
         SFfXsjY6uUPm96tLXxlU5N1Hu7341oeCCDsbhbEb16ORYlqJKAX/JrrVSqTbnMuysSYH
         CWKULEhNfIpx05LMKBu3+YNWYEpp/kKZTg6aduWKLIaF5Yo7+J6Kz37ks2xmAS3+SXAd
         +vFF46AxJRQnqs34LnLlpB3qE1/5zVLP9lxLB0ASuexT6HxHVZH8CmGT6Y7PDlCJkb88
         fJcvGUcAHtBMz6PH6vU7I9gqaGTqzx5QQpsfVxJtBGTvvlz/63Mi31ZVajPDqsj2o2oD
         RB4A==
X-Gm-Message-State: AAQBX9f2PsRd7WXOMu3IwXdp1SHYsOFzcEbtc+AQm7mv4B/h/EURT3nt
	WxRgfUY62f+g1HqbZ9BXOPIB4lrK6qXqZQtN+WWTj5gLtCEO8Pi3ZO8=
X-Google-Smtp-Source: AKy350aZ10fpP1uNZLdHCoSPvLrIsXMMPJkw6vRI9cpv6rVDNj4+tZzceQBSaTDtuokxPAy1Qa1W0xEmYmRR0JzNqGw=
X-Received: by 2002:a63:db47:0:b0:4fc:d6df:85a0 with SMTP id
 x7-20020a63db47000000b004fcd6df85a0mr732260pgi.1.1680897600271; Fri, 07 Apr
 2023 13:00:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK_uB7iP=6Rjo6hGbDC9tq8+NE1ip=Zu-LwUDG=94sD4A-zKZA@mail.gmail.com>
 <CAKwvOdm9m8UtUVF1xYoheSnk_mHzZKDa68QJP2biF+ax_1mP6w@mail.gmail.com> <CAK_uB7iqftfEgX+GWMtcFwJhfMDCHZwdO26R-dXCL-ChR2SgtQ@mail.gmail.com>
In-Reply-To: <CAK_uB7iqftfEgX+GWMtcFwJhfMDCHZwdO26R-dXCL-ChR2SgtQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 7 Apr 2023 12:59:49 -0700
Message-ID: <CAKwvOdne=8KXzkn_jDfjqFTcu1SYyTrCTPe1BtCVj+8F3sk7UA@mail.gmail.com>
Subject: Re: How to compile Linux kernel to llvm bitcodes?
To: tr4v3ler <0xtr4v3ler@gmail.com>
Cc: clang-built-linux <llvm@lists.linux.dev>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 20, 2023 at 7:14=E2=80=AFPM tr4v3ler <0xtr4v3ler@gmail.com> wro=
te:
>
> I would like to compile all C files into. ll or. bc to facilitate analyzi=
ng the entire kernel.

So there's a make target compile_commands.json. That will give you a
json list of triples that contain the exact command used to compile
the kernel. It's probably 10 lines of python to parse that, then rerun
the exact command used the build each translation unit with -emit-llvm
and -S (or not depending on if you want .ll or .bc).  That will give
you a .ll/.bc for everything that's built as part of your config for
that configuration.

Otherwise, kbuild has rules to do:

$ make LLVM=3D1 lib/string.ll

There's no support for .bc (would be trivial to add) because you
typically end up running llvm-dis on .bc files to get .ll files
anyways.  I almost never use .bc files.

>
> Nick Desaulniers <ndesaulniers@google.com> =E4=BA=8E 2023=E5=B9=B43=E6=9C=
=8821=E6=97=A5=E5=91=A8=E4=BA=8C 01:12=E5=86=99=E9=81=93=EF=BC=9A
>>
>> On Mon, Mar 20, 2023 at 2:53=E2=80=AFAM tr4v3ler <0xtr4v3ler@gmail.com> =
wrote:
>> >
>> > Hi=EF=BC=8CI found the following compilation targets in the makefile(h=
ttps://github.com/torvalds/linux/blob/master/scripts/Makefile.build#L136) o=
f the Linux kernel. However, I don't know how to make this goal effective, =
compile the Linux kernel, and generate llvm bitcodes. Do I need to specify =
specific parameters for the make command? Or through environment variables?
>>
>> What precisely are you looking for? A single .ll file? A single .bc
>> file? .ll or .bc files for every translation unit?
>> --
>> Thanks,
>> ~Nick Desaulniers



--=20
Thanks,
~Nick Desaulniers
