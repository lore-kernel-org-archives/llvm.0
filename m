Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5283C3C00
	for <llvm@lists.linux.dev>; Mon, 30 Mar 2026 12:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774873169; cv=none; b=fkZpkkNtHdXlgYquzlfBx/RJDOR5fgtJjUJ4WZYKBh9inlC3BzLsUFwetXFP2WBYiPxSei75TAwFHwb3u6mVv6i/Rm/3diaKmrxuSqOdev3rLgSQxGHa0HV69a9ffr//z8zwF+bh3OudzqA/0/OeD5iBLkVN8Ew4kWWCTcPWzow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774873169; c=relaxed/simple;
	bh=2rXXQOn1CT95XJRYsLVMHI/ld1K4Welj8OsJ3LafH9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YX6dnjh67giTopJBaKiaUStHwBFJJIGvq+OYxFCDevpbT79dnsQYJ+G4GpY/rZJBKaDLAzMhFmYBoR/x+/r5PRmDJ9hXt5IU1REMiMx7ZsvFuTtIzjXu7JWtSRTcTfTLpyGu7lXIrUNhr+08AsNu5XHENQqX/miA0Gfn9kEym/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ba0W6mhu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ba0W6mhu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4513FC2BCB3
	for <llvm@lists.linux.dev>; Mon, 30 Mar 2026 12:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774873169;
	bh=2rXXQOn1CT95XJRYsLVMHI/ld1K4Welj8OsJ3LafH9U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ba0W6mhuGjUJ0ysCRk/IKMDD3lY2J3LXi54kHI0U9+3GMk1dCKK54LsEVVBsMyFsg
	 JoiRgv6OGVExx538wWWAkqzi31dXu9jGFcfblqom9SdVhdn+t+CN1dh/LM+FYgl+LU
	 K1FWIu2gAP3VenUJOPN5lDsLrIKgFp9ewGthKbPdnnUxd/45lsrVsx40QMu5XLAVtg
	 c7aCIS3zRlHWTe/b21/1UL+sjAoB98MGmqK+NZyJmxCz4YFCPunedSGrnPVXEOlGU+
	 Yf3RnX4XoCgRRjmpS0AvIBirlrsTss5cW2akscqvneqZeZL0MsaPHYrWvBGpoVa34V
	 VvP9TZi2+vRxA==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-66bfbf74778so792214a12.2
        for <llvm@lists.linux.dev>; Mon, 30 Mar 2026 05:19:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVccvrn0Oop+whd6t1SOKGwKixjCxoBazsVuOAJtsDttqVL3gnahPNCTINPyQlq5cJG+nqf@lists.linux.dev
X-Gm-Message-State: AOJu0YymICLgoYhMg0a/Is8aydPAW6l1GZKZn+JXaKWYTJ1eA/8e8ysO
	wNXtW65yfALSDcpgwCTQpXlt7fEd1XNuAH0dbdlmKk7Qlyr7mn2MnSYI90BVLts8cRwoLOdR2d5
	rvlGAfk1XP6kXojwNHf5JxmMNkloGPA==
X-Received: by 2002:a05:6402:504a:b0:66a:1744:5cad with SMTP id
 4fb4d7f45d1cf-66b2826a13amr5745113a12.1.1774873167844; Mon, 30 Mar 2026
 05:19:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260327-dtc-drop-dts_version-v1-1-41066690aefd@kernel.org>
In-Reply-To: <20260327-dtc-drop-dts_version-v1-1-41066690aefd@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 30 Mar 2026 07:19:16 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+r6DvXMoJ+qPOLJvosrgbyOVjw8nn453wUi7bXQOZNog@mail.gmail.com>
X-Gm-Features: AQROBzBz2IeGCM6mQ1hZFa5xz3FxJw84PrspF04V9czNebADRaW_B-TJd2hJo1Y
Message-ID: <CAL_Jsq+r6DvXMoJ+qPOLJvosrgbyOVjw8nn453wUi7bXQOZNog@mail.gmail.com>
Subject: Re: [PATCH] scripts/dtc: Remove unused dts_version in dtc-lexer.l
To: Nathan Chancellor <nathan@kernel.org>
Cc: Saravana Kannan <saravanak@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 4:39=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> A recent strengthening of -Wunused-but-set-variable (enabled with -Wall)
> in clang under a new subwarning, -Wunused-but-set-global, points out an
> unused static global variable in dtc-lexer.lex.c (compiled from
> dtc-lexer.l):
>
>   scripts/dtc/dtc-lexer.lex.c:641:12: warning: variable 'dts_version' set=
 but not used [-Wunused-but-set-global]
>     641 | static int dts_version =3D 1;
>         |            ^
>
> This variable has been unused since commit 658f29a51e98 ("of/flattree:
> Update dtc to current mainline."). Remove it to clear up the warning.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> This is commit 53373d1 ("dtc: Remove unused dts_version in dtc-lexer.l")
> in upstream dtc. I sent it separately to make it easier to backport to
> stable, along with updating the warning and hash to match the kernel's
> version.
> ---
>  scripts/dtc/dtc-lexer.l | 3 ---
>  1 file changed, 3 deletions(-)

We don't take changes to dtc as we just sync with the upstream copy. I
saw you already submitted this upstream, so I will do a sync to pull
this in.

Rob
