Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51090364049;
	Mon, 22 Jun 2026 09:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782120116; cv=none; b=YDa7S58lQIqcuqI2X0QtnBA4oJM7ujUehI1cjwKpz9devoizutfYwROg8tkMdZg6+QPqmV1ctpIvz3QgLLxMcBt+ziyyo7prDYecrgjSQxraTmm4nscrCspTWxhVkJbQr4+1SQA2KyDO4917y3Bm05iIexoKxUvCtUtMpMQyU24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782120116; c=relaxed/simple;
	bh=uHVf0Jy6vUIHuqEDqyAkWupfMY5pJ7s8MtJ34TcNuuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pN4g+OT2enOL8eGZnGtNNjRGkl4v8N+gDhHPsMB6KbcUaJ8KbwOPwuq4hhSng4lSEHP99s1FsNCMRY3vsaNYpdq8ZrJuFeFfl2iVNgBficwILsTtKjjBhH8gJHKerB+V6Ejv8lJdSjgjA0dGSJC6s54J1Qqym8KW85ZzgYx0AzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oQu3Jp12; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oQu3Jp12"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 976721F000E9;
	Mon, 22 Jun 2026 09:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782120113;
	bh=77wIqgo4jFeWA0NXSl8ibtCsUhwVKZwgljHlmjkSEoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oQu3Jp12M+W3sDDSDWTuMxQM8AiP6aGolGm18QnoHyGoKNq6o2sFA4yzKsJyPpBuK
	 vBqQP8kZjsflOBIZZuF5vlOnYQ9JpZbgvder+l0ESgiEukgdBCimwROWLOAmI9lgcw
	 94SYsR3d72svwtCy5vMjijm0SaOm/rRO5mxqIpbsB69N4a+6c6Aiuu3YBHu4VeKndY
	 gF3YJ0hsexLVOKVgzINnZHm7Tq7VTvSrf8Ur7E1tSmZpNoiKIl8w+KvkPrd634vAW/
	 GFfJBCLrvWjVC+L1yhpVzEJTj1LI1OB8QzK5EUS7eR+V0kv71YnNMApnw4hrmy4qBn
	 JQlXP+pP8f39A==
Date: Mon, 22 Jun 2026 11:21:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, konrad.dybcio@oss.qualcomm.com, 
	dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: qcom,usb-hs-phy: add
 qcom,hs-drv-slope
Message-ID: <20260622-thankful-vehement-bittern-0edc8d@quoll>
References: <20260616-submit-phy-usb-hs-vendor-init-seq-v3-0-7d21fb1d1484@herrie.org>
 <20260616-submit-phy-usb-hs-vendor-init-seq-v3-1-7d21fb1d1484@herrie.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260616-submit-phy-usb-hs-vendor-init-seq-v3-1-7d21fb1d1484@herrie.org>

On Tue, Jun 16, 2026 at 03:26:53PM +0200, Herman van Hazendonk wrote:
> The MSM8x60 / APQ8060 PHY needs three vendor ULPI register tweaks for
> stable USB operation: pre-emphasis level, CDR auto-reset and SE1
> gating in registers 0x32 and 0x36.  A survey of MSM8x60-class
> downstream board files (Qualcomm SURF/FFA/Fluid/Dragon, Samsung
> Galaxy S2 family, Sony Xperia, HTC and HP TouchPad) shows that those
> three values are identical across every reference board and can be
> hardcoded in the driver behind the existing
> qcom,usb-hs-phy-msm8660 compatible.
> 
> The only board-specific value is the 4-bit HS driver slope in bits
> [3:0] of register 0x32:
> 
>   HP TouchPad                                  5
>   HTC MSM8660 ports                            1
>   Qualcomm / Samsung / Sony reference boards   0 (silicon default)
> 
> Add a qcom,hs-drv-slope property carrying that 4-bit value, valid
> only on the qcom,usb-hs-phy-msm8660 variant.  When the property is
> absent the driver leaves the silicon default in place, matching the
> behaviour of the Qualcomm reference platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

