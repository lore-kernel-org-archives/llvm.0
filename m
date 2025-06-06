Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CE41E32C6
	for <llvm@lists.linux.dev>; Fri,  6 Jun 2025 06:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749190919; cv=none; b=aEOkZifuAJuKrKcAoVglgBF5TWdvL3EUWQCqgEInVO6ZeKwQGMSOa6eoApDJ9Vo2JaUuFJRnHL07oDVx5eYdXT/cTPtZvaKnOZ5zLp7XfGhiOAcZUSn49NtggsP0pEvRfBIpHfLrOWhBJxQldqUGd5pejo9aD2NMVyMkQxgTgAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749190919; c=relaxed/simple;
	bh=/hhxPKyV8c7R5WACfSoGjG5FxM2Pcy7H7mzTrEBAWvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RJ8/yL6H1bsGtcV0p6A6RmWNYu32cfaAC0xQaMvXTLhl6njlYjiv0b0Tb3Y6syZV7zocDpD+WN+oeQfhqu44R2U7AxPdczYI/eW1/dN60nZ6mv+eVdsK10nz46F4daE99yZ/Xqja75Fm3jJlh4af7/NWFbqRQ21rjsLhkQj5Pf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P0QSUN5b; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P0QSUN5b"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4a4323fe8caso11942481cf.2
        for <llvm@lists.linux.dev>; Thu, 05 Jun 2025 23:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749190916; x=1749795716; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsBMtfbagVpHr2dWUudDAezMnERXc8jN5mmlbFaIuMI=;
        b=P0QSUN5butbvcvM4vL7vYCFz6wcMzskwd1zxpBuHuaGLC88uMi0OC052lQ+R4PzhmL
         /n02dHnQKd5embJ1XdA6UUwD7TcABdRnpw3II1g/4uX6jOXCoWKXeBeAV+MA0rBx3nzZ
         h40va9bmoh/IaaqsUn7d+jpiCvQkEN87hzY6VkxbbRje9P2dBhxco96a8Y1Y7b2i8VW1
         sWWGkX2AIkdW4MQ/x/qlqkhJUA2FZtKbMHPctjpNbK3AlmlIWB7Pcm4oyvarDVc9/Nek
         dVi2EhSs1tZBi6SkldbEi4oZVtjMQbNcgm9y2qD2tj3OcYGu2kFL7o+DSviKGSeT9+km
         ZPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749190916; x=1749795716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vsBMtfbagVpHr2dWUudDAezMnERXc8jN5mmlbFaIuMI=;
        b=fLDGWqLYAHsrc8W+53iKHFtNY/8U7F9Ul+yaULBQyWt08VEz5myH7/IK8+491B2Lqa
         tCkp5WZW1vcWfs17r1xfUWeDDO2XAp3OThEvUfIoJ1AhROav9Y9652CPmSZztF/MuTg/
         H9oYhiUVYU1hS3XngsTtzCzW9BUWa+bFMt93x4jS4LJDt/RLVuSHVavu9F7YMjGhxl2a
         UiPi3aEZIWXXvix2dvgI47LOTcI8b+jUWvMoZT0NYjlCLG5b2navGu+R1q9ppz4X6eiT
         TTRDKgi8MYhdCDWyD9J7VuzQAlY5grkrQqKnINm9qfX2kXpk/95ZOp8z3o4+/140PpBz
         iL4w==
X-Forwarded-Encrypted: i=1; AJvYcCUAFmfP+gy19FryLZpHUQ1V8u9gKRjneHf+7nCbQfp3PhIXt2jfBtBdbSDEq6qfOeNCmIYb@lists.linux.dev
X-Gm-Message-State: AOJu0YyUgCM3oYoJDHZFkVCBCCD+WsvPRPEogWaBTzWZvEShQkduj/vU
	DvXtPci4WCj78/KGDzmQWW2neJgoadTWeE1Q6OZ018RPmwOC+sFgp2nwRi9pSV5o+dlNKtBAFOW
	PG11cIfj/E4OiiZu3zhyCqhU1QZpcRGWYrelX3Xow
X-Gm-Gg: ASbGncuPnnwyQ58XMg28ye5V4y1zjq8iQs9XKfZaCX2lqS1SNhAqJ3DI1L0KSri+TKA
	MYgZNv9Zbm3ZblKz78TkgGDvo+UeAsYlVdZjSeLqouwiRjzlIaHIFmK3jHYLBqXaNzeiq0Ub2jr
	10HiJJ7orlJTGoA9zlnM6QQSWKEn+dE97F0KJH/muONjXnWN3VWI2j34Y+xbRGUW3U1dzskcYh
X-Google-Smtp-Source: AGHT+IHSnKSNTajMIDeaip5sd8sIZfLqFKnW5zqtsvkLtQLXGTWBXvW+v3e338cE6mS/LSFh7KNJ0hL2rtVDd3KBbrg=
X-Received: by 2002:a05:622a:488a:b0:4a5:afa8:b3f with SMTP id
 d75a77b69052e-4a5b9a052b9mr43763231cf.3.1749190916414; Thu, 05 Jun 2025
 23:21:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250606052301.810338-1-suleiman@google.com> <20250606053650.863215-1-suleiman@google.com>
 <2025060650-detached-boozy-8716@gregkh> <CABCjUKA-ghX8MHPai5mfC4dZgS8pxi3LAvh3Wnm0VCt4QmU2Hw@mail.gmail.com>
 <2025060620-stainless-unedited-ddfc@gregkh>
In-Reply-To: <2025060620-stainless-unedited-ddfc@gregkh>
From: Suleiman Souhlal <suleiman@google.com>
Date: Fri, 6 Jun 2025 15:21:45 +0900
X-Gm-Features: AX0GCFvRUMvIRxLmq81-oToKmXjpNnaQGe54t1cYDvCDvW8q6W4X7-0XyGhmifI
Message-ID: <CABCjUKB4OgQoGv+Eg7q3zmJXXw8dWfEo_AP-XfzxHDoodtxhXg@mail.gmail.com>
Subject: Re: [RESEND][PATCH] tools/resolve_btfids: Fix build when cross
 compiling kernel with clang.
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Ian Rogers <irogers@google.com>, 
	ssouhlal@freebsd.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 3:20=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Fri, Jun 06, 2025 at 03:08:09PM +0900, Suleiman Souhlal wrote:
> > On Fri, Jun 6, 2025 at 3:05=E2=80=AFPM Greg KH <gregkh@linuxfoundation.=
org> wrote:
> > >
> > > On Fri, Jun 06, 2025 at 02:36:50PM +0900, Suleiman Souhlal wrote:
> > > > When cross compiling the kernel with clang, we need to override
> > > > CLANG_CROSS_FLAGS when preparing the step libraries for
> > > > resolve_btfids.
> > > >
> > > > Prior to commit d1d096312176 ("tools: fix annoying "mkdir -p ..." l=
ogs
> > > > when building tools in parallel"), MAKEFLAGS would have been set to=
 a
> > > > value that wouldn't set a value for CLANG_CROSS_FLAGS, hiding the
> > > > fact that we weren't properly overriding it.
> > > >
> > > > Cc: stable@vger.kernel.org
> > > > Fixes: 56a2df7615fa ("tools/resolve_btfids: Compile resolve_btfids =
as host program")
> > > > Signed-off-by: Suleiman Souhlal <suleiman@google.com>
> > > > ---
> > > >  tools/bpf/resolve_btfids/Makefile | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > You forgot to say why this is a resend :(
> >
> > I wasn't sure how to say it. It didn't occur to me that I could have
> > replied to it with the reason.
>
> That goes below the --- line and it would be a v2, not a RESEND as you
> changed something:
>
> > It was because I had "Signed-of-by:" instead of "Signed-off-by:".
>
> Which means it was not identical to the first version (a RESEND means a
> maintainer can take either as they are the same).

Ah. Should I resend it as a v2?

Thanks,
-- Suleiman
