Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF55823A7;
	Wed, 18 Jan 2023 06:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69155C433F1;
	Wed, 18 Jan 2023 06:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674022816;
	bh=U+eNEB5pNf8kJmepNcqpl0b8ZASJfSpZAWblE67GOSs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SXa1X8Fb6lOcdn6fwdgaYo3eQqBjB19k31Zh47D2XmjKm7FWQ1ReUdnh9ixQot7xX
	 xlZCLMpRHfOepCKHbkyVhyo2E7XjFFWvYXtiqvbv615o3f7r6bOEuqe1WdZOtl8xxQ
	 zZoO56VHfUUyos9ayB1V6zPWCvRLZNxRpwuDll1Lk+soK3oXHAm/fslWrEAZ961vjz
	 Qy7W8IywzujXfB70G1f8IZtfcTB1gPPkuG0YV7JvujYbNoFNCaTGd0iIocJNU4bNxe
	 U2oVI/WKqbiwNV8kZDySv7OHsuIzGE7ZYvLH4ga065ui5Gbx0vtCGkgW65S31w/hPa
	 97sKvgbjslK+w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4E855C73FE7;
	Wed, 18 Jan 2023 06:20:16 +0000 (UTC)
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
 <167402281631.11174.10502033632687140262.git-patchwork-notify@kernel.org>
Date: Wed, 18 Jan 2023 06:20:16 +0000
References: <20230117080254.2725536-1-tzungbi@kernel.org>
In-Reply-To: <20230117080254.2725536-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev,
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, lkp@intel.com

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
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


