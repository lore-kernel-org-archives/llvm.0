Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BE92C9D
	for <llvm@lists.linux.dev>; Sun, 16 Jan 2022 02:23:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 782D4C36AE3;
	Sun, 16 Jan 2022 02:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642299790;
	bh=ExHCN+jCm79O8YF9NCP+4bd3FusEOIkYrbsMWSw4JI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eFWVcK0TIPsKM4Fa0KzU+2xvCA0WIOnvoENvFf3voOnCxikAsI7gqOsnmp6iX0LQS
	 g4eZpyi9RpfkGbFvdNaX9MTZAQeDLPD0moQaNS3OG3DOdajCjIC3eLFzU2nTLpC9aB
	 XW30psXqRBA42zJTSW63gLB00BhdXLxr9MI/PgVScpEV4JKZ7/aFve/xMGtJ7OU36I
	 ZXzjkGTTjLQ1ZH2+c+Oua16lt0qiu0h8ULcKX/E92m/jnO+WGyb7rf/A12MutXv2eL
	 YxnAqukEWZumZutG91rQSvE4N/qg3EgPlsrNEKhk1oiwg6IHGaexb4uz9Jmdl9lN5E
	 TeD6x0bKMaLmw==
Date: Sat, 15 Jan 2022 19:23:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: ci_notify@linaro.org
Cc: John Ericson <John.Ericson@obsidian.systems>, llvm@lists.linux.dev
Subject: Re: [TCWG CI] Regression caused by llvm: [cmake] Use
 `GNUInstallDirs` to support custom installation dirs.
Message-ID: <YeOBitysu3dSskRe@archlinux-ax161>
References: <367952371.12347.1642297467736@jenkins.jenkins>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <367952371.12347.1642297467736@jenkins.jenkins>

On Sun, Jan 16, 2022 at 01:44:26AM +0000, ci_notify@linaro.org wrote:
> [TCWG CI] Regression caused by llvm: [cmake] Use `GNUInstallDirs` to support custom installation dirs.:
> commit efeb50197091b2ade24c00b9d55814bc433a7fd1
> Author: John Ericson <John.Ericson@Obsidian.Systems>
> 
>     [cmake] Use `GNUInstallDirs` to support custom installation dirs.
> 
> Results regressed to
> # reset_artifacts:
> -10
> # build_abe binutils:
> -9
> # build_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 9
> # First few build errors in logs:
> # 00:00:31 make[1]: *** [scripts/kconfig/Makefile:87: defconfig] Error 1
> # 00:00:31 make: *** [Makefile:619: defconfig] Error 2

Thank you for the report! It has been reverted already, as it was
breaking LLVM buildbots:

https://github.com/llvm/llvm-project/commit/6e52bfe09d3ab3ae6c43c079d06ebeb7bb241dec

Cheers,
Nathan
