Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6428F17C8;
	Wed, 11 Jan 2023 03:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B045C433EF;
	Wed, 11 Jan 2023 03:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673407824;
	bh=Gw1AmdmiVZBq3sF/ZF+37n7wMZ1O6JeczXxwErs3EQU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=g85St5edH8dqw235Go9GZYnu8g/iDrAJT+B9RMNwyoXZ4mhgrJWkbVhGlcGkH4hWH
	 MDwg4dh5FXwdHC132/W5JBp63z4ZpgxQCr1o0qccTc1VF5512hM4xDxJROOxVJLIX5
	 zeKVFfaS57d+udzJ/lg/NAC9S5OM3H1mVWNnGBhySPy9VwnBqjrde+9rENoDSXQF8+
	 7zFVYzwdcDHq9eaTf2cu0RZK/096J9K2Kh9Bz+jZ3G3L2NDIonaCa+XByznn5++kPu
	 qonn2yl8guif7Mnr/CQEG7Xc+DfDdoCHe8sbvG0L6qNNLOhHkDKYKhHtmjY72plumJ
	 RLuVnXdeVIApA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DF2DEE524EE;
	Wed, 11 Jan 2023 03:30:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform/chrome: cros_ec_lpc: initialize the buf variable
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <167340782388.3713.8161675582261475081.git-patchwork-notify@kernel.org>
Date: Wed, 11 Jan 2023 03:30:23 +0000
References: <20230110193611.3573777-1-trix@redhat.com>
In-Reply-To: <20230110193611.3573777-1-trix@redhat.com>
To: Tom Rix <trix@redhat.com>
Cc: bleung@chromium.org, groeck@chromium.org, nathan@kernel.org,
 ndesaulniers@google.com, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Tue, 10 Jan 2023 14:36:11 -0500 you wrote:
> Clang static analysis reports this problem
> drivers/platform/chrome/cros_ec_lpc.c:379:13: warning: The left operand
>   of '!=' is a garbage value [core.UndefinedBinaryOperatorResult]
>     if (buf[0] != 'E' || buf[1] != 'C') {
>          ~~~~~~ ^
> 
> The check depends on the side effect of the read.  When the read fails
> or is short, a buf containing garbage could be mistaken as correct.
> 
> [...]

Here is the summary with links:
  - platform/chrome: cros_ec_lpc: initialize the buf variable
    https://git.kernel.org/chrome-platform/c/2ae3c610e7d2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


