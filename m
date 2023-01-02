Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com (mailrelay3-1.pub.mailoutpod2-cph3.one.com [46.30.211.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA89817F0
	for <llvm@lists.linux.dev>; Mon,  2 Jan 2023 20:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=5buzOcKEfXMw1J+rpjwmhz8fBIg+HKdCQveqaVc+Qag=;
	b=wlwwErx5gKJ1rho9y1Z4MN+AQ8sQD7e6qxF1gc+gS7Rz7xH1W7y3bnOIbZM+TNRpP+qcIGaJnV4GJ
	 IauXD2iwu4bMuRkIq90pg0YzuKhuqUqkpMS7XeJYDqqB1tl24YgEoUo9E6CWz8nOUTUoqDSPWIHPk4
	 YQ1fXYxPkBbMLI+11jqpS84AkdOle7p9ELnbWoFK5mPcJj3bc0lqURpiRQue+a8NUDSG/npOmwJpRg
	 scmgbaZObAVycEW7bOT+xQG2Q/Wzy2goqgUG6sd3VBmDNK0wAfJGw2zJ5Qqux1dxvilOFItmVuQ7Uf
	 sYAKvATbsZod6bemETstNe1bsg+gygQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=5buzOcKEfXMw1J+rpjwmhz8fBIg+HKdCQveqaVc+Qag=;
	b=TOCnwco+7WVQri1nQ3WNST0edj4X7dcHqS6OnfYzZsaVL/t+DFutZJGHy8hTtkII5s6di/eiqtypt
	 suj1+bwCQ==
X-HalOne-ID: 4e57f03f-8adc-11ed-b5b5-ede074c87fad
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay3 (Halon) with ESMTPSA
	id 4e57f03f-8adc-11ed-b5b5-ede074c87fad;
	Mon, 02 Jan 2023 20:30:35 +0000 (UTC)
Date: Mon, 2 Jan 2023 21:30:34 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Thomas Zimmermann <tzimmermann@suse.de>, Tom Rix <trix@redhat.com>,
	dri-devel@lists.freedesktop.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2 1/2] drm/mipi-dsi: Fix mipi_dsi_dcs_write_seq() macro
 definition format
Message-ID: <Y7M+6gdQM/4DhQsP@ravnborg.org>
References: <20230102202542.3494677-1-javierm@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230102202542.3494677-1-javierm@redhat.com>

On Mon, Jan 02, 2023 at 09:25:41PM +0100, Javier Martinez Canillas wrote:
> Change made using a `clang-format -i include/drm/drm_mipi_dsi.h` command.
> 
> Suggested-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks,

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
> 
> Changes in v2:
> - New patch in v2.
> 
>  include/drm/drm_mipi_dsi.h | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 20b21b577dea..e9d1e8a7fc7e 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -303,15 +303,18 @@ int mipi_dsi_dcs_get_display_brightness(struct mipi_dsi_device *dsi,
>   * @cmd: Command
>   * @seq: buffer containing data to be transmitted
>   */
> -#define mipi_dsi_dcs_write_seq(dsi, cmd, seq...) do {				\
> -		static const u8 d[] = { cmd, seq };				\
> -		struct device *dev = &dsi->dev;	\
> -		int ret;						\
> -		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));	\
> -		if (ret < 0) {						\
> -			dev_err_ratelimited(dev, "sending command %#02x failed: %d\n", cmd, ret); \
> -			return ret;						\
> -		}						\
> +#define mipi_dsi_dcs_write_seq(dsi, cmd, seq...)                           \
> +	do {                                                               \
> +		static const u8 d[] = { cmd, seq };                        \
> +		struct device *dev = &dsi->dev;                            \
> +		int ret;                                                   \
> +		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));    \
> +		if (ret < 0) {                                             \
> +			dev_err_ratelimited(                               \
> +				dev, "sending command %#02x failed: %d\n", \
> +				cmd, ret);                                 \
> +			return ret;                                        \
> +		}                                                          \
>  	} while (0)
>  
>  /**
> -- 
> 2.38.1
