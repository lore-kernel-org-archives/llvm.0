Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5ACB2F3C
	for <llvm@lists.linux.dev>; Fri,  4 Nov 2022 22:46:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 549DEC433C1;
	Fri,  4 Nov 2022 22:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667601997;
	bh=Y0WP8JgTAS/F0y/ZkKGWdKIlTWOq7gBKnMnzDzuDO40=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=TfEsUo5Zh6T0GNm2EuCGzUi1NGQd3anhZDNCh1pgHXSfd6NdnLr5738/nmsVFesJq
	 RLekrQ0nZHdbIYh0KAkhXPGl/S6HjFwwgqEfnWsOfUwkIrQcnFFQ8M/sI/TtSfR/qV
	 vybJkxaMcnexZsAd4tXBRKAn44EFb9zvbp+6gMU5Pv13gsPiyidejFKL4ompdF3OOC
	 XVAtSj8gBq1UewfVn5PmVVjPXpozcnPdhmApCNd6y57boYRjxF1ldDmy3L34TxLleR
	 xPxXi8d3zFfEUXqxzYOHvPOB5/O6nOZc4oQQaA3Ki0k/0kqRUhY0QsCbdrS20dXY5j
	 /K9QuSiXVKh+Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 42F8EE270FB;
	Fri,  4 Nov 2022 22:46:37 +0000 (UTC)
Subject: Re: [GIT PULL] hardening fix for v6.1-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <202211040926.0E7BBDB1@keescook>
References: <202211040926.0E7BBDB1@keescook>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <202211040926.0E7BBDB1@keescook>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/hardening-v6.1-rc4
X-PR-Tracked-Commit-Id: 6f7630b1b5bc672b54c1285ee6aba752b446672c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bd745027438a854e2d7c124032e9ad4aa389e153
Message-Id: <166760199727.25569.10949830136990958125.pr-tracker-bot@kernel.org>
Date: Fri, 04 Nov 2022 22:46:37 +0000
To: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>, Kees Cook <keescook@chromium.org>, linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 4 Nov 2022 09:26:39 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/hardening-v6.1-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bd745027438a854e2d7c124032e9ad4aa389e153

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
