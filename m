Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65011AFE7
	for <llvm@lists.linux.dev>; Fri,  7 Apr 2023 22:21:39 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id g3so651873pja.2
        for <llvm@lists.linux.dev>; Fri, 07 Apr 2023 15:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680906099; x=1683498099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ro+RVMdXK0NBTuXcel+kdAi7VofZgmQkuCbPGk/bESM=;
        b=b95Ssk747zg+RLEJbR0eO9a1MTDJxYdYnUaZTntSjmS2Rj4HVQ8Jpr0jZIFvMf3fEw
         UOjhsNNB8uqim16QdTBygc9+Ru04GsVKmc5clvuYGGNrEcC19SRfMZ8m/fqKN3OlJPhI
         +X+VRLKwHQ1JOzD4Y4tXdWCYFWtPYYvOYUjJlWzNpyMeyUtUI3fxOgie7g/L+VLkN985
         ss+2cWkPg3uatul3K6jokZN6JROuxVKU/5VeJqzvFoIfcdQG3rzrnuQ53C+KwQddQHCp
         Q5dL8QsHMyMX/sda2+VrNd650x5TMRl+1hGtk3SMZYYpbnLlx/R+gaAdt0FP/EesEB2o
         x6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680906099; x=1683498099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ro+RVMdXK0NBTuXcel+kdAi7VofZgmQkuCbPGk/bESM=;
        b=qU0LxNpewKxkWOhfI43m7hl69kLZhtJC5Y5bLpzRPH5DUqP7wZy+y+KvuDeeucfOnH
         faZhpXiu9hrM6NTXPf9+XQ+AgOwcqdpIo0e5zmQUg535dJdsg0Q8MXrHmASkx4BT5GFu
         j7th2EBh+uWTGq5BZ2paHgxQATCuqOteUKkgEzbuQFbNbn9ZVNHOeCqWVqvej/pazMIA
         TM4oqDnqAmr5zxeuIrk02huCCHRnqgCAZJ+TuryclG24vpBhIIOe/M0eADKsXj5YWHCf
         DHTOOj55c57UwpfUlJgJEy6EdKmSnm03C/eOEwYreiimi9gd3A44nKjDKibBHFB/yYUF
         U9Fg==
X-Gm-Message-State: AAQBX9c23qQVmF3A8q2ZN4pZ91IZfQM4gomWSBx/C0Kyft7YKbYRO///
	HF/20Jj4JPOW3o8OAnNgBasW1mx4LJ8Ggea0hAGcYlRHFi3WAL2Pxd1igA==
X-Google-Smtp-Source: AKy350bY2iOq+vIPV8oG7runqpk5KeZ0u5OtC5YkazMnPPKV8eLNQwNE533J4ChDGGPTWyiU9G60StkN8QZEZF9a0yQ=
X-Received: by 2002:a17:90a:a606:b0:246:706c:4f54 with SMTP id
 c6-20020a17090aa60600b00246706c4f54mr92664pjq.7.1680906098661; Fri, 07 Apr
 2023 15:21:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230407102721.14814-1-jiaxun.yang@flygoat.com>
 <20230407102721.14814-5-jiaxun.yang@flygoat.com> <CAKwvOd=2ChEH1goXpi=nYTcouwLgKP1fnkN31AuqROKj0uc2kg@mail.gmail.com>
In-Reply-To: <CAKwvOd=2ChEH1goXpi=nYTcouwLgKP1fnkN31AuqROKj0uc2kg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 7 Apr 2023 15:21:27 -0700
Message-ID: <CAKwvOd=k6ySaGgHF_J3vnaOpq2+wHSjZ6ab9H5_MmJutCKiVTQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] MIPS: Detect toolchain support of o32 ABI with 64 bit CPU
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org, llvm@lists.linux.dev, 
	tsbogend@alpha.franken.de, nathan@kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 7, 2023 at 3:19=E2=80=AFPM Nick Desaulniers <ndesaulniers@googl=
e.com> wrote:
>
> On Fri, Apr 7, 2023 at 3:27=E2=80=AFAM Jiaxun Yang <jiaxun.yang@flygoat.c=
om> wrote:
> >
> > LLVM is not happy with using o32 ABI on 64 bit CPU, thus build 32 bit
> > kernel is unsupported.
> >
> > Detect this in Kconfig to prevent user select 32 bit kernel with
> > unsupported toolchain.
> >
> > Reported-by: Nathan Chancellor <nathan@kernel.org>
> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>
> I suspect this may fix:
> Link: https://github.com/ClangBuiltLinux/linux/issues/884

Oh, and there was
https://github.com/ClangBuiltLinux/linux/issues/884#issuecomment-1242729142
I wonder if that is preferable or a source of inspiration?


--=20
Thanks,
~Nick Desaulniers
