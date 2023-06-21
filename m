Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D498E19E5A
	for <llvm@lists.linux.dev>; Wed, 21 Jun 2023 18:08:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D2E6C433C8;
	Wed, 21 Jun 2023 18:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687370905;
	bh=Ilmbq3lRTsDXxIeuCsvSBkem45vmJYvfQqpkYO6UnhA=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=LLa4z57eFw6O8Z8Tbs4K+hqhYfPCTMrCkeeifGikvfq7fJ0nLbWrwgPn/zLzC+Owb
	 bg8J+7X+KbQzuSquLX1BrG5ebFlbdjvTwHfp4vwssLSyhvhMmFOkzsL7JE+8S6faMa
	 Gd+j0ZIyD/V/9XLhUnqhO7E/LHcaizXV1OEQHlmbZdj6cY3G2wIFm7v51HPm+m0tEI
	 RhAAm2cnUFk8z1rGvjfxTuUqmnfm3LUFzCuMI1GfLiHZB9yHjdyqTTxaph65j29N49
	 fc4Y45OkmSmW+X42N8sp3fbne/Nxtum9uoqP92R5G26MpTQnEGyeQrDV09Xx+WkYgs
	 FTWy0U3bFGeDQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] ath10k: improve structure padding
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230616090439.2484857-1-arnd@kernel.org>
References: <20230616090439.2484857-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Kees Cook <keescook@chromium.org>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <168737090122.871827.14684779188680131550.kvalo@kernel.org>
Date: Wed, 21 Jun 2023 18:08:22 +0000 (UTC)

Arnd Bergmann <arnd@kernel.org> wrote:

> Including an aligned structure inside of a packed one is ambiguous
> and can lead to misaligned data, as pointed out by this clang warning:
> 
> drivers/net/wireless/ath/ath10k/htt.h:715:34: error: field prefix within 'struct htt_rx_indication' is less aligned than 'struct htt_rx_indication_prefix' and is usually due to 'struct htt_rx_indication' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
>         struct htt_rx_indication_prefix prefix;
>                                         ^
> drivers/net/wireless/ath/ath10k/htt.h:736:34: error: field prefix within 'struct htt_rx_indication_hl' is less aligned than 'struct htt_rx_indication_prefix' and is usually due to 'struct htt_rx_indication_hl' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
>         struct htt_rx_indication_prefix prefix;
>                                         ^
> drivers/net/wireless/ath/ath10k/htt.h:1564:2: error: field  within 'struct htt_tx_fetch_ind' is less aligned than 'union htt_tx_fetch_ind::(anonymous at drivers/net/wireless/ath/ath10k/htt.h:1564:2)' and is usually due to 'struct htt_tx_fetch_ind' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
>         union {
>         ^
> drivers/net/wireless/ath/ath10k/htt.h:1702:2: error: field  within 'struct htt_resp' is less aligned than 'union htt_resp::(anonymous at drivers/net/wireless/ath/ath10k/htt.h:1702:2)' and is usually due to 'struct htt_resp' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
> 
> These structures appear to actually need the packing since they
> are embedded at misaligned offsets. Add even more such annotations
> here to enforce bytewise access throughout the driver.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

12ec37be3faf wifi: ath10k: improve structure padding

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230616090439.2484857-1-arnd@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

