Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB107F
	for <llvm@lists.linux.dev>; Thu, 24 Aug 2023 20:55:15 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-649a653479bso1625106d6.0
        for <llvm@lists.linux.dev>; Thu, 24 Aug 2023 13:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692910514; x=1693515314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9veUMJ/z882K9hkHEmh4pAoTDmJO4VmWvc8gTfMi6Q=;
        b=cNir2zO4Jw1bY15AO+BvLzyudCZQgZOZ6wmKu3gTiOE6O5d8uld/TL1ezLjaI6QYbm
         WOGGPHYDU/pK4dxlnF7Ms+FTC/sMRd3w0UHs5vWl7Ok8xxNThnUi40LTsEqvRgt612yt
         78aWAjEVTurY9yP/vzKIVztJ70N6XuOBe4TzTTYoIN4ZaN51LMOSChOtgvQbcVaqgblP
         cXZz8KRbjOvTDGzMC8MqwpETfoHXd3UWkIm9s5iVgENo6DP/sbX4cOh9u7J1okj8PlZZ
         BokMSSDN911JlFclyP8hVqyb+sA6fCfvwhQTmJ3jDmPDMIreFp+riuf57qJzWHHRcB6x
         9FPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692910514; x=1693515314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9veUMJ/z882K9hkHEmh4pAoTDmJO4VmWvc8gTfMi6Q=;
        b=lYiSVoFlTgtMeO8fnbJSmfTF2hsl6VOd4XKMPTu8k27BLNP9N2lhrE6+vpRXlqna/S
         TMbuEyVR7h7wx5EbQJ7tv7IYlT09UUfXHtAZ6irIGFslraKwN5PrZFGzCftwnpZYwfuc
         /0LeW+zOdgWbmWv68Z+k5175oXEX933Db/kjhCCpal5+/PaYb9yP6+dIdit1w2IP5nZU
         dSaRw1N8RTgsIszeM02mGiOHyAymf3zpD2IQyCKsgZhrdeCcozv5jyZctcxbjSXMfj28
         oW2c1ju2pnDXc7ujxgJWJ/hl5PUVlszFzSD8Vj2a6NhTYQNgewBTxe8vK41tE22JxGCq
         MsgA==
X-Gm-Message-State: AOJu0Yz4UN4/gfmXMyB4MIvdwI+K43Ifs8rPiSu+vtrUWUDVbUV+6/nj
	e++LHM6z21+Hj4BgRO1EW28uhMxAODMulThqWyMFZg==
X-Google-Smtp-Source: AGHT+IGp1K8B09Bdl+oZ3RkqbVetgjSDMnQuEIy2o3NTYbqmOnwJtltpQ9JU5CwHn6kcCYZRMLaYXjyuarXlr9l4qDA=
X-Received: by 2002:a0c:e2ca:0:b0:64f:3b07:c50a with SMTP id
 t10-20020a0ce2ca000000b0064f3b07c50amr13629295qvl.58.1692910513818; Thu, 24
 Aug 2023 13:55:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230824-docs-v1-1-67e061278b8f@google.com> <20230824184910.GA2015748@dev-arch.thelio-3990X>
In-Reply-To: <20230824184910.GA2015748@dev-arch.thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 24 Aug 2023 13:55:03 -0700
Message-ID: <CAKwvOdkas2gmcyVKSp0DSXC56jxUB1HW8XRYKVBfS0sz3MSi5w@mail.gmail.com>
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

On Thu, Aug 24, 2023 at 11:49=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> On Thu, Aug 24, 2023 at 11:03:17AM -0700, ndesaulniers@google.com wrote:
> > -We provide prebuilt stable versions of LLVM on `kernel.org <https://ke=
rnel.org/pub/tools/llvm/>`_.
> > -Below are links that may be useful for building LLVM from source or pr=
ocuring
> > -it through a distribution's package manager.
> > +We provide prebuilt stable versions of LLVM on `kernel.org
> > +<https://kernel.org/pub/tools/llvm/>`_. These have been optimized with=
 profile
> > +data for building Linux kernels. Below are links that may be useful fo=
r
>
> Maybe make a note of why this matters? ", which should lower kernel
> build times compared to non-optimized LLVM toolchains."?

Oh, I forgot to address this in v2. Will send a v3.

--=20
Thanks,
~Nick Desaulniers
