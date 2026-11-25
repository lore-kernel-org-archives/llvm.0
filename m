Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795602434;
	b=UaoiyEGZL7UAsIxwRgNCRDZgTkCJ4cRXaxVMlVOCR2IHW8H1VtHSzV+UK5FW0aJ/xq5a
	 q03Q54zozw+WFRocRGfd4MPYgi6GY0zhegyHEJtgyyzhYaCvjD8JieI0N6c9gHP6kEMOx
	 Ad6k4ovrnJ6WGXxxDaMWwYf3W4CisamhGtFbqBWtl6aPp1MtqLbz3snVjndWG4PxEieC1
	 WOlOJHffAgF+y3vtFHrAZimUNthD2i6S3lbiINt3bJR54MHFlxkgzXISjuHqRAc41mq52
	 M2E8U3bcgGWCTYxnK95fBCNH0sb26zN3HyA7sCzqVq5h64gcAkvTq5+mIQAEyEq0VmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602434;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UdjPSrmIIN+yK0pjcfXNzdP1bLb3/Iq2/gmCvGpuUSM=;
	b=T8xPEJNSI8YWu9ESFhwbZUoSZDzjceek1+EWdGkcujE6rWRLjgOCT3CLDsSxTnSIpcJQ
	 JranKPt4hlpXjFWqWZ7XbMKk3+Xsf4O4tkt4jo0pVqtwQA4JQ+CTPvL2MjgQ8SokT5p+I
	 CDcVxqRRfrwVbXjzkQoca4FkbdkFTDi3mXguKsdlUaxB+WcTv7OlMFSlpTRbmRFzzOxLT
	 iWrk0ZQzo/a/wCGJhG7kLVaSIadL53tvdAa2I4cwLJo8hNlwJis26i5a3QTl/Eryoxryn
	 I/i6WLVQrFwlZIRauURKgSVdG976+jt86pbVy0aKmDXABy+YnuZNST8DUzsH/4N27MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=O0jDoNL7;
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4987E606A32D
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 10:27:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4987E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=O0jDoNL7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1795602430;
	bh=9UPOXoCV2CfcVJuo2UQgfeUtoe1J/CgkmQtANG3RcC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O0jDoNL7/5eA2Nl4OgQYadtK1gO6tMJYxBTHeMev1YWHAF5NieOiuKvV3dngmD5w3
	 Q8HrDGOAJvMvpSpVv+9tq2J9/W3wLTvqi+jspzqeFwi/R5j5LMl7copWKYfr18jNro
	 iGSq5N3daWa9fHkB7QNC7nCqqC0HJtI3lnpxlI08=
Date: Wed, 25 Nov 2026 11:27:10 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Nicolas Schier <nsc@kernel.org>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Julian Braha <julianbraha@gmail.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	stable@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v3 1/2] kbuild: Introduce CONFIG_CROSS_COMPILING
Message-ID: <25eaa926-c244-40a5-b7b9-e5182e601446@t-8ch.de>
References: <20261124-x86-no-march-native-on-non-x86_64-v3-0-268354149c5f@kernel.org>
 <20261124-x86-no-march-native-on-non-x86_64-v3-1-268354149c5f@kernel.org>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124-x86-no-march-native-on-non-x86_64-v3-1-268354149c5f@kernel.org>

On 2026-11-24 23:43:12-0700, Nathan Chancellor wrote:
> There are times where decisions may want to be made within Kconfig when
> cross compiling. Introduce a small script to call '$(HOSTCC) -v' and
> '$(CC) -v' and compare the first part of the target triples to see if
> they match.
> 
> This check is cheap but approximate, as Kconfig does not have all the
> information available such as endianness and bit width for the target to
> pass along to compiler. For example, a user building for x86 with a
> compiler that can build both with '-m32' / '-m64' may have
> CONFIG_CROSS_COMPILING set depending on the default value of the
> toolchain and what's being targeted. Should this become problematic in
> the future, the logic can be expanded to cover these corner cases but
> for now, keep the implementation simple and cover the majority of cases.
> Leave some informational prints to make it easy to debug future reports
> with

The expansion to bit width and endianess will be a lot of busy-work.
See the CC_CAN_LINK infrastructure.

We already have host-architecture detection in kbuild through
scripts/subarch.include. So CC_HAS_MARCH_NATIVE could depend on
$(ARCH) = $(SUBARCH), after exporting SUBARCH. Or maybe give the
variable a better name, like HOSTARCH.

This would avoid the introduction of a new, not-really-correct flag
and also the whack-a-mole that Boris complained about.

>   $ make ... run-command KBUILD_RUN_COMMAND='$(srctree)/scripts/check-cross-compiling.sh "$(HOSTCC)" "$(CC) $(CLANG_FLAGS)"'
> 
> Cc: stable@vger.kernel.org # dependency of future change
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Link: https://lore.kernel.org/CAHk-=wgmkoWHWwaQ6nsGoCiBp0hrpJuiwmoVbQ=Efun8JyUNKw@mail.gmail.com/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  MAINTAINERS                      |  1 +
>  scripts/Kconfig.toolchain        |  3 +++
>  scripts/check-cross-compiling.sh | 26 ++++++++++++++++++++++++++
>  3 files changed, 30 insertions(+)

(...)
