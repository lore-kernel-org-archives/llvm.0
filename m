Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793196092;
	b=KkOajBrwjUKa3oU6/rXYTJ/1+m6NICYNaC2pBsDzQVgVwXanWxCa1Tr3VzSRMmKTL29d
	 /4LFwnIkR1PqAz+qbtTQMKFGY1NiptoHlv8YVLPkQRg92tTFHsC820l7sGTkB5Kinefsj
	 31CnV7WchYiz81XwphBFCiXUAKZmrbMCdyae5g48SzsCVSop+pcTaicf6S80rQRLbHHHv
	 ahVtNDJpgYBWU0jIOg+lO64veS+ZJPrVr7DxvL4Rh9NiRUBPpBHSy9w1/teYzj/P+s4IJ
	 vUNjzsC6Al9+RVlhaWUiInyLFUvHFWiWKiISrOZeMRfsA+3oASLsT0zkaqdYDLlhUBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793196092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=SyqHXLptMiWk+aCTehkHAqNtA/ZhM3lq7X8/7qWdG8M=;
	b=JoGJsOheaHCm059UotQzwjVWuOK7/4QMlPIRdsy9o7E1nulgxcHhqEXLXDCXH0rkdVtz
	 3FZgBY1hs9hqahYxELXKt+C69x3S+f7l3D9MjvWCr3HPqXxHGSuKLUYkZPhN/DxeAv8JZ
	 hVU3epUALG1QJC0VRmQYGb9hDLFUlDnpuR95DuXMTeB8YnD4TMzqRFQ6rzPxlw6lobkYh
	 JdywAFfnuOrcqZmXsmGXLMLaj2jnh5sDP85ugXAobueKwHXByqlYK06DHHwIiiBuydEZw
	 KMjCUqzxncYf4iJWLtvQNGMjXuGB/BrEBQnoWaYhXQ/AmtwdZJMQ4Y0ERN1ymfBgS4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sGFJ85La;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B81606A31A
	for <llvm@lists.linux.dev>; Wed, 28 Oct 2026 14:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9B81606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sGFJ85La
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso6871725e9.0
        for <llvm@lists.linux.dev>; Wed, 28 Oct 2026 07:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793196090; x=1793800890; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SyqHXLptMiWk+aCTehkHAqNtA/ZhM3lq7X8/7qWdG8M=;
        b=sGFJ85LasqTULFUgSQvf3iBVVqEvEpi2ONiE8Ca3izSCYX5nXOntfYVAQs0dUlHeep
         AHgMLiiv1YS2nydhz0OpPNxBYs0FUuufLfz9TJiFK14c4pF0mk/4OaOlwJmyZ1wBgWrm
         4s28mF94Ro4yJqlD+plJPHUTkF5U+qrZLMAONlGHdAvw2Ddk9qXnnk+ENoMtOCzV0i7+
         ELrq3raMop0giPPHE8SiksZdx1dM8YJJq/PIt0G5ut3yT3CsimD55OtB9XW/ZDjd9A/v
         Iry2tQMO1P/lpKzrBFp1S7RjWRFY4BWeAeVCtko3ar043OqTo45N4/TIAV+BJANlxsFY
         ZB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793196090; x=1793800890;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SyqHXLptMiWk+aCTehkHAqNtA/ZhM3lq7X8/7qWdG8M=;
        b=y/3kN68LOY55H6mdqYo4a+8DuPHhv8F7hPQdG483IR3eEYuju9nbNgg8OSaVevmiGz
         HYV9XI4k1y7jKcatTVF9S2oTfKt7pcvn4oOiMMJeljC2mtmJqAxrqwWhLFmRPYHHMzD6
         55gnZM4mC0RjPN9x37fCsqVt7OBOB/14/WD2ZNudBZyXGJP8tcjhb5ycsFnKmJ9yEbAF
         fATsRSBu76bPPofgftYKQ6ztEc2NXhLhP5dgwENEwcIu5gPOX8TL09dTisQbALDXMAXc
         ILUdsb1yxzDn+haNeOSU3au6z3M2NXCnzmGMou2Vtrb9Kzs8oIae7LZl+6FyqSy65Z47
         7Paw==
X-Forwarded-Encrypted: i=1; AKwUvByODX4zFfVvoy6iXaO9sztdAQZ6l0+kEFPFCzdi3//4Zpwqjugm6XVHbyI/rkG4UsC7fhzL@lists.linux.dev
X-Gm-Message-State: AFq9FYJmQ+CBkCXSZWG9H39ofnlkJj69IolmtaGS9M/aH9QQFYqLgcD6
	AdR99oRAoLd8FYkz4PgCDYj3TBaXnMnTX7FMOp4C/hxXWBpt8QrGjn14
X-Gm-Gg: AYBFou2tcFLxuNOsS4M2sW5pqW5D3xz6uvjVmnKDy/OPiRVCssGcPBVLU/mLvNOMbun
	lKo46657t/VQ/UAvRDesOwfvTRF1JIeq799kfTYgzjV7xRwZj8l7nEdnI4uiw0Y9pyPt7F+FvvC
	cyzn4ETSq9FzWlHWAZjvGya8IZZIegONikAnX9uQ6jf9NPO+ecXjljhQKBqI2n1Q2E4ayKO4szM
	SrhjpN/Rbtejzg1CkkySABAoAMUHMDJOHVCmCBEc+N1iLbhDja+AqMK8N9molzjEsV8d5Vsd8t4
	oOnzuAu84HdO1IBB8Et9z1GiCSSVnfuHZyhKLtFTRRj/o5wS4YrAv7C+8Qz0R0ULizSgtLn8Tdl
	1lH/CZ/6ERBLdO1rVvYb0tGV6kJWyNt8EZUp/MuUN4lCCLREZDg2I9Va7lHSRsRE3hIFR6KM1KF
	ar9S9VyCXgrP36NljGa5jtbJzBVx8mSOqaJ4c9Fi3HvEYdW9JULSpzHwXdDD9t2b5GZkOfTaX/7
	JKIYzq3I0DBBsyDfaf1iqEBzVlkVrg54BDeKvt3QTZXctIH91c/6u2pfvtOQHIIBL6ktafb4imb
	vL28db4Hq42oEumNqKj7F5c01n50P2jNGLLnIKuFBRsRnzJJnh7n2cBHqzHnxvJICg==
X-Received: by 2002:a05:600c:630e:b0:4a6:7d6:821f with SMTP id 5b1f17b1804b1-4a9678bff9cmr50385655e9.29.1793196089864;
        Wed, 28 Oct 2026 07:01:29 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4d8dsm30164106f8f.36.2026.10.28.07.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:01:28 -0700 (PDT)
Date: Wed, 28 Oct 2026 14:01:27 +0000
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
Message-ID: <20261028140127.7bfeab46@pumpkin>
In-Reply-To: <CAG2KctpMEuK5OJSedSFshNMSwOqe1g87m2ZOKBhn=Z5iCA45Aw@mail.gmail.com>
References: <20261023001603.560210-8-wusamuel@google.com>
	<20261023001603.560210-12-wusamuel@google.com>
	<at8dNNb4vwovNZcZ@krava>
	<CAG2KctpMEuK5OJSedSFshNMSwOqe1g87m2ZOKBhn=Z5iCA45Aw@mail.gmail.com>
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

On Tue, 27 Oct 2026 15:07:44 -0700
Samuel Wu <wusamuel@google.com> wrote:

> On Mon, Oct 26, 2026 at 2:28=E2=80=AFAM Jiri Olsa <olsajiri@gmail.com> wr=
ote:
> >
> > On Thu, Oct 22, 2026 at 05:16:05PM -0700, Samuel Wu wrote:
> >
> > SNIP
> > =20
> > > +static int bpf_object__query_ksyms(struct bpf_object *obj)
> > > +{
> > > +     struct kallsyms_query q;
> > > +     struct extern_desc *ext;
> > > +     int err =3D 0;
> > > +     int fd;
> > > +     int i;
> > > +
> > > +     fd =3D open("/proc/kallsyms", O_RDONLY | O_CLOEXEC);
> > > +     if (fd < 0)
> > > +             return -errno;
> > > +
> > > +     for (i =3D 0; i < obj->nr_extern; i++) {
> > > +             ext =3D &obj->externs[i];
> > > +             if (ext->type !=3D EXT_KSYM || ext->ksym.type_id)
> > > +                     continue;
> > > +
> > > +             q =3D (struct kallsyms_query){
> > > +                     .size =3D sizeof(q),
> > > +                     .query_flags =3D KALLSYMS_QUERY_BY_SYMBOL,
> > > +                     .sym_name_addr =3D ptr_to_u64(ext->name),
> > > +             };
> > > +
> > > +                     err =3D -errno;
> > > +                     if (err =3D=3D -ENOENT) {
> > > +                             err =3D 0;
> > > +                             continue;
> > > +                     }
> > > +                     if (err =3D=3D -EADDRNOTAVAIL)
> > > +                             pr_warn("extern (ksym) '%s': resolution=
 is ambiguous\n",
> > > +                                     ext->name);
> > > +                     break;
> > > +             }
> > > +             ext->is_set =3D true;
> > > +             ext->ksym.addr =3D q.sym_addr;
> > > +             pr_debug("extern (ksym) '%s': resolved in kernel to 0x%=
llx\n",
> > > +                      ext->name, ext->ksym.addr);
> > > +     }
> > > +     close(fd);
> > > +     return err;
> > > +}
> > > +
> > > +static int bpf_object__resolve_typeless_ksyms(struct bpf_object *obj)
> > >  {
> > > +     int err;
> > > +
> > > +     err =3D bpf_object__query_ksyms(obj); =20
> >
> > hi,
> > we could also add similar support for libbpf_available_kallsyms_parse a=
nd
> > probably in some other places like bpf_get_ksyms.. which makes me think=
 it
> > could be useful to have KALLSYMS_QUERY support for multiple symbols
> >
> > thanks,
> > jirka
> > =20
>=20
> Thanks for lookiing over this Jiri!
>=20
> Using KALLSYMS_QUERY for libbpf_available_kallsyms_parse() would
> theoretically by O(m*log(n)) instead of O(n*log(m)), where m is the
> number of tracefs symbols, and n is lines in kallsyms, with n >> m.
> But AFAICT, libbpf_available_kallsyms_parse() would only be called in
> pre-6.5 kernels, for kernels without commit 83f74441 (ftrace: Show all
> functions with addresses in available_filter_functions_addrs); so this
> ioctl could never be called.

Isn't that code also O(n*log(m)) ?
I've got a patch (I might send it after the merge window) that changes
one of the ftrace functions to look up every symbol by name, not just
when only asked to look up one.
It can also use the 'callback' function to detect duplicates.
That should be massively faster - especially with my ~18 fold improvement
(also waiting for the merge window to end before posting a new
(not much changed) version).

Does look the the code could do with getting the 'symbol name table index'
for the symbol so that it can read the entries sequentially from that
point onwards.

David

>=20
> And regarding bpf_get_ksyms(), it loads all traceable functions and
> needs the full syms table, so a /proc/kallsyms should fits better.
>=20
> I did profile a slightly different form of querying multiple symbols
> at once [1], but didn't see much benefit. struct kallsyms_query is
> extensible via size and query_flags, so we can update in the future as
> needed.
>=20
> [1]: https://lore.kernel.org/all/CAG2KctozPSev+EXSpHitM3JWfjufQaEjsPJHS_1=
HJ1wSm7sJ1w@mail.gmail.com/
>=20
> [...]
>=20

