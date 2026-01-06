Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D40C13B
	for <llvm@lists.linux.dev>; Tue,  6 Jan 2026 22:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767736915; cv=none; b=FKtz/GDRcW7ch+XcMP3Ta+/qEGOo6hLdk3w3TtDAgVtzfmAQMp3sTE1P0xlC6dFQWdc43cz7KC9UALs7x5dgrVECSsEAdb3/fqRk5INAM0F+Oqn33Hbn/WcT50n3jY4qW+12UpbObTW9GKse8LDdF6QmrB5SZ+zA0K74uXCEl5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767736915; c=relaxed/simple;
	bh=V1vYI9OaW6JgbscL6zWnaQPik4nUq5Se6Pt3qC2XhEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n3xlk9hehjPtwhuoTbewpvNGBrr6zupL8KjaIOlQtXJwyqWF3L+ZC2kkBW8yc7zdCo+J4dfQJmpH3w6dzJuOpdVGlZLsw/DoaE+Cc6Kpx4isbvbB9htDCbzXH8ftpsnZsoIx3fb809p79s3H7P8mIJ+XmjNXmrWmJRfw1ZD5yKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g5zktSq2; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g5zktSq2"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42fbc305882so742805f8f.0
        for <llvm@lists.linux.dev>; Tue, 06 Jan 2026 14:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767736911; x=1768341711; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PwWESQKHbbtswFeI0/RZNTuSNdIN0VtXuvpzyrmVP6o=;
        b=g5zktSq2J75sLqOINU06+5a7xj2WP5akMGTYJf8sBTKwuS3bUrx7FzQF6cJ8DuBafQ
         2MkmU/cCtVs6irUkrB6s8R6AsEjVGTupx9opaosEllqgeI6t7BiUn4Yn+OKsCUU/9vb/
         9aAlG+ZeRG+3OrOk/vEr+hMsoUe/fjTarFcWuQqY+hkZ8/aihP3sut8vhptY8mk84GgQ
         vLEKSRUnlkW1lp7pQAUfVcD/637CLQ/Yto3gxvpcbJ/ieNHrzZW7kTGGOcgt8/kyt7hE
         PmlabpPJHSkXqxJ91xffSnqmup/AOWXCOtLmRyi/CVQxBaUNos1ZVEy2IePPMBbw4jos
         GiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767736912; x=1768341712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PwWESQKHbbtswFeI0/RZNTuSNdIN0VtXuvpzyrmVP6o=;
        b=YLdY/uF77CeQ/X/JEFg21JO8Hy3fy0TbAGaWEjdlHPiOcaRWWYWwBCT/chsymS2Sny
         yXQZ6ry0oRW00Ju1m5W/viBMoUzKgClnBpMy6K+2TPbQoqF+PcASNvmwHMRoJTZw39i1
         c70unZ9X2xYaop8zIOANxkK0rd2RaeIWKJlKibWlhC/CCbBsvaVelLUV8ecu3JzILWWm
         OeKIEDLqjUGbqY34JIp4WmzUOhiyoCik7JgBAbfqEPPq5+JnQoy79Tj4VGntb0i9SJvg
         5ZiGbDQu24wnaxuJk5PjkRLHSxjXiOE6zK+U/jyya2NiLVEjr8BOgTO7C8P/8CUVbW6m
         OTJw==
X-Forwarded-Encrypted: i=1; AJvYcCX4TsbUBC+ZKDbB/Lrg1GSwIFUs1s5CYGSX9qVlJ20Gt/dkMiuyPinxyWxiGXYQDu7NB+TI@lists.linux.dev
X-Gm-Message-State: AOJu0Yyt/+aT0KV1KxDgcbmmPqIGL4Jd/apKqayoTXjrArDwjUwJqZZG
	9q5hIRgDrO0E9mcO2b7DU7f2lKdBraSO23FXmEyFV+xbfCWjJTQ8UNzCE/4j7KNCBJmqRScbMC2
	ELfERzpI0m2Qg8glOcsz9WbpKfmWtG7c=
X-Gm-Gg: AY/fxX7AycZTls2eeb9VP+kXe5RqpZ06Zl7xza6j+2NCMyNhXgfRwx4sp2sLxCpT7/q
	m9fRMsI3xDN0Sm+aznbKFXDdH3Jei27HaFqbQr0axtwoVCyjTHQLHMtFCAWM6k2btlp3sNRarzF
	vW/8anMGJJxnwokh/P/zgt1egtRAHNfL5K5eR17xcZRQLvgEgMSMTdB/wBKynvXeuvyuAXc8BXl
	Uh87nOKZ6xxnreGafdOkzjZLjFvL8NlxyiXVhc8iU0RXsUjEOXK+QPv+Do8PVckCYeLwY7qeWG4
	S26s/vb/l1NnsYw+en0al1sqxXqv
X-Google-Smtp-Source: AGHT+IGVWUhcesNwOFxohgkrPyNuC7qUPkPS2EtjoIKqKkFBbDW49r6kaqbMPN9EXskH/cWwGr6VL3D+OJg0p9BDDwI=
X-Received: by 2002:a05:6000:230c:b0:430:f7dc:7e8e with SMTP id
 ffacd0b85a97d-432c374f482mr611672f8f.34.1767736911389; Tue, 06 Jan 2026
 14:01:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260105-fix-gen-btf-sh-lto-v1-1-18052ea055a9@kernel.org>
 <ff8187bd-0bae-4b49-8844-6c975a2e79c6@linux.dev> <20260105234605.GB1276749@ax162>
 <6908562f-4a99-44ea-bffb-19f33fcffe83@linux.dev> <20260106215327.GA1957425@ax162>
In-Reply-To: <20260106215327.GA1957425@ax162>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 6 Jan 2026 14:01:39 -0800
X-Gm-Features: AQt7F2qslL7fAItbRDdc7oFPU9cDDc5nfhyI6doo6y8Hh3XbKxYba62tOseFywQ
Message-ID: <CAADnVQLDNHQtoOuLNdwt5yZ1qnTEqcruUpZfPQMhfTHNN6XX0A@mail.gmail.com>
Subject: Re: [PATCH bpf-next] scripts/gen-btf.sh: Disable LTO when generating
 initial .o file
To: Nathan Chancellor <nathan@kernel.org>
Cc: Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 6, 2026 at 1:53=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> On Mon, Jan 05, 2026 at 05:06:49PM -0800, Ihor Solodrai wrote:
> > I got curious and did a little experiment. Basically, I ran perf stat
> > on this part of gen-btf.sh:
> >
> >       echo "" | ${CC} ${CLANG_FLAGS} ${KBUILD_CFLAGS} -c -x c -o ${btf_=
data} -
> >       ${OBJCOPY} --add-section .BTF=3D${ELF_FILE}.BTF \
> >               --set-section-flags .BTF=3Dalloc,readonly ${btf_data}
> >       ${OBJCOPY} --only-section=3D.BTF --strip-all ${btf_data}
> >
> > Replacing ${CC} command with:
> >
> >       ${OBJCOPY} --strip-all "${ELF_FILE}" ${btf_data} 2>/dev/null
> >
> > for comparison.
> >
> > TL;DR is that using ${CC} is:
> >   * about 1.5x faster than GNU objcopy --strip-all .tmp_vmlinux1
> >   * about 16x (!) faster than llvm-objcopy --strip-all .tmp_vmlinux1
> >
> > With obvious caveats that this is a particular machine (Threadripper
> > PRO 3975WX), toolchain etc:
> >   * clang version 21.1.7
> >   * gcc (GCC) 15.2.1 20251211
> >
> > This is bpf-next (a069190b590e) with BPF CI-like kconfig.
>
> Oof, that difference between GNU and LLVM's objcopy implementations...
> At the same time, it was only a little over a second for llvm-objcopy.
> Maybe that gets worse if more is built into the kernel to the point
> where it is untenable but maybe it is worth the reduced complexity? That
> said, my patch is pretty simple (and a follow up for KBUILD_CPPFLAGS if
> needed would be equally simple), your testing demonstrates that there
> is some performance improvement, and I cannot imagine there being any
> other bugs of this nature in this area going forward. I have no real
> strong opinion, I just need my builds to finish :)

Pls resend both patches? Or squash as one ?
Sounds like the current one is incomplete.
