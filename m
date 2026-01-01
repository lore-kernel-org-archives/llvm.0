Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53EC2C11E7;
	Thu,  1 Jan 2026 11:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767265662; cv=none; b=gh9Qa/MY4HFMZsiESB9/5X5CVb5b0wLJRcb7scVYnD0+4mNqpzbkmjxHKsHrR18rJLilvzA6QtH7KeaHgzuDQj1Nz+cRqvx6Jtgg5Bm4yeKi1CpsYUFMYBEAhcwbcTxVMirMdr2R1fXUTmz9P1Pk9AtlN1c3bIgj/2bjxnRGTJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767265662; c=relaxed/simple;
	bh=EYcWz1jnZfK4e7EKWAUogtrN5osErH+nhOJp1YScoew=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lNOpURmTP03sMCORRxUPDO5j05w4QK29dhZ2JpBbrQenK3BqMH9jjed6ajh/LJd/AjudVZHCKiL2f/9LhSIgPWqLWZ8HgZJED/AfD+wW1av/bhwurExUSNuMhMBOqrfdDwB3KVpnE2bf8UqQlzn2bmlxU/P3wnEhZ+UMMTgg3vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y25HQiHO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y25HQiHO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 926EFC4CEF7;
	Thu,  1 Jan 2026 11:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767265661;
	bh=EYcWz1jnZfK4e7EKWAUogtrN5osErH+nhOJp1YScoew=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Y25HQiHOoFhvhEiNVU/sdWAjl/K+5pnhuCBvj8VujflppS1hafCVJMsse0VUXUzvF
	 fO+1uip4i6oNMWXkiLr+QckEn+yv8cnjd1QBzOPR7Z0QHhC226BDGC6X3X32+sK46W
	 4wyucXoj69mEQQEif52wtptSIfHH6pMBWXjH8u1p5Gos0A1dzGjYk5RiLlfmcldCYG
	 y3rN5I5+6XI6B8jTxgwtWfPNDjCYfmoS7OVZcspRawsursUFLP2AY6/Mpb+5xLQh2O
	 NqGLo/uSZwYUH0AkYi2xkNyDqlOH41tH2W7hcpGeci+AadOEGCWtU7gYx1o7QESkbY
	 qLYmwh/aCgdWw==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251224115533.154162-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224115533.154162-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] phy: broadcom: ns-usb3: Fix Wvoid-pointer-to-enum-cast
 warning (again)
Message-Id: <176726565821.201321.6387558248591118830.b4-ty@kernel.org>
Date: Thu, 01 Jan 2026 16:37:38 +0530
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 24 Dec 2025 12:55:34 +0100, Krzysztof Kozlowski wrote:
> "family" is an enum, thus cast of pointer on 64-bit compile test with
> clang W=1 causes:
> 
>   phy-bcm-ns-usb3.c:206:17: error: cast to smaller integer type 'enum bcm_ns_family' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
> 
> This was already fixed in commit bd6e74a2f0a0 ("phy: broadcom: ns-usb3:
> fix Wvoid-pointer-to-enum-cast warning") but then got bad in commit
> 21bf6fc47a1e ("phy: Use device_get_match_data()").
> 
> [...]

Applied, thanks!

[1/1] phy: broadcom: ns-usb3: Fix Wvoid-pointer-to-enum-cast warning (again)
      commit: fb21116099bbea1fc59efa9207e63c4be390ab72

Best regards,
-- 
~Vinod


