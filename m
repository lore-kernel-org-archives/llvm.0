Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B7763B7
	for <llvm@lists.linux.dev>; Thu,  2 Feb 2023 13:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3600C433D2;
	Thu,  2 Feb 2023 13:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675343133;
	bh=KfapbWZaHoGL2lh75PlRq+/iMY1cexe2VdJrOWRjZsk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YK13koIN2gnXc469qf/9k9La3ph+csCibap5vcuqGJE+8Hy2LrBEf4B2yAPV/w7h6
	 Nuf3QpHGm+Wn16/BIrp/mrc3meqhMvRZO/bPon0zGydLMWw2C6xzOQ2NkUD/+KGmut
	 QWUIdocqn55FkMzRI5oY6y12uxx497Lkt4a9n1QvhzaWZOVBcg+lQ4tPqYALwL5pfY
	 AORJMBJsJ1NmStBnwAAS1gaBjc5GwM4QQl2UsdlrS3kYdyy1N9dGEWAxIfEYs3Xu0E
	 a3vvbscn8VK1P8ciiKCuUhUk54YdUGVOOzPI5TFTCbbiW6D175bmVkvb4nI3BCYHov
	 AkChSan7JfKqw==
Date: Thu, 2 Feb 2023 18:35:29 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Eddie Hung <eddie.hung@mediatek.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v7 1/3] phy: mediatek: remove temporary variable @mask_
Message-ID: <Y9u1GXaVJ0FKXWnu@matsya>
References: <20230118084343.26913-1-chunfeng.yun@mediatek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118084343.26913-1-chunfeng.yun@mediatek.com>

On 18-01-23, 16:43, Chunfeng Yun wrote:
> Remove the temporary @mask_, this may cause build warning when use clang
> compiler for powerpc, but can't reproduce it when compile for arm64.
> the build warning is caused by:
> 
> "warning: result of comparison of constant 18446744073709551615 with
> expression of type (aka 'unsigned long') is always false
> [-Wtautological-constant-out-of-range-compare]"
> 
> More information provided in below lore link.
> 
> After removing @mask_, there is a "CHECK:MACRO_ARG_REUSE" when run
> checkpatch.pl, but due to @mask is constant, no reuse problem will happen.

Applied, thanks

-- 
~Vinod
