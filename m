Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793139903;
	b=WZM2xfieXDqKnG5SlKwBjL9+Qtm2k550kot/OLMwyFuWD+pTsRIlZeizm84peFoJdG13
	 wnkLZvQONhqIr35uqXyBNvZxiJyLwu0vgp6jPvcOLln6uMCNVn19ytlyKcMyBlrGgEl6o
	 boySWb2hjG3MCVstWNqS9+Rpk+oqhjtUKd/JWaxnB8eCOoNFhxcvVxorw3dtNe+FSH8xC
	 aS2OfnWUbVSJB6P84782EVtR9qzJsBhtN0PmmFojreg41kVylqzaPfOjhz35YgXWKsx/k
	 y7bnwVNswICsAtqdrOg/kpjbeqiPeSFq5zADI7gF5DkSIhJAN/rLpRRqHx6A158jChw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793139903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZEKOi1PwMO6a+hswERjow4zduMtspY4e9rbrauVqOm4=;
	b=HNOVjWmr7G6snul52+SDgifD3i2PgQW+XZkPemuZgN6u1I3BDiVmr3n/z8bJkpiC2u+x
	 MVEGsf03KccUDXfeF4dyhuvhWYs+wFWrWiBVfIF955tlpmKqYMTRpba7RVScufbsQqIBt
	 kU03llwiN6Qwr9iH1hAQ9nNiswXe2Td5yqkS2drdzeVpu507x0mUqLESMuKspK3l41xM3
	 E5S2cu5Tl5g/KFgfpXGYFXagykOhWmJOuUfc2r0v0nGXdBPom5aha9Ye+sF0NQjW51d65
	 qUBUhMbIPQQLWSFQ153ylKK+/86hWZZfCzrneJ5aHrcRJJdB9Q+8Ofq0/eyPhq2nw1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ozEpJtxa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F81D606A321
	for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 22:25:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F81D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ozEpJtxa
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso234592a12.0
        for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 15:25:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793139902; cv=none;
        d=google.com; s=arc-20260327;
        b=CMxdof5AQQ9ZFZ1tfAJ+1evTqpSHSSdhPaG8o70ei7brcgCTSNgI2+DwnPXl8y378F
         02R4bSPsxO82XuiKGa5Ty1CFliF0FXxczZDOvCp4w+mBmc+FRNeyc1rYyouLL6wGd6bx
         X0e6z0kSmj4lxsK7WaAdx/nRR92qmPNJ5vnCEzYrPpeHKsAuMhoaR3dIDcHBDue0AJ/C
         lS6xbAM5m6RtRwhlZz+Ese3yth+ZzFBZYL7YKA1lSxaQHGNUdVeUTkvI5pmAQ/fJNT2q
         QpyOXNFTyUWKCQTYzc4rQIDRJ0LibtrMa4g/S93xa5zeKUeL93GJiZI56xEOaWbp8VxH
         OrQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZEKOi1PwMO6a+hswERjow4zduMtspY4e9rbrauVqOm4=;
        fh=DOOVoY68mu2jMmPKqAbRtOsc7pIotNKg0JDfmcfyRrQ=;
        b=fjorvP1QT9CStVGTaOlEJDrU9Vcm19ZgtRngQKv/TMOOJHA/XQ66DtS1eDcyuEeYlw
         bq4qILA4A8PEWqnyJYnZx15CfWX6eVVF3CwgSGgNEm3QofwRrCylJ4QY5ZxyIlFNwYdV
         GoUP4sup1TV4Bk2T5niOc9k28mFRuPlDKuCa+XR7hGJfN5Md4+bfKQlUPxe7Lx3dRuUm
         XB+9Ue9aOpog00iI6bihi4i26FBA+PTGV2ReBa92i/CsDOrvwWh0EduLXbzm48KfsALL
         cIdnifQzP+vfwGnjD7joRxLG6u9B+weg/f4gCwsWZ5KZwwc4ASyS3sYrY3rtA3/lLz2D
         NQZQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793139902; x=1793744702; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZEKOi1PwMO6a+hswERjow4zduMtspY4e9rbrauVqOm4=;
        b=ozEpJtxatgLZ4iBqoYrLcpQ4oGmg64bdYsGfZX1/VQQwZ+B+EyIt2th2Bq69P1BLzD
         Dm0uO5b1HmMevk68+J1LK2J517TexaUgY0Lr1H0FWbx6v6v0FlT6K6IQ4ZhQlz1Z5B3v
         XF5BDLpo0veaxxPtmptMeq7SbkdVjQj+vG+7qVWsYPJTlh9bNyqAyRzovJmXYvUVmm/K
         dvjVNrO2XoI8IMPfm8NxZPVLcZU9cHwR7DwahH9NSUDwtHv+7o0MlUI1V8D3j9ieJDnI
         PSJHBDy4C5r0HMsa/n5+/hLTJm2vPX0UqIxPbQECDJieocEtYpkOclkL/W5yfUHe4e2c
         tKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793139902; x=1793744702;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZEKOi1PwMO6a+hswERjow4zduMtspY4e9rbrauVqOm4=;
        b=ZXUONC+4DewP2249GB39XqZzw6Euto3RjyS9N4ikIrNg2OH5WvHLQGJw3dIwEY/Xo4
         yiyQ4uGdUoNVUSgngz76z1R7fVdvWVviYdMYdGelHJb4KPzDJOHMbDx/pKvzolNGUvxw
         w+29BFLZrZoIIk9ewAjFlU0Q2CmXGBSbzZWNwgVftAjnUCJqEOLtDOetWbOGCsAgyvLO
         RSu/sS6h1N7Nn8nW03XyCqZ5qkg40v+jJMCmbPEuWj3UU65UuPzj/Tk40SfspRvvwTf3
         xNfz7OM1B/Buc899czP55/1H277CJgtoVGg/S4rH6rFeUZtWK9un+ShNNfXBfstGr+kh
         Z9Hg==
X-Forwarded-Encrypted: i=1; AKwUvBw7CDQIrESklaeLb9QM+W6ObGa+tjGu51z8CMtsefgAcU13oErwpepnqd3KeZJDB0suEWI8@lists.linux.dev
X-Gm-Message-State: AFq9FYINpIrhFoDInByW23yEWaV1s27YuHNMAU+sLde+YSWxZQ+6F4z+
	QGiPf5/9X86ByqTgZ150KnWTyHr6M41jxg/6h1n8znNjD0a56m9HkdNZ6FgIb7pJkeR0qX+3bTP
	9X6ZIVMB95EOVgRiPDbvpMZXcDUGg+BY=
X-Gm-Gg: AYBFou0e1Rg2Hxk1RibqOOIihsnGFfJXFosxj4LPl9RY6kBBf6xu6lPYxYNP4eWTCqH
	I7HbpfXHivPtOgfdSwgE3V64jwKJRFCKEkxrzKg5TpCw3GHuy7c0o+9kPnon/62kN8coAd+/18m
	kOS8VovZZO+F+FzWeH8sYb1zHvLlJmwDt2z/LYWXk4xLsPm/JNgv4a9WyRuzrJ7rBf4cAAhqgZE
	tQC5SQXD5OnVMQz1NJbkKkvOkgauo+Z1d2zK6UDmBPW0EjJHyljEIWpEIJtCgQL2a7j90X0JxsR
	HkSu44u7bUAV3MhKFqPK+2/nUXXiNC8llVs3JSE6tT7lqgdhgLitLZbtTvCSOx2IUaZjl/ADOOy
	t3BMmJKkfrEIGP1ifSG8ct7TdUETCt8C9yVKlG+b/J7FkpN64CtZiOxMVH5B+NkTNYiywzsXZfj
	g06YbNzWwz4Lg+S8w4l3qG7wIjf3LQKoX9KA==
X-Received: by 2002:a17:90b:3b85:b0:3ac:9259:122c with SMTP id
 98e67ed59e1d1-3ae58241dccmr307011a91.40.1793139902173; Tue, 27 Oct 2026
 15:25:02 -0700 (PDT)
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
In-Reply-To: <20261023001603.560210-9-wusamuel@google.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 27 Oct 2026 15:24:50 -0700
X-Gm-Features: AclHuK_SsI0sp6o_bhNEekYUJ22um4BFp-_z7npxEVXNceFMnfOEnPql-EZ_y5k
Message-ID: <CAEf4Bzb--Jzz696u057G9_CgQN7zf6ksvoL80KJacKO2CorsnQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: Samuel Wu <wusamuel@google.com>
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

On Thu, Oct 22, 2026 at 5:17=E2=80=AFPM Samuel Wu <wusamuel@google.com> wro=
te:
>
> Add an extensible KALLSYMS_QUERY ioctl() interface to /proc/kallsyms
> to support fast point queries without scanning the entire text file.
> Exactly one query mode must be set in query_flags.
>
> When KALLSYMS_QUERY_BY_SYMBOL is set in query_flags, KALLSYMS_QUERY
> resolves a NUL-terminated symbol name in vmlinux or loaded modules and
> then populates sym_addr:
> - Searches vmlinux first via kallsyms_lookup_names() (binary search),
>   which takes precedence over loaded modules, and falls back to
>   module_kallsyms_on_each_symbol() under module_mutex for module
>   symbols
> - Matches names exactly, like kallsyms_lookup_name(), disregarding the
>   .llvm.<hash> matching, following precedent set by commit fb6a421fb615
>   ("kallsyms: Match symbols exactly with CONFIG_LTO_CLANG")
> - Resolves 0x0 symbol addresses in both vmlinux and modules
> - Rejects ambiguous symbols (multiple entries with the same name at
>   different addresses within vmlinux, or across loaded modules) with
>   -EADDRNOTAVAIL, while allowing same-address aliases
>
> Userspace symbolizers resolve kernel addresses to symbol names with
> /proc/kallsyms. This is typically done by reading the entire
> /proc/kallsyms text file, and keeping a compressed sorted copy of it in
> order to resolve addresses at runtime.
>
> When KALLSYMS_QUERY_BY_ADDR is set in query_flags, KALLSYMS_QUERY
> resolves one address to the symbol that contains it:
> - sym_addr holds the address to resolve on input.
> - sym_name_addr must point to a user buffer of sym_name_size bytes
>   that receives the NUL-terminated symbol name. On output,
>   sym_name_size holds the number of bytes written (including the
>   terminating NUL). -ENAMETOOLONG is returned if the buffer is too
>   small; a buffer of KSYM_NAME_LEN (512 at the time of writing) bytes
>   is always large enough.
> - Symbols are resolved via kallsyms_lookup(), the same lookup as %pS,
>   covering vmlinux, loaded modules, BPF JIT images, and freed module
>   init functions still tracked by ftrace.
>
> On an 8 CPU Cuttlefish (x86-64 VM), using this patchseries to load a BPF
> program with 11 typeless ksyms has ~220x speedup (157ms -> 0.7ms).
>
> On an 8 CPU x86-64 VM with a 175k line kallsyms, there are broad
> performance and memory savings for the symbolization and callstack
> sampling tool, Perfetto:
> - Init time: ~350x speedup (155.7ms -> 0.44ms)
> - 50k symbolizations: ~12x speedup (25.2ms -> 2.2ms)
> - VmRSS: -68% (15.1MB -> 4.8MB)
>
> Suggested-by: Andrii Nakryiko <andrii@kernel.org>
> Signed-off-by: Samuel Wu <wusamuel@google.com>
> ---
>  include/uapi/linux/fs.h |  41 +++++++++++++
>  kernel/kallsyms.c       | 132 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 173 insertions(+)
>
> diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
> index 34c6f219462a..b43f227dad0e 100644
> --- a/include/uapi/linux/fs.h
> +++ b/include/uapi/linux/fs.h
> @@ -674,6 +674,47 @@ struct procmap_query {
>         __u64 build_id_addr;            /* in */
>  };
>
> +/* /proc/kallsyms ioctl */
> +#define KALLSYMS_QUERY _IOWR(PROCFS_IOCTL_MAGIC, 18, struct kallsyms_que=
ry)
> +
> +/* Exactly one query mode must be set in query_flags. */
> +enum kallsyms_query_flags {
> +       /*
> +        * Look up a symbol in vmlinux or loaded modules (vmlinux first; =
BPF
> +        * and ftrace symbols are not searched) by exact NUL-terminated n=
ame
> +        * at sym_name_addr and return sym_addr. sym_addr and sym_name_si=
ze
> +        * must be 0 on input.
> +        */
> +       KALLSYMS_QUERY_BY_SYMBOL =3D 0x01,
> +       /*
> +        * Look up the symbol covering sym_addr and write its NUL-termina=
ted
> +        * name to the sym_name_addr buffer of sym_name_size bytes. The s=
ame
> +        * symbols as %pS are searched: vmlinux, loaded modules, BPF JIT
> +        * images, and freed module init functions still tracked by ftrac=
e.
> +        * A buffer of KSYM_NAME_LEN (512 at the time of writing) bytes i=
s
> +        * always enough. On success, sym_name_size is set to the number =
of
> +        * bytes written (including the terminating NUL).
> +        */
> +       KALLSYMS_QUERY_BY_ADDR =3D 0x02,
> +};
> +
> +/*
> + * Returns -ENOENT if no symbol matches, -EADDRNOTAVAIL if the name maps=
 to
> + * more than one address, -ENAMETOOLONG if the name does not fit in
> + * KSYM_NAME_LEN (512 at the time of writing) or sym_name_size bytes, an=
d
> + * -EPERM if kallsyms addresses are hidden from the opener of /proc/kall=
syms
> + * (e.g. kptr_restrict).
> + */
> +struct kallsyms_query {
> +       __u64 size;             /* in - struct size for compatibility */
> +       __u64 query_flags;      /* in - query mode (enum kallsyms_query_f=
lags) */
> +       __u64 sym_name_addr;    /* in - address of symbol name buffer */
> +       __u64 sym_addr;         /* out (BY_SYMBOL) / in (BY_ADDR) */
> +       __u64 sym_name_size;    /* in/out - name buffer size / bytes writ=
ten */
> +};

it might be smart to have QUERY_BY_ADDR and QUERY_BY_NAME to be two
separate ioctl commands with its own query in/out struct. This would
remove addr vs name ambiguity in sym_name_addr field, and will allow
us to evolve APIs independently, if necessary. They should still
probably reuse the same type to represent symbol information, and have
kallsyms_query struct provide a pointer to that struct (and its
maximum size), which the kernel will fill out and set the size it
actually knows about.

struct kallsyms_query_by_addr {
    __u64 size;
    __u64 query_flags;
    __u64 sym_addr; /* in */
    struct kallsyms_sym *sym; /* out */
    __u64 sym_len;
};

struct kallsyms_sym {
    __u64 sym_addr;
    __u64 sym_name;
    __u64 sym_name_len;
    __u64 sym_module;
    __u64 sym_module_len; /* if zero, no module requested/available */
};

e.g. for symbol you'd want to return its name, address, but also
module name. and we should leave a way to extend it further with more
optional information (that's the kallsyms extensibility bit I was
talking about).

aslo, we should think about adding ways to paginate (or at least leave
a possibility of that in the future) if there are multiple matches
(e.g., for static functions with the same name resolving to multiple
addresses); not sure how it should look like API wise, but it would be
good to still return "any" or "first" match, but let user know there
are multiple, so user can decide how to proceed...

on input I'd also add module name as optional input argument, with
"vmlinux" limiting to just vmlinux, set module name to just that name,
and NULL/zero meaning "we don't care"


for QUERY_BY_ADDR we should have a flag saying whether an exact match
by address is requested or we should find a symbol that covers the
address (that's most useful for symbolization). maybe even "at or
after" address mode, so you can paginate (though probably explicitly
designed batch API would be even more useful later)


tl;dr, this is the right direction, but I think we should polish API a
bit more to be more universally useful and extensible

> +
> +#define KALLSYMS_QUERY_SIZE_VER0       40 /* sizeof first published stru=
ct */
> +
>  /*
>   * Shutdown the filesystem.
>   */
> diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
> index aec2f06858af..7caaf3e421c7 100644
> --- a/kernel/kallsyms.c
> +++ b/kernel/kallsyms.c
> @@ -31,6 +31,7 @@
>  #include <linux/kernel.h>
>  #include <linux/bsearch.h>
>  #include <linux/btf_ids.h>
> +#include <linux/uaccess.h>
>
>  #include "kallsyms_internal.h"
>
> @@ -922,11 +923,142 @@ const char *kdb_walk_kallsyms(loff_t *pos)
>  }
>  #endif /* CONFIG_KGDB_KDB */
>
> +struct kallsyms_mod_find_ctx {
> +       const char *name;
> +       unsigned long addr;
> +       bool found;
> +};
> +
> +static int kallsyms_mod_find_cb(void *data, const char *name, unsigned l=
ong addr)
> +{
> +       struct kallsyms_mod_find_ctx *ctx =3D data;
> +
> +       if (strcmp(name, ctx->name) !=3D 0)
> +               return 0;
> +       if (ctx->found && ctx->addr !=3D addr)
> +               return -EADDRNOTAVAIL;
> +       ctx->found =3D true;
> +       ctx->addr =3D addr;
> +       return 0;
> +}
> +
> +static int do_kallsyms_query(struct kallsym_iter *iter, void __user *uar=
g)
> +{
> +       char namebuf[KSYM_NAME_LEN];
> +       struct kallsyms_query karg;
> +       unsigned long addr;
> +       unsigned int start;
> +       unsigned int end;
> +       unsigned int i;
> +       __u64 usize;
> +       long len;
> +       int err;
> +
> +       BUILD_BUG_ON(sizeof(struct kallsyms_query) !=3D KALLSYMS_QUERY_SI=
ZE_VER0);
> +
> +       /*
> +        * The text interface shows zero addresses to openers without per=
mission.
> +        * A zeroed point query result is useless (and an address-to-symb=
ol query
> +        * would leak KASLR), so fail instead.
> +        */
> +       if (!iter->show_value)
> +               return -EPERM;
> +       if (copy_from_user(&usize, uarg, sizeof(usize)))
> +               return -EFAULT;
> +       if (usize > PAGE_SIZE)
> +               return -E2BIG;
> +       if (usize < KALLSYMS_QUERY_SIZE_VER0)

PROCMAP_QUERY uses offsetofend() for the last defined field, any
reason to have this #define and BUILD_BUG_ON here?

> +               return -EINVAL;
> +
> +       err =3D copy_struct_from_user(&karg, sizeof(karg), uarg, usize);
> +       if (err)
> +               return err;
> +

[...]
