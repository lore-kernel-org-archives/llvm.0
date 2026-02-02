Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47D43806BD
	for <llvm@lists.linux.dev>; Mon,  2 Feb 2026 17:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770054540; cv=none; b=j5SZnQl+iVL1JXOJV9jUEKX3yH/EhmJ3n1SQ6tOQnB0oqZsaE3D1YziEfAYqE4ZlgCHjzGKRlaVVNrVaZZnkG3RU3luC1ATER6KMZwtPIJyNU66mW161KF03w4PqD4E5yKhhEcaoPvknctG8wswTqsFtu2Nu3HFi1CIqqRFo7N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770054540; c=relaxed/simple;
	bh=plEqnRUAK0ai2JOEmKZ9oLZCk82AF0RJqqu0Ez826Zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N5DV+z13GURz5RWlXFyyPb75KM/PAXah/OEfP6diiHc+lhLC52rl3pgoAbabU4Re3yY78C8+xnMz8lsqZ8SfMjTwFhjpTB30g7P2QdgtY8YAF/pMfnRGvf4sMWox9iQLSc11JlVEtTH+s/plZAWqdBr10IHa8jltLo2nZLWCCdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r69olPzO; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r69olPzO"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48069a48629so49253325e9.0
        for <llvm@lists.linux.dev>; Mon, 02 Feb 2026 09:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770054537; x=1770659337; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAotCLeZyiINnLo/dYSD4BE++0CoAWt914tHyyKTDIs=;
        b=r69olPzOeSXPNsQVSfmPmbpN310eq1znB4uGZydcBiv9IBcm9CNePdeVmE7/mJ1vH3
         XpB71j4whAbOKIy+K6q40fcOj824/MItMLWRhRfRHfoQyu43/aXNiUJKkLTPo1PAPY6r
         +TMvS0sNk/ZvjoE4G2YgfVwYoijgXo0HGr/gMpH6RSavCWY8i1p4dI8PFwktbEgJ9Nl6
         qSReNd60Z2achjWs4T5oN0LOqM/6r4il2HIuC8xUWDOGecu4MjMjeoV+Q48eEeNOMANw
         0VVf7ejS5PkK4LWW+FJxSQX11P21TuBHpDbThEVCDrKdlDUd5X86dVG9HkVZ0NUkI7Is
         1NeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770054537; x=1770659337;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YAotCLeZyiINnLo/dYSD4BE++0CoAWt914tHyyKTDIs=;
        b=xVPh9YQFaaSGaiQQEBmqmNAA5yUVWwQ0H+ahEwP/IBmXa4mGSuaJLn1a5ibm5KUvWI
         fkHT4f44/oSC+Uog9FYQ4vP8i5AQJzsR3ORrOugoL10PYEIPqsWiJ0xKctqgW6qiHQr/
         2tQg8dEDR/Zus1uMSZXF4Zd7NfpM6W3N5JISejBQI/G4fWKliyjAb8LNH0bzv2VmXhvx
         1j1sQg+INJ4lU+76wd1QOAtE5/PJn28pM1wWTAFksTJ4AndM2ggXg7YLMek9Nm+pX+eo
         6UQT5RzGllQy74LOEEO93hCZtIQkuEIm9wevkr9Y0ZBr/tfPRYzieJQJ04uSrS5jDFAG
         Gibw==
X-Forwarded-Encrypted: i=1; AJvYcCWsuovhfCLGorGmmAQZ1nC+ul6cJdOQkhyEcm9ZyxzjaJv1yzS7SZDlknNcX9a3KLfaIFnL@lists.linux.dev
X-Gm-Message-State: AOJu0YzzS/dgooiJtVu9bsNvzzMlIi0psLrGF/vtx8ATukO4sbgKeCg+
	itfCl9WbaDznKisO8fGvyAcD2Ofcz4VsefJ96CjUEC9HpT5FSCT9jpGyG58wIND5lg==
X-Gm-Gg: AZuq6aLhkKtVqDZUJ6fGjTMgm7zIETpdZnaArP7Vj5oeAq3Nrr23dHS/mVEXURBmBLK
	AxxEwYkKSqkLNIjDxPPZpNxoHww4A04Odk/On+nvOapSPrkGVu3GoKM6cE5cutAC/WkCUPvzNNv
	vrf74EuQxhkaaYpc7oFnqgMUFpPMSSenvSmoZ33rHhGorbl/Zh07ubfR7QGIk1gfTH47l0On9WT
	Sk1If+cwu4d66Fk1z1FczampBxyr4Vi7G3eZdzZjOItQ2YMF/Q7imy6QoDCvWTMKjY54zVRjV7i
	s+SiUB0NR+NmcRRuOzPZ5YyRpbdRuEUMeemNHTTyJGb7JTjIybvxJB8gTJ65a68L4BK/7oMdzQG
	5esZVxK9WB/T8u2g6DqR2lAcbyjmk1nTPh664ifWWbeVWQOLQMzUbNquasw+vGU0P9U07K/Gh5I
	JlnDeEiaQf0vgy5IapHXcnDOTD2EbW9J4Gm/aDxWhoHoO0W4g=
X-Received: by 2002:a05:600c:a00a:b0:471:1717:411 with SMTP id 5b1f17b1804b1-482db481be4mr157883855e9.24.1770054536894;
        Mon, 02 Feb 2026 09:48:56 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:2834:9:34d8:ac7:1851:db23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482dbcf9c3fsm115055905e9.4.2026.02.02.09.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 09:48:56 -0800 (PST)
Date: Mon, 2 Feb 2026 18:48:47 +0100
From: Marco Elver <elver@google.com>
To: Will Deacon <will@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev,
	David Laight <david.laight.linux@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
Message-ID: <aYDjf8apiadheFuM@elver.google.com>
References: <20260130132951.2714396-1-elver@google.com>
 <20260130132951.2714396-3-elver@google.com>
 <aYDEiOutq3_O8irP@willie-the-truck>
 <20260202160139.GF1282955@noisy.programming.kicks-ass.net>
 <aYDLUhWMdvzKpTK9@willie-the-truck>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYDLUhWMdvzKpTK9@willie-the-truck>
User-Agent: Mutt/2.2.13 (2024-03-09)

On Mon, Feb 02, 2026 at 03:36:40PM +0000, Will Deacon wrote:
> I know that CONFIG_LTO practically depends on Clang, but it's a bit
> grotty relying on that assumption here. Ideally, it would be
> straightforward to enable the strong READ_ONCE() semantics on arm64
> regardless of the compiler.

Does it matter for GCC versions that do not support LTO? Because I'm
quite sure that if, one day, we add support for GCC LTO, that GCC
version will be new enough that it'll just take the __typeof_unqual__()
version and it'll "just work".

The problem with older GCC versions was that their __auto_type did not
actually strip qualifiers (which it should have) -- this was fixed at
some point.

On Mon, Feb 02, 2026 at 04:05PM +0000, Will Deacon wrote:
> On Mon, Feb 02, 2026 at 05:01:39PM +0100, Peter Zijlstra wrote:
> > On Mon, Feb 02, 2026 at 03:36:40PM +0000, Will Deacon wrote:
> > 
> > > Since we're not providing acquire semantics for the non-atomic case,
> > > what we really want is the generic definition of __READ_ONCE() from
> > > include/asm-generic/rwonce.h here. The header inclusion mess prevents
> > > that, but why can't we just inline that definition here for the
> > > 'default' case? If TYPEOF_UNQUAL() leads to better codegen, shouldn't
> > > we use that to implement __unqual_scalar_typeof() when it is available?
> > 
> > We are?
> 
> Great! Then I don't grok why we need to choose between
> __unqual_scalar_typeof() and __typeof_unqual__() in the arch code. We
> should just use the former and it will DTRT.

The old __unqual_scalar_typeof() is still broken where
__typeof_unqual__() is unavailable - for the arm64 + LTO case that'd be
Clang <= 18, which we still have to support.

We could probably just ignore the performance issue ('volatile' reload
from stack, rare enough though given volatile variables are not usually
allowed) for these older versions and just say "use the newer compiler
to get better perf", but the 'const' issue will break the build:

| --- a/arch/arm64/include/asm/rwonce.h
| +++ b/arch/arm64/include/asm/rwonce.h
| @@ -46,7 +46,7 @@
|  #define __READ_ONCE(x)							\
|  ({									\
|  	auto __x = &(x);						\
| -	auto __ret = (__rwonce_typeof_unqual(*__x) *)__x;		\
| +	auto __ret = (__unqual_scalar_typeof(*__x) *)__x;		\
|  	/* Hides alias reassignment from Clang's -Wthread-safety. */	\
|  	auto __retp = &__ret;						\
|  	union { typeof(*__ret) __val; char __c[1]; } __u;		\

Results in:

| In file included from arch/arm64/kernel/asm-offsets.c:11:
| In file included from ./include/linux/arm_sdei.h:8:
| In file included from ./include/acpi/ghes.h:5:
| In file included from ./include/acpi/apei.h:9:
| In file included from ./include/linux/acpi.h:15:
| In file included from ./include/linux/device.h:32:
| In file included from ./include/linux/device/driver.h:21:
| In file included from ./include/linux/module.h:20:
| In file included from ./include/linux/elf.h:6:
| In file included from ./arch/arm64/include/asm/elf.h:141:
| ./include/linux/fs.h:1344:9: error: cannot assign to non-static data member '__val' with const-qualified type 'typeof (*__ret)' (aka 'struct fown_struct *const')
|  1344 |         return READ_ONCE(file->f_owner);
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~
| ./include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
|    50 |         __READ_ONCE(x);                                                 \
|       |         ^~~~~~~~~~~~~~
| ./arch/arm64/include/asm/rwonce.h:76:13: note: expanded from macro '__READ_ONCE'
|    76 |                 __u.__val = *(volatile typeof(*__x) *)__x;              \
|       |                 ~~~~~~~~~ ^
| ./include/linux/fs.h:1344:9: note: non-static data member '__val' declared const here
|  1344 |         return READ_ONCE(file->f_owner);
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~
| ./include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
|    50 |         __READ_ONCE(x);                                                 \
|       |         ^~~~~~~~~~~~~~
| ./arch/arm64/include/asm/rwonce.h:52:25: note: expanded from macro '__READ_ONCE'
|    52 |         union { typeof(*__ret) __val; char __c[1]; } __u;               \
|       |                 ~~~~~~~~~~~~~~~^~~~~

... and many many more such errors.

It's an unfortunate mess today, but I hope sooner than later we bump the
minimum compiler versions that we can just unconditionally use
__typeof_unqual__() and delete __unqual_scalar_typeof(),
__rwonce_typeof_unqual() workaround and all the other code that appears
to be conditional on USE_TYPEOF_UNQUAL:

	% git grep USE_TYPEOF_UNQUAL
	arch/x86/include/asm/percpu.h:#if defined(CONFIG_USE_X86_SEG_SUPPORT) && defined(USE_TYPEOF_UNQUAL)
