Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795620837;
	b=nqYKAYjG/j6K1y4JeHl83y9T/VsVm/RRhwXaOgagezC79eBQOwtH0a61BxiHtVsmsU8j
	 1fIIZdi9eNDMQK0Dq0uQLf51Rrj6tGKpSTP+qtZdzdrug+lAfBUCk4iX7PX/pn6DwJ3vD
	 CjjPPUpeltwyhRr5CMcUWqjjhL7IxrpzlgYar7VG5dp8fZJSZGdkGmWJyYZfERkw3uX+I
	 CGxyZMpBjOZlaBarcl2g+FL2awPJr8vnuPhfW5M0q5YrzxqiIWhGIJ/K+kxxcsf0RjHlx
	 3bMV3snTPkwatlQdUePqnOoV1i2pNMECmg+9DIOsWDRAJT4kFZcYYqmIU+Ng7ZTQw0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wKqdQvSAuRnmEmZrQT2+mDn5yykXvIjFQspA9QZyZuU=;
	b=HZRfWAvaOiE3XrX0S87Mjy+sgb5gp6QP2YhAd+h/pwwSHA5Z+UtOJg5ufmObAF6cLYGq
	 62reYXifDQ6L0QONL/kC2qfornQktjgzK6TQIeBAMWvUNembgInEKGWIuqT7ghdS7mlAz
	 /jySu+hdAbT2DPUL+r5a/sMspHn+GruS9GFsKXa+8p7DHzo673gQJAHr7/VxFGxQk4kqR
	 LDxUPVecCArGd61h/9XMbsDSxPwPFS0vbomNLEkCnAMcTnJMhyCQvtqgM59kZDQLCkxOi
	 qV6y0jDQy06FedeAlVMXChxuWmLku4mL+JRJHSmm+Ez9rlKZaVmM5efDkYx6nhyaU2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SCakpzZx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289DB606A330
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 15:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 289DB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SCakpzZx
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be4b29df8cso452866e87.2
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 07:33:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795620835; cv=none;
        d=google.com; s=arc-20260327;
        b=rNj8LLHND87p/rWaIQFnaC+BvbL85DYsk0fXaCU0ZPSSVPF19yxZyJZYMsP4DROayK
         XhcR7ymdRDyGYxOrbPhYi0gcBXldrno+cuiiEUzgdkAVTo31Xi6VyEZgOxGeN3hQa2BD
         hy8RuRkoKKfeDyvtXS6pNU3WLSTIu/qlA8XyO9DfsbfXWrV9Za/AvrTkIrQAgP6oaFMQ
         S5yNqU6sW9tpwC/NsPQAd0AW2QIUSKNtJiSpqW41mNgUWybatTM9A80Jj+bEAJVsSM9i
         SNnr4FdwXTuEjtODQMwKliJ8EoG0xqZb2J0CJiPLL3jXNi8e4QdF6zcfV0vPpPzmOE+n
         KLwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wKqdQvSAuRnmEmZrQT2+mDn5yykXvIjFQspA9QZyZuU=;
        fh=hsasmMo1ziVOiQjDZN4qAYElKWOBoDk4kiLCDzwaXjY=;
        b=acoIQFtja4eWav7Lxr1JLXFNfOyS3DRcVFDsf5LQItobktzca18l03dZjFTrIK24eI
         cc9lpGANivqT110e89Q/d+4LWX1PvFz5p4AJJSwWLOgprDvBGCq5BIyDQPkqpAddCSTi
         rKl87fte9R2leCkHpnpWRHv18KJjFloDHQ9ae84mWwhfYgJRngc2FAcdSP/T8akTXzGm
         AGEGh9tFY3E8W2uK+NFYYpVywXSyN6r0YA1HDx/MirkzzcvwekydkmD1VMFG0KmbhgdL
         1wR1XaHuAQattDGpMv/LuaNm48ClCq/B2j28AkLerfbnPCW08ykEOyCMkYWCyFViTfuc
         fsqg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795620835; x=1796225635; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wKqdQvSAuRnmEmZrQT2+mDn5yykXvIjFQspA9QZyZuU=;
        b=SCakpzZxj0GX9n6tOn2l/OVXxNhFYgRSJAOwMEsnjLPfLWty0ZknaNhki3yKnt3NOz
         1kfzbfqboNuME2erLwGFjppEo+rAiBUuWkp3nsxVKgWvD3SAwTKblzb17/WfFXhOGza6
         dL7ZsVpo5m0zNzc6x/exhtvrBXu5OTp2rXA6K2mp6MSF5263m1os2M5zZlStIX4pK0LT
         xrOjH8TaOnonHUGYahYaFkXrp9QlbbgfUtY/7HYj++6llhkJ2I/U4Ejgml7k775qzGpW
         eQzBZ2td82AfA4ib1gcIWtfWwuAlCSXTZXIhJd4jgZtn7sycLrQ4J5G4ZjxicnHAiIx3
         pQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620835; x=1796225635;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wKqdQvSAuRnmEmZrQT2+mDn5yykXvIjFQspA9QZyZuU=;
        b=EAMYB2ICJ8T5TQhn0OvkyfK12Pmtm7/KYFRXGFoCDHijVJ7NDiqcKfsuC/BtQ2ib0A
         /forXDEVFBZ9KHhSCXXm7lfBHBHrjvSAOpEJ5zMLjT5KBHYwr/jfluPWAbG4ae8WmIXT
         wpcSAfIyy97+QYqxOajLsedgFAeoMFyen1DC1KXSxMdHGBdyAcOuovWpph05jj7XxEr5
         6v/sVqWEz+2glw7UlagsRUEc4wGu/l0EXeKTGe1hEZhWgtIjpZrf6oC02fTR1DthDvJy
         es0eO74FeuETdr0g0XEdFBq25IEC9W6T7/PLQoDEYr8UjaHZqPvs9SwyeiBtqT1+TSnf
         l38g==
X-Forwarded-Encrypted: i=1; AL+hErFLfHAqjoQ8MV5sPxRPeQ6g1UTttWNg5dEFwPrUT2vbQgZs5S716D5yoswXWXSr81b6YICQ@lists.linux.dev
X-Gm-Message-State: APuU4Z93KOM0+IrLRNYlG0rvtEOcebOVtivxqIvDxVk4Pi8zoYBBl6mj
	q39+9lGgT5pT/LRk5J2f0dHlG9c5A+aTgw1RG+T1tG5RAyVR+gC7HSvHs2Av0yopWO97QcbHGLR
	SdgMBrflkx7BBDsGvuqL/FNtWGqkkNrI=
X-Gm-Gg: AZFdTZcKlAcic25kpEfgvpejqAfBp/WNcJSZ5R1wGe3cPOm5aaPudDGsS38NS6B/Uf1
	/gpxvpygrBuBxn+xiyrvta4iz508UE1fVefPpcbtyItSq/Q9BPXU3UDHqcOuImaqvR6BK6jeFvP
	ft68l6C7e0NEm18h6s0CB9U+chzPV+/DXfdKl6y8L67b35+r2egcQ/2pO57TmVPs1O2wiAsLZZy
	qYDkkD8jsmNPzoL9fhbeuSNu6jCvQDTAGsnVv7Snq5X6hva5dvan2tsIwNQ4wynRhMfaVKR0keo
	UMS8meC19VBGccLU45K7V0NxcA1+kVS3pT+l1/NH35bClAh1Cdv0kJHtXmTu8zxhHS3y0UYaM/i
	36PCNAVIULA2JT8fyqYdIyxGCr5QQfJhhRkZeDkxBNxC/+t98/h/E/l3k6yD0yIgVgxAqhhN7+O
	THGI781SJ5yPQUwL4RElnQOeCoOQn9gINIPF6FcrhmuqCIGyp+ijN2CDI9a6ceZw1+h9Vw6n2li
	IhMS9PU42JlYk8Y1nyQQyCznrNrf2ktaXwSKzBec3eXnM2hOgZpdQDx9A0BZv9/mVm8/WvO
X-Received: by 2002:a05:6512:6c3:b0:5c1:4a47:b86b with SMTP id
 2adb3069b0e04-5c1bc785b7amr6221022e87.3.1795620835046; Wed, 25 Nov 2026
 07:33:55 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261124-build-speedup-v6-0-141a4f861c67@kernel.org> <20261124-build-speedup-v6-2-141a4f861c67@kernel.org>
In-Reply-To: <20261124-build-speedup-v6-2-141a4f861c67@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 25 Nov 2026 16:33:42 +0100
X-Gm-Features: Aa3M54rAUhOIl7nJAGzRxUt_IUS4JYfamPQ_n0qFr3V4ZOsnZoEMWuF3JwFrbDg
Message-ID: <CANiq72kdpY_tr0Gg16b24J1J-Duj3YS4rJ0CgNYVWQqmQv=nxg@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] kbuild: implement and use depcheck to check
 dependency timestamps
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nicolas Schier <n.schier@fritz.com>, Kees Cook <kees@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 1:20=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> A dependency that is also a target of the same directory (e.g. header
> generated by an if_changed rule) may get remade later in the same make ru=
n,
> so do not treat a target as fresh.

One more thing I noticed: a header generated with `filechk` does not
have a `.cmd` file, so it is not covered by this.

It matters for targets that reach such a header through their `.cmd`
file alone, e.g. single targets like `.s`. For instance, after
building `arch/x86/kvm/`:

    make arch/x86/kvm/vmx/vmenter.s
    # Change an offset in `kvm-asm-offsets.c`.
    make arch/x86/kvm/vmx/vmenter.s

In mainline, the second one regenerates `kvm-asm-offsets.h` and then
`vmenter.s`. With this patch, nothing is rebuilt.

Cheers,
Miguel
