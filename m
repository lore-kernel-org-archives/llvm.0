Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53632C194
	for <llvm@lists.linux.dev>; Tue, 14 Nov 2023 17:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YhVdK4Jm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4152C433C8;
	Tue, 14 Nov 2023 17:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699983885;
	bh=u7EIggPFC8P7kOyA1vN8RHkAmmNvnLPN4H9IF462naQ=;
	h=Date:From:To:Subject:From;
	b=YhVdK4JmOFe2kdv9/0852AwV+Y7y9+sJtRRPO/j0Da6Dg69wkq0Vrm6pEeMTn1way
	 k10s+pppUwTFHBWW1ki2FfRudhC6z1nJU7u99Z5dQIIQEGY8+KVK5+aX0N+cGmiRCO
	 LGMRez2aHP6h8Qs188tMvA/a5pMMrxG4qzDm4kF5mVKnsqieSkoQAWeq8IQN6vgzq7
	 wwZel1NIpmX9qe5n1Dp56RxlTGnTpDmTaSOpMwnBcMQWIaW6iVIoWxjCcFPffXSspt
	 LDaL4opIBhKapHOHFJa+bpJKWVIv0ltWssYUqTMnIMfwEK7vSpiZJmJssaA+L0fi39
	 lHg2h7PSeTgVg==
Date: Tue, 14 Nov 2023 10:44:43 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Prebuilt LLVM 17.0.5 uploaded
Message-ID: <20231114174443.GA2423170@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 17.0.5 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

If there are any issues found, please let us know via email or
https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
opportunity to get them fixed in main and backported before the 17.x
series is no longer supported. 17.0.6 will likely be the final 17.x
release, barring serious bugs being discovered:

https://discourse.llvm.org/t/llvm-17-0-5-released/74906

Cheers,
Nathan
