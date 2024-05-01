Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAA2161B52
	for <llvm@lists.linux.dev>; Wed,  1 May 2024 20:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714594926; cv=none; b=ht5qhVXyxJS3hyQZF94JCUzJN9hkGhr/tRmqwvARxe8ST+5rUOjBNmUfu4+aj4sdmGN5zqhvR8tQt2yiaJBzCS+8n/4IUhVq1QgQtBMyBLfQP3+bOuzQT249Wqu4H2FMfECvMq8OdjFEkk1fduPdy8L0cLpgcAJ+DAdsWzDmWWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714594926; c=relaxed/simple;
	bh=Rl7I4/w66VkXXW1jfowz8Diggq7Cxx9FBc+7jDI5OE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q2WhhgHjTEbX0+gRYjIVP/h/3TVRWA/1W/GOLYAIgSjXw64hOo82um4jMeZgo+5HO0ctwj4mE7nZExwpSJ0lU2AWTVvSMT/1S/QhLX1r+8LRKbicqbMP9F45ZxMnux2nHoY2pSmZQP40731ANRo40OoryUc1nt92tgKy+ImpjHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l9Y5XvoA; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l9Y5XvoA"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-572aad902baso1292a12.0
        for <llvm@lists.linux.dev>; Wed, 01 May 2024 13:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714594923; x=1715199723; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ciChv8gSXlzNkgOKOzuvxXr84EIsn6Oq5YU3LMaJYNo=;
        b=l9Y5XvoAhogc0aw56UK2lPL+rgfVsLdiEY3r5DdfpXcZXOaObrk8iFh0i4pc7XhEdp
         LYmWJiAk9smHrpo0/tD3XfYlwN39Sdym4v8ezSjdx/FbLJeWzstHF3ZPAYXiOg9v7vA8
         lGAUZvsAB0kyWI4cvO4fqKIZSN37sEoMrQ6xlYTfaYOtujZsXNxrC2C130zu1IjtPDAv
         ukU/XCMiptuzFy9ePL4ZartV8jbMEXq39bWf+ioQEY5UdrBCDSX70R7grIl4YIbfNjtF
         un0S9i+inZ5bPUENF9y3FzKFM0LALtZLVKXhTU4w6gVW31+BD/rd4T3e85mPsucgkIuq
         z1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714594923; x=1715199723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ciChv8gSXlzNkgOKOzuvxXr84EIsn6Oq5YU3LMaJYNo=;
        b=aCjr/YHD5hz3NqqpcX2YZ3gQnlYN+l5B1RG4CKTmHhGB8EoAioPzg+aL8hF44hQHeq
         mGjGrEXk05A/zbU65E704wXr8nnPR4LdI/0w0zxeIXr0WFJf+lUnraYOIkKi4MuYwHa7
         vFa4D/lxYJ/o25dMpwcHL21KGrH+cwPiQH6TrgE+gwBSO7cgG1aF/XTSX8AI2tOswQCo
         pksBXkc+kpCcjGvCPNT3p2Kkp+DQVoVPaf2v7Jj02GcNFj5H8C3UZOiKZMMPIbUgqgSm
         IFEH0c5N8Kz04a0eSc/Wmy0kypzy4DjOZVgTNHzaGRIiD0nCY+9hF9mNyj3sfPMXX9fc
         9nLA==
X-Forwarded-Encrypted: i=1; AJvYcCUnUBcxyTZpu5CnigFbHZU5zaB8iXFK6YoAsxgLOgjVM+8dXixYbwpDee26XeaLazaRiwkFqGi5iOnA/iNFPxOK5JCHjw==
X-Gm-Message-State: AOJu0YzUXn4mYcozCKuLGH+bkUl1zX+Q9vv5b7bVTx49r0apahJuXHSt
	3NovWBgZf3VWp3V+M8bakbd2VDC9Xp2NJDjrW8oEM6xwFK7w0Dex0IAyS489O3cNy0dJK6+BonE
	DCgz+gZ+9gqQJT/knV7NsvHaV19oCk1SMqliC
X-Google-Smtp-Source: AGHT+IFmvrlSmN5CZ2AzUe/MN5NsP38k4AFUMV92kR3xGNpVWzrF7dMoaN56RroXCDL45dJrMsPtLXoabp7LiNXom+E=
X-Received: by 2002:a05:6402:54c:b0:572:988f:2f38 with SMTP id
 4fb4d7f45d1cf-572bba25964mr35884a12.6.1714594923041; Wed, 01 May 2024
 13:22:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240501180622.1676340-1-edliaw@google.com> <osgrbhnqlyh5yw4y4x6wjggx56dogsgje5yy3mkpu75ubs3zwg@5tliydzky37k>
In-Reply-To: <osgrbhnqlyh5yw4y4x6wjggx56dogsgje5yy3mkpu75ubs3zwg@5tliydzky37k>
From: Edward Liaw <edliaw@google.com>
Date: Wed, 1 May 2024 13:21:35 -0700
Message-ID: <CAG4es9UxQEMx9gH4-khe39x05ioNbhZpym3G6TcR6aYQYtrj-A@mail.gmail.com>
Subject: Re: [PATCH v3] selftests/vDSO: Explicit unsigned char conversion for elf_hash
To: Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Andy Lutomirski <luto@mit.edu>, 
	linux-kselftest@vger.kernel.org, kernel-team@android.com, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 1, 2024 at 12:54=E2=80=AFPM Justin Stitt <justinstitt@google.co=
m> wrote:
>
> Hi,
>
> On Wed, May 01, 2024 at 06:06:18PM +0000, Edward Liaw wrote:
> > Fixes clang compilation warnings by adding explicit unsigned conversion=
:
> >
> > parse_vdso.c:206:22: warning: passing 'const char *' to parameter of
> >  type 'const unsigned char *' converts between pointers to integer type=
s
> >  where one is of the unique plain 'char' type and the other is not
> >  [-Wpointer-sign]
> >         ver_hash =3D elf_hash(version);
> >                             ^~~~~~~
> > parse_vdso.c:59:52: note: passing argument to parameter 'name' here
> > static unsigned long elf_hash(const unsigned char *name)
> >                                                    ^
> > parse_vdso.c:207:46: warning: passing 'const char *' to parameter of
> >  type 'const unsigned char *' converts between pointers to integer type=
s
> >  where one is of the unique plain 'char' type and the other is not
> >  [-Wpointer-sign]
> >         ELF(Word) chain =3D vdso_info.bucket[elf_hash(name) % vdso_info=
.nbucket];
> >                                                     ^~~~
> > parse_vdso.c:59:52: note: passing argument to parameter 'name' here
> > static unsigned long elf_hash(const unsigned char *name)
> >
> > Fixes: 98eedc3a9dbf ("Document the vDSO and add a reference parser")
> > Signed-off-by: Edward Liaw <edliaw@google.com>
>
> > ---
> > v2: update commit message with correct compiler warning
> > v3: fix checkpatch errors and indentation
> > ---
> >  tools/testing/selftests/vDSO/parse_vdso.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/tools/testing/selftests/vDSO/parse_vdso.c b/tools/testing/=
selftests/vDSO/parse_vdso.c
> > index 413f75620a35..9e29ff0657ea 100644
> > --- a/tools/testing/selftests/vDSO/parse_vdso.c
> > +++ b/tools/testing/selftests/vDSO/parse_vdso.c
> > @@ -203,8 +203,9 @@ void *vdso_sym(const char *version, const char *nam=
e)
>
> Is it possible to just change the types of the parameters of vdso_sym()
> or does that trigger even more warnings on the callsites of vdso_sym()?

It does trigger more warnings on the callsites unfortunately.

>
> Either way, this looks ok to me.
>
> Acked-by: Justin Stitt <justinstitt@google.com>
>
> >       if (!vdso_info.valid)
> >               return 0;
> >
> > -     ver_hash =3D elf_hash(version);
> > -     ELF(Word) chain =3D vdso_info.bucket[elf_hash(name) % vdso_info.n=
bucket];
> > +     ver_hash =3D elf_hash((const unsigned char *)version);
> > +     ELF(Word) chain =3D vdso_info.bucket[
> > +             elf_hash((const unsigned char *)name) % vdso_info.nbucket=
];
> >
> >       for (; chain !=3D STN_UNDEF; chain =3D vdso_info.chain[chain]) {
> >               ELF(Sym) *sym =3D &vdso_info.symtab[chain];
> > --
> > 2.45.0.rc0.197.gbae5840b3b-goog
> >
>
> Thanks
> Justin
