Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3683A8F0
	for <llvm@lists.linux.dev>; Sat,  5 Oct 2024 08:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728117110; cv=none; b=lvI5zsYp2S0vk96bzyQUNPB/Kqp9MBrAo1J+iZlbQD9yP/as0K20CFkHVadrk/esudiHV6oneON4dzrC1FKMRD66MHN6Tbu1ImIkQcadVkDotpDnJTgsVBgdxAey5MO6V/5AwMj1xcf8phiC4h3j7QfG/Ttqffo6Fa8jiacGO64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728117110; c=relaxed/simple;
	bh=70cU5jNP52zmkSWZHO+lBdHOcE1V/JTH2eNm2kkh0zg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PzZ4FuRn+JzFUNpYK4eeftCryJu7St05ef86z20wxvzoTydIzblrRlWu7UBIg/MBZ4/r1RCanAsOsQc4hqP0GWn+ZbUDIJ8XqsFysviuYPFNmI55Ve9Ui4f/LwkwTFaOJslTCTOKur8wg2ukeGfdEBgmC64kZ1buMOUmFjAgIdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fi9eOrOn; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fi9eOrOn"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fabc9bc5dfso34305381fa.0
        for <llvm@lists.linux.dev>; Sat, 05 Oct 2024 01:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728117106; x=1728721906; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=70cU5jNP52zmkSWZHO+lBdHOcE1V/JTH2eNm2kkh0zg=;
        b=Fi9eOrOnPvWyXWhBQktr/bsVW5D0jNCnEbWRMXAgm+UYnETyQlGl11lmV0zEyAeF1/
         0ZT8X0JNLTj8SetndKvQj+ABJWNCAQtDZFqzVad+3aTt8XDcoMycEqjd2lqm2uoPV4bC
         UGKBGIunwZaSwhULpd+MKD6V3r85jYRd2uxgsyANUz3isLnU0hDp615/GJPw/g+cRdGy
         SPSU10nSja7Ok22y6tw/8jtelWyVnIH9rVYfz9ODklfl7TY4PRpWbhKpidbLByhjZ5ck
         btw8ofDTOU6ZIpY7mlIheDtzdCT5Gxp/F5qVVnAJxg2jl25PUpmt78SIztqU3Jn0XIJ1
         fwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728117106; x=1728721906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=70cU5jNP52zmkSWZHO+lBdHOcE1V/JTH2eNm2kkh0zg=;
        b=np5+pTBCrCLJakqJwOuwR+NmvL/quVHlUxnvKuxXCZYlHK7ELFKaCwBLUhQedHtfYX
         WbuSHImm9bukzvP7xIi4r5nmoZ7RrXE1MCd1WSl6YTa1m6EBnei+TmQf0NWBv+bOwqc8
         V7QiDzPaoNouGM9Y1RDxtGQeRwwV70V60zKI5ZQfUgDEC8ls7YZj49nrOEdKsDGEo20m
         zDxTU/3AWVYzjCWeOKpr0iZYpwrkZH8sRbuauUcr9cpnTbshjGEZSSEoyEo4wcA6x+sd
         fgXCPgOIzF1JJfnv8gjU2c6yzq8DLnvVmkSt5sXUOF4earSUBZ5wMeJmbv3bvleOisAV
         UsxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqZ80Q5ZJc+16WsURq2gd3cOZpHqnwuGtoBi5m+qCg2LyAMwcHDIedx6cxgUtUwDAD04c7@lists.linux.dev
X-Gm-Message-State: AOJu0YzGA3Mfoe/YD4Ttl3XXUjgxejXQXl38PP4dc31AQZyIeRhx2qRA
	xB8cTsC+3AZxEZENsIlWU1mafwwkYt12WQdpcccQu1yh47Lb+fZrMH2sprFUVF0z4SRZjAgCdrv
	R+ALeRNoTV2drodYEcnZ/3qk703s=
X-Google-Smtp-Source: AGHT+IGi0j/icjLt8RhHlOdJvbjdouTPFKKMu/CT/oe6l0e9sNaP3mHWfqnG22Q9j4GVb6Cdm+e2KfCpXo/Kl8KNmek=
X-Received: by 2002:a05:651c:1547:b0:2fa:d978:a6c4 with SMTP id
 38308e7fff4ca-2faf3d73888mr22769461fa.30.1728117106123; Sat, 05 Oct 2024
 01:31:46 -0700 (PDT)
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
 <CAMj1kXEU5RU0i11zqD0433_LMMyNQH2gCoSkU7GeXmaRXGF1Yw@mail.gmail.com> <5c7490bb-aa74-427b-849e-c28c343b7409@zytor.com>
In-Reply-To: <5c7490bb-aa74-427b-849e-c28c343b7409@zytor.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Sat, 5 Oct 2024 10:31:37 +0200
Message-ID: <CAFULd4Yj9LfTnWFu=c1M7Eh44+XFk0ibwL57r5H7wZjvKZ8yaA@mail.gmail.com>
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

On Fri, Oct 4, 2024 at 11:06=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wrot=
e:
>
> On 10/3/24 04:13, Ard Biesheuvel wrote:
> >
> >> That said, doing changes like changing "mov $sym" to "lea sym(%rip)" I
> >> feel are a complete no-brainer and should be done regardless of any
> >> other code generation issues.
> >
> > Yes, this is the primary reason I ended up looking into this in the
> > first place. Earlier this year, we ended up having to introduce
> > RIP_REL_REF() to emit those RIP-relative references explicitly, in
> > order to prevent the C code that is called via the early 1:1 mapping
> > from exploding. The amount of C code called in that manner has been
> > growing steadily over time with the introduction of 5-level paging and
> > SEV-SNP and TDX support, which need to play all kinds of tricks before
> > the normal kernel mappings are created.
> >
>
> movq $sym to leaq sym(%rip) which you said ought to be smaller (and in
> reality appears to be the same size, 7 bytes) seems like a no-brainer
> and can be treated as a code quality issue -- in other words, file bug
> reports against gcc and clang.

It is the kernel assembly source that should be converted to
rip-relative form, gcc (and probably clang) have nothing with it.

Uros.
