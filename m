Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795264272;
	b=FXJAo+dF2W6Z1/egxKfQOD++L8hHmDMNDbqA1DHfqWPeX800bISGcyHhro1mZBgojyqe
	 ZcU55OqVlgw/v9RPoEMQqJ9CT2dWIgHCsf1/ykh5sMQhG0EPa8p0GfQGjSYc3jN7ZjLxV
	 ICnWPb/Xtx0KDIKKRtmsXRF5+jjyyvRgc2CPqW2WaERC8J7QXN7Zv50CyKwt1s0MYwyRH
	 jBv5cUr5PMbrV7KhOkpD0SjD6qqy/g42dZZGMBGulwwaVm7vYHVEKcStUMYlE+hGSiWDR
	 jrlJIJkamdIJypYJAVM0vl8ep6GYToyDfgBDExTPA3LnQ9CQms6yxeLnBR3RrNYHCVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795264272;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=a+8c7yffJQ5BVh3ZLy2LMawlt2ATsxt0KRFpWXeqlm0=;
	b=zk9/V1n/i2H2FMrMELzv8YJjck6vZ29mIg2MAxY7SaC0e/WyugP3rLtylmYzhND3So6W
	 VGfruZft0PQzKNyG554b0iSzGpCeMuIFLKAQMh9s3ten2mgMnk2kTQioU7SLzWUy70Se/
	 TEsIYtB2QaEjcpYs/1Gj9K6uLISOO73DCvk9IQ/SgkwU3FfZlBvwd16FSXElfF7cgzIIS
	 AP6sQoOEimydwhTVMj+3TxwGTbARjrm6hxX32zz6dOgWHhtAMFMkp00VooMKL7eB5B0Sn
	 vMBaaAYullCEEJUA8813MT78IRXL0bTMMWEUb1R7KmJAGkt0RBuSED9i9PeiJKxhS1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=af5LBooQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA4B606A320;
	Sat, 21 Nov 2026 12:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=af5LBooQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64A821F000C0;
	Sat, 21 Nov 2026 12:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795264272;
	bh=a+8c7yffJQ5BVh3ZLy2LMawlt2ATsxt0KRFpWXeqlm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=af5LBooQcrrs3jQoYDZH+bAiPNrTpj0EX+kY6amVx9sW4kPNQtkjWXKOJ/476trjL
	 uAJsIsp3B74GrQWc2A2DnQWfF5HWB8EN4Z33bB5oI5Ako3CL3WZhaCJM0hJyrKJ00Z
	 kOfPXMEFuWdfo7g2TrpPdCSqvdkrhyEstzGP/G/c6uB7yw8Da0xEQP5oOlXeOTvpyI
	 wtmabKDA+B1fyHtugmStV7wHjD8Yg5fyjYQVb6pPqz88FBchUtxBaklJKKXVSuJMRi
	 4u9de1vCr/jTuDjPh3EJjV7+CN9apNjOwqGzZw/fq2TSnew+XStwLI9zzKGgrDY0NU
	 7/kgfOBHBTpUQ==
Date: Sat, 21 Nov 2026 13:31:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, ath12k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH ath-next v3 06/15] wifi: ath12k: add initial Wi-Fi 8 hw
 params and init helper for QCN9575
Message-ID: <20261121-demonic-dove-of-improvement-2e73ae@quoll>
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
 <20261118-wifi8_qcn9575_bringup-v3-6-9875d2a3953f@oss.qualcomm.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v3-6-9875d2a3953f@oss.qualcomm.com>

On Wed, Nov 18, 2026 at 01:45:29PM +0530, Madhavan Ganesan wrote:
> +int ath12k_wifi8_hw_init(struct ath12k_base *ab)
> +{
> +	const struct ath12k_hw_params *hw_params = NULL;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(ath12k_wifi8_hw_params); i++) {
> +		hw_params = &ath12k_wifi8_hw_params[i];
> +
> +		if (hw_params->hw_rev == ab->hw_rev)
> +			break;
> +	}
> +
> +	if (i == ARRAY_SIZE(ath12k_wifi8_hw_params)) {
> +		ath12k_err(ab, "Unsupported Wi-Fi 8 hardware version: 0x%x\n",
> +			   ab->hw_rev);
> +		return -EINVAL;
> +	}
> +
> +	ab->hw_params = hw_params;
> +
> +	ath12k_info(ab, "Wi-Fi 8 Hardware name: %s\n", ab->hw_params->name);

Drivers should be silent on success (see coding style doc). This is not
even called anywhere, so difficult to follow any logic here how is this
supposed to be used, e.g. if this is initcall then clearly NAK.

Organize your work in logical chunks instead of adding bunch of
functions without users.

Best regards,
Krzysztof

