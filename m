Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2A430CF1
	for <llvm@lists.linux.dev>; Mon,  4 Dec 2023 18:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XNnxNPjT"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-7c59ac49f12so1385586241.1
        for <llvm@lists.linux.dev>; Mon, 04 Dec 2023 10:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701716367; x=1702321167; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhTNasiWgh+dkfX0Dm+ISFeJznRbPndi9WOsk0B0xUY=;
        b=XNnxNPjTSiARdPaZgn3SzSc/ePoWNlz79Qsjo8uQe0SXA90rjspS1gjkw2TEeRbEoC
         Jj4h7rAX7tpRKwYT2Lvrugb5qxbmONMtzLPJdqBYInFhmt9nLlCNzCUxDVY5PKBeL7kG
         0Pc+iXgx+os/xJ42HsMj3wao2c5PB0M3sOcJWzNCiyJMKyzGxcdZmHJZNQm5XjjmHts/
         WwhWdsfDjcwQP/0aQXN0CAvoBhQQxoYuUFxLGKo65GXowfZRUKFfKGK13mvVVvqBNIm1
         88vfFX7862WcXmI9OiqGreGaPF4HhxQuyxtoUtKKMnR+XkIW79XqXxPcyHfvqiwneVoo
         gfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701716367; x=1702321167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhTNasiWgh+dkfX0Dm+ISFeJznRbPndi9WOsk0B0xUY=;
        b=f6dNG4VceE6BSvQcttGAKv2hSl8rzSujOZT/ZE1uiV0InBbGvuU6qySrzHlgrwi+o/
         7HYPbofjBFhlqVtjaNAhJgmR6eh3rHCAy8VPy6VJ7siy5SV3YOVJEup468gCqu78Ex7F
         VfniZswV/HlzcKWwR+7lh0UkrrIQXHH705xak0IG4v8FZrQEh0+tBf0Ryx1iTd5hfp/I
         h9Pvw2WKhNVyqFjLHOVrObry4yDWUxWDcX+G43I8Prs/gh97bQCi1O2wp1cOefGlGHfh
         ekeW1ijelfkL0UI0gujjbZGsYNG9vcdjQWFP4wG+kyoUlm2ygqly6PRJnNgPlc58GH9O
         NAcw==
X-Gm-Message-State: AOJu0Yx6114Dh25tp+H5LzLWRDJc3oCiyUCfc0VpJu3A7IZj7HFFwph7
	84v1GJbRm9qLI4ESxTot2vJUJVgI28U2FKA1kztvqQ==
X-Google-Smtp-Source: AGHT+IEfIkpQz/M9GZdrLZVheDNrcWpdTi70JO843+0WuxJNqy5io3mjCriO6X0r0jWpNfjDIVrEn82cF2d3kchgVn8=
X-Received: by 2002:a05:6102:a53:b0:452:6d82:56e3 with SMTP id
 i19-20020a0561020a5300b004526d8256e3mr383189vss.6.1701716367163; Mon, 04 Dec
 2023 10:59:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231130133630.192490507@infradead.org> <20231130134204.136058029@infradead.org>
 <CAADnVQJqE=aE7mHVS54pnwwnDS0b67iJbr+t4j5F4HRyJSTOHw@mail.gmail.com>
 <20231204091334.GM3818@noisy.programming.kicks-ass.net> <20231204111128.GV8262@noisy.programming.kicks-ass.net>
 <20231204125239.GA1319@noisy.programming.kicks-ass.net> <ZW4LjmUKj1q6RWdL@krava>
 <20231204181614.GA7299@noisy.programming.kicks-ass.net> <20231204183354.GC7299@noisy.programming.kicks-ass.net>
In-Reply-To: <20231204183354.GC7299@noisy.programming.kicks-ass.net>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 4 Dec 2023 10:58:48 -0800
Message-ID: <CABCJKudYc5GtO7TLV=d0-ZYFfBxofrV3-q1vpsaT3MD7oTKpnA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] x86/cfi,bpf: Fix BPF JIT call
To: Peter Zijlstra <peterz@infradead.org>
Cc: Jiri Olsa <olsajiri@gmail.com>, Alexei Starovoitov <alexei.starovoitov@gmail.com>, 
	Song Liu <song@kernel.org>, Song Liu <songliubraving@meta.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	linux-arch <linux-arch@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Joao Moreira <joao@overdrivepizza.com>, 
	Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 4, 2023 at 10:34=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> So afaict this is used through bpf_for_each_map_elem(), where the
> argument still is properly callback_fn. However, in the desriptor
> bpf_for_each_map_elem_proto the argument gets described as:
> ARG_PTR_TO_FUNC, which in turn has a comment like:
>
>   ARG_PTR_TO_FUNC,        /* pointer to a bpf program function */
>
> Which to me sounds like there is definite type punning involved. The
> call in bpf_for_each_array_elem() is a regular C indirect call, which
> gets adorned with the kCFI magic.
>
> But I doubt the BPF function that gets used gets the correct matching
> bits on.
>
> TL;DR, I think this is a pre-existing problem with kCFI + eBPF and not
> caused by my patches.

It is a pre-existing problem, I ran into the same failures when I
looked into this briefly last year:

https://github.com/ClangBuiltLinux/linux/issues/1727

In addition to bpf_for_each_array_elem, a few other callers also use
the same function pointer type that doesn't match cfi_bpf_hash.

Sami
