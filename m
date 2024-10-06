Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBC03D76
	for <llvm@lists.linux.dev>; Sun,  6 Oct 2024 19:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728242275; cv=none; b=pg7wmAJrCs98X7FGwUwiRjeNjlUUxVzn26kZ9y1V4F27z+uSkRxz8simwb1oO43wWjv+N9q9dm2nwLcufJAE7bsX3LPf9Wj4rnFL7tmi7Xy0VxJWKy0ijooDSDFxEm9TwxAKp71NuihsL/rOnq9bGU5rMeoOlx95Zz+rC2hiy3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728242275; c=relaxed/simple;
	bh=tbSrHUSflgwuD4ZHPRPJ5BZRTLC2CQwiCglTSKbl7rw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CXbQ/Vp9UL+F8zXKHHRe5N39PPV+nnU365IXH+VPplkmZTQbOBw0Q+nitMNK+3Kyr/jVeWcX/kWSNiHVLYZvVEQZ6HVJLiYSMWQFNeQSM47KH0WuTzJaOWIHsuM8jKd7+xPiG1a0CNnG6AFXU7kl3BkONaU+yrHqeMGcZsywJUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JESqsYPq; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JESqsYPq"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fac3f1287bso39177301fa.1
        for <llvm@lists.linux.dev>; Sun, 06 Oct 2024 12:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728242272; x=1728847072; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbSrHUSflgwuD4ZHPRPJ5BZRTLC2CQwiCglTSKbl7rw=;
        b=JESqsYPqegnKG3qG3Ij5h3Nr4boTmTeD+mchl/Jvril0tfrfcEHhK5SPZqo89GskNY
         QMYdg8WqvnucVRv0LYaTR3FdXTaEmG3iL81qyyT2ycZBxITlA10EVEWlwl+zB0uTOHEI
         V6C6wCAaUgYBgOx4rmORo6H1DoVjce//GH3Vaf3gH4yfgWnVccUB2/K2Yyh+eFxHgimc
         FasHuEiwq69hEutRvuJ9+Q3heXy4RZ1goKot0ZJZYsF62e4w2CzuEF61ppqrsqjO8m/8
         rA1heN0MZVI8GNTizt191M6dBlfp4ZcFh52F0J6hiFhgHRlZ2x2jb3iL9avWtqO8xnPS
         GdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728242272; x=1728847072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tbSrHUSflgwuD4ZHPRPJ5BZRTLC2CQwiCglTSKbl7rw=;
        b=g50R6dsmagv6Z83hMfCsQNKBdH23yB1xW12ufyGdOSZ2t7JzBBYaSKMGplmNdJjICk
         tnWlGmwXmYQJkeufAg40B+cUwsISsnGA1QL0wcN3JGMf6NolP8gPzHxOPyOWecGmPTtF
         3XbBdmlYYgkUj1j0L1RGpohuGUNIXCK1OgX4IU0oolaOk6T3MCTWGrubT7AXHl1EOlom
         ihlVuhTK82IKITHdh8OjjmWMuJpqZtO4/u0eYsSUy/B2z1DikGmlsVEl7JeaYYh1M5b5
         XN5dAJlcq7puxdyVUtZ7DblknyB6M884wXE2/a2VeWPRL4+BKRaJSdVFUfXPb+74gV+X
         zkDw==
X-Forwarded-Encrypted: i=1; AJvYcCWiTxmJ4Uy9eUUlPxi/A/w8CSFpv3U/Ip0laryay1qbbVYCRz2RK7ZGg3vMY3H2y8d4Kc62@lists.linux.dev
X-Gm-Message-State: AOJu0YwrpfmgFUhl8uXqOzPok9RtXMzzkEDxXS0y6IN8FoLb82bTK/pv
	hDWp9uIvibw11Farq+JfnuwT6rJ7FxtL6ZkV3A+WBJqMTPI8PKtpXmC0n7exxCUEP4ydE3paULL
	hbLrZkNkYQ+Ev4aRg1rREqhNCTCE=
X-Google-Smtp-Source: AGHT+IGRTqhJhTusYfDXEbEiyI+dDRincUEm84afE7n1AFszrvf4EDsRGd1dnnPyUdXRuJKezOE3wzgwR0sUUmJI06c=
X-Received: by 2002:a05:651c:548:b0:2fa:cdd1:4f16 with SMTP id
 38308e7fff4ca-2faf3c150bdmr36366491fa.14.1728242272173; Sun, 06 Oct 2024
 12:17:52 -0700 (PDT)
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
 <3bbb85ae-8ba5-4777-999f-d20705c386e7@zytor.com> <CAFULd4b==a7H0zdGVfABntL0efrS-F3eeHGu-63oyz1eh1DwXQ@mail.gmail.com>
 <bfa1a86c3e4348159049e8277e9859dd@AcuMS.aculab.com>
In-Reply-To: <bfa1a86c3e4348159049e8277e9859dd@AcuMS.aculab.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Sun, 6 Oct 2024 21:17:40 +0200
Message-ID: <CAFULd4awNUm8MpZQ6XhPTRs6+2ZLtfnr=6vkK5DrY9L2rGR-5w@mail.gmail.com>
Subject: Re: [RFC PATCH 25/28] x86: Use PIE codegen for the core kernel
To: David Laight <David.Laight@aculab.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Ard Biesheuvel <ardb+git@google.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, 
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
	Kan Liang <kan.liang@linux.intel.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	"linux-efi@vger.kernel.org" <linux-efi@vger.kernel.org>, 
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, 
	"linux-sparse@vger.kernel.org" <linux-sparse@vger.kernel.org>, 
	"linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, 
	"linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 6, 2024 at 8:01=E2=80=AFPM David Laight <David.Laight@aculab.co=
m> wrote:
>
> ...
> > Due to the non-negligible impact of PIE, perhaps some kind of
> > CONFIG_PIE config definition should be introduced, so the assembly
> > code would be able to choose optimal asm sequence when PIE and non-PIE
> > is requested?
>
> I wouldn't have thought that performance mattered in the asm code
> that runs during startup?

No, not the code that runs only once, where performance impact can be toler=
ated.

This one:

https://lore.kernel.org/lkml/20240925150059.3955569-44-ardb+git@google.com/

Uros.
