Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CE2811F4
	for <llvm@lists.linux.dev>; Tue, 23 Jan 2024 17:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706031994; cv=none; b=rZBs4HVpfoVVHONiE4Hs8SiM7dlenl8n9HAm3oiIK2DO9t5NX15NRvCInhjresPU6q9u+/EidvWYvJq460AUwoRlJ8AeIqIoQEFv2RzjT29MjaImSnZIXQVrMZNaIo0nSU5S9gqLg2XSUupOcFWc7jxWtNuk5H4iFE01nlqX2Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706031994; c=relaxed/simple;
	bh=6lPJkqR20CZJ7JDcaUr9pIS1wTvhBq5nmz9ehJDu/E0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UcW8ua2/AGc6S3ElMEL9r9PKVwOf39KIxZwBhskoOB8IDi16PlXniKKvxndrfTCtd6MhX9XAFFP58RIqSLQ6PSJgpmP10bSj1tPA+bt9viWWNiHf/dU6FXqzCmbTsbhOV7UVIC38BfGCx2A1mII62+lDwoIFWvaWYJ54eQi6gwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=H2WtMRYf; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="H2WtMRYf"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2cf1c8cc870so1880721fa.1
        for <llvm@lists.linux.dev>; Tue, 23 Jan 2024 09:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1706031989; x=1706636789; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9k+udVHCQij9ZyhLL/CP/wWBU5q55R/Zc/OGcMOiAAo=;
        b=H2WtMRYfzDWnEgkRxndmPVOuDpRIJ/CSCQe80I81uTHnN8RDO+M8uWfVVAsM8u0mYZ
         bR0pAv/KgzDGaXeTP5jUEcKU5kq4runam3gfE0bvssKkYXX4PzKbfwxujacTS9em/jdw
         ixtCbhKxeP6Dhh8EjyAgPXzSX4lD3phBIGCdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706031989; x=1706636789;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9k+udVHCQij9ZyhLL/CP/wWBU5q55R/Zc/OGcMOiAAo=;
        b=Rbj8Hv+4i4zITtGvlCXrAR3Xm7KVI+Ym2W82uYu8zCJkktjcBWglAPDx9BTZ03O0ne
         9PsUo/0tRauL75feEb+4p7vybIt6GcfOkg5xX05CXlm9b16gbdd/Odgr0pvfymihTcuQ
         TiR8dk814FbpFUTWxSQt8g892IamhOJnL6A3vgDQ4alHroLV7bm6l409ORbnM9Zt8U0n
         fETWq4yxN897e+hAa6dZ8n2kRsNvncrXRBUFQ7fPR9/H/K3/GSfuZmGhx8EIjXXOLl27
         9YXugURVEzrC997eOL770jU1WCTDXdXoSUjvoOz4R7YN2I+Zfijas7HSeC0XMpFcEUIJ
         qstA==
X-Gm-Message-State: AOJu0YzJE5yEPmuNYadJZMdJcZs0U4yG6hhqmlNBNJHm1gRzsobLCaY5
	WrTs1oXKNqwwKttTbSm+ENeihmtBh6jFXZIcY3KLmz6FrDz5TLAi0HjQ9GVDJKoFiW+HasLMAD7
	TSHjh0A==
X-Google-Smtp-Source: AGHT+IGdPfQIyeEjjm83tZGEmKNjfCa611Idk8N0fq5u0fUDGdNMJ21/ji1HGJvNHRAYPQsmJ0fgNQ==
X-Received: by 2002:a2e:be90:0:b0:2cc:a638:56b1 with SMTP id a16-20020a2ebe90000000b002cca63856b1mr91973ljr.96.1706031988656;
        Tue, 23 Jan 2024 09:46:28 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id i23-20020a2e8657000000b002ccd1b79639sm3794095ljj.43.2024.01.23.09.46.27
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 09:46:27 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2cf19f65271so6945001fa.2
        for <llvm@lists.linux.dev>; Tue, 23 Jan 2024 09:46:27 -0800 (PST)
X-Received: by 2002:a2e:be90:0:b0:2cc:a638:56b1 with SMTP id
 a16-20020a2ebe90000000b002cca63856b1mr91949ljr.96.1706031986757; Tue, 23 Jan
 2024 09:46:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401230837.TXro0PHi-lkp@intel.com> <59fae3eb-a125-cd5f-224e-b89d122ecb46@huawei.com>
In-Reply-To: <59fae3eb-a125-cd5f-224e-b89d122ecb46@huawei.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 23 Jan 2024 09:46:10 -0800
X-Gmail-Original-Message-ID: <CAHk-=whoNcNpojRUjg65ixWDOJS-D1kvSHQvtNFtEq7aJw=5Fw@mail.gmail.com>
Message-ID: <CAHk-=whoNcNpojRUjg65ixWDOJS-D1kvSHQvtNFtEq7aJw=5Fw@mail.gmail.com>
Subject: Re: [brauner-vfs:vfs.misc 12/13] include/linux/fs.h:911:9: error:
 call to '__compiletime_assert_207' declared with 'error' attribute: Need
 native word sized stores/loads for atomicity.
To: Baokun Li <libaokun1@huawei.com>
Cc: kernel test robot <lkp@intel.com>, sfr@canb.auug.org.au, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Christian Brauner <christianvanbrauner@gmail.com>, Christian Brauner <brauner@kernel.org>, 
	yangerkun <yangerkun@huawei.com>, "zhangyi (F)" <yi.zhang@huawei.com>, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Jan 2024 at 23:08, Baokun Li <libaokun1@huawei.com> wrote:
>
> >>> include/linux/fs.h:911:9: error: call to '__compiletime_assert_207' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
> >       911 |         return smp_load_acquire(&inode->i_size);

Ahh, yes. We used to allow READ_ONCE() on non-atomic data structures
(we still do, but we used to too), but with truly atomic cases it's
wrong, since reading a 64-bit value with two 32-bit instructions is
clearly ever atomic.

So your patch is hitting the "these atomic and/or ordered accesses
need to be able to actually be done as *one* access" sanity check.

And the reason is that while we have special-cases 32-bit AMP and
preemption code to avoid this:

> >     891       static inline loff_t i_size_read(const struct inode *inode)
> >     892       {
> >     893       #if BITS_PER_LONG==32 && defined(CONFIG_SMP)
> >     894               loff_t i_size;
> >     895               unsigned int seq;
> >     896
> >     897               do {
> >     898                       seq = read_seqcount_begin(&inode->i_size_seqcount);
> >     899                       i_size = inode->i_size;
> >     900               } while (read_seqcount_retry(&inode->i_size_seqcount, seq));
> >     901               return i_size;
> >     902       #elif BITS_PER_LONG==32 && defined(CONFIG_PREEMPTION)
> >     903               loff_t i_size;
> >     904
> >     905               preempt_disable();
> >     906               i_size = inode->i_size;
> >     907               preempt_enable();
> >     908               return i_size;

We have *not* special-cased the UP and non-preempt code, because in
that case doing a 64-bit load with two 32-bit accesses is obviously
fine (modulo interrupts, which *really* shouldn't be changing i_size.

So this last case:

> >     909       #else
> >     910               /* Pairs with smp_store_release() in i_size_write() */
> >   > 911               return smp_load_acquire(&inode->i_size);
> >     912       #endif

used to be just a simple

        return inode->i_size;

but now that you changed it to smp_load_acquire(), our "native size"
sanity checks kick in.

The solution is either to add a new case here (saying "if we're not
SMP, the smp_load_acquire() is pointless"), or to just remove the size
check from the non-SMP version of smp_load_acquire().

Honestly, that sounds like the right thing to do anyway. Our non-SMP
case looks like this:

#ifndef smp_load_acquire
#define smp_load_acquire(p)                                             \
({                                                                      \
        __unqual_scalar_typeof(*p) ___p1 = READ_ONCE(*p);               \
        compiletime_assert_atomic_type(*p);                             \
        barrier();                                                      \
        (typeof(*p))___p1;                                              \
})
#endif

and that compiletime_assert_atomic_type() might as well go away. Yes,
it removes some type-checking coverage, but honestly, the non-SMP case
simply isn't relevant. No developer uses a UP build for testing
anyway, so the "less coverage" is pretty much completely theoretical.

So I *think* the fix is as trivial as something like this:

  --- a/include/asm-generic/barrier.h
  +++ b/include/asm-generic/barrier.h
  @@ -193,7 +193,6 @@ do {                                      \
   #ifndef smp_store_release
   #define smp_store_release(p, v)                              \
   do {                                                         \
  -     compiletime_assert_atomic_type(*p);                     \
        barrier();                                              \
        WRITE_ONCE(*p, v);                                      \
   } while (0)
  @@ -203,7 +202,6 @@ do {                                      \
   #define smp_load_acquire(p)                                  \
   ({                                                           \
        __unqual_scalar_typeof(*p) ___p1 = READ_ONCE(*p);       \
  -     compiletime_assert_atomic_type(*p);                     \
        barrier();                                              \
        (typeof(*p))___p1;                                      \
   })

because the extra type checking here only makes for extra work, not
for extra safety.

Hmm?

                Linus
