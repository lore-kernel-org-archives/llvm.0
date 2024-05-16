Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C29128DDE
	for <llvm@lists.linux.dev>; Thu, 16 May 2024 23:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715902816; cv=none; b=BGojzFxuJPW1TrBRs/3QSxBXvS43813Dq1IUQIlMtkWFIUt/QGt36TfEbiV4oBmZEzkRRrPbKu21Gav5wDjAT8El5tmR0V51bF8dTlLJj/TrLD+PQM9ri4/NC18PGzpQuVQLI44Z8VDu53wu0YCz7RgG+KVsj0jKUZy3VNbwcuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715902816; c=relaxed/simple;
	bh=URIGKdkbEgy8oUD3A8XedbAjc10c7x/cPv/IEH/QL2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X6pdEY0eBAc0VMQenJivdgxj6syh3g6TR7gkVxqNuyJXywxbbjlDEtACiRHvZoQm1gE5R1TkCapwX+Q4xUF+O66orpQT43NL0J9XO3kg1xGGjYQbXLDr9ql0gsOcBOwLn98ymoq5RNvf0KH17Hm5xNJBVcdb6Z9hbED1qb4uK1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=InfaZ1GT; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="InfaZ1GT"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-481e9c27378so1471599137.3
        for <llvm@lists.linux.dev>; Thu, 16 May 2024 16:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715902813; x=1716507613; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b2dB9OUxKVJydzpMoRJxqlpFvuQGNeC1Byqw9B+0hCU=;
        b=InfaZ1GTY6OPRSr3Bx5P+akSOM+iLTxlOzAfjsV31Mo6V8kfD7r01Pf2JF4ftzGzOW
         UkLOIFnnzuzQ+f491Dt3u+b1wCX+Papd4Bt2OW8LzdMqb7URNnSgMtvU1kt9OOzxIZRB
         S/s+fFg1Kz/+v4ViilRcYHGH0JM7i4ePX03IKZyywZ3ZgTqYzO69R1/wo54z7hK1Clwv
         QHe39PogporgpKyjrTQnQ7dbDSiGtfG6E5jrukOu7xrPV2kH1ioUU1PNutmVy1NnnNXE
         wLMhF+lyd7Et+z45rsycYpsVp+i1bl/rmEEzx/Vy3kg9WlogQtVOEeE7pOaakIZ0jqEv
         D/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715902813; x=1716507613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b2dB9OUxKVJydzpMoRJxqlpFvuQGNeC1Byqw9B+0hCU=;
        b=RNkpgRKgY1ZiY5ByG0migq66Vp7mHILwKFNYckOo1V22vLk73IJMP40DTGkTJmMwx9
         /Ai4+r+n9hP2HkdAkTFY9zzMP0MQBBtgycrn3n9MMWhpO5M3So9vHmRCjAxtrljFL5jf
         PSm6G8VKwxdtDaILmiEHKGqlzxknQO71zrgmf01QMqKZENZ33+UecTrv2ZT7SoNo6wX8
         5sTNpSl4aFdysPf+3OAmrzDspGsuK1OHWu3VPwwyrgOYK4xz9Gw6IUSrmI2GeIyFmtYp
         9D51b01RC0qQ1gb5pTjPzwnRQU5l9ngls7cemYmvLwLJjMboyErVQm3Pseepgf1S8QTj
         5Hjg==
X-Forwarded-Encrypted: i=1; AJvYcCWpC+Vyd1YB9Mrjgad/H10aGnC5DHLZWs0SXFYOyC69v0cd52r3oVemPDRSZfZA7P2tfsbgcHMhmmhH844m3m2q4NzXMQ==
X-Gm-Message-State: AOJu0YyqvPF4JfLZ5zBZreE+O8d+wZdUgaYhmVbhBIPOfs/MaQJokSa8
	F0bqXFSggyZMAUN5Bf/E9I71dS8PpP9Cl4xaL2uCXvrt5JQCtgkwXQWmOIsKNxGBvAljWxm5kHw
	+pXlSNfpunbH3sgqbYA3E45FVDO6bhwGx0HeD
X-Google-Smtp-Source: AGHT+IFpAOhljFS/PTPBZQwP83d5MIHpB1HU7pH89UAdZAkw4Ly8hJBhVfm/h/CifLeMtGmQ6OiPSGkr5/GyKGIvask=
X-Received: by 2002:a05:6102:c90:b0:47c:1251:cf25 with SMTP id
 ada2fe7eead31-48077de62e8mr20449719137.12.1715902813340; Thu, 16 May 2024
 16:40:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240507-b4-sio-ntp-usec-v1-1-15003fc9c2b4@google.com> <87v83gllv8.ffs@tglx>
In-Reply-To: <87v83gllv8.ffs@tglx>
From: Justin Stitt <justinstitt@google.com>
Date: Thu, 16 May 2024 16:40:01 -0700
Message-ID: <CAFhGd8p94sHpDc8MApZK7q9iEQ_C8c5frwZx9v_bTnhwtAM=HQ@mail.gmail.com>
Subject: Re: [PATCH] ntp: remove accidental integer wrap-around
To: Thomas Gleixner <tglx@linutronix.de>
Cc: John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 14, 2024 at 3:38=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> On Tue, May 07 2024 at 04:34, Justin Stitt wrote:
> > Using syzkaller alongside the newly reintroduced signed integer overflo=
w
> > sanitizer spits out this report:
> >
> > [  138.454979] ------------[ cut here ]------------
> > [  138.458089] UBSAN: signed-integer-overflow in ../kernel/time/ntp.c:4=
61:16
> > [  138.462134] 9223372036854775807 + 500 cannot be represented in type =
'long'
> > [  138.466234] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.8.0-rc2-0003=
8-gc0a509640e93-dirty #10
> > [  138.471498] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), B=
IOS 1.16.3-debian-1.16.3-2 04/01/2014
> > [  138.477110] Call Trace:
> > [  138.478657]  <IRQ>
> > [  138.479964]  dump_stack_lvl+0x93/0xd0
> > [  138.482276]  handle_overflow+0x171/0x1b0
> > [  138.484699]  second_overflow+0x2d6/0x500
> > [  138.487133]  accumulate_nsecs_to_secs+0x60/0x160
> > [  138.489931]  timekeeping_advance+0x1fe/0x890
> > [  138.492535]  update_wall_time+0x10/0x30
>
> Same comment vs. trimming.

Gotcha, in the next version this will be trimmed.

>
> > Historically, the signed integer overflow sanitizer did not work in the
> > kernel due to its interaction with `-fwrapv` but this has since been
> > changed [1] in the newest version of Clang. It was re-enabled in the
> > kernel with Commit 557f8c582a9ba8ab ("ubsan: Reintroduce signed overflo=
w
> > sanitizer").
>
> Again. Irrelevant to the problem.

Right, I'll move it below the fold.

>
> > Let's introduce a new macro and use that against NTP_PHASE_LIMIT to
> > properly limit the max size of time_maxerror without overflowing during
> > the check itself.
>
> This fails to tell what is causing the issue and just talks about what
> the patch is doing. The latter can be seen from the patch itself, no?
>
> Something like this:
>
>    On second overflow time_maxerror is unconditionally incremented and
>    the result is checked against NTP_PHASE_LIMIT, but the increment can
>    overflow into negative space.
>
>    Prevent this by checking the overflow condition before incrementing.
>
> Hmm?

Sounds better :thumbs_up: I'll use this!

>
> But that obviously begs the question why this can happen at all.
>
> #define MAXPHASE 500000000L
> #define NTP_PHASE_LIMIT ((MAXPHASE / NSEC_PER_USEC) << 5)
>
> =3D=3D> NTP_PHASE_LIMIT =3D 1.6e+07 =3D 0xf42400
>
> #define MAXFREQ 500000
>
> So how can 0xf42400 + 500000/1000 overflow in the first place?
>
> It can't unless time_maxerror is somehow initialized to a bogus
> value and indeed it is:
>
> process_adjtimex_modes()
>         ....
>         if (txc->modes & ADJ_MAXERROR)
>                 time_maxerror =3D txc->maxerror;
>
> So that wants to be fixed and not the symptom.

Isn't this usually supplied from the user and can be some pretty
random stuff? Are you suggesting we update
timekeeping_validate_timex() to include a check to limit the maxerror
field to (NTP_PHASE_LIMIT-(MAXFREQ / NSEC_PER_USEC))? It seems like we
should handle the overflow case where it happens: in
second_overflow().

The clear intent of the existing code was to saturate at
NTP_PHASE_LIMIT, they just did it in a way where the check itself
triggers overflow sanitizers.

>
> Thanks,
>
>         tglx

Thanks
Justin
