Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BAF279791
	for <llvm@lists.linux.dev>; Tue,  1 Jul 2025 17:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751391536; cv=none; b=dYngviHfgm1355SwQOLb9mBvJV+3YxdPtNjsytKlx39e2ZH3Fbibdfm8f+CmB7GvoN8BpyPpBzQU1cYbQzQxt0/0QPoA4uQuWVJAf9qP//tpFK5koPDkqUMqkudxy7z2URKcf7VwikIfCK18gvhIoH0fOBeuEKau364HB7EL048=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751391536; c=relaxed/simple;
	bh=5zvEsOvSYVhWyUtVM6u5hUWth1qIUNz4CrI6JeOFUK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OscP4ysz4852C0kUeMZL2+Zj6h4Mdj14fxSQpvyPGU0ieJkwexdGV+EprP7NCuDzOr9pO0sYGvx/PdLYhQs9hO/TU6N7+P4QXi1sMH0H4GstlUTWPUb88MI83Oz+ebkuxRxFY+rP6zqbeLQWCgk2k0QADw4+VMPARD6X1239tnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t/HZ9nFQ; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t/HZ9nFQ"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae0dad3a179so940920166b.1
        for <llvm@lists.linux.dev>; Tue, 01 Jul 2025 10:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751391533; x=1751996333; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfxUpibom5vvnS0KKvDzUm1M8BKe5OlSJnZe4zWpxjk=;
        b=t/HZ9nFQaqh0FyzoHBjUWUMPndSU1gMPYfuw0KxldZq5vE5leF9vhA2WGnlhChh2eV
         lXtoMte/UJ4Rx01E+JYEMWX6WpCFMQEswZhI65+krQtJEgzA2e51obHJISlhANFuC9+s
         DdMGRREq7KC831n2cevxTq2LBao3DUaeOfJoLodjW/6Ev1gjzg5svg68Blvu2AG1EYty
         DdUtBvvq+tWo5aXA2FJfVkuOkL1QgXmsJBxgZ+JJjDCP5fhV0fHN3IxpIjMdTWS87kEh
         txVLqMw46XxZf19qNmlJqC2CVB1a/ldGj43CMsQM6OQ2oTnH5AohusyWKnxyRogHVvVV
         13mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751391533; x=1751996333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lfxUpibom5vvnS0KKvDzUm1M8BKe5OlSJnZe4zWpxjk=;
        b=OpXMp6CDCjBHsxFSnup0CcherdBaP8OvoayybIwnavc2eCVUj3urwGhlgVPRMny1cV
         uzkiYLk3kcdIAorgY2SueSan35y5x4KtCZjRQPz5gcVyDPFsO7UElpbUVy/elr9bmLgJ
         O+E4D2hFZvGhXiCYq3TESI2M3WRaZm5FJSSvU588iEOl+Hcdd2BlrrxDcQuGs4XxlX77
         irueGXota0Kne/OxRlSBbtDetj+/2l9d2eAXfIDzvZ1VRSRmAchPE3tBhG1BjVmiew/t
         YjUd3ViwVl+V9v7iDWBEaaZmPNXWXBCAnVK+MnRMNQfNSPXJH9HaIQkgyJjxYn+HH9+/
         8bqg==
X-Forwarded-Encrypted: i=1; AJvYcCVYIePKsMYjd91+AuWoVwfg1nFaIAYfaLwbrOpq7ukcF9ELtaBR9PBCrbvNrKDanV1YqN2z@lists.linux.dev
X-Gm-Message-State: AOJu0YxgEK+lR5Ehvfv1ytICVY4A025ToXsiRnilPOmZ9VArkbaxlgPh
	hmgcbT21y1RcKWOYueJx6XgiOiC3T4iiakYAdwIjwcg/HpXODu0qeFpvyntizdmLQ3f5MslRJ1L
	WeD+fneS3/aTJwiw/4uYh3VTBvuXrKYryxBQFBI8=
X-Gm-Gg: ASbGncsLBydOlwvumRTdD0U3fjSX8epOzBcMLrfsIQNRJBR39/Z5s6VNHxROgxfnyet
	iGUKy98azPGuVb/WDVC2lbVU/uRHl1oxHJIJcz58XUFh1J62GtR1oijAZg81Y1VbGDkd5qN/9aJ
	L4PQO4SvPZ3eIi9ybKowbhS8mgWG7WvoJGUONQqeCo
X-Google-Smtp-Source: AGHT+IF+/tonZS3eprL8fBz59HFoDazzWtNrnqbkDEo/bpyI80sUtntiayP1Q+kl77kfKAamsjQgNVIYfD+CC8tFZXo=
X-Received: by 2002:a17:907:e885:b0:ade:4121:8d52 with SMTP id
 a640c23a62f3a-ae34fd6c415mr1795492966b.16.1751391533096; Tue, 01 Jul 2025
 10:38:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250628234034.work.800-kees@kernel.org> <CAG48ez0n1E0iuOxPe=jq4MuuP3w2wMSNixmfNmBbB89jyJBSbA@mail.gmail.com>
 <202507010926.1650356E@keescook>
In-Reply-To: <202507010926.1650356E@keescook>
From: Bill Wendling <morbo@google.com>
Date: Tue, 1 Jul 2025 10:38:36 -0700
X-Gm-Features: Ac12FXzCjsprue_aHpjZnVxD8VXCkB47OcxITm2WNEvN6g9cKXegv-O1gblDGPQ
Message-ID: <CAGG=3QWVM9tTRoGws0X+Jq+m7Fte2JeQC+jUL=EZ5hqGzSY6hg@mail.gmail.com>
Subject: Re: [PATCH] kunit/fortify: Add back "volatile" for sizeof() constants
To: Kees Cook <kees@kernel.org>
Cc: Jann Horn <jannh@google.com>, =?UTF-8?Q?Jannik_Gl=C3=BCckert?= <jannik.glueckert@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, linux-hardening@vger.kernel.org, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt <justinstitt@google.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 9:27=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
> On Tue, Jul 01, 2025 at 03:41:35PM +0200, Jann Horn wrote:
> > On Sun, Jun 29, 2025 at 1:40=E2=80=AFAM Kees Cook <kees@kernel.org> wro=
te:
> > > It seems the Clang can see through OPTIMIZER_HIDE_VAR when the consta=
nt
> > > is coming from sizeof.
> >
> > Wait, what? That sounds extremely implausible/broken to me.
> >
Agreed. 'sizeof' should be calculated by the front-end.

> > https://godbolt.org/z/ndeP5chcb also suggests that clang does not
> > generally "see through OPTIMIZER_HIDE_VAR when the constant is coming
> > from sizeof".
>
> I agree -- something is very unstable about this case, and it's been
> very frustrating to pin down.
>
> > Do you have a minimal reproducer of what you're talking about?
>
> I have not had the time to minimize it, no.
>
OPTIMIZER_HIDE_VAR doesn't have a 'volatile' on it. Could that be it?

As a side note, the current definition:

  __asm__ ("" : "=3Dr" (var) : "0" (var))

seems like

  __asm__ ("" : "+r" (var))

with extra steps.

-bw
