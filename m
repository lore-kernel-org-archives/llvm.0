Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1C31D7995
	for <llvm@lists.linux.dev>; Mon,  8 Sep 2025 04:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757307185; cv=none; b=cpDnf6aENVyLf+rtrNfwRitXt4GnGFKVs+t9CWrFP4Ma7OJR+ihHntmX1PLKQZKcPwSzw1NKprA6YQxfCUPyTuQDV1VccjqbVOtHSNyjl+HrwY2d/WTsMhaxEown+7mv0saix2P7/mTz9Spy2fp9qCNXv/NrLBCaelmhmDlXt0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757307185; c=relaxed/simple;
	bh=bDe+oTYGKqXjGMV4wp7YuUQnt6EQO3MgnrAA2FmUPSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ujrwRdlluBffeoOcX98bFS3e65LeIjKoVOhjp9J6n8k81z7/rNT2OXEkzEDpFcKCEr8vkYK0VKpbOmLBakpf2YHQ2zSQsY0Sh8f0AofNvZPZOFo9EbmVzNZGmJYsriYoUKE86Tm5RvsorMzmjjZ/EMpSR+1wS4TyMV+3PlCVcJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QChLqOOR; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QChLqOOR"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55f6f7edf45so3922382e87.2
        for <llvm@lists.linux.dev>; Sun, 07 Sep 2025 21:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757307181; x=1757911981; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0LQRdujQ1u5i3dMocHWaRijeaazzWqp3JpjpzSpfTs=;
        b=QChLqOORvpz+6dzQmI3NCUKYohssY0SwB5IWICgF5z/Vf09KP8deNW25S4MKR9Tubw
         04htMgkRDjzMooNez/pkauvVQjdcbV76oXSAJA6KJ9xhjr+QcCY32uY8N2dBONd/AOqg
         qc11mQwTx7aiZaXnX/reJ29Hnnx8p3YfyO+R7C01/D9u8oCikBCiIaDR5YJYGQO89Jc1
         k5+8uFP9xDp+gW2ND57k4R5lSxb+/YMy9PZLWFd36+tgYW3eRAVl0UVtdKkvaS/idtz4
         1QEKpoUqSSleKpxgtx9/3KqpFBiAIB6W+j7DKpc+2Cc2nv0dnx4Z4m3jEI6+fpyWoyUp
         hP2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757307181; x=1757911981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x0LQRdujQ1u5i3dMocHWaRijeaazzWqp3JpjpzSpfTs=;
        b=kEVeVHyjYEGmfxsZehEw19t+4QVdUTpNL50uAWiTUW5OdewVwRB5bSAHtZhDouaZuz
         1Mhp8F76LdCTR07NgkV29jOSvtTS7hqEG4qtTR+N1ldMX1eNDLL0EsrSRhOn7mGNhdgt
         NxOQ6/3UklIDagzXKRlnEgF7WfSrKGeno+hMxBVVn4Rniusg8Wf7jwmhsGH3yu9Y1zfW
         u05gQjQVAVijqzhMIOvc2a+h3UVh9UJMA4rOtpaJTo9mZovuWISCOlvcILiFma0uQ03G
         a/Cc1XJHt4nfqrz4vnQVka6+PtMUC3Zp/+JpO7YAwVZFwSv5oFoLWrL/Hg9uKCM3mBgE
         /jaw==
X-Forwarded-Encrypted: i=1; AJvYcCWN/ib0knnanVIUd2uYtOdKEFZfvNo+iDyZw6cn9P7WcahRCHOLSvxF2u+uMLli4dEXDaCe@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/3KCEofBl84OCnX2Huwn5l3I7HH2XiT+xuQkI4gCZG+lqEwnr
	RmFRZvY8rw+60c7bCD+pEQ08HY+O47h6DHWR+8wyzDoHXrJfbtqIi+UJDURPn2twMUlmHMX6nAk
	tVSKRMufXOyVIwpCOjBrDrVS81k9AevmzafSmF5G5Nw==
X-Gm-Gg: ASbGncuCvPNbVurTXAzeODNpTvTBNN8HY3G/hvswnz2qypjNlqQBPn5ifZtOgXKVwDA
	cGgn0ygDVejWo9Gjv5ItQtoTHo6Tcll1dnbUD+iDokmhsgpjIf3s+ljFj5jngOpuxh4zSHbyF13
	VrCmk5wO7Tz3LGtOkUO7H4gljuhTKp+wr36Os8nINGUKPuzfcnmkgkgFC5kqzynOJb9X9zTM+rw
	+YrsWD6vA==
X-Google-Smtp-Source: AGHT+IHxXLO5818IAl84YgA429XsjCrhQ6IpQWvHITxDvO0Bh1WFz8eatiEe2fDrdys1G9BvlpoubANjqZaXwesA6F0=
X-Received: by 2002:a05:6512:3994:b0:55f:503c:d322 with SMTP id
 2adb3069b0e04-56262d25d4cmr1628803e87.40.1757307181253; Sun, 07 Sep 2025
 21:53:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250905051814.291254-1-hoyeon.lee@suse.com> <20250905051814.291254-2-hoyeon.lee@suse.com>
 <ca64e62b-740e-4e02-a386-e1016317b071@linux.dev>
In-Reply-To: <ca64e62b-740e-4e02-a386-e1016317b071@linux.dev>
From: Hoyeon Lee <hoyeon.lee@suse.com>
Date: Mon, 8 Sep 2025 13:52:44 +0900
X-Gm-Features: AS18NWA2MVgylLhC0njVFDJTRSD1Ojs9kXNWbK9lirR8SrUSG1IIQiLIrUb8d7Q
Message-ID: <CAK7-dKZ9fP=2u+-KtwqFiA0SYP-0OUrREjESwvM_vwT4St8ZyA@mail.gmail.com>
Subject: Re: [RFC bpf-next v2 1/1] libbpf: add compile-time OOB warning to bpf_tail_call_static
To: Yonghong Song <yonghong.song@linux.dev>
Cc: netdev@vger.kernel.org, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	"open list:BPF [LIBRARY] (libbpf)" <bpf@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 6, 2025 at 12:55=E2=80=AFAM Yonghong Song <yonghong.song@linux.=
dev> wrote:
>
>
>
> On 9/4/25 10:18 PM, Hoyeon Lee wrote:
> > Add a compile-time check to bpf_tail_call_static() to warn when a
> > constant slot(index) >=3D map->max_entries. This uses a small
> > BPF_MAP_ENTRIES() macro together with Clang's diagnose_if attribute.
> >
> > Clang front-end keeps the map type with a '(*max_entries)[N]' field,
> > so the expression
> >
> >      sizeof(*(m)->max_entries) / sizeof(**(m)->max_entries)
> >
> > is resolved to N entirely at compile time. This allows diagnose_if()
> > to emit a warning when a constant slot index is out of range.
> >
> > Out-of-bounds tail calls are currently silent no-ops at runtime, so
> > emitting a compile-time warning helps detect logic errors earlier.
> > This is currently limited to Clang (due to diagnose_if) and only for
> > constant indices, but should still catch the common cases.
> >
> > Signed-off-by: Hoyeon Lee <hoyeon.lee@suse.com>
> > ---
> > Changes in V2:
> > - add function definition for __bpf_tail_call_warn for compile error
> >
> >   tools/lib/bpf/bpf_helpers.h | 21 +++++++++++++++++++++
> >   1 file changed, 21 insertions(+)
> >
> > diff --git a/tools/lib/bpf/bpf_helpers.h b/tools/lib/bpf/bpf_helpers.h
> > index 80c028540656..98bc1536c497 100644
> > --- a/tools/lib/bpf/bpf_helpers.h
> > +++ b/tools/lib/bpf/bpf_helpers.h
> > @@ -173,6 +173,27 @@ bpf_tail_call_static(void *ctx, const void *map, c=
onst __u32 slot)
> >                    :: [ctx]"r"(ctx), [map]"r"(map), [slot]"i"(slot)
> >                    : "r0", "r1", "r2", "r3", "r4", "r5");
> >   }
> > +
> > +#if __has_attribute(diagnose_if)
> > +static __always_inline void __bpf_tail_call_warn(int oob)
> > +     __attribute__((diagnose_if(oob, "bpf_tail_call: slot >=3D max_ent=
ries",
> > +                                "warning"))) {};
> > +
> > +#define BPF_MAP_ENTRIES(m) \
> > +     ((__u32)(sizeof(*(m)->max_entries) / sizeof(**(m)->max_entries)))
> > +
> > +#ifndef bpf_tail_call_static
> > +#define bpf_tail_call_static(ctx, map, slot)                          =
     \
> > +({                                                                    =
     \
> > +     /* wrapped to avoid double evaluation. */                        =
     \
> > +     const __u32 __slot =3D (slot);                                   =
       \
> > +     __bpf_tail_call_warn(__slot >=3D BPF_MAP_ENTRIES(map));          =
       \
> > +     /* Avoid re-expand & invoke original as (bpf_tail_call_static)(..=
) */ \
> > +     (bpf_tail_call_static)(ctx, map, __slot);                        =
     \
> > +})
> > +#endif /* bpf_tail_call_static */
> > +#endif
>
> I got the following error with llvm21.
>
> progs/tailcall_bpf2bpf3.c:20:3: error: bpf_tail_call: slot >=3D max_entri=
es [-Werror,-Wuser-defined-warnings]
>     20 |                 bpf_tail_call_static(skb, &jmp_table,progs/tailc=
all_bpf2bpf2.c:17:3 10);
>        | :                ^
>   /home/yhs/work/bpf-next/tools/testing/selftests/bpf/tools/include/bpf/b=
pf_helpers.h:190:53: note: expanded from macro
>        'bpf_tail_call_static'
>    190 |         __bpf_tail_call_warn(__slot >=3D BPF_MAP_ENTRIES(map)); =
                \
>        |                                                            ^
> /home/yhs/work/bpf-next/tools/testing/selftests/bpf/tools/include/bpf/bpf=
_helpers.h:179:17: note: from 'diagnose_if'
>        attribute on '__bpf_tail_call_warn':
>    179 |         __attribute__((diagnose_if(oob, "bpf_tail_call: slot >=
=3D max_entries",
>        |                        ^           ~~~
> error: bpf_tail_call: slot >=3D max_entries [-Werror,-Wuser-defined-warni=
ngs]
>     17 |                 bpf_tail_call_static(skb, &jmp_table, 1);
>        |                 ^
> /home/yhs/work/bpf-next/tools/testing/selftests/bpf/tools/include/bpf/bpf=
_helpers.h:190:53: note: expanded from macro
>        'bpf_tail_call_static'
>    190 |         __bpf_tail_call_warn(__slot >=3D BPF_MAP_ENTRIES(map)); =
                \
>        |                                                            ^
> /home/yhs/work/bpf-next/tools/testing/selftests/bpf/tools/include/bpf/bpf=
_helpers.h:179:17: note: from 'diagnose_if'
>        attribute on '__bpf_tail_call_warn':
>    179 |         __attribute__((diagnose_if(oob, "bpf_tail_call: slot >=
=3D max_entries",
>        |                        ^           ~~~
>    CLNG-BPF [test_progs] tailcall_poke.bpf.o
> 1 error generated.
> make: *** [Makefile:733: /home/yhs/work/bpf-next/tools/testing/selftests/=
bpf/tailcall_bpf2bpf3.bpf.o] Error 1
>

Thank you for sharing build results! Checked BPF CI, and found 2 issues:

1. selftests/bpf promote warnings to errors (-Werror)
For bpf2bpf tail-call variant progs that intentionally calls OOB trigger
this diagnostic, relaxing just those files keeps CI green while still
showing the warning:

        # tools/testing/selftests/bpf/Makefile
        progs/tailcall_bpf2bpf%.c-CFLAGS :=3D -Wno-error=3Duser-defined-war=
nings

2. 'void *' maps build error  (bpf2bpf / map-in-map)
The proposed warning is meant only for typed .maps objects. When a prog
passes a void * map, BPF_MAP_ENTRIES() must not attempt member
access. A _Generic gate fixes this by filtering only for typed maps and
yielding 0U for void* families:

        # from BPF-CI build error
        # function prototype:
        #         int subprog_tail(struct __sk_buff *skb, void *jmp_table)
        progs/tailcall_bpf2bpf_hierarchy3.c:36:2: error: member
reference base type 'void' is not a structure or union
          36 | bpf_tail_call_static(skb, jmp_table, 0);
               | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

fixes:

        #define BPF_MAP_ENTRIES(m) _Generic((m), \
               void *:                 0U,      \
               const void *:           0U,      \
               volatile void *:        0U,      \
               const volatile void *:  0U,      \
               default:
((__u32)(sizeof(*(m)->max_entries) / sizeof(**(m)->max_entries))) \
       )

This avoids the compile error, but this is not a very clean solution.

As Andrii Nakryiko noted, map->max_entries can be changed at runtime,
which makes this compile-time approach misleading. I hadn=E2=80=99t conside=
red
that, so this RFC seems less practical to pursue further. Still, I=E2=80=99=
m
sharing the troubleshooting above in case parts of it may be useful for
future attempts.


> > +
> >   #endif
> >   #endif
> >
> > --
> > 2.51.0
>
