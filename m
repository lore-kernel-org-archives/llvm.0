Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793355209;
	b=GRZdnNGRpf+A3ub9tDlalyDe4LFUB1FN8xvfaQsU84pEjgJHYBod3UtiYxcUbir6pAKX
	 qIizK2v6HRL78TLhDPagXpfk3ggibt2tRsz0d2w4+ZgcRJK8FQTJaHC7MXtCACMwTSvx7
	 m8cgBHLIaXAlCLz3x1IlEklubupd1SkA0FrpWPTiTE0ZrIkgPVPqbi6+j4ZTRK/IXFIR9
	 4wv7fUHUtvr7bifh8NtBs/VgCB/9x3zNMQ+4YoqDPSj+gLtCE7Q1pa5j43kLGz2gweOR8
	 rynjuD9eit/Ffukru3mASzqrwPeIh4xLp87NsDkrOZK/t6weS+kBNj8JhF72Q/qLMWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793355209;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=O0rp/2ctYtAz5V4l4tmKFoGrP6ExbbPlGpEkX5p3g2U=;
	b=Az9fR9OV8IRmJddkoQiMqbKaDhX9opwUZZjlOftiZXDplUibYyTnOEEpWTEeCOCa4Sef
	 2FOQB7In8duJAYXaSPXcwYQSQ/l/LIAQHQPXToGLvWhKUi8QvdJs690DV9kgGB0nvjcn8
	 zL5wT2cd3k1QSBXOipEBpfb18Mf8jDo5fTqTnm+oX+ObxPKR+MGEW12u0ffgFm1NgF77d
	 KBy7Va8GEHnHu9gdRgp050E50Stu4KjOTuvQyWdvucqK8hrzH8zhR0n4AX7XL74OhFJo1
	 gYy/4/JJLguSsBSshcGKG14pfqpAkkPSKLDXj7dbMg7taPkADs0CIw7qYNPX2+f53XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="uuh7B6/J";
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7CA606A320
	for <llvm@lists.linux.dev>; Fri, 30 Oct 2026 10:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D7CA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uuh7B6/J
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso342928f8f.3
        for <llvm@lists.linux.dev>; Fri, 30 Oct 2026 03:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793355208; x=1793960008; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O0rp/2ctYtAz5V4l4tmKFoGrP6ExbbPlGpEkX5p3g2U=;
        b=uuh7B6/JpRE8aayEbDyT05eiJjIoqQoTKKLPYfSfQw0OkJvOq1anhAnmtblPgl7rJ+
         IQYCKZzKXdDvhdU+Zz1SmxhX+qaJupExL2Rarh1/uFg+ysgxHatpCFXaqJ+zwLKd6apN
         4sq4aQgdXYZmE2zQxnhwLzT3fihPXgBR3bm1Oo791x/4AkJ+fwZq/g91wQdFE1eyqkZj
         eYXXqLhsRoy3t47eJo0Z+MLuMkERM7yf8F9Dk6G8HfuH7sf2y6/ET2XjBHODViUhuqdR
         SiDwxqCTYFlPUtfKcAWkWS3z3U26u8zZZ737n47Kf6JZwvRFebcsQhGYqOVrbRPIiBqs
         E9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793355208; x=1793960008;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O0rp/2ctYtAz5V4l4tmKFoGrP6ExbbPlGpEkX5p3g2U=;
        b=cYL6CGn5MvYhGIhuWKds9Juecsi2ZXBbKjdLtVrfZ1/Tl7lJCSTeG318B43a2NHPjB
         71pcoQemvAkUALpfBb+zzTwlBqfH0cZAadSkIsGSZI1xkKIRYp3yKK6gqXWUFFKmIQft
         fDBBCcTmOf1VM7/UEjtw3CLGHSRRRI96/TkNSSbEOFv0UlXmg0PasQHM8+XiFcqpfzh+
         VJQHuTzeKN6JKHfu6M5kGubVLkWZX3YwJ7bJNrnDTPSdQdCbOAIOJkp+XL5PB9Hz8lZ7
         aS4ctJYBxmRFK4MIta5jk/7IY9Qp1D1cuCb1hZtbFRmbsrx0YPTAcgGlHa49mDjh7k2M
         /rRQ==
X-Forwarded-Encrypted: i=1; AKwUvByGTWdZk/HO09EAg5GKtkVvrlE4EiTczNFgq/6w4eirm+dtCGP4NtsZeJXYkXOR9mpymsN+@lists.linux.dev
X-Gm-Message-State: AFq9FYKKkvMDUvuzrJQy3lD6jdIg3t7EuEeh62VKxF0wrp4scXrsULcV
	fg7EMXMHXEBnYcPl+jPJFamZaUNqeAmvs9LO9qb+pccfO5jcXwkkdLoi
X-Gm-Gg: AYBFou1wXmYT9yb5zWuvV2T+p1F9zfTtai4zoiy3s1KMBwFQATK+q+Wg2EvzDSsTuF9
	pZEiHjzZiKKeu1TvCzFe+L43/a5kWJzRs+SiSIOC/q2BtuSzYaB7E0L2DdbouoqXF6xUw4wCNFC
	Dqh1Hw68k3GQGppoMu9K32XamJhV/ALbeEPo9If/P+IW8epTb7USZTY3yJhFmR5I92kxChHmfhI
	ymINtwXVbSeHfCJI1/8tiH0Q1qdERh0zzVvoED6+d+MUO/qjoYNMgq20QFIpQwhmBX4U4lA5Md4
	S5vvlTEFIaaFsPUOx1uY2IFlMfMWzpLxkY3KHqZFtZDisvF3r0PUc6YfD5S24f1nDzLgoxMpxYk
	0nGrQJNTg4beEKqzMFgJuVm9yXYVpZIhTZgr14yyg8OL452GR0URuKKgzmVsOpAtsGfOk+ApDhP
	fdaZO7cpQOiGwHBH10JjAQGLcVhty/wkcsm400i13X66+4vyEHR76bOIxIChihZ9AxE219CmXrQ
	QEyvMIHd2/3hX7mffUbN2RjpBgUkVNYNtyw0pmaeqIP1AaX/B6aniMGZSPe4aOB/T+NGsitgXrG
	OkC5pjeebZpswAxQVw5gZ6H8UlO4HCTjED4Hbrs9pe1zFhyc8S0aVZykqmoZxBRegrrnrNxHoTH
	09dN9+soo4ME=
X-Received: by 2002:a05:600c:8b06:b0:4a2:d:5ccc with SMTP id 5b1f17b1804b1-4ac17b2bc63mr39008955e9.10.1793355207707;
        Fri, 30 Oct 2026 03:13:27 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm133317305e9.9.2026.10.30.03.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:13:27 -0700 (PDT)
Date: Fri, 30 Oct 2026 10:13:25 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Samuel Wu <wusamuel@google.com>
Cc: Andrii Nakryiko <andrii.nakryiko@gmail.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii
 Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Ihor
 Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi
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
Message-ID: <20261030101325.6406e8ce@pumpkin>
In-Reply-To: <CAG2KctrwzWGFRs6CZcSRaFOWx49WbH9LQVQJunWsPD3MOXn_iw@mail.gmail.com>
References: <20261023001603.560210-8-wusamuel@google.com>
	<20261023001603.560210-9-wusamuel@google.com>
	<20261028134012.01d52e94@pumpkin>
	<CAG2KctpGPHo-S3AEvBhK5HPUnDHfoJu6Z-r+cS1hQ4Ps=B3DmQ@mail.gmail.com>
	<CAEf4BzYT4rvKwbOJ6UQ3zcp4wdsSBqRsMz-2=U1DA2RyUA3XSg@mail.gmail.com>
	<CAG2KctrwzWGFRs6CZcSRaFOWx49WbH9LQVQJunWsPD3MOXn_iw@mail.gmail.com>
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

On Thu, 29 Oct 2026 17:28:01 -0700
Samuel Wu <wusamuel@google.com> wrote:

> On Thu, Oct 29, 2026 at 3:16=E2=80=AFPM Andrii Nakryiko
> <andrii.nakryiko@gmail.com> wrote:
> >
> > On Thu, Oct 29, 2026 at 3:06=E2=80=AFPM Samuel Wu <wusamuel@google.com>=
 wrote: =20
> > >
> > > BY_NAME matches names exactly, like kallsyms_lookup_name(), so they
> > > would be different symbols at different addresses. Please correct me
> > > if I'm missing something here!
> > > =20
> >
> > foo and foo.constprop0 are different functions with different
> > arguments, so I think we should distinguish them. The only special
> > case is .llvm.<hash> because that suffix is added by compiler for LTO
> > and I don't think the function itself is any different from the
> > original =20
>=20
> [...]
>=20
> > I do think it would be good to spend a bit of thought on how to
> > support at least one-by-one pagination from the get go. The same
> > mechanism can then be used by batch version. I.e., think what can we
> > use to provide data back to user which they can use to continue search
> > after the symbol we just returned (at least for fixed set of symbols
> > in vmlinux and modules; we also have dynamic symbols added for [bpf]
> > "module", etc, we should support those as much as possible with the
> > least possible deviation, IMO) =20
>=20
> Let me sit on this a bit and figure out how to distill all of this
> into a clean interface. I'll keep the .llvm.<hash>, pagination, and
> batching in mind for the design.
>=20
> [...]
>=20
> > user code can be easily written by always setting buffer size, even if
> > kallsyms_query is reused. This is the pattern with PROCMAP_QUERY,
> > let's keep it consistent. =20
>=20
> Ack, will have size in the struct for v3.

It just adds code.
If you use the size from the ioctl (which will match the structure
the application passes) then you don't need to do the extra get_user()
just to get the length.
It isn't really hard to have:
	case KALLSYMS_QUERY_v1:
	case KALLSYMS_QUERY:
		return do_kallsys_query(m->private, cmd, (void __user *)arg)
It also saves all the problems of the two values mismatching.

That is why there is a length (and the r/w flags) embedded in the ioctl
cmd value.

David

>=20
> > also, returning actual size even if buffer is too short is a good way
> > for user space to "probe" and increase buffer if necessary. unless it
> > adds tons of complexity, this is a good and flexible UAPI =20
>=20
> Ack.

