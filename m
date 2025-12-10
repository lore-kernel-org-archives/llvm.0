Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8E61DE8A4
	for <llvm@lists.linux.dev>; Wed, 10 Dec 2025 07:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765351563; cv=none; b=nu0BYGbfH2vanz9SuJM872WiHJkwpedH1YT8+5agIA6duEIAjoN+rXVLmrBKFVLIGGXOlTjO3EPTGOPLLOCOxZXOR2m7U/GYXkqYPllHsysoY/JGZCaX8hBYl7T21QEfBt9pFfpwAFD/Q5s9P7WfdSeUlLDDPBers8Wy4nQMCMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765351563; c=relaxed/simple;
	bh=lQI/9Q2cv4AdiXY2ZIlLo+Ong+f/9atNTWuWgvqSpj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GmeO7oQ8s7ppzMOhWelCPSHRRn1SOTvHALyvX7mXpa4ieT5dVQvYrXq4KPywiVdvvdLHbTzacoPy4fNNl16q9FgxWn/b56OSYfAP6ZpkcsYKhVQNqzseCNpYsNZYnkgsSxGYi9ffHBtrakCrzzxKS9lZmV2xjYhOZRUfl6TESoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DDoKpA/W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DDoKpA/W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36BDFC4CEF1;
	Wed, 10 Dec 2025 07:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765351562;
	bh=lQI/9Q2cv4AdiXY2ZIlLo+Ong+f/9atNTWuWgvqSpj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DDoKpA/WVvQhqzCyNkKoHroTU2BB27yjUuS1iKNLKME7/nSqPQFGXbfwy3VrrkuOo
	 vetKagThE87Kl/XlleHUNcHu3rFT48hHD3G/Eec7+cc1fR+D5KZgEapDSdnzEGmQPT
	 m1nlBhrMzb/tLPwm2KhxjO/eOjzC7Ar5DfLalxbZkrj7Di62e8Kop82OPSiymDdZuh
	 HVG3ZrlietsXEiRMEw7HU1payqR7do0TsM/SO9N+DeaIAuT+eBZ5aoPirXw/aSP8Eq
	 p123WkWwmqfDrNWR4YXB1pDvloiBBHTlCcobpNgWV0UfwUArCMQng2Z82SE0pOfew+
	 n5QRX/ME9XQVw==
Date: Wed, 10 Dec 2025 16:25:59 +0900
From: Nathan Chancellor <nathan@kernel.org>
To: linaro-toolchain@lists.linaro.org
Cc: llvm@lists.linux.dev
Subject: Re: [Linaro-TCWG-CI] v6.18-rc6-688-gcd41d3420ef6: Failure on arm
Message-ID: <20251210072559.GB1147766@ax162>
References: <1316820319.13253.1765166109507@jenkins.jenkins>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1316820319.13253.1765166109507@jenkins.jenkins>

On Mon, Dec 08, 2025 at 03:55:08AM +0000, ci_notify@linaro.org wrote:
> Dear contributor,
> 
> Our automatic CI has detected problems related to your patch(es). Please find some details below.
> 
> In tcwg_kernel/llvm-master-arm-mainline-allyesconfig, after:
>   | commit v6.18-rc6-688-gcd41d3420ef6
>   | Author: Jaroslav Kysela <perex@perex.cz>
>   | Date:   Wed Nov 26 10:16:35 2025 +0100
>   | 
>   |     ASoC: nau8325: add missing build config
>   |     
>   |     This configuration was missing from the initial commit.
>   |     
>   |     Found by Jiri Benc <jbenc@redhat.com>
>   | ... 6 lines of the commit log omitted.
> 
> Produces Failure:
>   | Results changed to
>   | # reset_artifacts:
>   | -10
>   | # build_abe binutils:
>   | -9
>   | # build_kernel_llvm:
>   | -5
>   | # build_abe qemu:
>   | -2
>   | # linux_n_obj:
>   | 23374
>   | # First few build errors in logs:
>   | # 00:26:11 sound/soc/codecs/nau8325.c:430:13: error: variable 'n2_max' is uninitialized when used here [-Werror,-Wuninitialized]
>   | # 00:26:11 sound/soc/codecs/nau8325.c:431:11: error: variable 'ratio_sel' is uninitialized when used here [-Werror,-Wuninitialized]

Should be hidden with

  https://git.kernel.org/broonie/c/2c7e5e17c05f1d5e10e63e1baff2b362cd08dcd6

but I am still not convinced that is a correct fix (but I don't really
care to push further on it).

  https://lore.kernel.org/20251203214958.GC3060476@ax162/

Cheers,
Nathan
