Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A4115AC
	for <llvm@lists.linux.dev>; Wed, 13 Jul 2022 01:29:52 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id v187so4825285oie.7
        for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 18:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GK56lB3PgJDNhfaok+bTYlsAaggXRH2qzENpya+MjIk=;
        b=BIiHRPkfm5uUS9EINwjJTTl02ZHOw+1lWUrQgXLiFWy88JWNNSG6FOAn2GaqsG6/+i
         Ck3hj5FYFJwUk3+vwRQbgl3Wj80YpD+4cDA7S46IstV8xoV+juwnGUbUK9MSTgSSrXsu
         dG9H3hX4hnmZpLxArIGrPcpDgggwVLI3+ep3aoWOztLWewYLZ512ZyXsXC4v3jGQZ9sQ
         gSb91cGpCRNPMJxfY1TmxbE9flhuuPz57f52zjVMPudYHMZI6VV1QcSvLKK5O9sN2Xs2
         y7m1POrjIBsrdplt7Wb6kQslyXejWP7nLZVe4E1erCPNKV9M+bAcfuEgQhTUsoE2yXop
         r5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GK56lB3PgJDNhfaok+bTYlsAaggXRH2qzENpya+MjIk=;
        b=y2ASTDeghECOMXviUGV0IXgLYnlW6UBqMXuafnZs4qdNf11gMBL6XWEyrW4h4x9gxg
         NuVRoJy+lVRjr6rF7xncYdPcu3j13LwQDrNZk7r7z9bDQ9YFv2jkxSRNtZpedbRXlotM
         aWpqvlslM6g1dR1P6dIMqYL2mAxKAfuXZGqMaxDpC2ULk4apWaV/n9SZHOxuR6mtF1uj
         i9MsWcy+kT87GZ3wtYN6fM0hFSbkzxoU5WjQzSKVsN8p8LEKtgAF0zdd3Mt/Hi+TB3UT
         IMqKvLDFlt0XcNJrMZU/VwkBNOX9EDkFJpoNONvpR0+byCO15ph9nITUe4mrfY54yO/t
         fYng==
X-Gm-Message-State: AJIora8AR5AZmBUChLHJ8EnXkquuM66DPNBMz4nLDZasQ3wj+Ywe2HXx
	zFYCNRQckgzQnMQ3gEUuy+I/2iocxGWKjvcesdc=
X-Google-Smtp-Source: AGRyM1sLoklF8WRKdEsdNJ5hpTSlHf8xvFYF1n9dV7kANUWNdHd6/uGg4fdXwQCiXzrwrku+R0RFY3OPegLt/UcEO04=
X-Received: by 2002:a05:6808:308f:b0:339:f8af:ea62 with SMTP id
 bl15-20020a056808308f00b00339f8afea62mr583274oib.99.1657675791218; Tue, 12
 Jul 2022 18:29:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220706172814.169274-1-james.hilliard1@gmail.com>
 <a0bddf0b-e8c4-46ce-b7c6-a22809af1677@fb.com> <CADvTj4ovwExtM-bWUpJELy-OqsT=J9stmqbAXto8ds2n+G8mfw@mail.gmail.com>
 <CAEf4BzYwRyXG1zE5BK1ZXmxLh+ZPU0=yQhNhpqr0JmfNA30tdQ@mail.gmail.com>
 <87v8s260j1.fsf@oracle.com> <CAADnVQLQGHoj_gCOvdFFw2pRxgMubPSp+bRpFeCSa5zvcK2qRQ@mail.gmail.com>
 <CADvTj4qqxckZmxvL=97e-2W5M4DgCCMDV8RCFDg23+cY2URjTA@mail.gmail.com> <20220713011851.4a2tnqhdd5f5iwak@macbook-pro-3.dhcp.thefacebook.com>
In-Reply-To: <20220713011851.4a2tnqhdd5f5iwak@macbook-pro-3.dhcp.thefacebook.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 12 Jul 2022 19:29:39 -0600
Message-ID: <CADvTj4o7z7J=4BOtKM9dthZyfFogV6hL5zKBwiBq7vs+bNhUHA@mail.gmail.com>
Subject: Re: [PATCH v2] bpf/scripts: Generate GCC compatible helpers
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: "Jose E. Marchesi" <jose.marchesi@oracle.com>, Andrii Nakryiko <andrii.nakryiko@gmail.com>, 
	Quentin Monnet <quentin@isovalent.com>, Yonghong Song <yhs@fb.com>, bpf <bpf@vger.kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Networking <netdev@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 12, 2022 at 7:18 PM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Tue, Jul 12, 2022 at 07:10:27PM -0600, James Hilliard wrote:
> > On Tue, Jul 12, 2022 at 10:48 AM Alexei Starovoitov
> > <alexei.starovoitov@gmail.com> wrote:
> > >
> > > On Tue, Jul 12, 2022 at 4:20 AM Jose E. Marchesi
> > > <jose.marchesi@oracle.com> wrote:
> > > >
> > > >
> > > > > CC Quentin as well
> > > > >
> > > > > On Mon, Jul 11, 2022 at 5:11 PM James Hilliard
> > > > > <james.hilliard1@gmail.com> wrote:
> > > > >>
> > > > >> On Mon, Jul 11, 2022 at 5:36 PM Yonghong Song <yhs@fb.com> wrote:
> > > > >> >
> > > > >> >
> > > > >> >
> > > > >> > On 7/6/22 10:28 AM, James Hilliard wrote:
> > > > >> > > The current bpf_helper_defs.h helpers are llvm specific and don't work
> > > > >> > > correctly with gcc.
> > > > >> > >
> > > > >> > > GCC appears to required kernel helper funcs to have the following
> > > > >> > > attribute set: __attribute__((kernel_helper(NUM)))
> > > > >> > >
> > > > >> > > Generate gcc compatible headers based on the format in bpf-helpers.h.
> > > > >> > >
> > > > >> > > This adds conditional blocks for GCC while leaving clang codepaths
> > > > >> > > unchanged, for example:
> > > > >> > >       #if __GNUC__ && !__clang__
> > > > >> > >       void *bpf_map_lookup_elem(void *map, const void *key)
> > > > >> > > __attribute__((kernel_helper(1)));
> > > > >> > >       #else
> > > > >> > >       static void *(*bpf_map_lookup_elem)(void *map, const void *key) = (void *) 1;
> > > > >> > >       #endif
> > > > >> >
> > > > >> > It does look like that gcc kernel_helper attribute is better than
> > > > >> > '(void *) 1' style. The original clang uses '(void *) 1' style is
> > > > >> > just for simplicity.
> > > > >>
> > > > >> Isn't the original style going to be needed for backwards compatibility with
> > > > >> older clang versions for a while?
> > > > >
> > > > > I'm curious, is there any added benefit to having this special
> > > > > kernel_helper attribute vs what we did in Clang for a long time?
> > > > > Did GCC do it just to be different and require workarounds like this
> > > > > or there was some technical benefit to this?
> > > >
> > > > We did it that way so we could make trouble and piss you off.
> > > >
> > > > Nah :)
> > > >
> > > > We did it that way because technically speaking the clang construction
> > > > works relying on particular optimizations to happen to get correct
> > > > compiled programs, which is not guaranteed to happen and _may_ break in
> > > > the future.
> > > >
> > > > In fact, if you compile a call to such a function prototype with clang
> > > > with -O0 the compiler will try to load the function's address in a
> > > > register and then emit an invalid BPF instruction:
> > > >
> > > >   28:   8d 00 00 00 03 00 00 00         *unknown*
> > > >
> > > > On the other hand the kernel_helper attribute is bullet-proof: will work
> > > > with any optimization level, with any version of the compiler, and in
> > > > our opinion it is also more readable, more tidy and more correct.
> > > >
> > > > Note I'm not saying what you do in clang is not reasonable; it may be,
> > > > obviously it works well enough for you in practice.  Only that we have
> > > > good reasons for doing it differently in GCC.
> > >
> > > Not questioning the validity of the reasons, but they created
> > > the unnecessary difference between compilers.
> >
> > Sounds to me like clang is relying on an unreliable hack that may
> > be difficult to implement in GCC, so let's see what's the best option
> > moving forwards in terms of a migration path for both GCC and clang.
>
> The following is a valid C code:
> static long (*foo) (void) = (void *) 1234;
> foo();
>
> and GCC has to generate correct assembly assuming it runs at -O1 or higher.

Providing -O1 or higher with gcc-bpf does not seem to work at the moment.

> There is no indirect call insn defined in BPF ISA yet,
> so the -O0 behavior is undefined.

Well GCC at least seems to be able to compile BPF programs with -O0 using
kernel_helper. I assume -O0 is probably just targeting the minimum BPF ISA
optimization level or something like that which avoids indirect calls.

>
> > Or we can just feature detect kernel_helper and leave the (void *)1 style
> > fallback in place until we drop support for clang variants that don't support
> > kernel_helper. This would provide GCC compatibility and a better migration
> > path for clang as well as clang will then automatically use the new variant
> > whenever support for kernel_helper is introduced.
>
> Support for valid C code will not be dropped from clang.

That wasn't what I was suggesting, I was suggesting adding support for
kernel_helper to clang, and then in the future libbpf(not clang) can
drop support
for the (void *)1 style in the future if desired(or can just keep the
fallback). By
feature detecting kernel_helper and providing a fallback we get a nice clean
migration path.
