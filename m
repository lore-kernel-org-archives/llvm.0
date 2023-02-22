Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1D78F59
	for <llvm@lists.linux.dev>; Wed, 22 Feb 2023 18:21:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF001C433EF;
	Wed, 22 Feb 2023 18:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677090088;
	bh=HXn80E9p8LKWYpzTx+X49SWBVTLtIFgizXhoT9554kI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fs2BUHjrEssaXYTE7+er1dEFxbr/2lKW9EVA0YRw7uh/ahvRj8NKl+E3Gt9C0oMBD
	 PB+iOUc3pzLrj0RpKjJ4feWqdCiTH4sMOMtNrrjUPNRPF3J7scVe1krq0HgT6Sdsfb
	 ZdXJTriGg9ZhuQNeUz81r9k+TOdGgNfrEcBspwggS5s04dDnMhhVUvss6yJ5yrX09r
	 UpuHARuL0xLjkQQn67r0RCgHQ3nAUkzaW8fmp/QHEt7wgItvwb0/rgO1Csh47j89vW
	 vY+GpwTPK/Fm2rooe5RgXmNy/lTHLLR/fJqAykOD4G2YXIWSjvZi6/Olv0oulDJR16
	 K0V0n4kIsnWmQ==
Date: Wed, 22 Feb 2023 11:21:25 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tom Rix <trix@redhat.com>, robdclark@gmail.com,
	quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
	sean@poorly.run, airlied@gmail.com, daniel@ffwll.ch,
	ndesaulniers@google.com, javierm@redhat.com,
	linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm: return early when allocating fbdev fails
Message-ID: <Y/ZdJW3dxMVMGYlp@dev-arch.thelio-3990X>
References: <20230222155649.2001467-1-trix@redhat.com>
 <8f4a18d7-3477-5af0-605d-27098cc7e02c@suse.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f4a18d7-3477-5af0-605d-27098cc7e02c@suse.de>

On Wed, Feb 22, 2023 at 05:09:40PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 22.02.23 um 16:56 schrieb Tom Rix:
> > building with clang and W=1 reports
> > drivers/gpu/drm/msm/msm_fbdev.c:144:6: error: variable 'helper' is used
> >    uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
> >    if (!fbdev)
> >        ^~~~~~
> > 
> > helper is only initialized after fbdev succeeds, so is in a garbage state at
> > the fail: label.  There is nothing to unwinded if fbdev alloaction fails,
> > return NULL.
> > 
> > Fixes: 3fb1f62f80a1 ("drm/fb-helper: Remove drm_fb_helper_unprepare() from drm_fb_helper_fini()")
> > Signed-off-by: Tom Rix <trix@redhat.com>
> 
> Already fixed here: https://lore.kernel.org/dri-devel/08e3340e-b459-0e60-4bba-30716b675e05@suse.de/T/#t

There is also:

../drivers/gpu/drm/omapdrm/omap_fbdev.c:235:6: error: variable 'helper' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
        if (!fbdev)
            ^~~~~~
../drivers/gpu/drm/omapdrm/omap_fbdev.c:259:26: note: uninitialized use occurs here
        drm_fb_helper_unprepare(helper);
                                ^~~~~~
../drivers/gpu/drm/omapdrm/omap_fbdev.c:235:2: note: remove the 'if' if its condition is always false
        if (!fbdev)
        ^~~~~~~~~~~
../drivers/gpu/drm/omapdrm/omap_fbdev.c:228:30: note: initialize the variable 'helper' to silence this warning
        struct drm_fb_helper *helper;
                                    ^
                                     = NULL
1 error generated.

Is the fix the same as the one you have linked above?

Cheers,
Nathan
