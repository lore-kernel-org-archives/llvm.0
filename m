Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A925B2DE709
	for <llvm@lists.linux.dev>; Wed, 18 Feb 2026 20:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771446339; cv=none; b=hnPru/YpsE0EaZCAI4mzD7RM/lVpRFcN9KVPu8KX05AIV4ZjggtdPZJm+JKR/RomWfeNDL/JmNYLNJykPLVqqtJFb6O6A9QFU0ttkxLw1XwKlC/VwE87OuxxkJuyqzYmNMH4i+YaEM1Wo5PW6odCdFJ47doIo33Ss/oL3Bjlg/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771446339; c=relaxed/simple;
	bh=NkIIFsgXM7YbU87hZgZFQVEAQ1UuBXjqy5Ol5fmkNfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M3FTXyy2NiBdk/AFekLzt+Bq6M/XhP/INqoOM3Yp5232L21QmSbeGCg4S/gxJbigt6ddNIFQqP0VFt26pkMeD3owiio/lIK3ReffNNNMEA0ggjuFWBgYqtmPq/V3qT3jaDf8yiGyFj58x0PupTP4w5LTVH2yt2RWRP8m+AEJ9kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=VIQ0PmO4; arc=none smtp.client-ip=209.85.167.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="VIQ0PmO4"
Received: by mail-lf1-f65.google.com with SMTP id 2adb3069b0e04-59e699310a8so1249878e87.1
        for <llvm@lists.linux.dev>; Wed, 18 Feb 2026 12:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1771446336; x=1772051136; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SULxcRNXykPTvauwd8uvSy6xGyLA70tlHn3TpRn1HzQ=;
        b=VIQ0PmO4x3d2842L/qycGMls4+EcyqpvK222X9JGGwNQZA4Fh+wNClqRg0uJAjBPHZ
         TJ4mghydnbYYROC0E2G0e1zhz6SkQwcOlQ+L1lK1NjVicsSlVSsKoweRYCfi8KNBZ83Q
         CYrHz6IFV3umh29N4qdHKvjjetlr53edisC2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771446336; x=1772051136;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SULxcRNXykPTvauwd8uvSy6xGyLA70tlHn3TpRn1HzQ=;
        b=nJRBjBxh49V6t0nlc3nRNMgZIFn+pF4DPHWgeaGWlGdHQz4ugVbc7QWxJmG0iy8MlC
         RsoxkQ/l0xo7zXtd0ErHNK7IaegyMV6RergKSwZ/BGKwFWlT+yYof4qTtt+Z2tQ5rcCk
         RW86b78xsB12US87fpltNmELsPRQ0sUWfVgW29Z54AQm4GPZ0xMmT5jALwosa7dwjHL1
         5XJaS1zh86bdW3xiHOGI/ksuVQr9WcpsTKQUibomewlyUtuoQ9h4X2f9VIbVrbu/YmLP
         tY5tCFXFnB2JnVU1f6i6jmuivw3bb6bSjI2c51yPFaZvA6PWS/wah1t1PjpVkTpBjicZ
         6N4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXR8FyaKPTSc5SpRgPHaK39HTFN938OXOmAHCcL1oF48UwiOrsmCzfI8xlOrvlXxSAJdrpn@lists.linux.dev
X-Gm-Message-State: AOJu0YzemA110fx09JT9m6SEgYIBDTNhZhJeZOwT/4jZ2/XfBxNoJuW6
	aDgWD6lzEg4zVKfTVo8gnJz9XZNnS2vGgGYnEEoCymbq9szYjSNDStzbbwZyuPkVAyLBk+R7ch1
	7wCS/UUzy7Xsy
X-Gm-Gg: AZuq6aLxiE5znlMBcMYPaWUoe9BOZV6ANF4jXKZ4BzAHkO9VxfzPaREpT8AH7iOPmSC
	6DdWMBWN2W395Qu/xm3q7oBLbDchgi6zt5I00hdX+/BuFi7vJdLp/KthNPYPWjmHFOdKS8P7UUX
	18ZT52Ji+0q/kk9kk8so1PwcCor/haJUMO/favQOQ6OgsyQzGsEqJca2IS/JKoxkl0x0Ye/TmOB
	HJm44h7+sqYEATGJOQQPo1MZiBrPe/nnNH1KNotYFLNzaXOihl8ev0uKzeD0SQo4V9KmUgMu7Ig
	k6Guj3D6eOCaEa8Z97RLo6ffogJtYmVo+HxOtnn79E9+5K0wcUnZ9QudeFu85QJPC/uIzeHJI/P
	Ge1SMQL4j47lBHZI9TzQ9MJRbCOwMWMetC6DudhHmUtr8ssrwmaWI7KsGy7iUtR8zws4Y2IIuUq
	q9ft/KhlwOWN7oh58ibRMP4kEy07mIRDnIv+rYQyk0mJNwrJ/9Z8ckgGzKfn9wO4+RRdzqaXsvH
	Krk
X-Received: by 2002:a05:6512:2512:b0:59f:6f53:6154 with SMTP id 2adb3069b0e04-59f83adf399mr1075149e87.2.1771446335561;
        Wed, 18 Feb 2026 12:25:35 -0800 (PST)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3870692b7b8sm42174521fa.44.2026.02.18.12.25.35
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 12:25:35 -0800 (PST)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3871017fea2so12112471fa.0
        for <llvm@lists.linux.dev>; Wed, 18 Feb 2026 12:25:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWDpn1QsgTI80pRVVLhl0Bb8vUiYJBPjCIqYv/8FjIuRr0fCxoGvb2l+VTPBT3td/Yhq7E9@lists.linux.dev
X-Received: by 2002:a17:906:fe09:b0:b8f:e98e:ff5d with SMTP id
 a640c23a62f3a-b903ce88e4emr213862566b.13.1771445937188; Wed, 18 Feb 2026
 12:18:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260206182650.6c21b0ff@pumpkin> <CANpmjNNFXdMM6cL+HBsiXr2WUA=mttR1jDRMqNYD7+YZs6vRKg@mail.gmail.com>
 <20260215221656.68b2fc1d@pumpkin> <CANpmjNOnOqq2k41=iNsgZLXAzspVQhcTZ88Nvms_c_0M+7b7YQ@mail.gmail.com>
 <CAHk-=wioS+vB8aBxWBgdEfXqDq5Ynr9gyY=GhU7gxO9G_C+_6g@mail.gmail.com>
 <20260216110915.4f0d5490@pumpkin> <CAHk-=wjJQQfWpAxigafuyrgxg8CdQWSimVYMk16_j0vWwEkjag@mail.gmail.com>
 <20260216174324.75d47e37@pumpkin> <CAHk-=wgQ8DOxaNY5cBWg+sUkM5Kk6rKYGRHXsZQLtknO_UX+QA@mail.gmail.com>
 <CAHk-=whFGxN0nUffzCsR_NZnQ5TTu+8QFGSfca1j42kDK1a1tw@mail.gmail.com> <aZYUUsROBSpoPtav@tardis.local>
In-Reply-To: <aZYUUsROBSpoPtav@tardis.local>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 18 Feb 2026 12:18:40 -0800
X-Gmail-Original-Message-ID: <CAHk-=wihuAnUwoqh-KGRQ5WTmu39Zdhjzk-VbFNOx-yKjyvQoA@mail.gmail.com>
X-Gm-Features: AaiRm50CUFiXxS4bOK8f8-OJtB3blsf2VcJ1-Ft-EZ2UkUuahsamp9XOBwWr4tk
Message-ID: <CAHk-=wihuAnUwoqh-KGRQ5WTmu39Zdhjzk-VbFNOx-yKjyvQoA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
To: Boqun Feng <boqun@kernel.org>
Cc: David Laight <david.laight.linux@gmail.com>, Marco Elver <elver@google.com>, 
	Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Feb 2026 at 11:34, Boqun Feng <boqun@kernel.org> wrote:
>
> > I  just checked a few test-cases, and I don't think anything has changed.
> >
> > All the trivial things where __atomic_load_n(__ATOMIC_RELAXED) *could*
> > do better than just our old code using "cast pointer to volatile"
> > resulted in no better code generation.
> >
>
> By any chance, could you share the test cases? It'll be really helpful
> to represent what semantics we really want to compiler/language folks.

Lol, it was just a one-liner test where I compared a volatile pointer
with a regular pointer and a __atomic_load_n(), I didn't even save it.
It was checking two different bits in the same word.

It was something trivial like "(*ptr & 1) && (*ptr & 2)".

With a "volatile", that obviously has to give two loads, because
that's the required behavior of "the load is visible as an IO".

But what I want from __atomic_load_n() is that it does all the
optimizations that *hardware* is allowed to do on a load.  Loads are
not "visible as an IO", but they have ordering requirements, and they
cannot be torn.

That means that basic CSE is obviously allowed, so loading the pointer
value twice results in the compiler just doing a single load.

But it has a subtler meaning: while CSE is allowed, a load has to be
done at least once. That means that you can combine them, but you
can't hoist them outside loops and mke them go away entirely inside
the loop.

So my basic test-case is literally just check for that trivial case.
And the atomics fail that completely. Which makes them entirely
pointless. They don't generate any better code than "volatile" does.

And if they don't generate better code, then they are worthless
complexity and garbage.

And yes, that "check two different bits" actually comes from real use,
ie it comes from my annoyance with "test_bit()" kind of semantics.

[ Time passes ]

Bah. Based on the above, I just recreated a trivial test-case of what
I think *should* work. Here:

    #ifdef BAD
    #define ACCESS(p) (*(p))
    #elif defined(VOLATILE)
    #define ACCESS(p) (*(volatile unsigned long *)(p))
    #else
    #define ACCESS(p) __atomic_load_n(p,__ATOMIC_RELAXED)
    #endif

    static inline bool test_bit(int n, unsigned long *p)
    {
        return (1ul << n) & ACCESS(p);
    }

    int myfn(unsigned long *a)
    {
        while (!test_bit(3, a))
                /* Busy loop doing nothing*/ ;
        return test_bit(1, a) && test_bit(2,a);
    }

and then just do something like this:

    gcc -O2 -c -DVOLATILE t.c && objdump --disassemble --no-show-raw-insn t.o

to see what gcc generates.

The -DVOLATILE case works:

0000000000000000 <myfn>:
   0: mov    (%rdi),%rax
   3: test   $0x8,%al
   5: je     0 <myfn>
   7: mov    (%rdi),%rdx
   a: xor    %eax,%eax
   c: and    $0x2,%edx
   f: je     1b <myfn+0x1b>
  11: mov    (%rdi),%rax
  14: shr    $0x2,%rax
  18: and    $0x1,%eax
  1b: ret

Look, it loops until bit three is set, then it ands bits 1 and two,
but it has up to three loads to do this all.

With just plain loads (the -DBAD case), you get this:

0000000000000000 <myfn>:
   0: mov    (%rdi),%rax
   3: test   $0x8,%al
   5: je     13 <myfn+0x13>
   7: not    %rax
   a: test   $0x6,%al
   c: sete   %al
   f: movzbl %al,%eax
  12: ret
  13: jmp    13 <myfn+0x13>

which just results in an endless loop if bit three wasn't set, because
the atomic load was hoisted outside the loop. Plus there was no
guarantee that you couldn't have TOCTOU races (which this example
doesn't show). So that BAD case really is unacceptable, because it's
actively buggy.

And the __atomic_load_n() case generates pretty much the same thing as volatile:

0000000000000000 <myfn>:
   0: mov    (%rdi),%rax
   3: test   $0x8,%al
   5: je     0 <myfn>
   7: mov    (%rdi),%rdx
   a: xor    %eax,%eax
   c: and    $0x2,%edx
   f: jne    18 <myfn+0x18>
  11: ret
  12: nopw   0x0(%rax,%rax,1)
  18: mov    (%rdi),%rax
  1b: shr    $0x2,%rax
  1f: and    $0x1,%eax
  22: ret

except it's actually randomly worse for some unfathomable reason.

So tell me: why should anybody ever use that "modern" thing that
generates worse code?

What I *WANT* is something like this:

0000000000000030 <myfn>:
  30: mov    (%rdi),%rax
  33: test   $0x8,%al
  35: je     30 <myfn2>
  37: not    %rax
  3a: test   $0x6,%al
  3c: sete   %al
  3f: movzbl %al,%eax
  42: ret

and I can make the compiler do that by just doing the CSE myself and
not using a test_bit() helper.

But until the atomics do this *trivial* case right, there is
absolutely no way that we'll use them in the kernel.

And no, clang does no better than gcc. It's possible that the C
standards have specified the semantics of atomics badly and compilers
are forced to generate crap - I wouldn't be surprised.

But more likely it's that nobody cares, and compilers generate crap
because the atomics are complicated enough that it's not worth the
pain to do anything better.

But as long as nobody cares about those code generations issues,
"volatile" is simply superior.

It is standard and portable, doesn't rely on modern compilers, and it
generates equivalent or better code.

I feel like I'm not asking for much. I'm literally asking for an
__atomic_load_n() that is better than volatile

Right now it is WORSE.

              Linus
