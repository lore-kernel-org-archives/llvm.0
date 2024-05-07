Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EC319F
	for <llvm@lists.linux.dev>; Tue,  7 May 2024 00:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715040894; cv=none; b=piEBf5MyqDBdtyz4IRECciuFy4j+LgVuFXGEi2FTtAE7KKKs3V16BddZxgweagQx8QUgxHeBnBUFwjD2cbHcThaN7k8ywen4dE9+7EnzdlgSaIl3RqI8UeskpV025Mh9Lrbi3h7hCcOZE0XVS2x6g5iWtEHTdEbegPFDEzK0cII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715040894; c=relaxed/simple;
	bh=lu0OQIrcM30++N9sDEIpsDIcuzGB7E5UCYPW/qPlrfo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aN9ZejdpCERYbET/GsatC0u1Bixlqu6uciAyQJaJ+vRn/sAkd7Z5KHLtxMkoZVvKO0yzh5YBY0hccLyzgC0/0cLWEz7Vs0DNXyppjOUkGPdJ/tRJNKwCFWXJ7jDXoIujphKaiA4vmRHgSIyg8hFeWUUpbX5V9we5eLipgEwByPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2vKi3xHA; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2vKi3xHA"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-572a1b3d6baso3274a12.1
        for <llvm@lists.linux.dev>; Mon, 06 May 2024 17:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715040891; x=1715645691; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8oWcFWnZBGCM1E5sWUM+4SbAQ1guZn75qzZz72Y3AQ=;
        b=2vKi3xHAEyRG9HRbjNMnWGEA/v8fM6aKkKX6+t0SqsFbel4Ff9+eu8pfLnnC436Q+/
         t+yaM3lpoC1O4ylQFwakW9GYsOQntclgp4WjonMahqewlW5LldgV2tYV54uJkpd0L0vw
         ktw6xktM2UGs2+Rjgu2W7b27TH3/yCHp/EbAOCcL2/Bg3HSRZcdI5Ew2y7MsOtUgnB/P
         6lCuO5Mw3f4VJohLCA/95eSPxbiV3UgX2Qpl99C9YEzgLdBra07Xb1L/mI6ICwyRQC9b
         Nihy6R0vJTa7Eg1ONwN7tU8AuNZ0LJIT5MdfK8Po4NZPESj293a2pfh0KXaq0TsIAqc8
         mWsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715040891; x=1715645691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8oWcFWnZBGCM1E5sWUM+4SbAQ1guZn75qzZz72Y3AQ=;
        b=G8AFmefjbc+FRcEdG5Jpu1SkZOfOdDiISJ2B9DGNPLEI1vmEuFY3l24LjK4tCTFbHK
         xXyIR3X0pKjOurVS77/NZSSSjAL7cm8hyox430eyidd4ey9/zMwEspNWWLUK3ypekcl6
         wD1KsroK9gffXn0HjzTeKj4XHbeU9eHo9MPfiwsr7uIy2kUR6qtSfZrcDmNni89elkj+
         7qf3OkHaxoUmq7gFXM5xC2bBxiqvBbYBC8NnovixzH03YpK/4QDT7do7GbVlQhxx/qbp
         A6aP14SNZ9V2bI3/jdWuht0syJecvmMngkys0r5vl0P9KWN+vZu3xhDG52SrCOdaKprU
         KAfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXM5xp58tRu2Lfw1toQleURY1itc8Qgs0L2pvmOjtEkXE9y7JZA5g4LzoJg7KR2IuyODLS7fizjaMyPCT/LkEysh9qIKA==
X-Gm-Message-State: AOJu0YwFE2d2ixTM8y6oY/gdhb3U8TarluWt8HULrP4b25zdiWwbLw78
	VeyPSv+GjJZtva7S8TMzWk/2xnDcrDhOqs8MR3A5Ed/pcXe1cDebUYgnIGC08ItCcg6sfAcnIp0
	5s00V8ouGVI3NfPaHgJkxPlHfQN1YqrYjgT9a
X-Google-Smtp-Source: AGHT+IE15l4LDBVGhfGcDhfoCmROQP28ylvV/hj/rCXLLp9j4EClG5UA1ylJkDneYk8xq7WPhDsbgZ8lCxp3B6gC3v0=
X-Received: by 2002:a50:cddc:0:b0:572:988f:2f38 with SMTP id
 4fb4d7f45d1cf-57311e083efmr96122a12.6.1715040890499; Mon, 06 May 2024
 17:14:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240416152831.3199999-1-usama.anjum@collabora.com>
 <202404161027.63F4D4FDEB@keescook> <CAFP8O3Jjkh0U94CbS=epXELMtCBpYt4fGejX3spH4=GdF7zVSw@mail.gmail.com>
 <202405061704.DD3AF674@keescook>
In-Reply-To: <202405061704.DD3AF674@keescook>
From: Fangrui Song <maskray@google.com>
Date: Mon, 6 May 2024 17:14:36 -0700
Message-ID: <CAFP8O3Kx+bVCVQpQJVBrPkjrQO9d5rdcxGGP-Jn6t_Mpc995RA@mail.gmail.com>
Subject: Re: [PATCH v2] selftests: exec: make binaries position independent
To: Kees Cook <keescook@chromium.org>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>, John Hubbard <jhubbard@nvidia.com>, 
	Eric Biederman <ebiederm@xmission.com>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Yang Yingliang <yangyingliang@huawei.com>, 
	kernel@collabora.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 5:05=E2=80=AFPM Kees Cook <keescook@chromium.org> wr=
ote:
>
> On Mon, May 06, 2024 at 04:30:27PM -0700, Fangrui Song wrote:
> > On Tue, Apr 16, 2024 at 10:28=E2=80=AFAM Kees Cook <keescook@chromium.o=
rg> wrote:
> > >
> > > On Tue, Apr 16, 2024 at 08:28:29PM +0500, Muhammad Usama Anjum wrote:
> > > > The -static overrides the -pie and binaries aren't position indepen=
dent
> > > > anymore. Use -static-pie instead which would produce a static and
> > > > position independent binary. This has been caught by clang's warnin=
gs:
> > > >
> > > >   clang: warning: argument unused during compilation: '-pie'
> > > >   [-Wunused-command-line-argument]
> > > >
> > > > Tested with both gcc and clang after this change.
> > > >
> > > > Fixes: 4d1cd3b2c5c1 ("tools/testing/selftests/exec: fix link error"=
)
> > > > Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> > >
> > > Thanks for this!
> > >
> > > Reviewed-by: Kees Cook <keescook@chromium.org>
> > >
> > > --
> > > Kees Cook
> >
> > GCC versions before 8.1 do not support -static-pie,
> > while https://www.kernel.org/doc/html/next/process/changes.html says
> > the minimal version is GCC 5.1.
> > Is this a problem?
> >
> > If not, and CFLAGS is guaranteed to include -fpie/-fpic/-fPIE/-fPIC
> > (PIC), using -static-pie looks good to me.
>
> Should we use this alternative, which may be more portable?
> https://lore.kernel.org/all/20240504022301.35250-1-jhubbard@nvidia.com/
>
> -Kees

s/-fPIE -static/-static/ then it looks good to me:)

-static creates a position-dependent executable.
It doesn't matter whether the compiler uses -fno-pic/-fpie/-fpic
codegen, so -fPIE can be removed.



--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
