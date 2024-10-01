Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BCE1BBBCA
	for <llvm@lists.linux.dev>; Tue,  1 Oct 2024 07:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727768399; cv=none; b=g/WLCMLnSHVpVZnl4T8gGrvb4zRbheBBkZBTX+pk/w50XBBzw3ICVnx41nEXL6FETUYkf7AAgJYmR+bw7tlEuUktFcgI2uMLUD8Sw3dn5JgBpPUqo7MoHqXc6d59uIoqLRMR6FDv7A5NGMi/4bMGnI+rWGrL3dlGpQcRoaLLZWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727768399; c=relaxed/simple;
	bh=za16NxIQDUGjjHP2c29sw6PI8ZU3lXszSx4jSWmr5Jk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gs1Vlb39N+XmFyhOeSWV4HH9lzSLiE41NhmnxX/eJOYaPkrQukle5QKp6eexE760VeACnvemTTg6q4R2woDbDQ4SYtmLCljnKwuIRo26inm4taTB+AwKKdD8HDrvig05ViTX9WH7/7r/ALZGLDecw2+p7SyXoYJu8vH9a16f76I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A+ZdI5Pr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A+ZdI5Pr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6386C4CED5
	for <llvm@lists.linux.dev>; Tue,  1 Oct 2024 07:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727768398;
	bh=za16NxIQDUGjjHP2c29sw6PI8ZU3lXszSx4jSWmr5Jk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=A+ZdI5Pr5z95cPoyROInkoF/m1KgQ1L5oRn72JvSq+0YaKEdwCLUom9aGtJ3WPnt6
	 oXZapjcw8OgiAkwdqtb+64MzbbBoHJQXQvGkIqquljGClamFglB5/PXtGbAeAY3If6
	 IPlo6kC//uC39Zx/hW+2gRDa4n5/CBK3RzMF7t6DGLbGJj4ChLHKB+H3CWbWWTD03j
	 baj8udo9fC+ZVvg7A5HIWpbzZQW1YwtupJL9Stvns+2O4l6puYXjcYLKahxMR2nxKz
	 rTrMJDmhJURVb5Z0NfhyRfNtdi4MgvLrU7I4+tha5g9KyqMVcQhZWiJApoLGS8OCy5
	 ejezbRdzfWUbA==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so59370651fa.3
        for <llvm@lists.linux.dev>; Tue, 01 Oct 2024 00:39:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW1v20R0DfVHK0QlFXbrfb8ISbzWMIiLIUzr7zmmENqKc00KgsBM22xipshSpJoS6xShVDW@lists.linux.dev
X-Gm-Message-State: AOJu0YwlpFvNv8yJejLiHR5ECzL7JGPHf987f2tqSzUke8m129ZfdGPw
	7ErWwlwVF4z+ZonpHWSNLaImJoyx2iT2DuYYo9NaI5Xa+3jJJahBnxLysTfgSr1035XLBKLGfBR
	dJMM2jlacJDD1t4Z0at63BTwvhks=
X-Google-Smtp-Source: AGHT+IGSGW+uzmUjxyeIFaLft3PnZ2kaCaMuKqb2T+GLgytq3+U5XTQLxKYTu05fD4+Ir4Uuwo1LuIK4EgJ7mk97UG4=
X-Received: by 2002:a05:6512:b9e:b0:539:8e20:105 with SMTP id
 2adb3069b0e04-5398e200266mr5005657e87.28.1727768396993; Tue, 01 Oct 2024
 00:39:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-54-ardb+git@google.com> <20241001071841.yrc7cxdp2unnzju7@treble>
In-Reply-To: <20241001071841.yrc7cxdp2unnzju7@treble>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 1 Oct 2024 09:39:45 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGA785Z2_AWuTTXPkvH9Mis=28rn_paOZe=gdaXjpu-=A@mail.gmail.com>
Message-ID: <CAMj1kXGA785Z2_AWuTTXPkvH9Mis=28rn_paOZe=gdaXjpu-=A@mail.gmail.com>
Subject: Re: [RFC PATCH 24/28] tools/objtool: Treat indirect ftrace calls as
 direct calls
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Uros Bizjak <ubizjak@gmail.com>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@linux.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	linux-doc@vger.kernel.org, linux-pm@vger.kernel.org, kvm@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-efi@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Oct 2024 at 09:18, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> On Wed, Sep 25, 2024 at 05:01:24PM +0200, Ard Biesheuvel wrote:
> > +             if (insn->type == INSN_CALL_DYNAMIC) {
> > +                     if (!reloc)
> > +                             continue;
> > +
> > +                     /*
> > +                      * GCC 13 and older on x86 will always emit the call to
> > +                      * __fentry__ using a relaxable GOT-based symbol
> > +                      * reference when operating in PIC mode, i.e.,
> > +                      *
> > +                      *   call   *0x0(%rip)
> > +                      *             R_X86_64_GOTPCRELX  __fentry__-0x4
> > +                      *
> > +                      * where it is left up to the linker to relax this into
> > +                      *
> > +                      *   call   __fentry__
> > +                      *   nop
> > +                      *
> > +                      * if __fentry__ turns out to be DSO local, which is
> > +                      * always the case for vmlinux. Given that this
> > +                      * relaxation is mandatory per the x86_64 psABI, these
> > +                      * calls can simply be treated as direct calls.
> > +                      */
> > +                     if (arch_ftrace_match(reloc->sym->name)) {
> > +                             insn->type = INSN_CALL;
> > +                             add_call_dest(file, insn, reloc->sym, false);
> > +                     }
>
> Can the compiler also do this for non-fentry direct calls?

No, it is essentially an oversight in GCC that this happens at all,
and I fixed it [0] for GCC 14, i.e., to honour -mdirect-extern-access
when emitting these calls.

But even without that, it is peculiar at the very least that the
compiler would emit GOT based indirect calls at all.

Instead of

  call *__fentry__@GOTPCREL(%rip)

it should simply emit

  call __fentry__@PLT

and leave it up to the linker to resolve this directly or
lazily/eagerly via a PLT jump (assuming -fno-plt is not being used)

> If so would
> it make sense to generalize this by converting all
> INSN_CALL_DYNAMIC+reloc to INSN_CALL?
>
> And maybe something similar for add_jump_destinations().
>

I suppose that the pattern INSN_CALL_DYNAMIC+reloc is unambiguous, and
can therefore always be treated as INSN_CALL. But I don't anticipate
any other occurrences here, and if they do exist, they indicate some
other weirdness in the compiler, so perhaps it is better not to add
general support for these.


[0] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=bde21de1205c0456f6df68c950fb7ee631fcfa93
