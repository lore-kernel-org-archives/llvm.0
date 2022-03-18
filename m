Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FAE4C99
	for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 17:40:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C420C340E8;
	Fri, 18 Mar 2022 17:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647625257;
	bh=y1kSwAeyUIPDD0WUz6meKPi7vm54XPFekIW69rri3cY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HCL2ClCbITt12Y9eqokJetjwA0tRnCwNDm412G4Ql1rs+kWvAlzVKXsC8JYDGSL6N
	 U95VkEqvnmbPNsg70bQc3bXxthHOUgXO69AT6NvQY4n1qkVYJ9GG//g5fduPgexaPE
	 0GZszFFZisqQiqD2OYD4MfVPlOx/c5HSdQS1g6vgGdX6g+HWh44YlOR81IrVV1mpVu
	 WIvlIaxL+7EE0zpw+10uHxyJxhabj6naed5nh4COB+flhrzzD/0ZxLE5Ceryx4Jyrh
	 vlVvBagxU0tJXKlRUdk78I8efZb7AM7NXI1xG8GhoEHVadnigj7Y9fV0kwk6Jynhgf
	 FReVWA2JgrjHw==
Date: Fri, 18 Mar 2022 11:40:55 -0600
From: Keith Busch <kbusch@kernel.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>, linux-nvme@lists.infradead.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] nvmet: remove redundant assignment after left shift
Message-ID: <YjTEJx2Uk2RN1+p5@C02CK6Q3MD6M>
References: <20220318013014.90698-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220318013014.90698-1-colin.i.king@gmail.com>

On Fri, Mar 18, 2022 at 01:30:14AM +0000, Colin Ian King wrote:
> The left shift is followed by a re-assignment back to cc_css,
> the assignment is redundant. Fix this by replacing the <<=
> operator with << instead.
> 
> Cleans up clang scan build warning:
> drivers/nvme/target/core.c:1124:10: warning: Although the value
> stored to 'cc_css' is used in the enclosing expression, the
> value is never actually read from 'cc_css' [deadcode.DeadStores]

Looks good.

Reviewed-by: Keith Busch <kbusch@kernel.org>
