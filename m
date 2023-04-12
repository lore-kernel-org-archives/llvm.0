Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB89E6121
	for <llvm@lists.linux.dev>; Wed, 12 Apr 2023 16:18:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C52C7C433D2;
	Wed, 12 Apr 2023 16:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681316283;
	bh=ekb4B5t2XeTS1EzHo39Eex1si9nprBeZ4QjX7H+9Rz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uKofJ1OApH9Tb+TfEPSfQN1530xUSfbnwpIJcEjtaGGYgowFKpuqlBVwNpoIUQrJB
	 riI1RmGgq7N5nuNHwWyQm3gSg41TQWX0Zf50YmU3RHxxAR/s2XHSvIjrW3AireZG0S
	 yFA6gfH3qhCWAnaq/WpYjhg52ITRSpo2R5VQpLycpW8Do2yMt3QPQw7Qf7rek8jQnl
	 CHwiAE5qg+JmANL22jpFIdTSZaX6RnBUuxzntw3++veEgg7N1nPRE+CtAbugPS1Y0c
	 BoHLNkMAy3JLli0Gl8gWiGlP+MZ7SgMJH3ntaIsLY9IoUwGYVqIUq7pJbNYmW6kOTl
	 pbrdS/pzthWPA==
Date: Wed, 12 Apr 2023 21:47:59 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Tom Rix <trix@redhat.com>
Cc: kishon@kernel.org, heiko@sntech.de, nathan@kernel.org,
	ndesaulniers@google.com, linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] phy: rockchip: remove unused hw_to_inno function
Message-ID: <ZDbZtwc278NRc+vy@matsya>
References: <20230324132649.2649166-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230324132649.2649166-1-trix@redhat.com>

On 24-03-23, 09:26, Tom Rix wrote:
> clang with W=1 reports
> drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c:284:36: error:
>   unused function 'hw_to_inno' [-Werror,-Wunused-function]
> static inline struct inno_dsidphy *hw_to_inno(struct clk_hw *hw)

Applied, thanks

-- 
~Vinod
