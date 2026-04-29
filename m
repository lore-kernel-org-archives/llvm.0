Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D28A2D0C63
	for <llvm@lists.linux.dev>; Wed, 29 Apr 2026 06:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777442611; cv=none; b=Up7HjFjtqOdMaxtBLJOc0xRHn9G97B82xBZ/Pfdi0yWavmY/MemWQjnXAu77G9dIT0ww+utP1/sEJlKLVVx4xlJ6j1DK9EtXQto6izNug/3+21smH/fKMxWj440rXLnP4RTyaN5RDaxtL5Wg9AccD0MUjB/gF3LsdgVC8x//rV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777442611; c=relaxed/simple;
	bh=WzpztBIFwMx1HqyUajdyUSSNz/O80ntx1j0+tXnJCuw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=TE1UzJyFrnZpGpyxp9E3IadgOBDPqnKcGMN2XKlDD/8R7ySHWupIJwwu7/d++la7sVfviVelydIXqqsi2jjsmxbdP7gnvgr1uUQJSd4peLwcFhtH9DDOTSm6tM0vxqtatXTTMmbg1QR+n7T+Nbji5mlcquR+R97TIUHJmu2P26o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=OJ7/bHzd; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="OJ7/bHzd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1777442600;
	bh=/RRTW6GJMQFD74GRMm5qCHethywFoA6NvTHxdjnYDRo=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=OJ7/bHzdqP/D/PBwqvTeqWZi/62SIyIkSFycBqGDuKddM02BTqzdlmY06gX8IFrzj
	 f7szli7NQY3+uJxDmDPwgXgmKCWCJ4VFW4Vxz7k7JPherp2pox/udntYGtCk9c8HWY
	 FkKjYE0+9CC64y+0L3n/Q33VkMcYL7LQhS1WXsGQapF/wsagr3uY2refEn9/E6LSrN
	 PdT8Ht5BDFFsbhZSp2hvhBlebRqLjoijmf4LHV3idy8swZR7I3nC6/T0XYhSqjbs/1
	 u5Nc+TgLJnbJz9d6iBelpLu79DlNQWnZD7cYUeDakUbEaRzrE/SI5QcMkEP5XpZvv+
	 WTDcbiZlsg9QQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4g56DQ1KV7z4wj5;
	Wed, 29 Apr 2026 16:03:18 +1000 (AEST)
Message-ID: <946b79c2-ae4c-40ed-997b-ac654e148d47@ellerman.id.au>
Date: Wed, 29 Apr 2026 16:03:17 +1000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 1/2] powerpc/ps3: Drop redundant result assignment
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Geoff Levand <geoff@infradead.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20260317130823.240279-3-krzysztof.kozlowski@oss.qualcomm.com>
 <90c122bc-3067-4e3d-8083-dd94844c31f2@oss.qualcomm.com>
Content-Language: en-US
From: Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <90c122bc-3067-4e3d-8083-dd94844c31f2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/4/2026 23:22, Krzysztof Kozlowski wrote:
> On 17/03/2026 14:08, Krzysztof Kozlowski wrote:
>> Return value of ps3_start_probe_thread() is not used, so code can be
>> simplified to fix W=1 clang warnings:
>>
>>    arch/powerpc/platforms/ps3/device-init.c:953:6: error: variable 'result' set but not used [-Werror,-Wunused-but-set-variable]
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
>>
>> Resend after ~2.5 months
>>
>>   arch/powerpc/platforms/ps3/device-init.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> Ping. This also got a review.
> 
> I do not plan to resend second time... And I also understand if this is
> somehow legacy and fixing warnings is not desired, but then it would be
> great if you just responded "don't send such patches" and I would not
> waste my time.

Thanks for the patch, sorry it hasn't been picked up.

I have been AWOL, and I suspect Maddy is not sure about taking PS3 
patches directly without hearing from Geoff.

Maddy this is fine to pick up for next.

cheers
