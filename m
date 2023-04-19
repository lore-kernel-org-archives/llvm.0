Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0504820E6;
	Wed, 19 Apr 2023 05:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8905DC433D2;
	Wed, 19 Apr 2023 05:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681882956;
	bh=q1EDCX90eyaKlEozriKlZ5Kk5qpJSj1P9jvcWUQYroo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iQcXSmFd0/IJrBSATb9RSeOS6t/9XaLZ1mPMehX5pEUAgMVuvL/QGZudjHxX7YA5R
	 ENZqy+Ah5c7mMYNTbgkQLsdnThTYueNcFDFZk9+NUCcN15Wlk8B8Emr6QFoN0at6rl
	 ic8PKVpnHIWROV61I5GUbOwSNDJ2nbv8LSufsgFt+fAKsTS26+ffCTwNNJQNeVbO5p
	 uJEgbGaa++uds3P8RUJvsVS2Y5ovbAOQsYam8DXkzgXj9MwUnxKDV99RykD+xW7GMu
	 GmEY7856uxb9Lri2cT9qAdQuZdb9lcm+ZooAmoJ/OCM0tAmPXmK0QU4YTIFp0CAvsb
	 rg3XV7jlTZKCg==
Date: Wed, 19 Apr 2023 07:42:32 +0200
From: Simon Horman <horms@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	llvm@lists.linux.dev
Subject: Re: [PATCH] staging: vchiq_arm: Make vchiq_platform_init() static
Message-ID: <ZD9/SLO3CnXa4UXu@kernel.org>
References: <20230418-vchiq_platform_init-static-v1-1-3c38ba81bc66@kernel.org>
 <20230418184419.GB2635379@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418184419.GB2635379@dev-arch.thelio-3990X>

On Tue, Apr 18, 2023 at 11:44:19AM -0700, Nathan Chancellor wrote:
> On Tue, Apr 18, 2023 at 01:23:11PM +0200, Simon Horman wrote:
> > vchiq_platform_init() is only used in this file so it can be static.
> > 
> > clang-16 with W=1 reports:
> > 
> >  drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:465:5: error: no previous prototype for function 'vchiq_platform_init' [-Werror,-Wmissing-prototypes]
> >  int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
> >      ^
> >  drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:465:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
> > 
> > Signed-off-by: Simon Horman <horms@kernel.org>
> 
> Introduced by commit 89cc4218f640 ("staging: vchiq_arm: drop unnecessary
> declarations"), not sure it is worth a fixes tag since it is a W=1
> warning.

Thanks. For some reason it didn't occur to me to check which
patch introduced the issue. Perhaps because, as you say, it's a W=1
issue, and I don't think that warrants a fixes tag.

I could include some information in the commit message, like
"Introduced by ..." if desired.

> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> 
> > ---
> >  drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > index 40dd62cf7399..59312b9f2058 100644
> > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > @@ -462,7 +462,8 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
> >  	cleanup_pagelistinfo(instance, pagelistinfo);
> >  }
> >  
> > -int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
> > +static int
> > +vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
> >  {
> >  	struct device *dev = &pdev->dev;
> >  	struct vchiq_drvdata *drvdata = platform_get_drvdata(pdev);
> > 
> 
