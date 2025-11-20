Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A890E2E888C
	for <llvm@lists.linux.dev>; Thu, 20 Nov 2025 11:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763638868; cv=none; b=Thc7PzFPgmqH4ERPXFedy39Inp6PaCm3VCu1I+q6jpfcPeuE7AnTk2yCIxAdivEzAveYXcigyPn9JAwT9YubXIi+z5CtgCLnyZT/n2aIFjXOh/W4m/Vts2iQRQc/rUFMWYnLEFNeoQd6uS41uI0Fr4cnWjh9/x8GRbj+cGR5rkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763638868; c=relaxed/simple;
	bh=CfqB7Ifb+k4LySxlinOfJWxQKgK7AeqAh1VPq0MWMT8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ah+EMEeJ+tBqCFKe/puZ17mPKqJ2mI0BegSvKhC0HkkYjy+Xfv0P8/IG5Qa/jq+L85YhCfRrR/Bfdf57vudAl+ngbYDpc4C/qDgJSRUeRep8H+sjpV6QY10HyZLy6Or8CxCeRrms2tRX/6vbRNI1LyZ3kk3hZkHYJ5YsaNkXmWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XKW/rzry; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XKW/rzry"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-477563a0c75so4202655e9.1
        for <llvm@lists.linux.dev>; Thu, 20 Nov 2025 03:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763638865; x=1764243665; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CoTrMMS2HaaXFnWupvLOf7nCos21JazPDYtLYFbe2g4=;
        b=XKW/rzry0mG1zTZrZlITiGie0JUdSQn6YtpRass02Hk1jFRf1SPBsO6fVxfv8KTHk5
         db51XJm/7G3Z1SsXwlk2mtwvFuTM1vCjGtFqJHO2MtBxAtYyWEfkUnzUskQAhdm77H4B
         R1uQ65GUTOAtOSWVLhhsJXHZ4Rb2LdZNFLoq3bbS6WY9u1M25v61IOKRUke3FmfMht3G
         wHJqYMyDqopZqPOZScYCvRScqTy6O3MWw5QSa5mvgJS/lGC0pB7todw47vGlxZ03TFUs
         20c0cFy/xN/ivEqXw5VYKV5wIDah44klMUTfrgmSeA1ScK0LpUtLt09w3080oI2x0/dq
         zdBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763638865; x=1764243665;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CoTrMMS2HaaXFnWupvLOf7nCos21JazPDYtLYFbe2g4=;
        b=xTWYtn6M6lEERq/kt2k1n2iVeNfYPWS7tkJlNZkXA5MXFNn7YDgrXeSdT2j8r/e6HI
         4fPuaHFvgKKSjykhGnYoax7PPIaEe8AuIxUhesg34Kyq/gR+xjls1lF3YtorVgOEnkdh
         NWrzygNnM7LFH632EmlN+YiEiWt6taBoK10QC7/ivBRJKXhJPbSTRSV5Ks+uFCR91ntD
         wFuBr0ClbpphVq2/fGPUn3hqKi29+el6nzQbPeXBkhl1rKLhgRRbnRJt5jdXzivlXVxP
         gZxrZVyqW6iSxCHUohQOMLaN4bJ/+a9O2ecEhIU1tFpH0L9kkuHGd2eJ/04h0w/ELCGK
         e70g==
X-Forwarded-Encrypted: i=1; AJvYcCWW9EhKmNI8VG8EGldasBg40ArP1gazwGpqS7KjM82iqIlUarmNgt318kBfnxge4A2ui/EU@lists.linux.dev
X-Gm-Message-State: AOJu0YxBc3gFX0Q1iX4zSDSXZzbjt8g+naEBkhQDVqa8UJluq+4LygHh
	Z8r+bvA2HjZyvbXfuwtgXICZwG1XyacHz3QDBlkwBqNgbcQrS4k4AWdi6t275PGs0GZJlOszdsT
	4pXyjjV3MNyQDvw==
X-Google-Smtp-Source: AGHT+IHPobdnLq1/0XFEEkFxOSFx2vjBu9lGibecbPYy21Il9M+1UTJ6B696Ck6oKsyiBhXHYUi+R4aHU5p0HA==
X-Received: from wmfo12.prod.google.com ([2002:a05:600c:2e0c:b0:477:7ed9:17ad])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e8e:b0:477:641a:1402 with SMTP id 5b1f17b1804b1-477b8579e57mr29822565e9.4.1763638865053;
 Thu, 20 Nov 2025 03:41:05 -0800 (PST)
Date: Thu, 20 Nov 2025 11:41:03 +0000
In-Reply-To: <CA+i-1C2-DtH326ppTx6V_yJ3HX-H0b5i9GNnXb0Q5mUF-Kexdg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251117-b4-sev-gcov-objtool-v1-1-54f7790d54df@google.com>
 <CAMj1kXH8Yg+eeySUxJ7nRTm=nQWx5Tj4XirBjVrqXB-0Qn1=sA@mail.gmail.com>
 <CAMj1kXHiA91hH80tHFCO9QjkkfzEGZ2GJgpHnuKrusKhOULMXA@mail.gmail.com> <CA+i-1C2-DtH326ppTx6V_yJ3HX-H0b5i9GNnXb0Q5mUF-Kexdg@mail.gmail.com>
X-Mailer: aerc 0.21.0
Message-ID: <DEDHST3BOZVN.O39PP5JRRFTX@google.com>
Subject: Re: [PATCH] x86/sev: Disable GCOV on noinstr object
From: Brendan Jackman <jackmanb@google.com>
To: Brendan Jackman <jackmanb@google.com>, Ard Biesheuvel <ardb@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, <linux-kernel@vger.kernel.org>, 
	<llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon Nov 17, 2025 at 12:37 PM UTC, Brendan Jackman wrote:
> On Mon, 17 Nov 2025 at 12:52, Ard Biesheuvel <ardb@kernel.org> wrote:
>>
>> On Mon, 17 Nov 2025 at 12:40, Ard Biesheuvel <ardb@kernel.org> wrote:
>> >
>> > On Mon, 17 Nov 2025 at 12:11, Brendan Jackman <jackmanb@google.com> wr=
ote:
>> > >
>> > > With Debian clang version 19.1.7 (3+build5) there are calls to
>> > > kasan_check_write() from __sev_es_nmi_complete, which violates noins=
tr.
>> > > Fix it by disabling GCOV for the noinstr object, as has been done fo=
r
>> > > previous such instrumentation issues.
>> > >
>> > > Signed-off-by: Brendan Jackman <jackmanb@google.com>
>> > > ---
>> > > Details:
>> > >
>> > >  - =E2=9D=AF=E2=9D=AF  clang --version
>> > >    Debian clang version 19.1.7 (3+build5)
>> > >    Target: x86_64-pc-linux-gnu
>> > >    Thread model: posix
>> > >    InstalledDir: /usr/lib/llvm-19/bin
>> > >
>> > >  - Compiling from tip/master at 6f85aad74a70d
>> > >
>> > >  - Kernel config:
>> > >
>> > >    https://gist.githubusercontent.com/bjackman/bbfdf4ec2e1dfd0e18657=
174f0537e2c/raw/a88dcc6567d14c69445e7928a7d5dfc23ca9f619/gistfile0.txt
>> > >
>> > > Note I also get this error:
>> > >
>> > > vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x3b: relocation to !=
ENDBR: machine_kexec_prepare+0x810
>> > >
>> > > That one's a total mystery to me. I guess it's better to "fix" the S=
EV
>> > > one independently rather than waiting until I know how to fix them b=
oth.
>> > > ---
>> > >  arch/x86/coco/sev/Makefile | 3 +++
>> > >  1 file changed, 3 insertions(+)
>> > >
>> > > diff --git a/arch/x86/coco/sev/Makefile b/arch/x86/coco/sev/Makefile
>> > > index 3b8ae214a6a64de6bb208eb3b7c8bf12007ccc2c..d2ceae587b6c30b2fb17=
209a7426e7893dea988c 100644
>> > > --- a/arch/x86/coco/sev/Makefile
>> > > +++ b/arch/x86/coco/sev/Makefile
>> > > @@ -8,3 +8,6 @@ UBSAN_SANITIZE_noinstr.o        :=3D n
>> > >  # GCC may fail to respect __no_sanitize_address or __no_kcsan when =
inlining
>> > >  KASAN_SANITIZE_noinstr.o       :=3D n
>> > >  KCSAN_SANITIZE_noinstr.o       :=3D n
>> > > +
>> > > +# Clang 19 and older may fail to respect __no_sanitize_address when=
 inlining
>> > > +GCOV_PROFILE_noinstr.o         :=3D n
>> > >
>> >
>> > After Thomas dug into this issue a while ago, I meant to follow up
>> > with a fix, or at least something to start the discussion.
>> >
>> > TL;DR there is nothing wrong with either compiler (as far as this
>> > issue is concerned)
>> >
>> > The issue is that KASAN/KCSAN enabled builds use a version of
>> > set_bit() that unconditionally inserts a call to
>>
>> instrument_atomic_write(), which calls the KASAN/KCSAN intrinsics
>> directly, and these are usually only called by compiler generated
>> code.
>>
>> This completely defeats the noinstr per-function annotation, given
>> that each compilation unit only incorporates a single version of
>> set_bit(), which is the instrumented version unless instrumentation is
>> disabled for the entire file.
>>
>> For the short term, we could avoid this by using arch___set_bit()
>> directly in the SEV code that triggers this issue today. But for the
>> longer term, we should get write of those explicit calls to
>> instrumentation intrinsics, as this is fundamentally incompatible with
>> per-function overrides.
>>
>> https://lore.kernel.org/all/8734aqulch.ffs@tglx/T/#u
>
> Ah, yes thank you I think you are right. My GCOV "fix" seems to be
> bogus, it probably just hides the issue with incidental changes.

On the other hand, I guess the intermediate workaround of just disabling
it at the compilation unit still makes sense here, right?

i.e. my patch is still dumb but should we start by just doing
K{A,C}ASAN_SANITIZE_noinstr.o :=3D n instead?
