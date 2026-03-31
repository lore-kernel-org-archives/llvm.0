Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C9A43D514
	for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 21:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774991238; cv=none; b=Bcn62w0Rf/8b1MptviW2746lRDyJFPi5eW/+dKEQ/xV4cfd5x/qcMZbITg0JSIQ+3txZ5E1ivIg7sYudqGEDRwsJ1yMTlGEURN/gPVOLDR4UWX4n6JJ9h55O70vFj1iROGXAVy0Q4ZvzUvwtBYhg3yaNUu3jInezEqlWjM77MyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774991238; c=relaxed/simple;
	bh=JdtX1HxX10vKkEIJTgN8UNt8Jx8wkMFYsFGA9S+Pp3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gEZWM5FYNz7dvq/QtEef4TN6uijs5+wjwxLMNkwxc40HUmqd/NIyOXtUHq01oYRHwdOiTQw1PNBi/zYxcBDhFo2k+bep6zGMyP5fWKa6pqGusR7BhNsfAjxrqyPS9e1L5pqP9H0k+Ne6CFP3AzZ4Yms0+3WJIa/FNXVG+g4T4DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Ega2rr/U; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Ega2rr/U"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b9825ba7e8dso846672766b.3
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 14:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1774991233; x=1775596033; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dPaiD4OsZpalA+NXE9JYeLKvQIkP47+Rdll9Ghzi+s0=;
        b=Ega2rr/UqMWp5sWJd0CzxWLtOjZVNLhEUFUbkdSmg0f8fmat9eZ58NmrUuUV8yQSa9
         Gcg6bLSD72W8p/IdE7845hj5Foh/ZKXbTIHkFOS30rRO/As0CaCl6AWtiMmN9jiZJ+Fq
         zwojEsFhFz2rbczHx7tK1M6Szqz/4P6KXC95M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774991233; x=1775596033;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPaiD4OsZpalA+NXE9JYeLKvQIkP47+Rdll9Ghzi+s0=;
        b=ockromDfXsNTFAIj33whR6NrQaCe+WxEaPvbahl7WK9riS3tFfDTejzvyXbcJirsEZ
         g2NCsUwj0yLm29IMDC2LcGnOBZeHT6EqG4OCmEqZH2eIpnPfuj/PY7xgKt8Thhz+szce
         d1kt7ebWemSqyZivw5obe68tkaOuegF8a4UU4XgswKr7WTPn1DlMaIIIBviL6hhxzoB5
         7k4/Jvx6d68xzZCgy9YsulRm++0bPzNo9M7o9eHj2Ba1B3MWLESISOwJrpF6wRi3LN1K
         FcsVI/UvT2be7IE7V8fhszrmAyfjScl52kWWpcyRTgD6dzL4AUlE3DM6rOcnXtNhAoSk
         K2lA==
X-Forwarded-Encrypted: i=1; AJvYcCVJb1WWQgkhyW20Cpu9qTnEOCAl7C9faJI5JHGKWQDBluL/yIgBa1NrENeLUq2IhmkCbfth@lists.linux.dev
X-Gm-Message-State: AOJu0YyRj0N3dxWb60WCwSlfkr44w4rl55f4LF8mGfn5dPoOFntT8hVK
	zj9pGtTWdqQwX5KG3lGjm1DwkyxRMe+yE4F645sw4ey4lI7wA/yCIgvPNA9glwrqu19WxpaLbBd
	P/GM721c1sw==
X-Gm-Gg: ATEYQzx3QJi1bSDdCmopyufBwvWA/j7d0zPHARbUL9uSZD1JJcS8wGGJ/b++f34U/ct
	EzrvXoV5S9DKkUxQpJ3zI5Xb3LvVY468/YHtPr6V3xltkx53yym6T+AgbV04tZBYrBIOMpk2Xot
	c/vt6vyoA9fv4pPH4IuCDjnfwDjegOS10TPI5sOLYqQFWnz0uPO/mct3FQA0vZ3g3vf8bvbGXvU
	HTun706KGHak/hrM2wHVvQUw+Qo2FSopVUKyGvA7zxGmlYL+kpK8zUPi8rfGyWZSZ6mDgDyeFM0
	7aHoT3sUp4j5gp6bWAbUxdpybt+N/+b2erQ7inpyldt6YeuKY+IiBEeQWt4Rn87tQuwUN/zSdC4
	LTuyUs1ZHTYE5JpC4vrZxt2J1i+UU8VaOVQGcCC3MtS1tl87388W82vH5yNrgiG3patdm1cq6JO
	QOKUHDSJ7nm08xsPyNCaV8NmCiYcSyOfbMUqfYgBNVHcx7llV9AueuLB1R+JJlek9rLwi96OHg
X-Received: by 2002:a17:907:93c6:b0:b9b:2456:989c with SMTP id a640c23a62f3a-b9c1378f25fmr48578066b.6.1774991233506;
        Tue, 31 Mar 2026 14:07:13 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae25b08sm440947666b.7.2026.03.31.14.07.13
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 14:07:13 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-66dd0531d01so198852a12.3
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 14:07:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWcMbUIk6qIwYN7dHMSQnUpgpjDzE3X4LISGO0BLZPHrW7iN8HDl47814NFtfzHByWS3KsB@lists.linux.dev
X-Received: by 2002:a17:907:84d1:b0:b9b:1b9f:8397 with SMTP id
 a640c23a62f3a-b9c13b0a2a8mr62577666b.31.1774990733647; Tue, 31 Mar 2026
 13:58:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
 <202603311253.95C54588E@keescook> <CAHk-=wjSOGaausLeTD13yAqso7qM09EnkDFiN7wF15kH0VWmZQ@mail.gmail.com>
 <202603311321.4EE9FEA@keescook>
In-Reply-To: <202603311321.4EE9FEA@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Mar 2026 13:58:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj9pWsgsbrLDOk7ipKnHbz3JvuqsmQ3DhGg-OKgKS9DUA@mail.gmail.com>
X-Gm-Features: AQROBzDlSIWhA3UXAi4kJQxb1nvYqS4u6S5fbtJpBgdW6doJTV11HfE6t_3dlps
Message-ID: <CAHk-=wj9pWsgsbrLDOk7ipKnHbz3JvuqsmQ3DhGg-OKgKS9DUA@mail.gmail.com>
Subject: Re: [PATCH 5/5] types: Add standard __ob_trap and __ob_wrap scalar types
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
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

On Tue, 31 Mar 2026 at 13:31, Kees Cook <kees@kernel.org> wrote:
>
> (Isn't this just an implicit "try"?)

Yes. And I think that's ok.

I think try/catch is broken for a few reasons, but the fact that catch
and try are tied together so closely is the main one. You can't "try"
inside a scope without having the "catch" inside the same scope.

So then the solution is to just move the try to the outermost layer,
and I think that's pretty much what everybody does.

But at that point, why not just move it *all* the way out, and make it
implicit and invisible?

Which is kind of exactly what your suggestion is all about, and that's
why I like it so much.

It *literally* fixes try/catch. It makes the only really valid usage
model just work better.

(There are other reasons I dislike try/catch too, the whole
"exceptions across function boundaries" being another one that your
model avoids).

                Linus
