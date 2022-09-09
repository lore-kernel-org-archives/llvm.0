Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A3E33FE
	for <llvm@lists.linux.dev>; Fri,  9 Sep 2022 18:56:57 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id lz22so6137414ejb.3
        for <llvm@lists.linux.dev>; Fri, 09 Sep 2022 11:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=tLU+ycHziNs/pkrPR4j/MVBfGIX3SGWG6BgD8lRmfXk=;
        b=fvSdlyY2Hl2sJfiMUY0PNnp84mb0mp4SF/dD7VyJgUcRA9+Ziy9MgzCNKBzk43tl/4
         j+/6kZHzu+mPxFb9nPK5fLcrEUiyerKEXdQ7WYTLlwXcYpp1H3zJrfjqRNHlpCdzWCG+
         lr4FyXMmeNlOAtJPKfYMJqTpPhdzEALFerJH9r7lIBeVvtzlMG/Vw9ZkP+iUUkGkPjNU
         hETih9um6jPmItYxzAZxOzbcL2r1xK+vD4eY6HTImjzhu7T6/DmJg9Lgo/C26DdJjTX1
         nDqrdvVduICXnL1OMhllXyMgr6hnbo9dJC+/W/Eper7IV+kzd/blFy4g9HEaeXmjl/3G
         Q/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=tLU+ycHziNs/pkrPR4j/MVBfGIX3SGWG6BgD8lRmfXk=;
        b=DyzKTikuX61P/MBOs3nMdgo99YpteMhYijsi7Jj6fWiUdnJaxCd/2huzuFNj/7SeKG
         7sbzTEIvJBSua5N/SmYqsoKCyYuUau1k40VTvIEy8uVxlqmTJlXsnmePtNGv6ge8qWK0
         mGzn9q2px40VievwFt8RC2W0NDxD99sgWb4FhsGiX3q0zeOjHEGHFbDh1nL+E0qDYdR+
         OXsmvYUFGEfeGuljR7xVC+DIljRetugEK9ymFrQSdtm1LBBzgUkSbUKsKz5iglspBdbJ
         hWheWOtuBiVqUYIuubP1VJbxZLU4WM3eLmMIi89c4VYeL72gRPxGcAlAoJtK8l1JJtBI
         0Lew==
X-Gm-Message-State: ACgBeo2KaLFR7iABDPpFV3l7ObywZEQpY95rR8388qGoHn3pQsUe4wEp
	9CNDlayNt/4W7qjylUS04P4bXPmBjqTh7gycmX0=
X-Google-Smtp-Source: AA6agR66O9Yn/Br9+6dOkc+2BbQtzjLGmEvmeaJrFl+GxkerWLdH66FPFt6RWWlpV1fi6FT4lr0f21AGvglvuXM0/cs=
X-Received: by 2002:a17:907:7e92:b0:741:5f7e:f1ac with SMTP id
 qb18-20020a1709077e9200b007415f7ef1acmr11044757ejc.176.1662749815408; Fri, 09
 Sep 2022 11:56:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220829210546.755377-1-james.hilliard1@gmail.com>
 <CAEf4Bza6g4tZDtuKCaBwVVJSHUrLYh=pbUffPBpmWtR-xyXyqQ@mail.gmail.com> <CADvTj4pF=D7PEBF-LK_sKckRUCq-vd9ZjohpiEgLvORg8UaZyw@mail.gmail.com>
In-Reply-To: <CADvTj4pF=D7PEBF-LK_sKckRUCq-vd9ZjohpiEgLvORg8UaZyw@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 9 Sep 2022 11:56:44 -0700
Message-ID: <CAEf4BzbjMWC50J-mn_aNd2BeJWU=nLJmsJCAVvTqLSYsh4RejA@mail.gmail.com>
Subject: Re: [PATCH v2] libbpf: add GCC support for bpf_tail_call_static
To: James Hilliard <james.hilliard1@gmail.com>
Cc: "Jose E. Marchesi" <jose.marchesi@oracle.com>, "Jose E. Marchesi" <jemarch@gnu.org>, 
	David Faust <david.faust@oracle.com>, bpf@vger.kernel.org, 
	Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 9, 2022 at 11:23 AM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> On Fri, Sep 9, 2022 at 12:05 PM Andrii Nakryiko
> <andrii.nakryiko@gmail.com> wrote:
> >
> > On Mon, Aug 29, 2022 at 2:05 PM James Hilliard
> > <james.hilliard1@gmail.com> wrote:
> > >
> > > The bpf_tail_call_static function is currently not defined unless
> > > using clang >= 8.
> > >
> > > To support bpf_tail_call_static on GCC we can check if __clang__ is
> > > not defined to enable bpf_tail_call_static.
> > >
> > > We need to use GCC assembly syntax when the compiler does not define
> > > __clang__ as LLVM inline assembly is not fully compatible with GCC.
> > >
> > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > ---
> > > Changes v1 -> v2:
> > >   - drop __BPF__ check as GCC now defines __bpf__
> > > ---
> > >  tools/lib/bpf/bpf_helpers.h | 19 +++++++++++++------
> > >  1 file changed, 13 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/tools/lib/bpf/bpf_helpers.h b/tools/lib/bpf/bpf_helpers.h
> > > index 7349b16b8e2f..867b734839dd 100644
> > > --- a/tools/lib/bpf/bpf_helpers.h
> > > +++ b/tools/lib/bpf/bpf_helpers.h
> > > @@ -131,7 +131,7 @@
> > >  /*
> > >   * Helper function to perform a tail call with a constant/immediate map slot.
> > >   */
> > > -#if __clang_major__ >= 8 && defined(__bpf__)
> > > +#if (!defined(__clang__) || __clang_major__ >= 8) && defined(__bpf__)
> > >  static __always_inline void
> > >  bpf_tail_call_static(void *ctx, const void *map, const __u32 slot)
> > >  {
> > > @@ -139,8 +139,8 @@ bpf_tail_call_static(void *ctx, const void *map, const __u32 slot)
> > >                 __bpf_unreachable();
> > >
> > >         /*
> > > -        * Provide a hard guarantee that LLVM won't optimize setting r2 (map
> > > -        * pointer) and r3 (constant map index) from _different paths_ ending
> > > +        * Provide a hard guarantee that the compiler won't optimize setting r2
> > > +        * (map pointer) and r3 (constant map index) from _different paths_ ending
> > >          * up at the _same_ call insn as otherwise we won't be able to use the
> > >          * jmpq/nopl retpoline-free patching by the x86-64 JIT in the kernel
> > >          * given they mismatch. See also d2e4c1e6c294 ("bpf: Constant map key
> > > @@ -148,12 +148,19 @@ bpf_tail_call_static(void *ctx, const void *map, const __u32 slot)
> > >          *
> > >          * Note on clobber list: we need to stay in-line with BPF calling
> > >          * convention, so even if we don't end up using r0, r4, r5, we need
> > > -        * to mark them as clobber so that LLVM doesn't end up using them
> > > -        * before / after the call.
> > > +        * to mark them as clobber so that the compiler doesn't end up using
> > > +        * them before / after the call.
> > >          */
> > > -       asm volatile("r1 = %[ctx]\n\t"
> > > +       asm volatile(
> > > +#ifdef __clang__
> > > +                    "r1 = %[ctx]\n\t"
> > >                      "r2 = %[map]\n\t"
> > >                      "r3 = %[slot]\n\t"
> > > +#else
> > > +                    "mov %%r1,%[ctx]\n\t"
> > > +                    "mov %%r2,%[map]\n\t"
> > > +                    "mov %%r3,%[slot]\n\t"
> > > +#endif
> >
> > Hey James,
> >
> > I don't think it's a good idea to have a completely different BPF asm
> > syntax in GCC-BPF vs what Clang is supporting. Note that Clang syntax
> > is also what BPF users see in BPF verifier log and in llvm-objdump
> > output, so that's what BPF users are familiar with.
>
> Is the difference a BPF specific assembly format deviation or a generic
> deviation in assembler template syntax between GCC/llvm?
> https://gcc.gnu.org/onlinedocs/gcc/Extended-Asm.html#AssemblerTemplate
>

Sorry, I don't understand the question. I'm talking about the above
snippet with "r1 = %[ctx]" vs "mov %%r1,%[ctx]". Seems like the rest
stayed the same. So this would be a "BPF specific assembly format"
case, right? I don't know what else could be different with GCC-BPF
assembly.

> >
> > This will cause constant and unavoidable maintenance burden both for
> > libraries like libbpf and end users and their BPF apps as well.
> >
> > Given you are trying to make GCC-BPF part of the BPF ecosystem, please
> > think about how to help the ecosystem, move it forward and unify it,
> > not how to branch out and have Clang vs GCC differences everywhere.
> > There is a lot of embedded BPF asm in production applications, having
> > to write something as trivial as `r1 = X` in GCC or Clang-specific
> > ways is a huge burden.
> >
> > As such, we've reverted your patch ([0]). Please add de facto BPF asm
> > syntax support to GCC-BPF and this change won't be necessary.
> >
> >   [0] https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?id=665f5d3577ef43e929d59cf39683037887c351bf
> >
> > >                      "call 12"
> > >                      :: [ctx]"r"(ctx), [map]"r"(map), [slot]"i"(slot)
> > >                      : "r0", "r1", "r2", "r3", "r4", "r5");
> > > --
> > > 2.34.1
> > >
