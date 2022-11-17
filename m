Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9928BE0
	for <llvm@lists.linux.dev>; Thu, 17 Nov 2022 17:29:00 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id h14so2242195pjv.4
        for <llvm@lists.linux.dev>; Thu, 17 Nov 2022 09:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bm7d0wA3PKw5o/R8yEgxkQkgqbavxCURCDthVZnwpGY=;
        b=PibsK1VOlK4fTo5ahOxV+p9puHHY3ZW35l84zzWsnv6i7MGNW0zqvYb3uSlk0x1M9X
         cVg0sS5uCXc5sak61YfVdGaNW/3RQOWeJdDjkRULb+ZdODZLI9tvuB/ahgG6SWGzjilg
         Zp7XZLUrYaaqgv+DjkED+xrFZC/joxXh4O0T2fshc7SJibB8ENREVY20njtaVp3CVAAb
         cT3o8VPbECbli/GBVZMFHbRQR7Dc+yfJEmSB6oK6EgmM2GTECHEbkXGnqKnzR3QQY+o7
         mFKgZKNX58kdEEkYVNXPk0Z0JRnj/xHvSDqt/59Z9dEuKFyT/d+TTlMTjjyTg6QwZ8xG
         uTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bm7d0wA3PKw5o/R8yEgxkQkgqbavxCURCDthVZnwpGY=;
        b=HL7Aie0t35SIJe8htQnID4/kfL4Dx8dOSGneB+lJ8rvqij1RXp/mJLh+kHjfxCCA00
         8ok8XRmosXNp2+RAEJUy6bdPvNJHSVmSAfQh1fqm6D5I4fYTH7zjKPDvoVXtcAjt390Y
         RibN5W4YlmDubvrCjk6pBGnyL4zhZj0kNAkwOWBpwieqGZNeK6P3lblpFhmhxIrB+aW1
         yDO9K6gchJme5ewqeux0fa7IVISWfWS5CvXSoZ75pOUe/BUVylSj9aAdrVsmB/Zbyt9T
         O7g+OD7dRv4uxm7PAk+oDJQaSw8NYKD2nrqJqHKUph/CxFeMde3PLOk4jYaj7bU+Wbxl
         FhpA==
X-Gm-Message-State: ANoB5plcmswLTdUdpIG/OtHynIHLJTehl+XEaYwOTHsu7bgaAaqyFQ/3
	/Z7Wv8QcKYGJyyL9zqr6dnJLMQ==
X-Google-Smtp-Source: AA0mqf4NNH913OVAb0kIWfodXGDglX1hqlY7MuJyPzQmgZ/pm3XpzJlSCHmS+D1JUqRA8usrgi9yoQ==
X-Received: by 2002:a17:903:2584:b0:185:3d0b:ac93 with SMTP id jb4-20020a170903258400b001853d0bac93mr3807384plb.5.1668706139508;
        Thu, 17 Nov 2022 09:28:59 -0800 (PST)
Received: from google.com ([2620:15c:2d1:203:39c9:4fa5:1594:6af9])
        by smtp.gmail.com with ESMTPSA id q20-20020a631f54000000b00464858cf6b0sm1245753pgm.54.2022.11.17.09.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 09:28:59 -0800 (PST)
Date: Thu, 17 Nov 2022 09:28:49 -0800
From: Nick Desaulniers <ndesaulniers@google.com>
To: =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: mripard@kernel.org, emma@anholt.net, airlied@gmail.com, daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2 2/2] drm/vc4: hdmi: Fix pointer dereference before
 check
Message-ID: <20221117172849.hk7bgahjbvycml5v@google.com>
References: <20221110134752.238820-1-jose.exposito89@gmail.com>
 <20221110134752.238820-3-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221110134752.238820-3-jose.exposito89@gmail.com>

On Thu, Nov 10, 2022 at 02:47:52PM +0100, José Expósito wrote:
> Commit 6bed2ea3cb38 ("drm/vc4: hdmi: Reset link on hotplug") introduced
> the vc4_hdmi_reset_link() function. This function dereferences the
> "connector" pointer before checking whether it is NULL or not.
> 
> Rework variable assignment to avoid this issue.
> 
> Fixes: 6bed2ea3cb38 ("drm/vc4: hdmi: Reset link on hotplug")
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index a49f88e5d2b9..6b223a5fcf6f 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -318,8 +318,8 @@ static int reset_pipe(struct drm_crtc *crtc,
>  static int vc4_hdmi_reset_link(struct drm_connector *connector,
>  			       struct drm_modeset_acquire_ctx *ctx)
>  {
> -	struct drm_device *drm = connector->dev;
> -	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
> +	struct drm_device *drm;
> +	struct vc4_hdmi *vc4_hdmi;

Hi, I think this change, or another in this area recently, is causing
the following warning. PTAL

drivers/gpu/drm/vc4/vc4_hdmi.c:351:14: warning: variable 'vc4_hdmi' is uninitialized when used here [-Wuninitialized]
        mutex_lock(&vc4_hdmi->mutex);
                    ^~~~~~~~
drivers/gpu/drm/vc4/vc4_hdmi.c:322:27: note: initialize the variable 'vc4_hdmi' to silence this warning
        struct vc4_hdmi *vc4_hdmi;
                                 ^
                                  = NULL

>  	struct drm_connector_state *conn_state;
>  	struct drm_crtc_state *crtc_state;
>  	struct drm_crtc *crtc;
> @@ -330,6 +330,7 @@ static int vc4_hdmi_reset_link(struct drm_connector *connector,
>  	if (!connector)
>  		return 0;
>  
> +	drm = connector->dev;
>  	ret = drm_modeset_lock(&drm->mode_config.connection_mutex, ctx);
>  	if (ret)
>  		return ret;
> @@ -347,6 +348,7 @@ static int vc4_hdmi_reset_link(struct drm_connector *connector,
>  	if (!crtc_state->active)
>  		return 0;
>  
> +	vc4_hdmi = connector_to_vc4_hdmi(connector);
>  	if (!vc4_hdmi_supports_scrambling(vc4_hdmi))
>  		return 0;
>  
> -- 
> 2.25.1
> 
> 
