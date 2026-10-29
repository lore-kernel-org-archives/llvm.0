Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793313228;
	b=ZI/KxxqCv0QMT+j8oCwQa3/LOcn9zRd/25Mz6CDXRA8PLV73mgHSMZMJ/FEvwvXvW/pQ
	 3qyEgBdpbx/8mDG7q6grvQraNZfVsP6zIk7RwecyloOcnCASHlnxM/XMewXTd3rWNaSoZ
	 Kj0T1FPfwowo6FQOoxdEGuYX97P5HiJAd5AvO04SfRh4Pd2sdXoABzI4Bk2nHBl2PbCwL
	 qGr6unsNK7cdBTDl39jAoZBZVlUQ5ei2qVD0QwRAjSb1nUuawCcPSWAu5equ/uLu5p+gE
	 9+TbC5RpVlNWhhZiaPhi6WUebOtf4z1PVd5gbqbVGNOdfTj+6OnbACII15licRr//8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793313228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=2C16if6DY4JWsOG2lgpyOm+rUUE2AWwmlNktllWtOWQ=;
	b=5To22ur9BlHQw04rZuuPOJ5A2NBIyHjeFSCFzQvhZAfI66jsGkamKCTOMeWl/LHX15tI
	 Egez3Pa1dcEeyed2rvT/WByiZuIiRC0ssli7IOnDKC4AEUARUJVrZKESgfyVXty1a191i
	 luZ/wXlzia814jJRJdfQFwjKHzhvjP0ryaMZ92vV8nfZ5sqiGWSJD8ysmzPXAhOs05hh7
	 sl7wGzuUAvQEQRTlLDGCFtcImw16ZqtKxO1AIkx9+HB0pPM5PHjqAZvIqxmOIi+KeakVm
	 Jdh2mIOae4D4zVcTAV5HNvvwv7Yzb/H/rkMPYdRiQzmBFHUZsGmIeRahytyT9pJCODQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S4FU6xsf;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FD5606A327
	for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 22:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28FD5606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S4FU6xsf
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so6804915e9.1
        for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 15:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793313226; x=1793918026; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2C16if6DY4JWsOG2lgpyOm+rUUE2AWwmlNktllWtOWQ=;
        b=S4FU6xsfk0hbeBMlykPn8oia2JVFX/sYRkHFauenDoOmAoVholo4DLP9AAXbqko+Ab
         M/3FasHx9UnVe/bx4QFOCLR4OpWzQjHWaOD+wpSfhcz6NkqT5lUcUcC6RnkpKIg4+CdK
         wQsaABtgfSltHmNO5fa5QcsI1rIbcwyTbV2D218WLZUIPg6FiIY15paihWB580Jt3eU0
         Iy+esV6wxT8AbIF8tIf/tNBfbK8B8y5Mgt04lZmTBhOCmnDwO3PX/1Qct5ePL4GDmzjY
         caTtpMggKjq+fNAhkKfInbDDYCsQjKxo7A/d4n/yos+0MwOYHwpPRKRNHmhK3iHeN1X4
         DS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793313226; x=1793918026;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2C16if6DY4JWsOG2lgpyOm+rUUE2AWwmlNktllWtOWQ=;
        b=PWpSoHjNbkx3MW+WtN77gK/lq9DA68wOrhOtODZIBKMKcQcVIrpTlpZClG6GlXgbzv
         3QiynrkqNy2tBuWVFSX3zJT5c6JYl76ThxHF505h5S3NUtqvqqoyZObPYg8Dvx35qrc7
         ilihW0bTt97gaJAGw974iieR4NppGSNS7t9vL790S/eWzp/N2po6Rb2b8gnEKCjwSrXz
         ev5IQcMSzz6e5BmHWyJf/LjVk9Iks6XUDJEMSWctN7+heN8saApk1/lkmIzDMkqE6BEr
         gTcYDQYIgaKEcw36ueKkWWB+SIRQl0k+nxmv3+bv2NvY/cu8vVjkXb78ahfzCEhXSJ/J
         eiWg==
X-Forwarded-Encrypted: i=1; AKwUvBy9DbyAGJWM++JbSC9gWYbQ4j/Od+pUAgXMYQjn1AHwsvoGxHFn+y96oZw1UWVWd51YrKyP@lists.linux.dev
X-Gm-Message-State: AFq9FYIMCy5+dwbN8X8jwiJkmq7zpB8x6qCKM5qqXWDwL/2Z2TYq/OPe
	4OSTkzQKbLT/aZDcL2TNtPrqHXTdB/dR55K8Prd1yQRL1fonF1gIlnjM
X-Gm-Gg: AYBFou34w6fSVpdLfZMFxMlPeSbJ0PvGiQVFKNjIVMknfp2L+7gziRUd1FHvsBDJX+t
	Ga4Xr2Dk+B/xxq0B60dhEx3WsiQoSFyr4mq3rh2UYIXzYwB5MgsLz/JimNtZWpZ3sb7enG7dnmM
	BGUVE3GShbJmCuAqXoNBPBYvmj2gDPCAUFXr2ndEFYjR2PFilkLkAeI/MD1LmgzOLWXJUXjkmls
	NYnsqBqOGyehCEHIheAsXanzrugCFl0hQeZP93PWvU9ysqi1tgrHJhl6xrs0jC3GH2+H4e2Krvv
	L7y4PZ5B+M9+CM+vPQI8Mf7Im3QSXv7pmd1t465kV6YOhhns7lLryNvvmTsZYlpCBeAN6g4HoXw
	b6WFekdxkp3Bx2qWFGhxVKWHqmt9mC7kiSCs1yV6yDdlWeoJ8qdcydDubUiS/nK4fU2hYVXIpFC
	oFnk4Clpnp0FgK5T2nGzMAHKCsqshXpdTgNgqaKenEaZkEzZDR13gnlre3RMHuR8acafcN0DRg2
	6Ef2OJjNth/2RSBLjGzPbawzVgudqbb7dvSeiZrCfkXfnOZAUIiOWewPwBVFL6QTGXiWAiXYynB
	MHRdiaKJxcOgVBzeipJRNw9ighWn3oRXk1x+3AhzfS696bp4nTh9suTeSJgvrFRZMlpsk6cSm6E
	u6+GZ1GTtlDE=
X-Received: by 2002:a05:600c:4687:b0:4a2:10f9:37db with SMTP id 5b1f17b1804b1-4ac16fa4dadmr7994095e9.7.1793313226338;
        Thu, 29 Oct 2026 15:33:46 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f3229dbsm91077035e9.1.2026.10.29.15.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:33:46 -0700 (PDT)
Date: Thu, 29 Oct 2026 22:33:44 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Samuel Wu <wusamuel@google.com>
Cc: Jiri Olsa <olsajiri@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii Nakryiko
 <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai
 <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi
 <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Emil Tsalapatis
 <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-doc@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next v2 4/6] libbpf: Resolve typeless ksyms via
 KALLSYMS_QUERY ioctl
Message-ID: <20261029223344.5dbe60d5@pumpkin>
In-Reply-To: <CAG2Kctra0GYjkzggB0cdMxPK-b9U9x-m+gR6E8goAYvhsNXEdA@mail.gmail.com>
References: <20261023001603.560210-8-wusamuel@google.com>
	<20261023001603.560210-12-wusamuel@google.com>
	<at8dNNb4vwovNZcZ@krava>
	<CAG2KctpMEuK5OJSedSFshNMSwOqe1g87m2ZOKBhn=Z5iCA45Aw@mail.gmail.com>
	<20261028140127.7bfeab46@pumpkin>
	<CAG2Kctra0GYjkzggB0cdMxPK-b9U9x-m+gR6E8goAYvhsNXEdA@mail.gmail.com>
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

On Thu, 29 Oct 2026 14:35:36 -0700
Samuel Wu <wusamuel@google.com> wrote:

> On Wed, Oct 28, 2026 at 7:01=E2=80=AFAM David Laight
> <david.laight.linux@gmail.com> wrote:
> >
> > On Tue, 27 Oct 2026 15:07:44 -0700
> > Samuel Wu <wusamuel@google.com> wrote:
> > =20
> > > On Mon, Oct 26, 2026 at 2:28=E2=80=AFAM Jiri Olsa <olsajiri@gmail.com=
> wrote: =20
> > > >
> > > > On Thu, Oct 22, 2026 at 05:16:05PM -0700, Samuel Wu wrote:
> > > >
> > > > SNIP
> > > > =20
> > > > > +static int bpf_object__query_ksyms(struct bpf_object *obj)
> > > > > +{
> > > > > +     struct kallsyms_query q;
> > > > > +     struct extern_desc *ext;
> > > > > +     int err =3D 0;
> > > > > +     int fd;
> > > > > +     int i;
> > > > > +
> > > > > +     fd =3D open("/proc/kallsyms", O_RDONLY | O_CLOEXEC);
> > > > > +     if (fd < 0)
> > > > > +             return -errno;
> > > > > +
> > > > > +     for (i =3D 0; i < obj->nr_extern; i++) {
> > > > > +             ext =3D &obj->externs[i];
> > > > > +             if (ext->type !=3D EXT_KSYM || ext->ksym.type_id)
> > > > > +                     continue;
> > > > > +
> > > > > +             q =3D (struct kallsyms_query){
> > > > > +                     .size =3D sizeof(q),
> > > > > +                     .query_flags =3D KALLSYMS_QUERY_BY_SYMBOL,
> > > > > +                     .sym_name_addr =3D ptr_to_u64(ext->name),
> > > > > +             };
> > > > > +
> > > > > +                     err =3D -errno;
> > > > > +                     if (err =3D=3D -ENOENT) {
> > > > > +                             err =3D 0;
> > > > > +                             continue;
> > > > > +                     }
> > > > > +                     if (err =3D=3D -EADDRNOTAVAIL)
> > > > > +                             pr_warn("extern (ksym) '%s': resolu=
tion is ambiguous\n",
> > > > > +                                     ext->name);
> > > > > +                     break;
> > > > > +             }
> > > > > +             ext->is_set =3D true;
> > > > > +             ext->ksym.addr =3D q.sym_addr;
> > > > > +             pr_debug("extern (ksym) '%s': resolved in kernel to=
 0x%llx\n",
> > > > > +                      ext->name, ext->ksym.addr);
> > > > > +     }
> > > > > +     close(fd);
> > > > > +     return err;
> > > > > +}
> > > > > +
> > > > > +static int bpf_object__resolve_typeless_ksyms(struct bpf_object =
*obj)
> > > > >  {
> > > > > +     int err;
> > > > > +
> > > > > +     err =3D bpf_object__query_ksyms(obj); =20
> > > >
> > > > hi,
> > > > we could also add similar support for libbpf_available_kallsyms_par=
se and
> > > > probably in some other places like bpf_get_ksyms.. which makes me t=
hink it
> > > > could be useful to have KALLSYMS_QUERY support for multiple symbols
> > > >
> > > > thanks,
> > > > jirka
> > > > =20
> > >
> > > Thanks for lookiing over this Jiri!
> > >
> > > Using KALLSYMS_QUERY for libbpf_available_kallsyms_parse() would
> > > theoretically by O(m*log(n)) instead of O(n*log(m)), where m is the
> > > number of tracefs symbols, and n is lines in kallsyms, with n >> m.
> > > But AFAICT, libbpf_available_kallsyms_parse() would only be called in
> > > pre-6.5 kernels, for kernels without commit 83f74441 (ftrace: Show all
> > > functions with addresses in available_filter_functions_addrs); so this
> > > ioctl could never be called. =20
> >
> > Isn't that code also O(n*log(m)) ? =20
>=20
> Yes, sorry maybe I wasn't clear before, but the current code is
> O(n*log(m)), and the ioctl approach would be better since it's m
> lookups of O(log(n)) for vmlinux symbols, where n >> m. However, this
> is a red herring because that path only runs on pre-6.5 kernels, which
> won't have this ioctl.

I was thinking of the ftrace_lookup_symbols() code (called from
bbf_kprobe_multi_link_attach) which O(n*log(m)) (the wrong way around).

David

>=20
> > I've got a patch (I might send it after the merge window) that changes
> > one of the ftrace functions to look up every symbol by name, not just
> > when only asked to look up one.
> > It can also use the 'callback' function to detect duplicates.
> > That should be massively faster - especially with my ~18 fold improveme=
nt
> > (also waiting for the merge window to end before posting a new
> > (not much changed) version). =20
>=20
> Excellent, I'll keep an eye out for it!
>=20
> > Does look the the code could do with getting the 'symbol name table ind=
ex'
> > for the symbol so that it can read the entries sequentially from that
> > point onwards.
> >
> > David
> > =20
> > >
> > > And regarding bpf_get_ksyms(), it loads all traceable functions and
> > > needs the full syms table, so a /proc/kallsyms should fits better.
> > >
> > > I did profile a slightly different form of querying multiple symbols
> > > at once [1], but didn't see much benefit. struct kallsyms_query is
> > > extensible via size and query_flags, so we can update in the future as
> > > needed.
> > >
> > > [1]: https://lore.kernel.org/all/CAG2KctozPSev+EXSpHitM3JWfjufQaEjsPJ=
HS_1HJ1wSm7sJ1w@mail.gmail.com/
> > >
> > > [...]
> > > =20
> > =20

