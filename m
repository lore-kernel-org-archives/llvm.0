Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1459415A853
	for <llvm@lists.linux.dev>; Mon, 29 Jul 2024 15:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722268442; cv=none; b=UsQucbZSOtkcvWpmH/u/QRx4J+4IrTuUP+JAk+yj0is8OWgbzF7LFWvze33XwhLdPsR0/2GAWROxJ7exLdD9qXkWjMuA55ws0E1S+tYmQjFa/nm0/yFPA5msDMKV4LTWN7XXCJMrB80lDMUlRZm7Sr962bJ0c/hDTptnsMdLAkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722268442; c=relaxed/simple;
	bh=vit//5frB+Bxo4uCQ9TaphFpIjNsNOImUZUDRYyDM/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dyPfRUsGzjycFKQ5xs4vPjAn2e6j7HLB4bNuXOSMqJfZl1aSch8Li1J/xoHc0nQJdxtOU5PbvydW5IVHTqxmrD/ZIBR+dk3w/EEdGZZR4MAa4nMCKZGYvtgglM4N6JormgEul6Pc6VYoJDtJwO0x2MW511fX4w2Bg5VaNOhYZKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2Qf+Fcx9; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2Qf+Fcx9"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-44fee2bfd28so428221cf.1
        for <llvm@lists.linux.dev>; Mon, 29 Jul 2024 08:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722268440; x=1722873240; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G7NVQIGmQXJU9zMY7yOvP9B85E2qvUl+m8Pl4MaC7co=;
        b=2Qf+Fcx92+8YaradJqPgIBmGnxx+noeTjDrQ4y/PQFObL6vuvNCVYT8LrtADdrMKUN
         UB2wxkMyMug1mzNYb5Fhk/dj6ewgB2h5G9KicHUiN8wtoVGXc1KOy7ZA48Fr4GU8f73B
         96yuj4EClPc8bjkMWNxtUQCGO9dc7no85vGRu2kCUVOYkU2UZewaiPSkLNe5tmBHJ+Mq
         YBFICA/qvlDut+l9IrAq2c1OLsenJPFNQrJqdx/NYNP1UwpBRQUrZFoPHn9y+Wru6X/9
         mVzUTzo5sr4fa+akeJfh2ZxD9IxxWClxlmLn0xSUDnnv5fXgU+zsabaovYO5xa0G2XuL
         V4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722268440; x=1722873240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G7NVQIGmQXJU9zMY7yOvP9B85E2qvUl+m8Pl4MaC7co=;
        b=sO0OsUCRcSzRNNqcpBY8E8SYNb0+/6VkMyg6S8n+uN5+nGuO5Eb+RvCQT16rxSrc4g
         BU41GaQJhqLXRyF+MatIB+gbZ0T5CC8/y4Rb6ocFD3rOA1EnDJZbTKfM3Ok90ON0obwj
         msjnG4bj3ykwg5l0pdAupRDxxDBDpRazx5HR7O79lxK1SoXn78LmwU4xjlTG2cHqpJA2
         izn2HS2/Kpw38DN6o+ehGeDFr4TlQA8D+hh4zlsNJL2WXrw0Iu1B5uytgTgbyFvrL4NI
         pHT+944L3VPVVHW66h3uFn22GuDADtdWiFTXT/4yjlac2+7aBjlrkapesihKfrxkRjLo
         LEzA==
X-Forwarded-Encrypted: i=1; AJvYcCVRWXckZd761S7bRmy+5fzcYf3BNx46D4jL7/8X6k+1adcX4svbShjw6ShFVPg22hQul3oNknnTZdCW0lCeNX8yGRpmUQ==
X-Gm-Message-State: AOJu0YxHL8s0lz81KlaaLCByV9f9fnunDWe3y/OhtNRwtyyYDrEX9qox
	WpjCMLgKXaBQQCh1+Zld14pzcXw80qz1kGTbOeepIjZD5VU116MpTIQ90IRyKkz09xiDWIRZSRl
	kEPdo5x+cDvfmVZ92wsrJtA3kS/BTSYJWJ74/
X-Google-Smtp-Source: AGHT+IGtbd0iBqee7SwSoc94TJ7CIzVF+bo02bFcdiIhIU5AVsKcZ+YG/U7J2gyGGtrfLKplipYfybTILWWzXf+wdc0=
X-Received: by 2002:a05:622a:303:b0:44f:e12e:3015 with SMTP id
 d75a77b69052e-450329acd26mr220951cf.25.1722268439856; Mon, 29 Jul 2024
 08:53:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240727175919.1041468-1-linux@treblig.org> <CAP-5=fW+VbDaFV+YQCMMKYzrraMLLuVqb=BChL0o=-D5Y=4N_w@mail.gmail.com>
 <ZqewJ6oIprdRY8C5@gallifrey>
In-Reply-To: <ZqewJ6oIprdRY8C5@gallifrey>
From: Ian Rogers <irogers@google.com>
Date: Mon, 29 Jul 2024 08:53:48 -0700
Message-ID: <CAP-5=fUHVZDS9y4Bm=OesD5qpHHv7qqo2ALU70EPdS5WiQs1-w@mail.gmail.com>
Subject: Re: [PATCH] perf test pmu: Remove unused test_pmus
To: "Dr. David Alan Gilbert" <linux@treblig.org>, Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Cc: kan.liang@linux.intel.com, acme@kernel.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 8:07=E2=80=AFAM Dr. David Alan Gilbert
<linux@treblig.org> wrote:
>
> * Ian Rogers (irogers@google.com) wrote:
> > On Sat, Jul 27, 2024 at 10:59=E2=80=AFAM <linux@treblig.org> wrote:
> > >
> > > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > >
> > > Commit aa1551f299ba ("perf test pmu: Refactor format test and exposed
> > > test APIs") added the 'test_pmus' list, but didn't use it.
> > > (It seems to put them on the other_pmus list?)
> > >
> > > Remove it.
> > >
> > > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> >
> > Strange that the compiler doesn't warn about unused stuff like this,
> > we get unused variables within a function and unused static
> > functions...
>
> The problem is that LIST_HEAD initialises the list to point to itself;
> so it *is* used - but only in it's own initialiser.
> I did file:
>    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D115027

Nice, the bug already has a fix - good work! Hopefully clang can follow sui=
t.

> > Reviewed-by: Ian Rogers <irogers@google.com>
>
> Thanks,
>
> > Possibly:
> > Fixes: aa1551f299ba ("perf test pmu: Refactor format test and exposed
> > test APIs")
>
> Given it's got no actual effect other than a few bytes
> saved, I'm not sure it's worth the Fixes.

Ack. I mention it so the maintainers can make a decision about fixing
in 6.11 (still in rc stage) or whether to hold for 6.12. It seems
pretty safe either way, but for 6.11 probably better to have a fixes
tag. If the GCC warning becomes a thing there's a chance the code
won't build without the fix :-)

Thanks,
Ian

> Dave
>
> > Thanks,
> > Ian
> >
> > > ---
> > >  tools/perf/tests/pmu.c | 3 ---
> > >  1 file changed, 3 deletions(-)
> > >
> > > diff --git a/tools/perf/tests/pmu.c b/tools/perf/tests/pmu.c
> > > index 40132655ccd1..0b2f04a55d7b 100644
> > > --- a/tools/perf/tests/pmu.c
> > > +++ b/tools/perf/tests/pmu.c
> > > @@ -18,9 +18,6 @@
> > >  #include <sys/stat.h>
> > >  #include <sys/types.h>
> > >
> > > -/* Fake PMUs created in temp directory. */
> > > -static LIST_HEAD(test_pmus);
> > > -
> > >  /* Cleanup test PMU directory. */
> > >  static int test_pmu_put(const char *dir, struct perf_pmu *pmu)
> > >  {
> > > --
> > > 2.45.2
> > >
> --
>  -----Open up your eyes, open up your mind, open up your code -------
> / Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \
> \        dave @ treblig.org |                               | In Hex /
>  \ _________________________|_____ http://www.treblig.org   |_______/
