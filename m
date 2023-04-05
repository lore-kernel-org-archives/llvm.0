Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DCC622
	for <llvm@lists.linux.dev>; Wed,  5 Apr 2023 08:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E50EC433EF;
	Wed,  5 Apr 2023 08:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680683961;
	bh=dhFI2ergYdPcVtaYz5CXtSEukcIvS2GwqaX9nKDBxLQ=;
	h=From:Subject:Date:To:Cc:From;
	b=dl1bFMpVOzblCxjdT5NaMvuz1xLXrQuBGlMIfBGI27tB/FaXIOh3s6YBB2/Da59TE
	 ir1z8E26bPZN7+AHORAWNEegryBlPgjkgMPqHSg+vEpf52a2ckrWhAsvv2JjyQu95d
	 npL23VVr4KYaRferRILPX4wb0KYY8PNplfNfgxAIUhszzdcXaBznzHmeo/njdYN8G8
	 kExzU8SUlG/GOFDu/V4WBRq3e/VlE35mgVR0IAI47YYa4HWjzkd6+JvYcN8lvSD1Ga
	 kZOPEEzfdRo0C65Df2Amx2HXS6c52FPp/PKw4V7aetmAEWCDIyHm73pgVoR7+ePMoY
	 ILfCMghRF/4Qw==
From: Simon Horman <horms@kernel.org>
Subject: [PATCH net-next 0/3] ksz884x: remove unused functions and #defines
Date: Wed, 05 Apr 2023 10:39:15 +0200
Message-Id: <20230405-ksz884x-unused-code-v1-0-a3349811d5ef@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALMzLWQC/x2NQQqDMBAAvyJ77sIaLYZ+pfQQk00NlbVkTQkV/
 97Q4wwMc4ByTqxw6w7I/EmaNmnQXzrwi5MnYwqNwZAZaKQrvvRr7VixSFEO6LfAGMlNQ6Bo+8l
 AK2enjHN24pfWSlnXJt+ZY6r/1R2EdxSuOzzO8wfylMsfhAAAAA==
To: Jakub Kicinski <kuba@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-Mailer: b4 0.12.2

Remove unused #defines and functions from ksz884x driver.

These #defines may have some value in documenting the hardware.
But that information may be accessed via scm history.

---
Simon Horman (3):
      ksz884x: remove commented-out #defines
      ksz884x: remove unused #defines
      ksz884x: remove unused functions

 drivers/net/ethernet/micrel/ksz884x.c | 718 ----------------------------------
 1 file changed, 718 deletions(-)

base-commit: 054fbf7ff8143d35ca7d3bb5414bb44ee1574194

