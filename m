Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7684C3AD513
	for <llvm@lists.linux.dev>; Mon, 23 Mar 2026 14:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276758; cv=none; b=tIfJ/BBK9+TRYmUQZ+VG7Of66zwW5SGPsYlj8FMfixex13mQXURaNva4blMv7OF5rDhE4LitQBEHq3L2Omd/3Uaj5+900gCkCM5S6nFJpiL0ETL+00aRHXDamHkiavuGpT+eVOTGUi1CVX5krj3GCwbSPuyo02mzYm6XnsII9Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276758; c=relaxed/simple;
	bh=nkC9ypwFSq+q2Df9+zF8ruUFWzMFZG0USFFmh2E6mas=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bHlz4p9ohsfXJcOxDuYZ7b1nXLZZipF3BytFlJdcdrlB3qDHSS/fHjLDMBKrquYwsPI7Bmb97SVUJ6sJEEoO4R8DrZ0DWiMhBlnXVz1kRlFWUkdzi+MlezWT5M2L00+/DW9Am5YC5OKvDunGI4fERunQKCyN1UoaFkhMCpyGkjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wUpq80yk; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wUpq80yk"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4836abfc742so19629185e9.0
        for <llvm@lists.linux.dev>; Mon, 23 Mar 2026 07:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774276756; x=1774881556; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ow2cYCMn5EXbkFbtWklLmiMt9RKP3mI6kxfKs0fin8E=;
        b=wUpq80ykSc3TJMr44rhn3USZTEdeMV0pyAO/8zpX5HdWymIOy1UGKIfFO3K9Ksx/G1
         AyQOTmAAfLNHdzin35eMWBI74scR8HIG8byBL7g6Brb17VpkuocqH9HAmOBAAStNin6D
         tHYD28Gh/WPPxTSBVBYmJGBuz13aySuvHiU8QpbxsRfSGGbx8z5Lf6tVPpFCw7KDvAbl
         pHxXCuKJnk9rD7+n/RY0czqmc07MDrFHSMOqA8e+tipMmp2ojrjBl5X/5sGj7vim//Si
         r0pn8ErLX2J1pm09yZaXKvRh5HuuJ/uILDhKBXjrl4qyaoa9C8KGE9YAJLKAEfYyOhVt
         /qiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774276756; x=1774881556;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ow2cYCMn5EXbkFbtWklLmiMt9RKP3mI6kxfKs0fin8E=;
        b=kyUTko8NpQ0PqbvSxvOG9rSF+QUEGvCI1NALo7qufGsUC/LmUqlKOZpSpF7s3y5Rsv
         Fb3T0iPKyDzqXjb83D+7vlfgUr8Nior9GSum2fAl+Ap0krHkE5KoWij1ihJJm4UKJei6
         YKFdCIblXMPKJoHDNpboH5GonlP0yH9iDUoFxgPYao2h1Di5CoWzdWCdT/loMEdNAUIZ
         Yw51+kXYsuJ2v6TfnwCRRTWZ2c2WTsRMvTanxmt6uU8pkE7xHTYJVt0P0jYdoKjQAIrn
         PDvsccun/FPdPOs69jWoK+XMP5iuU3unyArAie5tLeW+U+/XOFQUAJgdlikN1auVlppF
         IE8w==
X-Forwarded-Encrypted: i=1; AJvYcCXjkpxAefPVbgIX59Nmkvx1kgR7VXO313IY/3bG6g/VCNcZwgge8EaVKEA40xhmCdPla1ly@lists.linux.dev
X-Gm-Message-State: AOJu0YzjP9Nss3DnEqdm7c/AaW9B07ioaqdrtPA2REWXcaFzC7a3Xwel
	s5wfQhVusIOjeBP/GiJZgs1Jp7Gb4Y1qqnAcuKjAK3Q7CItdhBUYsfZuDM3z5XfP5/Ke3yBCsh9
	rWi5gK35kdtrh03aLVw==
X-Received: from wmbej14.prod.google.com ([2002:a05:600c:3e8e:b0:486:fa53:8cfc])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a43:b0:486:fbd1:9dc0 with SMTP id 5b1f17b1804b1-486fee0d52fmr164091435e9.22.1774276755701;
 Mon, 23 Mar 2026 07:39:15 -0700 (PDT)
Date: Mon, 23 Mar 2026 14:39:14 +0000
In-Reply-To: <b5063e7e-9245-434e-9877-5ac7b45f4bc7@lunn.ch>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <96287f3a-d245-47cf-b7cb-f821451493d3@lunn.ch> <CANiq72nwSWVDRqm0Vap5j5X5k+Q-wq8okQ9d3KUgZt6M4CpW9g@mail.gmail.com>
 <65336ad0-ac37-416f-b6ae-e691e3e375ae@lunn.ch> <DHA6SE9EMEQF.1PKVHEG18I5FS@garyguo.net>
 <b5063e7e-9245-434e-9877-5ac7b45f4bc7@lunn.ch>
Message-ID: <acFQkuarr6bcOFwM@google.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
From: Alice Ryhl <aliceryhl@google.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, acourbot@nvidia.com, 
	akpm@linux-foundation.org, anton.ivanov@cambridgegreys.com, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, 
	david@davidgow.net, johannes@sipsolutions.net, justinstitt@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, linux@armlinux.org.uk, llvm@lists.linux.dev, 
	lossin@kernel.org, mark.rutland@arm.com, mmaurer@google.com, morbo@google.com, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, 
	nsc@kernel.org, peterz@infradead.org, richard@nod.at, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, urezki@gmail.com, 
	will@kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Mar 23, 2026 at 02:28:25PM +0100, Andrew Lunn wrote:
> > > If you want netlink on um, arm32, riscv, loongarch you would need a
> > > different implementation of the binding?
> > 
> > It doesn't need this feature to build and function. It'll just be a bit slower
> > because inlining from C to Rust won't happen.
> 
> So it sounds like my understanding is out of date. When the first
> Ethernet PHY driver was being merged, Rust could not access inline C
> functions. The binding had to replicate the functionality. But you are
> saying that Rust can now make use of inline C code, but not actually
> inline it? It results in a function call?
> 
> What this feature does it actually allows inline C functions to be
> inline? So it is just an optimisation?

That's right, this series applies cross-language inlining to the helpers
we have for calling inline functions.

Sorry if I was unclear on the netlink patch series. I mentioned this
series because you told me that inlining is important for skbuff due to
performance (not for netlink though), and this series is necessary to
make such code on par with C perf-wise. But if you accept the function
call overhead from not having cross-language inlining, this series is
not needed.

Alice
