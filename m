Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C07415AC
	for <llvm@lists.linux.dev>; Wed, 13 Jul 2022 01:18:56 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id p9so9858773pjd.3
        for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 18:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i4p6sm+Eaw9H7Av5dxRsvpT90Zq1tawHBOllyyWvACc=;
        b=OLRPCA998W2mo1p8Be6KjHk7nFx2CLbdGrEeS0v29zc77Y1qCAjdoEZgP2/WhRwCzJ
         KTwIFCXaJ4HSojneMaX2p9Agmu70nr1IdUWo7SGn5cfKEaDJMa6jP/Qj53GVCH7Ofiry
         NXsdsAGTogVQzlCX7YxhxAoWhsXR27znvdS3qoDF0Lc010cUX3/RQUqRlpTbBTd535qb
         jnccZRO9MdwdQE4CL6ypDJn+hUTUGuy9Z1mUVtINPzdg1Ks7j4pDaMaYg9RowIu+NLOs
         fs2YESYSZB6YT23o0tPkakwwc6xbK7MYY/MHmkm7IuokJDQBxLEDGFH8cCykymnJOoD4
         m5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i4p6sm+Eaw9H7Av5dxRsvpT90Zq1tawHBOllyyWvACc=;
        b=G9VAa4XvJLPLb9/+/+VnCcDHkDGTGnAPZmhm8/B7NUNsoPSkt3Sd/l2v3pVPPYHMCS
         da2fEDEMzTgU3/yutI213tIFgNA3sBCTRDoclhvU1QnF6IFDb4Gc+cR19NnZdiyabgO1
         KwI6CW5ExPNDb20yH9JyUBe9s7vRR7nyMI59wocHN6MTInMqBMRpIdNtqJ6+WhfdNGJL
         rM6kYlX6UoPhfBN0GA8XVIFjGrYZnCHK0kAN4UStaO7Wm0A35q/qZOZgaYHICCStadKc
         3krf5MAe6vE9fdbe1ob3uBXAsGvO9bf1EJuQBr64zeAg9wJ7R1Jl4ch2VLkRpF9XEwZF
         /dpA==
X-Gm-Message-State: AJIora9OvD2sDPloBz1L9XH5+au+Dk248YhT5/QGYuhmj1DZfwSfnUk7
	ClXv74YqTjx9CT8OO6zKsOY=
X-Google-Smtp-Source: AGRyM1s8e7UcOBYXjxFH2HF0arrPOwvEfqutFDCXqptOH9tFr1rcvXYFHeqFmW2NSPgrDSVLE3th6w==
X-Received: by 2002:a17:90b:4a04:b0:1ef:c318:ef9c with SMTP id kk4-20020a17090b4a0400b001efc318ef9cmr7313697pjb.67.1657675135536;
        Tue, 12 Jul 2022 18:18:55 -0700 (PDT)
Received: from macbook-pro-3.dhcp.thefacebook.com ([2620:10d:c090:400::5:580c])
        by smtp.gmail.com with ESMTPSA id j4-20020a170902c3c400b0016bf24611e7sm7478169plj.5.2022.07.12.18.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 18:18:55 -0700 (PDT)
Date: Tue, 12 Jul 2022 18:18:51 -0700
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: "Jose E. Marchesi" <jose.marchesi@oracle.com>,
	Andrii Nakryiko <andrii.nakryiko@gmail.com>,
	Quentin Monnet <quentin@isovalent.com>, Yonghong Song <yhs@fb.com>,
	bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Networking <netdev@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] bpf/scripts: Generate GCC compatible helpers
Message-ID: <20220713011851.4a2tnqhdd5f5iwak@macbook-pro-3.dhcp.thefacebook.com>
References: <20220706172814.169274-1-james.hilliard1@gmail.com>
 <a0bddf0b-e8c4-46ce-b7c6-a22809af1677@fb.com>
 <CADvTj4ovwExtM-bWUpJELy-OqsT=J9stmqbAXto8ds2n+G8mfw@mail.gmail.com>
 <CAEf4BzYwRyXG1zE5BK1ZXmxLh+ZPU0=yQhNhpqr0JmfNA30tdQ@mail.gmail.com>
 <87v8s260j1.fsf@oracle.com>
 <CAADnVQLQGHoj_gCOvdFFw2pRxgMubPSp+bRpFeCSa5zvcK2qRQ@mail.gmail.com>
 <CADvTj4qqxckZmxvL=97e-2W5M4DgCCMDV8RCFDg23+cY2URjTA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADvTj4qqxckZmxvL=97e-2W5M4DgCCMDV8RCFDg23+cY2URjTA@mail.gmail.com>

On Tue, Jul 12, 2022 at 07:10:27PM -0600, James Hilliard wrote:
> On Tue, Jul 12, 2022 at 10:48 AM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> >
> > On Tue, Jul 12, 2022 at 4:20 AM Jose E. Marchesi
> > <jose.marchesi@oracle.com> wrote:
> > >
> > >
> > > > CC Quentin as well
> > > >
> > > > On Mon, Jul 11, 2022 at 5:11 PM James Hilliard
> > > > <james.hilliard1@gmail.com> wrote:
> > > >>
> > > >> On Mon, Jul 11, 2022 at 5:36 PM Yonghong Song <yhs@fb.com> wrote:
> > > >> >
> > > >> >
> > > >> >
> > > >> > On 7/6/22 10:28 AM, James Hilliard wrote:
> > > >> > > The current bpf_helper_defs.h helpers are llvm specific and don't work
> > > >> > > correctly with gcc.
> > > >> > >
> > > >> > > GCC appears to required kernel helper funcs to have the following
> > > >> > > attribute set: __attribute__((kernel_helper(NUM)))
> > > >> > >
> > > >> > > Generate gcc compatible headers based on the format in bpf-helpers.h.
> > > >> > >
> > > >> > > This adds conditional blocks for GCC while leaving clang codepaths
> > > >> > > unchanged, for example:
> > > >> > >       #if __GNUC__ && !__clang__
> > > >> > >       void *bpf_map_lookup_elem(void *map, const void *key)
> > > >> > > __attribute__((kernel_helper(1)));
> > > >> > >       #else
> > > >> > >       static void *(*bpf_map_lookup_elem)(void *map, const void *key) = (void *) 1;
> > > >> > >       #endif
> > > >> >
> > > >> > It does look like that gcc kernel_helper attribute is better than
> > > >> > '(void *) 1' style. The original clang uses '(void *) 1' style is
> > > >> > just for simplicity.
> > > >>
> > > >> Isn't the original style going to be needed for backwards compatibility with
> > > >> older clang versions for a while?
> > > >
> > > > I'm curious, is there any added benefit to having this special
> > > > kernel_helper attribute vs what we did in Clang for a long time?
> > > > Did GCC do it just to be different and require workarounds like this
> > > > or there was some technical benefit to this?
> > >
> > > We did it that way so we could make trouble and piss you off.
> > >
> > > Nah :)
> > >
> > > We did it that way because technically speaking the clang construction
> > > works relying on particular optimizations to happen to get correct
> > > compiled programs, which is not guaranteed to happen and _may_ break in
> > > the future.
> > >
> > > In fact, if you compile a call to such a function prototype with clang
> > > with -O0 the compiler will try to load the function's address in a
> > > register and then emit an invalid BPF instruction:
> > >
> > >   28:   8d 00 00 00 03 00 00 00         *unknown*
> > >
> > > On the other hand the kernel_helper attribute is bullet-proof: will work
> > > with any optimization level, with any version of the compiler, and in
> > > our opinion it is also more readable, more tidy and more correct.
> > >
> > > Note I'm not saying what you do in clang is not reasonable; it may be,
> > > obviously it works well enough for you in practice.  Only that we have
> > > good reasons for doing it differently in GCC.
> >
> > Not questioning the validity of the reasons, but they created
> > the unnecessary difference between compilers.
> 
> Sounds to me like clang is relying on an unreliable hack that may
> be difficult to implement in GCC, so let's see what's the best option
> moving forwards in terms of a migration path for both GCC and clang.

The following is a valid C code:
static long (*foo) (void) = (void *) 1234;
foo();

and GCC has to generate correct assembly assuming it runs at -O1 or higher.
There is no indirect call insn defined in BPF ISA yet,
so the -O0 behavior is undefined.

> Or we can just feature detect kernel_helper and leave the (void *)1 style
> fallback in place until we drop support for clang variants that don't support
> kernel_helper. This would provide GCC compatibility and a better migration
> path for clang as well as clang will then automatically use the new variant
> whenever support for kernel_helper is introduced.

Support for valid C code will not be dropped from clang.
