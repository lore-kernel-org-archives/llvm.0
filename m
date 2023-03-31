Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7B2256F
	for <llvm@lists.linux.dev>; Fri, 31 Mar 2023 12:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF46C433D2;
	Fri, 31 Mar 2023 12:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680265686;
	bh=Hr/XK3TZ4xTRxTLCywjpNnOkygP2/qvs28NoAAX1LAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A2M2Yk7xjb8X/Bsg2juFV9TLplaW6OrVAyftk+nrPKmWQvxvj0AaKT4jkie/td/NR
	 eZMmK0XpMB2+gZIT0W81WUDw+PsnbmftR+YJz9YDH4OMv9IL6GJpLBOZUdGy00pgDP
	 l5IzF8zNxZxrNFkdG80+MqCJ7/l9gYvDMBeX3JhKv4b2aB9cWITyNlQX0tD9Gh0KX2
	 IhtmY+FEVWvFoUnzDIkpHeneVcowm2BfUFztah/cLu4EY8uddZ1uCHF2mqKWzJPao0
	 mOVZV/B4cFhRm6jyIbJt+txExQTf2NpN2pqLTNYdVw/bpOXzWeRAE9i5vMJIBM0JtD
	 UKpwYtdpITD4A==
Date: Fri, 31 Mar 2023 17:58:02 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Tom Rix <trix@redhat.com>
Cc: peter.ujfalusi@gmail.com, nathan@kernel.org, ndesaulniers@google.com,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] dmaengine: ti: edma: remove unused edma_and function
Message-ID: <ZCbR0h7ZgQ2HL7ZB@matsya>
References: <20230320231209.1728940-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320231209.1728940-1-trix@redhat.com>

On 20-03-23, 19:12, Tom Rix wrote:
> clang with W=1 reports
> drivers/dma/ti/edma.c:321:20: error: unused function
>   'edma_and' [-Werror,-Wunused-function]
> static inline void edma_and(struct edma_cc *ecc, int offset, unsigned and)
>                    ^
> This function is not used, so remove it.

Applied, thanks

-- 
~Vinod
