Received: from mail-yw1-f195.google.com (mail-yw1-f195.google.com [209.85.128.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3850D258CCF
	for <llvm@lists.linux.dev>; Fri, 28 Feb 2025 09:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740736481; cv=none; b=cGx6v8QWcwY31FqHsliHraz4ccUpVoFOVtfGT1Yu/sM25JHjx+HADOdwQDXFwQR1CgHiVhq6jwxHvPtSuZekdPLjThVx4x5D8CPpqrqwxaxoIMAaU0Pj4hUI427JAvDdczn8MWdb62GcNoF0pnZi5fI6WibkBYOHnL4MfLtu9oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740736481; c=relaxed/simple;
	bh=WvLB4o8VqDbo0+yJXvdU93jyLfr8Tjsy9TVWiXEmjx8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U9H7ISHrPtHxFrKWu7wDwZJI+cLaph0op+jeLU1XEhRzwf3UiWqI4oYZNC6vIORE7lR5RxoE7cA+LZY601Lo7nlz+/A6VwyaQv6M5C0KIsB2+VfdnUITz/yzjOw5Fc+bX7tPyELc4NicrGJrg10Wfdw+kpSvSIz17KdTZS5gimA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JyydgmhR; arc=none smtp.client-ip=209.85.128.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JyydgmhR"
Received: by mail-yw1-f195.google.com with SMTP id 00721157ae682-6fb95249855so16416427b3.2
        for <llvm@lists.linux.dev>; Fri, 28 Feb 2025 01:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740736479; x=1741341279; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WnSNXJUHBXvGzpVRG5KhgAWl885WHp27TpnkoxblTDE=;
        b=JyydgmhREScaODyMyQRf6jMyNSaLrtMQQQ9y7CwEMVwMSnk1v2deVHmkaKQPJ7heYA
         GsObUxTCsT01ez/dc6SujvtJssINA8b42uLxMhf5AqtIJ+ZxCXbILO+uxFObG+N3Q8BU
         HvsLNJxHKuAxGEeQwoJyxqON6NEBEzvjeebHM4Av02g46logU7nx0Mb1r4Vfsx0MM2nS
         DNi8eUjUqQ0Au7r1E0RryFnukQ7vovKnQCE0q6pT1WBXj3c3TRIxo3XhxNpMsJQKHdcx
         aohhlltJ0gA9jQ7pV86wKNX1qS5WMxMBCv0/fxB4qnwN4FonUa56qhSigZTicCUAef1Z
         pIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740736479; x=1741341279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WnSNXJUHBXvGzpVRG5KhgAWl885WHp27TpnkoxblTDE=;
        b=BHbdo2tyufZQp7JhNjSM5RDE0uFhqcSZwpxj8bLx7m0fAMjjldOfGL+HJvntQPuNPf
         z4jJV/5XZs2Jcp4NoDPbIuoXIlROIt6TICM2eJwV0hIyhLmKN1XgLv6n1HerWy9eQnhj
         gleUHrgWYJSH9JvsrTZ5eRKJTG6mKvAoYDUm8KB7B1h5RXZs5EcAoY0K2iAGBS+6SdEb
         qVlEuiWwvIJQEZok6cxZbKaJ01LmVfku2m4oDhQU2FSfb9snQ84AbCfPEfKzTGNKNt8b
         TZdmwBNR31RBVVsXmxf00fWxyeZbMiMFdjnkoC65sZBCjBL8AFsZlfcT/pTuSfOhXeS/
         8cKw==
X-Forwarded-Encrypted: i=1; AJvYcCXkievSNsDkZ7NvzxsZIdopyUbGtw84awTOUZlNA+xcttFZdn9grziGX8KsaW4PEaF1Bg5d@lists.linux.dev
X-Gm-Message-State: AOJu0YxMu8lFz6ZXREjORCh6pRj3TSJ0QmJB7tzQYCYo2w+DMSRKHPsM
	jR1+gJnReOlBVu3wTAqsZ1AssNfLIkZP2rdVYfgxyoDE/74uN9tUb6QgND8OyYO1VBsRPterbjg
	epiCKzUlqyIchBjJdVVacsSLQ9Ko=
X-Gm-Gg: ASbGncu5ZJ0Dz3EbrzRRsI6iftpAOpMIuujipfLM7onxKSBh/sBNIa/Xmq+Uo7zUEQ5
	7lYod7okmpXk7xmEgFvQLkNa3NJLdRTDCWtIle/yD/+Nhy/IqatqbYCAfTEk7XaRmdzZub1K6KE
	EchwW7gm4=
X-Google-Smtp-Source: AGHT+IGw8NvEA4HXOWd3rIajp2/eYgmEUIZNbIrBrY8Iu6/IP8jSbJYy+8uslfAXjg82JCBbu4fs1sAGNeU5oaGcBbE=
X-Received: by 2002:a05:690c:6004:b0:6fd:2ed4:14a3 with SMTP id
 00721157ae682-6fd4a12a14cmr33364597b3.28.1740736479127; Fri, 28 Feb 2025
 01:54:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250226121537.752241-1-dongml2@chinatelecom.cn> <20250227165302.GB5880@noisy.programming.kicks-ass.net>
In-Reply-To: <20250227165302.GB5880@noisy.programming.kicks-ass.net>
From: Menglong Dong <menglong8.dong@gmail.com>
Date: Fri, 28 Feb 2025 17:53:07 +0800
X-Gm-Features: AQ5f1JoWhySTPkmaj1qPnc-nYUSHeu6CY0uMl7WEtgQouXZ_IyO9LsWxEjtp3pQ
Message-ID: <CADxym3YCZ5dqXMFesNaAF_Z2EWWCj0bJyKQ+BnNw2c=g39CRFA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2] add function metadata support
To: Peter Zijlstra <peterz@infradead.org>
Cc: rostedt@goodmis.org, mark.rutland@arm.com, alexei.starovoitov@gmail.com, 
	catalin.marinas@arm.com, will@kernel.org, mhiramat@kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	mathieu.desnoyers@efficios.com, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, dongml2@chinatelecom.cn, 
	akpm@linux-foundation.org, rppt@kernel.org, graf@amazon.com, 
	dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 12:53=E2=80=AFAM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> On Wed, Feb 26, 2025 at 08:15:37PM +0800, Menglong Dong wrote:
>
> > In x86, we need 5-bytes to prepend a "mov %eax xxx" insn, which can hol=
d
> > a 4-bytes index. So we have following logic:
> >
> > 1. use the head 5-bytes if CFI_CLANG is not enabled
> > 2. use the tail 5-bytes if MITIGATION_CALL_DEPTH_TRACKING is not enable=
d
> > 3. compile the kernel with extra 5-bytes padding if
> >    MITIGATION_CALL_DEPTH_TRACKING and CFI_CLANG are both enabled.
>
> 3) would result in 16+5 bytes padding, what does that do for alignment?

Hi Peter, thank you for your reply~

Yeah, it will make the function not 16 byte aligned, and this is
the most pointer that I hesitate in.

In this link, I tested the performance with 16+5 bytes padding,
and it seems that the performance is not impacted:

https://lore.kernel.org/bpf/CADxym3af+CU5Mx8myB8UowdXSc3wJOqWyH4oyq+eXKahXB=
TXyg@mail.gmail.com/

However, it may have other effects if the function is unaligned.
I don't know either. :/

Do you have any advice here? Such as, we'd better make the
padding 32 bytes instead in case 3 :/

>
> Functions should be 16 byte aligned.
>
> Also, did you make sure all the code in arch/x86/kernel/alternative.c
> still works? Because adding extra padding in the CFI_CLANG case moves
> where the CFI bytes are emitted and all the CFI rewriting code goes
> sideways.

I tested it a little by enabling CFI_CLANG and the extra 5-bytes
padding. It works fine, as mostly CFI_CLANG use
CONFIG_FUNCTION_PADDING_BYTES to find the tags. I'll
do more testing on CFI_CLANG to make sure everything goes
well.

Thanks!
Menglong Dong

>
