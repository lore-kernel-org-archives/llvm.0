Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFC62F37
	for <llvm@lists.linux.dev>; Fri, 31 Mar 2023 13:53:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDBC9C433D2;
	Fri, 31 Mar 2023 13:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680270804;
	bh=iobnNx/k4Sc2xMbYMQJiH+DrwwFFMu9MAZjj3G/BEow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a4SmCF/0mzYQdQsMPReJLAifywz8g/9ccxuuOc1zINTi9oWXgfjZXskwB+h6Q1+9U
	 kRPzZtTwMFZ9VzXer4L2cmi5Q9JtH7bgugAkEbvxfphndLHu69CmyzZm+qpNQem4Tf
	 x2ZwXLfgcKWeXkh9uIlQbedWp71McJMkSI07P1J/jcRMN0x42NV4eULjpXvJ4HBZ4C
	 4gESQ3fKOPHhAYILMfymW9G7D5oAW6JG2AifhtQfSF7Xkr7m0Pe0q1MmmyKIKnL+M5
	 P5pXXoxDc5uH7pEaFq4X9A74IlcMTvvJnWU9AIpGWOMTHUWzkkQN7nSCV+6hHbZYo2
	 ypHyZgTPOOuRQ==
Date: Fri, 31 Mar 2023 19:23:20 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Tom Rix <trix@redhat.com>
Cc: kishon@kernel.org, heiko@sntech.de, nathan@kernel.org,
	ndesaulniers@google.com, linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] phy: rockchip-pcie: remove unused phy_rd_cfg function
Message-ID: <ZCbl0Aa7gtvXZ/58@matsya>
References: <20230321122503.1783311-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230321122503.1783311-1-trix@redhat.com>

On 21-03-23, 08:25, Tom Rix wrote:
> clang with W=1 reports
> drivers/phy/rockchip/phy-rockchip-pcie.c:122:19: error:
>   unused function 'phy_rd_cfg' [-Werror,-Wunused-function]
> static inline u32 phy_rd_cfg(struct rockchip_pcie_phy *rk_phy,
>                   ^
> This function is not used, so remove it.

Applied, thanks

-- 
~Vinod
