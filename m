Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35D95FEF6
	for <llvm@lists.linux.dev>; Mon, 29 Jan 2024 11:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706528661; cv=none; b=PhZBSczWjHSne0GidNzeov53pbmjFs660yQdb2eJ3CDjTxyOI0lV/la4BNYsbEDYS08RYsFA2znAjMNDs2IVuLFnL4BXMoXJllatbhLm6VZlf2f7UjTBK0T9ojZLH9MeSKAmF9QNZn30AiJ6f/zrd6Px+YEuLVm6d/oEdWBlx68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706528661; c=relaxed/simple;
	bh=GTmT3izF5A9NQFyF/tTpYHSXEN4Pw4/nOqFT4TqxOIU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Wk8TW9Gf2KSSRy54xrvu7j0//9EfUiEV2jpElC9FZxvo42LVk8d4vMeY7r0iKWUapWdwzJulBtzjWmN9O0qy64lrgKtJa00Pa9scDfDTLaKhDS895ZoxBunXZdGWn/wluUpgNB/0h6yUhIp1y2p+J5TllDndVcD0REy12KMD4pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KhCwgTR4; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KhCwgTR4"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51030667cedso2527506e87.3
        for <llvm@lists.linux.dev>; Mon, 29 Jan 2024 03:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706528653; x=1707133453; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GTmT3izF5A9NQFyF/tTpYHSXEN4Pw4/nOqFT4TqxOIU=;
        b=KhCwgTR4+iq+DD4wcSEntoIUb8qpjpzjGci4NSePJ2uTn2qrdv9FW2GNou6Q3eBzOb
         Luum5lG2nK9hj1c3skk/fvxmS1cDvuhnQBiP1dw6ZvOsJBfz6mt2/d+NcFjqGe5rqz4x
         RSvLvnCErCBflzO5t6r+paQbmpcKuUajoOp0kB3jAMAAWmpKREiUBiHm9YKRbVGQTKOD
         qa99kCa6ubR8EeQwBztQjy1APEmWaxu22UnP17vCBUDOPnLct4BPvjtFEzZDYCmuL3KU
         UiZ11bpxuA8qbAdFv5dJHqw+O5e+2Lu6JGv/Ed9V7aaMPgShX8ji8jbuO1+bg7srbS7e
         0q8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706528653; x=1707133453;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GTmT3izF5A9NQFyF/tTpYHSXEN4Pw4/nOqFT4TqxOIU=;
        b=BrkMn4p1y3jIFNiO//UgWvwwhFyiCTxIjuxClG6WZAoZ3lGdr3iQV0ORt86Zsfz4zS
         tMP6uUAAbxjeQ5t2G2y/IeFI9H2/KD97NTv4WNT6wyPyvsy/ITHVzsP+FptcGjzyGG6P
         plsC+zOfdct2oTvTZ2LyiTU++FLij1s8VCA1FoaUfZByBF1RpvomuGETc8XPMpJ/vTzU
         sE0vzBTEgTKaVuHZLQexicmsXtfnHKCbjRI7iVx5tIIkLcQph40TEhxGQcmNu10ZvNOC
         venXPLI/o2RqDSVIqHIfeELqVGk0xEKKsK8Z0eLGXh42XPFdT0+j0BJo00PbTB5sEU89
         PT4A==
X-Gm-Message-State: AOJu0Yz9qWGb+vI8gQdF46jFvwn9FCj4+xwHqXar53BD8HfWwEsVHeYr
	1LXZoL4yM+qqZTt6ODHy9/l6/KCHuiwq9p+RPn/mRGbAyWzkM30ArPkjYJK1xj6AbxBVowqnZ5s
	AyvVCivMOJAylwIidkIO+x6wmxGQ=
X-Google-Smtp-Source: AGHT+IHbkBlQrs88YiFmlt6zvD8tSmuuHI73I9NhtyVdIesRqscxOPyu1ZsARpEIbV/FuyDCPLjuygJQYwRPv3MZrk8=
X-Received: by 2002:a05:6512:214c:b0:510:11f4:6741 with SMTP id
 s12-20020a056512214c00b0051011f46741mr3001895lfr.17.1706528652846; Mon, 29
 Jan 2024 03:44:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Mon, 29 Jan 2024 12:43:36 +0100
Message-ID: <CA+icZUW0GvM1+A3NKDYRrWhW+eXZj7s0uksR75FMCChkAqp_2A@mail.gmail.com>
Subject: CBL issue 1984 - AMD64 segfault during LTO building linux-6.7.0 with clang-17.0.6
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

With upcoming Linux v6.7.3 I wanted to jump into building
clang-thinlto / clang-kcfi kernels again.

How severe is the bug in #1984?
Only hitable with special kbuild settings?

Nathan, can you provide a 17.0.x LLVM toolchain with [3] applied?
Maybe in [4] - in an unofficial sub-folder?
AFAICS, there will be no v17.0.7.

Thanks.

Best regards,
-Sedat-

[1] https://github.com/ClangBuiltLinux/linux/issues/1984
[2] https://github.com/llvm/llvm-project/issues/78732
[3] https://github.com/llvm/llvm-project/commit/f800c1f3b207e7bcdc8b4c7192928d9a078242a0
[4] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/kbuild/llvm.rst#n203
