Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A8B2E5B05
	for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 18:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771267275; cv=pass; b=Tzusligw07zUVXRaDH3lum7sX9UW3SpQOdcTswquyfRsoKdlzl4oFWYNG6sG3oFwi3PCrXk/aeuztwKxTiozlZj9+j5BVoNlgOep8oyz6H0tO/x9dpOXHsXslo7H2RKLE1rGNHE2UnArqRpUqoWwEN+pinAvrFE+31ZYIEiravc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771267275; c=relaxed/simple;
	bh=SQ/z2t3IkPker2Ns7xxuVbrxaO3evWBYxd8X9Nni/UU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fluKIOCIQPNkOd8Q8pWNMF9WEf9OSnrfxVXZC8TVcnIJBieEpq6nUE635RLzcL2Bs1XHi1Nutzlw4vcyutUrMtwavX/KCiITaOfTcl4huzdleepws/yPTRn3zoxvgvqu+Vs+mMPFizkEKyEbIBzzzaqwxgHDBWT4GyohM8nVtb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZYmMYGhB; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZYmMYGhB"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12732165d1eso3822740c88.1
        for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 10:41:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771267273; cv=none;
        d=google.com; s=arc-20240605;
        b=EC0aR+48QCSJCLDeo8Bhs2X31NX4zl7Txt0EqYBY+ZU/YdPueeLPaRYAHNiMa9z5F/
         r1v470z1WeptceCGb4vkDNFp4mCBa5TMlaJ1GwbO8+FAtYsiFhxR8pqJUH2beP5peOZK
         L7MrtFwh/jFb72n1AGa84KRg+5mTEU3a6jv3aiI2um1Ds7l1tOkrJdQDETF8I/LnSLy6
         twXbEi6IOcDS3bhrMKeFHBRzZa+HzWQDee9NM1rihDLviBf/uV8OwnuslIP52rz9wTOe
         aicFnT66cS0bF/Wfw3ZqY8wO7gGLwkRxblcifRlo4xBda26VFj7+3NahNp4tWyJpTzJB
         2dyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kYcZ6XfVzb4wc0JHYLpa4lr7YP7dih92E6XG8TYL1zQ=;
        fh=3dUIXsjcmUyko71mUzkJhnfjEdYpKyqSAZ6kpcWdq60=;
        b=LGxJAMXJl51s4kD1leG/jX7WFmk1A7R6W41pAAV+Gv6uOOouyshIsFFk0cgQ38Chd/
         EubkmTian5XDG94sBAUzKEu+K9Y60HI4SVyKKxJZvC8Xc0yuOMFiHrJfZQ9KoQ1MxDEQ
         rWqxZfx2eapWza0C+lASb2zas5DPaPDLHH+Z0GO7dXJd2sbhHoA4EaxdaHCpUTVX0kab
         vEdGgFxSYyyHB3PNao+gMkihjLUyvB13OX+TJ+EJB4l3ns19kvVsdeDd3WoDH54Prs/+
         YD9+6DEdLP5sW8DRIn4J4ZpRZMUC7mJhXQ74HyGYyF53MADMSQAOzJrVShEJ78mDFvnq
         6mHg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771267273; x=1771872073; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kYcZ6XfVzb4wc0JHYLpa4lr7YP7dih92E6XG8TYL1zQ=;
        b=ZYmMYGhBNomurTtDlcAGoLbGJYoh/q9OMkWvCs5ACzgJ7H/InQMwHUgZIKggoxAuon
         ZVbMwju7TQcB/2rWgAPCo2vUotGMBXpBsU8+k3RE1nAaSBB/t0xnR76XKfqxKYQLV0W6
         pPWlPI0Bm8r2+zLzh/uDACiyhBSYJJJiuSNn5Vw/vr2IyLrJmIeUBB3bpUnX+ZuEbW0A
         ZZzt62ZrBCVjnpQAnolVrWQpSPZX/d7iLO0rL+DbGAstM5kRo2KAkbz6Y+zEFZbtq3Vv
         KmBx0APxdkAClwy3BKVeruY9EBL1IRb/6cAKKKxxuTCB+11Ovi7TaPKhA9Ree3wxqWc6
         /How==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771267273; x=1771872073;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYcZ6XfVzb4wc0JHYLpa4lr7YP7dih92E6XG8TYL1zQ=;
        b=B/EgZJGMIgAF3rJ6+iWrEedyjCGYSPVsjfKrFX2IHWM71XJohqa1ss/lpnt1Wfq8N2
         5jzgyBJo9orIZro6c7I0I3H9JbLpYWbU/sJ01tsedNmmmg5eBTYgiO5iabv+W2MAYOU2
         IYVUErv2BfdrZ7KEAY2P6eTL12Vx0UYQKkYpcPbzXMtaGTyrPYbSgvN2PbJjqTIgACMD
         IvfJh8aa9ySSLns7Zihnt52hunJJWCVoEQZZnVRcbOD9Xb9/RFwYW6n6ONTwGHIXk8NH
         ul1wuT9MAh0tAb/Ot2VKw49P3y2oHCdYZ79DyAy1z59JF3IVUASQ7zkuwyDokfJOmxdf
         acOA==
X-Forwarded-Encrypted: i=1; AJvYcCXMtonH26NvsyYUnYmNR8zC6Ww7UoH4a7Gy0QnmrKAcItbOqtuC4Pd0g9JmJU/MaWbTa+xj@lists.linux.dev
X-Gm-Message-State: AOJu0YxXN6qDWj6kvac50N0CYuA/tn+AWRjfy1K8gQ9BbGzMX5XOdQBt
	ucRKGTOZpgXQ1S6LK2hh3+DRmhq5quWT3UjFPdUisbVwrmPG4xLdCQzRxVYKUGX9cREQkey74EV
	RW93bbV0c3DolZD0Guqey9qY+S798TwKwsh/6wjrz
X-Gm-Gg: AZuq6aKU8/qHrTcnN5Ru+sjraPb+3B974wIR9z9FTqr4z3Btcr32mKhDRGNb/9jmOma
	n6FILVVTtIAkj6jx+mQyZqeZFkY+fJ3dbytB5MhlThv9zRlArXmWNQ3IZ4Qla5Vut6OEdhNb+oB
	nKjpmqECZYiwNtEVWj0clJT6WhOE1k03Ql5ZOnYBMuwpBBEwbDexijqwdbG1C4PS9pLdaXLtDy2
	wCgze3eqt5xcn8K9akcU5X23KaHFiPa4w2rs3RiD9xpm5gPYwE5TVbAMo0sZZdjLdpC4k9sZKvD
	WiyM3J/zyfLc+NCjPXEowhioPn7UYQIfCEP9KCxqfEdswoaIzw==
X-Received: by 2002:a05:7022:4583:b0:127:15cd:9f52 with SMTP id
 a92af1059eb24-1273adf07d4mr5466689c88.5.1771267273017; Mon, 16 Feb 2026
 10:41:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260216142436.2207937-2-elver@google.com> <20260216142436.2207937-4-elver@google.com>
 <20260216180040.6a93807a@pumpkin>
In-Reply-To: <20260216180040.6a93807a@pumpkin>
From: Marco Elver <elver@google.com>
Date: Mon, 16 Feb 2026 19:40:36 +0100
X-Gm-Features: AaiRm52AgDWqeZgz46e-SxIU6FJBy1l6V8ecxUxIHqMxYd2sEoEiCIofE0fG1Z8
Message-ID: <CANpmjNOreeZxbUZC29-yFVd_XWAFn2+oJWhzAr_xXH2wogfOkg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
To: David Laight <david.laight.linux@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Al Viro <viro@zeniv.linux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, Boqun Feng <boqun@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Feb 2026 at 19:00, David Laight <david.laight.linux@gmail.com> wrote:
>
> On Mon, 16 Feb 2026 15:16:23 +0100
> Marco Elver <elver@google.com> wrote:
>
> > When enabling Clang's Context Analysis (aka. Thread Safety Analysis) on
> > kernel/futex/core.o (see Peter's changes at [1]), in arm64 LTO builds we
> > could see:
> >
> > | kernel/futex/core.c:982:1: warning: spinlock 'atomic ? __u.__val : q->lock_ptr' is still held at the end of function [-Wthread-safety-analysis]
> > |      982 | }
> > |          | ^
> > |    kernel/futex/core.c:976:2: note: spinlock acquired here
> > |      976 |         spin_lock(lock_ptr);
> > |          |         ^
> > | kernel/futex/core.c:982:1: warning: expecting spinlock 'q->lock_ptr' to be held at the end of function [-Wthread-safety-analysis]
> > |      982 | }
> > |          | ^
> > |    kernel/futex/core.c:966:6: note: spinlock acquired here
> > |      966 | void futex_q_lockptr_lock(struct futex_q *q)
> > |          |      ^
> > |    2 warnings generated.
> >
> > Where we have:
> >
> >       extern void futex_q_lockptr_lock(struct futex_q *q) __acquires(q->lock_ptr);
> >       ..
> >       void futex_q_lockptr_lock(struct futex_q *q)
> >       {
> >               spinlock_t *lock_ptr;
> >
> >               /*
> >                * See futex_unqueue() why lock_ptr can change.
> >                */
> >               guard(rcu)();
> >       retry:
> > >>            lock_ptr = READ_ONCE(q->lock_ptr);
>
> Did you try adding OPTIMZER_HIDE_VAR(lock_ptr) here?
> That might force the TSA logic to use 'where lock_ptr points to'
> instead of trying to allow an unlock(q->lock_ptr) (or similar)
> which is clearly entirely broken.
>
> Testing a compile with the unlock() missing ought to generate the
> warning - if not you've just confused the code enough the it stops
> caring.

OPTIMIZER_HIDE_VAR() is not appropriate as it might pessimise real
codegen which we don't want - the warning/analysis happens way earlier
in semantic analysis. But we have 'context_unsafe_alias()' which could
be used for this purpose, so 'context_unsafe_alias(lock_ptr)' after
the READ_ONCE() would work for what you intended. Except that this
function wants to be annotated with __acquires(q->lock_ptr) so the
compiler needs to be able to resolve the alias properly for this to
work.

Overall we can't really expect the compiler to see through inline asm
during semantic analysis, so we need to trick it - codegen should not
be affected for any compiler that does a reasonable job of folding
these local variable accesses.

Note, it does work for all other architectures as-is, given most don't
use inline asm for READ_ONCE().
