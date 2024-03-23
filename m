Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9F01A38C9
	for <llvm@lists.linux.dev>; Sat, 23 Mar 2024 09:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711187910; cv=none; b=chltnmYl9DstBXQ7mDnaxbjt77y/djBbh/nR/MIWXjVDzeY9UJhgwRVepPRqVMtWYFT1yGGM2yVhvcXNHW2wxbnwMBlW3yfWE2mmDQeLnKCafu3uFnSHI2RSd0lpoQndJXz/V9DasTwgZEgLdVAhQS+YQ7Zik3nSIByU+Jn5StE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711187910; c=relaxed/simple;
	bh=88XYaAUkw5+FIlN0k+w5zlI1HA5aU9i8sSo1I2tq1TI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HuBkk9s0Sv8IrUYxDYe1oRneitvT26jIv35xjg4kSWiaq548uZS7Sht6/WKm90iKPCQ6meLl1fKkYfpLjpcgFbNpDkFjUaIvjpQuhfXue8In5FREEEIVnkJcakJp36vEnLfiaRARK/CgG5U6QBrq95YKH6gyBuGDzircKa+FGgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SpQdXIYr; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SpQdXIYr"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-7dfacd39b9eso2045473241.1
        for <llvm@lists.linux.dev>; Sat, 23 Mar 2024 02:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711187908; x=1711792708; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ByMFrWADWxfCqmgsuCZcbqeVUMaKvKom3ZFjR5jUOA4=;
        b=SpQdXIYrW+ji9Z2eVvxXWGj+MJhAE7Lj36NqLX+dga4JZEohsxLD/OgPreoenNBgU9
         tUg5hwDgpgBzIeDbu/LOQWV70ARU9Fet+D+iKmnFWrdNnlZ4Akf168m7xbQ4UuSb3gC/
         5IMO4VBHITd86JN9Pl1mR8EK6DLbsayyZSKNzP2tLDLntATpvoe/SAfgxKOi2Y8g1v4k
         WeBw6kqVAnGlqKBURej/TFv2/TJDftqZ0WHiGkC/mTODyuxxX73ES9fCy6AeVHKaBXcm
         qYN1Ve8M62OPNYOCuRrJ4GVegxKL0ubtVIPrl4jq0gEfdjnpxySEiQc2ug+VogSj7AA5
         PmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711187908; x=1711792708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ByMFrWADWxfCqmgsuCZcbqeVUMaKvKom3ZFjR5jUOA4=;
        b=hsx2+Fu9ti7j8updkvK3IyXHjJl0AH9LrDodIxqfqIOmMN16Z06EW/PQFQvOfTFjUG
         F8e4G2xaVq+RYaCjaIqs1uuVHjN86+xTDbiy+aLplMdtHUITrnU5UNNMD7+XLJ6zDSzu
         8GqNymXcsv7RAPEOWB5Ncs4NAwHIFjmEy0oKBpOtbAInlymqakmenxrw83e1C8T6U3iS
         c/uQhDmFB+xnh9oxQ/kOYWgpJszmBdbGMlJhh0uKY2Ay3x9Fjc1Jnsq6iSIDGu2mWeUv
         cqctNMeM+ZBCHf8KhfNrxgU4Fnc/8BX4RAwreQwBh++7VJ5aeN0xXJ5lOqjQDhgMroeo
         9CVw==
X-Forwarded-Encrypted: i=1; AJvYcCV4hVZlJ0YkqVbU/9I8kJtaxkji9yXtVFy3OIu1hS74ukKHb7LosljHO4KRdFdYNXCQh3iD9oMNQagSO1SLpmbTbFf8RQ==
X-Gm-Message-State: AOJu0YwbTTu5D/fmODYWZOYo9hN9MLGxPYOEhPnyFtda9+/4WL5RdJqM
	APwNlWsni6E9alqLM7PCbmZBsTysMDuwJRGfJDAQxeoZD6uyWbKYptvBotbIhu73amKtF13g5mK
	Bw7M6pbUERfhxqqUOiJ2kiNMQu8DXCQ7Ns3XH
X-Google-Smtp-Source: AGHT+IHAgBE9Mt9tCncQbdq3kL3/YyCXJsjych9A8TVxZPi3s8EhiSf04grenMGGPKfBQGLsBYx9mC23O4pppsMnfhE=
X-Received: by 2002:a05:6122:2524:b0:4d8:7296:f52b with SMTP id
 cl36-20020a056122252400b004d87296f52bmr612108vkb.5.1711187907683; Sat, 23 Mar
 2024 02:58:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240322233838.868874-1-boqun.feng@gmail.com> <20240322233838.868874-2-boqun.feng@gmail.com>
 <068a5983-8216-48a5-9eb5-784a42026836@lunn.ch>
In-Reply-To: <068a5983-8216-48a5-9eb5-784a42026836@lunn.ch>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 23 Mar 2024 10:58:16 +0100
Message-ID: <CAH5fLggdVDccDwBa3z+3YfjKFLegh7ZvcSzfhnEbAGSk=THKrw@mail.gmail.com>
Subject: Re: [WIP 1/3] rust: Introduce atomic module
To: Andrew Lunn <andrew@lunn.ch>
Cc: Boqun Feng <boqun.feng@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	llvm@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alan Stern <stern@rowland.harvard.edu>, Andrea Parri <parri.andrea@gmail.com>, 
	Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nicholas Piggin <npiggin@gmail.com>, David Howells <dhowells@redhat.com>, 
	Jade Alglave <j.alglave@ucl.ac.uk>, Luc Maranget <luc.maranget@inria.fr>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Akira Yokosawa <akiyks@gmail.com>, 
	Daniel Lustig <dlustig@nvidia.com>, Joel Fernandes <joel@joelfernandes.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, kent.overstreet@gmail.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, elver@google.com, 
	Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Catalin Marinas <catalin.marinas@arm.com>, torvalds@linux-foundation.org, 
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 23, 2024 at 12:52=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> > +//! These primitives should have the same semantics as their C counter=
parts, for precise definitions
> > +//! of the semantics, please refer to tools/memory-model. Note that Li=
nux Kernel Memory
> > +//! (Consistency) Model is the only model for Rust development in kern=
el right now, please avoid to
> > +//! use Rust's own atomics.
>
> Is it possible to somehow poison rusts own atomics?  I would not be
> too surprised if somebody with good Rust knowledge but new to the
> kernel tries using Rusts atomics. Either getting the compiler to fail
> the build, or it throws an Opps on first invocation would be good.

We could try to get a flag added to the Rust standard library that
removes the core::sync::atomic module entirely, then pass that flag.

Alice
