Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682A12C80
	for <llvm@lists.linux.dev>; Thu, 13 Jan 2022 22:38:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC01C36AEA;
	Thu, 13 Jan 2022 22:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642113489;
	bh=hSiG7bEIE6f2ls+SRvE8tud+DdeYxjWeZLU3ejJ90xo=;
	h=Date:From:To:Cc:Subject:From;
	b=eGBrBy/EvJuK2T5/qpXQLUtaFScljNnlaUUTYx2/x4Q8SgOfzAJib8zJrNZ9vt1Fb
	 qr7cYd1XpsKzW+T8GXQKIDu17nacA5MRHJiu9tyaVBniRU+2hGe+C9H2yTn/roaUz5
	 0YbMhRWIj2S7BIShA/wrTsYGU31VU9gIGWOWx29ZTeZJF8cOw20O7NLDqujb5qHcnD
	 +CzYbMpvOU1yEOi2N1H0KHHe0X+k/8YYMY4g2TvIAa09xoaNU45YJ/RE22lPnJTaHz
	 fglHh7F+a6HVkKDCoQYrRQW3UvWm4LzUb351+JB/OJ6BVKYtXVlesV64JWj47rkWqi
	 JeEEqb/DkuzqA==
Date: Thu, 13 Jan 2022 15:38:04 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, llvm@lists.linux.dev,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Patches for clang and CONFIG_WERROR (arm64/x86_64)
Message-ID: <YeCpzLnfA+g+u3Id@archlinux-ax161>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Greg and Sasha,

Please consider applying the following commits to allow arm64 and x86_64
allmodconfig to compile with CONFIG_WERROR enabled with clang-11 through
clang-14 (the currently supported releases upstream).

502408a61f4b ("staging: wlan-ng: Avoid bitwise vs logical OR warning in hfa384x_usb_throttlefn()") [5.15, 5.10, 5.4, 4.19, 4.14, 4.9]
2e70570656ad ("drm/i915: Avoid bitwise vs logical OR warning in snb_wm_latency_quirk()") [5.16, 5.15, 5.10, 5.4, 4.19, 4.14, 4.9, 4.4]
144779edf598 ("staging: greybus: fix stack size warning with UBSAN") [5.16, 5.15, 5.10, 5.4]

I primarily care about 5.16 and 5.15, as those are the releases that
have CONFIG_WERROR, but I included all the versions that those patches
should apply cleanly to, as they do fix warnings in the build that
people might see, although I don't think they are worth backporting
further manually until someone complains. 502408a61f4b is already in
5.16.

If there are any issues or objections, please let me know!

Cheers,
Nathan
