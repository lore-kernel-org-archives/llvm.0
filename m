Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB9F33064F
	for <llvm@lists.linux.dev>; Tue, 17 Feb 2026 16:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771346472; cv=none; b=ZTnRbUvOpx/AYwYkMp6XT3JGtrj5kvAdM0oPvPM12owbDLRidRNeBI5+AztqHxTwMcRurQXmF/6i+fqxZV+//5dIMHTf42W/Lv4tjaCNCTN5NoPTsHyP1ytG0q1lAzNSfgaG/sn7FGarpTJWimD8BLYOsHfBa0BERcc/YPbUDGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771346472; c=relaxed/simple;
	bh=ZmZ/2FUgzcat/6fn9WjCjUUgUP2kIKf0VuhdBktSkIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FPYN3zegESIV1U+3TycaMtlSFPs6P8o4oep4tr91nU0MZILoZU2/MoxRUYokgRyZHN+TMx8M5iOFvpSum9WyK5QqpowVYG0aQ+I3XgfAqEQgsHqGC4yZKx65UG2hTf6/VsUc85ybScq4iWscLnAQcsMQqjUgL5kWikkvyC31YhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=JaeEhe5a; arc=none smtp.client-ip=209.85.208.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="JaeEhe5a"
Received: by mail-lj1-f196.google.com with SMTP id 38308e7fff4ca-38700168abaso30057021fa.3
        for <llvm@lists.linux.dev>; Tue, 17 Feb 2026 08:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1771346469; x=1771951269; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ko33piWn4hrYK2I78h9dD80UmT9p5eWJ3R8jFG5W2oc=;
        b=JaeEhe5a6yvZ/lA5QlAad5v+afoXqoquySlEd3FSMyF0FqTGU2PpZp0wz0nvZ/7WGu
         p2wEEqLwYp0lgwAwRcDlrFdgNTv7icOyWkhJUuKiHOYl09mx7jflwcDYdLkxOq4TRtIE
         njl7w8I5L00GaZnlxDbzp8s2cK7QIGsKVVS+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771346469; x=1771951269;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ko33piWn4hrYK2I78h9dD80UmT9p5eWJ3R8jFG5W2oc=;
        b=DayGQQHIutzoZR0cUpCRaDsp8DlUmm+R7ZFOhhuYR+CtXqVdDwMCwyMi2zIsb34SEh
         wzbCgYi4ymBoNZBDTxppXwfUQaRk0JA9P+x/dDoNGAVqN+I7DqIr+/p17xDRZqemag2w
         Frlwo9tYHhTp+aoTcZdAda9IV+wQwXHj5OFmLy0MLVoTSSKe8lFoP3KsTEhGmSzuYmkJ
         UsqcQRv7qGfvQoeT67cbe52KJx9IuAOueq8qR+B9UauUEBa3g8VqGZawirE35gI3Hblp
         rLzttAwsrjjF9wMtO2i5v2bQiTgQ4Al1B43Bt745JtYZD4fltivtKiOGTY5wD1SXwK+W
         S8Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVS471TsD1kFrsiH0keT+foCWYTL/dcbbM0LTBDkDpv2OFpp8M7nhyBBvlIl92slkrDkt5W@lists.linux.dev
X-Gm-Message-State: AOJu0YzsceSyWWbJGAPXuox8qnLlRywbeA6HJyOT7qDfJdUO95gnGqLV
	9hFcIM9de26dp7lIYcKDHOCgwT06ru0LqatXXXtBNdZjbOxIV0y3UJ3X+cdb/xmUmDqEPm4qTf4
	Q4OM10+Z1sQDd
X-Gm-Gg: AZuq6aIfrsLVz9eUUvxjglaOI+3bFw/TZDF/Bs7wvJ2qDS5IVzuQqkBU3gndJkiAs0P
	jQ55qKw1JRqoqGWvCrSi4X6rhgWRNk9q/6dH09QGtdTt5gTMNEbifCeQpj7mnTDnOVnAbnKLCTg
	c8QlKJO+ayOoTd5e4azBMKTHRMG3oB06ULikQFZ8zAhp8YfdGGSad2cVfJVtP9gALI7Dnjy9ZBI
	ExCd12X9axZZCAud81ys1/tIQw+3q9LAWGG9V+XHxgBOOfly7kCDl14Vdhr49l5YjGe95qeEK4+
	Zfz0b9VkuWyS21Fo7/EEQcMcYaEzmGzTvZuEarOp/chFyhN0wX/LhdjIMhlpQBcf1tGKOosjT2z
	bKvY2mZ9G8vz/TKpKX4tbJP+zujijGpz7XlbNqdQy9YVVFG1C33qBN0Xezk7EO177TZqBtkoT2x
	kt8wvMDKD+0izq/Hs6a0bCoXVYFaOQ911H2lv3s6ffOKX0w+RXHfxMR5CXgoQTG8LTq+g/JfM9k
	wiO
X-Received: by 2002:a2e:a99d:0:b0:387:1337:8c00 with SMTP id 38308e7fff4ca-3881b8b31c2mr33935231fa.4.1771346469041;
        Tue, 17 Feb 2026 08:41:09 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3870689d736sm36337481fa.15.2026.02.17.08.41.08
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 08:41:08 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-386fb2c31e2so32804981fa.1
        for <llvm@lists.linux.dev>; Tue, 17 Feb 2026 08:41:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV1zxJ6E7Ry2/Wms4kVhNt8wynGCEk1JVbr9wIv+wZUqUEbWlPjt6y73eeZg9AmhDtsoB7W@lists.linux.dev
X-Received: by 2002:a17:907:c23:b0:b8e:3d49:25db with SMTP id
 a640c23a62f3a-b8fc3d0c170mr739585766b.54.1771345969110; Tue, 17 Feb 2026
 08:32:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260130132951.2714396-1-elver@google.com> <20260130132951.2714396-4-elver@google.com>
 <aYDFOIskB20CbztD@willie-the-truck> <20260202192923.0707e463@pumpkin>
 <aYHgNSF5a3F7UGU_@willie-the-truck> <CANpmjNNzx-zc_-ZPgwe5DoWLmexw5irT2n+XMUqxTrfwxTxTmg@mail.gmail.com>
 <20260204131400.GI2995752@noisy.programming.kicks-ass.net>
 <aYNUmEfDzq7lTFFr@willie-the-truck> <CANpmjNPHnt6eY-OfkTr5TksHaOon2GyLUokvagcMRa23B6i6_Q@mail.gmail.com>
 <20260206182650.6c21b0ff@pumpkin> <CANpmjNNFXdMM6cL+HBsiXr2WUA=mttR1jDRMqNYD7+YZs6vRKg@mail.gmail.com>
 <20260215221656.68b2fc1d@pumpkin> <CANpmjNOnOqq2k41=iNsgZLXAzspVQhcTZ88Nvms_c_0M+7b7YQ@mail.gmail.com>
 <CAHk-=wioS+vB8aBxWBgdEfXqDq5Ynr9gyY=GhU7gxO9G_C+_6g@mail.gmail.com>
 <20260216110915.4f0d5490@pumpkin> <CAHk-=wjJQQfWpAxigafuyrgxg8CdQWSimVYMk16_j0vWwEkjag@mail.gmail.com>
 <20260216174324.75d47e37@pumpkin> <CAHk-=wgQ8DOxaNY5cBWg+sUkM5Kk6rKYGRHXsZQLtknO_UX+QA@mail.gmail.com>
In-Reply-To: <CAHk-=wgQ8DOxaNY5cBWg+sUkM5Kk6rKYGRHXsZQLtknO_UX+QA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 17 Feb 2026 08:32:32 -0800
X-Gmail-Original-Message-ID: <CAHk-=whFGxN0nUffzCsR_NZnQ5TTu+8QFGSfca1j42kDK1a1tw@mail.gmail.com>
X-Gm-Features: AaiRm5026OjDq2rrF_ejc-OXkVvpkbLdESQBYonZ-1yEm_-yrkRExdRDNKqG010
Message-ID: <CAHk-=whFGxN0nUffzCsR_NZnQ5TTu+8QFGSfca1j42kDK1a1tw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
To: David Laight <david.laight.linux@gmail.com>
Cc: Marco Elver <elver@google.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, Boqun Feng <boqun@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Feb 2026 at 08:23, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> But last time I looked at it - which was admittedly a few years ago -
> the compilers we supported didn't actually do anything reasonable here
> (ie the built-in atomics were fundamentally worse than the ones we do
> by hand, and even basic things like __atomic_load_n() weren't
> actually; better than just using 'volatile'.
>
> Maybe that has changed. We've upgraded minimum compilers since.

I  just checked a few test-cases, and I don't think anything has changed.

All the trivial things where __atomic_load_n(__ATOMIC_RELAXED) *could*
do better than just our old code using "cast pointer to volatile"
resulted in no better code generation.

So we're sticking to that "cast to volatile" not because it's great,
but because it continues to be reliable and no worse than the fancy
modern versions.

But at least it's explicit in the code, not hidden away in code that
*looks* like it just dereferences another field in a structure.

               Linus
