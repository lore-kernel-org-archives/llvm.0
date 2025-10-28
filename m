Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314EE2D73B8
	for <llvm@lists.linux.dev>; Tue, 28 Oct 2025 22:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761690745; cv=none; b=t3XLvFWtE5WehFz+zA6odJ90nJIWsry008wVBvrucPh1Dzz3G6mYQvg2BbRwh6pRHqYGfOjan7lFi26h66BdbzJN3j8hdtaKD69Bo/wKMWUJW4dEBYRPuEisFEwextU+u+1F7mUyMAI2nTu8I/XTH6QmoSuopJp2azivfKK+yaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761690745; c=relaxed/simple;
	bh=EOUOFODR900XdJgwte6fhWTSd89WZXqachsuI1hWpvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mSNIW9bY8y/KdIjWxYThtRHZG6Up+D6B8Y5cRCS3sZQI5JV5dV2eXPq3lLV6SjtKRFmOvNWFyiQ8syxkTWpjjxjHlkasdvcM7KZ6ZNnfUjZJvGYF++oQe4yykO/2sA9K+iK6/2fH1inU1gS4zm4DOrabMoeRm9fw6FFUCef5Xww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gtAqi2Y/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gtAqi2Y/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B75CC4CEE7;
	Tue, 28 Oct 2025 22:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761690744;
	bh=EOUOFODR900XdJgwte6fhWTSd89WZXqachsuI1hWpvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gtAqi2Y/lqQ7vmBEbkWEoOwTdFnLNRjWsSjJw/Vs0l8d8H9YnVapB9Xa0uktgYP60
	 l2uQqcd54Gt2WLS9fajvZebn5XQd5FncFkYnVhGraTGVYTYVA7x8H7zeptE6bcTQoA
	 ZX8ov6UH5AKJAZKcWFVB7OmdyvTpJ5VE2PipMldwqkPGDAr5dPCLynettXsxhDAO+I
	 qfO51Q+cIpoMMEt4S5iECwDn06loOhgoaRCBe0bGMVinNMaHxUswkwMuQ2Tl0mwdg3
	 0YHQnnnA3lgJ8vbehYU+gH6Zr48RtWr0gj82XPiZduuikBiLos/vSabxOWMp+AJGAA
	 wMpwhLsA/Er0w==
Date: Tue, 28 Oct 2025 15:32:21 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: linaro-toolchain@lists.linaro.org
Cc: llvm@lists.linux.dev
Subject: Re: [Linaro-TCWG-CI] v6.17.3-130-g86f364ee5842: Failure on aarch64
Message-ID: <20251028223221.GA1306180@ax162>
References: <481166937.2108.1761498077256@jenkins.jenkins>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <481166937.2108.1761498077256@jenkins.jenkins>

On Sun, Oct 26, 2025 at 05:01:16PM +0000, ci_notify@linaro.org wrote:
> Dear contributor,
> 
> Our automatic CI has detected problems related to your patch(es). Please find some details below.
> 
> In tcwg_kernel/llvm-master-aarch64-stable-allnoconfig, after:
>   | commit v6.17.3-130-g86f364ee5842
>   | Author: Masahiro Yamada <masahiroy@kernel.org>
>   | Date:   Thu Sep 18 10:05:46 2025 +0200
>   | 
>   |     kbuild: always create intermediate vmlinux.unstripped
>   |     
>   |     [ Upstream commit 0ce5139fd96e9d415d3faaef1c575e238f9bbd67 ]
>   |     
>   |     Generate the intermediate vmlinux.unstripped regardless of
>   | ... 14 lines of the commit log omitted.

This is reproducible for me locally with:

  $ make -skj"$(nproc)" ARCH=arm64 CC=clang CROSS_COMPILE=aarch64-linux-gnu- HOSTCC=clang LD=ld.lld clean allnoconfig all
  aarch64-linux-gnu-objcopy: vmlinux: file format not recognized
  ...

This does not occur with llvm-objcopy via LLVM=1 nor does it happen with
an all GNU setup. This feels like a bug in GNU objcopy though, as this
is reproducible with:

  $ aarch64-linux-gnu-objcopy --set-section-flags .modinfo=noload vmlinux.unstripped vmlinux.objcopy

  $ file vmlinux.unstripped vmlinux.objcopy
  vmlinux.unstripped: ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), statically linked, BuildID[sha1]=18512f67dae70a7fae145b34514054a8b8b3c105, not stripped
  vmlinux.objcopy:    ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), statically linked, BuildID[sha1]=18512f67dae70a7fae145b34514054a8b8b3c105, not stripped

  $ aarch64-linux-gnu-objcopy --remove-section=.modinfo -w --strip-unneeded-symbol='__mod_device_table__*' vmlinux.objcopy
  aarch64-linux-gnu-objcopy: vmlinux.objcopy: file format not recognized

  $ aarch64-linux-gnu-objcopy --version | head -1
  GNU objcopy (GNU Binutils) 2.45.50.20251028

Cheers,
Nathan
