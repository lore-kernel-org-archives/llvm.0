Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FB96AA2
	for <llvm@lists.linux.dev>; Mon, 19 Sep 2022 17:09:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37A80499;
	Mon, 19 Sep 2022 19:09:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1663607370;
	bh=+JOu5w44ME48gxryK0sjEV1XSCxm/SeQ98U0M2e5jNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lsrkMT2nP3NJyn8T/JKAXqiWHNtDqMLUo/XcbPx8YMaKk6vWOekP3NKPZrHLTcA2D
	 tSZefS5iVHYeFCEMIOgCsbk9Mf8Dd82mb7LefJhsPSO28CkxapanFDAKB0ff6CIpqc
	 aYGlThFpQlB4ooA7pFxnAJNptYdb5xzrwEsfBQL4=
Date: Mon, 19 Sep 2022 20:09:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nathan Huckleberry <nhuck@google.com>
Cc: Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev,
	Hyun Kwon <hyun.kwon@xilinx.com>, David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Michal Simek <michal.simek@xilinx.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: xlnx: Fix return type of
 zynqmp_dp_connector_mode_valid
Message-ID: <YyiiPE7i8EyPWxW1@pendragon.ideasonboard.com>
References: <20220913205600.155172-1-nhuck@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220913205600.155172-1-nhuck@google.com>

Hi Nathan,

Thank you for the patch.

On Tue, Sep 13, 2022 at 01:56:00PM -0700, Nathan Huckleberry wrote:
> The mode_valid field in drm_connector_helper_funcs is expected to be of
> type
> enum drm_mode_status (* mode_valid) (struct drm_connector *connector,
>                                      struct drm_display_mode *mode);
> 
> The mismatched return type breaks forward edge kCFI since the underlying
> function definition does not match the function hook definition.
> 
> The return type of zynqmp_dp_connector_mode_valid should be changed from
> int to enum drm_mode_status.
> 
> Reported-by: Dan Carpenter <error27@gmail.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1703
> Cc: llvm@lists.linux.dev
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>

I'm not sure what forward edge kCFI is, but the fix looks good, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index d14612b34796..f571b08d23d3 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -1352,8 +1352,9 @@ zynqmp_dp_connector_best_encoder(struct drm_connector *connector)
>  	return &dp->encoder;
>  }
>  
> -static int zynqmp_dp_connector_mode_valid(struct drm_connector *connector,
> -					  struct drm_display_mode *mode)
> +static enum drm_mode_status
> +zynqmp_dp_connector_mode_valid(struct drm_connector *connector,
> +			       struct drm_display_mode *mode)
>  {
>  	struct zynqmp_dp *dp = connector_to_dp(connector);
>  	u8 max_lanes = dp->link_config.max_lanes;

-- 
Regards,

Laurent Pinchart
