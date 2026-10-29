Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793312201;
	b=NcRrjADlwpQK7m1vvQU+SN/PaEg/fVFKs7MKf1yXfemFjMpkBo+XWUuKQ1sJkCOi0GRt
	 JVESUFbcl7nQwh5T1QvAZKIy9dvKk5fDxi4H7h3q/HejZlwa1Vsz8vVCX/aWdkPuWGNHY
	 nc4aEI3Az60QpWhAMpS9V6c82N83N5gMsoDRQDAoMDRfKuE28yTEhnNHwVRzWhCFLvnX7
	 HoLk3cztLsyP0GQM6sM1x9vbLgz2w35miEmxBM2fBrr2HV68LetnzVIBpIngrLQDtsN7V
	 M3VqPrW6PBuLcEHK5o64BZZd+RZx56SOY+xwPh9Adz3XtLWKPzQg9ibOQknh0yucYgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793312201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=koZpx6vqHKuQYrxobP/d4PhoSM1zd0NfzqrWj5/V+0E=;
	b=JgVPoO2G8p10e4XVEY7qLE7tQlBrKnsevYDe5UucNp1+UOQ79ScoIW+oaziWw2SvEtzK
	 +dvmccjUWiBWqoubn4Y1mwbrMP0Evht6YJCpswTjQL/OZvkr4aBMlTtAQsc2LMgxHvHa7
	 TtR62Yp+iDIz28dmRmXsCk6d3TFp6IVu4AQgWFjCj/7JkGvE1OF8KjAWNL2g4vovZVMIp
	 UsNITJlc14Gk8OVc1QU9sPs+FdL6IXDiPDupWGCR5SXMmy5vxbDOb7Iiw9LffY7pDQvjN
	 4zL6o/rm7vgIvcbLhSiNalraFhdhoZbdml6wdJgFbAghZBm2doJnfyBfMFi9Wkgf1YA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z62sNyS8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D650C606A31A
	for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 22:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D650C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z62sNyS8
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso26557a91.2
        for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 15:16:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793312200; cv=none;
        d=google.com; s=arc-20260327;
        b=A0M55eOZBTjAgGJCznd0JSnzXzkpSzHKLBnxCQCXfBlpR8P0lsS5w8zu94Sa8TqPII
         4ZT0OjKSiN79OhiYg+tai4nkfw5eBZh1qnqPkDYy53tllzPaggdaP6tUP2LNAygtuVmA
         RIShP9/oTtcwpUrGsvXr8IjmfkQS2qyIAUrY26M5LOuYz8KQ/o4pjJGLfHKM4YNFTyqK
         m1d9XP3DVj25t3zGSR2DN3q430JrNoN1Guu3waCtZuhGmc5h45+TgamO+FeqlevOAhoN
         GDu3E8vtc3ZkZ6ZTD5uMCKj5S+NuqNON7t2+p9DMpmFm3ILuRNGzZprT4MqdV0opA3w6
         NO2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=koZpx6vqHKuQYrxobP/d4PhoSM1zd0NfzqrWj5/V+0E=;
        fh=8XIAzr3fDBTN06T3EfuYqjESYe0U+EUin18xJ5ejkKM=;
        b=eC5kmnMQHCFpH5HySZhpEEtda4+3V51TSipKcThpZMG5DQzQPrBJCG34JvJlCMedgP
         ZhZihFsb1iPCyNT07Yym7fS0JE6x9ypAXfkXoCXZozGLPH6ruH6+6VJdNB3CnGnYm6IJ
         49lHOVLheccbWXqNbkxFd5muD8hI1BHrhXAPZmigKmGaDn8iA4BFgEgLwmd2jkd0WPwY
         saj7ubF7x78LutSTbK85pWX0isSS9CjAvxIJI1c4PeQmkQNk2LvUJRRjf0Z2+fKjxhei
         kVer9HA32NGl3Bjmt76sQnljk6dxT926kJP5FzG0OlKVS8lCmwjCP/ijvjbawcFRWE5M
         uMjA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793312200; x=1793917000; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=koZpx6vqHKuQYrxobP/d4PhoSM1zd0NfzqrWj5/V+0E=;
        b=Z62sNyS8VHk7wi3gekHSEmELZt1AjDfecZp49mAI7zsvbBDX7CSaj58BqQRRJjzyIx
         uwn8t8VR/xmrJdhInjyweV0W3nT6t1JoafXC+wqL4rWyIMOrnbTzN3qQWyOLaYyeEDKy
         BVSZ2LbkuwcWI45G4QjmjjCAZXLFxZR+GmIUULGkBZrugFibDEztVZXl2TG5xiDgJF2z
         ZBrgSHC12piNjlRQOa54BxPyhdQ7sy/KmcwbknxzoOyYkmIsY0fMTu6z4IwSQPRAMp3m
         3HPouSHSgXyQ9TlOa6UtCRZHiTmz0keLQfoxjpUpAH0nWJnSOLpbw1yyk3rQ+98bm5Lh
         u1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793312200; x=1793917000;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=koZpx6vqHKuQYrxobP/d4PhoSM1zd0NfzqrWj5/V+0E=;
        b=CXhkIUe961KV4gFKjNg6Mqe0ORR5UN1iWcDQtUrXqQyH5f1g/CgGRDuZkUg13tTqUl
         eCjUCIkNrWodjHVghpANxz3vZJ3sooOV3MfZreeKJ30C5f4e0qyaa3v0rnP5elwg5fzV
         gvk8HAc3xmpiRpVO+qnrrto22u4VKdM+dAcQNhoi/gS6Gzdp8/a+OXmtj8v5jaOwZoqj
         ximL0x1xvAiCqS1n0QAMjnsSRfDX0YFWOnXpPLthbAPWnuvRl3Tbn3qx9Va4yfkFg1O5
         i9c/TtyJANUZPksPRdNrmtP21kHiLJTDtx1cBMEqnU6eSs0weQFwpzEzgcOvw4yZFG27
         Ef5g==
X-Forwarded-Encrypted: i=1; AKwUvBxIaJR4SjZJjOkloKIzaZsHDRaou5omL/gZ6AVjmarpxa62sfYiH5fQSafgFrCRuANgeSt8@lists.linux.dev
X-Gm-Message-State: AFq9FYLfpA/jktSToCU/Sp3IK3zlf8hmtYXat08F4nMfQhCFkd90lzUm
	CzGSVEnIXmspKLEANSVbs/Gx8zVDJqoIhhtKFAJJuc8neY+RxMyOU1dNHnJXTBekP2Mwozw29C5
	e6H0NPXAz9szJS/FMclcBZCQKPPTF9co=
X-Gm-Gg: AYBFou18fv/PYWnqUQ28c7di43QPvNNntnOi2MHhYV/g0qb/BoEci+SVk7kVdEy1r/t
	TMBH1TqsT8YrhT5MJkmfDJIjxFF3l/HlImZj8PQoaikcF0Q+2YkBi3xSKjnTYUNeKwg0ctoTkin
	Wn6cRtggg3vp8sBp5OD4+td/iaBx4pQ/SGWxXD91VtSUC1Ch1UVaf+LO8YIBckjrVygQ5IghFhI
	bZwrfsmaJ8lIchUA57qg6lIeDd4tlOY22WmjWtRFr3lyL1Ic4bXi26fEVjgpZpNmv2m1OsPcqly
	z+5TOGnopG/zYvJlwTWLgh/dDi/P/KMhkLx+SIj7Sqh59wQ0at8RxNKXOvonXsAYrlN30U2Chen
	dhkO/+Bb1d+QD/tfPA+TdEWzF0zYkp5V9hlo39nhlJHEvguvMebnSYKPQ8UakmbbzFJaNCVgcND
	uyJIhc/vxk1GqIp2kgMthBsnl66wOMZ8odVQ==
X-Received: by 2002:a17:90b:380c:b0:3a7:250:333e with SMTP id
 98e67ed59e1d1-3ae896f8315mr277145a91.11.1793312200139; Thu, 29 Oct 2026
 15:16:40 -0700 (PDT)
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
 <20261028134012.01d52e94@pumpkin> <CAG2KctpGPHo-S3AEvBhK5HPUnDHfoJu6Z-r+cS1hQ4Ps=B3DmQ@mail.gmail.com>
In-Reply-To: <CAG2KctpGPHo-S3AEvBhK5HPUnDHfoJu6Z-r+cS1hQ4Ps=B3DmQ@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 29 Oct 2026 15:16:27 -0700
X-Gm-Features: AclHuK9av7Er2dEcOWg6hJWIv2K2TpdNYpqUpTLgWkKxe-dORmBpAAvoyO4hh00
Message-ID: <CAEf4BzYT4rvKwbOJ6UQ3zcp4wdsSBqRsMz-2=U1DA2RyUA3XSg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: Samuel Wu <wusamuel@google.com>
Cc: David Laight <david.laight.linux@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 3:06=E2=80=AFPM Samuel Wu <wusamuel@google.com> wro=
te:
>
> On Wed, Oct 28, 2026 at 6:40=E2=80=AFAM David Laight
> <david.laight.linux@gmail.com> wrote:
> >
> > On Thu, 22 Oct 2026 17:16:02 -0700
> > Samuel Wu <wusamuel@google.com> wrote:
> >
> > > Add an extensible KALLSYMS_QUERY ioctl() interface to /proc/kallsyms
> > > to support fast point queries without scanning the entire text file.
> > > Exactly one query mode must be set in query_flags.
> > >
> > > When KALLSYMS_QUERY_BY_SYMBOL is set in query_flags, KALLSYMS_QUERY
> > > resolves a NUL-terminated symbol name in vmlinux or loaded modules an=
d
> > > then populates sym_addr:
> > > - Searches vmlinux first via kallsyms_lookup_names() (binary search),
> > >   which takes precedence over loaded modules, and falls back to
> > >   module_kallsyms_on_each_symbol() under module_mutex for module
> > >   symbols
> > > - Matches names exactly, like kallsyms_lookup_name(), disregarding th=
e
> > >   .llvm.<hash> matching, following precedent set by commit fb6a421fb6=
15
> > >   ("kallsyms: Match symbols exactly with CONFIG_LTO_CLANG")
> >
> > Hmmmm....
> > What happens when you have functions foo and foo.constprop0
> > In some sense they are duplicates.
>
> BY_NAME matches names exactly, like kallsyms_lookup_name(), so they
> would be different symbols at different addresses. Please correct me
> if I'm missing something here!
>

foo and foo.constprop0 are different functions with different
arguments, so I think we should distinguish them. The only special
case is .llvm.<hash> because that suffix is added by compiler for LTO
and I don't think the function itself is any different from the
original

> > > - Resolves 0x0 symbol addresses in both vmlinux and modules
> > > - Rejects ambiguous symbols (multiple entries with the same name at
> > >   different addresses within vmlinux, or across loaded modules) with
> > >   -EADDRNOTAVAIL, while allowing same-address aliases
> > >
> > > Userspace symbolizers resolve kernel addresses to symbol names with
> > > /proc/kallsyms. This is typically done by reading the entire
> > > /proc/kallsyms text file, and keeping a compressed sorted copy of it =
in
> > > order to resolve addresses at runtime.
> >
> > You could mmap the tables into userspace and have a ioctl that reported
> > the offsets of the tables (etc).
> > Then user lookup would faster then kernel lookup!
> > Especially since you could throw a bit more memory at it to remove the
> > linear scans.
>
> I think that would increase the UAPI surface because it would set the
> table format, so I'd prefer not to. It would only cover vmlinux and
> not modules, and then we'd need to apply kptr_restrict checks to the
> mapping.
>
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
> > > program with 11 typeless ksyms has ~220x speedup (157ms -> 0.7ms).
> >
> > Have you tried measuring it with my patches that speed up the kernel
> > 'search by name' code?
> > That speeds the lookup by a factor of ~18 (testing the code in userspac=
e).
>
> Not yet. Can you point me to the latest version? Happy to try it out.
>
> > You also should allow for 'find first' and 'find next'.
> > As well as letting the code iterate though functions with the same name
> > it is absolutely trivial to enhance the 'lookup by name' code to match
> > a prefix.
>
> Agreed, that would be useful. In v3, the idea will be to have BY_NAME
> return the first match by default, and an ALL_MATCHES flag to report
> how many matches exist. Find next and prefix matching can be added
> later with breaking UAPI, and best to not include in v3 since there
> isn't yet a user.

I do think it would be good to spend a bit of thought on how to
support at least one-by-one pagination from the get go. The same
mechanism can then be used by batch version. I.e., think what can we
use to provide data back to user which they can use to continue search
after the symbol we just returned (at least for fixed set of symbols
in vmlinux and modules; we also have dynamic symbols added for [bpf]
"module", etc, we should support those as much as possible with the
least possible deviation, IMO)

>
> > (Basically it needs to 'return -index' instead of 'return -1' when the
> > binary scan fails.)
> >
> >
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
> > > +      * symbols as %pS are searched: vmlinux, loaded modules, BPF JI=
T
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
/
> >
> > I'm not sure you need a size here as well as the one in the ioctl comma=
nd.
> > It only complicates things when they differ.
> >
> > If you need a new version they you add an extra case to the switch stat=
ement.
> > Simple and easy,
>
> Good find thanks! Will update.

think about user space application compiled against UAPI headers from
older kernel version. For that application size will be smaller and
that's ok, newer kernel should honor this and only fill out smaller
part of v2 struct. Versioning is done by appending fields. This is a
well established pattern that provides a pretty good forward/backward
compat story, let's keep it.

>
> > > +     __u64 query_flags;      /* in - query mode (enum kallsyms_query=
_flags) */
> > > +     __u64 sym_name_addr;    /* in - address of symbol name buffer *=
/
> > > +     __u64 sym_addr;         /* out (BY_SYMBOL) / in (BY_ADDR) */
> > > +     __u64 sym_name_size;    /* in/out - name buffer size / bytes wr=
itten */
> >
> > Maybe separate the buffer size from the length of the symbol written?
> > The in/out parameter will get annoying in code doing multiple lookups.
> > Or just have the buffer size and require it to be '\0' terminated.
> > (There is a strncpy_from_user() can that be used.)
>
> That is simpler- in v3, we can have buffer sizes as input only, and
> names will always be NUL-terminated.
>

user code can be easily written by always setting buffer size, even if
kallsyms_query is reused. This is the pattern with PROCMAP_QUERY,
let's keep it consistent.

also, returning actual size even if buffer is too short is a good way
for user space to "probe" and increase buffer if necessary. unless it
adds tons of complexity, this is a good and flexible UAPI

> > The '\0' terminated string handling is likely to be noise against
> > all the rest of the lookup code.
> >
> > David
> >

[...]
