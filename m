Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620AD4778C
	for <llvm@lists.linux.dev>; Mon,  8 Jul 2024 22:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720477336; cv=none; b=ZUMvtIxjC2TORYVohlaT0m/FtVSmOQSIEsYRY076OxzHv8kkgSd2SkWzfd80s4NQRmo7qhc1OrK1o0DsRS5SsaivcIJi4vn8O+PnINKsXDmz+4cBKbZdsnOsS+9czeyjxHd9fyBkcS3yfLYDPXlTSrNPG7dOioW/BEcv/jYMQc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720477336; c=relaxed/simple;
	bh=/klr4pal0zQ+qkbOyt3Sy9bpPlhmD8yV7byDM6Ourbw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VV+I8Aua1Tzz4tUi2QaNdg2M2uE2KAqnqjSEB/N5y7tNDJY2UTCFmtPA41D3Rlwzl4brQG3PJ/OI/vkAvBJ9mn3WkpnUc2e1i5MalFR3+OVGCWkpt+9o9lo37qaDHN73EQyfJlUGJtHDfebFHmfWFBhpiGFs0kh/kCIUfuMmfQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AprJms0U; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AprJms0U"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2eeb2d60efbso6592681fa.1
        for <llvm@lists.linux.dev>; Mon, 08 Jul 2024 15:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720477332; x=1721082132; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/klr4pal0zQ+qkbOyt3Sy9bpPlhmD8yV7byDM6Ourbw=;
        b=AprJms0U3TkZGROUU+9PCC0WJ/JUaXX8PxSlY6CdTVwngh6bL9euIqwIozTrHAkHDA
         W1P6YPY1h+muatN8o65/OmcY95PUqLz/ED5gHzZxLDpuAhM7zq8uULUxHD1l3dWJN+f4
         dBCaRxxzmRb6SbrMWzbSf0/4Vq6AdQFPlMLHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720477332; x=1721082132;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/klr4pal0zQ+qkbOyt3Sy9bpPlhmD8yV7byDM6Ourbw=;
        b=RcgWfW1M9kjgTuOGoWNZelKWiiT1zRP+LpKJXIbnRy9fCn+3ILzq+FKG+Iqd8fE+PG
         Lt5pt5R6kFOFH/E8LriOET2DV50/4ipXKMRpqz3RCbHYINK5egXCcszTRAyao4YWYxT1
         x9lU84RyNh9h4AwkdgVeg20XrxaXnjKrQfpG7TmBqNaP1FK+ThvDREYMjTwosiqKSDgy
         kNIb40Xpsyp9FpMGXCJKHykzL5YeqfBufNweAYOhCcLeqS6tA+mzk194C0EeOZlbFBbd
         38+ve3WysJGXfsGqZsGv0B8FMdO6bWC5WdBTsghjj20wBrVUMvCdfzU904LoO8PF41CE
         CcqA==
X-Gm-Message-State: AOJu0Yw+yZ7pfExtfucMuFsJTsIQsJ3MBr7X6Fa979OMLkKZbBdSiTo0
	zXp5MovQZxH+csUW9Uq7/4fati3ypP+wEMMbKuuNQzgbBxAxFcfBS6vnSjBLzEw=
X-Google-Smtp-Source: AGHT+IFII0Z4k5zO4+WVg6UOmIJTwUe1aRNvrkRm8kXkSN7SHLYkIk+Hq6VsR3UW4MiC3Amoj70LAw==
X-Received: by 2002:a2e:9807:0:b0:2ee:7b93:5209 with SMTP id 38308e7fff4ca-2eeb318ab22mr4721111fa.45.1720477331537;
        Mon, 08 Jul 2024 15:22:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6c1e:b1f8:4156:8a30? ([2001:8b0:aba:5f3c:6c1e:b1f8:4156:8a30])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2eeb3488b35sm527791fa.128.2024.07.08.15.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 15:22:11 -0700 (PDT)
Message-ID: <141a4ba7c3645594de636985d3300f3914a160f1.camel@linuxfoundation.org>
Subject: Re: [Automated-testing] Plumbers Testing MC potential topic:
 specialised toolchains
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: gtucker@gtucker.io, Nick Desaulniers <ndesaulniers@google.com>, Miguel
 Ojeda <ojeda@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, rust-for-linux@vger.kernel.org,
 yurinnick@meta.com,  bpf@vger.kernel.org, Sasha Levin <sashal@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>,
 automated-testing@lists.yoctoproject.org
Date: Mon, 08 Jul 2024 23:22:09 +0100
In-Reply-To: <f80acb84-1d98-44d3-84b7-d976de77d8ce@gtucker.io>
References: <f80acb84-1d98-44d3-84b7-d976de77d8ce@gtucker.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2024-07-09 at 00:10 +0200, Guillaume Tucker via
lists.yoctoproject.org wrote:
> Based on these assumptions, the issue is about reproducibility -
> yet alone setting up a toolchain that can build the code at all.
> For an automated system to cover these use-cases, or for any
> developer wanting to work on these particular areas of the
> kernel, having the ability to reliably build it in a reproducible
> way using a reference toolchain adds a lot of value.=C2=A0 It means
> better quality control, less scope for errors and unexpected
> behaviour with different code paths being executed or built
> differently.
>=20
> The current state of the art are the kernel.org toolchains:
>=20
> =C2=A0 https://mirrors.edge.kernel.org/pub/tools/
>=20
> These are for LLVM and cross-compilers, and they already solve a
> large part of the issue described above.=C2=A0 However, they don't
> include Rust (yet), and all the dependencies need to be installed
> manually which can have a significant impact on the build
> result (gcc, binutils...).=C2=A0 One step further are the Linaro
> TuxMake Docker images[2] which got some very recent blog
> coverage[3].=C2=A0 The issues then are that not all the toolchains are
> necessarily available in Docker images, they're tailored to
> TuxMake use-cases, and I'm not sure to which extent upstream
> kernel maintainers rely on them.
>=20
>=20
> Now, I might have missed some other important aspects so please
> correct me if this reasoning seems flawed in any way.=C2=A0 I have
> however seen how hard it can be for automated systems to build
> kernels correctly and in a way that developers can reproduce, so
> this is no trivial issue.=C2=A0 Then for the Testing MC, I would be
> very interested to hear whether people feel it would be
> beneficial to work towards a more exhaustive solution supported
> upstream: kernel.org Docker images or something close such as
> Dockerfiles in Git or another type of images with all the
> dependencies included.=C2=A0 How does that sound?

Sadly I can't be at plumbers however I wanted to mention that Yocto
Project's SDKs are effectively standalone toolchains. They can be
configured to contain all their dependencies and whatever tools are
desirable (e.g. git, python etc.), are fully reproducible, installable
at any location and we have working rust compilers in the SDKs if
configured to include them.

I just want to make sure people know that capability exists!

Cheers,

Richard

