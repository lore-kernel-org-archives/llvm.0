Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32B936AF2
	for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 09:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711617510; cv=none; b=cV+WzKYgNmNT/sr32eUFUTqb6WAvm6iZMJzc5myGB4RjPOP34YjDmgVccjAAIFT21M1rPdMA+llNyOREHxxhbDuXlSBH3GFIvr16Lfh64QbKtiGLiu72OHXuB7jDJPezCH0HqJK2Kt4rex14EFwwvK19f6+RZ6YcLTuApt3At0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711617510; c=relaxed/simple;
	bh=JdlPi/D8q9gRz0rC7iT/EQjBcreVsogwectsXFf1ljg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ezkXJAHzcph3u4oy9SUJE3nROmpEeMxBnQtjsY/aiJIqHnhvV0KeK+RHrGMzv3Nn4lEj5r0cUB2dh7NYvO5CWUtCdRECDpBx2bE36Cx9dzVVA/mvDI3nJnr5+/K61BzAItpwu1MKmLsHMCnLaf+B6g+5bNZ3XbTCr7Snv19LqPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eI0MZyiB; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eI0MZyiB"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dcc80d6006aso675857276.0
        for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 02:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711617508; x=1712222308; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdlPi/D8q9gRz0rC7iT/EQjBcreVsogwectsXFf1ljg=;
        b=eI0MZyiBbEAEaOC9hRS5RdubHRBuSzcY4YhEqkIIZGLNjSUoqaIVxP5lYB0pSKp055
         1uXCS72HFFxshwDVr6h6mAA0+kX8rk6/Fq/Qds9arbhg3FUVW7crSH858kyjxDBMHDMK
         QTO2vsb1ZS3dIGrNDn5LIsjtftPSfyvIYrDauJIVFCpTt1rNjk4xBHS0+qCKf8Y4QTxr
         lAUXFQRj5HgKojl33359EqCnTAdxjBoWkBeDUPKUtNPT4YfZtUum6b2YYDTp/b2RYCIj
         bLLk9BOLJJlJjFZocVmHAp6QrhopnJmgXUudvj50si+akZxTYuNRC+/w0RrymYCQLX7W
         a0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711617508; x=1712222308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JdlPi/D8q9gRz0rC7iT/EQjBcreVsogwectsXFf1ljg=;
        b=gKmeJZvX2s6EXGXpuE5J3Z82XW3efCg7T8M29Sxf44TdTdHHylKD2kfRraSyz0RZ60
         UyRYBtD5P3M/6nm/IgPICmP6vqHw8IwmH0clFSmFXVSiQN0fGKi7xbB5dBEhzAlnFskL
         DUSJXRoW0yFdmDMh3FJMeUCe9SDcVala7zq00WhSAazJ+8Lt6D9JJBOng/2tBEfM8426
         GQ4Blg2lVFXo9+4FSGVGwyE0NFjtKdjoKXGGDjMrHx1VvQ/A/XtBAedSqBFkrlOEtqPq
         NTA13Tgc7kMSNkNSlRg/CpvTQpqttKMXQ2wgyyBfkPo17xJ6NlT05WmS4d60dK4LVdV7
         duPw==
X-Forwarded-Encrypted: i=1; AJvYcCVYuY7+q6kKNty8HG+UV/YKhQl7c8f1Mx3kvYjO1Li8jTDpCwXaMO0cFfna27ROzsfcSpQcNQKsiEAGLAeWunT2mm1eyw==
X-Gm-Message-State: AOJu0YwTEVVTSLnBR47v3GCkw3tO4HZE54RJahq52t7lSSk4jfEQudHX
	2CqaGaDW/XCqPc4R66+UMNbw/Jl59wyTYQvQYG5Wx0JoDem/mYdamWTRMY1GPdQ49OCZ5CmXQ1E
	P2RWJZo2wnkST/dz/VptEUfMZD8mzGNMGknwVhg==
X-Google-Smtp-Source: AGHT+IHUYiXsFEyaSrFSbE/Sr9EQQEbq6LIDEHkAK2tUEMiEJLOv+Yp1LaCp4ieBZ7Wds5RI7onQUIkumjvsdiSFxmI=
X-Received: by 2002:a25:9091:0:b0:dca:e4fd:b6d6 with SMTP id
 t17-20020a259091000000b00dcae4fdb6d6mr2028363ybl.61.1711617507999; Thu, 28
 Mar 2024 02:18:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240326144741.3094687-1-arnd@kernel.org> <20240326144741.3094687-2-arnd@kernel.org>
In-Reply-To: <20240326144741.3094687-2-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Mar 2024 10:18:17 +0100
Message-ID: <CACRpkdbSsgzzwkTLTBvyc6JRVrAuVF=iFVQX7RZFJw5UyGuwyQ@mail.gmail.com>
Subject: Re: [PATCH 01/12] kbuild: make -Woverride-init warnings more consistent
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Harry Wentland <harry.wentland@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	Oded Gabbay <ogabbay@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-mm@kvack.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2024 at 3:49=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The -Woverride-init warn about code that may be intentional or not,
> but the inintentional ones tend to be real bugs, so there is a bit of
> disagreement on whether this warning option should be enabled by default
> and we have multiple settings in scripts/Makefile.extrawarn as well as
> individual subsystems.
>
> Older versions of clang only supported -Wno-initializer-overrides with
> the same meaning as gcc's -Woverride-init, though all supported versions
> now work with both. Because of this difference, an earlier cleanup of
> mine accidentally turned the clang warning off for W=3D1 builds and only
> left it on for W=3D2, while it's still enabled for gcc with W=3D1.
>
> There is also one driver that only turns the warning off for newer
> versions of gcc but not other compilers, and some but not all the
> Makefiles still use a cc-disable-warning conditional that is no
> longer needed with supported compilers here.
>
> Address all of the above by removing the special cases for clang
> and always turning the warning off unconditionally where it got
> in the way, using the syntax that is supported by both compilers.
>
> Fixes: 2cd3271b7a31 ("kbuild: avoid duplicate warning options")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Neat!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
