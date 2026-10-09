Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0197233946
	for <llvm@lists.linux.dev>; Fri,  9 Oct 2026 01:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791508629; cv=none; b=Hthl23AKf9yVXkkJzs5hGW1J8+GGh02uuaOgsixVdwEeeIjoCMNCQUnNF0qUgriOo5jAC0Z9+krFcc0K4KhY6hVgPqbc9A5RnR34N0h6Cks0NOeeCIpr9BJiAZep5oWNOHmTXj00HIzqFxM5geJ/PEwitGUU4uNy5IeFnUE2HlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791508629; c=relaxed/simple;
	bh=MMzdOh6zuM2zcV+/w8InyvA3igLjaY5u/Frz2zXgL3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gRl+9C7z0ZV0XMlzJfAEw0StZLwfEctFPvzCZEbh/Oc5uORw0IetcUip8HmJyDQxJH4co9aYSN/fGlzoLFyZNoTkRAasnxPdLL2q5HPTYa5NG3iHG9QuSYY0kbMvV/RSNXgOn08n4iqrWY7p2P9BUudtdSM1a+Ox79aUySQrLwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qHiKxL18; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qHiKxL18"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a02718da81so27183595e9.1
        for <llvm@lists.linux.dev>; Thu, 08 Oct 2026 18:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791508626; x=1792113426; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4zJZcyCxNs35dQHZgRkxwA5yHjhyI7WkTssIiSVzh8w=;
        b=qHiKxL18oJN34KAA9QccWJJTly9SxUMr8ycuxXkhvb/MWsx9wxzNjXdPbhYQFyCLkf
         GJRCIxvYAt+FrBACiHu7FKYlppny+WXPO1zV9rVfB+LD0PaBobzozrqQI9E+KMTY8zl7
         ukhZJVReTTHV8fJy8kxkre3XoreCUoPFPiTOIc0YQjiHXzttb+3eqe30CXV7IGD1gdWl
         v8uJLb6vtgfW+Oyv5iHrJfJQfyag4HMaDy8RpztgtfmOimII+jH++NGFH7shtsgMb+di
         ZSrmZr/tNPhw/BtjANcMax5dHkXozb+49LGktJByVxqElb9ZRGLijYyucubYl9W+eNpR
         QYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791508626; x=1792113426;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4zJZcyCxNs35dQHZgRkxwA5yHjhyI7WkTssIiSVzh8w=;
        b=ae+kZg6c3lcBS9bEjck+cHDdj/LraUTU99hTXAPJGkac8xoz2PVDdsQfpThN+K9S/L
         dkxPEEumaMKCmcLm0re788nyZuafSph06Z6Jf80kKm2+WaECew/GzthfqGm8l2kmc8Nw
         XkuiL6TqGJjAUhiwsclAy2jJ0nnpDYsfkM1NDNJM4PT6ad14PWD8ZOnf999+wWYwCpey
         pwN4aJ2gfwBmBTfFmk0g8WgFJJiTTRVMeMN7B299qQDW7W81/IcFjDpp6QhH5lnuLM1V
         qqhxGtmAZrodVEmMe8qUUUrF+7GW9WZaDmw2RyN/CejDyqWzrM3w0TzVErfK9iHbgk25
         3fWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYtCLFUQEisCzc77o8H03TJrHqpF1ga2fLYzbKMrnOeIR1roOxCRZVHjJw9Vhe3MxgySIS@lists.linux.dev
X-Gm-Message-State: AFuF++mLHzRiE7PFT8+br6EUQMX6eQHk6FXnpRV5F5FyM8c/GFeXYFdY
	cyClkkXf/zYFqvJmFZJaK/76TaYN7WFFxR8QZrkATWgYzdZklPlBk5Lj
X-Gm-Gg: AYBFou1E3wGTx25bQ+c6L81dGYg4/pEjutHc8N0B2hxK5n40LxCnTEN3DiuvnaCBc4K
	LZ3d5Wpv8+k5yHsSMRdN0JbA0uZSdsGXmhj1tfVmvMLz3O/alpAF8tbleK4DZZ42J9aIVfFUHW9
	FeW3Ph4jcfmTZXQcevdJXz7xCGmMkp205RSQXn1APwiwIy6/v8h+vyT1cpa2X4wrCvH44K2Ve8V
	uuqbW8I9dTt5rObzXGm6pasD47o5AK7atHdncaiaVpGPEMM0TGEZqt1seJEK1Y4VBBkLHxMgqeR
	DQkFCnfIfeMLgHvjEDCzzEgHEWXsGuw3667wYHYz/n6whxG9Niap+eMtH9K1p6OxLmjWDAeM79v
	4cBWsyG/hsWV0q/jNVFKZZn4w8+CO5QoJEIykp0uC6dYKfmRgfS34iHDu8qYqA9YjR/n3Wjxn4h
	4nUoeh+8CYJLhjUt19E2MOuUyP5awF9nXPxGsrLi0os9ZSWJvLYUoBg9DLwmjcHyQ/2/HRQzmKy
	fnbJMBdsymZNdoAHhpz9eUPJ6Il63sbs4hOYhFc32/P7JZ3NdPfcZM/A1QlM2OKcHROVEkNd3xX
	XP8pdBhw5MWXSfOMwt7/fSRHhsRXypGKlMPxLxHbJuIxLVUkLPN8LakblddQbrRKaanqsG0y0WQ
	KwtyfJSLk4zopm0r5lymzdw==
X-Received: by 2002:a05:600c:19ca:b0:4a0:2484:2800 with SMTP id 5b1f17b1804b1-4a18e4464famr4244415e9.3.1791508625763;
        Thu, 08 Oct 2026 18:17:05 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a128-aa01-297a-7094-853e-a20c.310.pool.telefonica.de. [2a02:3100:a128:aa01:297a:7094:853e:a20c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be8c601sm19861285e9.3.2026.10.08.18.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 18:17:02 -0700 (PDT)
Date: Fri, 9 Oct 2026 03:17:00 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: Russell King <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, Bradley Morgan <brads@mainlining.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] ARM: cmpxchg: always inline __arch_xchg() and
 __cmpxchg()
Message-ID: <asg-nSs2cg7O-znd@gmail.com>
References: <20261008053746.49631-1-kmehltretter@gmail.com>
 <20261008053746.49631-2-kmehltretter@gmail.com>
 <DLZC239PAA53.3S5GIQRJNU1V2@garyguo.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLZC239PAA53.3S5GIQRJNU1V2@garyguo.net>

On Thu, Oct 08, 2026 at 11:01:32AM +0100, Gary Guo wrote:
> > v6.19 links. Commit ab717dd98bee ("rust: helpers: Add i8/i16 atomic
> > xchg_acquire helpers") in v7.0 triggers __bad_xchg. Commit
> > ac8f06ade38a ("rust: sync: atomic: Add Atomic<*{mut,const} T> support")
> > in v7.1 also triggers __bad_cmpxchg.
> 
> I think the issue is that when you get multiple function calls in a function,
> GCC starts to think that not inlining can result in code deduplication where
> that is not actually true.
> 
> But I am surprised that it hasn't been seen in the past, perhaps there're only
> calls with single size from any translation unit previously?

The sizes were already mixed. It is the number of callers.

Commit 5dbc0a692459 ("rust: helpers: Add i8/i16 atomic xchg helpers")
has 1-, 2- and 4-byte xchg() in helpers.c and no __bad_xchg. The next
commit, ab717dd98bee, adds two more callers of the same sizes, the
xchg_acquire helpers, and has it.

> The fix LGTM, but Sashiko's report is worth looking into.

It's a valid concern. __generic_cmpxchg_local() has the same weakness
and patch 1 does not touch it. No file in the tree fails today. A test
file triggers it on ARMv5 with gcc 8.1.0 and CC_OPTIMIZE_FOR_SIZE:

- 12 valid cmpxchg_local() callers link
- 24 leave an undefined reference to wrong_size_cmpxchg
- __always_inline on __generic_cmpxchg_local() removes it

helpers.c stays below that. The ARMv4T and ARMv5TE kernels of this
series link with gcc 8.1.0. I will send this asm-generic change as a
separate patch.

Thanks,
Karl
