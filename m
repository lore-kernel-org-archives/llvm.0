Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A0D15A9;
	Wed, 18 Jan 2023 03:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 32792C433F1;
	Wed, 18 Jan 2023 03:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674010818;
	bh=en4X5NaR70yROFCBjTbSI6AU79L5G1uzq0JlRdumte8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fm0zCnU4RF+EnFVlT6t8F98p9E6rCFdGqTmLAH23CsrH2uD8QchXJMJONAPqvAD1v
	 i5A0l8IHifxBn5rGir76dDMJbpSt7XdJ3rjlJJyqQ3+dW9QFXrl+hQKXQXEPxnpdjr
	 c/8wco0MeW4Eii+8UnyYdtexJBaIh5jtUGrXXNibiJwBnPAVXMZ55KPWRnhhJDxrGV
	 m0UznS4DRQrxP0IFeri+b3XzaePPuoN9IBVpcuymrAmmGyntIsNMu2xnzw8FtPe8JJ
	 6pWi0fezTmEEDOvxXUT4mRlUbfibCWR0hfI668lBJkge0atEBu2TJsdKJUR8M0+joV
	 rsVl+9gYakTUg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 165D6C40C5E;
	Wed, 18 Jan 2023 03:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform/chrome: cros_ec_proto: remove big stub objects from
 stack
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <167401081808.470.4572845719084684023.git-patchwork-notify@kernel.org>
Date: Wed, 18 Jan 2023 03:00:18 +0000
References: <20230117080254.2725536-1-tzungbi@kernel.org>
In-Reply-To: <20230117080254.2725536-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev,
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, lkp@intel.com

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Tue, 17 Jan 2023 16:02:54 +0800 you wrote:
> sizeof(struct device) = 680
> sizeof(struct cros_ec_dev) = 720
> 
> They tend to exceed the stack frame size limit in some specific
> environment which results in the following compilation error:
> 
> >> drivers/platform/chrome/cros_ec_proto_test.c:2530:13: error: stack
> frame size (2128) exceeds limit (2048) in
> 'cros_ec_proto_test_get_sensor_count_legacy'
> 
> [...]

Here is the summary with links:
  - platform/chrome: cros_ec_proto: remove big stub objects from stack
    https://git.kernel.org/chrome-platform/c/6514bac4a321

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


