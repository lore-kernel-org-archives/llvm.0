Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FDA6FBE
	for <llvm@lists.linux.dev>; Mon, 21 Aug 2023 13:51:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE4DC433C9;
	Mon, 21 Aug 2023 13:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692625914;
	bh=Ij1Fky1SzjNGU19dxA9VEMP/m+IgopJUmHpYOQtDxZk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NYdogs3jbqTRkOYTYeZW38QExUCqBvCA+ZyJaiEMrZb5K31onx0mb1UBwO5k5IVwP
	 IT6qGW3XAth0Kw2j7EAxjLdnDge2Fi1kZysQJsY6uOEhaat8e89GmMAkYqEyAoVFIQ
	 sB9BXEKd1hsXJHJGI733yUgpFnL76W7eeSVXnaXZOIJRG4n2Pi1NZIGCN75+l7tFwi
	 YHmZ3+u05XVjzC3VgkXFZ5XuyOYaSviUHhfGYk+MtIak1VHu2GfHwzwVTTiKSHTD27
	 hfC4QD6EEEdsz8KWx10/OH+hsePhIQrUJz0rhht3NcG+XiT/agnD2DSL/wFbAdDnAP
	 fsq3YFYa4VdUA==
From: Vinod Koul <vkoul@kernel.org>
To: =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
 Justin Stitt <justinstitt@google.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev
In-Reply-To: <20230816-void-drivers-dma-owl-dma-v1-1-a0a5e085e937@google.com>
References: <20230816-void-drivers-dma-owl-dma-v1-1-a0a5e085e937@google.com>
Subject: Re: [PATCH] dmaengine: owl-dma: fix clang
 -Wvoid-pointer-to-enum-cast warning
Message-Id: <169262591106.224153.11282362277012403845.b4-ty@kernel.org>
Date: Mon, 21 Aug 2023 19:21:51 +0530
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Wed, 16 Aug 2023 20:12:50 +0000, Justin Stitt wrote:
> When building with clang 18 I see the following warning:
> |       drivers/dma/owl-dma.c:1119:14: warning: cast to smaller integer type
> |       'enum owl_dma_id' from 'const void *' [-Wvoid-pointer-to-enum-cast]
> |        1119 | od->devid = (enum owl_dma_id)of_device_get_match_data(&pdev->dev);
> 
> This is due to the fact that `of_device_get_match_data()` returns a
> void* while `enum owl_dma_id` has the size of an int.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: owl-dma: fix clang -Wvoid-pointer-to-enum-cast warning
      commit: 1fbda5f4c7c1c8bd51cd3bc3d2ff19176c696b74

Best regards,
-- 
~Vinod


