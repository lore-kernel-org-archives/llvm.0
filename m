Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0683E7F
	for <llvm@lists.linux.dev>; Thu, 24 Aug 2023 21:12:35 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-64f76ffab85so1556726d6.2
        for <llvm@lists.linux.dev>; Thu, 24 Aug 2023 14:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692911554; x=1693516354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4U1ivCyumzozlOIlLtJN6Z5xOoT4k9wuOs/HLGPW8t0=;
        b=VJTm8lTcxoztRvIBEKss1oLLWxWSKgQM+369NiNy8dvn6YCJDWVB+CfukSFIaxAJUD
         KH1SYydQ4D1GB4zvI2rf433XTYXT8mIRtF+fh4asnISKH84UUcQcOGYjbhhyc6s+3VVy
         l/jl/mku25gwK5PWyZxzTsGrcj5POmnlDzqJ0aK/7nblSFUoWz0Wp69s7yyrz30fM6Ju
         42+RX2+D62Pw75tLd9JnBqgcnuM+Iqa3jNAiw6LBvWXKLuxIeWMXofxmelfE01nIyoGT
         wJIwK/xjL1v0pE0G13JTFZQMB7DfQaKWxGkxX8+3OFgYOeOsarWYFtTlgBttr7mWS/CL
         EajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692911554; x=1693516354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4U1ivCyumzozlOIlLtJN6Z5xOoT4k9wuOs/HLGPW8t0=;
        b=k1/B5hfU86HuJ+sQCErtpQXFIMGPB8buGsloRyvPgXYEddkftQvIT05Q2ggRoIIT96
         s/t70rIqX6wNKZ0FKY4w8mrnCSFvu5X1cJqqXu+uyQjRFDi4UGonD7AQCr/AmC6W3CFV
         LUdJwID/f40smUihxDEQrUfJncTTtbjHgLaK/an6PDkL4h92d6cBQGcGESzN7RX4IrWo
         TuFLt4J82jiPZPeirNnIjW/QqqbczIgqtdR3w7tnMXeCuqfVqVGu8SfCH7mS9DSrQN0n
         Hyo4EQuImLHF1NArqPc6vDe6woT92rcJRD9SxLYa4Ygapo2kYaHeQia83ohPqFzm2Xjq
         GO7g==
X-Gm-Message-State: AOJu0YyFsia6dY1cv3Sg9VvhM3NeKIuVGo5kw634hPunS5AfAn6Mfj2b
	5JrVJeh79cvC33Zjs01zz5KC4dGa2Xv+N6JiO3cahw==
X-Google-Smtp-Source: AGHT+IHJ5oM96Zm8ClYAtCrxKInIQduZvCd9928l9ysBLty471FXDG4CQkDMxa/8esRD1pekknsSAm8ScMk0Ote30z8=
X-Received: by 2002:a0c:ac49:0:b0:647:2def:6a8 with SMTP id
 m9-20020a0cac49000000b006472def06a8mr15925588qvb.45.1692911554574; Thu, 24
 Aug 2023 14:12:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230824-docs-v1-1-67e061278b8f@google.com> <20230824184910.GA2015748@dev-arch.thelio-3990X>
 <CAKwvOdkdb=dDggNNPHb08AiZNp5V-H9utgm0H+2hJmZJdO-biA@mail.gmail.com>
In-Reply-To: <CAKwvOdkdb=dDggNNPHb08AiZNp5V-H9utgm0H+2hJmZJdO-biA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 24 Aug 2023 14:12:23 -0700
Message-ID: <CAKwvOdkuxO0TeERBCRFrjKvKUsg=nchOuPJc_gx_zGfOaWwhmA@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: refresh docs
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Tom Rix <trix@redhat.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 24, 2023 at 1:32=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Aug 24, 2023 at 11:49=E2=80=AFAM Nathan Chancellor <nathan@kernel=
.org> wrote:
> >
>
> > I see a few new kernel-doc warnings from not adjusting the underlines t=
o
> > match the new length of the title:
> >
> >   Documentation/kbuild/llvm.rst:40: WARNING: Title underline too short.
> >
> >   The LLVM=3D argument
> >   --------------
> >   Documentation/kbuild/llvm.rst:40: WARNING: Title underline too short.
> >
> >   The LLVM=3D argument
> >   --------------
> >   Documentation/kbuild/llvm.rst:102: WARNING: Title underline too short=
.
> >
> >   The LLVM_IAS=3D argument
> >   -----------------
> >   Documentation/kbuild/llvm.rst:102: WARNING: Title underline too short=
.
> >
> >   The LLVM_IAS=3D argument
> >   -----------------
>
> oops! remind me of the make target to observe these?

Found it;
make htmldocs
https://www.kernel.org/doc/html/latest/doc-guide/sphinx.html


--=20
Thanks,
~Nick Desaulniers
