Received: from mail-yw1-f194.google.com (mail-yw1-f194.google.com [209.85.128.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAEA26738F
	for <llvm@lists.linux.dev>; Fri, 28 Feb 2025 13:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740747770; cv=none; b=X7R1kRmAcbsx0i2nm8Q+Ynr3I5BZfseTviCRcPTRFkQyK9FANJXJrgKOhZ8+Z+kevIyXNe4ImKUJQKm7Dsu6auTs3T5LH1A7RuiOI0LsVJbZGuPzQRN1JmaifUua/pR0YIryxMOHElgfEUyn5FrUAqOvoA0VaP+dvch0NoVyS70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740747770; c=relaxed/simple;
	bh=tRzOYM8tBmtCqwhYHEqwBdl63/LNhTeezyrXlRd4oys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=au6Fn+z2nNS/X1Wa5/N+y6xzviZlDyqetfluMywjRVage6AN5bqhNDCddAtjpITOekSQffLf49GnaqPM6/I5AYqWitXoDY1LWzju0FbVIqQag8gMY5nDmOGoqrAryuHCsc6UMKT4t+7E1HvmndRCFjfERU6cj5pFPuQE9v6ZjRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+9asPfM; arc=none smtp.client-ip=209.85.128.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+9asPfM"
Received: by mail-yw1-f194.google.com with SMTP id 00721157ae682-6f4b266d333so16169877b3.2
        for <llvm@lists.linux.dev>; Fri, 28 Feb 2025 05:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740747768; x=1741352568; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lxf1+JQlod0vaF1LjBgi2IcVLIhGNFVeduj0UU5pVvc=;
        b=a+9asPfMIdcrMo+a+8ML3eotd620gCLOWOqN6vK6W5i/pVlpLkYb2PSm0iUfhFelvX
         aWo5HOySeVkKWB7FvwmEsoHOh8Bnc+cYPsPWMgVjv2aOMhpDfVFJXPo9n5QRMLfyaYTU
         LuANeGe4TRh/lxGdMrCgrvoj/yn6BRB002dkNFy61cdNJ2T+X+vbUfh8+EgAs8xWcTTT
         m3yccejqlDzgMjEV+8XicORsOb7HY9zuADbM4eM7ZabjmxYZbAC6uyTh1S4pUTiaT7EM
         T7jOymHm+C/Uz3+w0puvlndnFbD3Wp/3bLzrTY1rTpSjSPSJdmOAc8kwaRrUg/52RKzT
         APUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740747768; x=1741352568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lxf1+JQlod0vaF1LjBgi2IcVLIhGNFVeduj0UU5pVvc=;
        b=oJmX3zPM+mFCTwAxDQ/kAFkdpTBgYfbdn8824AwmPYYvCvPLeCY1lh+EGTpUZM1cS7
         WXjoQi1eWuChNTaAczorlDG9OAM93aKJXaRU9jDlHiliYhSq77t48k+l3US5I6C8qClP
         ldXIEZ83DY3HzUjgP1NlnOX3l9WvnjT+GbEaZGQzxuSN1Sx+LexNumEygwsleGOUf+Za
         ZHFBXFWfLiLkYjoXJ1OsvNyRbJWzAqbkb1wih5IwMG9GyB1gWpfGRhK+NR/HFg5hDwsi
         aIoNjqF1LOrIImba8LpQYfqvmeWVcB5tgfg9CmLOEo07+dMRYMWyMUYpbMuvuwTz9qSA
         44CA==
X-Forwarded-Encrypted: i=1; AJvYcCV7GcXbG5KLIzEG1kr7o8rR4wWDSnhMa29g0ahyFT6RVPftuVQoDoL6//ghjF3J23WLY9SL@lists.linux.dev
X-Gm-Message-State: AOJu0YxorCuv/ceQ7EWUD0J8FQc8URjMmcB68r0RsmMU382XyJXvSVaW
	CFMZJVYmstuOEt8QqeyUiQuoHTjTZ9Tvo2cvSTE4+AAaelcOWqBL5e74ZuK36bs/xz+QHfE2HcI
	I92+y8RLpw0r+mcBkXPF9Gi5n75s=
X-Gm-Gg: ASbGncuGqE1WjDBuEYJEt4kyit0G94hED0Xhhn9BI1oP89soqBfsdCQB+qOJzqAJA+/
	bS45tuS7+r4vssaa8UQawRv61KvzMWWpSFiK4Ah1jOuk7SIHf+6o7bgYPNMJM27Zm/zY+cB3RBw
	E227BttWk=
X-Google-Smtp-Source: AGHT+IFxjntFYCrdKTcPea67JPxe+v5Sa9XZL4MVsSSpjMRa9cd1V2CipkdZZHMWHZoL7poCdPxCL7wYZBcjkNKu7qc=
X-Received: by 2002:a05:690c:7246:b0:6fb:b36b:300f with SMTP id
 00721157ae682-6fd4a12e751mr42505867b3.27.1740747767697; Fri, 28 Feb 2025
 05:02:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250226121537.752241-1-dongml2@chinatelecom.cn>
 <20250227165302.GB5880@noisy.programming.kicks-ass.net> <CADxym3YCZ5dqXMFesNaAF_Z2EWWCj0bJyKQ+BnNw2c=g39CRFA@mail.gmail.com>
 <20250228102646.GW11590@noisy.programming.kicks-ass.net>
In-Reply-To: <20250228102646.GW11590@noisy.programming.kicks-ass.net>
From: Menglong Dong <menglong8.dong@gmail.com>
Date: Fri, 28 Feb 2025 21:01:16 +0800
X-Gm-Features: AQ5f1JqrzWh6FiWmWs0NqkISwK6qGrIUKQAmD08_dgHluKZH96ief-KRhQb5Uq8
Message-ID: <CADxym3aECb5xOm0+YMycsx8kD6ijuEfMx6xrR9UKrH-FFn=KBw@mail.gmail.com>
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

On Fri, Feb 28, 2025 at 6:26=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Fri, Feb 28, 2025 at 05:53:07PM +0800, Menglong Dong wrote:
>
> > I tested it a little by enabling CFI_CLANG and the extra 5-bytes
> > padding. It works fine, as mostly CFI_CLANG use
> > CONFIG_FUNCTION_PADDING_BYTES to find the tags. I'll
> > do more testing on CFI_CLANG to make sure everything goes
> > well.
>
> I don't think you understand; please read:
>
> arch/x86/kernel/alternative.c:__apply_fineibt()
>
> and all the code involved with patching FineIBT. I think you'll find it
> very broken if you change anything here.
>
> Can you post an actual function preamble from a kernel with
> CONFIG_FINEIBT=3Dy with your changes on?
>
> Ex.
>
> $ objdump -wdr build/kernel/futex/core.o
>
> Disassembly of section .text:
>
> 0000000000000000 <__cfi_futex_hash>:
>        0:       b9 93 0c f9 ad          mov    $0xadf90c93,%ecx
>
> 0000000000000005 <.Ltmp0>:
>        5:       90                      nop
>        6:       90                      nop
>        7:       90                      nop
>        8:       90                      nop
>        9:       90                      nop
>        a:       90                      nop
>        b:       90                      nop
>        c:       90                      nop
>        d:       90                      nop
>        e:       90                      nop
>        f:       90                      nop
>
> 0000000000000010 <futex_hash>:
>       10:       f3 0f 1e fa             endbr64
>       14:       e8 00 00 00 00          call   19 <futex_hash+0x9>      1=
5: R_X86_64_PLT32      __fentry__-0x4
>       19:       8b 47 10                mov    0x10(%rdi),%eax
>
>
> Any change to the layout here *WILL* break the FineIBT code.
>
>
> If you want to test, make sure your build has FINEIBT=3Dy and boot on an
> Intel CPU that has CET-IBT (alderlake and later).

Yeah, I understand now. As I see the definition of CFI_PRE_PADDING, I
know that things is not as simple as I thought, as the layout can be differ=
ent
with different config. I'll dig it deeper on this part.

Thanks a lot for clearing that up for me. I'll test the CFI_CLANG and
FINEIBT together with this function later.

Thanks!
Menglong Dong
