Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0084681
	for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 16:48:19 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id h23so15328361ejj.12
        for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 09:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mbcmmT+pMIMYMSXXNjbFWB+IQNvMXD49nlszvCumBmU=;
        b=C1vtv/hzFoN+4KUlqwUzTpCbKy6osNIrSgaVsPH2ISYa96ePHQDacSsKJieasMjDbW
         xQI+2uqQcp+HXJH4Jnpi+G1ApZQOCEsLycWTM3DqBia6powR7ttUJSwGGXT5y9tFxrsL
         mA/fbxw9AoAeeGMXWPdEeVKS60RwLdjij3kub586mW+2jlmcVpPAReibwGwnBBcqaCrZ
         +0fsFwlHPyxePGt3TUDYuWU/JZwniI+wJJA1Sh1OpGwWmuypq4MXTDkbA/UtNV2NGWpP
         zXWx4GuVCBZXpX7HmrZUtEYp+HVNYN9YyERwAX29yTRiQTiTyTlZQtc56VrhsipDOsBE
         ssPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mbcmmT+pMIMYMSXXNjbFWB+IQNvMXD49nlszvCumBmU=;
        b=eqj5uIxsZ4lb83ZnhRuSRpcb2PHtAG4N3bmW9QOFLSZsD2ePeliwCNsVG4/qYtAPas
         d5p/PHkuzcW5Qj+BHNUBV3M/JsTSIBF3a0l4PjZTUtfgk7yNfLJ7bvRvb4I2aGLhd79H
         eEsOszXLVwsnxWjOfV/ChfkMNz3ICUX+l4WGOVY0yG0HyOiQcne93lCXGm1rymUPTskM
         LSvTxPMfKLSGTEqZCHVUI7VxtYzf0/2owQKrbvhQBqiUIOgY2QlJ3TGXjI6BmsJAfjqX
         U9baVC6jY63kMTKvRoL8LguPkyYosIdnPibCti36T8PyH+R/en66CM9d6DDNb0GzDqBf
         250w==
X-Gm-Message-State: AJIora/ueYf/EtgQbkKyM5KiGwvFJNrrvTPaNWd3KyLQvhTe50z0rJck
	q3v4/zc8Zh0066aupZrys+4i6JnWLwoH0OitXD8=
X-Google-Smtp-Source: AGRyM1ult/9veqdiVtMu6Yt+QfiYXMYM/CbHEUmsdXJfyLCmDL4cncCV1h1TX4KkfDkaeoJZksDdv+HaMlACJA7Ni9E=
X-Received: by 2002:a17:907:6e03:b0:726:a6a3:7515 with SMTP id
 sd3-20020a1709076e0300b00726a6a37515mr25271067ejc.676.1657644497455; Tue, 12
 Jul 2022 09:48:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220706172814.169274-1-james.hilliard1@gmail.com>
 <a0bddf0b-e8c4-46ce-b7c6-a22809af1677@fb.com> <CADvTj4ovwExtM-bWUpJELy-OqsT=J9stmqbAXto8ds2n+G8mfw@mail.gmail.com>
 <CAEf4BzYwRyXG1zE5BK1ZXmxLh+ZPU0=yQhNhpqr0JmfNA30tdQ@mail.gmail.com> <87v8s260j1.fsf@oracle.com>
In-Reply-To: <87v8s260j1.fsf@oracle.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 12 Jul 2022 09:48:05 -0700
Message-ID: <CAADnVQLQGHoj_gCOvdFFw2pRxgMubPSp+bRpFeCSa5zvcK2qRQ@mail.gmail.com>
Subject: Re: [PATCH v2] bpf/scripts: Generate GCC compatible helpers
To: "Jose E. Marchesi" <jose.marchesi@oracle.com>
Cc: Andrii Nakryiko <andrii.nakryiko@gmail.com>, James Hilliard <james.hilliard1@gmail.com>, 
	Quentin Monnet <quentin@isovalent.com>, Yonghong Song <yhs@fb.com>, bpf <bpf@vger.kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Networking <netdev@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 12, 2022 at 4:20 AM Jose E. Marchesi
<jose.marchesi@oracle.com> wrote:
>
>
> > CC Quentin as well
> >
> > On Mon, Jul 11, 2022 at 5:11 PM James Hilliard
> > <james.hilliard1@gmail.com> wrote:
> >>
> >> On Mon, Jul 11, 2022 at 5:36 PM Yonghong Song <yhs@fb.com> wrote:
> >> >
> >> >
> >> >
> >> > On 7/6/22 10:28 AM, James Hilliard wrote:
> >> > > The current bpf_helper_defs.h helpers are llvm specific and don't work
> >> > > correctly with gcc.
> >> > >
> >> > > GCC appears to required kernel helper funcs to have the following
> >> > > attribute set: __attribute__((kernel_helper(NUM)))
> >> > >
> >> > > Generate gcc compatible headers based on the format in bpf-helpers.h.
> >> > >
> >> > > This adds conditional blocks for GCC while leaving clang codepaths
> >> > > unchanged, for example:
> >> > >       #if __GNUC__ && !__clang__
> >> > >       void *bpf_map_lookup_elem(void *map, const void *key)
> >> > > __attribute__((kernel_helper(1)));
> >> > >       #else
> >> > >       static void *(*bpf_map_lookup_elem)(void *map, const void *key) = (void *) 1;
> >> > >       #endif
> >> >
> >> > It does look like that gcc kernel_helper attribute is better than
> >> > '(void *) 1' style. The original clang uses '(void *) 1' style is
> >> > just for simplicity.
> >>
> >> Isn't the original style going to be needed for backwards compatibility with
> >> older clang versions for a while?
> >
> > I'm curious, is there any added benefit to having this special
> > kernel_helper attribute vs what we did in Clang for a long time?
> > Did GCC do it just to be different and require workarounds like this
> > or there was some technical benefit to this?
>
> We did it that way so we could make trouble and piss you off.
>
> Nah :)
>
> We did it that way because technically speaking the clang construction
> works relying on particular optimizations to happen to get correct
> compiled programs, which is not guaranteed to happen and _may_ break in
> the future.
>
> In fact, if you compile a call to such a function prototype with clang
> with -O0 the compiler will try to load the function's address in a
> register and then emit an invalid BPF instruction:
>
>   28:   8d 00 00 00 03 00 00 00         *unknown*
>
> On the other hand the kernel_helper attribute is bullet-proof: will work
> with any optimization level, with any version of the compiler, and in
> our opinion it is also more readable, more tidy and more correct.
>
> Note I'm not saying what you do in clang is not reasonable; it may be,
> obviously it works well enough for you in practice.  Only that we have
> good reasons for doing it differently in GCC.

Not questioning the validity of the reasons, but they created
the unnecessary difference between compilers.
We have to avoid forking.
Meaning we're not going to work around that by ifdefs in
bpf_helper_defs.h
Because gcc community will not learn the lesson and will keep
the bad practice of unnecessary forks.
The best path forward here is to support both (void *) 1 style
and kernel_helper attribute in both gcc and llvm.
Moving forward the bpf_helper_defs.h will stay with (void *)1 style
and when both compilers support both options we will start
transitioning to the new kernel_helpers style.
