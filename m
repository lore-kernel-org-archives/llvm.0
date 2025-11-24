Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8A632E134
	for <llvm@lists.linux.dev>; Mon, 24 Nov 2025 20:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764014725; cv=none; b=JWW7mgDp3MG1xEqf+XUcdoZUb0SQyvnj+24QN2WpaXsGfdrMcSZQq+3eNUXS+0UO87vkY6KJUNoi9AL5jwALvp3gJyXjNn5ONd/4RcVAI1uztLe1OBiaQAbuE5p0oDUBTfDxMWSpZ+la68lVhumTEA5M0LpQSAAyCnUxU+6CWrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764014725; c=relaxed/simple;
	bh=yoo8TL0UmC0rSkYJxN+UPZMH8vOivVZOVzAfgiZbncQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E4E8ibjPVVFt6bw9Tlm2oL5Lgdv9CMVydK/RubpTfSNVn7cFAvUR150oxEjdXQJeiIjREmZfppabTok7Kpe9paafD0r9wIjcktqpjedJjJ7qzaxzhx85/eByCM088UyhDJaVPu32tapnwRP6ojLEl5DPG/p15cSkipPgywLD6qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ugbt67t1; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ugbt67t1"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b73a9592fb8so444170666b.1
        for <llvm@lists.linux.dev>; Mon, 24 Nov 2025 12:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764014722; x=1764619522; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDatnVohjV93iMI1f1dsChXQ08m+P0L1QodGnDzNIIo=;
        b=ugbt67t1M/YF+x+eO0oLhqbGdnaMMXkDb78qsqr8ZKrUljjrVVAC4Q3pwSFR4OhDYg
         mytUwXrqV2ONEgPOAyWj8p3xOx9SHep/BDkG0rEHoWWwEJ8XNoRerQKxLZOu66kUHypX
         ZW8s42RtOAYAis+BBSBvKAJn6sP+bgkRAivHKDI42Z0rN+DqB07t9UUo6xu/o0S9FgRH
         Rf6zY0YrXzHaca7feIaUMjaDdsBZnrAWnXliOPUF4/s9XB3KW+Qh4uCnAUVP6lYjMzdD
         8QRDnUrgD+DLBRjMB4TMLlrcHCcePkuYks9QEDVL6y12khF5j/cankubwO+7UP1Y2iQX
         a36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764014722; x=1764619522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qDatnVohjV93iMI1f1dsChXQ08m+P0L1QodGnDzNIIo=;
        b=jqozY/Qajl8yQFukNYwug89OO9o/96UWsPN7w+A9R/8VpHHb6SPOZ3PoDxFwILOvBW
         /+kzOhnLCBwoyknxtq/FNu4Kls6RLCsrwHcRlqegibj+vwDVQBqBGZUKUxIQ6J7obBcV
         7Mew1sNjngWfwOMgAcE9J2V+T12LOyEQ6imzulselaIAlW0eOS8DNvXP+Mye0Pc68d2r
         rrc7rKhtZjwSGpSxtX49umkLqihEPOr47vn5x8EtBcbVR3HYosKzgHTvszRCF66xve3m
         l1+JbRWkjICj4XbZRz94dWa2EUiQJYaYBnXIPBXiTd1xw7GHoZEQv0ipJ+z1ay3Dfe2B
         lC+w==
X-Forwarded-Encrypted: i=1; AJvYcCUSSoEfEN6lG9XrzP6eFTup2Ze3QAihMqt9wk+ZwMm5ZGw8GWe0GvARavYJccs7KTXcQWTr@lists.linux.dev
X-Gm-Message-State: AOJu0YzNW0HA4Vw5Lc7o9kWe7Zes6latjycXrL8K8Xfy52uo22j/HMfM
	Xky3tp8cQ/RxjQA71Iil7yaBF05NBbfDQ1ieJzBzjUXVhPVyCwt06ZM3J6Xr3gQenlGYw1Unt5+
	+VielkBR++IXQ9ko2LxgSb0mmlH+MJlq7ZAGs+rA=
X-Gm-Gg: ASbGncsG9urrVqylzutJujmJJh6cqSyMk2zISjWewW8JgGMCEEzU96Evlb1xLY6OMof
	jnC2YC3BhOCfKKYq5VskUafUxz4Kh6peOa7fEOgAhAQ7TS/NJrguuDndK9z8e8Hv0+J+dVDgKDY
	ZlA3lwzpR1yJlrzYb9cKjxKUcBzGA9RC4lE2W0h4ZMhRj5r8+hS70XNAht5Rj1e18l0kmOiqpK9
	hYc5TvG09w4d/FSfCMcq0NliOdhRSCvpE4Q4zo5S+nwXxnNTvQWWHdxiHVWPe8yvN5uhtdyLaRI
	SHA=
X-Google-Smtp-Source: AGHT+IFUf9dyCXHjYnD79GQAeciONLMUwzjqFKX0yRYT9LAjFM7+zLXDNGR6+qos3nnnuSGbrx3NaXS3PlreKRiwl6k=
X-Received: by 2002:a17:907:7204:b0:b73:7e63:2027 with SMTP id
 a640c23a62f3a-b76572f554dmr2029886466b.28.1764014721673; Mon, 24 Nov 2025
 12:05:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251121193957.1655580-1-morbo@google.com> <202511211517.539CD58@keescook>
In-Reply-To: <202511211517.539CD58@keescook>
From: Bill Wendling <morbo@google.com>
Date: Mon, 24 Nov 2025 12:05:03 -0800
X-Gm-Features: AWmQ_blyNsMsZzv61KoykCAil7jHYbSewSF_04qxNlQz-3AD1q_UAmkY3Djq8XY
Message-ID: <CAGG=3QWMrs0j59Zt1BEh=8YOx_yeJA4n6v2yJFoxuHBq3COPRg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add __counted_by_ptr macro
To: Kees Cook <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt <justinstitt@google.com>, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 3:25=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
> On Fri, Nov 21, 2025 at 07:39:42PM +0000, Bill Wendling wrote:
> > These patches add the __counted_by_ptr macro and then uses it in
> > mm/memblock.h. The name of the __counted_by_ptr attribute is the same a=
s
> > __counted_by, but two different macros are needed, because of feature
> > skew in GCC and clang. Once the minmum versions of the compilers suppor=
t
> > 'counted_by' on both flexible array members and pointers in structs,
> > this macro will become obsolete.
> >
> > Bill Wendling (2):
> >   Compiler Attributes: Add __counted_by_ptr macro
> >   memblock: annotate struct memblock_type with __counted_by_ptr
>
> Based on this[1] thread, I think we'll need to wait for GCC and Clang to
> release with the "void *" support first, and then push the counted_by up
> to that version to cover flexible arrays, pointers, and void *.
>
> [1] https://lore.kernel.org/lkml/20251021095447.GL3245006@noisy.programmi=
ng.kicks-ass.net/
>
Would it make sense to add it with the expected compiler version
releases so that (1) we'll be ready when the compilers are released,
and (2) people could test the new features with compiler RCs?

-bw
