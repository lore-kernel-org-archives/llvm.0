Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D882256F
	for <llvm@lists.linux.dev>; Fri, 31 Mar 2023 12:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 006BAC433EF;
	Fri, 31 Mar 2023 12:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680265288;
	bh=qjxhFHgRDKgQd0YZIE0gdI9Qd2axFPOwPWgUbDSQUaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mjfOzE6l1QTG4/mErNaWoZBjJ1alTHmmqTbWlj+5N5HCCooR637lHTBfQHwEeFt4D
	 vFGQhHaBZrNjWvp9vTdQxKhhu16ybMT0JOUWFoGHJk1kKZmP22DF5JExOyCQeQ2ZWh
	 ldx8cQqIlk+32qX7cItCeZ5ghpVN7/iAcL2qDhOsdcM+ZYc38/l0Q3wSmB8HV5tz9C
	 OYd8gnolfbdxFl3IV6GfRZt4/B+Sp8MiHkc9Hdul58p9biodYvaZyu9vkUWISrCGU5
	 5ORZvdqa6C79BB4N8yxxXwXXhSlgZSmWqEGCNyNGvEDrGldPKlR4WUiD38iNWhwqEg
	 7zMd2cwPOsfFA==
Date: Fri, 31 Mar 2023 17:51:24 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Tom Rix <trix@redhat.com>
Cc: ldewangan@nvidia.com, jonathanh@nvidia.com, thierry.reding@gmail.com,
	nathan@kernel.org, ndesaulniers@google.com,
	dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] dmaengine: tegra-apb: remove unused tdma_read function
Message-ID: <ZCbQRE9MS1Jg43uP@matsya>
References: <20230322121001.2569909-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322121001.2569909-1-trix@redhat.com>

On 22-03-23, 08:10, Tom Rix wrote:
> clang with W=1 reports
> drivers/dma/tegra20-apb-dma.c:236:19: error: unused function
>   'tdma_read' [-Werror,-Wunused-function]
> static inline u32 tdma_read(struct tegra_dma *tdma, u32 reg)
>                   ^
> This function is not used so remove it.

Applied, thanks

-- 
~Vinod
