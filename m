Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA87F3B2B7
	for <llvm@lists.linux.dev>; Tue,  3 Oct 2023 18:03:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 295A0C433C8;
	Tue,  3 Oct 2023 18:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696356205;
	bh=tdp1GQLnOzhP5N7sgd2m46EkMMOgLP/jZDUmpIqE9lQ=;
	h=Date:From:To:Subject:From;
	b=MuLH8vYRqHnUtn/2KYBMAyLizj37JzEA4/EU+xaVXFN2DJBKGAM/e8wgzNxF62WpW
	 aES6wVtuEG6pMWeauClY+vi5g2UcxcnyL8B3KkBOsZVkVZey1aDBoAX6ZZfMRs1/4M
	 +qPN32Ahud1BX1T3TaQ1OpJcfvR2pjiTnrI6WNDLTB8YrQKXEUJqx1mqCxItLw8NC/
	 7tlC9W+NEA+hhTpEimkpBEPq17I/I61NW9u737yvCwi1dONGn6IYrNA/nUthqILIuf
	 LzjoKC6WYyeNWonFIsHtRD9+0sEAm9ulCArL6xxY2lbfuFfKmrGxv8UToSeeOCLXA+
	 pthNVr7JdOfww==
Date: Tue, 3 Oct 2023 11:03:23 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Prebuilt LLVM 17.0.2 uploaded
Message-ID: <20231003180323.GA419007@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 17.0.2 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

If there are any issues found, please let us know via
email or https://github.com/ClangBuiltLinux/linux/issues/new, so that we
have an opportunity to get them fixed in main and backported before the
17.x series is no longer supported.

Cheers,
Nathan
