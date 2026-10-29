Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793309750;
	b=MU+3z5o5zBbBSu7LePoOCIfF1MNFYx38T9LIOdD01QygjZzOFPIFGtsPXSrjD5xwY+OK
	 NzPA4X/NGE9XIQWaNH580+bLseShIFcDaUSvHrHefm/d0+qm5xyJxKKhY/XXCu2B3tAZV
	 mv5iP1GMs3RNJZAd/oZahAmHcBDtF4Cp0Itmtvj6vayH+YUQ445IjsIZZuwPdVsi+e5Q9
	 Epsb+wocutNtBESKhA8IPGZBVkXEPSyyXndglHXPgFp3CZz4NOqyzUWe8UB0/YnYQR8L2
	 u9Bb59bYjGY0zKwaLt+i2bDP81QcCDl5ozelMxkfqNoh5s8Azno8Nh6CME9IQg9CGbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AjT67sODfv8LIA3zVwUGB//ZCy/sHbwEFOtaC99aW5g=;
	b=aesEPS5v75eRXQlrNtyFQMcgpNp+XAaPlMvNL5qumOts+fk86IJjJ8zuO4DN67vpcMvp
	 6f3CyobSQ1z8CGrTl7+i4pXvUscwwTtRbO7E/8lFcovt7tuFLAwZt8ZTrEJ5ym7NIns0u
	 6hM1F+cv7WqwcMAyWUGoQ4zN+3OlHS3PsZ3R39ejh6u5MVgE525ACC7//7fjYm1uK7fev
	 KdBNH+oPBqxs20RrNSBbHq1QktEs0efwUXik2M4Hm0xEwm1yg3kCf2/uk5GB5xWoneSoX
	 6FhpM/kin2AJh2f/JSPfwFLMKwwaVXJW+kNvYvlGU7QPdDnnKcRVRSoPYN9Q/u5nEbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=H5y28dd5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AE5606A320
	for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 21:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2AE5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=H5y28dd5
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4395d31228so1303266b.1
        for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 14:35:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793309748; cv=none;
        d=google.com; s=arc-20260327;
        b=ps9cL24L90ldr0/IFpI3O8KKmuOrQtWeW4sTjNZHV8qL7hn1bIZXJjRgk5XmxXHNqP
         sWb3Y2mNhFqOz8F4ETMPvb14NVZTf1JS5Xz6JDKOeGxaiuVooI0QB0IzGUwli4j/E4gk
         Fcg07b5/DEeECtPdzhyrhm8zQR29q/f6dW0Ju8j+VyZSPpVVfT4FrA03dIYE0j5b456C
         cDNwBOmDwhKiSeB4HTlxjole1g0GVromMu95H/kn3jGbJ9T9HwCE+vft1nnDm9dhaSZW
         68qXRiNcvYO3q3+1ssoQX3/05ZfbqlFkIJ9fjXDFoiHtYUSb5e01BdEyi/gM0dfoqSGl
         j7sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AjT67sODfv8LIA3zVwUGB//ZCy/sHbwEFOtaC99aW5g=;
        fh=o6p0H+jm87ow83/9chF9rCUJLh3k81sbLh3yRrfubMw=;
        b=hf/RGHcc9Hc7UvA8mpl3raM8KsoiqhN9T02U+aD9voDhYzqs/5TtslUq2BJfMheV1y
         2ehisKVcDTB7al6/P3RK/HRcZb2XTaBQ8EZHoXT8E60UBjKlYzbNuaEn2AJ6G1dIzwFb
         G+AHUXIb8Rse72XX1uwdBZWp3XkimRYzHOtpmvqeT/u6UUjD2yUGj5YkhVvk7x9qLiEK
         rk2PQATSYt21AdjzTNhVdWoBK7jwDYGbMGkXH7NBCvhLML5Pf4LLU/1spAtRc8btVBF9
         HXrJm5cFJKuADIw4MwXObFAnunUoLWjPUeFEzubmq/C73MnkquqL+itpneQfIP9CZ2fU
         wsxg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793309748; x=1793914548; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AjT67sODfv8LIA3zVwUGB//ZCy/sHbwEFOtaC99aW5g=;
        b=H5y28dd551OZvFu/kEr23oo5eAOuIbWTpW66aTOQBrXpsNpgXcmR4kHYWK3XowIWQY
         yeq0WafL6hC1fQl0OcoDTay9o59cWIdtTrDA8Xl3/4k/IPJu0GPpcZ7BAzOZ6gdP+Dcj
         xofoyxN+okd11vCovj0ZFYJgMW71RKPPq2RGZkEyRvdw1swIjxdntmuC4VPjSojdiM2S
         VDOD1oieqjlr/hbn2pbscSeqDskijCDlvWxvza4xhBG9K9LaH6ITpdrVJcfH1mneNG7P
         6q4nT0vsa/EJte7AecMVIq90sJkqHfN8Yx/nlXVHZybJbk/EtuzaDm8/7boLZbrmzrIb
         PK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309748; x=1793914548;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AjT67sODfv8LIA3zVwUGB//ZCy/sHbwEFOtaC99aW5g=;
        b=s1S2fZuPxsuk1RkGvizm6hcznw0krrt+E8V3GsBUGQ9+UtdZv+Se2o0nnXYNdpr+8k
         71Ljmfc9MdQL1zGqJl+ShnrUF9xegeZqlooq4d+cwN2b9cBlqfa1XI3tIkYgMGO2NAea
         IGoHpifNCPl/48SbMThJDoSX8H2M32cAl8B6KYBGtCE8v1ZgfibiWl0Jgpgets7sMtN8
         YcczbZqc9OT7JYmI+Y/1U+zg2CutCTss1CvWsbF4lhLxNjKYvhEmUFnuwRJPIU8w+2ho
         kuUzxi9edfynZmfz6ghW9dS4bCadQNCftAHyheH3imZVVPd3a3pnDDWbEHc/IadzZBvs
         ETuA==
X-Forwarded-Encrypted: i=1; AKwUvBzTWdU9y1v3icErmvbzg9Q6XHLwKZV01LXV4BSlfzEnIIKH195ecb17JUkE6uGpl2WGip6F@lists.linux.dev
X-Gm-Message-State: AFq9FYJiolA4zTCsesOE5yu5uxMruNHuj7R/q+tNcpbybAnSaS6xkrGk
	nEtIf8FxJtK9QtypnJcGNDVmdTJWkygCdr+ZPS/4GMaNCEPKAZeM/RPtZ6sbG3MOaqtO+tDq4L8
	EmYwubGvF328ohTb283eOdNBwacJIZat8+zQN0rpA
X-Gm-Gg: AYBFou1R2ZsmquYqe/ITcbXPFZN7VQ1WDAmK1abWHvb3rwnkvziI4t31V/47OtDmFIN
	IjSo6oqWzvViSW/5q+1uLU+a/Z7eMqOGZJL8yjUWuxwpp+mtLDvlx9LMsEvMfakr4ndIB3uQ+AZ
	CmFdLU0/od7viFE89fXY9GXMKKE+QGoPg76yXg23G3d0ABxX4sTsFa4RJbcALl2NDULXo2O8Fdv
	Z6zKVD7nGIDAGZNySTm3E2mCd6hnr9/BUYu5I+2u1X8xIxJbGkW1lVp/v+H9XdZIGUfQQ/c09FY
	2KEppzjBCpcj5RR8vCWuPcov4CoVu06NeYjLcK95lvKxQiLDrJezZ3SdxztP9uZRYeb955l+c5K
	/EenoI6YnnaIhMwKG27P0+BhKakq/kjAabz1bg0V27nxS2HGnPzRoIcLTa7qWUosT7WU5ym0=
X-Received: by 2002:a17:907:805:b0:c3f:a728:b437 with SMTP id
 a640c23a62f3a-c4ca7ac07eemr32967066b.45.1793309747666; Thu, 29 Oct 2026
 14:35:47 -0700 (PDT)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261023001603.560210-8-wusamuel@google.com> <20261023001603.560210-12-wusamuel@google.com>
 <at8dNNb4vwovNZcZ@krava> <CAG2KctpMEuK5OJSedSFshNMSwOqe1g87m2ZOKBhn=Z5iCA45Aw@mail.gmail.com>
 <20261028140127.7bfeab46@pumpkin>
In-Reply-To: <20261028140127.7bfeab46@pumpkin>
From: Samuel Wu <wusamuel@google.com>
Date: Thu, 29 Oct 2026 14:35:36 -0700
X-Gm-Features: AclHuK84Rx0Zv6bqYRMUgm-AA1OaD1X9ao32PPa3PHwJ78sUr0bqSyZbITTizzQ
Message-ID: <CAG2Kctra0GYjkzggB0cdMxPK-b9U9x-m+gR6E8goAYvhsNXEdA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 4/6] libbpf: Resolve typeless ksyms via
 KALLSYMS_QUERY ioctl
To: David Laight <david.laight.linux@gmail.com>
Cc: Jiri Olsa <olsajiri@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 7:01=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Tue, 27 Oct 2026 15:07:44 -0700
> Samuel Wu <wusamuel@google.com> wrote:
>
> > On Mon, Oct 26, 2026 at 2:28=E2=80=AFAM Jiri Olsa <olsajiri@gmail.com> =
wrote:
> > >
> > > On Thu, Oct 22, 2026 at 05:16:05PM -0700, Samuel Wu wrote:
> > >
> > > SNIP
> > >
> > > > +static int bpf_object__query_ksyms(struct bpf_object *obj)
> > > > +{
> > > > +     struct kallsyms_query q;
> > > > +     struct extern_desc *ext;
> > > > +     int err =3D 0;
> > > > +     int fd;
> > > > +     int i;
> > > > +
> > > > +     fd =3D open("/proc/kallsyms", O_RDONLY | O_CLOEXEC);
> > > > +     if (fd < 0)
> > > > +             return -errno;
> > > > +
> > > > +     for (i =3D 0; i < obj->nr_extern; i++) {
> > > > +             ext =3D &obj->externs[i];
> > > > +             if (ext->type !=3D EXT_KSYM || ext->ksym.type_id)
> > > > +                     continue;
> > > > +
> > > > +             q =3D (struct kallsyms_query){
> > > > +                     .size =3D sizeof(q),
> > > > +                     .query_flags =3D KALLSYMS_QUERY_BY_SYMBOL,
> > > > +                     .sym_name_addr =3D ptr_to_u64(ext->name),
> > > > +             };
> > > > +
> > > > +                     err =3D -errno;
> > > > +                     if (err =3D=3D -ENOENT) {
> > > > +                             err =3D 0;
> > > > +                             continue;
> > > > +                     }
> > > > +                     if (err =3D=3D -EADDRNOTAVAIL)
> > > > +                             pr_warn("extern (ksym) '%s': resoluti=
on is ambiguous\n",
> > > > +                                     ext->name);
> > > > +                     break;
> > > > +             }
> > > > +             ext->is_set =3D true;
> > > > +             ext->ksym.addr =3D q.sym_addr;
> > > > +             pr_debug("extern (ksym) '%s': resolved in kernel to 0=
x%llx\n",
> > > > +                      ext->name, ext->ksym.addr);
> > > > +     }
> > > > +     close(fd);
> > > > +     return err;
> > > > +}
> > > > +
> > > > +static int bpf_object__resolve_typeless_ksyms(struct bpf_object *o=
bj)
> > > >  {
> > > > +     int err;
> > > > +
> > > > +     err =3D bpf_object__query_ksyms(obj);
> > >
> > > hi,
> > > we could also add similar support for libbpf_available_kallsyms_parse=
 and
> > > probably in some other places like bpf_get_ksyms.. which makes me thi=
nk it
> > > could be useful to have KALLSYMS_QUERY support for multiple symbols
> > >
> > > thanks,
> > > jirka
> > >
> >
> > Thanks for lookiing over this Jiri!
> >
> > Using KALLSYMS_QUERY for libbpf_available_kallsyms_parse() would
> > theoretically by O(m*log(n)) instead of O(n*log(m)), where m is the
> > number of tracefs symbols, and n is lines in kallsyms, with n >> m.
> > But AFAICT, libbpf_available_kallsyms_parse() would only be called in
> > pre-6.5 kernels, for kernels without commit 83f74441 (ftrace: Show all
> > functions with addresses in available_filter_functions_addrs); so this
> > ioctl could never be called.
>
> Isn't that code also O(n*log(m)) ?

Yes, sorry maybe I wasn't clear before, but the current code is
O(n*log(m)), and the ioctl approach would be better since it's m
lookups of O(log(n)) for vmlinux symbols, where n >> m. However, this
is a red herring because that path only runs on pre-6.5 kernels, which
won't have this ioctl.

> I've got a patch (I might send it after the merge window) that changes
> one of the ftrace functions to look up every symbol by name, not just
> when only asked to look up one.
> It can also use the 'callback' function to detect duplicates.
> That should be massively faster - especially with my ~18 fold improvement
> (also waiting for the merge window to end before posting a new
> (not much changed) version).

Excellent, I'll keep an eye out for it!

> Does look the the code could do with getting the 'symbol name table index=
'
> for the symbol so that it can read the entries sequentially from that
> point onwards.
>
> David
>
> >
> > And regarding bpf_get_ksyms(), it loads all traceable functions and
> > needs the full syms table, so a /proc/kallsyms should fits better.
> >
> > I did profile a slightly different form of querying multiple symbols
> > at once [1], but didn't see much benefit. struct kallsyms_query is
> > extensible via size and query_flags, so we can update in the future as
> > needed.
> >
> > [1]: https://lore.kernel.org/all/CAG2KctozPSev+EXSpHitM3JWfjufQaEjsPJHS=
_1HJ1wSm7sJ1w@mail.gmail.com/
> >
> > [...]
> >
>
