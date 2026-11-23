Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438995;
	b=bRgngEVJXuze+INSyjs3gCVf8MKytIBZ/sxhQNv/3HYBArHIw+24RZiJZ2T0MwLWIuM3
	 CWB9FZnaGVt3FlP6lzGk10MUxrMfNhbbDYEnZkpOX/Ye3TbDE9ctoLxGmUQnPXtSapvqg
	 CvwH074j94LSPKYWDl1LOkdbRPmXLuQwt6+yK/AOOQldkNEO4jGFKL/G8kqSMKGIXWYRu
	 iG/mVHDPnxJaLmuObloPeVESIIaPVduFTUqMd2KYaeyYjqA/rN2Befo7Nt3ROGWBZbSdj
	 0azjlUQDvLAJML/dkWHar8gPFZNE/TsFQQ8K57LuUsI401GsMhRl/ulCO4kDLT8+KuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=eMLemh30tOFWEd3J1uHpw9ECe4OgdCLjsL6KtAJT/rA=;
	b=4wSKpFpen1aY1y78RSjLwkIRK82zyrh0TksHdNj+I4vp0j3ZDIEJ7RtbdyFVGfpN5NMZ
	 YE8sys8uEBAOEiSyxrnc6+KVlU77XZI3YRPQJfWixnY9Awt/coVBZg1T45Zso0EN1Oxrz
	 CCRMRDC9FLkTn2fSS/pB2FWuqg0x6QZl5brE3DHCAFLoC5DA9obONBBciBTF0Lx3ccJS8
	 d4QMmFvphOe18Id46Yftm0uNiJyfjlOtZu37BN930lAYJaQWQNGm0WWb10Y0i3FKyie0l
	 E9hwGy9jBbzq1FjuUSY+SAiJpoh0rdMLxuGXZD94HPiXwH8QhUtZmET9yKinWaA3YCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ozQJEZfg;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCAE606A31A
	for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 13:03:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BCAE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ozQJEZfg
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a42b34e930so2859111f8f.2
        for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 05:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795438993; x=1796043793; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eMLemh30tOFWEd3J1uHpw9ECe4OgdCLjsL6KtAJT/rA=;
        b=ozQJEZfgw6koEXxfmVx6E5cQoqqI4s6lCBqHonY8Y25qx/fs/gROZxpZx1CqUBGd4x
         tj6Odsjsr8gHXFXF6WlpETvr2kfF0hly6KCJPVnN0wwGQPcq8AtWmmD6ED2jpVliNcsS
         4HqZHbl+RyeqV3Cq03HjEXG/aYTl7L9gWFTiaCCpAgTlQdo6TiyBaWrJxNTM+ueB4kYT
         IzHcAEXWceGGS6SRx4Ine91thSxmlVyudU7g1vUMA4xtkmpIMNbIHgSTAcWPDDyVj763
         YAq9arJGhlEQD3aWVo1nYuhOev15XT4Lzj7Z0p9F3taTwFC3f7t/J3p2V+InWW76kpCB
         PeFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795438993; x=1796043793;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eMLemh30tOFWEd3J1uHpw9ECe4OgdCLjsL6KtAJT/rA=;
        b=pCCU7jAhvcaK/cXOwdzjodzW+7JlCEUnY9Tl7NjGZO6jYKpPvjYRLPrxHKk+EaHZeB
         5U4/F00IVCc6LD8PG+x59vVSM9sUjtci9q81078Pucju0sV27sdtMMJMaLIILpq1kHLM
         GiMGcWeHvLhqMIi2dRiU3sX5zVEHSoS6Rot8Sk+y+0N2FNqAasbsFJXX0kELtX7Jo12f
         eocMTvJqCemoDRc/q+zXRxlqk4syn7I1HzLUenCsW63XqA0ZB8uLUUg6Zz1PiS7ZGA8x
         GQz+70S9IikWGLpQR0e1/ViFTlsu1StzjGeHpg2Eoh6XrYvCDL7SmKdLBUzEEKJWnPVI
         RJQQ==
X-Forwarded-Encrypted: i=1; AL+hErFwo+2majtTktjJF60tDqeK4z9YOOginh2rKfNm+z/14I4Ck3Hs3ldITP/WrPU5Ql9MUpwb@lists.linux.dev
X-Gm-Message-State: APuU4Z9KVbwMiI/d2/yXvwlvwGdEm2O090UzSIsdco0fowtAPQonkHo4
	oLOvGakvSWF8gP5YW/YvDO/jQMSulOzEPIgp4vtz8Swyj79sfx5I5Evv
X-Gm-Gg: AZFdTZerdmgir2KnAPQoId7Bj4HoQ5KECQV837izuvnCK1d3wuxDeUGRoPYDZatA8lz
	gBDK9SfIGsnDqCm5pKylTTHdLm73hq1LhOflyG6KNO/RsUCCtCXBTpMxKLhfPf0JvNk2PDFc8HM
	/FK1FXtmzWe4kqix7v9aQuLr9Er2+mRaHmEWZuiuY+xsusYpW2ibcHioMp0EoMWWeG+8BcADRZh
	dkZEJ3c+iCjOd/cH9lBVQSzxYn6i+OIvM2D9CJ7nCcpqOF2BDZEzGunJT1/Vfsz5WgBQ88evnCc
	Uk/7wctHfCUW/R9FdZRSb3Oeo9Ov2EzHn9IT9Jb4hnXVCP/WLU5vkGSTOnE4tOX2dLmSefBvs17
	eeqZrWqsCklvm1/jt4FZea/is3F7mhMCgMrK9DHlEc+sZd9taOP1fx+OMHz+rmxjrNzabzQZVN4
	Rx2slOhH5sOwc1HC462NNKY1VOaTLqpQM2S/TyFp8F92clLkxAL3joXSdnT3jt9FY2Wzpm+aF0s
	cKS9qSiH81WH65ahGkYX5hfEUe3MaZEwq5IDUmCI5K8gOK5ppduNzHpY+gYgbXUFeacfAc93QLA
	Bw7v7RSJKGhhFBl3qRuMmq0XwAV4eh/hiQ==
X-Received: by 2002:a05:600c:a085:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4bb887ca0dfmr253189505e9.4.1795438992240;
        Mon, 23 Nov 2026 05:03:12 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm310848795e9.12.2026.11.23.05.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:03:11 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	jose.exposito89@gmail.com,
	Jonathan Corbet <corbet@lwn.net>,
	Harry Wentland <harry.wentland@amd.com>,
	Lucas De Marchi <demarchi@kernel.org>,
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	sebastian.wick@redhat.com,
	victoria@system76.com,
	thomas.petazzoni@bootlin.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Simona Vetter <simona.vetter@ffwll.ch>,
	llvm@lists.linux.dev
Subject: Re: [PATCH v6 15/43] drm/vkms: Simplify plane_release code
Date: Mon, 23 Nov 2026 13:02:55 +0000
Message-ID: <awQ5FMhggIVxJ4py@ArchOarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-15-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-15-78ace90f4fc1@bootlin.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Nov 20, 2026 at 06:58:57PM +0100, Louis Chauvet wrote:
> plane_release  code used multiple intermediate variable, remove those in
> favor of direct access.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_configfs.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index 5f5aa0a1812b..a7ddcfd4e86e 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -331,13 +331,9 @@ static struct configfs_attribute *plane_item_attrs[] = {
>  
>  static void plane_release(struct config_item *item)
>  {
> -	struct vkms_configfs_plane *plane;
> -	struct mutex *lock;
> -
> -	plane = plane_item_to_vkms_configfs_plane(item);
> -	lock = &plane->dev->config->lock;
> +	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);
>  
> -	scoped_guard(mutex, lock) {
> +	scoped_guard(mutex, &plane->dev->config->lock) {
>  		vkms_config_destroy_plane(plane->config);
>  		kfree(plane);
>  	}
> 
> -- 
> 2.56.0
>

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
