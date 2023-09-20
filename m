Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A99187F
	for <llvm@lists.linux.dev>; Wed, 20 Sep 2023 03:22:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 609AEC433C7;
	Wed, 20 Sep 2023 03:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695180179;
	bh=CZNGlwk8El4NyNLGtKLKanjOxlEfzUXc4QahjCELL4w=;
	h=Date:From:To:Subject:From;
	b=pdAw+pM7dGeShqsn9EodB4tRccrdTLlVla4VxYvMBxs/BNnNtsG8kTAea8mef5EA/
	 jE/KSbz+D0f8eZosEaQn8KP/7i1+dsfNgbbDgsVA8yHdjjrZw14yLk3MIic2FnOsTu
	 mNZO7omTlaLkNrgJUTBuP6vAS+7H4+yFuyIlv7gRNLPGzCpU0Xx8saqpJgxC5eB5N+
	 y8mLavqxwD+K3reUtWH616TVG8Rb1WEpIYBp4Bmx/D/ilcfzd3M6pDANSMvmwEp22p
	 jNu/T68NLoXVhFKDCvqO1Z5oGDmmCgkZUncohgJCLOF8spuG+BQvh55V25e6QSqPaU
	 htCbSYCXdeqxA==
Date: Tue, 19 Sep 2023 20:22:57 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Prebuilt LLVM 17.0.1 uploaded
Message-ID: <20230920032257.GA472311@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 17.0.1 to
https://mirrors.edge.kernel.org/pub/tools/llvm/. This is the first
stable release of the 17.x series, as 17.0.0 final was withdrawn due to
some issue.

If there are any issues found, please let us know via
email or https://github.com/ClangBuiltLinux/linux/issues/new, so that we
have an opportunity to get them fixed in main and backported before the
17.x series is no longer supported.

Cheers,
Nathan
