Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793311122;
	b=ixGB/XRRaBx6FAJFfdAX/Uv7U8d+Y4xQvO+yGyeU3C+YKlfp7srOS9DcGxPXtAH9fzxT
	 v3AAtIMMsyzvvuF7uTlyOrqtLklQQcVjkkhUctEgEvxqH39purjMyz2xHI9WE2YhxAdbP
	 4L09E8eIoXN6CyL/Cd5vNM3ODPMSGAor9YGu3vm33f1maz52/Kggr0ZC39nDJHk0JZHEZ
	 a0tEMFdXJxbIClF25qzO9eEVxxx+t9J4QLYJ8uzTZwEVL14UdqoKZjcC9Emt+z9+n5cAo
	 EP1lpHezMT06etR69DkRO9drHOhDJp+mvNjPO9HbR9FDpi0ifJWI8/zF5MthB+wJ5eA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=B9+gAB8Cjyl4VLckQC54VBSrUBYtxpoBl30X97BtI60=;
	b=zpn10DYdgNrTTwtYePAN2JuFBEkU5PFNnF7QCTQaC6+fGi3oepULMNRoFq3nSQqgqxJ+
	 RGTxNGzX5sKL14C4l9apMRGXHuTQElqj20hZADFLsp3IF0r4bsVw/4GUcgk3PLOzAvBVX
	 HtcTqFizl077/k5hEinX0b9NhezSAT0eRs0rrSoSLNQUK6ei5jbFoIiIF735TCMTEusxe
	 Vvi5zQxjWgQeO8ifpcXh/Fb4fWnh5XF3rmYXeE8EPaYNi5s13ifOqgSv0bIC1U0AQECR3
	 uuYzG7gmTNRywSPgdbUZh/i+5MPcRyvCAEcuKM8WDsn1xPFkKcjtFZU++DTUyl5AJ8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ls2dhcbP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41ED1606A321
	for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 21:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41ED1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ls2dhcbP
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c49c32650adso3313466b.0
        for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 14:58:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793311116; cv=none;
        d=google.com; s=arc-20260327;
        b=M1DN90q3AADghdiAFylnuqnU8dRmCNBUolkg4A7AKJQLfOkoDA2rdXR3Wicayv4fLo
         NwVHtJEnQimbBAkEod8tLKgJ6kCYTfDlUA6bM23cM0aW8gTo4EBbC2dDtsBvtxCaNuV/
         ASaohoKcvX8Y+ASPZAjv6B6Wy7mr4H655JLMbHb1dKa2NrgWOF67S29lMr2ta5I9fBhD
         nKlJcvn9a/JbEn3knMsVuin8tdB2WbWk6O9AH9p5FBXVpINyahlPHz5k5WhAbVteoZAR
         DZQn29YDCWdLjrGYRdpjargbyJLrjmNisdItRAtEjQ1GlhkSLYhOl629XnifS8TeSaj4
         4low==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B9+gAB8Cjyl4VLckQC54VBSrUBYtxpoBl30X97BtI60=;
        fh=FZanNMvrS1dqqazDAt/0Aflq3H8orSsEBCCb1kw26+8=;
        b=onA4ZsSjbKw7UDokU4ak75MF+8/viXE+yBY+5m1fJEv7zpgT1FE6qn7Jh+bdQGuO8s
         VLmiQo8e2e5a7a0SPKXMoogYm8+LWTMPK/ZGkpvK8yzSFk3uHONYLaiXrW0uGPt8oP8p
         pkQV9S72Ij+3rOB19ax+zw3C4JWoLtaa9Dhll06KdmK+coiUgHWbxQyQBKZsj68S+qvA
         dcBAQTYuWfftwXVd44CsL2Onxy0SQ45faMBlZfO4Rwav96t4T8dnomVh8216HAsaQK6R
         5nHEUqOZ5GbY+Wks5UQZxWNkajNDaHCJ1VnAKxg3+JnOcZAuE9yykHOLeFhzyUJ5YVr8
         4X1Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793311116; x=1793915916; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B9+gAB8Cjyl4VLckQC54VBSrUBYtxpoBl30X97BtI60=;
        b=ls2dhcbPl9CEESj8tq9krs61g8i+vRPYGUk5n79semkn75NpLoqLbL4rXWwsSrJ4+A
         YLTSmNnr76FCTW7XbIiF29UiqwhgM/NOdf5qtpWEN5SsCCuXai4W4JwjIxxFg4ucxyNe
         nYvanYtOJy8WXEJzJkCa3i8fHeaJwCdoGiwOovjn7BtwSMK/+8Flzxb8aprld01bPbkM
         B2CjcYqB/bW2QfRNaHnrdBYAVoaE9rjnzqb9CYY1GK7vIsMUzadmamieuByo7Y9+73bt
         CJsY0ZlBMy5je0QtNfM2MnoyS6cZvndEzUfMzugkLD4QJs9Mc65lZrnNlnOOgTQ82i2I
         3Pmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793311116; x=1793915916;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B9+gAB8Cjyl4VLckQC54VBSrUBYtxpoBl30X97BtI60=;
        b=jxkM1AvWKgGdTKMNv94/pJtiDWg+YiB9I95kBIOJ86z4c9dnV5nXWPpMG+GdytUrOt
         DblJgv421hS2U5wLH/q+7QWaLh5wuyAxqjmT6zmsO3Jb2KqtDF2WLl8OmJ/oCOOSqaQb
         ZGedCuHhWFCMpAe8Yyqe1DrLFyR4qZuq1my0IwS57WYQVqytPgjZt23KeVkZZEC2Ci0h
         cuNSXb0bLzbvihjGAmO9/ElIpeAVK2MuLFSPSPDpn9h02GZi6XMHVdA6pWa85X/GcV95
         2uIAdnYYahJlIYBkILbm3WVGwqd2DOtxKJoODS9m+gcv/ux1WrSZfughjKq1aqASQYO8
         i8YA==
X-Forwarded-Encrypted: i=1; AKwUvBwczfSGwPAD7x+eNCgbVfSD7LvP8JW/+7wggrJLqVGncjZUG/DQ413SEmgsY2VmUuiQt79o@lists.linux.dev
X-Gm-Message-State: AFq9FYKv9FzVgcbqcWdGNbogL1SiMupZ+M2hT7HSssnZcTgiy1ePm8+0
	WY23gXZ4p30/3q6hGCmWQifDaNh6bLDQuv4/FfC5nmbzRVCvJtJY0pQlONeEdh2mIzhdZQ12BB/
	Q9mBBLz67NE7sgmb+Ut3A/XrBL8rfv7tmFQNrfpzY
X-Gm-Gg: AYBFou358V45Kis95thMlbagk8L11VPY481bjOvgEQQMpvwEDjBnmLQqHkZuvwxTU+E
	kwhrWfzjmhZ+1twxWk1CL47WsQR6his0/ZftcmG3hkA/Yx1vU9W0UR5GoPYLHtd8rg302xzabSP
	bpbjxMulXUuEpMUtLXC0oImte26k5DxOTYdfZFvcjk+xjb4ippWLF8ms9zwjYLRosRG6vMYB89c
	wUFIXLLgySj5GKQVhRPesiNyWLLo0PZxYjzNxytuRjJU5IfaTvsFiRdbe+BGTxSQabR0N/1Yis/
	xP6rJ8sIlOntde8DCk5bsApUwOsMpnq8ycSq0tCtODUEo6Cp4AGTLV+rCGvEGppYjOB62rDM/NT
	nOWuP8rS0vU+0ewmFjLgW0C4W4PiM7qJBduKZWkPEP1dpGXHhotCY0fPq/TpPSfDyyPeKBr8=
X-Received: by 2002:a17:907:18c3:b0:c26:22ae:b66b with SMTP id
 a640c23a62f3a-c4ca7aee966mr31602566b.15.1793311115078; Thu, 29 Oct 2026
 14:58:35 -0700 (PDT)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261023001603.560210-8-wusamuel@google.com> <20261023001603.560210-9-wusamuel@google.com>
 <CAEf4Bzb--Jzz696u057G9_CgQN7zf6ksvoL80KJacKO2CorsnQ@mail.gmail.com>
In-Reply-To: <CAEf4Bzb--Jzz696u057G9_CgQN7zf6ksvoL80KJacKO2CorsnQ@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Thu, 29 Oct 2026 14:58:23 -0700
X-Gm-Features: AclHuK8Skd5aK1mpj2aYhCa7McUFcLlkjExMScvtTmOLJycjBhAcAzm-z_wLwRU
Message-ID: <CAG2Kctojb7xiOqTmwWqoAKFaNUECjOzXVc_t6KbG13Pqm2dbng@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 3:25=E2=80=AFPM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Thu, Oct 22, 2026 at 5:17=E2=80=AFPM Samuel Wu <wusamuel@google.com> w=
rote:
> >
> > Add an extensible KALLSYMS_QUERY ioctl() interface to /proc/kallsyms
> > to support fast point queries without scanning the entire text file.
> > Exactly one query mode must be set in query_flags.
> >
> > When KALLSYMS_QUERY_BY_SYMBOL is set in query_flags, KALLSYMS_QUERY
> > resolves a NUL-terminated symbol name in vmlinux or loaded modules and
> > then populates sym_addr:
> > - Searches vmlinux first via kallsyms_lookup_names() (binary search),
> >   which takes precedence over loaded modules, and falls back to
> >   module_kallsyms_on_each_symbol() under module_mutex for module
> >   symbols
> > - Matches names exactly, like kallsyms_lookup_name(), disregarding the
> >   .llvm.<hash> matching, following precedent set by commit fb6a421fb615
> >   ("kallsyms: Match symbols exactly with CONFIG_LTO_CLANG")
> > - Resolves 0x0 symbol addresses in both vmlinux and modules
> > - Rejects ambiguous symbols (multiple entries with the same name at
> >   different addresses within vmlinux, or across loaded modules) with
> >   -EADDRNOTAVAIL, while allowing same-address aliases
> >
> > Userspace symbolizers resolve kernel addresses to symbol names with
> > /proc/kallsyms. This is typically done by reading the entire
> > /proc/kallsyms text file, and keeping a compressed sorted copy of it in
> > order to resolve addresses at runtime.
> >
> > When KALLSYMS_QUERY_BY_ADDR is set in query_flags, KALLSYMS_QUERY
> > resolves one address to the symbol that contains it:
> > - sym_addr holds the address to resolve on input.
> > - sym_name_addr must point to a user buffer of sym_name_size bytes
> >   that receives the NUL-terminated symbol name. On output,
> >   sym_name_size holds the number of bytes written (including the
> >   terminating NUL). -ENAMETOOLONG is returned if the buffer is too
> >   small; a buffer of KSYM_NAME_LEN (512 at the time of writing) bytes
> >   is always large enough.
> > - Symbols are resolved via kallsyms_lookup(), the same lookup as %pS,
> >   covering vmlinux, loaded modules, BPF JIT images, and freed module
> >   init functions still tracked by ftrace.
> >
> > On an 8 CPU Cuttlefish (x86-64 VM), using this patchseries to load a BP=
F
> > program with 11 typeless ksyms has ~220x speedup (157ms -> 0.7ms).
> >
> > On an 8 CPU x86-64 VM with a 175k line kallsyms, there are broad
> > performance and memory savings for the symbolization and callstack
> > sampling tool, Perfetto:
> > - Init time: ~350x speedup (155.7ms -> 0.44ms)
> > - 50k symbolizations: ~12x speedup (25.2ms -> 2.2ms)
> > - VmRSS: -68% (15.1MB -> 4.8MB)
> >
> > Suggested-by: Andrii Nakryiko <andrii@kernel.org>
> > Signed-off-by: Samuel Wu <wusamuel@google.com>
> > ---
> >  include/uapi/linux/fs.h |  41 +++++++++++++
> >  kernel/kallsyms.c       | 132 ++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 173 insertions(+)
> >
> > diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
> > index 34c6f219462a..b43f227dad0e 100644
> > --- a/include/uapi/linux/fs.h
> > +++ b/include/uapi/linux/fs.h
> > @@ -674,6 +674,47 @@ struct procmap_query {
> >         __u64 build_id_addr;            /* in */
> >  };
> >
> > +/* /proc/kallsyms ioctl */
> > +#define KALLSYMS_QUERY _IOWR(PROCFS_IOCTL_MAGIC, 18, struct kallsyms_q=
uery)
> > +
> > +/* Exactly one query mode must be set in query_flags. */
> > +enum kallsyms_query_flags {
> > +       /*
> > +        * Look up a symbol in vmlinux or loaded modules (vmlinux first=
; BPF
> > +        * and ftrace symbols are not searched) by exact NUL-terminated=
 name
> > +        * at sym_name_addr and return sym_addr. sym_addr and sym_name_=
size
> > +        * must be 0 on input.
> > +        */
> > +       KALLSYMS_QUERY_BY_SYMBOL =3D 0x01,
> > +       /*
> > +        * Look up the symbol covering sym_addr and write its NUL-termi=
nated
> > +        * name to the sym_name_addr buffer of sym_name_size bytes. The=
 same
> > +        * symbols as %pS are searched: vmlinux, loaded modules, BPF JI=
T
> > +        * images, and freed module init functions still tracked by ftr=
ace.
> > +        * A buffer of KSYM_NAME_LEN (512 at the time of writing) bytes=
 is
> > +        * always enough. On success, sym_name_size is set to the numbe=
r of
> > +        * bytes written (including the terminating NUL).
> > +        */
> > +       KALLSYMS_QUERY_BY_ADDR =3D 0x02,
> > +};
> > +
> > +/*
> > + * Returns -ENOENT if no symbol matches, -EADDRNOTAVAIL if the name ma=
ps to
> > + * more than one address, -ENAMETOOLONG if the name does not fit in
> > + * KSYM_NAME_LEN (512 at the time of writing) or sym_name_size bytes, =
and
> > + * -EPERM if kallsyms addresses are hidden from the opener of /proc/ka=
llsyms
> > + * (e.g. kptr_restrict).
> > + */
> > +struct kallsyms_query {
> > +       __u64 size;             /* in - struct size for compatibility *=
/
> > +       __u64 query_flags;      /* in - query mode (enum kallsyms_query=
_flags) */
> > +       __u64 sym_name_addr;    /* in - address of symbol name buffer *=
/
> > +       __u64 sym_addr;         /* out (BY_SYMBOL) / in (BY_ADDR) */
> > +       __u64 sym_name_size;    /* in/out - name buffer size / bytes wr=
itten */
> > +};
>
> it might be smart to have QUERY_BY_ADDR and QUERY_BY_NAME to be two
> separate ioctl commands with its own query in/out struct. This would
> remove addr vs name ambiguity in sym_name_addr field, and will allow
> us to evolve APIs independently, if necessary. They should still
> probably reuse the same type to represent symbol information, and have
> kallsyms_query struct provide a pointer to that struct (and its
> maximum size), which the kernel will fill out and set the size it
> actually knows about.
>
> struct kallsyms_query_by_addr {
>     __u64 size;
>     __u64 query_flags;
>     __u64 sym_addr; /* in */
>     struct kallsyms_sym *sym; /* out */
>     __u64 sym_len;
> };
>
> struct kallsyms_sym {
>     __u64 sym_addr;
>     __u64 sym_name;
>     __u64 sym_name_len;
>     __u64 sym_module;
>     __u64 sym_module_len; /* if zero, no module requested/available */
> };
>
> e.g. for symbol you'd want to return its name, address, but also
> module name. and we should leave a way to extend it further with more
> optional information (that's the kallsyms extensibility bit I was
> talking about).

Agree, two ioctls with a shared symbol type is cleaner. v3 plan is to
have QUERY_BY_NAME and QUERY_BY_ADDR both fill a shared struct
kallsyms_sym (address, size, name, module), passed by pointer so it
can grow later.

> aslo, we should think about adding ways to paginate (or at least leave
> a possibility of that in the future) if there are multiple matches
> (e.g., for static functions with the same name resolving to multiple
> addresses); not sure how it should look like API wise, but it would be
> good to still return "any" or "first" match, but let user know there
> are multiple, so user can decide how to proceed...

Makes sense, but I'm thinking v3 doesn't need pagination or batching.
I didn't see any performance wins when profiling libbpf, and it can be
added later without breaking UAPI.

> on input I'd also add module name as optional input argument, with
> "vmlinux" limiting to just vmlinux, set module name to just that name,
> and NULL/zero meaning "we don't care"

Makes sense, so here is a possible plan for QUERY_BY_NAME:
- Optional module filter: NULL =3D any, "vmlinux", or a module name
- Returns the first match by default (vmlinux first, then modules). An
ALL_MATCHES flag searches everything and reports the number of matches

And an open question I'm unsure about: Should libbpf keep the light
skeleton semantics (take the first match, no ambiguity check), or set
ALL_MATCHES to keep today's check that fails on names with multiple
addresses?

> for QUERY_BY_ADDR we should have a flag saying whether an exact match
> by address is requested or we should find a symbol that covers the
> address (that's most useful for symbolization). maybe even "at or
> after" address mode, so you can paginate (though probably explicitly
> designed batch API would be even more useful later)

For v3 I think we can keep BY_ADDR to the covering lookup only. The
result can fill in the covering symbol's (start address, size, name,
module), and callers can check for an exact match themselves by
comparing the start address with the queried address. A batch API can
be added later when there is a user for it.

> tl;dr, this is the right direction, but I think we should polish API a
> bit more to be more universally useful and extensible
> > +
> > +#define KALLSYMS_QUERY_SIZE_VER0       40 /* sizeof first published st=
ruct */
> > +
> >  /*
> >   * Shutdown the filesystem.
> >   */
> > diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
> > index aec2f06858af..7caaf3e421c7 100644
> > --- a/kernel/kallsyms.c
> > +++ b/kernel/kallsyms.c
> > @@ -31,6 +31,7 @@
> >  #include <linux/kernel.h>
> >  #include <linux/bsearch.h>
> >  #include <linux/btf_ids.h>
> > +#include <linux/uaccess.h>
> >
> >  #include "kallsyms_internal.h"
> >
> > @@ -922,11 +923,142 @@ const char *kdb_walk_kallsyms(loff_t *pos)
> >  }
> >  #endif /* CONFIG_KGDB_KDB */
> >
> > +struct kallsyms_mod_find_ctx {
> > +       const char *name;
> > +       unsigned long addr;
> > +       bool found;
> > +};
> > +
> > +static int kallsyms_mod_find_cb(void *data, const char *name, unsigned=
 long addr)
> > +{
> > +       struct kallsyms_mod_find_ctx *ctx =3D data;
> > +
> > +       if (strcmp(name, ctx->name) !=3D 0)
> > +               return 0;
> > +       if (ctx->found && ctx->addr !=3D addr)
> > +               return -EADDRNOTAVAIL;
> > +       ctx->found =3D true;
> > +       ctx->addr =3D addr;
> > +       return 0;
> > +}
> > +
> > +static int do_kallsyms_query(struct kallsym_iter *iter, void __user *u=
arg)
> > +{
> > +       char namebuf[KSYM_NAME_LEN];
> > +       struct kallsyms_query karg;
> > +       unsigned long addr;
> > +       unsigned int start;
> > +       unsigned int end;
> > +       unsigned int i;
> > +       __u64 usize;
> > +       long len;
> > +       int err;
> > +
> > +       BUILD_BUG_ON(sizeof(struct kallsyms_query) !=3D KALLSYMS_QUERY_=
SIZE_VER0);
> > +
> > +       /*
> > +        * The text interface shows zero addresses to openers without p=
ermission.
> > +        * A zeroed point query result is useless (and an address-to-sy=
mbol query
> > +        * would leak KASLR), so fail instead.
> > +        */
> > +       if (!iter->show_value)
> > +               return -EPERM;
> > +       if (copy_from_user(&usize, uarg, sizeof(usize)))
> > +               return -EFAULT;
> > +       if (usize > PAGE_SIZE)
> > +               return -E2BIG;
> > +       if (usize < KALLSYMS_QUERY_SIZE_VER0)
>
> PROCMAP_QUERY uses offsetofend() for the last defined field, any
> reason to have this #define and BUILD_BUG_ON here?

David pointed out that the size field in struct kallsyms_query is
redundant. In v3, I can drop the size field and use _IOC_SIZE(cmd),
keep the *_SIZE_VER0 define (since we need minimum size). Perfectly
fine to switch to the PROCMAP_QUERY style though if preferred.

Thanks Andrii for all the thoughtful feedback!

> > +               return -EINVAL;
> > +
> > +       err =3D copy_struct_from_user(&karg, sizeof(karg), uarg, usize)=
;
> > +       if (err)
> > +               return err;
> > +
>
> [...]
