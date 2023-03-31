Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3213C0C
	for <llvm@lists.linux.dev>; Fri, 31 Mar 2023 14:44:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6929CC433D2;
	Fri, 31 Mar 2023 14:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680273851;
	bh=AyJEp8Qrm14ORPXi2o2SkZpKu/1ofjd+BttEkyNYbbQ=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=BOSTvjk3Eyg/zSTEqcBKdxfrAwTuhzo/pnnqXMJ/G1m7/jLYyIxJBjX5OXdYwjr68
	 TUl9YJGKG0nWiiY6C+To+3rKz8kQL9RLSEn97Qi8w9RulQAxJA3jGWO87x1M+2FcoP
	 AXa7qWI13KT45fkq4bnmKWkoVaPr2U+zrd7FusmBeq45K5UkUrbR64fO1TpSOuY/hj
	 ea1UfN/NnUN+RVIVv9OnPOY8B/yEAXM9sL6wv4upNgO9EDu7N1Qh2COwVTR6wpAQh+
	 7FAh9NIJo04MyGjvttCB3SmlSG3Z670oq70AIAfNQbGvrr1fB7qToaPRgAAdZoaZuk
	 09blVBvFi4Ixg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: wifi: ipw2x00: remove unused _ipw_read16 function
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230319135418.1703380-1-trix@redhat.com>
References: <20230319135418.1703380-1-trix@redhat.com>
To: Tom Rix <trix@redhat.com>
Cc: stas.yakovlev@gmail.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, nathan@kernel.org,
 ndesaulniers@google.com, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Tom Rix <trix@redhat.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168027384396.32751.618340608472919445.kvalo@kernel.org>
Date: Fri, 31 Mar 2023 14:44:08 +0000 (UTC)

Tom Rix <trix@redhat.com> wrote:

> clang with W=1 reports
> drivers/net/wireless/intel/ipw2x00/ipw2200.c:381:19: error:
>   unused function '_ipw_read16' [-Werror,-Wunused-function]
> static inline u16 _ipw_read16(struct ipw_priv *ipw, unsigned long ofs)
>                   ^
> This function and its wrapping marco are not used, so remove them.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Patch applied to wireless-next.git, thanks.

c7e39d70613c wifi: ipw2x00: remove unused _ipw_read16 function

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230319135418.1703380-1-trix@redhat.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

