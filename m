Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B8E376BFB
	for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 18:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774981541; cv=none; b=GLZS3OWEWlU6d7eS6HnwoEfYkBLt+ixAoyL/+TXGLhjQm0b8TyJP+nn+lqLAsaN2AJSIIMzkMfvJHhDKmI0VLX8pQGuwsNVhHIocOLBPZVFNKpEc8ozK6KY66eoU1wxhryVzbSxcClOhJv3jJyw7WVvSCFMJlegWHLrrQBvSGpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774981541; c=relaxed/simple;
	bh=ox6OjjUW3Qe6xBaqwUnJk6bmk2llYCPNtvoc4SxKSSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VBlsLzpyl3vwdOEJ71EQzdeDmiWEn5mMPoyV8DtQMMMuzQbkEs3nL9Fvm7EFCkANE6x3pBKchXv3mystXtr7qSpt/NrH7HHVhp7zx0e7NUbCTxoqRKbm16sf6ixYb96pmd53ihu2VV0QeRAs1+VSP7dMw0TvFJCAxsMY6hu+7F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=P9K6Lvz7; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="P9K6Lvz7"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-66c17372965so3457131a12.1
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 11:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1774981538; x=1775586338; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ag9HU1BRKwZOnlae6UtSCfLk/g8PIJV9tSPEI30VDdc=;
        b=P9K6Lvz7A5vpfIe1TGa27q05Uwz1KpiMkUV89EoC984iR+fbSrndjSbg4omlPuWevy
         ju/ErvDD3TYQoR5NzxE9Pnw7ILEURnwXF6+Zn2ieIapwiCraOKkfYg67eoXV2o9pCZIR
         dNLnndDR6bRj61RzHXd+zGv5tsU7kY6SSbl3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774981538; x=1775586338;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ag9HU1BRKwZOnlae6UtSCfLk/g8PIJV9tSPEI30VDdc=;
        b=JU3ps35ZH///jilGjvGOghvQtQGRyVXrQ1UdUsNZ8KSaFtzggwQdYf0JZPQ2FOovsg
         S3XCz7AFSz43a8hgl1zXqt0VF0z8dU1HrPr6Ndmicl5hS2lTT23EVaLZk+NCtCflQfOe
         pf+MrMONc6hCV61CnsjLghg+YfdVxOMXAYCK2Re40YaZQ77E5u4XkZlxGK2D9DrRM3AI
         D4oGhsW3Fgq5J5W1ZnzarvTcQpzj1kbSefVM2GjS8gPdpIrjdoVqv99Pfr8dUBFvSq6Z
         Wlm/1mMKmHlcVKoCMrl8tzQ7k57VqeEdkx8hwgfWkmTjv1OupPBNZ5HremUpQQcgfj/g
         dhew==
X-Forwarded-Encrypted: i=1; AJvYcCVmVMLtqXRhUuH/8FNgoo5fDvESMQqykKx7dbzhVoMoGrHHSKQgXzwDMJ4AEkywJTbyjzgn@lists.linux.dev
X-Gm-Message-State: AOJu0YyQp+/NSABr8ZQDhMBI8eKNNHc4MHNcNbzHBc+4I+TWNTUZIDTh
	8CX8NA/p8v1xRF65jSJ5asJ6mUPOaxeb/6KHcfZ28dJ8o2ytIBHkm8QUibBW+k9xlRfIbphsOFi
	vEAxnSOPf1w==
X-Gm-Gg: ATEYQzzeLFg81slWymq7UkwU2tL2lqjHG/5hqanlZfR8ut/G6XPv5ECqo9Dv8r3SzmV
	XWBjroCh4hc/m3ioQo91nSS3UWrO/qLF3lh2bnmjS3Zhmd5/wbgmRuKnWgd7NSAXDI7VIxnh5jM
	OvKV7WZ29TXecRlh7M4/dJY64gXErlyheSPEvUcf8S/hWKpgnvohgyXQKHOfkImPzpMpdVjXFab
	sQZCL74jiwHKDF7RHbT2e9mm21yFKSHe9/eYkzqOgBD7vc4TY40QRE3TfMo+fcHKzbRIqBs8WWg
	/YVTHahARLoP5xDDan/cWMJkAHHac1xZsiPCnlsQaLf9IY3pqJp5hqkjdPlJ2nGNV+qWEXfPahA
	3uF17oQeK9JcqGRoXKUtxYzfzOXElwlwkvdMddjjFQLmdnrtxp+1jeugcCQoIgJpqVIkd6Ff+7w
	zGEICTfBIGGK7lQuy2Kc4VR9iF+sKYXzVE3b0l5MyHDfuyoPS9JYsAHQEAaQ+XMQLuwd98PgwqE
	oXM954ZPEA=
X-Received: by 2002:a05:6402:43cc:b0:66b:66ed:faea with SMTP id 4fb4d7f45d1cf-66dafea5b10mr361399a12.5.1774981537694;
        Tue, 31 Mar 2026 11:25:37 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b7340cae2sm4106466a12.11.2026.03.31.11.25.36
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 11:25:36 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b9bff57cb62so140359166b.2
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 11:25:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXSJyMuc+QaZGpqDb5t8DAjPAcLamS/9mSTIvfzh6RWDOUArO7vYZ6AZ2JyjfST9oF+RxHA@lists.linux.dev
X-Received: by 2002:a17:907:8b8a:b0:b98:51d6:8843 with SMTP id
 a640c23a62f3a-b9c13b17382mr46677666b.28.1774981536085; Tue, 31 Mar 2026
 11:25:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
 <CANiq72kL3rTKyDNYmD7wXiKCVJSfa1bnp2L8NShXU7OPmWjJ4w@mail.gmail.com> <CAHk-=whjwHjmB0_2yXsOjDa7Mi_yFSx3AMd3vGk5r70WocvZZg@mail.gmail.com>
In-Reply-To: <CAHk-=whjwHjmB0_2yXsOjDa7Mi_yFSx3AMd3vGk5r70WocvZZg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Mar 2026 11:25:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgKB5f3MM40FGGUWUm_9eyESe2PAqCa6uZ=YTi0CdPwDg@mail.gmail.com>
X-Gm-Features: AQROBzBMzOVzd6q58CfNv9Gmf6_GDcPc6oKe55iXDcY89snM0DHbCtfJXA4J_DE
Message-ID: <CAHk-=wgKB5f3MM40FGGUWUm_9eyESe2PAqCa6uZ=YTi0CdPwDg@mail.gmail.com>
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

On Tue, 31 Mar 2026 at 11:02, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> The other is saying "overflow needs special handling"

Btw, this is why I also completely despise the current overflow builtins.

Yes, they handle overflow. But they don't treat it as some *special*
thing. They are garbage that forces code that uses them to be garbage.

If you want to use the overflow builtins (or our wrappers aorund
them), you can't just do the math. You have to do crazy crap like

     int end;
     if (check_add_overflow(start, len, &end))
        ... handle overflow ...
     do_something(start, end);

which obviously no sane person will do, when they can just write

   do_something(start, start+len);

instead (particularly since usually that "start+len" is just a tiny
detail in the code anyway).

Notice how it breaks up the code logic, and also requires you to add
random intermediate variables etc. It's bad, it makes the code look
bad, and people don't use it as a result.

The reason people like exception handling is that you can make the
fixup be done elsewhere, and you *don't* have to deal with it at the
point where you just want to use the result and with silly
intermediate variables etc.

IOW, exception handling means that you can continue to use the normal
flow of code for the normal case, and you deal with errors separately.

That is good. Much better than the "check_sub_overflow()" kind of crazy thing.

So I very much understand why all modern languages do it - but at the
same time most exception handling is complete garbage, because almost
everybody ends up thinking that it should nest syntactically, which is
completely wrong.

Error handling does not nest: it exits. If you have two different
exceptional cases in the same expression or statement, they have no
inherent nesting, and the order isn't even someting you should care
about. But they can cause different error codes or different fixups,
and they need *separate* handling.

This is why the kernel user space exception handling ended up with a
"label" model the moment the compilers could deal with it (in fact, I
very much asked for that interface, and compilers finally gave it to
me after years).

It means that you can move the exception handling out of line, without
having to interrupt the actual normal code flow. And youc an do it
without the bogus nesting that makes no sense.

So I think overflow handling should do the same. Instead of the bad
"check_sub_overflow()" model we have now, we should have

     res = add_overflow(a,b,label);

and now you can use a trapping operation *without* having to break the
normal flow of code, ie you can do

      do_something(start, add_overflow(start, len, overflow))
      ...
  overflow:
      // Maybe needs to release locks, who knows
      return -EINVAL;

notice?

Wrapping does not need this kind of thing. Wrapping is literally a "I
know I don't need to care", while trapping is a "I know I need to
handle it".

It's just that handling the trapping should not need to be done right
where the operation is done.

And in C, that means "goto". And I actualyl will claim that "goto" is
superior to most crazy language models with some "try()" block that
nests.

Language designers have been corrupted by "things must nest". BS.

             Linus
