Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C91A36D4E5
	for <llvm@lists.linux.dev>; Wed, 17 Dec 2025 13:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765979620; cv=none; b=km5iSN5mE4qYTG38GN6Tu1ECA5notOShC2G+y51D2HPIHJxRdmFMDIJUEOBi2lkpnYsD2Ox0BDlNOlSPQt4oy6gP6ap0SArxy+Kpz/uwNK7xNhOmhl0s61jsMTkAB7AAh0BvazCvgH43ai46121xQUm3KwDnWFHbCm/hF72vXAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765979620; c=relaxed/simple;
	bh=CjnHJLYxh9NIWSmAW0oXG1F9NuoGVt1bcOhX0OTH3WA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DCRi1ZLYumQ9Gd0SisdTh3pRoXlTdvDcUCyFF7zbgxZ72zqolJAEHJIIqY9OcfdU3h+/5m2xV1mtONE0nZvRzcLfp1YyfCUOXA1wIZ68j5SmHXcziXy03nWVC2MX5pRxJ2Kvbcgv0OQb1DdEnkijjl23FmugahrEiKZi/PllgTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0NZgw3Xz; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0NZgw3Xz"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-477a11d9e67so31321415e9.2
        for <llvm@lists.linux.dev>; Wed, 17 Dec 2025 05:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765979614; x=1766584414; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GwYQjUeDdM5Nle1IpM5e5V1FvMRCYFAI0uCKIrSa2SQ=;
        b=0NZgw3XzpWGjFiMYtEHs6a/iw7ecdkS/ilPFBqTZ188tr3ZleePKMms2D8UzL+CMG7
         XF/Y1bFnEJ/UJoAFqZl6GVPewQAiCzkxTbnXhvcG4LYeIzQijP94O52tu2kUcOmAao1d
         Uz8yI1FqtKU3jDtuGwDoy+xYdjR9j6wlhhyX/M2mN9t5G7rIP1RzSYxEd36L6fbIQdJq
         0LtciDSUZlZ0kYwv/7CGKvuueUALhCCIwz6kH3MbSDP4QTPJ3Z8BbBbsGZx8U6YGbjfy
         TImz/xcf5djhb078kahm+RICOhH6oxDAiCDo8shnTPb+43diBjDhU0yCW4uVwaqJdscN
         uHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765979614; x=1766584414;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GwYQjUeDdM5Nle1IpM5e5V1FvMRCYFAI0uCKIrSa2SQ=;
        b=U2I4yF8/EPJbc1J5wNT5p0SOlVW1VkqVE0OtzSThAR06JehEUiw3Gsm1+hXjEasegT
         dvJMdg7pWrrV9WRmiREnPkK9XYK8h+9QUnro0codwIDb+KH+ojME6SxF7Wi6sZIk/Dfh
         OxX5mWlWE1cS4WOMYuehTUn4h4ktWU/XWu2rmMdVDveEUdpmBNLW850D5SiioBe2BHSd
         0wH9eW2nJVCcE8DS9Sxiuz1EbD6+OgQjJ6YmOudB9MQnoNB9cKWSDXaCFsUEB5wjbCnK
         oRyGB9KanHX3OD66QFHVg7LtP1+7ZAFy3l4IvvfGjrXjGn8bqp4vMpcGFHX1NhC9hEz9
         RXsA==
X-Forwarded-Encrypted: i=1; AJvYcCXiD5JXgDmMvejGyHXRsKfG0qoeZ1tfGo+iwpQsHyF6Eajc6JSlwrdihgBOeo5WXBVGgMC9@lists.linux.dev
X-Gm-Message-State: AOJu0YzZ5v4FR8ARee3v+gsGI8V6GXEK5TgENiAJrNM5uD1FLMM4ha2F
	rVQVoVNSafgZe4h8CYZRzKL62NrS/8DFrjabNcP3vW+5AbAPXqQnvY3u//l765JCaa/jHR5xazc
	/Bc6vCVVAI5tswQ==
X-Google-Smtp-Source: AGHT+IEY+zeplp7tJrsWxhjOhVbg/z9HJ2VKN9G1+nCVhTS+SXG8VbzCbUYGsr2pZOH8Zg/AWbnOXNkfLP8NnA==
X-Received: from wmgp21.prod.google.com ([2002:a05:600c:2055:b0:477:afa:d217])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f90:b0:477:b0b8:4dd0 with SMTP id 5b1f17b1804b1-47a8f905680mr190102895e9.17.1765979614010;
 Wed, 17 Dec 2025 05:53:34 -0800 (PST)
Date: Wed, 17 Dec 2025 13:53:33 +0000
In-Reply-To: <20251216130155.GD3707891@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251216-gcov-inline-noinstr-v3-0-10244d154451@google.com>
 <20251216-gcov-inline-noinstr-v3-1-10244d154451@google.com> <20251216130155.GD3707891@noisy.programming.kicks-ass.net>
X-Mailer: aerc 0.21.0
Message-ID: <DF0JIYFQGFCP.9RDI8V58PFNH@google.com>
Subject: Re: [PATCH v3 1/3] kasan: mark !__SANITIZE_ADDRESS__ stubs __always_inline
From: Brendan Jackman <jackmanb@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Brendan Jackman <jackmanb@google.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Marco Elver <elver@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, <kasan-dev@googlegroups.com>, 
	<linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Tue Dec 16, 2025 at 1:01 PM UTC, Peter Zijlstra wrote:
> On Tue, Dec 16, 2025 at 10:16:34AM +0000, Brendan Jackman wrote:
>> The x86 instrumented bitops in
>> include/asm-generic/bitops/instrumented-non-atomic.h are
>> KASAN-instrumented via explicit calls to instrument_* functions from
>> include/linux/instrumented.h.
>> 
>> This bitops are used from noinstr code in __sev_es_nmi_complete(). This
>> code avoids noinstr violations by disabling __SANITIZE_ADDRESS__ etc for
>> the compilation unit.
>
> Yeah, so don't do that? That's why we use raw_atomic_*() in things like
> smp_text_poke_int3_handler().

Right, this was what Ard suggested in [0]:

> For the short term, we could avoid this by using arch___set_bit()
> directly in the SEV code that triggers this issue today. But for the
> longer term, we should get write of those explicit calls to
> instrumentation intrinsics, as this is fundamentally incompatible with
> per-function overrides.

But, I think the longer term solution is actually now coming from what
Marco described in [1].

So in the meantime what's the cleanest fix? Going straight to the arch_*
calls from SEV seems pretty yucky in its own right. Adding special
un-instrumented wrappers in bitops.h seems overblown for a temporary
workaround. Meanwhile, disabling __SANITIZE_ADDRESS__ is something the
SEV code already relies on as a workaround, so if we can just make that
workaround work for this case too, it seems like a reasonable way
forward?

Anyway, I don't feel too strongly about this, I'm only pushing back
for the sake of hysteresis since I already flipflopped a couple of times
on this fix. If Ard/Marco agree with just using the arch_ functions
directly I'd be fine with that.

And in the meantime, I guess patch 3/3 is OK? As it happens, that will
already make the current error go away without needing the first 2
patches. So maybe we should just merge that and be done with it? There's
probably a good chance no other issues will show up between now and
whenever Marco's nice compiler support arrives.

[0] https://lore.kernel.org/all/CAMj1kXHiA91hH80tHFCO9QjkkfzEGZ2GJgpHnuKrusKhOULMXA@mail.gmail.com/
[1] https://lore.kernel.org/all/CANpmjNNc9vRJbD2e5DPPR8SWNSYa=MqTzniARp4UWKBUEdhh_Q@mail.gmail.com/
