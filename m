Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793917931;
	b=VushVraI8DN9LQwkR5zFYB5XDbCAMSEe/LX/n7XbNJDdltQa+uM/hdImpO7XMNqOnmqs
	 HCyd58C5qHBDv6EjMfyY8l6Z3yk7m8PWtd/YAgIgzerS0QIWWF/wC8Qu4c5DdQGLjCKtn
	 /sMj62YyPpOPpJ53vwlOOYf372tFp+CRy+NGt3s8iDnYC9G1zHRw0KyM7nnnUQwaOuej3
	 4k4Fh4hgEWpUULft6n0ZI53HFii69hbomathsa/X6tTupG0s6ELfpPcLOIbcd8CR63p8a
	 SweTtx/pJA+sG88RoLNoLNXC2ASVXxJgrNFb/TOxi6DSG5Ijs6oMpolr7P2YUp5q7ig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917931;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dVk8FlSCk0p0X/zLsBRSgcQPtRAQ4rsApX2OtPYv6mA=;
	b=AcVt6Zz2zZDKLmqzO3dsPYMwyIcH27HdfBrcP+PqEmbA8q3W5+7xTRYwt6yiPUSO3/VU
	 426Rhha5TalRkkZKLB66/Ik96xCiI6v508te1xnSWKPxKr106P/ALPyaIofALx9kWK8jV
	 XvwDTQ34dF6YxeAB8rU8U98VQeXIxAH2sJ8b4ft614XUks9D0pQxNEIpgL3+Am4wQ17ys
	 GMJXh8nxZxYLG4uhX1/0SY4uvNpRe6uhvXuKFAwxI1MNHGrEdZCE6zjlXShfZVS5w52dh
	 m3cgc2hoOe4G61ejKyof8nNmhrzUWzyHxbEdXJuJ/hgYKQ6l0g0EJ6faQhBMrqs4S1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RWETU0yl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4747C606A329
	for <llvm@lists.linux.dev>; Thu,  5 Nov 2026 22:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4747C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RWETU0yl
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ed1b9e8f43so44845ad.1
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 14:32:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793917930; cv=none;
        d=google.com; s=arc-20260327;
        b=anJl/WcKnEZmOdw2zfAYMmrpvOWhIIfd06cQfXiWkQ5vmZdP2Z93gASy0ikvQuq7qW
         fscTxGSBZUKEhl4MACKikXg4H7lvJx7BAO/B1fGxsji7cTjiinlLZ00WUDyIN9rd1rnv
         S0vwEHhM0G5ieSFeMrv14hBuUWaKhslpbA1RcTgCC+6r826DSYuw9UHM/OCMgJagzRx5
         ykN0yto23sseVd+hRVKoW/HmxF4MYAHKzPtnu0wcuK/DJdIvqF/n2pmVVqdN4avwrKgr
         6huw0srjr2mNDb0TeLpT/+7eyKcLtos8ehCIRtsEY77hgEg2jzD+2Hv3EcxYylB554vE
         wneA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dVk8FlSCk0p0X/zLsBRSgcQPtRAQ4rsApX2OtPYv6mA=;
        fh=tezYF2K0GN5VOQh/3XcUco3VVwSHe1EZNjhNtfnNcmM=;
        b=s3zTlYz/Mclv2GDjKbsJQfGx/Vub9tRMr0NJnnn353Vc8drH2nGqZcsKstq3jCafkA
         q+ghJ5i17bj6+qhIzJ92N5/Zb4Rh66rpkEkJJANrXi4cvJm/fRA1fTIMkoYuzhOKDvt8
         C0sHDkHePdxvTWUz6IohA/bPcRpTpelnwfYpKf/cDf/vBPPjNWw8wFpuKtCkykfcwkVP
         s3pMz4Ul2/tVCAO2EQZ97pl7JhwizI1pJCxI8thoIaXTnKAmN+cIUYC5sX5ef/E+O4/X
         kIRvgE05klIzORJFUhCGjtN9kXT0tC8BFxTOIYlZdoCVbdETKngTKodhBjNm5a6iQ/7L
         9DhA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793917930; x=1794522730; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dVk8FlSCk0p0X/zLsBRSgcQPtRAQ4rsApX2OtPYv6mA=;
        b=RWETU0ylNc2KJeooLtaWzPcL2MtCOp5uyOl7B4gwYUaPlkURFmb7aoxt61yQzzvH8U
         uoYsYCiJtAI7pzJYIVlWFoQzASuUfVgmLs+vbfd8XJ888K2lfNvN3+THCvHMQGhPqiyN
         05Yf5GXbvveaLMYbVrV9UMxKrsLbtA8v0gtEVE4Mhe1I/vh0SOrii83q4u66lljAClwa
         Fv0RCjeDS30K+ZybCH4y2Gx8Q69x9tGlvtjAqqtDZzJLL2MJy4xZZhDYQ/AAd5A3DU30
         PZVT+GfgvFawKeO54ccGWy1AXHSpqw9vU5QVnkM7ZsaILnmXZIeTdBqEDOnpC36nABA8
         ydeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917930; x=1794522730;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dVk8FlSCk0p0X/zLsBRSgcQPtRAQ4rsApX2OtPYv6mA=;
        b=Km2otbGY4PwDz4s+XbMGxdoRbPhW9P37fR99knqbmEOVERl5RLy+OWKWViAiqWIplt
         NmQAQOlZZYvYXR2hs4cBZVxbf7Ae1/BvuJfflU9MgtfoKZPP8qe0OcRGicJ2954AmJ9Q
         FFo32p1f2DD1kRZqZ+FM4x/hwmbTygnrQ/F4yoteQcylk4kpMnKqhGYUwzV5hCN142tB
         BMmbaTtk64ttB2p1gZaJw9hlWxa4C8XTLQ/TddkVnLgrWsUlQg217dDwnZji2JVoxYns
         BaTQ2UgLOxtzZWmWswjPg9F48yS5uFzEL5Mo4C99+PUIzTCfhEc8/nBYimvIbSCVQzKs
         TAnA==
X-Forwarded-Encrypted: i=1; AKwUvByDDiRe2cfGSqGJX1Yip8Q0FFVBf2MBuYN4hgAlPvtQH6TmUrBoD0P+zeWcfJzqqT3lW8pm@lists.linux.dev
X-Gm-Message-State: APuU4Z8BdU0XAWFz47AJblPB3KOnn/N+GG1qwBhgo+F7ZbJ8p2mpn71B
	X3wJqICZ/yHuk95VInn6EwPQ2G8SYumvzakBa/3GcAIJafnvk2Z4DXZX9cZ0+nNyYb5067TI6fJ
	iHA7yK/Xt2veLnRB9BGvN6WndpjFDV0o=
X-Gm-Gg: AYBFou2g6sdIVZuW2mnvUMeZk6/vReW2IT+2Se6ekuSekO/tWx/zXliaWmW5KkJPTIQ
	a9Hi7O0TspwE6sGJ9JnpHwugUUtV5kqNOsjupZ3InVMYLA2XZCb8V2eFsjyInBPF5eV0hGPj5CG
	txjyLbxhTbI4qpFP6bu7D+FkEzLLN4idt65/WkkgKj7QgWlFFRMvIVf/5/woTESB/DisWnsyb6g
	zasbGC/Tr+FIFuEnMSZmv5Mt2MTj9U5PJcEv3e/VavcApS5+1dIIbTDJTQVK7bw6CDKPdkw3Hbu
	DT0Vhse6IDVEmFMaHvt9Itzujzd8hkVE9FJDLIo0q6npxBLpyUUeFQUxGHhtNcCufV3KRnIlPpx
	FBdwAtHhCBez4BB1w0494AiKqDuaKiUF1Y8VZKAlkom6jhziMRX5IFghThgswgLGLL6oZnP6gbx
	9QyG8I+/XIrgIv3k/lfVSlPo/90EsyXsdO3w==
X-Received: by 2002:a17:903:2304:b0:2ed:1f0c:d31 with SMTP id
 d9443c01a7336-2ed40e688c7mr9370095ad.59.1793917930400; Thu, 05 Nov 2026
 14:32:10 -0800 (PST)
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
 <20261030100215.6f8e0d4f@pumpkin> <CAG2KctqdPq6NmK6rB13s2bgM7kP2w4OMMy2hdp_OFMVYYhTnZA@mail.gmail.com>
 <20261104142307.431fc12f@pumpkin> <CAG2KctrY6GmVqsKP+fXYCsL6wDR4zp1kdRd7a7uOdCgg_JcMdQ@mail.gmail.com>
In-Reply-To: <CAG2KctrY6GmVqsKP+fXYCsL6wDR4zp1kdRd7a7uOdCgg_JcMdQ@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 5 Nov 2026 14:31:58 -0800
X-Gm-Features: AclHuK8BPGpbYIUoL0zJXTIzG60i-gPbL3KKgBgfTHwRc2VAS0UUrPKJVoGciTA
Message-ID: <CAEf4BzbYqbPRPWQU9yM29E+Pr68y+KX0O8whK-36dyH=Zd_udg@mail.gmail.com>
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

On Wed, Nov 4, 2026 at 4:06=E2=80=AFPM Samuel Wu <wusamuel@google.com> wrot=
e:
>
> On Wed, Nov 4, 2026 at 6:23=E2=80=AFAM David Laight
> <david.laight.linux@gmail.com> wrote:
> >
> > On Tue, 3 Nov 2026 17:14:26 -0800
> > Samuel Wu <wusamuel@google.com> wrote:
> >
> > > On Fri, Oct 30, 2026 at 3:02=E2=80=AFAM David Laight
> > > <david.laight.linux@gmail.com> wrote:
> > > >
> > > > On Thu, 29 Oct 2026 15:05:45 -0700
> > > > Samuel Wu <wusamuel@google.com> wrote:
> > > [...]
> > > > > BY_NAME matches names exactly, like kallsyms_lookup_name(), so th=
ey
> > > > > would be different symbols at different addresses. Please correct=
 me
> > > > > if I'm missing something here!
> > > >
> > > > Only that the user might really want one of the copies.
> > > > Sometimes there is only the copy.
> > >
> > > Good point. I'll have v3 add KALLSYMS_F_PREFIX + pos/next_pos
> > > pagination to cover these. A prefix query for "foo." also finds the
> > > copies when plain foo does not exist (expanded on this in my reply to
> > > Andrii's Oct 30 mail in this thread).
> >
> > I'm busy rebasing my patches - they got stamped all over :-(
> > I should get a v3 that applies by the end of the week.
> >
> > I will add a 'prefix' variant for you.
> > The 'next symbol matches' flag is exactly that (actually it is a
> > this symbol is a duplicate to avoid issues at the start of the array).
> > So in this case that application would always need to read
> > the next symbol (by name).
>
> Thanks, that would be helpful. For my v3, I'll keep the lower_bound()
> approach so the two series stay independent, but I can switch over
> once your series lands, so there is only one search over the name
> table.
>
> > I think it might be more sensible (less pitfalls later on) to return
> > the symbol number - not that of the next one.
>
> What pitfalls were you anticipating? If the current symbol's position
> is returned, userspace needs another ioctl() call and an -ENOENT
> check, to learn that there are no more matches. Alternatively,
> returning the next position means every call pays for a look-ahead,
> which for an unfiltered query walks the module symbols even when
> userspace only wants the first match.
>
> Andrii, do you have a preference between the two?

no perfect solution, but given you don't always care about duplicates,
I'd probably return the found symbol's position, which can be used for
further pagination (if necessary, user just does +1). so, let's return
current symbol index, and have way to say "find by name/prefix 'blah'
starting from position X", where X will be previous symbol index + 1?

but tbh, you have to write some code on how to do these "typical"
queries and see whether API is convenient and meaningful, hard to know
upfront what makes the most sense
