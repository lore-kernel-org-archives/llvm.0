Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B933DE45A;
	Mon,  6 Jul 2026 20:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783369006; cv=none; b=Gv1y2bE3RXPSLMG34mWbMjvl9oPRty6R/REAUJZLT2/ROlvnUdv5yGOvMn68BOJhTGWP/NZSLzhmS9GjfoeFyzM/hAyiWYmKqjN6w9RwyY6YzTuhfI6a5lCJfNQNfBDEVcVqfYGTmXAiEhS3+1Nd6MUlPmJze9BwOPF4C2mseoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783369006; c=relaxed/simple;
	bh=nZMrtP0DC8iBaqKYgMmMrO1jrvXDkETi7hReXQsahmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SEryYPW4V24+T7cosHQbkeDopO42zLTCDQXeTAdHuewNABHSej/xHTF71EGFbzOJBa4HnGev5D2o5Uf1sb/+4sYJE/6XkJ3O7g+nYQsQZwJHMa3pA96m6VVLhBxrfhcsHZZ+XZZcKzpl08IO7bKjsT44McrokcJ++FLZxwQplQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RDNtmue2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RDNtmue2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E681F00A3A;
	Mon,  6 Jul 2026 20:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783369004;
	bh=PGuV6jeesFdKzccH9KIxy2qzDvsa3jcfI3T0fBRPPQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RDNtmue2li5VZvEYGKotXJPXHSlBWfcQdpFSwGQhKRndG6sIMx6xtdT3SGHLglLIn
	 7d7pVsDtpp/NR/Qb/vQ70fvGTO92UjdvvodOS2DqtU/neEX+qFXxfr4xl+a2+0qOCN
	 XF/z9cjeSxjZSHgdbxR327IhIqCP2kz35gmKus/F+vKIeGqmgA9l/YHSt9jPG6EyRw
	 Z1YDFHpGBrT36dWHzvFNy6dKLwamAI+T6h+SJ77QZO9FiZ6Tmt7aXY6J9q+YlDsRWL
	 1KF1jDns+DKbW78dnBHq1OEmE3Fx5HLJ70kIUj8mu6liUx72QU7aK+Qj5Ta28Ba/xl
	 Tm2sLOyRmH1rQ==
Date: Mon, 6 Jul 2026 13:16:38 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
	Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	Avadhut Naik <avadhut.naik@amd.com>, linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	llvm@lists.linux.dev, gosst-kernel <gosst-kernel@google.com>,
	android-kernel-team <android-kernel-team@google.com>,
	kernel-dynamic-tools <kernel-dynamic-tools@google.com>
Subject: Re: [PATCH] MAINTAINERS: update ndesaulniers
Message-ID: <20260706201638.GA2661146@ax162>
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

Acked-by: Nathan Chancellor <nathan@kernel.org>

Linus, could you apply this directly? It fell off my radar and I think
it is worth getting in sooner rather than later. I am not sure when my
next fixes pull will be. Thanks a lot!

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
> 
> ---
> base-commit: 8fde5d1d47f69db6082dfa34500c27f8485389a5
> change-id: 20260528-im_back_baby-1ade32dc049e
> 
> Best regards,
> --  
> Nick Desaulniers <ndesaulniers@google.com>
> 

-- 
Cheers,
Nathan
