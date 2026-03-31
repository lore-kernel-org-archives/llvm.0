Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8244344A73E
	for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 18:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774980145; cv=none; b=SLXwdPWQ710ze+zwuXi+9i/fcmRIg8SbHwDeYDWLpVWifVMb1MtTL+1IqoHdLPbnp4oZQo/Y6X7ue6qTZazpmQDsIjdnCD/EozPyYlj0XCTts2+dgdkHoYvX8VZGQan1a7qW2xb77tn6/iKoY/ke+maX72MgPoJlOI5EJW8YY9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774980145; c=relaxed/simple;
	bh=yYwYSvStBtvkzXPBpl2nWuw/hu56cAHxTk2a5c8/rgo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ifb53wTbTh8tdFZJZULEr6wBe5zdQONpnZY8qEY5bo24wTpmD+kT07Kz8nJpNQ87f0Myf9wLFWOGDCicQCAtrDU2SFkEJZds6vep+EimJmzetAZ7RLBCIT4lZh8zLhTWhgs79s/wFPW406BBIThh4zi+T9hQOUvFxH5nnXnUrxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hFphTfYx; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hFphTfYx"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b980b35534eso22802866b.1
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 11:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1774980141; x=1775584941; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TkZ5G8hekNnh++59TEnIGYyFMs6NypLCJp05Fo+wpQo=;
        b=hFphTfYxl6sVMU1KYLTCVvwyh0rxiyPXziKzIsnnBBkZgJoo2brZJqdNR7f/2aCo0f
         IU1pOXFdOVLdnRVANMPl8vvXJ7ORPpcdX0uVQ364hmg5VkhA4uWjlM9i6cqF5hVYHE4v
         UePS0LOqCHzxOSnJFwFbjSY5uJNflWnQSxbUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774980141; x=1775584941;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TkZ5G8hekNnh++59TEnIGYyFMs6NypLCJp05Fo+wpQo=;
        b=FD+853qUaNqMc4nRjyJrFcjdcgw/8Vt52jgKHHI4UMvqk1wg4AdZ5HSDgvnm/EUuVv
         qlEwE5UUmVu81Ne9h6AJ9a1T0VHrUCvS+qwVmE2amaOEeQjQelEtwYVI04C27Oz22FPE
         dZdhoqZtDRxaDYkiGTdhVQbukOao5em8eUnkIJgS9zFYDiAB+kXR8iVUikezxFN4dktI
         HXNTCBaX8bM8Lhxyf4T0X5AMDfFt5c6qIvW7KGR3pWjZK2MNyfkv/baeq6lyGaT8snJK
         JBfcCY31VNF1W9PnD/3hxGQMYSHXUO1gagx15myTdXVgb84wMsPoJWMzepJVLeZyxNCA
         tHxg==
X-Forwarded-Encrypted: i=1; AJvYcCVm4Ru+I/lBdqdjvMEC6x0Yzlwg0aJIbJJxh9eU4sywwGMPYPrT6NdJHNBLUl5HZ7+/gRvz@lists.linux.dev
X-Gm-Message-State: AOJu0Yzn3e4h7qz74rupfDV66fXX2DNTCHtHuehFX/WiFcEfmBKQUagw
	Bw4nEjsoRmO9GyxlEdumnTukYIrypHdwp8DVYxwz3/CkwNSlKKbefjhNNoY/eOuMvFxeWxOJGSR
	sRHae12QAyw==
X-Gm-Gg: ATEYQzxYa3hUFfikoxTEOhxWlEnig68GnPY88ieZeVOxLOKtBmJ2zf8/ZZmU9m6AUOq
	dKICB3p8ob6bY66OltCkcCTSFB2sVtajTatr/wCCjlo3rH3OhLvP+ETnx4yKzs+fEK6kjj2ZXy9
	5bOxd0pa1mmbJzY4xkhAKNziAtWXdasybqsFa+/MAMru894lP46xRceotx6s3q3ndIcolyUH9Di
	LSN9KGXq3VTsnZpuqPpuSUXZgD5MGoSb2yxx6Zy5o2mXnLh7dtVDbe0Ipxcs5oOsNfkYjwBpdVX
	moT5uQ46cFC1YbINl8KY/OsSziAcoB7RT/Qb+jlrGn8x34qUo7fhzaq0H2pReow1jDYLtODEDwT
	HHEeuyfn5HUWZY1UDMN4vW3JeLnjt/tUdV3WFcnFvMKWBY0zPgMPv1H3Q2BjU7OCINZP9FwVqs9
	eov0shKqKN484SDgBD+YSpCDI340z5frOx24GC52tdubBFk2F1SJ5pds6RGppwFPMY2cutUFat
X-Received: by 2002:a17:907:d2a:b0:b8f:d2a0:c283 with SMTP id a640c23a62f3a-b9c155a3a0emr19872466b.1.1774980140882;
        Tue, 31 Mar 2026 11:02:20 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b225f1esm432339866b.61.2026.03.31.11.02.19
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 11:02:20 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-66ba9898ae8so216846a12.1
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 11:02:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUEeG4kpHIOfofCBucNgrEUtPthv9JbGhnQzV/slXGRgGN970srsMwXZt0QnLiypbkqWAjq@lists.linux.dev
X-Received: by 2002:a17:907:984:b0:b9b:9e51:ec9a with SMTP id
 a640c23a62f3a-b9be8355c7bmr264682966b.7.1774980139544; Tue, 31 Mar 2026
 11:02:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com> <CANiq72kL3rTKyDNYmD7wXiKCVJSfa1bnp2L8NShXU7OPmWjJ4w@mail.gmail.com>
In-Reply-To: <CANiq72kL3rTKyDNYmD7wXiKCVJSfa1bnp2L8NShXU7OPmWjJ4w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Mar 2026 11:02:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=whjwHjmB0_2yXsOjDa7Mi_yFSx3AMd3vGk5r70WocvZZg@mail.gmail.com>
X-Gm-Features: AQROBzAduh7vXF0_QXfzo1P8tgp-mw59vEL4E4A0ltej3_oceWZyw3iWH8NeT84
Message-ID: <CAHk-=whjwHjmB0_2yXsOjDa7Mi_yFSx3AMd3vGk5r70WocvZZg@mail.gmail.com>
Subject: Re: [PATCH 5/5] types: Add standard __ob_trap and __ob_wrap scalar types
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, 
	Mark Rutland <mark.rutland@arm.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, Finn Thain <fthain@linux-m68k.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	llvm@lists.linux.dev, Marco Elver <elver@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Nicolas Schier <nsc@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 31 Mar 2026 at 10:48, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> In the Rust side, even if those "explicit" types like the
> `wrapping_u32` you suggest exist, we generally use the methods on the
> normal integers instead, e.g.

In that case the types in question should always be very much opaque,
and not usable as-is by existing compilers that don't have attributes.

My feeling is that that will discourage use enormously for when people
want to just say "yes, I know this wraps, and it's ok".

That said, for the *trapping* types, I do think that we likely need an
opaque type, because I really feel like using

   trapping_u32 x;
   ...
   x++;

is a complete and utter mis-design. It makes the "x++' have random behavior that

 (a) cannot be recovered from (maybe we're holding random locks)

 (b) is completely invisible in the context of the code, because the
type may be somewhere very different

and I think both of those are fundamental design mistakes.

And no, "dead machine" is *still* not an acceptable form of "that's
not random behavior".

So I think wrapping and trapping are fundamentally very different. The
words may look the same. The semantics may often be discussed
together. But one is explicitly marking something as "overflow is safe
and expected", and that's the actual real SAFE case.

The other is saying "overflow needs special handling". And the key
here is that we need to have some way to *state* what said special
handling is, and we need to do it at the point where that special
handling is needed. Not some generic exception handler that has to
figure things out from some unknown context.

Very very different things, and they need very very different
interfaces and very very different infrastructure.

Anything that says "these are two faces of the same coin and are just
different attributes on the type" is simply broken by design.

                 Linus
