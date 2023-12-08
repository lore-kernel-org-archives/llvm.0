Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA8934180
	for <llvm@lists.linux.dev>; Fri,  8 Dec 2023 20:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GOrHfdEj"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40c317723a8so14801405e9.3
        for <llvm@lists.linux.dev>; Fri, 08 Dec 2023 12:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702069093; x=1702673893; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPbPGj/N+kFsGtRBn7sHjIbGBUsdMj/nlx3HBVB+JYE=;
        b=GOrHfdEjgcZqsAmEVgcL11gX/30ZJvpYg+dm8WPmaxRAFvsCYq3O4qIlWZIDm4lt9m
         mR8k3bFB/whik4H24OFPE1nyLpStoTPgI+8e1plfqWnNxXFj6C2xIBLkxdbXgEkJ1FNC
         t+u5+Ens5u6XVF0RZkoxoNN660A6JPhKKbZ/lwt+nHXAbZEv6oT/KJX//Fry3ygXn6Or
         aTYUtKMt4oHAcabHMaVMmmjAGbmk78XSevH629whZcHDGlMpoa8QvCCKuaP2HxFzhgcl
         WjpJcrDjwOGkorzbvTFRhTb5AC0svmz9x/HA/3wU1OHr0GGCeaWC8Fok9TJMloC+oqSx
         rPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702069093; x=1702673893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jPbPGj/N+kFsGtRBn7sHjIbGBUsdMj/nlx3HBVB+JYE=;
        b=HJQYaABMll7qR3Wf0qWdR/120MyLWLi3M9GB5ByyxjbQ37bXLypoWxeeKfH8xwbXmX
         34zcR9cNGSpPYa1SlVXM9iExnd3/e0fHp3qfwC26Tq/qpWYHR+vcOijnHOGYgr5Y1w5O
         BXnw3oXbiBSNzE5APv/R2WGjW+1L+mSEgXijw6D93NTiwzvySpbipCGEzfawCYsYAB3H
         Miw6NY9VQ8UN3JiJnMO5Ic3+luphOg7nJ1cp1+lr/J7Q19b/2QwaYrGOaNv7vtJcvcFL
         2XgYrcAN5Ty/SlzVw44Yc9/RVlgtYbunkNqHHSmYnSSgbtvrDENen2RSS7FgXSnm74Qc
         4SFA==
X-Gm-Message-State: AOJu0YzvN5tRVxoRvpY22TxGPrxhFnj2rMS22BRCu0eLk1lzLGccbznY
	OmQjfcoeflOUnpbWu4zp90iUmlvMLWDiSFSU58k=
X-Google-Smtp-Source: AGHT+IHEvTazMB26cXxqydUXzZjQ0E1EF3LcABQy94WqsbsZZavl6RKIzemfxTaf1pZCNseT7Ws4y7rzsk2OXl7MDFE=
X-Received: by 2002:a05:600c:2947:b0:40c:2954:5ad7 with SMTP id
 n7-20020a05600c294700b0040c29545ad7mr288834wmd.120.1702069092800; Fri, 08 Dec
 2023 12:58:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231206183713.GA35897@noisy.programming.kicks-ass.net>
 <zu5eb2robdqnp2ojwaxjhnglcummrnjaqbw6krdds6qac3bql2@5zx46c2s6ez4>
 <20231207093105.GA28727@noisy.programming.kicks-ass.net> <ivhrgimonsvy3tyj5iidoqmlcyqvtsh2ay3cm3ouemsdbvjzs4@6jlt6zv55tgh>
 <20231208102940.GB28727@noisy.programming.kicks-ass.net> <20231208134041.GD28727@noisy.programming.kicks-ass.net>
 <20231208172152.GD36716@noisy.programming.kicks-ass.net> <CAADnVQKsnZfFomQ4wTZz=jMZW5QCV2XiXVsi64bghHkAjJtcmA@mail.gmail.com>
 <20231208203535.GG36716@noisy.programming.kicks-ass.net> <CAADnVQJzCw=qcG+jHBYG0q0SxLPkwghni0wpgV4A4PkpgVbGPw@mail.gmail.com>
 <20231208205241.GK28727@noisy.programming.kicks-ass.net>
In-Reply-To: <20231208205241.GK28727@noisy.programming.kicks-ass.net>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 8 Dec 2023 12:58:01 -0800
Message-ID: <CAADnVQL3KsJONShsstDq5jrpbc_4FOU-VQPJgDCt50N9asoFzA@mail.gmail.com>
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

On Fri, Dec 8, 2023 at 12:52=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Fri, Dec 08, 2023 at 12:41:03PM -0800, Alexei Starovoitov wrote:
> > On Fri, Dec 8, 2023 at 12:35=E2=80=AFPM Peter Zijlstra <peterz@infradea=
d.org> wrote:
>
> > > -__bpf_kfunc void bpf_task_release(struct task_struct *p)
> > > +__bpf_kfunc void bpf_task_release(void *p)
> >
> > Yeah. That won't work. We need a wrapper.
> > Since bpf prog is also calling it directly.
> > In progs/task_kfunc_common.h
> > void bpf_task_release(struct task_struct *p) __ksym;
> >
> > than later both libbpf and the verifier check that
> > what bpf prog is calling actually matches the proto
> > of what is in the kernel.
> > Effectively we're doing strong prototype check at load time.
>
> I'm still somewhat confused on how this works, where does BPF get the
> address of the function from? and what should I call the wrapper?

It starts with
register_btf_id_dtor_kfuncs() that takes a set of btf_ids:
{btf_id_of_type, btf_id_of_dtor_function}, ...

Then based on btf_id_of_dtor_function we find its type proto, name, do chec=
ks,
and eventually:
addr =3D kallsyms_lookup_name(dtor_func_name);
field->kptr.dtor =3D (void *)addr;

bpf_task_release(struct task_struct *p) would need to stay as-is,
but we can have a wrapper
void bpf_task_release_dtor(void *p)
{
  bpf_task_release(p);
}

And adjust the above lookup with extra "_dtor" suffix.

> > btw instead of EXPORT_SYMBOL_GPL(bpf_task_release)
> > can __ADDRESSABLE be used ?
> > Since it's not an export symbol.
>
> No __ADDRESSABLE() is expressly ignored, but we have IBT_NOSEAL() that
> should do it. I'll rename the thing and lift it out of x86 to avoid
> breaking all other arch builds.

Makes sense.
