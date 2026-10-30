Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793354544;
	b=QOUZ5s62x+CDny2Yz7ZmPowHelq30aAZz41y258iXF8qHpBlELdkuMIXzKjfqjDsDw0l
	 6g/Rt9Mxmhe6yXOh8mKjUdAX9cA0ydAfjtBUM6a0Bts7JjZNdDw0/qkoujTHViwsMFA+X
	 9oA9WSJQtmKEfzJxVu26nS+ozcohWXXEBJZrgzuGp7/PXoJENrTlsTi29b6IKLPZENi6n
	 oN3wS+uQHOwfzHP2/1pyNeJcN8HRwr8VeRv5wN3QFgbPsXjSq5pWAHMpXkGnul2N3KV5d
	 uJKw6fma8pa4neI/o05IlAkjDjMobKfe4bsc+fwQ4K9SZYu6IFzStmNEhIA3tpaTdhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793354544;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=8nMMpdGavYywm+WnkqXzKRgkYeZoHQXny+YU8bSsucM=;
	b=JUdmhV06L8JFjN13k3ms2prk3KseLuhtT+rx3fbuUE8mbH8B7BvPWjgLY8GAkn8O/Rkc
	 5/ZOmMdocji+O4jC6bldT/MHzi5oVMGc4fMTwAbRmWC7Tpvw14GXISmlkHtPds6Al6OwZ
	 swKRhK0b9YaqSoxercbSX0j76FbeTBWD9Lpt6tC4vF1PpbifLaxnKKrVrb5iscVTycs0k
	 fpT/8TBgCoaRwvShYwHJEuYhLWiFvR0n0/43m+o5yw5uXRGGb6Tt3qT90Su1AxbFAoeKM
	 bV+z/LGdJ8T6x/Dw+VK1v+gAzxQPIFLwrPKze0oBBDnXObXUMGouOqRV0uhesCvTuDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z1I7F5IB;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC57606A31C
	for <llvm@lists.linux.dev>; Fri, 30 Oct 2026 10:02:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EC57606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z1I7F5IB
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so800261a12.0
        for <llvm@lists.linux.dev>; Fri, 30 Oct 2026 03:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793354542; x=1793959342; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8nMMpdGavYywm+WnkqXzKRgkYeZoHQXny+YU8bSsucM=;
        b=Z1I7F5IBa/fr+6gUcpqvKulECPWxmty/VQYOjAb5ljfES631+UcRLqcGQnna2FsKbF
         d+OeQw0+Fiyk0PWymiHY90PUR80gHKZ6IdNB/wOvzOmm2ixrLE6r4BjcIu2VdTUafJe3
         DabQyxst4wRDyg3QnSOXNdezNcyh2oitMtB8iwGIXWS3LjuvrEg5nqsIM+KVOYRBFGt6
         bfAlOGqN07XUC2yrYptCPhJuSaw9L3m6TuX7W9rUQxRskbzYP3Xmv3POUJ8AGb2gxOuP
         St0D1nEfW4M6CZPTvXwNi5a4dQfh8F7oV7K1VEM4SYs85VfwO2lfQ/iQ/XEPj/QpS1nH
         7gww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793354542; x=1793959342;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8nMMpdGavYywm+WnkqXzKRgkYeZoHQXny+YU8bSsucM=;
        b=qrV1uDXI9Amqd/FGYcx3gLVpnhJ6m8fWvNJiVA4BFnuMFCx9zwcXxGi4OgD9KCYfIP
         KJsCEI5Y2WNbQBl+sbZfJJP9kMiE9Qwr/MROy3DWPDMjWZUIaIyF/8JRRX8daNwHkRLa
         VyIk4vexcakfVVMmkzfr5/dIShqgSr2RPQBy3Fl9h2l/Ag0D8K+u6mSDxKfZxQmTDWce
         +BrzMOpEGOLTx4T2p7yqeItNdqQ03Df063r4rwCx4tdisZQsIKrAujkig/LqoRDFklZl
         CggaO+d0VLZuL3FOLgZexRUjmw4Tq9EEL6IzCl9COP8VS7FozzOVrx3XZjZ63RsCa/tk
         w0kw==
X-Forwarded-Encrypted: i=1; AKwUvBw77era1h6uVw5CTW0ohN5Q97R5esEq+36FX+A9WpWxG8QcU1zm1nUdwPSoFEP2D+sG0voZ@lists.linux.dev
X-Gm-Message-State: AFq9FYIvcofXz+1S8rX8DJxsbQ1H7A1w5PIR7nRVR9qThC/Uwfav0s5E
	4zRX4MQCTVqTFNFEsOFcZSoXW5X/rV2jpKFKzDjclU7aUWRYEb+Akr+j
X-Gm-Gg: AYBFou04c4YHcpaKSFJFOyjwZ/w1buNlJJfGBjhQ9MQUYa6g28cAMtxkEznBFc53Fka
	+iqHEn9sqgg/htsEeIqJZEL/d013TFQ7DT4TdfA5FS76iYt6zN4EqJuv9BYxHvuV+9Mx7If2mO3
	5njB8Mw9I3GY1yvOtqf350Dt6vmzoLf20b4Gk3FLSYCHckZYlQuuE574cK1HfcVg/dY+eW84eea
	jaQZZPCj1SWDa2u4YjcZbFDehwbikbf4pyrUbh6QCBXA7qEGGun5LXOn+0ZykzVDftdc+SBZ9uC
	+iGLs4UsF4ZOdirAK4yqFdIp/Mj/7FVdvDq+XfytbWmmTMo0DVllZ+pJyFks1HeYjlkd3wBTxW4
	WPL4I8IQonykTzz7+gz9BdbJc5Gq1QMEvUF/Ih2xBAqlc+dPBmKXrKOQhfqJxFRBEKD2HNCHnB3
	STej6GketHb2nnVBO1XNgmtTktpl0sCfeoipqLTfJCffUI4slY9rQEmhZKJGKsOJVSjJpTZ/EPN
	aFkiKfPT1uWnisKKH3sA+u4+GfoxGgOdLr1Ew8i3k1qvp40z1SaSyCuXovPRFqhPW+YVHGA0lG9
	U+RnWurRSTgpD9vlR4AgnmcG2jdnm2KuOslWHLtlg1jM3Fmg6DXrEjBdjUWbOh67GA==
X-Received: by 2002:a17:906:c142:b0:c42:2f4e:522a with SMTP id a640c23a62f3a-c4ca7a5077emr153562866b.25.1793354540147;
        Fri, 30 Oct 2026 03:02:20 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9eaeesm2404679f8f.49.2026.10.30.03.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:02:19 -0700 (PDT)
Date: Fri, 30 Oct 2026 10:02:15 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Samuel Wu <wusamuel@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii Nakryiko
 <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai
 <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi
 <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa
 <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to
 /proc/kallsyms
Message-ID: <20261030100215.6f8e0d4f@pumpkin>
In-Reply-To: <CAG2KctpGPHo-S3AEvBhK5HPUnDHfoJu6Z-r+cS1hQ4Ps=B3DmQ@mail.gmail.com>
References: <20261023001603.560210-8-wusamuel@google.com>
	<20261023001603.560210-9-wusamuel@google.com>
	<20261028134012.01d52e94@pumpkin>
	<CAG2KctpGPHo-S3AEvBhK5HPUnDHfoJu6Z-r+cS1hQ4Ps=B3DmQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 29 Oct 2026 15:05:45 -0700
Samuel Wu <wusamuel@google.com> wrote:

> On Wed, Oct 28, 2026 at 6:40=E2=80=AFAM David Laight
> <david.laight.linux@gmail.com> wrote:
> >
> > On Thu, 22 Oct 2026 17:16:02 -0700
> > Samuel Wu <wusamuel@google.com> wrote:
> > =20
> > > Add an extensible KALLSYMS_QUERY ioctl() interface to /proc/kallsyms
> > > to support fast point queries without scanning the entire text file.
> > > Exactly one query mode must be set in query_flags.
> > >
> > > When KALLSYMS_QUERY_BY_SYMBOL is set in query_flags, KALLSYMS_QUERY
> > > resolves a NUL-terminated symbol name in vmlinux or loaded modules and
> > > then populates sym_addr:
> > > - Searches vmlinux first via kallsyms_lookup_names() (binary search),
> > >   which takes precedence over loaded modules, and falls back to
> > >   module_kallsyms_on_each_symbol() under module_mutex for module
> > >   symbols
> > > - Matches names exactly, like kallsyms_lookup_name(), disregarding the
> > >   .llvm.<hash> matching, following precedent set by commit fb6a421fb6=
15
> > >   ("kallsyms: Match symbols exactly with CONFIG_LTO_CLANG") =20
> >
> > Hmmmm....
> > What happens when you have functions foo and foo.constprop0
> > In some sense they are duplicates. =20
>=20
> BY_NAME matches names exactly, like kallsyms_lookup_name(), so they
> would be different symbols at different addresses. Please correct me
> if I'm missing something here!

Only that the user might really want one of the copies.
Sometimes there is only the copy.

>=20
> > > - Resolves 0x0 symbol addresses in both vmlinux and modules
> > > - Rejects ambiguous symbols (multiple entries with the same name at
> > >   different addresses within vmlinux, or across loaded modules) with
> > >   -EADDRNOTAVAIL, while allowing same-address aliases
> > >
> > > Userspace symbolizers resolve kernel addresses to symbol names with
> > > /proc/kallsyms. This is typically done by reading the entire
> > > /proc/kallsyms text file, and keeping a compressed sorted copy of it =
in
> > > order to resolve addresses at runtime. =20
> >
> > You could mmap the tables into userspace and have a ioctl that reported
> > the offsets of the tables (etc).
> > Then user lookup would faster then kernel lookup!
> > Especially since you could throw a bit more memory at it to remove the
> > linear scans. =20
>=20
> I think that would increase the UAPI surface because it would set the
> table format, so I'd prefer not to. It would only cover vmlinux and
> not modules, and then we'd need to apply kptr_restrict checks to the
> mapping.

True.

> > >
> > > When KALLSYMS_QUERY_BY_ADDR is set in query_flags, KALLSYMS_QUERY
> > > resolves one address to the symbol that contains it:
> > > - sym_addr holds the address to resolve on input.
> > > - sym_name_addr must point to a user buffer of sym_name_size bytes
> > >   that receives the NUL-terminated symbol name. On output,
> > >   sym_name_size holds the number of bytes written (including the
> > >   terminating NUL). -ENAMETOOLONG is returned if the buffer is too
> > >   small; a buffer of KSYM_NAME_LEN (512 at the time of writing) bytes
> > >   is always large enough.
> > > - Symbols are resolved via kallsyms_lookup(), the same lookup as %pS,
> > >   covering vmlinux, loaded modules, BPF JIT images, and freed module
> > >   init functions still tracked by ftrace.
> > >
> > > On an 8 CPU Cuttlefish (x86-64 VM), using this patchseries to load a =
BPF
> > > program with 11 typeless ksyms has ~220x speedup (157ms -> 0.7ms). =20
> >
> > Have you tried measuring it with my patches that speed up the kernel
> > 'search by name' code?
> > That speeds the lookup by a factor of ~18 (testing the code in userspac=
e). =20
>=20
> Not yet. Can you point me to the latest version? Happy to try it out.

I've just forwarded you all the patches.
(They include patches to the tests and scripts/kallsyms)
I'll copy you (and the other people getting this email) for v3.

>=20
> > You also should allow for 'find first' and 'find next'.
> > As well as letting the code iterate though functions with the same name
> > it is absolutely trivial to enhance the 'lookup by name' code to match
> > a prefix. =20
>=20
> Agreed, that would be useful. In v3, the idea will be to have BY_NAME
> return the first match by default, and an ALL_MATCHES flag to report
> how many matches exist.

Reporting the count is expensive, reporting that there is another with
the same same is cheap.
Some symbols (that probably wont be looked up) occur 100s of times in
a normal kernel, build allyesconfig (I tested the code with it) and the
worst case is about 46000 times.

So a bit that indicates 'duplicates' exist would be reasonable.
But without the ability to do a 'read next' it isn't much use.

Another bit could be used/reserved for 'the next symbol is foo.bar'.
That would need returning even if foo itself is missing.

> Find next and prefix matching can be added
> later with breaking UAPI, and best to not include in v3 since there
> isn't yet a user.

The main thing it needs is a field to include the 'symbol number' in
the ioctl structure.
It'll save churn to reserve a field now - and won't really make much
difference to anything else.

>=20
> > (Basically it needs to 'return -index' instead of 'return -1' when the
> > binary scan fails.)
> >
> > =20
> > >
> > > On an 8 CPU x86-64 VM with a 175k line kallsyms, there are broad
> > > performance and memory savings for the symbolization and callstack
> > > sampling tool, Perfetto:
> > > - Init time: ~350x speedup (155.7ms -> 0.44ms)
> > > - 50k symbolizations: ~12x speedup (25.2ms -> 2.2ms)
> > > - VmRSS: -68% (15.1MB -> 4.8MB)
> > >
> > > Suggested-by: Andrii Nakryiko <andrii@kernel.org>
> > > Signed-off-by: Samuel Wu <wusamuel@google.com>
> > > ---
> > >  include/uapi/linux/fs.h |  41 +++++++++++++
> > >  kernel/kallsyms.c       | 132 ++++++++++++++++++++++++++++++++++++++=
++
> > >  2 files changed, 173 insertions(+)
> > >
> > > diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
> > > index 34c6f219462a..b43f227dad0e 100644
> > > --- a/include/uapi/linux/fs.h
> > > +++ b/include/uapi/linux/fs.h
> > > @@ -674,6 +674,47 @@ struct procmap_query {
> > >       __u64 build_id_addr;            /* in */
> > >  };
> > >
> > > +/* /proc/kallsyms ioctl */
> > > +#define KALLSYMS_QUERY       _IOWR(PROCFS_IOCTL_MAGIC, 18, struct ka=
llsyms_query)
> > > +
> > > +/* Exactly one query mode must be set in query_flags. */
> > > +enum kallsyms_query_flags {
> > > +     /*
> > > +      * Look up a symbol in vmlinux or loaded modules (vmlinux first=
; BPF
> > > +      * and ftrace symbols are not searched) by exact NUL-terminated=
 name
> > > +      * at sym_name_addr and return sym_addr. sym_addr and sym_name_=
size
> > > +      * must be 0 on input.
> > > +      */
> > > +     KALLSYMS_QUERY_BY_SYMBOL =3D 0x01,
> > > +     /*
> > > +      * Look up the symbol covering sym_addr and write its NUL-termi=
nated
> > > +      * name to the sym_name_addr buffer of sym_name_size bytes. The=
 same
> > > +      * symbols as %pS are searched: vmlinux, loaded modules, BPF JIT
> > > +      * images, and freed module init functions still tracked by ftr=
ace.
> > > +      * A buffer of KSYM_NAME_LEN (512 at the time of writing) bytes=
 is
> > > +      * always enough. On success, sym_name_size is set to the numbe=
r of
> > > +      * bytes written (including the terminating NUL).
> > > +      */
> > > +     KALLSYMS_QUERY_BY_ADDR =3D 0x02,
> > > +};
> > > +
> > > +/*
> > > + * Returns -ENOENT if no symbol matches, -EADDRNOTAVAIL if the name =
maps to
> > > + * more than one address, -ENAMETOOLONG if the name does not fit in
> > > + * KSYM_NAME_LEN (512 at the time of writing) or sym_name_size bytes=
, and
> > > + * -EPERM if kallsyms addresses are hidden from the opener of /proc/=
kallsyms
> > > + * (e.g. kptr_restrict).
> > > + */
> > > +struct kallsyms_query {
> > > +     __u64 size;             /* in - struct size for compatibility *=
/ =20
> >
> > I'm not sure you need a size here as well as the one in the ioctl comma=
nd.
> > It only complicates things when they differ.
> >
> > If you need a new version they you add an extra case to the switch stat=
ement.
> > Simple and easy, =20
>=20
> Good find thanks! Will update.

You'll need to pass the ioctl cmd through as well copy_struct_from_user()
will handle the size from the ioctl requests being shorter because it is
an old ioctl format and zero the extra for you.

> > > +     __u64 query_flags;      /* in - query mode (enum kallsyms_query=
_flags) */

There is no need for a command here - use the ioctl cmd.
You might want a flag for a qualifier, but there are plenty of ioctl
command values.

David

> > > +     __u64 sym_name_addr;    /* in - address of symbol name buffer */
> > > +     __u64 sym_addr;         /* out (BY_SYMBOL) / in (BY_ADDR) */
> > > +     __u64 sym_name_size;    /* in/out - name buffer size / bytes wr=
itten */ =20
> >
> > Maybe separate the buffer size from the length of the symbol written?
> > The in/out parameter will get annoying in code doing multiple lookups.
> > Or just have the buffer size and require it to be '\0' terminated.
> > (There is a strncpy_from_user() can that be used.) =20
>=20
> That is simpler- in v3, we can have buffer sizes as input only, and
> names will always be NUL-terminated.
>=20
> > The '\0' terminated string handling is likely to be noise against
> > all the rest of the lookup code.
> >
> > David
> > =20
> > > +};
> > > +
> > > +#define KALLSYMS_QUERY_SIZE_VER0     40 /* sizeof first published st=
ruct */
> > > +
> > >  /*
> > >   * Shutdown the filesystem.
> > >   */
> > > diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
> > > index aec2f06858af..7caaf3e421c7 100644
> > > --- a/kernel/kallsyms.c
> > > +++ b/kernel/kallsyms.c
> > > @@ -31,6 +31,7 @@
> > >  #include <linux/kernel.h>
> > >  #include <linux/bsearch.h>
> > >  #include <linux/btf_ids.h>
> > > +#include <linux/uaccess.h>
> > >
> > >  #include "kallsyms_internal.h"
> > >
> > > @@ -922,11 +923,142 @@ const char *kdb_walk_kallsyms(loff_t *pos)
> > >  }
> > >  #endif       /* CONFIG_KGDB_KDB */
> > >
> > > +struct kallsyms_mod_find_ctx {
> > > +     const char *name;
> > > +     unsigned long addr;
> > > +     bool found;
> > > +};
> > > +
> > > +static int kallsyms_mod_find_cb(void *data, const char *name, unsign=
ed long addr)
> > > +{
> > > +     struct kallsyms_mod_find_ctx *ctx =3D data;
> > > +
> > > +     if (strcmp(name, ctx->name) !=3D 0)
> > > +             return 0;
> > > +     if (ctx->found && ctx->addr !=3D addr)
> > > +             return -EADDRNOTAVAIL;
> > > +     ctx->found =3D true;
> > > +     ctx->addr =3D addr;
> > > +     return 0;
> > > +}
> > > +
> > > +static int do_kallsyms_query(struct kallsym_iter *iter, void __user =
*uarg)
> > > +{
> > > +     char namebuf[KSYM_NAME_LEN];
> > > +     struct kallsyms_query karg;
> > > +     unsigned long addr;
> > > +     unsigned int start;
> > > +     unsigned int end;
> > > +     unsigned int i;
> > > +     __u64 usize;
> > > +     long len;
> > > +     int err;
> > > +
> > > +     BUILD_BUG_ON(sizeof(struct kallsyms_query) !=3D KALLSYMS_QUERY_=
SIZE_VER0);
> > > +
> > > +     /*
> > > +      * The text interface shows zero addresses to openers without p=
ermission.
> > > +      * A zeroed point query result is useless (and an address-to-sy=
mbol query
> > > +      * would leak KASLR), so fail instead.
> > > +      */
> > > +     if (!iter->show_value)
> > > +             return -EPERM;
> > > +     if (copy_from_user(&usize, uarg, sizeof(usize)))
> > > +             return -EFAULT;
> > > +     if (usize > PAGE_SIZE)
> > > +             return -E2BIG;
> > > +     if (usize < KALLSYMS_QUERY_SIZE_VER0)
> > > +             return -EINVAL;
> > > +
> > > +     err =3D copy_struct_from_user(&karg, sizeof(karg), uarg, usize);
> > > +     if (err)
> > > +             return err;
> > > +
> > > +     switch (karg.query_flags) {
> > > +     case KALLSYMS_QUERY_BY_SYMBOL:
> > > +             if (karg.sym_addr || karg.sym_name_size)
> > > +                     return -EINVAL;
> > > +
> > > +             len =3D strncpy_from_user(namebuf, u64_to_user_ptr(karg=
.sym_name_addr),
> > > +                                     sizeof(namebuf));
> > > +             if (len < 0)
> > > +                     return len;
> > > +             if (len =3D=3D 0)
> > > +                     return -EINVAL;
> > > +             if (len =3D=3D sizeof(namebuf))
> > > +                     return -ENAMETOOLONG;
> > > +
> > > +             if (kallsyms_lookup_names(namebuf, &start, &end)) {
> > > +                     struct kallsyms_mod_find_ctx ctx =3D { .name =
=3D namebuf };
> > > +
> > > +                     err =3D module_kallsyms_on_each_symbol(NULL, ka=
llsyms_mod_find_cb, &ctx);
> > > +                     /* Check first: maps -EOPNOTSUPP (CONFIG_MODULE=
S=3Dn) to -ENOENT. */
> > > +                     if (!ctx.found)
> > > +                             return -ENOENT;
> > > +                     if (err)
> > > +                             return err;
> > > +                     addr =3D ctx.addr;
> > > +             } else {
> > > +                     addr =3D kallsyms_sym_address(get_symbol_seq(st=
art));
> > > +                     for (i =3D start + 1; i <=3D end; i++) {
> > > +                             if (kallsyms_sym_address(get_symbol_seq=
(i)) !=3D addr)
> > > +                                     return -EADDRNOTAVAIL;
> > > +                     }
> > > +             }
> > > +
> > > +             karg.sym_addr =3D addr;
> > > +             break;
> > > +     case KALLSYMS_QUERY_BY_ADDR:
> > > +             if (!karg.sym_name_size)
> > > +                     return -EINVAL;
> > > +             addr =3D karg.sym_addr;
> > > +             /* Reject addresses that do not fit in unsigned long (3=
2-bit). */
> > > +             if (addr !=3D karg.sym_addr)
> > > +                     return -ENOENT;
> > > +             if (!kallsyms_lookup(addr, NULL, NULL, NULL, namebuf))
> > > +                     return -ENOENT;
> > > +
> > > +             len =3D strlen(namebuf) + 1;
> > > +             if (karg.sym_name_size < len)
> > > +                     return -ENAMETOOLONG;
> > > +             if (copy_to_user(u64_to_user_ptr(karg.sym_name_addr), n=
amebuf, len))
> > > +                     return -EFAULT;
> > > +
> > > +             karg.sym_name_size =3D len;
> > > +             break;
> > > +     default:
> > > +             return -EINVAL;
> > > +     }
> > > +
> > > +     if (copy_to_user(uarg, &karg, min_t(size_t, sizeof(karg), usize=
)))
> > > +             return -EFAULT;
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static long kallsyms_ioctl(struct file *file, unsigned int cmd, unsi=
gned long arg)
> > > +{
> > > +     struct seq_file *m =3D file->private_data;
> > > +
> > > +     switch (_IOC_NR(cmd)) {
> > > +     case _IOC_NR(KALLSYMS_QUERY):
> > > +             if (!extensible_ioctl_valid(cmd, KALLSYMS_QUERY, KALLSY=
MS_QUERY_SIZE_VER0))
> > > +                     return -ENOIOCTLCMD;
> > > +             return do_kallsyms_query(m->private, (void __user *)arg=
);
> > > +     default:
> > > +             return -ENOIOCTLCMD;
> > > +     }
> > > +}
> > > +
> > >  static const struct proc_ops kallsyms_proc_ops =3D {
> > >       .proc_open      =3D kallsyms_open,
> > >       .proc_read      =3D seq_read,
> > >       .proc_lseek     =3D seq_lseek,
> > >       .proc_release   =3D seq_release_private,
> > > +     .proc_ioctl     =3D kallsyms_ioctl,
> > > +#ifdef CONFIG_COMPAT
> > > +     .proc_compat_ioctl =3D compat_ptr_ioctl,
> > > +#endif
> > >  };
> > >
> > >  static int __init kallsyms_init(void) =20
> > =20

