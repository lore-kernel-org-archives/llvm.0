Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AB21A0AE0
	for <llvm@lists.linux.dev>; Sat,  9 Nov 2024 21:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731189275; cv=none; b=FgZcB+jOya18uHljoZcrUKJaUAf0HWQLzXSqTRS1G8erLqN86kj3ll/oteebio35WqkQdtOwM4AwI92mIp87SsaIZQPvmYbtjaS7x7ODbdZRfO0+hhlruDcK/IDmIBe5awoIXMOj+WgyAAN+t96ic+R1/04T2+bLmsp8HtWcX6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731189275; c=relaxed/simple;
	bh=BUaskLxR1GreD/h9zIqmtGWDYFgSFW3lTBDqlj0a9uM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nB0HDQcDoU/asX7m+uyjWTTQU80pIj4Xtcvn8ovSfw3D0BUvc4rktqtNAjjtyY2m7ZvWw9fWOLhfeZamznjxR3pvc/tCDxjtH2PszW/BNHCRkyo/uNhTnf2zwfAZeWi3W+rAX6xGxxdOWoYSXYMKzt86WQumdeNtowAGFfA4PtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wo2iwjTC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wo2iwjTC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43F78C4CED4
	for <llvm@lists.linux.dev>; Sat,  9 Nov 2024 21:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731189273;
	bh=BUaskLxR1GreD/h9zIqmtGWDYFgSFW3lTBDqlj0a9uM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Wo2iwjTCUOAPEukxBZuV0ZIkV0UkPeokrS7HUXpQ3hkHuZmVUmGdVRN4TfbsJtfNb
	 /NzUHwxCAZG8b9iO+Teop9apkU0arQQsDEzu8/rt5uPfKlj/Jt8Xc0GzsH+imrwK6d
	 Ao16OrE2cr7KAdiPNSxFRA4D7WsGZcnzwyQW7YKpyewcEZBXAsDfnmf+GBFjmM2TOH
	 Zku1XEEiEasv1bRbyUpzC1rvE83NxhbYVIZnQBmzDU8fauFZX61zCZK/9+sHS1vjcE
	 Iz0v4uv4kJoVEr1gCqvF+HmRUsLuWqtXGmSZrhPBiW8olSLpxTn2XWBljwyk5XxrVM
	 Cn9z7SRJTusBg==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539f2b95775so4320188e87.1
        for <llvm@lists.linux.dev>; Sat, 09 Nov 2024 13:54:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUbLfes5zEyNl6Z8D6ANh+uiby/APNMskjzhTO31m9T4zqIIuFhKVItHQOfyZ4sZOaUCXND@lists.linux.dev
X-Gm-Message-State: AOJu0YyCAgt1eqtUwrir+f3+Lz2WQPv3dBpwMdNvOBwn2I387uoK0+do
	gW55EKS5+TSXxC8WETiGPBBLKvU/AH0YPuphTFxrkgIyoa0A/MgzyoQETGG3f5dBi6mA6XayVdF
	e3NCVddFgW3n/b9Ov8jCa50f+4yM=
X-Google-Smtp-Source: AGHT+IFzQfMaGAyc/vlcD/pyStYAkvwiojfiADOsdw62Brt+4/oXzpHBsyX/s+wYrEnSv/JO1IIXYT8Gj0t53KJNGZA=
X-Received: by 2002:a2e:a902:0:b0:2fc:9869:2e0b with SMTP id
 38308e7fff4ca-2ff201d3001mr57263831fa.20.1731189271898; Sat, 09 Nov 2024
 13:54:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZxkYYLbiXZ3p59iu@fjasle.eu> <20241106191846.2079521-1-matt@readmodwrite.com>
In-Reply-To: <20241106191846.2079521-1-matt@readmodwrite.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 10 Nov 2024 06:53:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNARi=SVL_b-FhbGtxDmyBgRFtxWrk+F98cmabRWZBHzTUQ@mail.gmail.com>
Message-ID: <CAK7LNARi=SVL_b-FhbGtxDmyBgRFtxWrk+F98cmabRWZBHzTUQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] kbuild: deb-pkg: add pkg.linux-upstream.nokernelheaders
 build profile
To: Matt Fleming <matt@readmodwrite.com>
Cc: nicolas@fjasle.eu, benh@debian.org, justinstitt@google.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, re@w6rz.net, kernel-team@cloudflare.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 7, 2024 at 4:18=E2=80=AFAM Matt Fleming <matt@readmodwrite.com>=
 wrote:
>
>
> Hey there,
>
> Can you explain how this change works a bit more? This reads like it's no=
w
> impossible to build the debian linux-headers package with clang? At Cloud=
flare,
> we're using a custom build of gcc, not the gcc-x86-64-linux-gnu package, =
and
> with this change we can no longer build linux-headers.

You need to install the gcc-x86-64-linux-gnu package.
This is available on both Debian and Ubuntu.

Adding the prefix is required to reliably produce the correct
linux-headers package.

For example, when building a linux-headers package for i386 on amd64,
userspace tools must be recompiled with 'i686-linux-gnu-gcc'.


> What's the solution for those of us that want to build the linux-headers =
deb
> package but can't install gcc-*-linux-gnu?

DPKG_FLAGS=3D-d

will skip the build dependency check, but 'x86_64-linux-gnu-gcc'
is still required.

If only clang is available on your system, you need a workaround,
e.g.

 ln -s clang ~/bin/x86_64-linux-gnu-gcc

Anyway, you need to find a solution.

--=20
Best Regards
Masahiro Yamada
