Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D45111B4
	for <llvm@lists.linux.dev>; Wed, 17 May 2023 19:23:10 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-3f38824a025so40311cf.0
        for <llvm@lists.linux.dev>; Wed, 17 May 2023 12:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684351389; x=1686943389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99WaBRQDUs3kb1dnzIG44mb1K4MZZ93giF8G4LLAmW8=;
        b=dC/JtS+CXoS3N4aXYIF6cSUebLVzJ7Tb65v5Kqkyjle341mL7a7aSc8Cj33QqRhHOM
         YkWvISnH+LhJSqB0OWz4QYFc4XCKPoCZGWjsI0eqFCsx4BoxL2c1z7DuOHVGoaE6UR55
         iCJoBY9KYYUHL6gLjCMLKhyd0LoDh5fZHTvpJ88bW+jcNBrl1fBZ4D6ooBVpzNELKZw7
         0KFLTQmN7Fn4dO3BAYhhDQQYBPjzVz7s2/2FfIvDwK7+cK0GCRIWrCNuB9a7UTlHYQBU
         BCkYU6X3gMVVhRnc+xjtl7wRsYrhEjA+5S4ch8p4sPJLOlLC1bis4Y8nQdqyZ3wuzUZ5
         3DzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684351389; x=1686943389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=99WaBRQDUs3kb1dnzIG44mb1K4MZZ93giF8G4LLAmW8=;
        b=XePRYSdDxGR9XDcoChBPVrdIKEGjMnJxTXXxZXxdlkNaDH12z9Nlk2znuV3BGoTFCL
         61+CgcPl0ptOeeLHlUw8qfgVUoRZZBg+Qs4W3IDvrjItEvB5kIoyXuLP2bG6B2amdw17
         j98aI4Bb2pKrun+ne8wzqv8a5cvKI7cK0zD1C7sSlsS5O8VdO4nk7R1HimWUg9V96k9e
         chPS73QrA6n5qUqjcPm8yo2Cw5sPWCUu/M3YMqg1eF1H/uI9aC6DLbwjiuFp9TzZYnjz
         hsZZRLI6X770jXoWqvMgrhNrYN/Sl0ipp/c+jNnqV5piJdbHLq87S4K3DStOKgQvHXUf
         zKVw==
X-Gm-Message-State: AC+VfDxXDzIrFG4Znd6S0+q2mAwVr4Y0th1x9daupFI8d4QDtCgUFKDs
	tjS9EtD8qH6iltrhd7ujPvj2aSBr6ohKyO/d9UPX1g==
X-Google-Smtp-Source: ACHHUZ7R+gC0bI/RsQjqW5ftAr/ftTU0NZgmcN4ZTqv8lHc3bxNUzCoZn8yuoEW6XLsEKxJ62Ukgubm/ICDjEdour/0=
X-Received: by 2002:ac8:5789:0:b0:3f3:75c2:7466 with SMTP id
 v9-20020ac85789000000b003f375c27466mr59103qta.8.1684351389019; Wed, 17 May
 2023 12:23:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230407215406.768464-1-ndesaulniers@google.com>
 <168435014337.2056649.7592777028793700479.b4-ty@chromium.org>
 <CAFP8O3L_RsaTMJvT7hmjD6ON49uob9Fb4mWg8ZUav_Y-FCgTMA@mail.gmail.com>
 <CAFP8O3JivZh+AAV7N90Nk7U2BHRNST6MRP0zHtfQ-Vj0m4+pDA@mail.gmail.com> <202305171215.7C58897@keescook>
In-Reply-To: <202305171215.7C58897@keescook>
From: Fangrui Song <maskray@google.com>
Date: Wed, 17 May 2023 12:22:57 -0700
Message-ID: <CAFP8O3JuPsCTgTXLkQpoy9WZG2jPxyisCjWhsB7yqJ-D9nA=OA@mail.gmail.com>
Subject: Re: [PATCH] ubsan: remove cc-option test for UBSAN_TRAP
To: Kees Cook <keescook@chromium.org>
Cc: ndesaulniers@google.com, masahiroy@kernel.org, 
	linux-kbuild@vger.kernel.org, nathan@kernel.org, 
	linux-hardening@vger.kernel.org, jpoimboe@kernel.org, llvm@lists.linux.dev, 
	mbenes@suse.cz, linux-kernel@vger.kernel.org, trix@redhat.com, 
	peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 17, 2023 at 12:16=E2=80=AFPM Kees Cook <keescook@chromium.org> =
wrote:
>
> On Wed, May 17, 2023 at 12:09:35PM -0700, Fangrui Song wrote:
> > On Wed, May 17, 2023 at 12:08=E2=80=AFPM Fangrui Song <maskray@google.c=
om> wrote:
> > >
> > > On Wed, May 17, 2023 at 12:02=E2=80=AFPM Kees Cook <keescook@chromium=
.org> wrote:
> > > >
> > > > On Fri, 7 Apr 2023 14:54:06 -0700, Nick Desaulniers wrote:
> > > > > -fsanitize-undefined-trap-on-error has been supported since GCC 5=
.1 and
> > > > > Clang 3.2.  The minimum supported version of these according to
> > > > > Documentation/process/changes.rst is 5.1 and 11.0.0 respectively.=
 Drop
> > > > > this cc-option check.
> > > > >
> > > > >
> > > >
> > > > Applied to for-next/hardening, thanks!
> > > >
> > > > [1/1] ubsan: remove cc-option test for UBSAN_TRAP
> > > >       https://git.kernel.org/kees/c/08e4044243a6
> > > >
> > > > --
> > > > Kees Cook
> > > >
> > > >
> > >
> > > For this -fsanitize-undefined-trap-on-error, I think we need a v2 pat=
ch that
> > > tries -fsanitize-trap=3Dall as well.
> >
> > Correction: -fsanitize-trap=3Dundefined
> >
> > > -fsanitize-undefined-trap-on-error has been deprecated in Clang for 8
> > > years, and at some point we will remove the option.
> > >
> > > GCC implements -fsanitize-trap=3Dall later, but
> > > -fsanitize-undefined-trap-on-error is documented as deprecated as
> > > well.
>
> Right now all the compilers support the old way, and I'd rather remove a
> cc-option call than add two. :)
>
> --
> Kees Cook

Hmm, this gives Clang developers a disadvantage... Anyone who removes
Clang's -fsanitize-undefined-trap-on-error (or give it a warning
before removal) will probably face complaints from kernel
developers...



--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
