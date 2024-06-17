Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E350E29D19
	for <llvm@lists.linux.dev>; Mon, 17 Jun 2024 02:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718590223; cv=none; b=E441y0L524KdlG8pVej5HPcztOHGSuP48CDcGcY3kh/ucPQbU+RCzsFQqMR+CS85VBHj3pPuIGRwP35qI8Y8OhRxzqrSqeMBhH4+B620zwEhjcrNO5BZ2H8pqOhxkl6T5Af5tVF9ndFi8dhGeUVsLX/l/NLrX9LA25u+N2lM1JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718590223; c=relaxed/simple;
	bh=5cDTheXxPIdIssxnQWjv/qLVCXYIkgJSlf1PwQPKjZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kplGhDjTQu+sXV4kGmtXlbXDexNnADiIoQAD7k1rtaqGK8VdojkVAA9Opt04Ca5l5HNDHyRHRrtrmusRo7Yt3LcCc76wTDaLtkYph6On/6ZzmseIfoODzoMwLl++ghD9gI0kPPUKysueJYpiVqrmTsBct3EeKfM2uYEdXVSFInU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=FoHCgeMB; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="FoHCgeMB"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dff17fd97b3so2635216276.2
        for <llvm@lists.linux.dev>; Sun, 16 Jun 2024 19:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718590221; x=1719195021; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqCXTr60lfURDiU6o/ziPYUoB/pkh4/Y0UTODd/6hiA=;
        b=FoHCgeMBbJ1CHh2lpV6RDHkMRAjXFUIM0jrMt6wQzBi24yHsiedmg/RJw2c55Z9Ely
         +/Lnw/lhKoQQTkQyCuXROTErEOhU1FdG7x/45Po89VJFMANG/S4p+QoNlhBRtxnfv8Ah
         jn7+/CPcmxoMRhgcvNX+h60M5f9umGAKkIqq8+mqCB7DutBvIN1aQ29HiIlC9RlxqBgP
         o4h5iv+/eZOhgxSdlgyr0LOCTofIxm0XA42YdshpVrWcF8UYl3TR21N5F/Nyre4kJ4q8
         YerNce7SOxjZ/k7wFriooIBublOFiqkTn1NwGRvXymLpkBhf1VaHYu5lz6HtS7gbE5uv
         CRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718590221; x=1719195021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xqCXTr60lfURDiU6o/ziPYUoB/pkh4/Y0UTODd/6hiA=;
        b=a9R52em95LU5dqE8W/muO2hHhylDi6BTQSJQU+gYjd4ZYgvM14d2t0Oi5OIm9dZSNX
         J5ojSo2aTVFWciaJjaAExhP239aA/7MP0cJVVDAwIKYAcbI0RvO7eyQPQqv5khQ3l3V4
         ZQC3Y8rLfFzU5HeUaCOb6oflwFM0dc/l7CcCzLMZPJc1QacfGKcG8wxY3gc7Jb4AX9Iy
         oG8ysRNb9ekPEf3UqFxFkPvEOBiuWVi9oXPHs+TJWbsiRHXEDnZPD201L/O80d0pEJ7E
         2D2Xp+Hrc969YMyrv92r5GfA0USpzQz52r1xoXf7Q1mDnEZUq6/hkt5rcdg5YX8sdQ5B
         eiKg==
X-Forwarded-Encrypted: i=1; AJvYcCVUGq3t2qxyJ8zqUGUw2MYdSo7ihPb3qjIQ2ydmHWG/gJhjVHTPl4hyr2f9uhl5/xTPBq97R9i+/1bF8hZdLMYueyUe0Q==
X-Gm-Message-State: AOJu0YwjQbAq/S9c4cuWtyR9AjAh2MmAkorvGLq8fRvVVqZSbfauDJYa
	oLCdxIlqf56OCP8yIWcCkQArgITLVA1QXz48ly6pSlEpAEVu8xoqUoKpfhX7u4U3r50mXE9ZJ18
	JdT65thXQeM5t+rjm0U3+B9caMLJHquSrK6/vBg==
X-Google-Smtp-Source: AGHT+IHVdf4CeK9m5TY7u8n2i5EYX8aCm7rXG/PvOUZXj0qTxh3niUzEWChMP06D9pYzethEgSj8BqmnKZHhXWATYww=
X-Received: by 2002:a25:6612:0:b0:dff:3b6a:6322 with SMTP id
 3f1490d57ef6-dff3b6a64a9mr2668500276.34.1718590220902; Sun, 16 Jun 2024
 19:10:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240613-dev-andyc-dyn-ftrace-v4-v1-0-1a538e12c01e@sifive.com>
 <20240613-dev-andyc-dyn-ftrace-v4-v1-2-1a538e12c01e@sifive.com> <20240613093233.0b349ed0@rorschach.local.home>
In-Reply-To: <20240613093233.0b349ed0@rorschach.local.home>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 17 Jun 2024 10:10:09 +0800
Message-ID: <CABgGipXB8uQ7XZbBFMZa8b7mymKAW7qOkKKaA8qVZ0hGXziSYA@mail.gmail.com>
Subject: Re: [PATCH 2/8] tracing: do not trace kernel_text_address()
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Zong Li <zong.li@sifive.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 9:32=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> On Thu, 13 Jun 2024 15:11:07 +0800
> Andy Chiu <andy.chiu@sifive.com> wrote:
>
> > kernel_text_address() and __kernel_text_address() are called in
> > arch_stack_walk() of riscv. This results in excess amount of un-related
> > traces when the kernel is compiled with CONFIG_TRACE_IRQFLAGS. The
> > situation worsens when function_graph is active, as it calls
> > local_irq_save/restore in each function's entry/exit. This patch adds
> > both functions to notrace, so they won't show up on the trace records.
>
> I rather not add notrace just because something is noisy.
>
> You can always just add:
>
>  echo '*kernel_text_address' > /sys/kernel/tracing/set_ftrace_notrace
>
> and achieve the same result.

Sounds good, I am going to drop this patch for the next revision

>
> -- Steve

Thanks,
Andy
