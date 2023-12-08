Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED4E29433
	for <llvm@lists.linux.dev>; Fri,  8 Dec 2023 20:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCrpsJl8"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3331752d2b9so1807473f8f.3
        for <llvm@lists.linux.dev>; Fri, 08 Dec 2023 12:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702068075; x=1702672875; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mj7pq+OIwUID+JMsGrWjS7UT9Bcii1A8UE8TU13OktE=;
        b=fCrpsJl8HN1Kk2yUO1ROzBcO1ZzxL5Eu1IS0bbcgi2aNazvKZ/0jkPFovp5+93old8
         rU6QOk3/YIUl3M8scR9DW7rC3THJ0OhQrBSN3jIE7WY/Ngdgkc1Hl77bo0OxZhSsx5Q4
         9h2S83XfvKc0/DXQBV6+9SODhydsLQ9iCXuDrq0mAe4yAiWJ0y003TNsQKQSn3GfF3aE
         7qKe+sWNRqpo9Y+Dtp0PZLlZhpMWrIa17zGqLzGVdAqWrPaq9WDnFGSHy+jjmtH4HbMR
         Z4qI3jE+NwJKE1a0HfQ9k7Gh75eLV+68MZJBVgbKQrwFEGU34WpjNdCMhVx/GPB16TWn
         PhgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702068075; x=1702672875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mj7pq+OIwUID+JMsGrWjS7UT9Bcii1A8UE8TU13OktE=;
        b=Xv5VjJFb1QNJkaom3Sni2//+wvpuoC0q/xEJHm+NNSEF71IhTUbi0b2Kn4+cfgGzjj
         cJIh+OfBnLg5VZkVgbRGjNlddxQcYbXDPr9zC9C8DWk0mrzAlklVLFScudyU4RNEvYb8
         tuzh2q8rJ4eIgsq76PdyTh58Xb1pcIvrIvKNqR0oa7igy3c1aRiKZCSqG60+IW6gqXc7
         eR5ds8yOcpkn20it7sfsSlPncUYSmHMzpEiZXpBkiFCJ5yBebfqhDENa6RS3KSF0KCRp
         1TtgffvoZQGeCXU0EhANB+z8bdRYP8rZIspowqRvYWb30VV9b0piJh9zMFyV8ZWk7lUK
         45uQ==
X-Gm-Message-State: AOJu0YyTKYwXVrp7pfwZzP610tkNeOv/BY+gbBYfWgxVnCLntYvph2hK
	XWWYBRpAXhQ+uoO+2ER1A9ocJXfmVizslyXCtPs=
X-Google-Smtp-Source: AGHT+IERcqiD0C/8xjZJmHAgSBT2DdIylL4yKHY4jgZtfjgalQtcY6Jcz2MAn3dQVMGiGBWeMdU28s7aF98ziv0/pdE=
X-Received: by 2002:adf:f00f:0:b0:333:2f14:7642 with SMTP id
 j15-20020adff00f000000b003332f147642mr344840wro.61.1702068075072; Fri, 08 Dec
 2023 12:41:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAADnVQJwU5fCLcjBWM9zBY6jUcnME3+p=vvdgKK9FiLPWvXozg@mail.gmail.com>
 <20231206163814.GB36423@noisy.programming.kicks-ass.net> <20231206183713.GA35897@noisy.programming.kicks-ass.net>
 <zu5eb2robdqnp2ojwaxjhnglcummrnjaqbw6krdds6qac3bql2@5zx46c2s6ez4>
 <20231207093105.GA28727@noisy.programming.kicks-ass.net> <ivhrgimonsvy3tyj5iidoqmlcyqvtsh2ay3cm3ouemsdbvjzs4@6jlt6zv55tgh>
 <20231208102940.GB28727@noisy.programming.kicks-ass.net> <20231208134041.GD28727@noisy.programming.kicks-ass.net>
 <20231208172152.GD36716@noisy.programming.kicks-ass.net> <CAADnVQKsnZfFomQ4wTZz=jMZW5QCV2XiXVsi64bghHkAjJtcmA@mail.gmail.com>
 <20231208203535.GG36716@noisy.programming.kicks-ass.net>
In-Reply-To: <20231208203535.GG36716@noisy.programming.kicks-ass.net>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 8 Dec 2023 12:41:03 -0800
Message-ID: <CAADnVQJzCw=qcG+jHBYG0q0SxLPkwghni0wpgV4A4PkpgVbGPw@mail.gmail.com>
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

On Fri, Dec 8, 2023 at 12:35=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Fri, Dec 08, 2023 at 11:40:27AM -0800, Alexei Starovoitov wrote:
>
> > typedef void (*btf_dtor_kfunc_t)(void *);
> >         btf_dtor_kfunc_t dtor;
> > but the bpf_cgroup_release takes 'struct cgroup*'.
> > From kcfi pov void * =3D=3D struct cgroup * ?
> > Do we need to change it to 'void *cgrp' ?
>
> Yes, doing that naively like the below, gets me lovely things like:
>
> validate_case:FAIL:expect_msg unexpected error: -22
> VERIFIER LOG:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> EXPECTED MSG: 'Possibly NULL pointer passed to trusted arg0'
> #48/7    cgrp_kfunc/cgrp_kfunc_acquire_untrusted:FAIL
> run_subtest:PASS:obj_open_mem 0 nsec
> libbpf: extern (func ksym) 'bpf_cgroup_release': func_proto [148] incompa=
tible with vmlinux [125610]
> libbpf: failed to load object 'cgrp_kfunc_failure'
>
>
> But let me try rebuilding everything..
>
>
> ---
> diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> index b3be5742d6f1..078b207af7f0 100644
> --- a/kernel/bpf/helpers.c
> +++ b/kernel/bpf/helpers.c
> @@ -2145,10 +2145,11 @@ __bpf_kfunc struct task_struct *bpf_task_acquire(=
struct task_struct *p)
>   * bpf_task_release - Release the reference acquired on a task.
>   * @p: The task on which a reference is being released.
>   */
> -__bpf_kfunc void bpf_task_release(struct task_struct *p)
> +__bpf_kfunc void bpf_task_release(void *p)

Yeah. That won't work. We need a wrapper.
Since bpf prog is also calling it directly.
In progs/task_kfunc_common.h
void bpf_task_release(struct task_struct *p) __ksym;

than later both libbpf and the verifier check that
what bpf prog is calling actually matches the proto
of what is in the kernel.
Effectively we're doing strong prototype check at load time.

btw instead of EXPORT_SYMBOL_GPL(bpf_task_release)
can __ADDRESSABLE be used ?
Since it's not an export symbol.
