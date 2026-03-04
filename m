Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1DB3890ED
	for <llvm@lists.linux.dev>; Wed,  4 Mar 2026 19:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772653756; cv=pass; b=K1fg5mKsq94FWpBj/TP1avmUxFKvsyvCnYgjuglC5b8TDzQaajM+wR5g2hGcTiEZBry3wwSNmUe8Gg1VkpkjZFZTMXBlMEzMnC33abx2BiwufMoOuKnFBrHu5lu/x/XsRQlF3lAozz+duBQ/yZcwYOpP6kxSChdV/0m4HS0PrdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772653756; c=relaxed/simple;
	bh=kGZofsMoBX9HGyARalV09zYlCVqb7xMFI2++D37F9v0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DmSUjBW7Xi3OFKExBkVZYe6elH423lgm5r/qPVLQBlDJJUxlEOehbqsWLNSCStx7hfDm0UP9btKjkZ27BKSHcG5vBIJ2O9hT5U86qpBzoz6sJHsCOPJfDZVzFcjJGTDvgU54T5sNubUIR4q1Mg119XL7+sVV3P/JApbM8V60ARM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EXchhs8I; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EXchhs8I"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ae3f822163so13135ad.0
        for <llvm@lists.linux.dev>; Wed, 04 Mar 2026 11:49:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772653754; cv=none;
        d=google.com; s=arc-20240605;
        b=Mihausf4LsdzaczMyWAHEnjc1jNKvGWqd6jLZJHTOxvj2fNtpLl9DR7RHFp257Mm3h
         3cibEhH2RydWo9LAN+uX27RIhucZ7m8fhMSohb4kgsDp87np+tM/5cauHTEibCoomefC
         cKcFTBVbi/mqtRokKE3uQaO4FumGhaUuf2Bc7AXthzMb9L4/qzbfZdKAtuGbIyrzHDBM
         P6WwbRuR0tIRn7jPKbdTnzI6Wd6aH6bRSYahxWG77LL7vaLNnzJx1FqhWk2Eq1N60NRd
         iml6hsyFBaIVaMCdUUtHGzlWZ0I2aJoNulmQ06QgZ3MRCgMNv7KH0nHD8SLrDcx/JUK1
         5RpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZocDmLUpZEUyLZeVK8DcWh9PC3uLbaKAc4Jz6PpgiF0=;
        fh=r8oTGcK1puwdConlMLU/wkFTOlTnJAWaI5Se0cPCt7I=;
        b=D4h6JQ6a2GQ5sKAmfGuNt5azjIZrQ+eo/gaTTuPtyncgKkBO7sWXQ0KZI/UQepRDMe
         Ns9Rk/ad7KnLkzU82/AyFtIIEefcOHuVT1Yf22zwaGY98h0pMRfsdH9zO933W9U07Ee4
         2dX/Z2YR4BlM52R0pMX8e1KZSx5bwgP0tGVja1kHKuRY9uJt64ETFnU4RnXY81LSEHnQ
         ES6TJxOlwOvrWC3czk6JbtrDYzX0/x01qOv2K9Y4nZpT6Di74GXeDZfVUEKfzFlg2gzN
         SXQ7NF9zzYtQAMspMbFvfCOlg5uLqdNPmfhOmCJ1L6YQXPLINpUTaKYyA1RAcfM0tBId
         vpMw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772653754; x=1773258554; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZocDmLUpZEUyLZeVK8DcWh9PC3uLbaKAc4Jz6PpgiF0=;
        b=EXchhs8IyoyoOLhzwz1UA/dY+Fr0Fv4gSO15A39lTFuyfLZoK7V+JtV5yiI+ivHTvD
         GmoZJ1i3fsLeZV1IdtvYvbB3vtn2U6FjEVVN1hxa9A/hAJsA5LNn0vp+Mvh7AI83KIyQ
         TxPw8qrXJ73crVl3WvsHJE3zqwcZ/fMA99MJIoo7H4YsVx/hJiIrTrPQQjQAndLT1WeA
         0HVzeiDJ29SsOu++Wpf+QYEccGg9rTz3TqI90mNrKlC5pSCu8OgCmmN9lrw45I37qZV9
         Cm6BT83VelLUXKiGfZ/QdmSUdEZk9mYdqHlWps6eo47snv+B43P5EcwEKXDX0CvpzIq2
         5/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772653754; x=1773258554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZocDmLUpZEUyLZeVK8DcWh9PC3uLbaKAc4Jz6PpgiF0=;
        b=MhdtyTL+t86IOLvA3Z84/3jvwXmAde29XWZ9v+uGnY7ZJxGu7uzgjEWwpLLrGMnyEF
         e00m6IGv00M1ScsvN0gBOlCZC6+NnRGLmenCFcCyo7oh7/Y5hIDeUsIiwqIU5cutc+9m
         hhZB94RBKU+KJeX7TSVVud8cNUMV11tgpMNQVAauyYwgyuQGyLSr404DCaG63JBRsUi2
         quAFEJjiWPGuFW09aZpv/d3YLX0fro3KEmIBGWaVM3c5OnlyqZoz4jktOs7g5SvUvyb7
         4beDMOmoljlmEJ2TMUYDzQUXvouuTIMDKkm3HsWiAdwUzjb7ZxA4RVgRwENDd2WuhBjw
         Wllg==
X-Forwarded-Encrypted: i=1; AJvYcCWv87zC149SH8fNNGAJf+11eXfL+usHF1Xu4OoPNGEG+vY/EFRkcmNrICbVXc3dgtoYVYYz@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7KF46A9vT3yG5/Va5bGGBK+kXhNTgA3a/p4hOnXSSc1RrdYam
	P8399jA5cHA0V5TUNIGcIctNYvblnEGHdLBCr8Q6sAtfJIfyPevoj97VVLnyUNItRO+Tkc7JnR2
	PiDr+RkAkIT692isD0FxKp+FLNde2zJmzHoJmdVtf
X-Gm-Gg: ATEYQzwvWhBogD5T4huujEhJeImAbwjE2omIQvfTZn1ZyERKm9uDZK2K+4dr6SFj2nI
	p0FbP2oh03ruvVZ1cvaorLvL3HIWghOwdhsHoSoHlVfy2gqIoIqbISFyR1Kl5XT5rqBKW+vz61R
	6qHsRybJGcOTibQ4uRy49HNLxXR3IXDMp3dU9eKQUaY3kW4Q5U7RqC01/rr9gYo+W1TCaTu6Xgh
	sGJ9qMU4YipMX1c9jB8xK4Pjf/khfYPrcdx/5EuYxPRp2TIAYcLyci8NB0dsdPwf0Zb9Bx+ZJmH
	NFU7ezQclDfNvNnDkw64tlNV8iq0NxbXqYvGSQ==
X-Received: by 2002:a17:902:cccb:b0:294:ecba:c8e with SMTP id
 d9443c01a7336-2ae73922533mr365115ad.3.1772653753351; Wed, 04 Mar 2026
 11:49:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260304190613.2507582-1-pcc@google.com>
In-Reply-To: <20260304190613.2507582-1-pcc@google.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 4 Mar 2026 11:49:02 -0800
X-Gm-Features: AaiRm51ifPkf8exfzeZMqvoPUdPbAwYGghS-ubCp1OWMJ-ciEHNz5WiUAnS-_jQ
Message-ID: <CAP-5=fXZ1JQANk55R7PXKk0m6PP27GBrEW5pTBECa9TYJACeWw@mail.gmail.com>
Subject: Re: [PATCH] perf disasm: Fix off-by-one bug in outside check
To: Peter Collingbourne <pcc@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 4, 2026 at 11:06=E2=80=AFAM Peter Collingbourne <pcc@google.com=
> wrote:
>
> If a branch target points to one past the end of a function, the branch
> should be treated as a branch to another function. This can happen
> e.g. with a tail call to a function that is laid out immediately after
> the caller.
>
> Link: https://linux-review.googlesource.com/id/Ide471112e82d68177e0faf08c=
a411d9fcf0a7bdf
> Signed-off-by: Peter Collingbourne <pcc@google.com>

Fixes:  751b1783da78 ("perf annotate: Mark jumps to outher functions
with the call arrow")
Reviewed-by: Ian Rogers <irogers@google.com>

Thanks!
Ian

> ---
>  tools/perf/util/disasm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
> index ddcc488f2e5f0..9e0420e14be19 100644
> --- a/tools/perf/util/disasm.c
> +++ b/tools/perf/util/disasm.c
> @@ -384,7 +384,7 @@ static int jump__parse(const struct arch *arch, struc=
t ins_operands *ops, struct
>         start =3D map__unmap_ip(map, sym->start);
>         end =3D map__unmap_ip(map, sym->end);
>
> -       ops->target.outside =3D target.addr < start || target.addr > end;
> +       ops->target.outside =3D target.addr < start || target.addr >=3D e=
nd;
>
>         /*
>          * FIXME: things like this in _cpp_lex_token (gcc's cc1 program):
> --
> 2.53.0.473.g4a7958ca14-goog
>
