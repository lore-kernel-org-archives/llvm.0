Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3828D10E5
	for <llvm@lists.linux.dev>; Tue, 21 Jun 2022 15:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6F46C341C0;
	Tue, 21 Jun 2022 15:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655825884;
	bh=A0a/H9li60IOR3cEjNoOVaD2kT3+FWSvLLmEScxuq5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YQjaZ7VNM4H5Yhsl91+AlAg7EHbunjV6yPYYYy8OyOeO/D2fPq5aKwurVxGrT8M78
	 riexbbIGnTvoZZVtOYMn+xYEOyRuSiaZstGO1v+tAUbfrkK/qqy9ZFV5zuI9N82Y2r
	 ST99/DMD//4FkndehXHEUyf+l83OW+OkAN31ywpr/St1Z7mqHHrjLYGeOVhtj9iuG2
	 c99MEwmJeTD5dqEksGcftjFHqfVeWwP3DmLkSJkPKm9YbOPDeEw49EyCo/+2UABdjY
	 b22phSUwP6Ndh9Yo3bsNOXcXRn5d3pDQ9p46R0vS50QwK3E4Dm+qRpQVTSn8UZx8uA
	 kzq64GCPZWq/w==
Date: Tue, 21 Jun 2022 08:38:03 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: ci_notify@linaro.org
Cc: Arthur Eubanks <aeubanks@google.com>, llvm@lists.linux.dev
Subject: Re: [TCWG CI] Regression caused by llvm: [GlobalOpt] Perform
 store->dominated load forwarding for stored once globals
Message-ID: <YrHl20+cA20MwpAP@dev-arch.thelio-3990X>
References: <786830855.4416.1655743809453@jenkins.jenkins>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <786830855.4416.1655743809453@jenkins.jenkins>

On Mon, Jun 20, 2022 at 04:50:08PM +0000, ci_notify@linaro.org wrote:
> [TCWG CI] Regression caused by llvm: [GlobalOpt] Perform store->dominated load forwarding for stored once globals:
> commit 6f348b146b69a50d5fb1b9fbfd14bc1d204e45c4
> Author: Arthur Eubanks <aeubanks@google.com>
> 
>     [GlobalOpt] Perform store->dominated load forwarding for stored once globals
> 
> Results regressed to
> # reset_artifacts:
> -10
> # build_abe binutils:
> -9
> # build_kernel_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 37
> # First few build errors in logs:
> # 00:00:51 error: include/uapi/linux/acct.h: leak CONFIG_M68K to user-space
> # 00:00:51 make[1]: *** [scripts/Makefile.headersinst:63: usr/include/linux/acct.h] Error 1
> # 00:00:51 make: *** [Makefile:1381: headers] Error 2

I know this change was reverted already (13ff7d6f393d) but I think the
only way this change could be responsible for this error is through a
miscompile of scripts/unifdef.c, as scripts/headers_install.sh relies on
that tool to strip away !__KERNEL__ sections. I can try to reduce
something out if necessary.

Cheers,
Nathan
