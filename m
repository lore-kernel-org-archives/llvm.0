Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7717A13BC0C
	for <llvm@lists.linux.dev>; Sun, 13 Jul 2025 17:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752428318; cv=none; b=i3pE+ASeWzj5ZXkGgI7yWo/Ia8lVXZGsDObsOQGZv/4Ls5V5NNyEOCmGgw0mAhV4je6kw2AVYBiRsy++fRbD+n5Nx1yRt2H/Tkaj72cfHaKGlBGF03NU4et9HPiy75MyRmY6DOAPvPjKnrIpLj3mDrsns6924I5HyfFhrHCgbQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752428318; c=relaxed/simple;
	bh=J9bYEcw4WqOgjR7eIs5y5uFTipDrXKanpPspWJakxuA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qvK8h2h01nO7SGaZg7HvhvYjP+EiUdDCbIa1JDylYmm7FPOO31lp6if20Esv5r3jSutgFIdU2cPs4PSraY1ZUOSQZ1dUIq8D4Rf9/jb4xOppFPJtR7AHWgRan7lP7iMKO181geCb8gm9Dztd6zxbyi1hHmikKRKSPqDdgR9JVFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LZSuTdtQ; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LZSuTdtQ"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-313336f8438so676218a91.0
        for <llvm@lists.linux.dev>; Sun, 13 Jul 2025 10:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752428315; x=1753033115; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9bYEcw4WqOgjR7eIs5y5uFTipDrXKanpPspWJakxuA=;
        b=LZSuTdtQCml9MkXMCu1QhE1vaAqdfgOelVhhYgZ/Ss7xyPkczCJBx05sQ97LpwFMbP
         TOO6rxUH5UA29wrA663ZS0I/PZB0UdH/n8PAZD8GHSsXOk4KYNCCjcW/7M0k4Zn5R9yq
         9ub3OgXsQg8vG+aZIHNNGwcwcIMqARgjQ0ygGUleDzGl8jtEC8vg8x6Fm0B0txy5Bwu8
         P3eVKpmFzO27lpac64jqpxFkMXaCL9+MINZaboSS5jnwHDHYNVSWtGqwZWiVFUlc2w0x
         VSUKdP3xv6GdtTxtqb3WqXQpOjtQv7q1KbFJf5OgvV0K8ZqOuLKBkjsyDKKBe8/r2AC1
         mxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752428316; x=1753033116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9bYEcw4WqOgjR7eIs5y5uFTipDrXKanpPspWJakxuA=;
        b=C2dznL7VSEp6jqhduff7asw7LgtkXeXujf98CgVvJOdWL97itNtYtvRxmLspVf2ClL
         sFl9nrsdgaH8Y01q7Ga0Kpkrhf6KeXSxii8zs2gS8W0qhdlCEpHP6GOx4eLpDExd1H/Z
         jFyQiTXtRIPbRgL2KObVcabIL7k5mmsUEvZ8m67FdXeYNUOlS5MCkbIfI/GGasJw0Wrc
         5xC70Ihz/9+XwECYRcAOg0XFVULUqcAWZBSrcLGlf/jweLQfguKMe6uej8eV+9V1VC2j
         CdJyaBxk0jKW9QlI6bKGc1PJjslJHzcIW86x+DN/quF8WcXjHnP4XaDUFqAwyfSp+ElZ
         XHUA==
X-Gm-Message-State: AOJu0YzBmJ0il/xW2tkZCfQ3KfLuFkOm6FVWRpzXSrhCxG5sjMH6ustT
	xcjjFfI3RQlTm2oX3PgXECtnRKv0bv+9rQUk2XH7xZX7qm/fy4JwJAQUW+gZa4JkTzMgeIqfroM
	o8qH9GzGrpyPpK+sQeIQjWi6/0CsmGyqFYQ==
X-Gm-Gg: ASbGnctwo2Q1D2TecCsBKQSEg/g1f75eV1P6QomsgKaiamay6vJnlbjDckVp9c/ojJ6
	OmeKWMg86AriMZDXb+lrLZWY3oVHJxtnJR+CSLrm6l+FOTpYG6oMrYkyl3dUEWzcekt3Y1xgT3f
	ILpfF9/VQsflGjJZWPzYoJZB7u0BAxtoDg74A6GrdAnJAFdOnK+zBDOND8R78GLacILl+yGjKYS
	jiElz7C
X-Google-Smtp-Source: AGHT+IEWEVF1OC2oUwD8umY5waQf51HdKGPJVMy2wQNwjrmHrbTafnX8z5+pEmS46puO7Q0K6dVT9uc+zLXWAZjkKYg=
X-Received: by 2002:a17:903:1106:b0:234:cb4a:bc1c with SMTP id
 d9443c01a7336-23defb22a52mr60353745ad.6.1752428315128; Sun, 13 Jul 2025
 10:38:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250710165801.GA4073042@ax162>
In-Reply-To: <20250710165801.GA4073042@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 13 Jul 2025 19:38:21 +0200
X-Gm-Features: Ac12FXw6vowHTS14knzR56B_R98nepXyZ-xDtlJK7OPEYb9id-rdVO_UGFoEXK8
Message-ID: <CANiq72k_tDfVWynEiwd4NAQKQTuEMpxNzGiBxZHsCij_XWXgFw@mail.gmail.com>
Subject: Re: Prebuilt LLVM 20.1.8 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2025 at 6:58=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I have built and uploaded LLVM 20.1.8 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> This is expected to be the last 20.x release. As always, if there are
> any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we can
> ensure they are fixed in main before the 21.x branch cut on Tuesday.

Thanks as usual!

For Rust:

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
