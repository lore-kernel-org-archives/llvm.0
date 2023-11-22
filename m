Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D3A56B90;
	Wed, 22 Nov 2023 15:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VJ79rfoQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69230C433C8;
	Wed, 22 Nov 2023 15:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700668220;
	bh=EAuNV6GFL1gROKV359hi74ROMi6D7CaImnK5M9xYF7A=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=VJ79rfoQvdBfUeuE7YQtYQaT473nPmyP9qzkIuYJb3Lbs6O3L0ExwIhow9kjnYby+
	 x3kaM2f7EP0KQDdjcboyMQYv2dTvj/lMTHvZO/jgTaQtt2GHT52r6/FYojpl59S5iW
	 5/8j/Yf5Uqcaji9tAeVbR94Ty5MeZ8s452N/1qiBfQArJviG7lwmf9n3xE+41pRa53
	 ZUm71aHX0g6yBVSLii4cWS9UKEqdavhZz0kwVB6rSgFN87wH5gVj3uU3UBgTMIhcyo
	 WT552Lh7LfBQGXc/VRa2oQ4fu9jn+L8WsQQh0D8IJYitRaFmTwCwfqjb1mQTypDafG
	 rxNXROb760XTw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: wifi: mwifiex: mwifiex_process_sleep_confirm_resp(): remove
 unused priv variable
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231115092328.1048103-1-suhui@nfschina.com>
References: <20231115092328.1048103-1-suhui@nfschina.com>
To: Su Hui <suhui@nfschina.com>
Cc: nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
 Su Hui <suhui@nfschina.com>, briannorris@chromium.org, lukas@wunner.de,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170066821641.4178710.6166900995489303046.kvalo@kernel.org>
Date: Wed, 22 Nov 2023 15:50:18 +0000 (UTC)

Su Hui <suhui@nfschina.com> wrote:

> Clang static analyzer complains that value stored to 'priv' is never read.
> 'priv' is useless, so remove it to save space.
> 
> Signed-off-by: Su Hui <suhui@nfschina.com>
> Acked-by: Brian Norris <briannorris@chromium.org>

Patch applied to wireless-next.git, thanks.

a85198c9f068 wifi: mwifiex: mwifiex_process_sleep_confirm_resp(): remove unused priv variable

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231115092328.1048103-1-suhui@nfschina.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

