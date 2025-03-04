Received: from mail-yw1-f195.google.com (mail-yw1-f195.google.com [209.85.128.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4049D1FBEAD
	for <llvm@lists.linux.dev>; Tue,  4 Mar 2025 08:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741077788; cv=none; b=N6LODf3AP2lEZcxnjTKhR99JYEcD7yAI58uW/ZLq/PVoanBrNhAvhTB4Z9m3TPZrFscRahcvbmXLdLO2W33OZL8LiDK/QwrG+ulMAz9sHSdPs0ep/QUKBfPNtOp1TFzJgOUahON819+6fBBUFWQiCD7J0WJb3eHHwXwUhGnk+Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741077788; c=relaxed/simple;
	bh=dTtL6Jur3atffX/frcpKEb7wF2vN7b/LS2OXFn6lV18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JCCAtgq73Azul9iWH+zej79xoa1b+hIgaZ1rrZgPvxTFofxsmQWPLmKbM7RlM2bPNkRjtIRFV3ucs0jke0WTBbb7NpLWQWKq4K5IR1dQV6NoP4ciTLz+JFfCIRf5FAS2jJrKH9vC4RrZN/WLqG89VAFQz+dtLBGNq0I0zIk9cT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/6vr8sX; arc=none smtp.client-ip=209.85.128.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/6vr8sX"
Received: by mail-yw1-f195.google.com with SMTP id 00721157ae682-6fd30144fe1so37821377b3.1
        for <llvm@lists.linux.dev>; Tue, 04 Mar 2025 00:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741077786; x=1741682586; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7DJBIx3iIusUVOEMB5nnJFYTmd3nur6e8lzlUxwqLk=;
        b=H/6vr8sXSoA21ML145rN/4aG3UDeqnAd8YDB/21fwkDiCv0pZXOyor834NccAURVan
         5qBdHyD/4theoL0WE6jafXwf5WnsWpk4iiQxziwzAmUniItej4H5kPSX5gRF7JtrZ46F
         5WnK9DCFjr5T08m95U4Q/nQ9SzYI19WjfeplYJHL7uiD9NqjrbWCUFP3JBExtvH/PiCZ
         eJjAy/5Oq8zvsYLmsFpjCQWzDlcsYuksnDap+a7hkNkGU7PelSKt88JdeMBUOfRWR9xB
         Ffvk4GIGw09P8i+5OrityBX2JcaJf/By7h1lUlRKDkByQp+jTtT18NUDkjB1k3ZUXKRc
         Zygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741077786; x=1741682586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H7DJBIx3iIusUVOEMB5nnJFYTmd3nur6e8lzlUxwqLk=;
        b=PTNt9tSXwydWtblxgn9PhyD41t1716z6Od8CaCf2Z4aT3tazNu9JyPYaVz0RFfog44
         CyvPmaLX0Q6UtOQqaEgQQjqg5qbk96F6SlfXt79/kChhpv4nShdgUsvSd6eX42xe5DOc
         bWuamKvK/dHRZBMmPrmxljCAedDHRIMKfxIyth8eluYz20FG68CIsBZBanev5QKB6Jy4
         OYe/JOqgrPObu12tcU2wPPfsKj/PfYqzkAA7wBEi8OZchSrF6RymOLlUoMZQ6xW1Usxq
         CJBNnOlP5EbBZ7zPCSXEDdQ5WjGh5C7FIGvCA+UNqdBwlubuGPKbaVLVxTN3WdyLsg3y
         9eIw==
X-Forwarded-Encrypted: i=1; AJvYcCXpIHDF/SNcLn3PW4h0esUmV9uouhhFGjRFU7SGPB+kC+sTmYbqwm08ZGWq/Q85WLOJX2Al@lists.linux.dev
X-Gm-Message-State: AOJu0Yxo6jZ5hoo+CO6i0hDJBcgEpKkn6/DpK6W0Asix02uRsg9zX4uC
	KTRxMDaocJhtz129162cFTDHY0TmHchsPLLVx+bpgM/uj1Rc3ciBRD+oNoS3NOg+2Zfyj+oX2Kx
	okmAmzhVKZefUmQYEe8SKOusWTEw=
X-Gm-Gg: ASbGncuwlnHaId2K6IV+xMyxFYGXkgYQ/Ld+ifNwyqwRxA9d+Vhm0DSzbFRPxA+i49H
	+3scVLrtpgtEd9MRq5N+CiW+vy5BysxHGR/brhI3WLclop47Y36Cl3YLm5WU6D/IGrl+uS6Yiu3
	MkaO37iPtoBvX7zs5kzzCeF1kCCw==
X-Google-Smtp-Source: AGHT+IFwKhleghfxmR4fo46mZcDQS529bArSvfkTfmrf2+HZom9bVtkcaUWWW29c+BaFyOYjznUloBGTXBdQLw3Z1i8=
X-Received: by 2002:a05:690c:6303:b0:6fd:3f88:e0a9 with SMTP id
 00721157ae682-6fd49e2a409mr227818067b3.0.1741077786117; Tue, 04 Mar 2025
 00:43:06 -0800 (PST)
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
 <CADxym3bS_6jpGC3vLAAyD20GsR+QZofQw0_GgKT8nN3c-HqG-g@mail.gmail.com>
In-Reply-To: <CADxym3bS_6jpGC3vLAAyD20GsR+QZofQw0_GgKT8nN3c-HqG-g@mail.gmail.com>
From: Menglong Dong <menglong8.dong@gmail.com>
Date: Tue, 4 Mar 2025 16:41:29 +0800
X-Gm-Features: AQ5f1Jq2_mS0v23bn6W1X-IWDb9MW8dDTnlwz6_dNKl9ybY4p55hAFXAjC92mhs
Message-ID: <CADxym3bS6XdGFhKeEm5TKD-_ubEQB+yTrd=7_L_CDn4xthe-Vg@mail.gmail.com>
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

On Tue, Mar 4, 2025 at 3:47=E2=80=AFPM Menglong Dong <menglong8.dong@gmail.=
com> wrote:
>
> On Tue, Mar 4, 2025 at 2:16=E2=80=AFPM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
> >
> > On Tue, Mar 04, 2025 at 06:38:53AM +0100, Peter Zijlstra wrote:
> > > On Tue, Mar 04, 2025 at 09:10:12AM +0800, Menglong Dong wrote:
> > > > Hello, sorry that I forgot to add something to the changelog. In fa=
ct,
> > > > I don't add extra 5-bytes anymore, which you can see in the 3rd pat=
ch.
> > > >
> > > > The thing is that we can't add extra 5-bytes if CFI is enabled. Wit=
hout
> > > > CFI, we can make the padding space any value, such as 5-bytes, and
> > > > the layout will be like this:
> > > >
> > > > __align:
> > > >   nop
> > > >   nop
> > > >   nop
> > > >   nop
> > > >   nop
> > > > foo: -- __align +5
> > > >
> > > > However, the CFI will always make the cfi insn 16-bytes aligned. Wh=
en
> > > > we set the FUNCTION_PADDING_BYTES to (11 + 5), the layout will be
> > > > like this:
> > > >
> > > > __cfi_foo:
> > > >   nop (11)
> > > >   mov $0x12345678, %reg
> > > >   nop (16)
> > > > foo:
> > > >
> > > > and the padding space is 32-bytes actually. So, we can just select
> > > > FUNCTION_ALIGNMENT_32B instead, which makes the padding
> > > > space 32-bytes too, and have the following layout:
> > > >
> > > > __cfi_foo:
> > > >   mov $0x12345678, %reg
> > > >   nop (27)
> > > > foo:
> > >
> > > *blink*, wtf is clang smoking.
> > >
> > > I mean, you're right, this is what it is doing, but that is somewhat
> > > unexpected. Let me go look at clang source, this is insane.
> >
> > Bah, this is because assemblers are stupid :/
> >
> > There is no way to tell them to have foo aligned such that there are at
> > least N bytes free before it.
> >
> > So what kCFI ends up having to do is align the __cfi symbol to the
> > function alignment, and then stuff enough nops in to make the real
> > symbol meet alignment.
> >
> > And the end result is utter insanity.
> >
> > I mean, look at this:
> >
> >       50:       2e e9 00 00 00 00       cs jmp 56 <__traceiter_initcall=
_level+0x46>     52: R_X86_64_PLT32      __x86_return_thunk-0x4
> >       56:       66 2e 0f 1f 84 00 00 00 00 00   cs nopw 0x0(%rax,%rax,1=
)
> >
> > 0000000000000060 <__cfi___probestub_initcall_level>:
> >       60:       90                      nop
> >       61:       90                      nop
> >       62:       90                      nop
> >       63:       90                      nop
> >       64:       90                      nop
> >       65:       90                      nop
> >       66:       90                      nop
> >       67:       90                      nop
> >       68:       90                      nop
> >       69:       90                      nop
> >       6a:       90                      nop
> >       6b:       b8 b1 fd 66 f9          mov    $0xf966fdb1,%eax
> >
> > 0000000000000070 <__probestub_initcall_level>:
> >       70:       2e e9 00 00 00 00       cs jmp 76 <__probestub_initcall=
_level+0x6>      72: R_X86_64_PLT32      __x86_return_thunk-0x4
> >
> >
> > That's 21 bytes wasted, for no reason other than that asm doesn't have =
a
> > directive to say: get me a place that is M before N alignment.
> >
> > Because ideally the whole above thing would look like:
> >
> >       50:       2e e9 00 00 00 00       cs jmp 56 <__traceiter_initcall=
_level+0x46>     52: R_X86_64_PLT32      __x86_return_thunk-0x4
> >       56:       66 2e 0f 1f 84          cs nopw (%rax,%rax,1)
> >
> > 000000000000005b <__cfi___probestub_initcall_level>:
> >       5b:       b8 b1 fd 66 f9          mov    $0xf966fdb1,%eax
> >
> > 0000000000000060 <__probestub_initcall_level>:
> >       60:       2e e9 00 00 00 00       cs jmp 76 <__probestub_initcall=
_level+0x6>      72: R_X86_64_PLT32      __x86_return_thunk-0x4
>
> Hi, peter. Thank you for the testing, which is quite helpful
> to understand the whole thing.
>
> I was surprised at this too. Without CALL_PADDING, the cfi is
> nop(11) + mov; with CALL_PADDING, the cfi is mov + nop(11),
> which is weird, as it seems that we can select CALL_PADDING if
> CFI_CLANG to make things consistent. And I  thought that it is
> designed to be this for some reasons :/
>
> Hmm......so what should we do now? Accept and bear it,
> or do something different?
>
> I'm good at clang, so the solution that I can think of is how to

*not good at*

> bear it :/
>
> According to my testing, the text size will increase:
>
> ~2.2% if we make FUNCTION_PADDING_BYTES 27 and select
> FUNCTION_ALIGNMENT_16B.
>
> ~3.5% if we make FUNCTION_PADDING_BYTES 27 and select
> FUNCTION_ALIGNMENT_32B.
>
> We don't have to select FUNCTION_ALIGNMENT_32B, so the
> worst case is to increase ~2.2%.
>
> What do you think?
>
> Thanks!
> Menglong Dong
>
> >
> >
> >
