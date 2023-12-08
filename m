Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984C434541
	for <llvm@lists.linux.dev>; Fri,  8 Dec 2023 20:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d5WJn9DP"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-333536432e0so2249872f8f.3
        for <llvm@lists.linux.dev>; Fri, 08 Dec 2023 12:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702068363; x=1702673163; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jlXQF//AUsnwP+nKFBoybb7LMYNoRVOQuSpa/LCcRfc=;
        b=d5WJn9DPxD+7TzqS+iDfgi0be5QpJKpzMzrt8sJbb2JuQyiHnR0MLTJFwNNne/HYnX
         IvvhOvL+8xVvrobbs1kXS2z24lPnHWnBGI0UaTU3ckn/n0vL/anh4pVBm3ad1UdJ5yTi
         9CauDJIO+2viSYR9pI4hYRnVqU+n09foKkPQ6ocP9FssxGGEyQD4htx+C1hLEeauvOaB
         E/BKEAEUbsBfJsd6SV74cLzaqEKiNKlcMjzlGteaPMZtwYjpk2OA6CRo47A8kuLcN/11
         iebUjh9Gtv05bNBoJoR4GfejHYRY7nNHqljRDXL2/l1pdgc3cyZDLsfsi9uBAJWUlXmS
         ZZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702068363; x=1702673163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jlXQF//AUsnwP+nKFBoybb7LMYNoRVOQuSpa/LCcRfc=;
        b=RQAppX3tR8WggFwK1uAnJ0lIZADS1guw/Mf1bgik6N/IGYz/9NfRBR7OiyQG8sI1LY
         8V697rcYjli+PvFODhYXYF6XVKan/T1P+gWoVMrASVKNcBoFhMA9NwrQLQM7YSJ/Ub/S
         dAWafg9Zco+6Mgso/fSK1zm+OWk6zFJYqy3Rb4oXgeMfuKLN0ATWPPvj8eL6l8GXU6R7
         +JGQcLI/RHzvDH7Hbkx3DearSqQ81b9TIVQ9s21lozCI6yiq5OG3bvk6/YKk/a+EBeig
         bUVlL7ybAGgk9Y1xz7lq0HwySunT3xEjfTw9tCvpwzGSyup9cDwj7aH5Ra7Mlt0yxq9/
         zFEg==
X-Gm-Message-State: AOJu0YzrSeYRl1hfENfo6AVqJmnvNYtNnC7z1X+D6pITHsaJyg+SVys+
	b2DjZxDnyjevqXfWXrm2gznkfPJ3avGZXxZYeCc=
X-Google-Smtp-Source: AGHT+IE4sHBb5/cNR7lbKXUMWA7pBzCk+Azp42Xup3bWyH2dubUwP/oKuFvKD+DnRI3AEHKgZH07K+Gk15b7iovJNI8=
X-Received: by 2002:a5d:457b:0:b0:333:129d:239 with SMTP id
 a27-20020a5d457b000000b00333129d0239mr393721wrc.0.1702068362601; Fri, 08 Dec
 2023 12:46:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231204183354.GC7299@noisy.programming.kicks-ass.net>
 <CAADnVQJwU5fCLcjBWM9zBY6jUcnME3+p=vvdgKK9FiLPWvXozg@mail.gmail.com>
 <20231206163814.GB36423@noisy.programming.kicks-ass.net> <20231206183713.GA35897@noisy.programming.kicks-ass.net>
 <zu5eb2robdqnp2ojwaxjhnglcummrnjaqbw6krdds6qac3bql2@5zx46c2s6ez4>
 <20231207093105.GA28727@noisy.programming.kicks-ass.net> <ivhrgimonsvy3tyj5iidoqmlcyqvtsh2ay3cm3ouemsdbvjzs4@6jlt6zv55tgh>
 <20231208102940.GB28727@noisy.programming.kicks-ass.net> <20231208134041.GD28727@noisy.programming.kicks-ass.net>
 <CAADnVQJFB_CPtFS3=VV=RwnP=EQRL3yEsR8wXVcicb07P8NODw@mail.gmail.com> <20231208201819.GE36716@noisy.programming.kicks-ass.net>
In-Reply-To: <20231208201819.GE36716@noisy.programming.kicks-ass.net>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 8 Dec 2023 12:45:51 -0800
Message-ID: <CAADnVQ+1nVBuKkjdvh0eu19p+J0UqbO9mcCf3yzVeQtALxzQ+Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] x86/cfi,bpf: Fix BPF JIT call
To: Peter Zijlstra <peterz@infradead.org>
Cc: Jiri Olsa <olsajiri@gmail.com>, Song Liu <song@kernel.org>, 
	Song Liu <songliubraving@meta.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, Network Development <netdev@vger.kernel.org>, 
	bpf <bpf@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Joao Moreira <joao@overdrivepizza.com>, Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 8, 2023 at 12:18=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Fri, Dec 08, 2023 at 11:32:07AM -0800, Alexei Starovoitov wrote:
> > On Fri, Dec 8, 2023 at 5:41=E2=80=AFAM Peter Zijlstra <peterz@infradead=
.org> wrote:
> > >
> > > On Fri, Dec 08, 2023 at 11:29:40AM +0100, Peter Zijlstra wrote:
> > > > The only problem I now have is the one XXX, I'm not entirely sure w=
hat
> > > > signature to use there.
> > >
> > > > @@ -119,6 +119,7 @@ int bpf_struct_ops_test_run(struct bpf_p
> > > >       op_idx =3D prog->expected_attach_type;
> > > >       err =3D bpf_struct_ops_prepare_trampoline(tlinks, link,
> > > >                                               &st_ops->func_models[=
op_idx],
> > > > +                                             /* XXX */ NULL,
> > > >                                               image, image + PAGE_S=
IZE);
> > > >       if (err < 0)
> > > >               goto out;
> > >
> > > Duh, that should ofcourse be something of dummy_ops_test_ret_fn type.
> > > Let me go fix that.
> >
> > Right. That should work.
> > A bit wasteful to generate real code just to read hash from it
> > via cfi_get_func_hash(), but it's a neat idea.
>
> Right, bit wasteful. But the advantage is that I get a structure with
> pointers that exactly mirrors the structure we're writing.
>
> > I guess it's hard to get kcfi from __ADDRESSABLE in plain C
> > and sprinkling asm("cfi_xxx: .long   __kcfi_typeid..."); is worse?
> > Even if it's a macro ?
>
> I can try this, but I'm not sure it'll be pretty. Even if I wrap it in a
> decent macro, I still get to define a ton of variables and then wrap the
> lot into a structure -- one that expects function pointers.
>
> I'll see how horrible it will become.

I mean we don't need to store a pointer to a func in stubs.
Can it be, roughly:

extern void bpf_tcp_ca_cong_avoid(struct sock *sk, u32 ack, u32 acked);
KCFI_MACRO(hash_of_cong_avoid, bpf_tcp_ca_cong_avoid);
u32 __array_of_kcfi_hash[] =3D {hash_of_cong_avoid, hash_of_set_state,...};
      .bpf_ops_stubs =3D __array_of_kcfi_hash,
