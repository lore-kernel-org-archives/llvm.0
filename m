Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE671C04;
	Wed, 19 Apr 2023 05:39:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4B7C433D2;
	Wed, 19 Apr 2023 05:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681882792;
	bh=rOihxUe8QABONitDvwQdh6idsB15LI4P6UVu3IhCaok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UQk5pDyTn5vXNJfDchHNuRH+vQpt0H359HhJimZ4v8BEbCbk3NIAWSfhAKVCoMlag
	 Nh2ocXN8u/yGNTn9VRuYMMxjJP/+X+wjC78w+Mv8QckKPFSye1WCVomTi/kBwdK6dV
	 536d1GWdBDIgABad6v7AM2yfVPNyh1MwfJzMcayi0GzWAwMB+YUqMSxwa/u69OJPbU
	 Yq6Zw20wFsj8+aoR34mVZ0Ci3wK65hAbvAP6FRWb2SI/OA5g3iyj0iI07KRDG6q+Ge
	 8obtsx3cXXgyb6/OY0XC4DvWZqzcwyTEHP0G0YWMx196lWuZgGlSvAEinishWYDz2+
	 v0HiuHH++ZZbg==
Date: Wed, 19 Apr 2023 07:39:47 +0200
From: Simon Horman <horms@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	llvm@lists.linux.dev
Subject: Re: [PATCH] staging: vchiq_arm: Make vchiq_platform_init() static
Message-ID: <ZD9+o7dUheMZgPAx@kernel.org>
References: <20230418-vchiq_platform_init-static-v1-1-3c38ba81bc66@kernel.org>
 <CAKwvOdmuwuSn+4csSCwsNXM01ohsp+ZzcWQ1WfM_kgj_NRugZA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdmuwuSn+4csSCwsNXM01ohsp+ZzcWQ1WfM_kgj_NRugZA@mail.gmail.com>

On Tue, Apr 18, 2023 at 11:39:58AM -0700, Nick Desaulniers wrote:
> On Tue, Apr 18, 2023 at 4:23 AM Simon Horman <horms@kernel.org> wrote:
> >
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
> I would have kept the return type on the original line and just added
> the explicit linkage on top, but it's fine and checkpatch doesn't
> complain. Thanks for the patch!

Thanks, I wasn't sure which was the best way to to on that.
I'll keep this in mind in future.

> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
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
> >         cleanup_pagelistinfo(instance, pagelistinfo);
> >  }
> >
> > -int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
> > +static int
> > +vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
> >  {
> >         struct device *dev = &pdev->dev;
> >         struct vchiq_drvdata *drvdata = platform_get_drvdata(pdev);
> >
> 
> 
> -- 
> Thanks,
> ~Nick Desaulniers
> 
