Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7373D61
	for <llvm@lists.linux.dev>; Sat, 26 Mar 2022 20:18:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2ABB8C340ED;
	Sat, 26 Mar 2022 20:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648325886;
	bh=NQ8FcjPHpoMs5HGYXsG7Q0MuPKyxMlQXUhxEOE1x2o8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=cR+Naf/TIr3zYUxnbv5UeM//DJN9RRQUz9D7j4I64AGgRf+9QrJbB4j5UNL7PKBq/
	 EPJIBgL/pI5RzVoHSKUTGE1vrqdkFtiOuJdn/wGw12PTUWclsrq7FI0il61u3BYXfw
	 KPwgititsuZjXnQNnvO+JnZtOA+ZMNht2tbTlzDJAp0rCl6vz8k1bzTVDEWWv0V4Ki
	 ZDGjNZ8CagPzvvjHzk6uI6zZs0Dc3MxXufUQLG8i9tppl8bGfoC5SLjcMoUhZBFzbO
	 dLr3Y383vIPZr5E2Ndq/vumgoGHGkbDoNGVum82aPymyc6+7CVcGAIw4NCyNfBgE97
	 l1o5KI6Usl2sA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 17BE6E6D44B;
	Sat, 26 Mar 2022 20:18:06 +0000 (UTC)
Subject: Re: [GIT PULL] FORTIFY_SOURCE updates for v5.18-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <202203251443.9BBADFD98@keescook>
References: <202203251443.9BBADFD98@keescook>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <202203251443.9BBADFD98@keescook>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/memcpy-v5.18-rc1
X-PR-Tracked-Commit-Id: 281d0c962752fb40866dd8d4cade68656f34bd1f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4be240b18aa67b1144af546bea2d7cad1b75c19b
Message-Id: <164832588609.7233.7403778797821946356.pr-tracker-bot@kernel.org>
Date: Sat, 26 Mar 2022 20:18:06 +0000
To: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, George Burgess IV <gbiv@google.com>, Kees Cook <keescook@chromium.org>, linux-hardening@vger.kernel.org, llvm@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 25 Mar 2022 15:03:43 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/memcpy-v5.18-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4be240b18aa67b1144af546bea2d7cad1b75c19b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
