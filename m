Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3952641C78
	for <llvm@lists.linux.dev>; Fri,  8 Dec 2023 19:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XkdeLnor"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-333536432e0so2203780f8f.3
        for <llvm@lists.linux.dev>; Fri, 08 Dec 2023 11:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702064438; x=1702669238; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGqhfgnTbLSQhTQ1bMee6eK6lcK7c6hE95qruhtgvEk=;
        b=XkdeLnork9eaGSjCQIeXxrxrt95EzfNHHSRfxxojn30QQ4T3lqYkzQT841OW3Ujx/J
         Lfk1DwXjwjhwalhJbIcOo7hiWuq4eKKFERd3iMEqIkLSgq/ZdmAMfSwxH9+InKQ5mwDl
         M7EEFUThufY6ua92XBcc2Tg+gZ5Ddx5gnQNrCyhhtPT73Jh4Rf7s3X+Ashv2XYDrNGoy
         9XWtODrpwpR+C77j2gwgl0yNdyPWteEXTBypmpsDb4awmwrMm8ytfGkX+0RsUuCZYPq3
         Sb7f5V6LDf/4kUt1bTmik0NmbqidVhKEPbgtItPphO8BECRcm9K6s458NdyePjFObYx3
         GQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702064438; x=1702669238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lGqhfgnTbLSQhTQ1bMee6eK6lcK7c6hE95qruhtgvEk=;
        b=ZKi/D8chQVINLH7ZpW5Yr+FxETZpPe4/bCG7dcDKdmnXzS6nynnVyEo7wTcldoVTeM
         P5jDyJuLajZhub9rSfnEn9j5Xhht3fN6yGTy/LajugXpCO9L/pKYVvpGTdJJlXbn2mQq
         fiK/+kcT3lv95606rjZbDO6JfdJNMGEX06P2TybwJAUEdMrgCF9o8bukLOyYZCeserZl
         liXEsCf43Iue5RnLCsPUquuV8hk9c4/cbUUFFbb+/1qzaXAlMcxPXI86nFIMlP6vurGn
         AKyJ4wtJwEs8cKKA5HbYe7OB1RSim3LOBCyQT71kHF70wgzB32oTyL/ZTXWtqr4eKb+I
         Usxg==
X-Gm-Message-State: AOJu0Yym+4E+yXLTdXHMbSR9r/sw5pgHqaUwj0GwmP6Ew/xsruY+JC83
	o2jwQL0YmWsXYI53Y+SaI/iN5qYi+N3jAdYajh0=
X-Google-Smtp-Source: AGHT+IHt0AOwYtDELssGf1Db4Jmn3pjjJiojkcuC4s+RabiD4a0X0j4NeWSW3wWlhqFCkvQtOof9Rit1N2UOiD+eLQA=
X-Received: by 2002:a05:6000:543:b0:333:381d:6a26 with SMTP id
 b3-20020a056000054300b00333381d6a26mr334324wrf.135.1702064438187; Fri, 08 Dec
 2023 11:40:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231204181614.GA7299@noisy.programming.kicks-ass.net>
 <20231204183354.GC7299@noisy.programming.kicks-ass.net> <CAADnVQJwU5fCLcjBWM9zBY6jUcnME3+p=vvdgKK9FiLPWvXozg@mail.gmail.com>
 <20231206163814.GB36423@noisy.programming.kicks-ass.net> <20231206183713.GA35897@noisy.programming.kicks-ass.net>
 <zu5eb2robdqnp2ojwaxjhnglcummrnjaqbw6krdds6qac3bql2@5zx46c2s6ez4>
 <20231207093105.GA28727@noisy.programming.kicks-ass.net> <ivhrgimonsvy3tyj5iidoqmlcyqvtsh2ay3cm3ouemsdbvjzs4@6jlt6zv55tgh>
 <20231208102940.GB28727@noisy.programming.kicks-ass.net> <20231208134041.GD28727@noisy.programming.kicks-ass.net>
 <20231208172152.GD36716@noisy.programming.kicks-ass.net>
In-Reply-To: <20231208172152.GD36716@noisy.programming.kicks-ass.net>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 8 Dec 2023 11:40:27 -0800
Message-ID: <CAADnVQKsnZfFomQ4wTZz=jMZW5QCV2XiXVsi64bghHkAjJtcmA@mail.gmail.com>
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

On Fri, Dec 8, 2023 at 9:22=E2=80=AFAM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> On Fri, Dec 08, 2023 at 02:40:41PM +0100, Peter Zijlstra wrote:
> > On Fri, Dec 08, 2023 at 11:29:40AM +0100, Peter Zijlstra wrote:
> > > The only problem I now have is the one XXX, I'm not entirely sure wha=
t
> > > signature to use there.
> >
> > > @@ -119,6 +119,7 @@ int bpf_struct_ops_test_run(struct bpf_p
> > >     op_idx =3D prog->expected_attach_type;
> > >     err =3D bpf_struct_ops_prepare_trampoline(tlinks, link,
> > >                                             &st_ops->func_models[op_i=
dx],
> > > +                                           /* XXX */ NULL,
> > >                                             image, image + PAGE_SIZE)=
;
> > >     if (err < 0)
> > >             goto out;
> >
> > Duh, that should ofcourse be something of dummy_ops_test_ret_fn type.
> > Let me go fix that.
>
> Next one.. bpf_obj_free_fields: field->kptr.dtor(xchg_field);
>
> The one that trips is bpf_cgroup_release().
>
> objtool doesn't think the address of that function 'escapes' and
> 'helpfully' seals that function, and then BPF thinks it does escape and
> manages the above indirect call and *boom*.
>
> How can I tell which functions escape according to BPF such that I might
> teach objtool this?

I'm not following.
Are you asking to annotate
__bpf_kfunc void bpf_cgroup_release(struct cgroup *cgrp)
somehow so that objtool knows that it will be called indirectly?
typedef void (*btf_dtor_kfunc_t)(void *);
        btf_dtor_kfunc_t dtor;
but the bpf_cgroup_release takes 'struct cgroup*'.
From kcfi pov void * =3D=3D struct cgroup * ?
Do we need to change it to 'void *cgrp' ?
What is "sealing" by objtool?
