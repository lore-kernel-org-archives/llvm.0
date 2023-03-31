Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4873C21
	for <llvm@lists.linux.dev>; Fri, 31 Mar 2023 15:05:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53DB6C433EF;
	Fri, 31 Mar 2023 15:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680275110;
	bh=u2z6J3jRsS/j07wntF1hT4PjvQwSajS65sEvP62J69k=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=pBwakQG2gZXFi65zwBff9OaKVM7fzhh32/dePHg8fNOpOvJ0pCyVPAMr7KAFC1v07
	 BotB1JWg40JhfmzGbsgXCZNvCQwWC0pnCWZgH6ypjLs2DIoTgHQWDVHRZ9NGk90ULz
	 KBQI4oS+hoIFQnYOvRg7YPzlsKdRR8nfm9zkyKkfVgiWs9h5tpwRuboS0WU5SOpfR1
	 JU4W6HeGlY+Lq0xyTULNqZcfxMg1Egq0fF0NvqoYvd94YUX0bhhtwWNVaESSIYLRrU
	 1BuNRX6UPSWu3bv/GRgO/ij5SUs/eCqLS/YNgnagUz7GYbxJA+WvkfSrd6cZ/E/HgF
	 NxGZroDgCAnRg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] bcma: remove unused mips_read32 function
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230324190647.2654293-1-trix@redhat.com>
References: <20230324190647.2654293-1-trix@redhat.com>
To: Tom Rix <trix@redhat.com>
Cc: zajec5@gmail.com, nathan@kernel.org, ndesaulniers@google.com,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Tom Rix <trix@redhat.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168027510653.20708.5438883054982900442.kvalo@kernel.org>
Date: Fri, 31 Mar 2023 15:05:08 +0000 (UTC)

Tom Rix <trix@redhat.com> wrote:

> clang with W=1 reports
> drivers/bcma/driver_mips.c:49:19: error: unused function
>   'mips_read32' [-Werror,-Wunused-function]
> static inline u32 mips_read32(struct bcma_drv_mips *mcore,
>                   ^
> This function is not used so remove it.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> Reviewed-by: Simon Horman <simon.horman@corigine.com>

Patch applied to wireless-next.git, thanks.

21898a40b2f8 bcma: remove unused mips_read32 function

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230324190647.2654293-1-trix@redhat.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

