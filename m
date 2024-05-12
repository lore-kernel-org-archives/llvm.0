Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E6544374
	for <llvm@lists.linux.dev>; Sun, 12 May 2024 16:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715530170; cv=none; b=uZjKZ0TQ8F6gf8HkqnY3Gp4gwGhMYSVOYCSz753JtZfeYmYUbPxsdiriki1md4AS440xxNf/nVV3y37+v3dhPlOG8mW2/08veS0CdKGDRb5C1afogMpKKNUkBW2ElPKvCHs+vVL04uGBoENGxhjk5ZF/vHGQTrqBKHMv49yTa1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715530170; c=relaxed/simple;
	bh=yYPbKdVLK3KqBVezWJQgrH3PxS7gpCu36SsGnL1rAGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p81AMH1juc9PxGtJMPnmSNeSYna3lVFPWorr6+vKO3IVVBu6aYfcLk7SyzF2u1Z82o/XSXlL2+Zxix965OmzEVhzCy3mlKh6fw3VAJGN9P0JKV1Ru0au1cwQ8jwBKHZITyGulpj4u4E05Ap/hRcr0cOV0LIRfmXbM+AVzxyqVkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=A1H+PCXI; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="A1H+PCXI"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2e27277d2c1so46357811fa.2
        for <llvm@lists.linux.dev>; Sun, 12 May 2024 09:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1715530166; x=1716134966; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mbkMcvIOlR39VVMi6Mj2FfAAerh3AUWOCxZbcMMDx30=;
        b=A1H+PCXINOOYPkrjEPVbKbc/j1XX28VXntaPfP+1T6rF7KaAlME65msTmifuvfmFh1
         Od3/eJzMaHMTKObDWlnH41EFLye0JDQ4zMirpNPutJ99SWLfl4W5U+p2rYKx7Ak1rpya
         ARK89qNTicDpnKk9DhzRFtEwm+2PFEWkDNDzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715530166; x=1716134966;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mbkMcvIOlR39VVMi6Mj2FfAAerh3AUWOCxZbcMMDx30=;
        b=AqVdnlmA3wCm70YEm0eHvdX0W+6hBxsHCNZwMZfAx8T0z/n4Y+sdAVSqVcevcpxect
         JGE/z3Yd4WtUIuNTa3XRDMowJMONizmbGV/UJpjPzHSfh2VGeZHSMmbq0avkZ1G9IM/g
         DSx9b+lorBug3AdEPZ0B+nKENB0MJsVHGEy7eYbTWHokOyXXU1mjedBNyZpdFDvPRIks
         MzFsy1hwMdv8TLR/p2WjGE+iXB7+dG+PI4yk0cqoWYhGsi8zRvZzqBMuI78mDYnixdm4
         Zea2NQN2vebRlgB+mpGIGhdsdM2lYoEzm/zRqZEyJHZr6fy/nOEj0u7/aw969F6/1wUN
         J3Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVMUyrbw3Gpacm7B8pCnupsAqvEcDV8G7EkJNbL29JU7vw4HLN/rZxJzS2wpIlZXKHyfwz7+m4k356QsGZm9hvjwlbpQw==
X-Gm-Message-State: AOJu0YwP9RvajENftaLHYbv9AWQ6xRjG4b26xV2Af7QYph9oLS3o3c4p
	/k0x7+SZYD/6onn+EP0XLZ1EMKSi8g0hXo48QG+YzvIV3AJdK1U9JLhmJbAZ5FRgvVQ4nel7R0A
	W5Yg=
X-Google-Smtp-Source: AGHT+IEm+MnjAjrzRuvoZaHrwGtEXmOkrqPUedGRkvK1aDYtRpA5T6jcTD7M4OTjgzze0JRK+3MPsw==
X-Received: by 2002:a2e:9410:0:b0:2e5:1dae:178b with SMTP id 38308e7fff4ca-2e5204cd07cmr44201111fa.50.1715530166367;
        Sun, 12 May 2024 09:09:26 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733bea65aasm4869127a12.5.2024.05.12.09.09.25
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 May 2024 09:09:26 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a599c55055dso903243766b.0
        for <llvm@lists.linux.dev>; Sun, 12 May 2024 09:09:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVNPgJe3vtecdSQsiF7Lvc6v7VfyInO2UAdXYE2Qw1mhs3EKMyLMcrULO1Fi45aAQBQTeWS2tn8iUPiLtjx2px7QqEsNg==
X-Received: by 2002:a17:906:7192:b0:a59:cdc9:6fe1 with SMTP id
 a640c23a62f3a-a5a2d55ef06mr502053766b.19.1715530164768; Sun, 12 May 2024
 09:09:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202404291502.612E0A10@keescook> <CAHk-=wi5YPwWA8f5RAf_Hi8iL0NhGJeL6MN6UFWwRMY8L6UDvQ@mail.gmail.com>
 <202405081144.D5FCC44A@keescook> <CAHk-=wjeiGb1UxCy6Q8aif50C=wWDX9Pgp+WbZYrO72+B1f_QA@mail.gmail.com>
 <202405081354.B0A8194B3C@keescook> <CAHk-=wgoE5EkH+sQwi4KhRhCZizUxwZAnC=+9RbZcw7g6016LQ@mail.gmail.com>
 <59f731ab619673afec4956fce6832a1cd5324fb8.camel@tugraz.at>
In-Reply-To: <59f731ab619673afec4956fce6832a1cd5324fb8.camel@tugraz.at>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 12 May 2024 09:09:08 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjERv03yFU7-RUuqX1y89DYHcpdsuu++ako2nR41-EjYg@mail.gmail.com>
Message-ID: <CAHk-=wjERv03yFU7-RUuqX1y89DYHcpdsuu++ako2nR41-EjYg@mail.gmail.com>
Subject: Re: [RFC] Mitigating unexpected arithmetic overflow
To: Martin Uecker <uecker@tugraz.at>
Cc: Kees Cook <keescook@chromium.org>, Justin Stitt <justinstitt@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, 12 May 2024 at 01:03, Martin Uecker <uecker@tugraz.at> wrote:
>
> But I guess it still could be smarter. Or does it have to be a
> sanitizer because compile-time will always have too many false
> positives?

Yes, there will be way too many false positives.

I'm pretty sure there will be a ton of "intentional positives" too,
where we do drop bits, but it's very much intentional. I think
somebody already mentioned the "store little endian" kind of things
where code like

        unsigned chat *p;
        u32 val;

        p[0] = val;
        p[1] = val >> 8;
        p[2] = val >> 16;
        p[3] = val >> 24;

kind of code is both traditional and correct, but obviously drops bits
very much intentionally on each of those assignments.

Now, obviously, in a perfect world the compiler would see the above as
"not really dropping bits", but that's not the world we live in.

So the whole "cast drops bits" is not easy to deal with.

In the case of the above kind of byte-wise behavior, I do think that
we could easily make the byte masking explicit, and so in *some* cases
it might actually be a good thing to just make these things more
explicit, and write it as

        p[0] = val & 0xff;
        p[1] = (val >> 8) & 0xff;
        ...

and the above doesn't make the source code worse: it arguably just
makes things more explicit both for humans and for the compiler, with
that explicit bitwise 'and' operation making it very clear that we're
just picking a particular set of bits out of the value.

But I do suspect the "implicit cast truncates value" is _so_ common
that it might be very very painful. Even with a run-time sanitizer
check.

And statically I think it's entirely a lost cause - it's literally
impossible to avoid in C. Why? Because there are no bitfield
variables, only fields in structures/unions, so if you pass a value
around as an argument, and then end up finally assigning it to a
bitfield, there was literally no way to pass that value around as the
"right type" originally. The final assignment *will* drop bits from a
static compiler standpoint.

                Linus
