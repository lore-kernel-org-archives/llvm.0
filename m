Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0004925EF90
	for <llvm@lists.linux.dev>; Tue,  1 Jul 2025 20:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751402770; cv=none; b=kdIK+RMOHaDw2PNaYqb3SxmXuQwaqmwZRsSN9e7KuMn1Y0RZmYZa+u8qSL4WwVlgHuS++WSOqhmpxd2dC7ZRs/Iekw8m0w+IOACDk302/+GwEK2gYSJIVm4ziBJdN6ORvNZ2OiCRHLmjJGK91twcKqj2whvz2MuobCXULmtIYTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751402770; c=relaxed/simple;
	bh=cgf2UXP07i29I0Sz7Ucz+VMLeoyIB1XYNHnEU1OdDfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J8482VrnIFzTo4p81jROHbMwJ/K2GaoYe6koG3s0DTHH6XgxUvozEc1XCr/rYqP2CTBVk2FLgTSlMyZr28O+CaOIwuHCaKauEw7S1XuxWNzFblemwDDVY5Hjjmaq4R+oUHaOKXNMSG2WqMq7N93xPkL6FAVFHsxUoVie3uiRpjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SIvDky0H; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SIvDky0H"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-313910f392dso2846035a91.2
        for <llvm@lists.linux.dev>; Tue, 01 Jul 2025 13:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751402765; x=1752007565; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hCgrlLfo9Mns92U/5iXO12KGKM9lhSDCM+Q2c4kfSmE=;
        b=SIvDky0HyHScLGsiOY+a4I5ZooAxGGzrRj7qazeytlhVjiETVbOk6IZ+dvsHqjIMDt
         xQ1OJfDoe33uAKR7Z+Gw3G5zLg4U2abGOZQZNX5ZF6ScpW/YtMsh187kcWmGBYozKfDs
         nTs/fEB/xgLIGfcbn5cuCaEr3ITdatw3+qzXWDcF3pxSiGkhoB2DIA4By3+zDsMPifX9
         RH638ZMuq80Lt+KHXf5Hr7g4bnka+3Nyd6ZqyAzUV9O3uOxysWXeH8YyOZsa4AmWoO/8
         PrscBNWB9GdheyhkXFTJNnLkgrQSBxnwmAt13EexyCx2dOfBhIDS3Bq2Pa7r6nbInldF
         9sJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751402765; x=1752007565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hCgrlLfo9Mns92U/5iXO12KGKM9lhSDCM+Q2c4kfSmE=;
        b=CIreC/3LVFE5Zhtg1dKB/SmTjYMWNqs7p80FvSIr7rAxtsFtEH0zY4qfCYWwYZkx8F
         AYiEQTaljhk+F1MUwlTj4m4UFMRXa3KCYTNQohkq8pRzcpPETx8Hz4ZeaxIfmFvS2jcB
         l00Vmp1KYqHJp99PLZkHqruAOBkL/0tHGcpuAYvgGoBys7ZIcpXIq892PDeXcn7IkYjL
         HBPtku+LGOiNwg+pOQ0mjJJ+kLy/TqOjpTxyhFRA+fMfKxpYMjjqwIwhADfsmhuCmFY6
         ixZVxSwLIflfwE0l2OLGGSSD6JbBgVztAuvosJwzTtZ2xIIOx3bBgYSHBhXM4bg5haEq
         gcvg==
X-Forwarded-Encrypted: i=1; AJvYcCVJ3Mi6cfFmiF4yIZsy4WXPGwa6gbDu9zANkbnAlS+U45Nw42ey5sExcU50+lA4TQnF9nkK@lists.linux.dev
X-Gm-Message-State: AOJu0YzlZl0w/G+u1nSBrcUIfRWZCudBNipcb9dfHyK/yxf2e6Zkrhb/
	JM+dQTsVvMff7ieh8ScjcXA6260Xq8003l7/NZLr/aPB//VmSfz8nDAJz0O4L+XS00fKXZDYUg0
	4jrVpk4TObNZnH9j6O43ArZ/QR/soP6o=
X-Gm-Gg: ASbGnct9bvib0XfR7DtHoJdL9xgvjsQul7rXE9VzZJ3rJ6Hs/SRtZPbmIQN7+l5Bk+b
	fovXIfSQribMcQTAvc62SG6qip03E3QXUmhAvWqRIZtk7ZMxUwtucSonqm9RQsrPykl384AoxCA
	Lf+wCGh243j0WpplFGqdlBc+XD9n3wzC/i5Bi6zjJ5vRen9a4NQ7mV2nmhry8=
X-Google-Smtp-Source: AGHT+IE0GrZOy0np0jvotiCpIi/pC4GYr+OPKKBtDYVBM8itFJuYyOIpiylRF1p1h/76mb4orDWecoU4sJTxm4EJHfg=
X-Received: by 2002:a17:90b:2c8d:b0:311:c1ec:7cfb with SMTP id
 98e67ed59e1d1-31a90bd47aemr511891a91.21.1751402765101; Tue, 01 Jul 2025
 13:46:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250620113846.3950478-1-arnd@kernel.org> <CAADnVQKAT3UPzcpzkJ6_-powz4YTiDAku4-a+++hrhYdJUnLiw@mail.gmail.com>
 <361eb614-e145-49dc-aa32-12f313f61b96@linux.dev>
In-Reply-To: <361eb614-e145-49dc-aa32-12f313f61b96@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 1 Jul 2025 13:45:50 -0700
X-Gm-Features: Ac12FXyI7Qso7jRBjHBJtEsaXWo4_BsHAlGq7GXcFjjswLG4pAt_g_gsBh58Zpg
Message-ID: <CAEf4BzahSLGiW_F4LtG1tMAb0O1b6D-kO0AcrU2O+nLKVbkvZA@mail.gmail.com>
Subject: Re: [PATCH] bpf: turn off sanitizer in do_misc_fixups for old clang
To: Yonghong Song <yonghong.song@linux.dev>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Arnd Bergmann <arnd@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Luis Gerhorst <luis.gerhorst@fau.de>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 1:03=E2=80=AFPM Yonghong Song <yonghong.song@linux.d=
ev> wrote:
>
>
>
> On 6/23/25 2:32 PM, Alexei Starovoitov wrote:
> > On Fri, Jun 20, 2025 at 4:38=E2=80=AFAM Arnd Bergmann <arnd@kernel.org>=
 wrote:
> >> From: Arnd Bergmann <arnd@arndb.de>
> >>
> >> clang versions before version 18 manage to badly optimize the bpf
> >> verifier, with lots of variable spills leading to excessive stack
> >> usage in addition to likely rather slow code:
> >>
> >> kernel/bpf/verifier.c:23936:5: error: stack frame size (2096) exceeds =
limit (1280) in 'bpf_check' [-Werror,-Wframe-larger-than]
> >> kernel/bpf/verifier.c:21563:12: error: stack frame size (1984) exceeds=
 limit (1280) in 'do_misc_fixups' [-Werror,-Wframe-larger-than]
> >>
> >> Turn off the sanitizer in the two functions that suffer the most from
> >> this when using one of the affected clang version.
> >>
> >> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >> ---
> >>   kernel/bpf/verifier.c | 11 +++++++++--
> >>   1 file changed, 9 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> >> index 2fa797a6d6a2..7724c7a56d79 100644
> >> --- a/kernel/bpf/verifier.c
> >> +++ b/kernel/bpf/verifier.c
> >> @@ -19810,7 +19810,14 @@ static int do_check_insn(struct bpf_verifier_=
env *env, bool *do_print_state)
> >>          return 0;
> >>   }
> >>
> >> -static int do_check(struct bpf_verifier_env *env)
> >> +#if defined(CONFIG_CC_IS_CLANG) && CONFIG_CLANG_VERSION < 180100
> >> +/* old clang versions cause excessive stack usage here */
> >> +#define __workaround_kasan  __disable_sanitizer_instrumentation
> >> +#else
> >> +#define __workaround_kasan
> >> +#endif
> >> +
> >> +static __workaround_kasan int do_check(struct bpf_verifier_env *env)
> > This looks too hacky for a workaround.
> > Let's figure out what's causing such excessive stack usage and fix it.
> > We did some of this work in
> > commit 6f606ffd6dd7 ("bpf: Move insn_buf[16] to bpf_verifier_env")
> > and similar.
> > Looks like it wasn't enough or more stack usage crept in since then.
> >
> > Also make sure you're using the latest bpf-next.
> > A bunch of code was moved out of do_check().
> > So I bet the current bpf-next/master doesn't have a problem
> > with this particular function.
> > In my kasan build do_check() is now fully inlined.
> > do_check_common() is not and it's using 512 bytes of stack.
> >
> >>   {
> >>          bool pop_log =3D !(env->log.level & BPF_LOG_LEVEL2);
> >>          struct bpf_verifier_state *state =3D env->cur_state;
> >> @@ -21817,7 +21824,7 @@ static int add_hidden_subprog(struct bpf_verif=
ier_env *env, struct bpf_insn *pat
> >>   /* Do various post-verification rewrites in a single program pass.
> >>    * These rewrites simplify JIT and interpreter implementations.
> >>    */
> >> -static int do_misc_fixups(struct bpf_verifier_env *env)
> >> +static __workaround_kasan int do_misc_fixups(struct bpf_verifier_env =
*env)
> > This one is using 832 byte of stack with kasan.
> > Which is indeed high.
> > Big chunk seems to be coming from chk_and_sdiv[] and chk_and_smod[].
> >
> > Yonghong,
> > looks like you contributed that piece of code.
> > Pls see how to reduce stack size here.
> > Daniel used this pattern in earlier commits. Looks like
> > we took it too far.
>
> With llvm17, I got the following error:
>
> /home/yhs/work/bpf-next/kernel/bpf/verifier.c:24491:5: error: stack frame=
 size (2552) exceeds limit (1280) in 'bpf_check' [-
> Werror,-Wframe-larger-than]
>   24491 | int bpf_check(struct bpf_prog **prog, union bpf_attr *attr, bpf=
ptr_t uattr, __u32 uattr_size)
>         |     ^
> /home/yhs/work/bpf-next/kernel/bpf/verifier.c:19921:12: error: stack fram=
e size (1368) exceeds limit (1280) in 'do_check' [-
> Werror,-Wframe-larger-than]
>   19921 | static int do_check(struct bpf_verifier_env *env)
>         |            ^
> 2 errors generated.
>
> I checked IR and found the following memory allocations which may contrib=
ute
> excessive stack usage:
>
> attr.coerce1, i32 noundef %uattr_size) local_unnamed_addr #0 align 16 !db=
g !19800 {
> entry:
>    %zext_patch.i =3D alloca [2 x %struct.bpf_insn], align 16, !DIAssignID=
 !19854
>    %rnd_hi32_patch.i =3D alloca [4 x %struct.bpf_insn], align 16, !DIAssi=
gnID !19855
>    %cnt.i =3D alloca i32, align 4, !DIAssignID !19856
>    %patch.i766 =3D alloca [3 x %struct.bpf_insn], align 16, !DIAssignID !=
19857
>    %chk_and_sdiv.i =3D alloca [1 x %struct.bpf_insn], align 4, !DIAssignI=
D !19858
>    %chk_and_smod.i =3D alloca [1 x %struct.bpf_insn], align 4, !DIAssignI=
D !19859
>    %chk_and_div.i =3D alloca [4 x %struct.bpf_insn], align 16, !DIAssignI=
D !19860
>    %chk_and_mod.i =3D alloca [4 x %struct.bpf_insn], align 16, !DIAssignI=
D !19861
>    %chk_and_sdiv343.i =3D alloca [8 x %struct.bpf_insn], align 16, !DIAss=
ignID !19862
>    %chk_and_smod472.i =3D alloca [9 x %struct.bpf_insn], align 16, !DIAss=
ignID !19863
>    %desc.i =3D alloca %struct.bpf_jit_poke_descriptor, align 8, !DIAssign=
ID !19864
>    %target_size.i =3D alloca i32, align 4, !DIAssignID !19865
>    %patch.i =3D alloca [2 x %struct.bpf_insn], align 16, !DIAssignID !198=
66
>    %patch355.i =3D alloca [2 x %struct.bpf_insn], align 16, !DIAssignID !=
19867
>    %ja.i =3D alloca %struct.bpf_insn, align 8, !DIAssignID !19868
>    %ret_insn.i.i =3D alloca [8 x i32], align 16, !DIAssignID !19869
>    %ret_prog.i.i =3D alloca [8 x i32], align 16, !DIAssignID !19870
>    %fd.i =3D alloca i32, align 4, !DIAssignID !19871
>    %log_true_size =3D alloca i32, align 4, !DIAssignID !19872
> ...
>
> So yes, chk_and_{div,mod,sdiv,smod} consumes quite some stack and
> can be coverted to runtime allocation but that is not enough for 1280
> stack limit, we need to do more conversion from stack to memory
> allocation. Will try to have uniform way to convert
> 'alloca [<num> x %struct.bpf_insn]' to runtime allocation.
>

Do we need to go all the way to dynamic allocation? See env->insns_buf
(which some parts of this function are already using for constructing
instruction patch), let's just converge on that? It pre-allocates
space for 32 instructions, should be sufficient for all the use cases,
no?
