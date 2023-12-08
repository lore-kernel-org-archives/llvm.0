Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDE53B2A4
	for <llvm@lists.linux.dev>; Fri,  8 Dec 2023 21:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AsRr5a5Z"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40c38de1ee4so5054985e9.0
        for <llvm@lists.linux.dev>; Fri, 08 Dec 2023 13:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702069474; x=1702674274; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6NtR+oTUIOd2AHKXBfJVs3VbzXFOw3VtZb1y+6tew0=;
        b=AsRr5a5Zor3Axw9y0/2zwk+Z1V6jxdp5ZKTMkLNOxMie43xzhJcowQkKQZN8DXK3P8
         7Dbtv7ID6USJA0vsWM4Pvkb8WXwCTYWbqwFuzX1qheBY4JBoaGSvs5oY5XHk4onW11+o
         iLnmTl/UhrBEshxjIeuUHnVwAEwGNVEuchuTCOHxnYmOmtyc7T2otzGI0VZ6k3mVj8X+
         ENvIgHq895xBBggMcZaGrtLOslmpPonWTQ8NV4HjIrR16vAp0HpxIbZJVUe/hIxPcPRI
         z4HG6MlWoXw+HFwoLEtRnkBKFWRPToZqYHbaRCOM7sk1n8xRb1WAizW8jxO5bgcAUXrF
         WK/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702069474; x=1702674274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D6NtR+oTUIOd2AHKXBfJVs3VbzXFOw3VtZb1y+6tew0=;
        b=Jtoj3noyHgNnX6hkw2o1CLDyZheHHGcVabg8UwNDxRlRODw0uw5YCGIjEcG1A7sa68
         JRRjljY+L5IWP7xU3dMiKUgUiGKQ4tw6AwScrBRpWXwALyoHEoQqg0v1rl2fp7tTYbb9
         iyJwgbmdwueOYVM0t/4DDveGumQI1/gu7e8neYtoybiHmxs2tjc+eqvQV/qMViC4UCmu
         t+w61UqDlai2F/4Vu2C56J2ctEqJyFFJ6nofqj6+3x5KthbBZ+nFuGyIXPBF3z6785DQ
         guZc8n+C2K8AzRYF6ShQPjRh5wH8gnAXdNQOrdNOVmLXxh9wpogKdrfiTpi779gMaMF0
         aEVA==
X-Gm-Message-State: AOJu0YxN7vJfuO7nEFCJWSiL+ga6eVaphwApY215kWMtnYQg3bB5VcPt
	vl7GFZJFVJAYr0tY9fBiez4VRdtgP5SItWJRLeY=
X-Google-Smtp-Source: AGHT+IEkTtKeS6XS1G3jyMsgzOhUXClVJ029bbBc4Aqz+vIee0Tzhjlve6H0wlutP+qM9rQB9kK5huFu1aQL+LEf+9E=
X-Received: by 2002:a1c:4c0a:0:b0:40c:2ad3:1aed with SMTP id
 z10-20020a1c4c0a000000b0040c2ad31aedmr288910wmf.35.1702069473424; Fri, 08 Dec
 2023 13:04:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231206163814.GB36423@noisy.programming.kicks-ass.net>
 <20231206183713.GA35897@noisy.programming.kicks-ass.net> <zu5eb2robdqnp2ojwaxjhnglcummrnjaqbw6krdds6qac3bql2@5zx46c2s6ez4>
 <20231207093105.GA28727@noisy.programming.kicks-ass.net> <ivhrgimonsvy3tyj5iidoqmlcyqvtsh2ay3cm3ouemsdbvjzs4@6jlt6zv55tgh>
 <20231208102940.GB28727@noisy.programming.kicks-ass.net> <20231208134041.GD28727@noisy.programming.kicks-ass.net>
 <CAADnVQJFB_CPtFS3=VV=RwnP=EQRL3yEsR8wXVcicb07P8NODw@mail.gmail.com>
 <20231208201819.GE36716@noisy.programming.kicks-ass.net> <CAADnVQ+1nVBuKkjdvh0eu19p+J0UqbO9mcCf3yzVeQtALxzQ+Q@mail.gmail.com>
 <20231208205647.GL28727@noisy.programming.kicks-ass.net>
In-Reply-To: <20231208205647.GL28727@noisy.programming.kicks-ass.net>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 8 Dec 2023 13:04:22 -0800
Message-ID: <CAADnVQKjAwWLfn-gBxq03qv4SQTt0YguYSDZXj8L6nmBZqU66g@mail.gmail.com>
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

On Fri, Dec 8, 2023 at 12:56=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Fri, Dec 08, 2023 at 12:45:51PM -0800, Alexei Starovoitov wrote:
>
> > I mean we don't need to store a pointer to a func in stubs.
> > Can it be, roughly:
> >
> > extern void bpf_tcp_ca_cong_avoid(struct sock *sk, u32 ack, u32 acked);
> > KCFI_MACRO(hash_of_cong_avoid, bpf_tcp_ca_cong_avoid);
> > u32 __array_of_kcfi_hash[] =3D {hash_of_cong_avoid, hash_of_set_state,.=
..};
> >       .bpf_ops_stubs =3D __array_of_kcfi_hash,
>
> But then how do I index this array? The bpf_ops_stubs thing having the
> same layout at the target struct made it easy and we could use 'moff'
> for both.
>
> That also remains working if someone adds a member to the struct or
> moves some members around.

I was thinking to just moff/2 assuming u32 array will have the same order,
but I missed the fact that init() and release() in tcp_congestion_ops
come after some variables.
And you're right it's more fragile when things change in tcp_congestion_ops=
.
Storing u32 hash as (void *) into function pointers is just ugly.
Let's go with your initial approach.
