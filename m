Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793918452;
	b=HKYCKXcTo3iu7daoaTJxerpCp97Cp3RfkzU5fMEqeAIJw/icsh5Bce0ibU++orTU11bk
	 7xWZk04oLKmSImpoaR5gyWPUMKCLmxf5Lco7sFgnneL6pbM59U7N/AyLZYBZxqB+IJrGT
	 D8BsN026yNhRatDdHJ2h8X+xXxOvq/E3zxCxZCGzSjD7DwUGnlqASeIONGvnAJLPyPiX2
	 Wtueav90xdAMOsm9HBkdKDuSHFzOcg1S8WL6YB9m6SZ5K9xOP8JLXu7BFG+vDC/HvOFwE
	 meiYp8nTAJwFxICJYihjrAbClzuTPRsC+Bm8nM5Ku4WSfKwAOxOIgRkgs0azi/xR4DQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793918452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=asv4QJYvubkejzKdluXiY+GI6RaigE/KTwLx8Jj692M=;
	b=ofSUo8YpRcU/RWHntdiDhZScjHZu2XRMwLz1aWNUe1QPibS4hdD77CRfCyb8CRLsmLsz
	 6aLZWAO48wIF+F9UvHUOFDRlwDvPWsdYitkhaAsnd7rNyjrcYg6PYrsk6ucvmLAK4HoSP
	 Lof2gHk5IbQi2ei8cPOa6JFvxPSaSI6GGoZGjjmbHgrs6/qudzYD2C62lXu6hk4tauxs4
	 p33W75pEIpP9o7l2pFFCgEJUPdE0yqi2XlYuNdf5MYDnLOjPTEcSX0VJIe/xikoAKjtib
	 NFo8sKWV5Yy1eq0K9hnd1CsNQA+Ih6Lmkm5KepRHgz79ZPjrrX6hVkUS9X21z7GmU+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RzQTnn8d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3B1606A328
	for <llvm@lists.linux.dev>; Thu,  5 Nov 2026 22:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE3B1606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RzQTnn8d
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4922dbcee23so36224f8f.0
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 14:40:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793918450; cv=none;
        d=google.com; s=arc-20260327;
        b=PfiENhJ/ktUZBhKxW+gFL1qlgwr3Rb2p+ggnq5Zz8CElvtQPsp9MNVmVvF4rZe9TyX
         xwFM61luxcRdtnC8YLWDbVr132qPy7+y5yODPjynkO9YTdjWzEmul/X+qhtqlBTaRHGN
         wvg4da+gTCb4zP7VOx8e8kC6SAj4wgiTj9dvJyKeXuu04b1ph8SYpMR+aIn131Wce9E7
         5X8iC6nayPst9Vuw6hc54el58a22H1QGlJ7y5RtdO9bVqkKtTf1tdUuk6W+X15a2z3Ak
         KvtmU3mei4eFRFFgcsMhoRKBt1pZCsfYGuiHUFu/xKa/K5QJb980rQIZq2LwpaSfKpow
         YE+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=asv4QJYvubkejzKdluXiY+GI6RaigE/KTwLx8Jj692M=;
        fh=vv3nVEC9KBdvnEurLuBqE68/sLsaCxzCkRKA45pFjN8=;
        b=BXLcKEriPExBsmpqBUMxeHXgyCCAidJkNn5hg58GPbm1x30FfTiDjNAjFevoW4yP1B
         qYVOO4NW/Qwd77X8k2Yhjz7W7z77wcgleKFQppUtMo6kJn6oU1V0sXkCbq77/s0VeSxl
         xrnXUshbbp382Q7prguACgPT/kF/rOUM4tY2a4QFMHe4/IVgaKt+Z26Vdv4XwR4r2UyG
         xnehw4p9KC/soZn2RpApBIyYMysPkzEJUWrUBD+VBLNLOIvGAOuyOJ3zdi4URBClcMxZ
         q9rT1QN6x5yKG+G0lSNSYAGlwbxY78SKnBbomUQiQGN67gkWZ4xvE+LXEGhV6z8H755W
         PcPg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793918450; x=1794523250; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=asv4QJYvubkejzKdluXiY+GI6RaigE/KTwLx8Jj692M=;
        b=RzQTnn8dXuIPfE5s6BLo2J7YzCAQ9Dr2mFL5SYK02K7hkF0hXEZyYAD9+gZnUMQWV/
         OZOvYdcrbbZN1AoFiuuB6XoHY+NboMzaJINgSqDVxEA12juYbEgebaPF17JeJBRv4U5j
         tyiB3Qfl/1pG53P0aYcXr/kOJyG5LCuAiAyxXN2bRJPPjG6wlsC7dUG/5lxDqRBcfGJd
         ZslslbbX0qZp56b6TyIoqwCV0v2k5xUFQHp4r4wBbhmoiOqLc5maI5YS464+NXN7G6rU
         8ihqU+4Ss2TignXv0xUZbbUdhu192TTCL51/E1AVErlKLqZveZZDdOhFJGJ1hc0Hoy12
         MNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793918450; x=1794523250;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=asv4QJYvubkejzKdluXiY+GI6RaigE/KTwLx8Jj692M=;
        b=kPnaTOsrknIq/FsMcwA8/cqOeTvhLqsSNc7+ShTCdI9JAKH5vI/X4qvcD7Ao/W9TvN
         aYDb5mVh2sJuZFGyBdh0xoj+RfVmdiAkgSRl8xhfL44J1K8uwytbMJcPuebGBi8ZyWmC
         ZOB1jdOKPR69k4ugvj4EP2gkkSj6v9QOT3sITuW2o2WY500IMYpioh3/CgxPdO1CRGRz
         a7TJbLgw0yTN62IUIOOkSMIcjigXxvwMI6xqPeL0TnY6X1oOXvLxtbATaOXJw+k5Vh6L
         YimTvIq0aHSS2cnmhQDk13Bs81H1c+rw2+uLwPff2xrJDIklTCFhe5iV3ZoWvdZmWRcI
         wf/Q==
X-Forwarded-Encrypted: i=1; AKwUvBySbMr4RqU0ObBnZ3AM612MT0wXdEtXNHKcvKznHQa25hhgrOF6t4KVCVyRgGkXxfIVEGjY@lists.linux.dev
X-Gm-Message-State: APuU4Z+kXGcNEw849YH226DQd4ovYQi/YygSybjA7cG/dEat0edZocaw
	ChRtETZ/Qqx5JCRht1gfmMQd3MqsUoX/YUzjwFyOtaBc9cag9+Kqf6yfqX24TfGt6S5DIXZNwxK
	0h6j1J0T0/avJFjuRP102T/QiEPpIGXPeRfM/A6uG
X-Gm-Gg: AYBFou0nx+mveBesQ27EBZQiC1cXMV++xiIG0IvYyqPdIjuoRSQyCPKqSAp2hbZb6bI
	LNjhk8E3FbunGi31FofLqnE2ZboJk/IHE09xEzupC3PvFhb9KT1OJLzz2VTiQXRTOpIp7VLV+Tl
	ku1Qa2pXq7N/FaC8Kp8H01lvoFLNt6/ZD4v30aJsUNEJySfg0CkDNePQgMDZ0qict5TNbUf8orP
	gSsY5ZO+p/qiNm+sTeVJv/jRNnxiloL/DLeoLkyh6oE+UGimj3v0nBWrVXjMO0I53fEgwjawQ/L
	YRDE0fX1jcK45TIWXFhoYoXMGLSnARu8nYTy9oKSuc2aLIM/sqyCsBF7Q09t8KlIvVuGGOn7d9M
	aTwMZB7yekH8QtyD/sIrAVlCtGlcdcKXB0wHt8TUbCwPL9oDXwsy+B9bdl5h/rrYCWcah4btJHW
	dB5cT0tR505VNK43iV+ZkFn+1XYOHC1pqmvCC3ndXqssxEcAR5hN14NQ7XNxA05S2wSwcwdzc0C
	yCmHJPGEKDXAUZjLNb2+uc9bRjEakLv6OWZcAjf80M9eDOHaOEogZPfsg==
X-Received: by 2002:a05:6000:2892:b0:48e:d27:bef2 with SMTP id
 ffacd0b85a97d-49276a6e26fmr1759258f8f.21.1793918449566; Thu, 05 Nov 2026
 14:40:49 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104174554.1.I8556199ea4f1335169ce16e97309aa63ae2e2310@changeid>
 <20261105052401.GA862715@ax162> <CAD=FV=Vx4gHvF0TegRBwZetTNjP5AsjbBK9+sjNA43OpL1Wjiw@mail.gmail.com>
 <CAF1bQ=S52KWHopqxksctbBirFEr5Mz1dKKMAoWh-dqLHii3Nig@mail.gmail.com> <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 5 Nov 2026 14:40:38 -0800
X-Gm-Features: AclHuK8nvrGQbL7-Xvq-JpHEYtxPKFX5Sm9KyXUfS9U3lydEUDZDAqeaU6dAk_8
Message-ID: <CAKwvOdkNvYz7mSmfQzWuFd7FZEUyZkH0L2tfPSbouE0J2w=b1g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Doug Anderson <dianders@chromium.org>
Cc: Rong Xu <xur@google.com>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, Han Shen <shenhan@google.com>, 
	Nicolas Schier <nsc@kernel.org>, Han Wang <nesthanwang@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Bill Wendling <morbo@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 1:30=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Thu, Nov 5, 2026 at 10:23=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> >
> > The issue you mentioned regarding excessive time in applyFlowInference
> > comes from Profi.
> >
> > The AutoFDO implementation used in the kernel is FS-AFDO (which uses
> > FS discriminators). There are known issues when using Profi with
> > FS-AFDO; enabling Profi actually degrades performance compared to
> > original profile propagation. When we tested and worked on AutoFDO for
> > the kernel, we did not enable Profi.
> >
> > While I haven't looked into this specific bug yet and am unsure if it
> > is unique to FS-AFDO, I recommend using -fno-sample-profile-use-profi
> > to disable Profi for now.
>
> Interesting. I can suggest that to the team digging into it and see if
> it solves the problem. My AI agent says it will though. It claims that
> the default flipped recently and "-fno-sample-profile-use-profi" will

I wonder who flipped the default? Perhaps they're not aware of _all_
of the existing users of AutoFDO, such as the Linux kernel.

> restore the old (tested) behavior.
>
> Should I send a patch adding that flag?

--=20
Thanks,
~Nick Desaulniers
