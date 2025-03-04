Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com [209.85.219.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0C41E2847
	for <llvm@lists.linux.dev>; Tue,  4 Mar 2025 07:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741074564; cv=none; b=SFiB4K0fg/wQ5JB1zcVnqqv6VpGmWzcFN2DZbg5zxUiN1iLE/2QeSjNW67owNw2+QCTnLtt9JfC9wAZCcrSlXCrMyArhBYP80r75xsF5SPEZ/13GvWde4n2t6dGtBxo5q9V9XH4kqB8OzL0vsR5Olz9rjPeFmMPzXUAleOq5mBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741074564; c=relaxed/simple;
	bh=Dt6WM9Do5YGhDLFGqYM/u7bPWD/DIrQaFE1MP/R4ykU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pXNCfPCKG9HOfENklPqj3gVMFY/qPWVYktewvBzD79Rr1DA+Oz3pW48IRmE21T00aMwAPhhKb8T336cVAKuefTy6eG091ph64X9Z9grQeaqhO7g5RQGfTF1cfQtqhdnAYi0saLguk7SP5Q5bIHazcS83yOO7L+KTPukeoT36Tcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WH9G2aYn; arc=none smtp.client-ip=209.85.219.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WH9G2aYn"
Received: by mail-yb1-f196.google.com with SMTP id 3f1490d57ef6-e53a91756e5so4322115276.1
        for <llvm@lists.linux.dev>; Mon, 03 Mar 2025 23:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741074562; x=1741679362; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MLjKK0cvD8Zt+dIvBMKOKHc8gKJeqqPNHGFjCQlnXE=;
        b=WH9G2aYnMteDMNE5zDbKkzBzsSlKgm/iuy4aw1QJlDb1ot5yv3SQzzGzWDYMvWVUiD
         CG5UbUTEQXqT7t6kKtQbpx5J1OAQ7hh08Ne5/Vl+ahyqdyMOAeQ4nWa37QnjqT954DsY
         NTWxBA9xCixu7vyq8feC3UjwKJTCE7gOfyTV0hmyZC00QbAMQaOSia5TP0McCMzFPGAN
         lfrXsKw70OYyhBL4Qqv26GBVU2Mfg2SC7zXAor6Xi/rvATeslSIF8+3bexHj0TX3ROzh
         oxISJvh4IRjU/BMNFf16mHj3bQvyA9biwuLuIzEJ0sjuCNqTaNCrFZlc718qFZ5Q23xn
         DH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741074562; x=1741679362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2MLjKK0cvD8Zt+dIvBMKOKHc8gKJeqqPNHGFjCQlnXE=;
        b=KzLwZS8WaVFefDmNl3wFjZIktfNiW1dy4rjLsHE8tufgkZF/4/zgIK/ULZli/uRs1O
         hyRM/s2vlbhG0AXwGZjGa7iug2xP+55nMOqItgjUS9/1VwE1XujoU0GEmDr3vrMGlc2x
         jkZEYpfeFCG7p+clQDhLEGGUDviNtHt7FWYUuGu+3TqQox3m/WOHuYk9eRG6NGv+TDAV
         UMVkFmzSoMasgXro88ZXl7pXEfTWD+1F6wDiFt0zuW+UJXWv4ID1IXrTDIpoSFEbc0/o
         yjjCSqcnqeO3aUIb+DUgTTxfcIFhMnXTA/yPTcZiZsxw7DJSRFgBLNZ+yon24I/Qk+Y7
         BDUw==
X-Forwarded-Encrypted: i=1; AJvYcCW61x1PXdpFLyZGZ3M76VALrRzzwYQsawFx1NigBFAQtgPzf9E/itICD7l4hN7JbA5scMQ9@lists.linux.dev
X-Gm-Message-State: AOJu0Yxc0RcY676+OX0GtSp1Fz1ts9N0dMOMHoqQxpS4RZyD/sDuoPog
	vprnwuTKpUGjdGAE0FbcAF5mWISXndPalR1aYtaOvVr4dh1Djt3iDGYjVGCHyDKUh9ioBs/U50F
	eGO/DxNOWggqx+QTBGnTLgPmSHoE=
X-Gm-Gg: ASbGncsNdjbramWGvm6pvXj8UDwjJDDlQ5jPZaLk5jScHkgrRxrkvNsZhZ0tTtC/9YS
	1kLrkpELjfCsrwR/vXQzKb2US7HhNZBo+1gMpQvodZiNfoEYwW3qwUEgNB0VniUw8jWi8+QHnLb
	LS+J4c6kml1zgS9tsEY7HkN/25wQ==
X-Google-Smtp-Source: AGHT+IERTf+79jPOAvgx5KP2sLqUID7azBWzz7vasRRAB5uE+reXBmF+MEHBwltFPdH76/XUj+vMxqm/piVzmLTWLrk=
X-Received: by 2002:a05:690c:3705:b0:6fd:42bc:4f48 with SMTP id
 00721157ae682-6fd4a03af71mr198978757b3.21.1741074561900; Mon, 03 Mar 2025
 23:49:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250303132837.498938-1-dongml2@chinatelecom.cn>
 <20250303132837.498938-2-dongml2@chinatelecom.cn> <20250303165454.GB11590@noisy.programming.kicks-ass.net>
 <CADxym3aVtKx_mh7aZyZfk27gEiA_TX6VSAvtK+YDNBtuk_HigA@mail.gmail.com>
 <20250304053853.GA7099@noisy.programming.kicks-ass.net> <20250304061635.GA29480@noisy.programming.kicks-ass.net>
In-Reply-To: <20250304061635.GA29480@noisy.programming.kicks-ass.net>
From: Menglong Dong <menglong8.dong@gmail.com>
Date: Tue, 4 Mar 2025 15:47:45 +0800
X-Gm-Features: AQ5f1JoFjrmEt-nBO6x3FpzDHAp0t94q6jSotwVIU7T4XlsHd98OlAn-MH-sW3s
Message-ID: <CADxym3bS_6jpGC3vLAAyD20GsR+QZofQw0_GgKT8nN3c-HqG-g@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] x86/ibt: factor out cfi and fineibt offset
To: Peter Zijlstra <peterz@infradead.org>
Cc: rostedt@goodmis.org, mark.rutland@arm.com, alexei.starovoitov@gmail.com, 
	catalin.marinas@arm.com, will@kernel.org, mhiramat@kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, yonghong.song@linux.dev, john.fastabend@gmail.com, 
	kpsingh@kernel.org, sdf@fomichev.me, jolsa@kernel.org, davem@davemloft.net, 
	dsahern@kernel.org, mathieu.desnoyers@efficios.com, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, samitolvanen@google.com, 
	kees@kernel.org, dongml2@chinatelecom.cn, akpm@linux-foundation.org, 
	riel@surriel.com, rppt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 2:16=E2=80=AFPM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> On Tue, Mar 04, 2025 at 06:38:53AM +0100, Peter Zijlstra wrote:
> > On Tue, Mar 04, 2025 at 09:10:12AM +0800, Menglong Dong wrote:
> > > Hello, sorry that I forgot to add something to the changelog. In fact=
,
> > > I don't add extra 5-bytes anymore, which you can see in the 3rd patch=
.
> > >
> > > The thing is that we can't add extra 5-bytes if CFI is enabled. Witho=
ut
> > > CFI, we can make the padding space any value, such as 5-bytes, and
> > > the layout will be like this:
> > >
> > > __align:
> > >   nop
> > >   nop
> > >   nop
> > >   nop
> > >   nop
> > > foo: -- __align +5
> > >
> > > However, the CFI will always make the cfi insn 16-bytes aligned. When
> > > we set the FUNCTION_PADDING_BYTES to (11 + 5), the layout will be
> > > like this:
> > >
> > > __cfi_foo:
> > >   nop (11)
> > >   mov $0x12345678, %reg
> > >   nop (16)
> > > foo:
> > >
> > > and the padding space is 32-bytes actually. So, we can just select
> > > FUNCTION_ALIGNMENT_32B instead, which makes the padding
> > > space 32-bytes too, and have the following layout:
> > >
> > > __cfi_foo:
> > >   mov $0x12345678, %reg
> > >   nop (27)
> > > foo:
> >
> > *blink*, wtf is clang smoking.
> >
> > I mean, you're right, this is what it is doing, but that is somewhat
> > unexpected. Let me go look at clang source, this is insane.
>
> Bah, this is because assemblers are stupid :/
>
> There is no way to tell them to have foo aligned such that there are at
> least N bytes free before it.
>
> So what kCFI ends up having to do is align the __cfi symbol to the
> function alignment, and then stuff enough nops in to make the real
> symbol meet alignment.
>
> And the end result is utter insanity.
>
> I mean, look at this:
>
>       50:       2e e9 00 00 00 00       cs jmp 56 <__traceiter_initcall_l=
evel+0x46>     52: R_X86_64_PLT32      __x86_return_thunk-0x4
>       56:       66 2e 0f 1f 84 00 00 00 00 00   cs nopw 0x0(%rax,%rax,1)
>
> 0000000000000060 <__cfi___probestub_initcall_level>:
>       60:       90                      nop
>       61:       90                      nop
>       62:       90                      nop
>       63:       90                      nop
>       64:       90                      nop
>       65:       90                      nop
>       66:       90                      nop
>       67:       90                      nop
>       68:       90                      nop
>       69:       90                      nop
>       6a:       90                      nop
>       6b:       b8 b1 fd 66 f9          mov    $0xf966fdb1,%eax
>
> 0000000000000070 <__probestub_initcall_level>:
>       70:       2e e9 00 00 00 00       cs jmp 76 <__probestub_initcall_l=
evel+0x6>      72: R_X86_64_PLT32      __x86_return_thunk-0x4
>
>
> That's 21 bytes wasted, for no reason other than that asm doesn't have a
> directive to say: get me a place that is M before N alignment.
>
> Because ideally the whole above thing would look like:
>
>       50:       2e e9 00 00 00 00       cs jmp 56 <__traceiter_initcall_l=
evel+0x46>     52: R_X86_64_PLT32      __x86_return_thunk-0x4
>       56:       66 2e 0f 1f 84          cs nopw (%rax,%rax,1)
>
> 000000000000005b <__cfi___probestub_initcall_level>:
>       5b:       b8 b1 fd 66 f9          mov    $0xf966fdb1,%eax
>
> 0000000000000060 <__probestub_initcall_level>:
>       60:       2e e9 00 00 00 00       cs jmp 76 <__probestub_initcall_l=
evel+0x6>      72: R_X86_64_PLT32      __x86_return_thunk-0x4

Hi, peter. Thank you for the testing, which is quite helpful
to understand the whole thing.

I was surprised at this too. Without CALL_PADDING, the cfi is
nop(11) + mov; with CALL_PADDING, the cfi is mov + nop(11),
which is weird, as it seems that we can select CALL_PADDING if
CFI_CLANG to make things consistent. And I  thought that it is
designed to be this for some reasons :/

Hmm......so what should we do now? Accept and bear it,
or do something different?

I'm good at clang, so the solution that I can think of is how to
bear it :/

According to my testing, the text size will increase:

~2.2% if we make FUNCTION_PADDING_BYTES 27 and select
FUNCTION_ALIGNMENT_16B.

~3.5% if we make FUNCTION_PADDING_BYTES 27 and select
FUNCTION_ALIGNMENT_32B.

We don't have to select FUNCTION_ALIGNMENT_32B, so the
worst case is to increase ~2.2%.

What do you think?

Thanks!
Menglong Dong

>
>
>
