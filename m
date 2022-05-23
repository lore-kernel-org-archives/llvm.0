Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52683D7A
	for <llvm@lists.linux.dev>; Mon, 23 May 2022 22:07:20 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id a127so16478113vsa.3
        for <llvm@lists.linux.dev>; Mon, 23 May 2022 15:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XSlHjnTpNeJkBXf9g/KNtqsnSqM2X0+xdvEyIgTr6JQ=;
        b=EWwnTLM16H2GID9+UMX+0nE+pP3lqI2zGGAdpDUwji1ya5dw7SMD1eY9VBTTyzZ97p
         pnByUqrOiDK2UWSurC7DobSo4CmD+ZAvHtc04GRJIsGw0fSO+eLor7K60PCvjH5JEVyS
         e/eH4dT5yygEZpGlkm6i0xZPBRNG+Bw7w0NVBq8AcoYzA9Xhu2CCIxlyaXrckX+jhUE2
         zy0bMaodYI5pg8r4ys5ei2CpT7VSiYqgQjcmbmH/Tje8evG8fCsaD2DZ1WPXq+5aGyjR
         8BpBP/zt3jvcyEp80mLe/oV8xS1aBQ8q6qqiPSdBWfwlFIc7IpG714GItGipaHKVGzvo
         4cEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XSlHjnTpNeJkBXf9g/KNtqsnSqM2X0+xdvEyIgTr6JQ=;
        b=NFaG/hxqGRDl+2ka67NyHdNPO7Z+o1/SinN96mrmpp4j2q83FIoT4p0b03u9+bumJ+
         Np4jNTMyiPj/3g6iPxwzHNWMXZb/ddrKIFEkAEqHmKN4abKXTFk++RnaWuTXpXdJAMZl
         ppWvKPs2iNh651iqfORfya25y0P36HqshgmOlEpQ5fHnPwCsTBj5DSOI16P1hdohIEqt
         PbFUJFMA82LqvhztoUmy+yueySxkxRSNV2kZ62rNTRBKQnp3luzyund/g2Y4ZpTAFu35
         KPgaVixxvio25fsWiCGUb3U2xgPYbHAbhD9d5yvl0t6K295zbpCOlAN7yR/zFC6Bwbn0
         QDsA==
X-Gm-Message-State: AOAM5309cBvwOsdBsVIfjPfZo3NNcVzmjwhXVrQPmqyUFJtHGPDaninb
	SNv2HL1qZEZLnpX1KMzSUBjUJNF0QjNWpoUWg9U=
X-Google-Smtp-Source: ABdhPJz1O2EWuAnkK+LM9P6gjKOn5UxPsEEewag3V5kdOD0oCJLqAcLdS5U+rPZbYmR16eX6VvASq4sH/ezCoCC8KQo=
X-Received: by 2002:a05:6102:370a:b0:333:c0e7:77e8 with SMTP id
 s10-20020a056102370a00b00333c0e777e8mr9914433vst.54.1653343639818; Mon, 23
 May 2022 15:07:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220523102955.43844-1-douglas.raillard@arm.com> <4268b7c5-458e-32cc-36c4-79058be0480e@iogearbox.net>
In-Reply-To: <4268b7c5-458e-32cc-36c4-79058be0480e@iogearbox.net>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 23 May 2022 15:07:08 -0700
Message-ID: <CAEf4BzZH-vV8iVqcDr_izTm+VqnqQ4QCzCgPA0pVX3iuVm9iHg@mail.gmail.com>
Subject: Re: [PATCH v2] libbpf: Fix determine_ptr_size() guessing
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: Douglas RAILLARD <douglas.raillard@arm.com>, bpf <bpf@vger.kernel.org>, 
	beata.michalska@arm.com, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, 
	Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Networking <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, May 23, 2022 at 2:00 PM Daniel Borkmann <daniel@iogearbox.net> wrote:
>
> On 5/23/22 12:29 PM, Douglas RAILLARD wrote:
> > From: Douglas Raillard <douglas.raillard@arm.com>
> >
> > One strategy employed by libbpf to guess the pointer size is by finding
> > the size of "unsigned long" type. This is achieved by looking for a type
> > of with the expected name and checking its size.
> >
> > Unfortunately, the C syntax is friendlier to humans than to computers
> > as there is some variety in how such a type can be named. Specifically,
> > gcc and clang do not use the same name in debug info.
>
> Could you elaborate for the commit msg what both emit differently?
>
> > Lookup all the names for such a type so that libbpf can hope to find the
> > information it wants.
> >
> > Signed-off-by: Douglas Raillard <douglas.raillard@arm.com>
> > ---
> >   tools/lib/bpf/btf.c | 15 +++++++++++++--
> >   1 file changed, 13 insertions(+), 2 deletions(-)
> >
> >   CHANGELOG
> >       v2:
> >               * Added missing case for "long"
> >
> > diff --git a/tools/lib/bpf/btf.c b/tools/lib/bpf/btf.c
> > index 1383e26c5d1f..ab92b3bc2724 100644
> > --- a/tools/lib/bpf/btf.c
> > +++ b/tools/lib/bpf/btf.c
> > @@ -489,8 +489,19 @@ static int determine_ptr_size(const struct btf *btf)
> >               if (!name)
> >                       continue;
> >
> > -             if (strcmp(name, "long int") == 0 ||
> > -                 strcmp(name, "long unsigned int") == 0) {
> > +             if (
> > +                     strcmp(name, "long") == 0 ||
> > +                     strcmp(name, "long int") == 0 ||
> > +                     strcmp(name, "int long") == 0 ||
> > +                     strcmp(name, "unsigned long") == 0 ||
> > +                     strcmp(name, "long unsigned") == 0 ||
> > +                     strcmp(name, "unsigned long int") == 0 ||
> > +                     strcmp(name, "unsigned int long") == 0 ||
> > +                     strcmp(name, "long unsigned int") == 0 ||
> > +                     strcmp(name, "long int unsigned") == 0 ||
> > +                     strcmp(name, "int unsigned long") == 0 ||
> > +                     strcmp(name, "int long unsigned") == 0
> > +             ) {
>
> I was wondering whether strstr(3) or regexec(3) would be better, but then it's

regexec() seems like an overkill, but strstr() won't work because
we'll mistakingly find "long long". Splitting by space and sorting
also feels like going a bit too far. So I guess let's stick to this
exhaustive comparison approach.

But Douglas, can you please a table instead of writing out all those strcmp():

const char *long_aliases[] = {
    "long",
    "long int",
    ...
}

for (i = 0; i < ARRAY_SIZE(long_aliases); i++) { ... }

?

> probably not worth it and having the different combinations spelled out is
> probably still better. Pls make sure though to stick to kernel coding convention
> (similar alignment around strcmp() as the lines you remove).
>
> >                       if (t->size != 4 && t->size != 8)
> >                               continue;
> >                       return t->size;
> >
>
> Thanks,
> Daniel
