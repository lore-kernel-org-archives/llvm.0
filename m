Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4AF1C02
	for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 22:49:44 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-51cff235226so3058494a12.0
        for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 15:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693003783; x=1693608583;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7sgnDPAQajX7It4uxeSwlO6Mx1CoEKJV2g+PY/BJzjg=;
        b=bBS+7cd8FRW4dzJtMySyt6XKf2oHudUYri5wtnnrsG/BJyWOo70aIBEpTMg+AhyCCj
         fovvl5xtG3I7niLsZ37kZomMSo0nqgG5zCk74z650eMv6FvtGK1oD/imt0x94ArqXpVb
         yRThpuRNk0VzYy7oDomGOHPqi6LHndq/lKCBwSN6vs8V7eCD23p2uv/vBd66SxYUnz6W
         kKzU3aSPZTQywt5gR1QrodffCUB9SMQbnQS/YYEolPLm/RYRK61NP+thaaDNejqQf3rA
         obxiB3GHEMGaPz1mI40Ov+K+/Nl3NE1NBUzTHrcOACIYVFQIzNWhkCborZRFbZm9mJ02
         KJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693003783; x=1693608583;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7sgnDPAQajX7It4uxeSwlO6Mx1CoEKJV2g+PY/BJzjg=;
        b=Bj09df8ooPycoaUcSRh3eRt/c8fFrTipQhZH2lhX72VGlCi28i4JJNs0zNjde3JwBX
         3zY1js1tq3K24A3Q8H53w2QKVgje5wgVLFcFZkzhvvR6yR25EsFkp6v+58YiMU8y08T2
         rgJx40aLmjNS6K121tMCdyMkP7qysNR9jkUv5AkMwDmleX0T/tolAMgT7tzQHF7Zge5B
         /j3OUIreHzRycAUUDBHlPr4Z1KNIDh9T20CKwfypRcP/Peuf/fQeyeWKH7P8B+xK5gvS
         5lOn68tYui7w4n3BYGihk+VxRbIsS/2ev0aywawlrzFEOMR8d+wGaeGxgsO+/r8pEthb
         5o1Q==
X-Gm-Message-State: AOJu0Yz504BbnpXTuVKGRbNPX8R4Pm8n1R4nJmAWbw2pRCJ6CrAsBSUd
	sm/Ct7hTH4x5mwua6/RzNdYqlxbC2Kt4lvvSJOYBdg==
X-Google-Smtp-Source: AGHT+IFCPH5X2LJbcf8xckkFkpHcRZwEMJ7xl5Uq2e6i8yeRqoFo9bvHzvfBM0xmlpCS5MhJ9oOC0tLsXk0HsrzsF8U=
X-Received: by 2002:aa7:cf09:0:b0:523:37f0:2d12 with SMTP id
 a9-20020aa7cf09000000b0052337f02d12mr22310855edy.17.1693003782879; Fri, 25
 Aug 2023 15:49:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230816-void-drivers-i2c-busses-i2c-pxa-v1-1-931634b931ec@google.com>
 <ZOkofUzv6t9lXyN+@shikoro>
In-Reply-To: <ZOkofUzv6t9lXyN+@shikoro>
From: Justin Stitt <justinstitt@google.com>
Date: Fri, 25 Aug 2023 15:49:31 -0700
Message-ID: <CAFhGd8qg5aeo34irrOQR7td1rjBVF2q4mDFV=Kbt=EmMUiTB_A@mail.gmail.com>
Subject: Re: [PATCH] i2c: pxa: fix clang -Wvoid-pointer-to-enum-cast warning
To: Wolfram Sang <wsa@kernel.org>, Justin Stitt <justinstitt@google.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 25, 2023 at 3:17=E2=80=AFPM Wolfram Sang <wsa@kernel.org> wrote=
:
>
>
> > Note: I think something like this may be more readable:
> > |     *i2c_types =3D (enum pxa_i2c_types)(uintptr_t)of_id->data;
> >
> > Thoughts on this approach against the one present in this patch?
>
> On the one hand, I think this is more explicit and, thus, more readable.
> On the other hand, we still have the loss of precision, between the
> first and the second cast. Which gives it a bit of a "let's hide it
> somewhat so the compiler will be happy" feeling?
>
There was some discussion [1] wherein it was ultimately decided that
this warning should probably be turned off (contrary to what the title
of the GitHub issue says).

The state of these patches [2] is in some sort of limbo until I get a
patch in to disable the warning from W=3D1 (keep in mind GCC doesn't
even support this specific warning). I want to make the patch but am
seeking some guidance about what exactly is to be done -- I feel a
simply _demotion_ from W=3D1 to W=3D2 would suffice as CI robots aren't
testing w/ that AFAIK.

Nick, do you have anything to add here as we had previously discussed
this off-list/IRL.

[1]: https://github.com/ClangBuiltLinux/linux/issues/1910
[2]: https://lore.kernel.org/all/?q=3Db%3Apointer-to-enum-cast
