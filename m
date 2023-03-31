Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11833256F
	for <llvm@lists.linux.dev>; Fri, 31 Mar 2023 12:28:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0377BC433D2;
	Fri, 31 Mar 2023 12:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680265698;
	bh=Pg0DePMuJKjZlovJ/nySaK2os7XdKXlA34IFzgpt8o0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C2lph4njsRBU2k/ZsecfHCbNIg89ivSOUsOtARY6SQmK12owwMrvJyLJ6uOlmdxTL
	 glEq156FXxFU1pbUUGk7BSqoCrN8Za1LfIP2XUctcHEbSHt9rmslnWs3ht0ZXYjHrq
	 pkhHQMkm1Z4X4v3XQDpFwx5T4j3pS4h+8fKSLyiOQfSb2IcIir+NKCMCHunK1X/cYb
	 fGPVxShah7ekESAZk9SDytzrqbRvGHk+O8Ny286yH6eNID/8il8QvclehI/DLTt7Ef
	 /qIFkqb3g+SbFhDnILCOaFkrmZ7vRQop17dNvEt/W5PcNx/WORmA7ct7LDYfJEhDFE
	 nINBvSIULnOMQ==
Date: Fri, 31 Mar 2023 17:58:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Tom Rix <trix@redhat.com>
Cc: gustavo.pimentel@synopsys.com, nathan@kernel.org,
	ndesaulniers@google.com, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] dmaengine: dw-edma: remove unused readq_ch and writeq_ch
 functions
Message-ID: <ZCbR30KbAouGwicz@matsya>
References: <20230320234906.1730308-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320234906.1730308-1-trix@redhat.com>

On 20-03-23, 19:49, Tom Rix wrote:
> clang with W=1 reports
> drivers/dma/dw-edma/dw-edma-v0-core.c:162:20: error:
>   unused function 'writeq_ch' [-Werror,-Wunused-function]
> static inline void writeq_ch(struct dw_edma *dw, enum dw_edma_dir dir, u16 ch,
>                    ^
> drivers/dma/dw-edma/dw-edma-v0-core.c:185:19: error:
>   unused function 'readq_ch' [-Werror,-Wunused-function]
> static inline u64 readq_ch(struct dw_edma *dw, enum dw_edma_dir dir, u16 ch,
>                   ^
> These functions and their wrapping macros are not used, so remove them.

Applied, thanks

-- 
~Vinod
