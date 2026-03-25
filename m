Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5EB3D1CA8
	for <llvm@lists.linux.dev>; Wed, 25 Mar 2026 11:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439268; cv=none; b=bQAMrDs3YK2by78fUi6ymWpPh3kFkUbvu6mhPmc6tT+HUyYBCs2MifQA8vJqjZ+jHGIZ1oQKUQsWHpcfhmCSk8fFdNfSJnlrLitqZw2/lzWql//1nTizWP9WqGXdnpbho2++UDqKyRWqeeMuh9JdDozFc1lQH/C1LamwvD37VbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439268; c=relaxed/simple;
	bh=0K6B12aTG+/k3pPsn5A5hhd0vy7DI5R4voSHQA8rf80=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YH9LoTuT5/WCaUkff3W4nZNUDVXMax6DlcvnGwMXTkxTJTVXzfgjKqPvYOXyIAKIKhKpcOj5fIEY52LM75Uh5JQN+KQ7FCOuegk+t9FTMingEYWH1UkMCeihVrwVFnFBtUCjMjPS6tcjMLUqbM/cOVDp+LLxcHDBEUBfejxsd4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hlFknKpK; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hlFknKpK"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4853b5b0fafso72015135e9.3
        for <llvm@lists.linux.dev>; Wed, 25 Mar 2026 04:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774439266; x=1775044066; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4uhEowmiK4u1R/mIRCHEDC4FJAoYu6BzZ/HSFgx4p0A=;
        b=hlFknKpKVExscGZpPI1VJMh9u5QShoUEEOc+JM4zqSoOIJp1xPBwLH7QrNVUACZN47
         vhwmw6HMosVleiXfLkzG+SKzIAtIBX89wGQzUSe4Ayd1Nzti/m0cJjIaY0C6PxoE+JPa
         d0QX7F9jtZrF+eJXTUIKU5/dakr9mWSbWbPNWZNoGUl6l4jaSaG+v+gpuDxtCQdb9S0E
         9JKV4EAlflqWun/Ri95hM1Qi1VA9W2hQtucOrPLH7RM2qdBsBhcGTcW9CVBCmg+PLSyF
         W2mcuR6I4/0Z4BHNGm0yBJ4GSVSASM7CppCgCihIaf3WZWvIaHXG/hwdc8iq6C+EeqUa
         SbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774439266; x=1775044066;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4uhEowmiK4u1R/mIRCHEDC4FJAoYu6BzZ/HSFgx4p0A=;
        b=pHXXsgzoM4azQTCuTtKgTaBQri19FgVMAb+gBlWwCYnwSX+GyQgPFG/CfTXEUl/SA8
         9CmtbFD4h/9xMYKLJWtlw/QnOur3e0k3EMAa5SDIfBr+oFzq24dUiKvvi5LqAVnl7GqU
         EOL+j0Sy869wj0FBJvTxJexsDVHTVQDulp+qc2VV53SZVE6OisLXayohzjoSUOwOSUq1
         9FC/Xo90vf+5bYNIdaUY6WYSa+bYH+cgZDiiYQlHIPXHJntEkA7NxEpq9cePr06vnQ95
         PEjgmqFNAeScLhRct5VeSF1l8DYlmA8jM6eeaLqBDTX3v38EZREt41eIGkiOj3lteVCi
         RIpA==
X-Forwarded-Encrypted: i=1; AJvYcCWu96lnre3WN4+9aw9/n/5Fe8Dw1MuEE+MqAUb/+gd74bijkon45g1/1Far7qCFdEZwc6c9@lists.linux.dev
X-Gm-Message-State: AOJu0YwrYmGKWCtJn3KUtlz9CTdABXMyKEi8wZTpixGfN4yWQJtbgX9g
	I34FxBjfn8DDLRTt/MxZyTUwD9kUyZ3ZDomto8PUvbdHzu7iA0UyyZLWwEKRm/cVgGvJ2ybyVwx
	z/L2D4P8aniL5DRUlSg==
X-Received: from wmlf24.prod.google.com ([2002:a7b:c8d8:0:b0:485:29bb:91fc])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1913:b0:487:1fc:14f9 with SMTP id 5b1f17b1804b1-48715fffe21mr46309925e9.15.1774439265917;
 Wed, 25 Mar 2026 04:47:45 -0700 (PDT)
Date: Wed, 25 Mar 2026 11:47:44 +0000
In-Reply-To: <DHBTCP3NHE62.3N96AD6O1L7CK@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260325-kasan-rust-sw-tags-v1-0-7d3a765a72aa@google.com>
 <20260325-kasan-rust-sw-tags-v1-1-7d3a765a72aa@google.com> <DHBTCP3NHE62.3N96AD6O1L7CK@kernel.org>
Message-ID: <acPLYM0HtGfW1Q6X@google.com>
Subject: Re: [PATCH 1/2] rust: kasan: do not pass -Zsanitizer-recover
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Wed, Mar 25, 2026 at 12:06:50PM +0100, Danilo Krummrich wrote:
> On Wed Mar 25, 2026 at 10:26 AM CET, Alice Ryhl wrote:
> > We do not pass -fsanitize-recover to clang, so for consistency we should
> > not pass -Zsanitizer-recover to rustc. Thus, remove these flags.
> 
> Isn't this because clang forces it regardless? Is this true for rustc as well?

I forgot to mention this in commit, but I'm actually a bit confused
about the situation here. If clang forces it somehow, how? I don't think
rustc does anything like that, but not sure. If it doesn't, but clang
does, then maybe rustc should too? Depends on how that happens.

Alice
