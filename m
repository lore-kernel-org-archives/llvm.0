Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5F443935C
	for <llvm@lists.linux.dev>; Thu, 17 Sep 2026 22:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789685381; cv=pass; b=j3OgY+ckx5dZrpWudTWlPTDUPlbcFJk4QbBFIZr6LcZb5CMPxDFmbotqNHfXlgQKqhOGuu8aCCikH2Vjq6lt6h/qs+4OQM/ruD22mg70SCVfsQv5rLGzJwFG7dPpbR7kA+8lyZgwde12Pr4zmpwixmUdevU1qkQtHR4cntFaQNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789685381; c=relaxed/simple;
	bh=M2q4JEGXRGUd1pDT7+w9GldgLWSXnNh0kwpB0BtvRoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tJReicECMUKICRMSUJWRyZvAoOhSTwFIZC5G+LiQOFJEt9O8IA95whkH2BfRz/SU3D6cjFQLN0ymjGY6fVOMKzKIUCwlWlMsP56BHPLnoJh4jY6XzfV/BqNfE7Lyd8MFFUd+EoujUGxBDd9gHhOftqpRjvH6YYpVaQUUWhJogqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IYa8no7O; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IYa8no7O"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1ca5b0d6so1098735e9.0
        for <llvm@lists.linux.dev>; Thu, 17 Sep 2026 15:49:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789685378; cv=none;
        d=google.com; s=arc-20260327;
        b=B2+6AHGNZF4IbZeRjdzW1O+RNrQYtO5xsOjsTaHbJMIiWtrCy73WJCnNNoZLRFJ36a
         9LLX+b6DR1FiNBx1kSKeWX0q+B68ahcqEiyFPwqMiYFw+4LrYXC+kwUzwP+x2hKSq/YI
         Pl+dcwI0+tje/7d1MPx7TeXiQSf2Z33LWRw7VgOf6ZjaWuBbDikdlKBZPHr1tC9CNUY/
         3AKBSP2WJVz3uJD9Hmf8JeB3gS5jhwhZ80GtIeNlN7StSiIUtG8YPE9eaYSginWR+UqZ
         vfcAfJgvsWX14UMPuAtBOJwO2gAo2onCBa+hbeWlLUUTDo3UJOVj1Nf8xxzS0Tz3Pja4
         ZwSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AsEjQeiILrTCiiNJxr0LdCds8To9eh6AZ9RKtss0ZJI=;
        fh=2UrhGnZ7yFnULZVIAIdKwPg4G3+Yx3tdnKK/hEeIuU8=;
        b=tCYuzeiLwYWbo3P2vvnwsy9c9hcB5UliUTYuOqF2lj7TTMKbKybqU84xoMq1MpsXrV
         sR3i/XV/aiFw2oxPJLXs94yT5ihSSM+9UOLfQGql56OYszh3vBS6N0CLvKIAvGaPvMlA
         kZWaw2noOzV9hN5xai9redTm2mD8et8n33J0m/77eyi4q644zbYIY17GrLxXj/WTcBWH
         fDkgFEu35S6C/3hmnFSWJYv81kYdImSOk5WwL2/y1Tv0ecuwq4tNfBGv+bvmkcRQ6XnW
         exoVOFYB0JTwb0L8M8C8+Y1HBw52RVMOQpikDZgSqhYej1ipVde7a3f9PLHb/qftjp53
         MO4Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789685378; x=1790290178; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AsEjQeiILrTCiiNJxr0LdCds8To9eh6AZ9RKtss0ZJI=;
        b=IYa8no7OhhnSEOloTewC3N7HdyeEFNv3SSXX+U5jaBee+NDCNbPGikwtTLSl7295Nm
         yCmuazkxrVw+TCI/xYWb5yndsbXPdmxJGwUxjS5uCa8zqRpsq/Jxkpbrp6WG7DhwwzPs
         v0xwc26Z2Wp6iXTYdQVjzqyfgKhvrH+Xi6jI00hjy7RrrxP/cVbw46Sy8wwVdu1TZZ8B
         4im8LHvm6YcOgFQuznyyqv8uL1+OcO1XvGapxkjFs/85qeGsj2pc2d+B/9LeqTIxUVbW
         b9UOGBYoa3Xi3ChuSWHJGm0aLeded0nyUx4zOqH86cYU+akWypJOseKBoSqTuJ/9d8vL
         Phmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789685378; x=1790290178;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AsEjQeiILrTCiiNJxr0LdCds8To9eh6AZ9RKtss0ZJI=;
        b=S4LPzDNkMxLfgYshXX05cxCavcYOER2zttXGHrp8H7mqYbD1sHkkRnO0JYw2Po3KQl
         BzfY5GkfOs/YAWM4DaCwVQI8LarbjYZLaVB1YLqe/udTK1o0pUI6RSIJrGr/5JTx9T/y
         OXS9BhCXJU5z8aMdDZed2n90l9yOSPIPGWzabOvMZDLVKwH42MHEfTTrN7bJn1to3Cx1
         hSSLXZIjpfwbR/9rYIJ+Z8ZG/6azdOKr6zJi0wu2CSQWn9z2+m5blLynj649O6briEkC
         O1qD37P5WeMfEFLN73VEinj38SZ2Q+3sDFXGncko02JCiBfzgyrfgj+l96nmu9823xqN
         ecxA==
X-Forwarded-Encrypted: i=1; AKwUvBwB0XRDXAX8gzdcgdQwqSV9Z4vIFUTyQ3spMRIYxsmMi5WDbA2bZYEvyZGtkpL3EBf4U3NN@lists.linux.dev
X-Gm-Message-State: AFuF++mAG/7jvXgigij0mLgXNk562gllQEL8V0pSq5X//Bo9Bz0Oz42r
	tKgVtolHtWNHkTxuTnaj68zZ4LjTEihHxX6/Zl5oW7prwl7GO9Vkvg4+ePvzNUjjb6wnAbJJdsc
	qXgv/yGV5F8ZhJlq5Rzs6Ezshp4xVZzOl37lpcf8z
X-Gm-Gg: AYBFou23WpASa9Xvp80TlW48gkCH4ASq5Eko4nkc4c8tnxRHXtpaa8UqQCXUbmr3No0
	0kAvSXd6kgCKW4IM4rJF9MaYv3epCzWfm2kilx4S6YnFMyKsQaDLUkw7iBGBTP8NGYTlrZbUIpL
	2PvpGQCEbvPW/jDdzynBOFJG85JeciQ/S23tjWycRh5jfWE31BlM63xxSbdhQkf5HKbxXhGjqmv
	DxVhpklPfV8f0/UyDi8ZDkMpy5m4zkDFESyMeh8PYfv1Wl+NJCgIXbNFbAy2WYChm8pCck5vS97
	Dula/IePYLzD5PtFXxN47fSPt0gtx49OYP78M0tZx7C0+7CQxB1qiQhSYdT4tu74WSXdfi5Gk1S
	5Hwwk907OE0Ww0X6MScdU5upj7eZmnWDOHsT12zFKpjuaThatd3Msi7XUYkn1Ds4tw3pDPA==
X-Received: by 2002:a05:600c:6214:b0:49b:9202:6f80 with SMTP id
 5b1f17b1804b1-49fc568129emr3841705e9.6.1789685377363; Thu, 17 Sep 2026
 15:49:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916-vdso-getrandom-avoid-memset-llvm-24-v1-1-80a92f2e225a@kernel.org>
 <aquyVkdYceiWdckX@zx2c4.com> <20260917173920.GB356152@ax162>
In-Reply-To: <20260917173920.GB356152@ax162>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 17 Sep 2026 15:49:25 -0700
X-Gm-Features: AcwNN1WueMFXEOIBtpgc7FL4Q7UkDA6F7pnnbV8nYZIUzRMbcrTohGPKKEuU_8Y
Message-ID: <CAKwvOdkHsw132XEY2zLxO-V4=_RyqBatavQDvLY-MpZ16ZSAdQ@mail.gmail.com>
Subject: Re: [PATCH] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
To: "Jason A. Donenfeld" <jason@zx2c4.com>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 10:39=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> On Thu, Sep 17, 2026 at 11:26:46AM +0200, Jason A. Donenfeld wrote:
> > I don't suspect this is the right change. On x86_64, this changes to
> > code from:
> >
> >     rep stosq
> >
> > into:
> >
> >     loc_2D9:
> >     mov     dword ptr [rbx+rax*4+0Ch], 0
> >     add     rax, 1
> >     cmp     rax, 0Ch
> >     jbe     short loc_2D9

/me nods

> >
> > Which is a lot less compact. It seems like the actual solution is for
> > gcc&clang to emit this inline memset mnemonic when the platform has a
> > good one, and otherwise not. But disabling optimizations for all
> > platforms, because it's broken on one, seems bad.

Ideally, yeah.
Pragmatically:
the compiler doesn't know what you will link against or not; so it
just emits relocations that the linker will (hopefully) resolve.  I've
definitely looked at how llvm decides when to emit libcalls to
compiler-rt/libgcc ("the compiler runtime") and thought "I wonder how
this works with compiler runtime version N-1?"

There's also the requirement gcc and clang have about memcpy, memmove,
memset, memcmp always being available (-ffreestanding or not) noted
below.

> > In this case, the compiler is being smart: it identifies a loop and
> > rightly turns it into memset. But if this isn't a compilation
> > environment that has an outline function, it should do something else.
>
> As I mentioned in the commit message, compilers require all environments
> (hosted or not) to provide memset(), so the "doing something else" is
> nothing :)
>
>   GCC requires the freestanding environment provide memcpy, memmove,
>   memset and memcmp.

+1

>
> I guess another option is to just include a basic memset() like the one
> in lib/string.c so that it is only used if the compiler makes this sort
> of transformation, while leaving all other architectures alone.

It's also possible to get GCC to emit the libcall, even in the
presence of -ffreestanding: https://godbolt.org/z/6hTrYq9z8

And it's not the first time this code in particular has had this issue;

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3Db7bad082e113640fc81200ff869e5c2d7a9c29a2

(is this patch a Fixes: for that?)

Clang has __builtin_memset_inline to avoid explicit libcalls; AFAICT
GCC does not.  So we could use that here to provide such a guarantee
with clang; the code would remain brittle and likely break again with
GCC.

>
> --
> Cheers,
> Nathan



--=20
Thanks,
~Nick Desaulniers
