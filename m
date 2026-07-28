Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56CB4746D2
	for <llvm@lists.linux.dev>; Tue, 28 Jul 2026 22:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785276522; cv=pass; b=oHSlQyYU39jDdsU4LR6DQluZOvN8KaD39O3vv+F34xdg8ae54hcCXWfchAvbRDDOEVWYf3G9hnmYhNVX7Wo2/0dlqVFpmHGPeKKudUWsl5uFsRvUWW0xZZxJUYTUQVgmcwrI7Odkz6djRhkZsIAgESIwYsyCnwS/4YGPq0gXanQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785276522; c=relaxed/simple;
	bh=66ex1fs8TchlYXvZh55rJ2lAIestaqS7kMHXiK1SnyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CY+pEdQfPI0GNw8dEZ1Eg92Ti1iBe7Ui95SJfznCGhFDicdquBRRWoA12gJcN5NrqJ/ythy/WHo/O3Y8Gs01PrrFiDmVGetRFMg6L+aoHuN5IvrdIJGscvbO9c6nqdg6E9R/F6nlNrEsEbpx3J+WeRgYjJgELc1W6R3NRSK6aow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rWAH8AhD; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rWAH8AhD"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-69eae037da1so391034a12.3
        for <llvm@lists.linux.dev>; Tue, 28 Jul 2026 15:08:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785276516; cv=none;
        d=google.com; s=arc-20260327;
        b=aZKUydyoj3tdOu+Cz6ms4Lse1t5hrlbyxaMCxjakxKSq0+1F2qy6sfCu5UUsM/JJEY
         sxbydABrT3rTOXLTZVMVbKOj6P8QSd/QswJ0EwLFaTUoqg2GnyTXSTqhg3AyV2pOovD5
         nNsuLxSVrHj4jZ5cX3x/5WUGHsIQ1IK6QwiCbn6YQlP/mAzGwkhb0c/azgG4Td1RBXYI
         mGGstwpCRvCzBcwzdhi6lUwrNzIs3lg+p6tJevzj1p0OkNk3lhN1MZS1JHrLrcY6nyKw
         14jTqsQS+60w8ErwrQMCW0J3WyVLsgXry/SJBP/mixOkjEiTCWf2A1bY95RJjYSMI4JV
         Hncw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FiN+N2sya3idAsHWaRZRoY+QX7TSzFxb57yiuUePn60=;
        fh=HdITzfZLZPaqwT953tsm313YdW/9wnXX1vcBlMBe0zI=;
        b=fgeutCjokEM5UMvEXHL9tOPnne0SpD7vO43bTr40Qr/kGbSIYl0Tp684wJQlEBbSJS
         BrafcyqHt5UM0vihB5dFEHAgEvTm491R6aWZhdfELecpVFYqQemp5G6roMC0dvlBzw1X
         JsGwiFxD/e6R1nMa7y8mZzKfHtyScQWKE85mAOj36mIX/JUxzkpmgmv9RT6EBzLzLZD1
         a8nWVFWVKV1eRO3/rePPjXsGy+YaOu9CBvfK99cpymHNMEANEuQsLJ14MTaKmu57k3wa
         0yFGYJKt0NJifXncYnFUX+kbsYcR5G6SxdN6roCHYHHiqPFxhmAF9O3Jy1Zhi98bqJlh
         qhqg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785276516; x=1785881316; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FiN+N2sya3idAsHWaRZRoY+QX7TSzFxb57yiuUePn60=;
        b=rWAH8AhDe/bmfwWkhfpzWbsNukQVJ1mFQC8Q4Ww5DeW1WL1Q1GEwXs5SXloOi+AWZL
         /E6vnqnOWrMviAydw/PeLUyeN77DEm1F6HTAIv//fKidcLPuoFz/6IwpwVZv38eYrs/8
         yK7ZfXOTTBMqD+lK76/A/GFwhZD4E8KtZp6yfB3mT66Vqq1sNVNjQsy8YSQ741LNkuSl
         RigWy/ffWIaW/iTk0tdPWYeQBVc9S88D7yfeZkfFOHq8/2rw37MzOLG9t1EqzglhB9q+
         mtbSg015rdV0RRBEFLMK61apPtDqX7qlVr0YIgYx2yG48I+B4gFtr2YqDQdZdGJNV2wL
         hk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785276516; x=1785881316;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FiN+N2sya3idAsHWaRZRoY+QX7TSzFxb57yiuUePn60=;
        b=I4Uj2mV3Y4R5tUtljGy3qAIYXdYyvOKYmu4lAXaNT/og8P9RN1YK00yqwgGvHEIBav
         +9m8RvDviSVow7U3CpVnelar4UIXYJP9AcDQdrzpPpq6L6g2sI6wBfoVimZ1D9PfHyew
         WtHWEruZD1wjQwYxI4JS+rWcVPQwAV6Cg04Ilk2+LV1gkMXV5/Y4TxGnqBrzSqrQ6CFZ
         OoO0B888hDRhKVOpI9ZrKs5OJN8ZgxwWfCQnhVHmp77ZOk/6SKjyhBclvmN7FvbvAiDm
         YMT7jlCB3CeGMBeYlLvczrP5VHEBEaPeyu+NcFotPDoRgIt4deUMKI7MoxLFHsIjJqLi
         3+UQ==
X-Forwarded-Encrypted: i=1; AHgh+RpMqfy3mui2n7aKyzTVfNO7vYe9zyH1yI9eXJJ9ZB5oVs9RRy60s8FiBjibrYOIGF20J9W3@lists.linux.dev
X-Gm-Message-State: AOJu0YyR8QZlv8C+CDii7JSn3fnRKZ8bBhoH8J29Lt5SJVTriWgBWiJc
	fImLSjPYVRm65noMp/8goullSKP9m7JIUiYeYtHhhCjthMYTjxTUcuzLhHrIh+5/2hSiqmgNgG+
	9UyNJeF26uBwK3ESE4UoU5rKYLyGL83k=
X-Gm-Gg: AR+sD13jNuKtUZYAkprdL04rzTgB04iI0ANDvMeQh3h9PLi2iMVnib2GWy6nPKB4Qf/
	Et8iyAm4wNpZGNLKN6UYg5FhNFnMwKyqusNmFG3oIuoqdT97pTxZ6aTx45n3p/pNWLT2n8RLavL
	TiYvw+uWyr1614eVa6zWJ6MxJ1EVjqMAQFxVRA4nUdyyG1JyaH0wavqc0W1QREvrLnNbVUWUDd3
	s5ITTgV/ZMB9jcB0xQy0ErIxTFt+nIi3T7J9ixsOrxri2k6RkQ4DzudVQJ3OQKVe7wFSCnu7bva
	8N//8ADd/US1qzGsQNFKid7L1tR7CgmMxH018pKpW+wxxBwkPTUUOoaboQtnjbwoD36Qsge75IL
	eD3hPO1NkY+Nvj1GDFkB4NEiE/VRJnmxeF0dyqFT9LV1vHwCQk7yfZYo03FJLIc/+70HKEpVt
X-Received: by 2002:a05:6402:52c2:b0:698:a9de:16e4 with SMTP id
 4fb4d7f45d1cf-6a034a5efd8mr2250309a12.20.1785276516357; Tue, 28 Jul 2026
 15:08:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260714234609.902367-1-rosenp@gmail.com> <alhXciS9G_bGB2re@SMW015318>
 <20260719155822.GAalz0Hj3XT97KkPOk@fat_crate.local>
In-Reply-To: <20260719155822.GAalz0Hj3XT97KkPOk@fat_crate.local>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 28 Jul 2026 15:08:25 -0700
X-Gm-Features: AUfX_my55lIzgp4p1LgtC37hf3Fnv3utQEiKazUbNyOLekyaFQ7_OqDwCH_br3Y
Message-ID: <CAKxU2N-vMNR+ES2YYuJh+6XASmZ04cnFodb4kP4zRBW0mbEKaw@mail.gmail.com>
Subject: Re: [PATCH] EDAC: fsl_ddr: use devm_platform_ioremap_resource()
To: Borislav Petkov <bp@alien8.de>
Cc: Frank Li <Frank.li@oss.nxp.com>, linux-edac@vger.kernel.org, 
	Frank Li <Frank.Li@nxp.com>, Tony Luck <tony.luck@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	"open list:EDAC-FSL_DDR" <imx@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 19, 2026 at 8:58=E2=80=AFAM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Wed, Jul 15, 2026 at 11:00:50PM -0500, Frank Li wrote:
> > On Tue, Jul 14, 2026 at 04:46:09PM -0700, Rosen Penev wrote:
> > > Replace the open-coded of_address_to_resource() plus devm_request_mem=
_region()
> > > and devm_ioremap() sequence with devm_platform_ioremap_resource(), wh=
ich folds
> > > the resource lookup, region reservation and mapping into one step and=
 returns
> > > an ERR_PTR checked with IS_ERR()/PTR_ERR().
> > >
> > > Behaviorally equivalent with respect to region reservation: the drive=
r
> > > already reserved the region, so the non-overlapping reg requirement w=
as
> > > already satisfied. Drop the now-unused linux/of_address.h include.
> > >
> > > Built for arm64 (defconfig + CONFIG_EDAC_FSL_DDR) with LLVM=3D1;
> > > drivers/edac/fsl_ddr_edac.o compiles cleanly.
> > >
> > > Assisted-by: opencode:hy3-free
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > ---
> >
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> Sashiko caught a bunch of preexisting issues:
>
> https://sashiko.dev/#/patchset/20260714234609.902367-1-rosenp%40gmail.com
>
> Let's fix them first please.
The unfortunate part of that is sashiko does not understand v2 patches
and whatnot. Meaning it will always complain about things fixed in
other patches.

There's no practical way to move forward unless done piece by piece.

As an example fixing the first issue causes
 [High] Calling `ddr_out32()` in the `err` cleanup path
unconditionally dereferences unmapped I/O memory pointers if probe
fails early, leading to a kernel crash.

because these functions are split into three.

>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
