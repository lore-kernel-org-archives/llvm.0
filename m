Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525DC33ADA4;
	Fri, 29 May 2026 13:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780063045; cv=none; b=sMFM+cbHJWAzYF0QjIYD3uVzyOr98+mj9AqBEAwXittBRJUhJBChw0luJS5HndeailZULXo0yrPzM24HhdwjcHDIE9pQILXBGjrnc+gVNocbzvrOV4Bagl4NCgYkKN2lj2XYO3VyIg47jsnxWertri8tun0cJDK4rscQX7bgNvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780063045; c=relaxed/simple;
	bh=80nUdDlaUy9YOR+UP/VAX5H7BGI3AU833TaGse909w0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OnDzDNqGWd/+QcSWwvg2Ejcn74K8utGo1F5MfkAGod/Ef3i14g7yOYRK90yx+OP+iNyKfPtkYyO6CU/5LyGWUMaXyrLDtn9W0kAMs1hWU2KL4306C9s6h9kOH1lPpJfWYDl1ta8dkcqM3RU15ZiswmUl7k4A7jt+Spq7BMhMZHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QZrwLGxV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZrwLGxV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE4BD1F00893;
	Fri, 29 May 2026 13:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780063043;
	bh=RCT9EcUjwR3eTSxWtOeaHgw577HiWWop2h0O5Vz5MlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QZrwLGxV0hVBYeH5MOT5W5C/7pY6drxX1JkfhUs7RpWPHC5ewE/GvnfvBkjYibNiH
	 o+UlETCnLMaeBlabA900W9VhZeP/ekGNG8meM+hF+0LsoNt8Pkez5A2qo6Nh2OoohN
	 ZNXPTRO7sn7rbibzW5Ic6N4ySJhC6C2liVHZ4lGOUCDMadvm51XyT+7CHp0/ZhrQEx
	 gOTizqBAT2HVfQ6vYLGXLUoY2mFkKGq89Xu0KxcJiYTSjG38PFJUWWAQfr7IlXaqO3
	 C37+W9AsUmbJfONYvwCVqp/mKFrBQ9WjAELA7jdetSh+xGBH6BjQiwmR4itNLZViU5
	 SvwSZJBKJScDA==
Date: Fri, 29 May 2026 14:57:17 +0100
From: Will Deacon <will@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	Avadhut Naik <avadhut.naik@amd.com>, linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	llvm@lists.linux.dev, gosst-kernel <gosst-kernel@google.com>,
	android-kernel-team <android-kernel-team@google.com>,
	kernel-dynamic-tools <kernel-dynamic-tools@google.com>
Subject: Re: [PATCH] MAINTAINERS: update ndesaulniers
Message-ID: <ahmbPeuo0sda4ROj@willie-the-truck>
References: <20260528-im_back_baby-v1-1-25d355efdbae@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260528-im_back_baby-v1-1-25d355efdbae@google.com>

On Thu, May 28, 2026 at 02:38:41PM -0700, Nick Desaulniers wrote:
> I'm coming back.  I will return.  I will possess your body, and I'll
> make LKML burn.
> 
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  .mailmap                                                               | 1 -
>  Documentation/process/embargoed-hardware-issues.rst                    | 2 +-
>  Documentation/translations/sp_SP/process/embargoed-hardware-issues.rst | 2 +-
>  MAINTAINERS                                                            | 2 +-
>  4 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/.mailmap b/.mailmap
> index a009f73d7ea5..f863781b0102 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -634,7 +634,6 @@ Nicholas Piggin <npiggin@gmail.com> <npiggin@kernel.dk>
>  Nicholas Piggin <npiggin@gmail.com> <npiggin@suse.de>
>  Nicholas Piggin <npiggin@gmail.com> <nickpiggin@yahoo.com.au>
>  Nicholas Piggin <npiggin@gmail.com> <piggin@cyberone.com.au>
> -Nick Desaulniers <nick.desaulniers+lkml@gmail.com> <ndesaulniers@google.com>
>  Nicolas Ferre <nicolas.ferre@microchip.com> <nicolas.ferre@atmel.com>
>  Nicolas Pitre <nico@fluxnic.net> <nicolas.pitre@linaro.org>
>  Nicolas Pitre <nico@fluxnic.net> <nico@linaro.org>
> diff --git a/Documentation/process/embargoed-hardware-issues.rst b/Documentation/process/embargoed-hardware-issues.rst
> index 34e00848e0da..d07f16c3c7b8 100644
> --- a/Documentation/process/embargoed-hardware-issues.rst
> +++ b/Documentation/process/embargoed-hardware-issues.rst
> @@ -308,7 +308,7 @@ an involved disclosed party. The current ambassadors list:
>  
>    Google	Kees Cook <keescook@chromium.org>
>  
> -  LLVM		Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
> +  LLVM		Nick Desaulniers <ndesaulniers@google.com>
>    ============= ========================================================
>  
>  If you want your organization to be added to the ambassadors list, please
> diff --git a/Documentation/translations/sp_SP/process/embargoed-hardware-issues.rst b/Documentation/translations/sp_SP/process/embargoed-hardware-issues.rst
> index 9d444b9c46d3..7d4d694967c7 100644
> --- a/Documentation/translations/sp_SP/process/embargoed-hardware-issues.rst
> +++ b/Documentation/translations/sp_SP/process/embargoed-hardware-issues.rst
> @@ -287,7 +287,7 @@ revelada involucrada. La lista de embajadores actuales:
>  
>    Google	Kees Cook <keescook@chromium.org>
>  
> -  LLVM		Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
> +  LLVM		Nick Desaulniers <ndesaulniers@google.com>
>    ============= ========================================================
>  
>  Si quiere que su organización se añada a la lista de embajadores, por
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 461a3eed6129..2f06cc2e463c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6259,7 +6259,7 @@ F:	.clang-format
>  
>  CLANG/LLVM BUILD SUPPORT
>  M:	Nathan Chancellor <nathan@kernel.org>
> -R:	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
> +R:	Nick Desaulniers <ndesaulniers@google.com>
>  R:	Bill Wendling <morbo@google.com>
>  R:	Justin Stitt <justinstitt@google.com>
>  L:	llvm@lists.linux.dev

Hallowed be thy name.

Acked-by: Will Deacon <will@kernel.org>

Will
