Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793374533;
	b=UTJlsrxXNcwB+ll5hubqSo3HoBi0InZ0x+WvNjEzGNMKJE/qlbf0L2KESHJeZh8QY+y+
	 7U+MwL7nTFmg1ktvyekT5+FAtsofMEG8gFPeYnGhcETgg5L5Ij4fAQlWQKgFYZxbl6FTG
	 0tdP9MRNXmJPMoKdJf4K6L0ipqAWlpoXYFEs90iSjargOmeuqlz0ZBJ5jS1UHfZW/N59p
	 mkBMtaP7oQZiMD1Bpt+OoMR+OCt6dfBVgU94A9M7N3kaQagURXYsNVJBL1fIe2ZfTXPkm
	 3Dpw4OT3E0hcZJuqcEYTGXCPfD0Y9O9gWmfnM7sGSWcMDWdN2qIp1PfvVa31gUAooDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793374533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RFd8QlUF/2f8EIujxTa2mmugUe04z4PT62Q1oHJNdgA=;
	b=RJUjIEVl30yw19OghTbcM1Sa9gOKMoGdxfDV4k9ukGEIMQpOdnoGroc9iagm4BitaTuj
	 VLtfzG+5B9zYBFG1n5uAXoDRYXIVQMFcZzWGPTFk0ivubQDktqvXF8jHB/vD0D3CyDwDT
	 6NCKEVi/toOTK2ZqVif2u8hH199MmduDPxtRQwHJQ+WBVMit/U2+d1NKTiltnT6kQSS6O
	 k/aRja+G6qKTNx2VirqxH3SiZ5rwArWR+Z6+DkcqB+rbbUZmbDpUPPMLxjqg/Gt+Z3fe9
	 iNX7tu9IB5rTJP+XUvXeIU+vqyGyebPFfWmPa4Ri/ZHaCxjUkvkEZA9k/7ha14LICAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M6gPWNzo;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3842606A31F
	for <llvm@lists.linux.dev>; Fri, 30 Oct 2026 15:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3842606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M6gPWNzo
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a215e64962so8301675e9.1
        for <llvm@lists.linux.dev>; Fri, 30 Oct 2026 08:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793374531; x=1793979331; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RFd8QlUF/2f8EIujxTa2mmugUe04z4PT62Q1oHJNdgA=;
        b=M6gPWNzoiCN5Wu5UbB31zKN8xEs3sq7e0FzuiABpLVEsUa1RwxVlnWACY+6o68RD5V
         upjhffek8yrLK6MuW/vG4LCW1qqXMc8pdAXXRt0ginnxERTrYiD18Er3fmGFuEpoI+GK
         16DbSPP0dHqsXune82r3qqAPM/0oVovQp0O/W2hPsYIBRFdKGIgG0+H02pgiNCKBw4kA
         b5BR1PzjVoAFVmw+Ike+RpVOMKsIHrmwQPida6YMsevoyxQ8fczlFVGfObWALde+TdKY
         Knno9THfXdePXUYqiczzjMpcQ288kuqtv4iVFrsg7LJULe+IaoGmwtCnlwXo19x8flVV
         7Low==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793374531; x=1793979331;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RFd8QlUF/2f8EIujxTa2mmugUe04z4PT62Q1oHJNdgA=;
        b=yXzNcKhl2wBpA75LA0kPsm7vIkGJjbWwBQYeJtY6Qt1c8CwftKOpuI/x0HDAWW1Mi2
         RL4dJ67uS1gjCLA9TcJry/4Bqww4DcOEvWkDv5HvwZIq9rA6Fe1qVzSGtnhAqog9/nDF
         NINiEDGycUywv339NHeuaBWYz/MMjLDexL/HgT/x+uOxC2dYGAOmoVVORpDcIE5BtuaT
         hag3Yk3hqeh/AodsVkNkxf5W1DATjfax9WuGKaZqMMwyzElh3AZ519px9I9PGKSJyVeh
         bIckG6cfr1SSul7/ofIYbcNNan0Q/bm9Ee+hHhvL2Gc/iQ6+93FKz+PGgnoDiRkSwyXQ
         SYVw==
X-Forwarded-Encrypted: i=1; AKwUvBxh87QJL1eIjGrPZykGGou5hd/HN9mGBAxrqdm3eUbOM5g6O2dIdW4qOOhlLYeGxwmCf7SY@lists.linux.dev
X-Gm-Message-State: AFq9FYI0LNkHTnye69GHoD+oejybn7HqinR0pRo9WarXgHAinhQ3v4GT
	GwGkE+DIOrw59Wj+HGh4Twba8nkuyu/Km4ifTBHQewJeoCCCNUc0E85U
X-Gm-Gg: AYBFou33+VoT16vNT0jYYJ/5urpr2F7ZRPYKjRUKDe29mK8kKOv0eLjvGG8yCLLzxg0
	PGrm8e11u9v0KVDEdi17ivbzM4clRkkRexRZmei5auHO3ltkwQlVgYICY1hBce+NFTMi1qargX7
	wPQVtinqXx1IYXZH5aBvakZxSA/aZATgd/x6wj8Fk2NKKNK8oDzJnKidRneQ/3bGeXY+JB42G7E
	2b4XBpSnbkDjdvqFeBmBoNdX8n4MBUZjxQZNhQF/DE7h7X1zokBx3RCYEP2ssCkwLSbANVymv9S
	JWLwxDAuOtk4Ead2WFdAgypeqsZqQgYxo7L1z9JpUatawvLBOS7L0jYkuolw6egx2tv1SFw7wsi
	FavMMjUMP8OI7l7DkPKVRkAUeD+Ph9LNRJPEmVCZZVTota+NkQU3Kjen83d5L6/rk+1ZuHkTh/C
	7OIUaBtcdw3HHsxi0EP30eb2FSsaPg/l2I3FV+G6v/XClDUVjoIrBsIuFe7n+iqKeBR9A+VEaPZ
	xcrnEUziVZPc8Ss5X+3n0Lzn+Gp6U+af5X3KI52XzaX/YuE71eqQEEpTC+nJm/NwNjKyTU2An6G
	MNhKqJOVV2pOV19Ilskvm+3GoljrUUfQKZVnSDQJupO9R8eHnu+Yff3eYx9SL+3JKw==
X-Received: by 2002:a05:600c:8b85:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4ac14fbdcf7mr54356935e9.4.1793374531121;
        Fri, 30 Oct 2026 08:35:31 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6c76507sm70755145e9.10.2026.10.30.08.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:35:29 -0700 (PDT)
Date: Fri, 30 Oct 2026 15:35:28 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Samuel Wu <wusamuel@google.com>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
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
Message-ID: <20261030153528.0d5113e7@pumpkin>
In-Reply-To: <CAEf4BzbyqPC=RQGWEdpkqu1WDQ2_S0H8pZU2i=_gLuSDQtpFbg@mail.gmail.com>
References: <20261023001603.560210-8-wusamuel@google.com>
	<20261023001603.560210-9-wusamuel@google.com>
	<CAEf4Bzb--Jzz696u057G9_CgQN7zf6ksvoL80KJacKO2CorsnQ@mail.gmail.com>
	<CAG2Kctojb7xiOqTmwWqoAKFaNUECjOzXVc_t6KbG13Pqm2dbng@mail.gmail.com>
	<CAEf4Bzbs8F1DPBz=WXVTExrrNjzvaFsi4L+HEj+zbUTpPSTX5g@mail.gmail.com>
	<CAG2KctpSTCyWQHgJ8GyFEhHPdFawUa6zy0g7rkfCcujJRN6f6w@mail.gmail.com>
	<CAEf4BzbyqPC=RQGWEdpkqu1WDQ2_S0H8pZU2i=_gLuSDQtpFbg@mail.gmail.com>
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

On Thu, 29 Oct 2026 15:54:01 -0700
Andrii Nakryiko <andrii.nakryiko@gmail.com> wrote:

> On Thu, Oct 29, 2026 at 3:36=E2=80=AFPM Samuel Wu <wusamuel@google.com> w=
rote:
...
> > > > Makes sense, but I'm thinking v3 doesn't need pagination or batchin=
g.
> > > > I didn't see any performance wins when profiling libbpf, and it can=
 be
> > > > added later without breaking UAPI.
> > > > =20
> > > > > on input I'd also add module name as optional input argument, with
> > > > > "vmlinux" limiting to just vmlinux, set module name to just that =
name,
> > > > > and NULL/zero meaning "we don't care" =20
> > > >
> > > > Makes sense, so here is a possible plan for QUERY_BY_NAME:
> > > > - Optional module filter: NULL =3D any, "vmlinux", or a module name
> > > > - Returns the first match by default (vmlinux first, then modules).=
 An
> > > > ALL_MATCHES flag searches everything and reports the number of matc=
hes =20
> > >
> > > searches everything as in all modules, or you mean just full linear s=
can? =20
> >
> > I envision ALL_MATCHES to do some form of lower_bound() +
> > upper_bound() on vmlinux since it's sorted, and then linear scan of
> > all modules. Of course, just one of the two or both aforementioned
> > things depending on the module filter (any, vmlinux, module). =20
>=20
> no point in upper_bound() if it's sorted, you just start at
> lower_bound and go linearly from there. I don't think it's realistic
> to assume large number of duplicates, so I wouldn't optize for that,
> one log(N) lower bound + linear scan will be faster in most cases,
> probably

Doing a system call for each symbol is probably fine and scales nicely.
Just return the symbol number (in the by-address list or by-name list)
so that the application can request the next one.
While the application probably isn't interested in symbols with a
lot of duplicates, some symbols get duplicated thousands of times.
So you have to allow for them.

(My kallsyms patches get scripts/kallsyms to mark when a symbol is a duplic=
ate
of the previous one, but after a short linear scan for the first it falls
back on the binary search otherwise looking up some symbols takes a long ti=
me.)

...
> > > > =20
> > > > > tl;dr, this is the right direction, but I think we should polish =
API a
> > > > > bit more to be more universally useful and extensible =20
> > > > > > +
> > > > > > +#define KALLSYMS_QUERY_SIZE_VER0       40 /* sizeof first publ=
ished struct */
> > > > > > + =20
> > >
> > > [...]
> > > =20
> > > > >
> > > > > PROCMAP_QUERY uses offsetofend() for the last defined field, any
> > > > > reason to have this #define and BUILD_BUG_ON here? =20
> > > >
> > > > David pointed out that the size field in struct kallsyms_query is
> > > > redundant. In v3, I can drop the size field and use _IOC_SIZE(cmd),
> > > > keep the *_SIZE_VER0 define (since we need minimum size). Perfectly
> > > > fine to switch to the PROCMAP_QUERY style though if preferred. =20
> > >
> > > I'm not sure how size is redundant, I don't see ioctl subsystem
> > > accepting argument size as a separate parameter, so the size has to
> > > come from the user and be embedded in user-provided structure, if we
> > > want any sort of backward/forward compatibility. At least looking at
> > > PROCMAP_QUERY I don't see how we could have avoided it, so not sure
> > > how we can do that here. =20
> >
> > My understanding is that the size is encoded in the ioctl command
> > itself: _IOWR() puts sizeof(struct) into the command number when
> > userspace is compiled, so _IOC_SIZE(cmd) is the struct size of the
> > header the caller was built against.

Yep, I think that was added by the BSD kernels (but not SYSV) when they
changed from 16bit to 32bit.
Linux mostly uses it, but not always.
If it were used consistently (or the high two direction bits are guaranteed
unset) then the ioctl syscall wrapper can do the user copies.

You'll find that _IOC_SIZE() is used in many places.
Amongst other things it can select between 64bit and 32bit compat structure=
s.

> oh, interesting, I didn't realize we embed struct size into ioctl cmd
> and match it exactly. I see that pm_scan_arg has the same __u64 size
> in the struct approach, I'd stick to that, and when we extend any of
> them we'd need to make sure to either ignore or hard-code the size
> part, hm..
>=20
> > That said, either way is fine. We could mirror PROCMAP_QUERY style for
> > consistency.

There is nothing to be consistent with.
These are the first ioctls for /proc/kallsyms.

I'd also point out the _IOC_SIZE() is limited to 14 bits.
There is much less scope for applications causing grief with very out
of range values - indeed you don't get past the switch statement.

David

> > =20
> > > >
> > > > Thanks Andrii for all the thoughtful feedback!
> > > > =20
> > > > > > +               return -EINVAL;
> > > > > > +
> > > > > > +       err =3D copy_struct_from_user(&karg, sizeof(karg), uarg=
, usize);
> > > > > > +       if (err)
> > > > > > +               return err;
> > > > > > + =20
> > > > >
> > > > > [...] =20
>=20

