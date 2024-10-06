Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C761662E8
	for <llvm@lists.linux.dev>; Sun,  6 Oct 2024 07:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728201592; cv=none; b=pVCHaoWB/xmc1Yo9j0TjD8oUF6Xd6SwfI8xazFFHqQU94f7VzhfJAg2IxrpJfZDxAzzuGi3ign4oPXoGQCOLMiPZyc/thS20jQJ5Q7lrSN8EJuiA+cDW4eCRSVwK1np77vfsn4jvUIc4DqiG7YHIueQEiniXUTp69+34Gbc1rzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728201592; c=relaxed/simple;
	bh=0WxMKip1+Fw9+cCQhm/3A9AY/qyKiRCE5qbNsKoaojU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PchLrEJs7UwXdIolqE4g1UoikMZCSOPmiOD5vCEopVo2aqF9ZdzDuud3jzQRcki1Cz1PMH12R10UYYgffACGGl4iePNGNtbunfP9xtbwHCf+C+lchmB+NQ5lfpxocv3PQwxEhFysRNiUbvxcS9aj4lA8vHtmb5T9jqjlWnBABWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ra+pjLPc; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ra+pjLPc"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fad8337aa4so38420401fa.0
        for <llvm@lists.linux.dev>; Sun, 06 Oct 2024 00:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728201588; x=1728806388; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPKYyYBqIk2nde1TDg/wyIZWJzsFsCGXcjUuTc5pqeY=;
        b=Ra+pjLPc6a23/8U29gMOJE2bPrDl14lyDnONYMeYuFji1hVcarZCCYEITL0qzqiC4l
         9SHJAFxpiO8rJVZOL7oZg/y6CHDKTanV827oEqcAFc53lZnqhXhrVBQHB99gZE1j/dWp
         A/4HzyvIIYQ1ciKzEh6w2yIO/25gvfY4cI1BDLHzYPLJxc6gwJI+fK5XLlR2kMMYz6BI
         65H4bQKguFagrK0IPhgmQIQi3uHhWWhgucF8DhgssjWl7S7l9EXa32Zq5woAJhdkJ56L
         qmeVRG1L6Hlnynw1yu36ukvUV2Kzh+gOqwBWPJkWuPzxdIAT2mpIu9b+B778fOjwKc4C
         2t0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728201588; x=1728806388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPKYyYBqIk2nde1TDg/wyIZWJzsFsCGXcjUuTc5pqeY=;
        b=rImdb6X5hu5z40arYktsaNbGrSzHSBvc3Ff/NmoIrrjNbfAYdLdhpdeqgCXhJxB06h
         gQ+oFnJimBLf+FY3Z9g8iyIJg5OPfsUgbd7lU+BBUKBSqbCFv3xyTbuklJYWXbqbhOpS
         89N97GjR54UlLaONnZztOYF61ixQYUd4+cw/D7+RVozeG8/Nvh3eN6cbW46mrCMpBvEl
         eHUanUwqERctG+lHteBU8nkzBI234Z2+s2GeZnqTnchCbsnP+ggU4evg29LRUlXds/qf
         MHzaAlH1RPqdZbEAr8gh8dO2x8CQlsoVd910OMEku5MboHFiS7S5YgQOd8mIojyED1z+
         TbEg==
X-Forwarded-Encrypted: i=1; AJvYcCWPRK/LxSylnwwWk0RsSXmHN4sijmEePDpo+BfbUXqRO2vZeX91TPBhqYPL0miDXsrpQKJ1@lists.linux.dev
X-Gm-Message-State: AOJu0YwP0WmYzvSTAiSBIHlD1jLByV1cvM3QNTH6Z+5J+B4T3fuYqCkv
	tTYXZvFPJSGXyvlKgveAOi4NOGkMzvs4VamPI9qtAQFTO1U9WgiETTdhn4yrIIsAPBcmAz1tzT2
	K79c8pc+j6uCw5Hq56ucaB1CBP+g=
X-Google-Smtp-Source: AGHT+IE2zUoTNKRDJOdgkWI5Cw6UcFhRdeh7rJkjxE6MXyTsb+8X3cwADhQlSBEhykzT0ML1M4fcluEMHpcmKEmwoVU=
X-Received: by 2002:a05:651c:1549:b0:2fa:c873:45ce with SMTP id
 38308e7fff4ca-2faf3c64dcemr33189261fa.30.1728201588155; Sun, 06 Oct 2024
 00:59:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-55-ardb+git@google.com> <99446363-152f-43a8-8b74-26f0d883a364@zytor.com>
 <CAMj1kXG7ZELM8D7Ft3H+dD5BHqENjY9eQ9kzsq2FzTgP5+2W3A@mail.gmail.com>
 <CAHk-=wj0HG2M1JgoN-zdCwFSW=N7j5iMB0RR90aftTS3oqwKTg@mail.gmail.com>
 <CAMj1kXEU5RU0i11zqD0433_LMMyNQH2gCoSkU7GeXmaRXGF1Yw@mail.gmail.com>
 <5c7490bb-aa74-427b-849e-c28c343b7409@zytor.com> <CAFULd4Yj9LfTnWFu=c1M7Eh44+XFk0ibwL57r5H7wZjvKZ8yaA@mail.gmail.com>
 <3bbb85ae-8ba5-4777-999f-d20705c386e7@zytor.com>
In-Reply-To: <3bbb85ae-8ba5-4777-999f-d20705c386e7@zytor.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Sun, 6 Oct 2024 09:59:40 +0200
Message-ID: <CAFULd4b==a7H0zdGVfABntL0efrS-F3eeHGu-63oyz1eh1DwXQ@mail.gmail.com>
Subject: Re: [RFC PATCH 25/28] x86: Use PIE codegen for the core kernel
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 6, 2024 at 1:37=E2=80=AFAM H. Peter Anvin <hpa@zytor.com> wrote=
:
>
> On 10/5/24 01:31, Uros Bizjak wrote:
> >>
> >> movq $sym to leaq sym(%rip) which you said ought to be smaller (and in
> >> reality appears to be the same size, 7 bytes) seems like a no-brainer
> >> and can be treated as a code quality issue -- in other words, file bug
> >> reports against gcc and clang.
> >
> > It is the kernel assembly source that should be converted to
> > rip-relative form, gcc (and probably clang) have nothing with it.
> >
>
> Sadly, that is not correct; neither gcc nor clang uses lea:
>
>         -hpa
>
>
> gcc version 14.2.1 20240912 (Red Hat 14.2.1-3) (GCC)
>
> hpa@tazenda:/tmp$ cat foo.c
> int foobar;
>
> int *where_is_foobar(void)
> {
>          return &foobar;
> }
>
> hpa@tazenda:/tmp$ gcc -mcmodel=3Dkernel -O2 -c -o foo.o foo.c

Indeed, but my reply was in the context of -fpie, which guarantees RIP
relative access. IOW, the compiler will always generate sym(%rip) with
-fpie, but (obviously) can't change assembly code in the kernel when
the PIE is requested.

Otherwise, MOV $immediate, %reg is faster when PIE is not required,
which is the case with -mcmodel=3Dkernel. IIRC, LEA with %rip had some
performance issues, which may not be the case anymore with newer
processors.

Due to the non-negligible impact of PIE, perhaps some kind of
CONFIG_PIE config definition should be introduced, so the assembly
code would be able to choose optimal asm sequence when PIE and non-PIE
is requested?

Uros.
