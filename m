Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCCA7F5
	for <llvm@lists.linux.dev>; Sat, 10 Sep 2022 14:34:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2DA4C433D7;
	Sat, 10 Sep 2022 14:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662820461;
	bh=aO7oX5p5tztXusnTywUsf69vFNbyvsBkyBxvMiLHmZs=;
	h=Date:From:To:Cc:Subject:From;
	b=ViWA6FiyQe6t8L50SnQzXykmb+hbxQqrZ93mJ+ivyquPgphtEo/25K0tUBE2CjghA
	 PdGQkBZ8feSetyhq7ua7d7plSx6j9dbq3ZdUs9XpbWpGpR9T/cDudHUiGuASBuwwnE
	 vLfAwNP6yjLyJ6Fza3JlmrhpoOkVmZK+b4iI+3+ZG/NhN6fZN94QCPP3zD8z8kL4Pa
	 YUlvk7YojXSo12G9g8A6oveNXXctmb37kUjrdnJrApCBV0h43ylsFJLHzm1WdyPhif
	 nCf23fPrRchPnjF7dhKLr0cyR5E9xf22atfRLLWUbiGsmHNXB0a3Pgx/AMHtTcOZgZ
	 P7gFeNeVm9gcA==
Date: Sat, 10 Sep 2022 07:34:19 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, llvm@lists.linux.dev
Subject: Apply 5c5c2baad2b55cc0a4b190266889959642298f79 to 5.10+
Message-ID: <Yxyga8k1jee5A9Vs@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Greg and Sasha,

Please apply commit 5c5c2baad2b5 ("ASoC: mchp-spdiftx: Fix clang
-Wbitfield-constant-conversion") to 5.10 and newer, as it fixes a
warning with tip of tree LLVM. There will be a minor conflict that can
be resolved by taking commit 403fcb5118a0 ("ASoC: mchp-spdiftx: remove
references to mchp_i2s_caps") before it, which seems reasonable to me.
If that is not acceptable, I can send a backport with just 5c5c2baad2b5.

Cheers,
Nathan
