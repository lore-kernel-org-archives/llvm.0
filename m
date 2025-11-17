Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A9D2D46B4
	for <llvm@lists.linux.dev>; Mon, 17 Nov 2025 16:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763396703; cv=none; b=CFkgsdGBHOVPiLLrokyzBfktm91SUugS/sGLA+9N500g5iKG/n1+k0l/gst+DgBreKbIaOzk0o61LwT2ocOiQMeQpilcFHDM47OBu0cQQBXXrUurXWRWBoTd8WpAi2za5cml47l825Ob63VbCbgspgP0qytj9oTPKBhoS99PLUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763396703; c=relaxed/simple;
	bh=/qzhbS6r1oxhfzbEFpPhrzjQGdSr7DzdzTsALlNoln4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AjuhaQzMLvg+aBVX+w3MWwhLIJJLt2h1nWgpdWTX/AVvzKbFsVz012oWmTyNBfpRkb1SNF200GdUdA18iSQY5tuwtkma5emFXIYx+/yse26X8JqfqJTfLhz5wvrSESaHmTrNW0tfaqe/9jrlLbnLGEiVUweM0XSi4G5J+ebdVfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MzwHqhYY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MzwHqhYY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B60C116B1;
	Mon, 17 Nov 2025 16:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763396701;
	bh=/qzhbS6r1oxhfzbEFpPhrzjQGdSr7DzdzTsALlNoln4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MzwHqhYY8UgaoYxoQeXhe9HNFBKM8w9afg351XjhyF1RMYk1jxj/qbjAXVHa+94QQ
	 geKjzERhuFbss4xdv+alWLKoVeDPi2a3WwXcsoXHBRU3Q7IAte/aNDjx77NhiZUFM1
	 6gSDlyuExOiRxCH5nDWSAFzobExxIRPY8ACwU4l61LsVbXfvvN19fagiYMJQAh/I/Z
	 XqqdQiubwLbyr+IPHMfTw6R6lhY19HM4mnazthZ5NPyjles+qE+Zz9s0wpKSBG347u
	 6BwRAOYswSB1cweNRjTcGWF2x+pTQieYmaGLpkDhWYiuiXTaWyjCzH4jX9s7NOOdEg
	 IWh2cUVemYTHg==
Date: Mon, 17 Nov 2025 09:24:57 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: linaro-toolchain@lists.linaro.org
Cc: llvm@lists.linux.dev
Subject: Re: [Linaro-TCWG-CI] v6.18-rc1-73-g3ffeb17a9a27a: Failure on aarch64
Message-ID: <20251117162457.GA564441@ax162>
References: <1094974019.2375.1763286384876@jenkins.jenkins>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1094974019.2375.1763286384876@jenkins.jenkins>

On Sun, Nov 16, 2025 at 09:46:23AM +0000, ci_notify@linaro.org wrote:
> Dear contributor,
> 
> Our automatic CI has detected problems related to your patch(es). Please find some details below.
> 
> In tcwg_kernel/llvm-master-aarch64-next-allmodconfig, after:
>   | commit v6.18-rc1-73-g3ffeb17a9a27a
>   | Author: Christian Marangi <ansuelsmth@gmail.com>
>   | Date:   Fri Nov 7 00:57:08 2025 +0100
>   | 
>   |     pinctrl: airoha: add support for Airoha AN7583 PINs
>   |     
>   |     Add all the required entry to add suppot for Airoha AN7583 PINs.
>   |     
>   |     Where possible the same function group are used from Airoha EN7581 to
>   | ... 4 lines of the commit log omitted.
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
>   | 27020
>   | # First few build errors in logs:
>   | # 00:37:42 drivers/pinctrl/mediatek/pinctrl-airoha.c:2064:41: error: variable 'an7583_pinctrl_drive_e2_conf' is not needed and will not be emitted [-Werror,-Wunneeded-internal-declaration]

https://lore.kernel.org/20251112-pinctrl-airoha-fix-an7583-drive-e2-confg-usage-v1-1-d2550d55e988@kernel.org/

Cheers,
Nathan
