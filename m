Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9641B2580;
	Wed, 19 Apr 2023 08:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14E2DC433D2;
	Wed, 19 Apr 2023 08:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681894272;
	bh=VXrpOSBlujFi+hh3tYsCGOxDWdKBsM/QYjcPSg9RskE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ka7ocJbBGzZMh64ujq3JPqaSiDyCzuUb7UQ9jIjPNctNl3tAHXyS8iPrzTBzXW1Xa
	 ZTGaaPFwNEwOu7/T10uoT2AkUtvvCGw/iA/ZR9TTHzez4wCnGxcJp/2Vm81M7vrrbU
	 fxsGgIobRAncv2vykywEOcofgyQ764C3vAxebwBJ+Z2hT29ZkA+MHKw3/kCqY1xyhR
	 dcme4FK8dkQqDIuDM3FCPmY7r98xH0fSn6MUZ6YNIlgjpshkyvdISA2RLN3nFCt+XV
	 s7hbeuWt0UGXek2grLzYh3MWx7qjwJoBYJdVk+o/bTT+eu6AON8ZKym8aAEVECXkkX
	 dClvpK4JcuaTA==
Date: Wed, 19 Apr 2023 10:51:06 +0200
From: Simon Horman <horms@kernel.org>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	llvm@lists.linux.dev, Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] staging: vchiq_arm: Make vchiq_platform_init() static
Message-ID: <ZD+rethobzN+rONr@kernel.org>
References: <20230418-vchiq_platform_init-static-v1-1-3c38ba81bc66@kernel.org>
 <e1fed875-059d-bf98-f9da-09c51f362be8@i2se.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1fed875-059d-bf98-f9da-09c51f362be8@i2se.com>

On Wed, Apr 19, 2023 at 08:37:58AM +0200, Stefan Wahren wrote:
> Hi Simon,
> 
> Am 18.04.23 um 13:23 schrieb Simon Horman:
> > vchiq_platform_init() is only used in this file so it can be static.
> > 
> > clang-16 with W=1 reports:
> > 
> >   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:465:5: error: no previous prototype for function 'vchiq_platform_init' [-Werror,-Wmissing-prototypes]
> >   int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
> >       ^
> >   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:465:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
> > 
> > Signed-off-by: Simon Horman <horms@kernel.org>
> 
> this is not the first attempt to fix this [1]. But maybe this has been fixed
> in the meantime.
> 
> [1] - https://lore.kernel.org/linux-staging/20221022043548.1671644-1-scottjcrouch@gmail.com/#t

Thanks,

I see in that thread that Greg notes that "this breaks the build in a very
horrible and strange way" [2].

I'm a bit surprised as I didn't observe such a thing.
But I also don't dispute it - clearly my testing was inadequate.

I'll try and dig a bit deeper into this one.
Perhaps starting with the report from the kernel test robot [3]

[2] https://lore.kernel.org/linux-staging/Y1Okpjbi2kKU2GFz@kroah.com/
[3] https://lore.kernel.org/linux-staging/202210230127.p1Dp295m-lkp@intel.com/
