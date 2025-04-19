Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5388C1DE8AD
	for <llvm@lists.linux.dev>; Sat, 19 Apr 2025 15:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745075589; cv=none; b=Cq3PoClZAu+s6DVsYVP4m8Sl0G4vkpxL2cMr16iBjJtafXNuNjcpc+wXOpUBEpupiZreRvaPJqXK07fmOLuOsHsUwmkAoeCi5VeX/cY0pr9m7wyP1BJIlHb16o5zqDAQcNnGQoHA4icYu3S5mxLBYSqTmeFHWbfdNx61uiMri/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745075589; c=relaxed/simple;
	bh=95RxpmpZ0giF/7gyYSSGqss0+oqI6G9c5XkJIKhzNbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L9aPwipiGiI/vXbtz/YjuGlnfc/ewR1YdTY/Ec+H6gbIbSlvWv0DY6hi8b3nojuz8dZz+Y9ygr8ipG1h1Xv29LUJL7gUNKl83CxCQFeWR1vlpo8955Zjrap0SZJUBNBTibTPpmPyMBK4n/gq3SXqtXZMH+uOsEaVrYM/LSLQDEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICqoKv7T; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICqoKv7T"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22409402574so5945645ad.1
        for <llvm@lists.linux.dev>; Sat, 19 Apr 2025 08:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745075587; x=1745680387; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95RxpmpZ0giF/7gyYSSGqss0+oqI6G9c5XkJIKhzNbY=;
        b=ICqoKv7T3EjWctdBATsC0/b//8Whnw5DgLKJyUTfFOtjMKHUU/s5dii07aLW6LsIoS
         By9pvvrHhv+mrb4OQGP1UK4UHEPsKmkCCaE1jJhEepoynD5Fxb9zDDsVjKwvcJBMnVXr
         UQ32B4GwUPqjHTuAQpvGZk6eCG6HgdCc7UshxtJXt33xpeVzdg8tk7VTs+twwX0B+7PB
         QNABivBEJAgNDIIHU9zqRVs7wg3uJNgn5zjcxuhA3GkAfFuFgOwzcz7jpNLIDxknRpOa
         opXPQm4Cta9+R4Ga6iM07h++ZANXNrgfIxLhu3rMfAwwOgUBPpMUPf1aXvjaUIfV+dYs
         XkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745075587; x=1745680387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=95RxpmpZ0giF/7gyYSSGqss0+oqI6G9c5XkJIKhzNbY=;
        b=Wkmj4BGlrcUcdpRd5O0/orZRmn0JWsRU1Fx8878Kib2SYYEB1lZi3Uk8lMHL8cqC9Q
         3Gq7NqurYUrAl9gQa+ACjx3WYjQZ6bFP1cmYAQOaOWugFdHkCXK7DzGObxzPlkN55iGa
         tNHqW3lr3NXKP1/CkX+Nx9L6EE6gozMBNeP4z3Ov/yWOwLMcnzknKPjMjxi2hZl+G55z
         YC79MoAOSZ9+KWu6g1ggMiKqGXNkvq2Z1q/G9WJe7Dr25x9wjyQOHFkYuTOJ4ACdhjru
         xHxEjRtxlh4KcK4BC/MEzsV+dNbXObALADX+IVCIjGZqRNX7Fuu2VKS6qA8UGCA4IkjC
         1Erg==
X-Gm-Message-State: AOJu0YyltS6WqphXWqD+NQF+RdjLYqfxp1rs+E956q/Z+HJEDMjEViu1
	cb1gyMXGlj82NYObbDvfwF6PxSEO2wUBvaI2ZkHrqbb4TGCF6bV5sLdlUXZ8aHtUWn1oYp0GUH8
	fmblbYQPnLqXgK97uRZxQhGRSvCb4NJBO
X-Gm-Gg: ASbGnctdtRvt8VByyTJsztheyAb6e/4Mfpg43HNMpyzvQzd1a7Ffjudszds6BcntX2g
	CSnGhp/dkGngnstsdvXD4GnkgFP2JH6AxBK7f/23alveSxmj1m8kgrsGuL0GWRzrd3+fTPUYVXe
	Atm5jgxLpswIB5m8cNqSygWw==
X-Google-Smtp-Source: AGHT+IEziLt307ihN5LVVyeSbDFr816gjqy53DnGLHHyJOodnymWcmrvNitHbDubfK4aK+vSvo7eL5S3q9JwbdsKoNA=
X-Received: by 2002:a17:902:ebc1:b0:220:cddb:5918 with SMTP id
 d9443c01a7336-22c5369584dmr34839785ad.9.1745075587505; Sat, 19 Apr 2025
 08:13:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250319154242.GA3599324@ax162>
In-Reply-To: <20250319154242.GA3599324@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 19 Apr 2025 17:12:54 +0200
X-Gm-Features: ATxdqUHoIooJrqPQXObre4cvfndlLjskZS1LWvvU2Gg-V5rp8n6pzclKvjsos40
Message-ID: <CANiq72=MZrMOmTq4CcTt9U+HHFOMNghOYO-rQ=YYMuWyaDG-9A@mail.gmail.com>
Subject: Re: Prebuilt LLVM 20.1.1 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 4:42=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I have built and uploaded LLVM 20.1.1 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 20.x
> series is no longer supported.

Build-tested with a native defconfig+Rust x86_64 build -- thanks!

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
