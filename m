Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A372C80
	for <llvm@lists.linux.dev>; Tue, 29 Aug 2023 16:34:08 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-64f4ac604c2so23497066d6.1
        for <llvm@lists.linux.dev>; Tue, 29 Aug 2023 09:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693326847; x=1693931647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LGsDVPWOpoywEhWw8HT//mJDHXUKsrBgXetl/SfpAlg=;
        b=1K0rBSTZDMdrhpABunn+tXDq7Ccn5arb3W+Y4ZhXI10vS4l5m5d5rtZNtUmzkkEkXI
         Q690R7o+OwhN5MY6Ib20jEyzOv7sK67Puk/9ZSh13MzSg1hjV3QZDr2t0tRV857LqguZ
         VOXu/MypAzTrTpL/GR3mofIC2hcKyBKUZ8CZzSh5bmbqBy4U2Ngh28aZBOAuuWRBxp4o
         x/hOxW8/u4f5hOQeSv3LSD391ngBH2+sraOh0BRQwWMoTegRWk5GIUVtVCDtngAYWRpC
         Tyq2seM1htg0pCRQuAucqkVca/68WKQBu6pPHdjk7IrUSnFST9sIkjWFF1XWhxvAKEdx
         fzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693326847; x=1693931647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LGsDVPWOpoywEhWw8HT//mJDHXUKsrBgXetl/SfpAlg=;
        b=dmVMpxh/nJtKgy427KFeP1EmZ6DmjWhEfXhPJ1Kee7HdhjlgycbGHrUS+TNnJEMIba
         Yj6glRP85Ve6/C9sqkpHXpst7Y3DQgO4S4f1UPGYyxK9ljQt2C9+aFAWdS3+N66jspGt
         z7ERs+e/SbZxoWpE/ASui0hT3CAYRORp/l4koNUwG5rcAf6ndQy9T9ENWHdgaGjzrmOD
         B4pIRHFY/r0+uJP9je1ZwFE8LPoKQU4lljRWP2EOWZM3q4Z4RBoL6WnofpSAZOOVoUhc
         W8IB3zfi/EWmiA55AkzZgrbCjwatn0e9ozQFAvFTeh/LoSDbIafg/vXD0hZXEFvsDaAm
         /ZlA==
X-Gm-Message-State: AOJu0Yx2jI/GX2ukLlxvNhnOZNz5zwoBoJ2kvOvFpYqR5ucNOPEYmt31
	kyHGANb/Uk2joq3cNGKc2zy8HrZA7UZ87yy7rk+MWQ==
X-Google-Smtp-Source: AGHT+IE+wTlCEKPVucMTcrwfInkaLdK3d8WRVLrtrQZu+jWq8ID6sU0nBxel/3drbHiCg9eWgApzw1Pq1W7N3TWjS0w=
X-Received: by 2002:a0c:e254:0:b0:64f:8bdd:873 with SMTP id
 x20-20020a0ce254000000b0064f8bdd0873mr8855884qvl.3.1693326847036; Tue, 29 Aug
 2023 09:34:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230828-scsi_fortify-v1-0-8dde624a3b2c@google.com> <CAKwvOdmaeupeLgJWjMD4iJ1pi9NFTN-MTp3uC0jDVp2T2+Ctxw@mail.gmail.com>
In-Reply-To: <CAKwvOdmaeupeLgJWjMD4iJ1pi9NFTN-MTp3uC0jDVp2T2+Ctxw@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 29 Aug 2023 09:33:55 -0700
Message-ID: <CAKwvOdmpSmWGUA-SHJ9PofayfxFc--MJuxgQ0cU8bnDB6c=wag@mail.gmail.com>
Subject: Re: [PATCH 0/2] scsi: fix 2 cases of -Wfortify-source
To: Kees Cook <keescook@chromium.org>
Cc: Tom Rix <trix@redhat.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Ard Biesheuvel <ardb@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	Hannes Reinecke <hare@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 28, 2023 at 4:41=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Mon, Aug 28, 2023 at 3:25=E2=80=AFPM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > clang-18 has improved its support for detecting operations that will
> > truncate values at runtime via -wfortify-source resulting in two new
>
> ^ -Wfortify-source
>
> > warnings (or errors with CONFIG_WERROR=3Dy):
> >
> >   drivers/scsi/myrb.c:1906:10: warning: 'snprintf' will always be
> >   truncated; specified size is 32, but format string expands to at leas=
t
> >   34 [-Wfortify-source]
> >
> >   drivers/scsi/myrs.c:1089:10: warning: 'snprintf' will always be
> >   truncated; specified size is 32, but format string expands to at leas=
t
> >   34 [-Wfortify-source]
> >
> > When we have a string literal that does not contain any format flags,
> > rather than use snprintf (sometimes with a size that's too small), let'=
s
> > use sprintf.
>
> Even better, Ard points out this could be strcpy (or one of the
> variants). Will send a v2 tomorrow.

Oh strcpy doesn't return the number of bytes copied, which is what the
users here need.

(The size of dst is also unknown).

Any thoughts on?

/* strcpy but return the length of src and requires a literal. */
#define strcpy_literal(dst, src) ({ \
  strcpy(dst, src ""); \
  __builtin_strlen(src); \
})

Uses a trick I learned from Abseil for ensuring that a parameter must
be a string literal. The C preprocessor will concatenate those
strings, or parsing will fail.

Then these drivers can do:

return strcpy_literal(buf, "physical device - not checking\n");

If that's not blood curdling, any thoughts on where best to place this
to hide it from others? Maybe just define it in both .c files?


>
> >
> > This is pattern is cleaned up throughout two files.
> >
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> > Nick Desaulniers (2):
> >       scsi: myrb: fix -Wfortify-source
> >       scsi: myrs: fix -Wfortify-source
> >
> >  drivers/scsi/myrb.c |  8 ++++----
> >  drivers/scsi/myrs.c | 14 +++++++-------
> >  2 files changed, 11 insertions(+), 11 deletions(-)
> > ---
> > base-commit: 2dde18cd1d8fac735875f2e4987f11817cc0bc2c
> > change-id: 20230828-scsi_fortify-9f8d279bf9aa
> >
> > Best regards,
> > --
> > Nick Desaulniers <ndesaulniers@google.com>
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



--=20
Thanks,
~Nick Desaulniers
