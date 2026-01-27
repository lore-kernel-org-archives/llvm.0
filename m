Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DDA1CAA68
	for <llvm@lists.linux.dev>; Tue, 27 Jan 2026 12:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769515321; cv=pass; b=ElyuVqSmrIiVK4y9SkecHzROVm4p+Y2wkkX5jTFJtYWHS5qxbz+iBRNUjUugzXpr4uRMb7fuH+YK79QSLYlS8mS0+EmUQeL4iT4KzcG3Q4W7czCamXxDux+wMIfB8ORcAgIDCq8sE3oYwj2FdTuX5dU1RAfyteWpV80LpV572XI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769515321; c=relaxed/simple;
	bh=GYkwgu5spGrDl3W+vRpchhenVMDqdeo2tvRLo6MhC38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g8ZIKYMXzEKQi7k7/ex04j5zYkb7vQNQyX6v9LosfMJUmpT8MsqXmSYNWIRv4tUZmUbr1n7oCoS0oUEeyBIHuLgMRW58DVDAcsOuAoiSmjUPVikAK5ljx6V6qdlZSy8+bFQkmEbfzyCwDJzuaEF2I0hJLHbPXVcg4swUUU6Y+eg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y/gIBm9k; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y/gIBm9k"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-11f36012fb2so7830465c88.1
        for <llvm@lists.linux.dev>; Tue, 27 Jan 2026 04:02:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769515319; cv=none;
        d=google.com; s=arc-20240605;
        b=YmS/yG7RHSyG7td8QVDRGRB9I9TS4L19988ErkmMdAnQiTOY7YsNaaicy+wI+4DFP7
         LGHNVgGM2yLi3yHJXF4XKuKlsBKrcUpJCq3birbzhzKbCC4V6zuUE8Vp/sCuFp0LmKKh
         xvOn66f4uhWWB6a1xJ6x3cXkiPVWfDgheEHzEV6TIDnpNfY+/NlKuJj9nRPWVh9hLHcQ
         c8ifG0vCrt+h0O3D3MQ1Qd8bdU80BG/+zIkX/ceiTfcdscIn3hJae0SkR7k1pgNYNfcY
         3Sc+qCWXPISIUl67jt2jODNNi81jYtlSlYnPp6CKpC0LJkyY1bF8x6UfddvkKHIGpA9I
         ADyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=f3siXZ/0ghE6QlqdH+UHYvDHgwatyqmAkbtWEXRaWQU=;
        fh=9scWpzOfzem+z8Prgr56pyV4QjG1d9xe26eHKXDHPRU=;
        b=HE9c3Ceo4tEP2UfcU9yQyKucRDRLncf+7N05CrWQSnqYU9l33p+IFMZsXi0LQj3Q02
         xizAzjmkEOUWPu3d1qu1m/WXCa+Uo5Nm6AQc10JFg83Tlf4zztnaJYXeSO0wGVmNJA5g
         BSJQOfy1urT8w2zKleX+bLorrOeFhOYHbtuJYF8Hb/Pb9D7zkK7EB9FrhKynx/xlFqu6
         fbGi643Ui+Yjd9dbS1gmgPDXxc2GqdC8t/mL4iGF4SJ/xjiT4Ol/dMgb1GK+isG4qveW
         z/CsG623N86eL/p+I0gNOxrbtbMwvLy5q1EmRVujDHu/KfxEu4oPNkO6yf40HurHzjDZ
         +JNg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769515319; x=1770120119; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f3siXZ/0ghE6QlqdH+UHYvDHgwatyqmAkbtWEXRaWQU=;
        b=Y/gIBm9k8RGBCse2LBnEBVDogJEY4P4djFbMrsACw6siGy5cafTmMaDF+1WPdmqFLP
         AH05eqohJmVvAqHNMYY/sGV1bQ2A3h98l84CZi5yqxF5nnzkgrGkwyfJoY6cm3buQWj0
         RFdmvXm16wLNtWJu5eKV1Y/opL4vkMuN8lLnNVWW7WyTZzHWPJhP3FVMS/BaHlTNcQ9V
         zGrPB63Ow8DMgLJ9vTDWxymZA/FD9fSXc3LHH7A2yL8RIr0dPQIB2uWxMuiUOhHJmE0k
         3vlrjrCkr0c0UZuwR/xvGzQy6Kv9HvG/prJ4CnmYtdg+hjDxlIqCRwTL0IP/JzcHfHW/
         ihrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769515319; x=1770120119;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3siXZ/0ghE6QlqdH+UHYvDHgwatyqmAkbtWEXRaWQU=;
        b=pcqy8tevCu+Qmig6ek69fB+BKryYlMNtfmOjhdtziVqtn4Rq8lDgWcIBNikfmcaIhy
         u0H/J8cT61tIEw8Rn6SghEGt5NLKAl5vwaTiaNcypCZZMaxYOaRByLJCJNzikpUYfqCg
         gl69ISNvYrRR8y3mnyOC0HBFprcD9rkeEUYgXIe31aI5WS7QRXaomadEtA/mtAxyjQVM
         Qtau5sW1juspWSEJAt/9I0rJTt8no0i08G9kuQ/5CM99ILy5W654xulBG9m+eYDksC2O
         xdjPYE4Zx/kbV5TnH001rxrhY40k2SVEmQqfdb/8n+yqerb4BHqF+Nif0vbqtc7hmIGV
         3Aqw==
X-Forwarded-Encrypted: i=1; AJvYcCUGlrxGaMIAOmKevi5yAf+GLGAh4PkJA7utq8I7Gn8ROHi+fPDZFCRChfMKz6tQG0CKhcOY@lists.linux.dev
X-Gm-Message-State: AOJu0YzIIWtqEC3cbxC5aOSP8CYSZGOaG9ynhHb6Fz4WEdqirJaHrjhL
	+6rmZZERM/bk8pgzbHxY06sIP00rvCxIXHwvctdv5yzStWB1X1nXIkW0+1ByLkBXA5w52Iq/6yx
	mJxCyfzrEWNr0qYSgFrsQnH96M3/+i1zMZrF5muVZomwmlWNYVy1NnzQK
X-Gm-Gg: AZuq6aKeJKBn8AX4lSjsSv9bkKfKbFe+/xQp9PDYYc7gwKbBQBxwzQLuh7YbuvrTZft
	++y3Om2mav6N/ccL/G5yihc4TIzh5qaDk0CP+Q34w7wesm6W3BmsxG1zSZxOjVbTEUHgZS8QspO
	T3sFRrMunosRkropXie3EInB+dW3+R44raRbAdGmu/tk469nS/+NHDq3Tr7r76c+XLO7sb6rd4q
	pEZlFFZXyvrgUsNHPzaviIpJ5Y0yD73J8ka3vQLXvjXpuNH9XPWSUHUyKsPia5SSju9hjlKOGwb
	8K3kGwBfAAOz6le9ThUN0LmCJw==
X-Received: by 2002:a05:7022:672a:b0:11b:baa5:f4d1 with SMTP id
 a92af1059eb24-124a005f62bmr729353c88.6.1769515319003; Tue, 27 Jan 2026
 04:01:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260126002936.2676435-1-elver@google.com> <20260126002936.2676435-3-elver@google.com>
 <d3295c84-da15-4695-8110-7e04cfaf1419@app.fastmail.com> <aXfGcIpeXQNRUI-A@elver.google.com>
 <7478d2cf-9636-45c8-8ffa-8e3a3ba9baf8@app.fastmail.com>
In-Reply-To: <7478d2cf-9636-45c8-8ffa-8e3a3ba9baf8@app.fastmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 27 Jan 2026 13:01:22 +0100
X-Gm-Features: AZwV_QjFMCCyrciERqYsJr6V_OTfZKrtTgGTvPsn4bCRYZIickpLNe1DBnbTFdg
Message-ID: <CANpmjNNWoSdE_Lo9CJV3sAR+j8qz3_sq7LoaqYO6cVuOtdTBzA@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
To: Arnd Bergmann <arnd@arndb.de>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Jan 2026 at 23:24, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Jan 26, 2026, at 20:54, Marco Elver wrote:
> > On Mon, Jan 26, 2026 at 08:56AM +0100, Arnd Bergmann wrote:
> >> On Mon, Jan 26, 2026, at 01:25, Marco Elver wrote:
> >>
> >> How does this work with CC_HAS_TYPEOF_UNQUAL=false?
> >>
> >> As far as I can tell, TYPEOF_UNQUAL() falls back to __typeof__
> >> on gcc-13, clang-18 and earlier, and not strip out qualifiers.
> >
> > I think we only need to worry about Clang for LTO builds. But yeah, our
> > minimum supported Clang is 15, so between 15-18 it'd be broken.
>
> Right, I missed the #ifdef CONFIG_LTO check, so indeed gcc is
> fine here.
>
> >> With fd69b2f7d5f4 ("compiler: Use __typeof_unqual__() for
> >> __unqual_scalar_typeof()"), I would expect __unqual_scalar_typeof()
> >> to do the right thing already.
> >
> > It'd still be broken for Clang 15-18, so it won't help much. We need
> > this to work for more than "scalar", so even though it'll work for Clang
> > 19+ given the redefinition to __typeof_unqual__, we should deprecate the
> > _Generic-based __unqual_scalar_typeof() sooner than later.
> >
> > I was able to make this work for older compilers:
> >
> ...
> >  #define __READ_ONCE(x)                                                       \
> >  ({                                                                   \
> >       auto __x = &(x);                                                \
> > -     auto __ret = (TYPEOF_UNQUAL(*__x) *)__x, *__retp = &__ret;      \
> > -     union { TYPEOF_UNQUAL(*__x) __val; char __c[1]; } __u;          \
> > +     auto __ret = (__read_once_typeof(*__x) *)__x, *__retp = &__ret; \
> > +     union { __read_once_typeof(*__x) __val; char __c[1]; } __u;     \
> >       *__retp = &__u.__val;                                           \
>
> >
> > Thoughts?
>
> Looks better than __unqual_scalar_typeof() to me. Would it make
> sense to do the same __read_once_typeof() in the asm-generic
> version of __READ_ONCE()? I don't remember if we discussed it
> in the thread leading up to dee081bf8f82 ("READ_ONCE: Drop
> pointer qualifiers when reading from scalar types").
> We probably didn't have __auto_type back then.

I don't see the point for the asm-generic __READ_ONCE(): it's not
wrong to cast to 'const volatile volatile T*' nor 'const volatile
const T*' etc., which is dereferenced directly and not stored in any
temporary variable when used in READ_ONCE(). I actually don't know why
__unqual_scalar_typeof() is used in the asm-generic __READ_ONCE(),
which just adds 'const volatile' right back.

And __READ_ONCE_SCALAR() appears to be gone, where the
qualifier-stripping resulted in better code-gen. Then there's alpha,
but I think nobody cares sufficiently about it.
Did I miss some variant?

For this arm64 LTO variant we do need the qualifier stripping because
of the temporary __val.

And I'm hoping that once we update minimum compiler versions, we can
delete all these typeof-hacks and just use typeof_unqual().
