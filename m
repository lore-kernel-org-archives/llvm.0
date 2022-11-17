Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEF98BE0
	for <llvm@lists.linux.dev>; Thu, 17 Nov 2022 17:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69177C433D7;
	Thu, 17 Nov 2022 17:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668706324;
	bh=wdsxeJqew66mU+bgRH2fg2ZV2N2f5g2SvnnRTjBr7ns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kAVXC/XpqlxDpWMpNpo9ILQWbCN/M74xUL/zj15/ZTtTTYyYsPXSFmwcp+WgWdEAN
	 eQq4sp0ULPi42RwV469PAdnEtLg+soIWqyrgyJnNRCuovQMR8I4Je8eGPb1W11O9rK
	 bRCZ6+mfkLeyYqHZJSmn8UGg5gnoB5JxSV9lPinr4Ize/dH2YvBE8I8ih9QNZQiIAa
	 Ekn51XTl7SYtEP1+YoWefddLzzZ5wKijwP8a00OURiWcN1kILP5FPNzGYoa9oqWh8p
	 IVKL/dSVv2paopySfEFGmzuTRgnycPpCYo9gljEt9EDJDfiSpkHP50qLRyhnIs+Glm
	 slRWSj/kCi+MQ==
Date: Thu, 17 Nov 2022 10:32:01 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
	mripard@kernel.org, emma@anholt.net, airlied@gmail.com,
	daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2 2/2] drm/vc4: hdmi: Fix pointer dereference before
 check
Message-ID: <Y3ZwEc4x/wIsroTI@dev-arch.thelio-3990X>
References: <20221110134752.238820-1-jose.exposito89@gmail.com>
 <20221110134752.238820-3-jose.exposito89@gmail.com>
 <20221117172849.hk7bgahjbvycml5v@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221117172849.hk7bgahjbvycml5v@google.com>

On Thu, Nov 17, 2022 at 09:28:49AM -0800, Nick Desaulniers wrote:
> On Thu, Nov 10, 2022 at 02:47:52PM +0100, José Expósito wrote:
> > Commit 6bed2ea3cb38 ("drm/vc4: hdmi: Reset link on hotplug") introduced
> > the vc4_hdmi_reset_link() function. This function dereferences the
> > "connector" pointer before checking whether it is NULL or not.
> > 
> > Rework variable assignment to avoid this issue.
> > 
> > Fixes: 6bed2ea3cb38 ("drm/vc4: hdmi: Reset link on hotplug")
> > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > index a49f88e5d2b9..6b223a5fcf6f 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -318,8 +318,8 @@ static int reset_pipe(struct drm_crtc *crtc,
> >  static int vc4_hdmi_reset_link(struct drm_connector *connector,
> >  			       struct drm_modeset_acquire_ctx *ctx)
> >  {
> > -	struct drm_device *drm = connector->dev;
> > -	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
> > +	struct drm_device *drm;
> > +	struct vc4_hdmi *vc4_hdmi;
> 
> Hi, I think this change, or another in this area recently, is causing
> the following warning. PTAL
> 
> drivers/gpu/drm/vc4/vc4_hdmi.c:351:14: warning: variable 'vc4_hdmi' is uninitialized when used here [-Wuninitialized]
>         mutex_lock(&vc4_hdmi->mutex);
>                     ^~~~~~~~
> drivers/gpu/drm/vc4/vc4_hdmi.c:322:27: note: initialize the variable 'vc4_hdmi' to silence this warning
>         struct vc4_hdmi *vc4_hdmi;
>                                  ^
>                                   = NULL

Guess we just crossed paths but this is just a problem with -next due to
a bad conflict resolution on Stephen's part:

https://lore.kernel.org/Y3ZvffZiR+SgtY6h@dev-arch.thelio-3990X/

> >  	struct drm_connector_state *conn_state;
> >  	struct drm_crtc_state *crtc_state;
> >  	struct drm_crtc *crtc;
> > @@ -330,6 +330,7 @@ static int vc4_hdmi_reset_link(struct drm_connector *connector,
> >  	if (!connector)
> >  		return 0;
> >  
> > +	drm = connector->dev;
> >  	ret = drm_modeset_lock(&drm->mode_config.connection_mutex, ctx);
> >  	if (ret)
> >  		return ret;
> > @@ -347,6 +348,7 @@ static int vc4_hdmi_reset_link(struct drm_connector *connector,
> >  	if (!crtc_state->active)
> >  		return 0;
> >  
> > +	vc4_hdmi = connector_to_vc4_hdmi(connector);

This version of the patch is fine, as there is no mutex_lock() call
here.

> >  	if (!vc4_hdmi_supports_scrambling(vc4_hdmi))
> >  		return 0;
> >  
> > -- 
> > 2.25.1
> > 
> > 
> 

Cheers,
Nathan
