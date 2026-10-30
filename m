Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793386596;
	b=Z7GQodiswEhc0o9QL9ZvzgLhM78U6H0X6OwWm21mrS+c3hZ+bOrEHstE3ajiinslN6G+
	 pEVsb1qUY+2Zt7eekfr+KRMJZpzRwK/eOJoyUEtRjIFUmA/LZ+4nb3EvDi4IUHhmNCxqa
	 ieQPR9YlB0H1eMlaAwlb8dQLRHu1KnGRw8ENvoPTeDK76+5uZSvq0lsOEidMxIFhvWRhl
	 y6lz3g4HS8mUtjPAJNQBJzyYKKM9PlEepGxK17QSeKLh+U1XyLv4zBEkjfBr/f2wZYyMU
	 gDIpfF133K8KcOETA+GQ7VwEOgCW2umSPTPW7/A2Xy5ZUKFrRJ+lnqSWwZZ2F2NES0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793386596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=qwJWwP3g6tAfkz/cEaB4qEA59hJRgAI++mvseIiCl4E=;
	b=dCMyvO2ETlubbg9ujaKmvxTnFrBrEx5w0mspLNOCWrQrsJib9gLMIi6hk8gKhCwAUXsk
	 6PE8LbdhNclu9Cr+4CS+Dv+4KFg8fBLADAsRFeTbGTlFvaobKVGZWW8acOWigEfxf2dNM
	 0UdK3qaSuwIw+U1ZKTU+oT7WbKs54gPtp7AVe5PDpvd0/vZ2uAljN7anCQ02NLIM3eiGb
	 GSUlPt3damIpJUY8JaaKFoh/jOBn2DSze9w6yw/6LwN2KdUeicpmYtouiJOV8In0BRLPT
	 qlU8y+allKoMusHAYf3zjyXlKBbIUvcQpGVEGpmXDI6ROmpD14fLCkqgoSiHeCY4TxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Q5mH7QRA;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224C0606A31C
	for <llvm@lists.linux.dev>; Fri, 30 Oct 2026 18:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 224C0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Q5mH7QRA
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c43fbcb4393so165835066b.0
        for <llvm@lists.linux.dev>; Fri, 30 Oct 2026 11:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793386593; x=1793991393; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qwJWwP3g6tAfkz/cEaB4qEA59hJRgAI++mvseIiCl4E=;
        b=Q5mH7QRADX1p4TKpJPufni/J+NVNGOpKoJ+Td2Y9F3lk/5gTR1gDtxS0KL2hx9W+b7
         F6qzU4ApdQe93D1oYgVS1qJuhSiSbTaGYRrRQnw87uHf5Ug6wOqS8f72de9ZsutYrOsB
         +MZEAZSJ6ZQcV4G5kadq+JoNH32dJo4dFXAgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793386593; x=1793991393;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qwJWwP3g6tAfkz/cEaB4qEA59hJRgAI++mvseIiCl4E=;
        b=LZgogw/HQFHoen7a9HPokZiDIXe3aJ5SIKKiRAcQrLN3cbHO5Sp0mUDEAid62qjNcw
         48KpMgZ1KozijhC4y7gwj0HkZ5Y7easXjV8A1Jw/s2phiwNqv+Crk7vMMlZV50BKJcaJ
         WYb/mSTIvIeB6mLfLk3HrIkD0n1H+PNs6I6GgGPiGlRAiY/NpjsZcL0Ss761bg1RnxA8
         1nX+8ZXyZ2BndqhTGMV/NVxMqC0RfZ0CjepA/Mkl/dR/Nxmmrr07xXWFjtiAzmrjG1jf
         hXsq+BvfFI7Ak2MWKcKY2o3vqO8tfWeZeZJ1BCaS8ZoXZHUxizEIQl0AVRGc092OUI6I
         +dYA==
X-Forwarded-Encrypted: i=1; AKwUvBy8B11fKnjE7KZ0t6ywrX/OXzHOqXaJ77siwY7tF7tbm/nQ9lkfXJBDtTIOi+XLXgBZyB/p@lists.linux.dev
X-Gm-Message-State: AFq9FYLVf+yoqgIFvqt13qTEdNHlRhoYwFV0GFU9Ghwk6cMSKCjjlxh4
	DOM29cC6DLbDr85j1IjKH/n44mTW243rmLjzM/NvlgvL/TvkL3XDcBZT4i8SzInKxQ0zPg8xVm1
	6fnTz06ajTQ==
X-Gm-Gg: AYBFou3MRxKfJOz0qt7+0Vz7KV9OA8qR3vpg1uJvbIlI7FDouWo5Q3z3oORY1qHHhXI
	gqI4LA1mIXwc78/RBtHJE/tdRamff7MKdFSW5IdjxYeQ3svpZ8atlGJA37FRVioDTfQcNf9ubu7
	9QtXMCLYy2hhBqaDdYlISaZyo6VWbPcK/UDULsU7oRA2hT7925svlvy6Dri+QhuZVAdRGJ5QJAz
	3PfgZV6hPfh0TAq6IsZmA+S06ha6d8aYnlhNBoxdW3HjpTJDXs6LJ0UhVaNVNtCFQ1wnEzCedB0
	ibFxL03fSHdcXXYOiFcflAuDDAO7tgyvyO+uIbKBJBLsL7/NhoTJ7mMleKaTZ/kRakaVeefQ5y9
	SIs5F2hEp+8DZpPhVTNL6X9deQKDGl+h8F8qrw+JYHT3MUtb0V6YyEj+fqtsJkIU2d+MbBpWxmW
	OJ4+FrF0eLK5xhJ2fplfCz1fpmwLOUV6fE/1G2fVx2sjSoOurke7A3DZ2ax1daF7ELh7uEcED1D
	3bW/3G/Y3zYQX0OZ9+J/O8RJ7zzslpGGYe15LQXf+ZLvqa4PbM99QedJ3O8yI+vvUrk5E3IeC2r
	LC8vzu5SbHavxb72S8bsADC/TP+54dEB70Do5hM95M3bTK5CUiurU+SlZ1XRzIfJy2Kgy8HS1L4
	AVPU=
X-Received: by 2002:a17:907:3d91:b0:c43:6d40:4f84 with SMTP id a640c23a62f3a-c4ca793b9c1mr321145666b.4.1793386593428;
        Fri, 30 Oct 2026 11:56:33 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe5006dsm96276066b.64.2026.10.30.11.56.31
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 11:56:32 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4395d31228so156372966b.1
        for <llvm@lists.linux.dev>; Fri, 30 Oct 2026 11:56:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBytiPoLRpnCUEYBBFEajfTo1WzcaJ1iuwcLzLQ5m0QdH/v0ku48OhWNjAFZ1Vhx7a8TZqI4@lists.linux.dev
X-Received: by 2002:a17:907:868a:b0:c2e:2baa:a642 with SMTP id
 a640c23a62f3a-c4ca7a820acmr296788566b.30.1793386591702; Fri, 30 Oct 2026
 11:56:31 -0700 (PDT)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261029-syscall-table-dispatch-v1-1-bca9dbb886de@debian.org>
 <20261029104938.GC1813469@noisy.programming.kicks-ass.net> <auM6mSXz-BVIjYBc@gmail.com>
In-Reply-To: <auM6mSXz-BVIjYBc@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 30 Oct 2026 08:56:12 -1000
X-Gmail-Original-Message-ID: <CAHk-=wjg-mre6diNHCTYUtc=X26462GGxgJMw8cE20Wh1-5qBQ@mail.gmail.com>
X-Gm-Features: AclHuK_EBJ3wPAnKsa-UdINhCLjKmdtp9kbTuYP5pivJG48qq7NWVv3lpi6gafk
Message-ID: <CAHk-=wjg-mre6diNHCTYUtc=X26462GGxgJMw8cE20Wh1-5qBQ@mail.gmail.com>
Subject: Re: [PATCH RFC] x86/syscall: Dispatch via sys_call_table when Spectre
 v2 and BHI are off
To: Breno Leitao <leitao@debian.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Oct 2026 at 02:30, Breno Leitao <leitao@debian.org> wrote:
>
> With "x86_64/entry: Unconditionally use -fno-jump-table", x64_sys_call()
> becomes a compare tree on every x86_64 build, so system call dispatch is
> the same whether the mitigations are disabled at boot or at build time,
> which is basically my end goal.

You're basically saying "with that patch, both cases do equally badly
whether disabled at boot or build time".

That's not a good end goal. You want both cases to do equally *well*.

I do wonder if we could do computed jumps. It would be lovely if we
could basically do something like

      # syscall number in %rax
      leaq table(%rax,%rax,4),%rax
      jmp *%rax
table:
     jmp syscall0
     jmp syscall1
     jmp syscall2
    ....

and avoid any indirect memory lookup or indirect branches (outside of
the one computed one). And no extra call/ret frame.

It's possible that the branch prediction hardware hates those kinds of
very dense jmp patterns, though. I don't know.

We could have a single static jump that picks between this one and the
"conditional branch tree" version, as in your patch at the beginning
of the thread.

             Linus
