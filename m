Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10BC1399
	for <llvm@lists.linux.dev>; Tue, 19 Apr 2022 21:27:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5954C385A7;
	Tue, 19 Apr 2022 21:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650403641;
	bh=J4l6nOhwaGP9gwFmqdP8jxouA835/1GgWpS/8DKzJkg=;
	h=Date:From:To:Cc:Subject:From;
	b=k3qUvGotzVuqDlNl1O1CY7Rh+NP1XAKEDxdjSAQA6nUfeDRU1GNpC17/vPuW6jM1J
	 W3H+W13+Ct2s+3btCEWGcsDnhdq5IN5tykWlsNTSWR/Vlfg36a9Gbrc4jra+sBL+wE
	 TDJ3vN2A9zpm4AFLu8XDlubcD80FEXqL80xgmQpXJyF5ME5O2KusPi7conjaz6qJHr
	 aiBaKhYDwdJNjz5b9fYa0Zb6S0usS655i2XDVAB5PpD9yk7OVxqjjhNwVRvGQUAMWm
	 W7WJjT55au+sgRubuSHMMyfHDupZ1U2/7Gk0lSuwKIAog9fuMSTF2zf8QqWitn1zMx
	 I/drdBGddnN5A==
Date: Tue, 19 Apr 2022 14:27:19 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>, stable@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev
Subject: Apply d799769188529abc6cbf035a10087a51f7832b6b to 5.17 and 5.15?
Message-ID: <Yl8pNxSGUgeHZ1FT@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Greg, Sasha, and Michael,

Commit d79976918852 ("powerpc/64: Add UADDR64 relocation support") fixes
a boot failure with CONFIG_RELOCATABLE=y kernels linked with recent
versions of ld.lld [1]. Additionally, it resolves a separate boot
failure that Paul Menzel reported [2] with ld.lld 13.0.0. Is this a
reasonable backport for 5.17 and 5.15? It applies cleanly, resolves both
problems, and does not appear to cause any other issues in my testing
for both trees but I was curious what Michael's opinion was, as I am far
from a PowerPC expert.

This change does apply cleanly to 5.10 (I did not try earlier branches)
but there are other changes needed for ld.lld to link CONFIG_RELOCATABLE
kernels in that branch so to avoid any regressions, I think it is safe
to just focus on 5.15 and 5.17.

Paul, it would not hurt to confirm the results of my testing with your
setup, just to make sure I did not miss anything :)

[1]: https://github.com/ClangBuiltLinux/linux/issues/1581
[2]: https://lore.kernel.org/Yg2h2Q2vXFkkLGTh@dev-arch.archlinux-ax161/

Cheers,
Nathan
