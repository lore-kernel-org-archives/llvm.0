Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9180347BDC
	for <llvm@lists.linux.dev>; Sun,  6 Sep 2026 16:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788713823; cv=pass; b=JS/rUR8c219brnAAmG9+RGV0fbqi0/LPHSW4HlN+qdz4V/7aOszhnatlNFh1h6DjbtrqioBQ2WpXLxoOq67Fo4cs+Y7Utq4lDg6FXF8Bx9i8Q+5d2b39LKd+dAmz25xHzZ9nGGRMrDw+qWVvFL68k3SDi++1zAbu6sCmIU27JxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788713823; c=relaxed/simple;
	bh=jLbNWAYKOjUjCxKPAnKQtbCBXntzd3CfPr6hFf0UbZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jpc0LCwIZDKd3XbsZESIYyhtYWCyiJTkw/d7h2RUr/9Bm0M/NUIBKu8AbnVmVIjHuNSkwE6KjSJV0HY/Vx29GMo141/qs5ce+Q2ZurVVNS5TRSCZJNja7WW4BSTJVFtD/HOWjNd84sNNbkYeTC4Yk7QTz3/BLCfPB3FybvwSSOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xy5VQY90; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xy5VQY90"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39931869b4aso172528a91.1
        for <llvm@lists.linux.dev>; Sun, 06 Sep 2026 09:57:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788713821; cv=none;
        d=google.com; s=arc-20260327;
        b=RgwitlklNdz6NEbMNPtPqoemSSLxo/AMLvZtWH2OITZKoqtuYWR+Gr9hZMC794BcBi
         BXW5H3Y3w0uOAruk1COGJGvSCGyvfafSBW+9BU7bVG9ZCQXbR70RIucdGmA6UQbzdv+R
         FwFo9LWJjuZOV2ZCijMc8gqkBd644DyES2bEb6rTypeOAhFJG/GAo4FQ20QVd6eBPCb8
         62hbeuSTH/iJjtUFltYgLBXlvsNViqmjB75bOho3HPHQoF3LiH5Y+DnTfMq1LkHrUO/X
         mw248DI+dSn6+9b9/iaGhc0vtNNqgdxG3jnuUPYKPvyjG6opFU2Oxb0lGyR8r+6arREo
         mISA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jLbNWAYKOjUjCxKPAnKQtbCBXntzd3CfPr6hFf0UbZI=;
        fh=x9kmcCFW16aWMolLpZfk+m67ryEzXtbATcA1tFAPR04=;
        b=l7E6Zz3ruq+Ajhp9VBFakz+S7igQpAL447vPP2287ALHjRUxRD7FubTZ6lYcTFgPK0
         U9OBKFTH6qKk2wCldG5zioznfu+eBk5BZMhwBFmSTKvRxD9vA80rJx/C2oqmECsH0bSv
         d6eiCkgZUY148dqH8+MwynXqbGJ7kL+1KiJezcPv2xk6/Tgml4/A6aCYCDTFzyeMsg5z
         3lre4GoFJye5f6y/DDU12yk5SvHPjyn0QwQuPNZbaQZV6jnFCQYZnlt1NMYuliHpDfgX
         bgbNRPOmkbKVsNR0gh1xVHKUySnWGA+JH788KwV7L4bTv6oHxKJzSpLs0MblzEoDV/ry
         NHGA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788713821; x=1789318621; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jLbNWAYKOjUjCxKPAnKQtbCBXntzd3CfPr6hFf0UbZI=;
        b=Xy5VQY90QgWqVj1cZc+k7YHoiSe2a7zpodGOGtiCuj3WHMsMNJ4RHWEJn1yVOX2Nih
         /DWjfYmXHVujb6UZb/y/ZJGS5FhjoYvRdzy2rHckYGFK87uQqi86Xowb5TPv1pI/GMdQ
         G1Toj6Xeqz9q1O+QlhpeS6eq2AP3uvoEuM13IKp2pZzJk1JhDgMWQtw4gO7gsBGqiPND
         HkS7IbpeXKqiOq+pWt2al7NQ7LBZpQ5SW9/WMInxCIBXrB4jUeJVeVgRTV7MQ9EvT6Pv
         3JIfTK50vFjZpDTx+zxlDwLZxFpeckIGpiVDjm9OH58rlTwilMVzGj/5oUD0rKCRT79M
         RC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788713821; x=1789318621;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jLbNWAYKOjUjCxKPAnKQtbCBXntzd3CfPr6hFf0UbZI=;
        b=q4zfHpBuia7yKDD1Mmxvl95aAxbj0o5XVINYfz15oXNSXTtwOWYoe5zl4UAE7dudO3
         8Yyfm2pSPSSN5FNRC5T1x7janz1mseApBgfNDZbR5xD1W5dJ6AEVSLTARed3IPKwFgAk
         ZyXWjqLruQsaJZDdnspZQrRla1HPIWcLFgICc2pA4Thpi+03ku1V2fxR9CkkeoCW39eV
         lYgrtd5Y5+2BayfpEE86HlwEZTsmLWOg6kk5suh4KiOpi2VVWQOcmUgRGGC6G/FzCboZ
         yHpiTULBBeGXzv0Ym2+sKfprS+Ja+9R53Q0svXsKgnp9CX36Akayn9/g+aZelazyxnWm
         cwdQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0ghYeS9wJ9timV8VCfp0ODg/ZYb1Yj6fKH/xRXQXFOOF3zWdtksjZHO5DmuNmkR6IiGn8@lists.linux.dev
X-Gm-Message-State: AFuF++nhWkqiKfKhaa3H4+nxV9eiMKAbLJexlvX/+wTtBCYPZHLIBA7u
	5zKw28g40VQlQmdp2TcHGpXSoRnd5SbZ4he2mdT1EnpJkbbJEnEihagzWgOO1x+RGG+298c2PCe
	Sfd/IBxS56+W+k4SkLHoojiYJebBZSdE=
X-Gm-Gg: AYBFou1/2sDA06qCiiat1pja4mAv1/Ch9uNzkDZ6UIOOO8ELKbJR+yx9cHfQeKKzSpl
	LxI24ojQTuFuSDjLok3OgEzJbbeBJpcf4AenL+P0zglvBoFzF8lr48by1agrdSQQUxNu9OHMu1R
	Mp4B06zG48jLx+tunSS3Q98I4cOfx9wBs8IBycYXy+Vbu30eywzdlidPlzzV9H1brUv9o7KzYy4
	SlfwlJaSZZgbDj2mUJa0ECIzCanbiLMeH/1SNAip9KoA0UJ6HM6R00U6J6dNQIC840XKWHwB7XI
	F90oQNnuFhXblXPPnJ6D9wn9GCaa2rfc2fHHPLHosQxnazhGUuajViHoRrIPYpJnQha3LVlP513
	VF72Q2c/tsEoocWJKCDv4+viWpsM03YzzDHroiWi9REvYCnOHM/Wl+p43vb3/Lwk6UHNbHTJm
X-Received: by 2002:a17:90b:384d:b0:398:bac0:238e with SMTP id
 98e67ed59e1d1-39b3d8377camr12050791a91.6.1788713821151; Sun, 06 Sep 2026
 09:57:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260904-b4-arm64-callops-kcfi-v1-0-ce6687739b0c@linux.dev> <20260904-b4-arm64-callops-kcfi-v1-8-ce6687739b0c@linux.dev>
In-Reply-To: <20260904-b4-arm64-callops-kcfi-v1-8-ce6687739b0c@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 6 Sep 2026 18:56:47 +0200
X-Gm-Features: AcwNN1Vz7OHfpHx7W0dFC3jg8glvxcm1hmRiClFLpwy0F6DpBbL1JHHuwRxDDvo
Message-ID: <CANiq72=xOrSXBBdmrKYfX1=qgF37LRAMzMJd4GJkXaYHMVe9yQ@mail.gmail.com>
Subject: Re: [PATCH RFC 8/8] arm64: ftrace: Allow CALL_OPS on kCFI kernels
 built with Rust
To: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Leon Hwang <leon.hwang@linux.dev>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, live-patching@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
	linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Ben Cressey <ben@cressey.dev>, "Florent Revest (Anthropic)" <florent.revest@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 3:20=E2=80=AFAM Jose Fernandez (Anthropic)
<jose.fernandez@linux.dev> wrote:
>
> +# bindgen generates no code, and its libclang may predate the section
> +# argument of -fpatchable-function-entry that a kCFI kernel with CALL_OP=
S
> +# passes on arm64.
> +bindgen_c_flags =3D $(filter-out -fpatchable-function-entry=3D%,$(c_flag=
s))

In general, one should be using the same version (we warn otherwise
early in the build), but yeah, it is just a warning for now and it is
nice to try to remain a bit flexible.

Now, if we are going to filter this out for Clang, should we just
filter it out for GCC too? i.e. outside the `ifdef`?

By the way, "generates no code" sounds a bit strange, since `bindgen`
generates source code...

Thanks!

Cheers,
Miguel
