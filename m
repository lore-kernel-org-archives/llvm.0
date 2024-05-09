Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AAC75811
	for <llvm@lists.linux.dev>; Thu,  9 May 2024 18:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715279965; cv=none; b=M7wSQfKq+9xGbeLwHMW67y1Fbm/xZwOTodMtY/LoimMTigUHH1TS3PJmBAbfqF6sd4zMMQKYns5nQgMEXvUkPDu8FaXzEqCuyzR0MT+P+p2CkvUGlD6y+/RlBZgVjsvGxGTFRZX7EKhs/vuLKf7eTF6kl59dofpwC3Ho0ayegA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715279965; c=relaxed/simple;
	bh=eJ9IVERHhky971S0DcjHHKpGh5uHfCRuKvsYihoB6wA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N0WrVE3g4DDyD/zsuea3b0RgxjePDLwQVrfV5Eo8TK+QizVivxuBBA3SkHMe31L0D1WIckeul8zdvWnSsJyygLzsPGmRb4O66Vmxw5KJYLXEiiQPmXyQpvf4Ugn6vFliNW7cLkBkTr86ywXwHPmWR980N5LAO0Jou6m8WeClE8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=UrpxyLea; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UrpxyLea"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a59cdd185b9so414825066b.1
        for <llvm@lists.linux.dev>; Thu, 09 May 2024 11:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1715279962; x=1715884762; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fqOAT+gv91pKFh1YCYnEhtgE7NzT8BCjrBwFy+U+dzg=;
        b=UrpxyLea7OnTn36+KCZjccDsJjHubeft6lnv1FUwwL6nURl+AEJAIxRLwkrL/Rmvj0
         2x6FE584NvoGK4acEOUz7rYDQ48sxEnqc6EAR1NX1JO+Cx3J3qV9JwPr6CPwbaDhUHtF
         fA8cJwDGKRMXM5KMBbz/PCyDpTb9LHQ/WLpXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715279962; x=1715884762;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fqOAT+gv91pKFh1YCYnEhtgE7NzT8BCjrBwFy+U+dzg=;
        b=lKK3OJKYq6YkFmFozyMWGsCd/BGHwz4AlymAzcvKUlqovgwKzyX8xHUR7FPTjEt7Bl
         GYv9/dJUZDzagdqHPTE1ZZ9mSvXSgsLz/x/wj/mtABk0ytffJhkqtfNjiGvnYNHsDp1M
         1ndlwV/qCl2R7TZqqIQPaSzbx38X76icNcBtswu5L1WaKx2lGyexebqdFkj68qcw/7Rg
         U9K1FNOBgmQVB18dHpDjJ+7p7F5a+dcojHIA6/le1+I6Po6eXokncfbI4D1L0NR1oN7F
         XG+Bp6xRHNbY8/CkRtMAaerMYR3/r2EaCPiV29Xf+tztlKlx9RsjoEoepICKOBkPj71Y
         smvg==
X-Forwarded-Encrypted: i=1; AJvYcCXWYSmIykMDaQ8ifa6mSAg/BGuv/hy7YUr/6qOqrMmuC2a8GeW0q6hjNZX/8UYMkTxEUwYjaucxyjSuvEdp10byQQAYvQ==
X-Gm-Message-State: AOJu0YzfcEvYqciNCnntyt/eqTIlT3Qyz2SlIMzE1K1/WyzWUE0D8cY4
	Cr/cqFtl3eV0pFk217u5DdL285gO9yyEC5wGel+Iph/OS854Tx0nHfwQtvUksANW2W/XfYOrwg8
	+Ka7l4w==
X-Google-Smtp-Source: AGHT+IF35PQrhFo7rrp12/z7h+XP0YP6LejzSrNPN1Zgvp+jKRwRyhYFGYXxe6g3wvEgYc/thZ/MDw==
X-Received: by 2002:a17:906:aec9:b0:a59:b17c:c9d2 with SMTP id a640c23a62f3a-a5a115f2dbemr263510866b.12.1715279962047;
        Thu, 09 May 2024 11:39:22 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b01724sm99716166b.162.2024.05.09.11.39.21
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 May 2024 11:39:21 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a59ce1e8609so403011766b.0
        for <llvm@lists.linux.dev>; Thu, 09 May 2024 11:39:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUF0IVVihBcvYuf04HJdh+TK+sji6EA9Kygv+SldDZt7DccoN4oIzNI1GiUaxgNoWSZwRjLex4o5OlVbUatAnJtYJOETg==
X-Received: by 2002:a17:906:410b:b0:a59:ad76:b371 with SMTP id
 a640c23a62f3a-a5a2d292a8amr45358966b.26.1715279960933; Thu, 09 May 2024
 11:39:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202404291502.612E0A10@keescook> <CAHk-=wi5YPwWA8f5RAf_Hi8iL0NhGJeL6MN6UFWwRMY8L6UDvQ@mail.gmail.com>
 <202405081144.D5FCC44A@keescook> <CAHk-=wjeiGb1UxCy6Q8aif50C=wWDX9Pgp+WbZYrO72+B1f_QA@mail.gmail.com>
 <202405081354.B0A8194B3C@keescook> <CAHk-=wgoE5EkH+sQwi4KhRhCZizUxwZAnC=+9RbZcw7g6016LQ@mail.gmail.com>
 <202405081949.0565810E46@keescook> <20240509140854.GF3620298@mit.edu>
 <CAHk-=wgKyP2ffZPa6aKYtytzzFibiNVN5MS=D2cn7_UGCECKdw@mail.gmail.com>
 <20240509175417.GR2118490@ZenIV> <CAHk-=wgXm15gZHvt8waSFhXS9yZTfvMV95xyvNtPc6FSEA_rvA@mail.gmail.com>
In-Reply-To: <CAHk-=wgXm15gZHvt8waSFhXS9yZTfvMV95xyvNtPc6FSEA_rvA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 9 May 2024 11:39:04 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgBprh=8Us-MtwH9sVNELZK2hdOkFn3EoauwecYgtXOCQ@mail.gmail.com>
Message-ID: <CAHk-=wgBprh=8Us-MtwH9sVNELZK2hdOkFn3EoauwecYgtXOCQ@mail.gmail.com>
Subject: Re: [RFC] Mitigating unexpected arithmetic overflow
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: "Theodore Ts'o" <tytso@mit.edu>, Kees Cook <keescook@chromium.org>, 
	Justin Stitt <justinstitt@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 May 2024 at 11:08, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
>  Any half-way decent compiler will end up optimizing away the shifts
> and adds for the high bits because they see the assignment to
> 'all_bits'. There's no point in generating high bits that just get
> thrown away.

.. it might also actually be a good idea *IF* we were to have some
kind of "implicit cast drops bits" warning, in that the compiler for
that case wouldn't remove the upper bits calculation, but would
trigger a warning if they are non-zero.

So there are actually potential advantages to just always apparently
doing the full 64-bit arithmetic.

Without debug warnings, it's a no-op that the compiler will just skip.
And with some hypothetical debug flag, it would be a "you are now
losing the high bits of the time value when assigning the result to a
limited 32-bit time_t" warning.

             Linus
