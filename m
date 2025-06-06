Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AE11B423C
	for <llvm@lists.linux.dev>; Fri,  6 Jun 2025 06:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749190103; cv=none; b=GDtGKSUUS8pxEtwaEqLKOKdfRxwVJeUqXnOJR5T8PJiuTJkN/StfmN88pZt17G1vr9VG/V9Jn66zLjpeLMIP2tV/UHE9cTk2L9RrBGAFJD+xoBKcr4O0qEY+r5RiHow6+0CEFeQNYjdmlhJLQ4QIN08w/M/SbIV4466cHhmbx8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749190103; c=relaxed/simple;
	bh=0bQVlQAkZiktNGRrwzVnwFpZbIiq3nNzG/ksOecik/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hW425l5heJsMNeqzhRCI7bUTnJN+Vos8WhLo+BEeefVh5cWqB1okEARfK3sZiVv7eey0uG2jp9RrlaaLNi5nck3z1p2nB9vFFzSF4uPHSzMAGLqUs+05UHQXWYwu5DAzqUDySir148mL9g+JC8JiKSzwq9UXarcInlltYWqKnjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2CQHlLzQ; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2CQHlLzQ"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4a3db0666f2so37470481cf.1
        for <llvm@lists.linux.dev>; Thu, 05 Jun 2025 23:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749190101; x=1749794901; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKvStmYDfkAOPdQAkmQVzm7vE8Ux/xTu/Lq8EZxk5pg=;
        b=2CQHlLzQSiHW86dymuSYSMRfj2OjLuuhSjzMVr2wiC9JOEgylml5YHddK67EekgcDP
         bXt4hYAXo5+IHNB7aQzTp8Q3b1KEOQzu4dL8Cmkyv4za8LbNYUjPeP6uDB5fUdA6Dj3v
         9dJgvBHFmV96RInw5d4Vp6pS2brmW6Puxz9UE4o/gOeBcHWC8Fqmx/+qWRuFm2Z9lLuI
         a9sm3ee7ZwK5MORNQRQR2NfJvJ63qKLeyYhavUuNMSsxwgnK8hJuQogXN57MU3aF/h9Q
         VltWCHFZRoQBoCSAFUvBqkQUgEXQVFR1garwF2oQafOGBs2THLIYKseyAfInqCQMmapf
         9Saw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749190101; x=1749794901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kKvStmYDfkAOPdQAkmQVzm7vE8Ux/xTu/Lq8EZxk5pg=;
        b=w6XZaIiFxWEAp7w53ZFR9jJSNgR5ZOzI7Kwiybb+mjl7ZDtdjISTyEQmrfGOWNYqcp
         ktl0343N0dVkfQXFhhYHvYrDGB4MLF8LAW/AWkk7yJixC0gIj3nPVvTFHo7iGcNIOM4o
         zDzy4hLgAhTtBx9VAtykQJuEoKzVglWpH/wGBh+57ONHNhrD1vuk9RLODNgkhsU+Tqax
         54M6IbP+33xl3Z9SOMZlrR7/3Rz/eOAfqeV2/BoVf+RfsimByH9i+vDACnM8itLYDNy4
         i2jXsF9WcS6E2J8NPcWykf3IcXcr+MQtoiJVhOWmGIerXOnYcxPp1V3SQiTiu4h9l3Rt
         o9wg==
X-Forwarded-Encrypted: i=1; AJvYcCV9jhvXZRHyfrXkajSEY0pBdrn+mUQgAtEvjpZ4VKytFH0MlXgqdRwgWX6gN3hYE0Glu6id@lists.linux.dev
X-Gm-Message-State: AOJu0YyBnLvva2MPHpZyi4TvLGf/6/YSF+zbAYk/SHsUqYB6u9ISQeUT
	HvVMxuDaj3Nu5RsYnxG5N1POTnHsdjdz3LbqR4haO0yn6OTRYBidFknyPi53mohr7zH/z2lx6LL
	9U3CRPuq172Z8/hC5UQAhwPd6dTX97YdYdOHwmKEg
X-Gm-Gg: ASbGncvnMTExbR5INKpwhtZrSelo29MiqJgd1JQqx1vqOqk6Y7HlJjE+nqgpd0cD2jy
	GTqPIv5ZukWaeMuwpviciVMHXFr3GRRa/OtkeEzRkByR8a1nZrmO1Zx+h3A+NmIOAyT5IJysx52
	zkzaPP+ZozVIeM7TUdmE8Rgc2T8qTuPq04QojXc94EmtyZrmEYvNNWzvB3wCu8yHTvKQoK/Jra
X-Google-Smtp-Source: AGHT+IFNLf8kiaoxiVhlcZHxWQipk57Pwx1NjDf59/NaBKuvZ9xKQtErzz+1d8bwORt3x1wf4IaR5TD3NK/vee4duoU=
X-Received: by 2002:ac8:6f08:0:b0:4a1:511a:b99f with SMTP id
 d75a77b69052e-4a5b9a00f7fmr43119931cf.3.1749190100655; Thu, 05 Jun 2025
 23:08:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250606052301.810338-1-suleiman@google.com> <20250606053650.863215-1-suleiman@google.com>
 <2025060650-detached-boozy-8716@gregkh>
In-Reply-To: <2025060650-detached-boozy-8716@gregkh>
From: Suleiman Souhlal <suleiman@google.com>
Date: Fri, 6 Jun 2025 15:08:09 +0900
X-Gm-Features: AX0GCFsRvL-wnGhd79Wc0undNc8c43NKvrHNdqcadxOFKESr_qPXBVorv1nNUwA
Message-ID: <CABCjUKA-ghX8MHPai5mfC4dZgS8pxi3LAvh3Wnm0VCt4QmU2Hw@mail.gmail.com>
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

On Fri, Jun 6, 2025 at 3:05=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Fri, Jun 06, 2025 at 02:36:50PM +0900, Suleiman Souhlal wrote:
> > When cross compiling the kernel with clang, we need to override
> > CLANG_CROSS_FLAGS when preparing the step libraries for
> > resolve_btfids.
> >
> > Prior to commit d1d096312176 ("tools: fix annoying "mkdir -p ..." logs
> > when building tools in parallel"), MAKEFLAGS would have been set to a
> > value that wouldn't set a value for CLANG_CROSS_FLAGS, hiding the
> > fact that we weren't properly overriding it.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 56a2df7615fa ("tools/resolve_btfids: Compile resolve_btfids as h=
ost program")
> > Signed-off-by: Suleiman Souhlal <suleiman@google.com>
> > ---
> >  tools/bpf/resolve_btfids/Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> You forgot to say why this is a resend :(

I wasn't sure how to say it. It didn't occur to me that I could have
replied to it with the reason.

It was because I had "Signed-of-by:" instead of "Signed-off-by:".

-- Suleiman
