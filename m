Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800B736606B
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 13:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896852; cv=pass; b=rLVocuRFBSnxF71Q25R6x0ypum88nqGE7Q3QBFagvahM6YR3DxVgZUMUBtbW8ioJ2DZ4sN+UM7DxNj4l0DIRkMYSMzFBW45M27bBxqdLaSWWvDQrssqAWc6+lomI6qGLLOWnMI5UFSufv7RbV92borcjhvDe56qvwiYZ6wxCwVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896852; c=relaxed/simple;
	bh=6TiVNxxeDpdSAagBOty9+KDqgyZClTo7hXYVmhdgD4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LmApGRU25ITacP8ZTCR8QaIwkW6q2wHGH8/wjkK3GDSwEMaHPqc4rsacPZGygcoEnIHJ/E4rvtmN7TUgnd0gsTx58aAxbL2AEUlMsn78yrs+fhm51rUoEvrLZfYnU6PoK15UYExkyGI0Xn3m/J1oxlWZRJLL3J8yAvalPyxduqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kcm+rK0Y; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kcm+rK0Y"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-676804a3a22so2330351d50.1
        for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 06:07:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791896849; cv=none;
        d=google.com; s=arc-20260327;
        b=iBPZlUerL49Tp1307lOOPJHXqsnBF3NKwwDRscBJcBbHom3zld8K2IEnGMcV7f/VE9
         Wqxk0NMJf9Ze7LlB9BZnZfZZqa0FQojjLo41/YJmWiCuRX3ZLvNYYGkAWcxB4hCP11gW
         bXaptCXP5S2ilfYI6lMCRTaM7Um2hI/wpiP4mhF3jPQpBJkXnCQxplkFsYxJp0DeMfaN
         rOIJL0QXvgcTKbTaostpXdY8/j2j8KSFZ2nkpiItuZ4hIm0UQ9/E7l7Wd8Qg+kEXJl1h
         gyKafk7oqpTbJGocoWKIh29cIGKdydaMeuEAAudl0plfP1oVB58nyhc2z3tDXoeDK0hk
         RcMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0ncwg+itbdhvll8NWmaHzhsCbDAbH6eG1xlYXFmq6Oc=;
        fh=6rWnJNBeCVF4lIlk2xLThlrl3y5wkePmOj/xsMLkjNI=;
        b=EDcDHYmGoXPx646n6O/SS+TIhU8Gxs/Gz4cIR1RzhYTqgC8xv/nK9hhD/6yss610aH
         etbLwpmnAZTYhoVtA+1JiWrJeDQguVxAT6FCfcTTwMlREf9DmpKf3YtiAvY/NSGVqd4P
         FaaZ7bA8SrCpMw3M1OTFFP4kKE93rxUYxDk2SR941CNNjABYLm88wOy2RQYwM1rGEmM8
         Ut0xBCupAIx+yt3Hb7W+/or0R5eGz2q53q29RjvYIp/qt8jdEbBSEs0f101X9pWa6kDu
         mD1A0D0Ve8M8VjRfhGjKwcHaHfB3xZucbwEd8+SnxMdTbss01ubeFNl75eHXX1EeHVCX
         +o9g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791896849; x=1792501649; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ncwg+itbdhvll8NWmaHzhsCbDAbH6eG1xlYXFmq6Oc=;
        b=Kcm+rK0YLowKrUwbDwgHAj1IsANBg2I0T2E7rRrLtjpVnjmUJyjaKPEzt6xNcoX1ap
         y01R4QrTYJtuYzXcJg21vUZdM+xLPCZaB8MWnSE77H2Srzvr9IxM+K573HYicP22veE3
         HBIDLBYZazuO1A/zaju2oWHGvNmOZS+gRYNSxFbAQ59qBDacj9Kb0G/LewZlUP9a+nxs
         D+mfUOxTSYQcNxsXA5TsOOwuQDpuvDkYB99xnAOIiygwP87KSUFRUw6Lj7yiE4WgpRsw
         BzQH8Qw19lxi+EU3qkaNiv2MWgKTU/TCeBystD7rXGA9Eh4OrXQgYh1/KCnzbIVhu3vR
         nMmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896849; x=1792501649;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0ncwg+itbdhvll8NWmaHzhsCbDAbH6eG1xlYXFmq6Oc=;
        b=aKBsX34Aod0SEje1FPiR7BibwT4vGqCuTfeezMNS3NDwIgUY4qCMHqOG0gmY68/fBU
         dz5uFY206w+XgmmHAuDsDlQ/50fG921ZtJW6vBEkx/uD4/I20aSC5hL0uhOwsBBrroV3
         pWXx2pxNZQSfbToThj9cnLrhkA8FhlUPaAy9kPObZ9QdrDJsuyw4Jdma08+SBJIwHuHb
         UB6CDnR/bZEUJil0ak56Yum/6zh/lD5pMLrPqw74OD1P4gft5cBRnizYp7uKJOkSj3Op
         //iFjg0U1LWNn9DX1OowtVwt2yES7vxk4dvB8s5tjso4mY/hJJvP06pyifiiqBC18JSl
         Rfyg==
X-Forwarded-Encrypted: i=1; AKwUvBzFQilWhwjlo/boVIlo2dh9UhXQwehyFxVsf3mSSg9Rbc7POe/6nGDe+7MNPQ3qKiirmQtz@lists.linux.dev
X-Gm-Message-State: AFq9FYJz+q1UNc8ajz0iKdZohYPnGLcwmVUswKdEBvqLED6aUHNM2K0z
	vkzunDJbD543tBVdzr8ILxQrrUAET/n9wcDZRxkCRzwxDlU1MamT9Pj9OKwRud8rQQwc1q8qJlb
	hzp2BHHALlsgTzb+qwsEHjX++JbUB3Ek=
X-Gm-Gg: AYBFou03pEVQ6GQ/Cd9KZdg4WCwW/wnQdGdIkuQfhX6D5RPpr/qIhHkMRhjlZmxfgji
	kOB8DFF6+toB0ctYGe3JJevgvuqIrBIehWzvn3n2OrA+urQWaE9s9ps8GrGPoU2IO5YUuKpT+hE
	GBIn3IrNwlmXUO0rcuwJeHLovpY+Vlc91prhHp+BnuwcOPxELZXQIc3DAH+tEcrx+MWNj5HENW6
	0j62mjieGZ/GToy/9tsD+Is51cJDmg2WC+J8MRQBsuatID8bNs3P8RSWk0WX6iv42XEUrq+SmIw
	+K3QvB1C2b6IPVLE8fmbI2pXFRP3XfhqZuamWCfZcex/FvIN9FIftmpaLCV1FkN7tHnL0MF0VyM
	Z5AUS7l/6
X-Received: by 2002:a53:ac90:0:b0:677:aa92:7596 with SMTP id
 956f58d0204a3-679362b5a2amr4638672d50.67.1791896849528; Tue, 13 Oct 2026
 06:07:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261007-b4-landlock-fix-domain-fortify-panic-v1-1-042e9108f5f8@oss.qualcomm.com>
 <CAKwvOd=nPgEm=AZbEu12Eb90GtRUThY6YAjSiHHuNVHP8TZHwg@mail.gmail.com>
 <66usntltyie7ii2rrqajy3izxrvwubwf2vqnery552v3akhwo2@xwb4t76d37wx>
 <CAKwvOd=E7wgGPf+kgOY8sGi0xO-cFMAJK4PMBFknoEupJi1CXw@mail.gmail.com>
 <20261009204554.GA778522@ax162> <EF8E7F67-39BF-4382-AB18-98E9D6111CA5@kernel.org>
 <CAJJ9bXzLgzZG+836_2+pUVOWzndSFNoOh8Xu8Pw++_i1RMJzOg@mail.gmail.com> <20261011.Veiquevah3oh@digikod.net>
In-Reply-To: <20261011.Veiquevah3oh@digikod.net>
From: Michael Bommarito <michael.bommarito@gmail.com>
Date: Tue, 13 Oct 2026 09:07:17 -0400
X-Gm-Features: AclHuK-jtD50bA_uKkhScngguvSwky5SkR9YZhcx-GIvRlFpZZ6iWS7kxU1PPVI
Message-ID: <CAJJ9bXwBo2hqcov46pLykJcdWp_fO8r7bXcDEw7JdZjWVkRxaw@mail.gmail.com>
Subject: Re: [PATCH] landlock: Move the domain layer counter out of the
 anonymous union
To: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Bill Wendling <morbo@google.com>, Tingmao Wang <m@maowtm.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Justin Stitt <justinstitt@google.com>, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

mic@digikod.net> wrote:
> Thanks everyone!  We also received another minimal patch that I rebased
> and applied.  See the final commit:
> https://git.kernel.org/mic/c/3d8cc52db2f86b624308321c58513019f6b21eec

2x FYI

1. I boot-tested the clang PR in [1] and confirmed it fixes the issue
on rc5 and rc6 before your patch

2. I boot-tested rc7 after the pull on clang 20 and confirmed we're
good on this side too

Thanks!

[1] https://github.com/llvm/llvm-project/pull/228309
