Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795763718;
	b=nX+yya3NZ8sai/fseHMiv91jDq3qoFpoFvgF9nNwya84yubcnYnV+xrlrEIutNEanVzv
	 ajFjCHoIsG49KAq0iGCY93DZGWo+GFXkALw0RWOmyTJGeNt8nUaPo4i1EnqWnhUU5LJjV
	 0EP+l/1J6VsHx5HrXyqOrAJ0YYR4sA03AmXV5ImKj/R0qarEzStBXOlkfOwTHyvhW53Vc
	 2qcACHVtgPJ1qs0xMf182+jk+icQigZqrlwET93MrFQVf3ULn6teT9ME2/Lgo1xi/s7KV
	 vlZNNBRV6wy851ohr5eFNr2TinmhP0UbxfgzppPnd+ujd07KxmKc5+yHRY/QTXI831Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795763718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=wSJgjK+A00lNH/iVraNbWq5SwVJ5+VOU0GV4DugumqU=;
	b=Ss3megKTvZ352knDepz9/EyAHiB+nGuS+sAVjQBv7kepz2ercXUTB4UKnwu0ynll9z/9
	 4U0AGlMqRKxQvpghr75NlwMsJeQYef5IRBBdIsjcSOSGVwJXQoeRap8hLIoV9h4dqMwY1
	 ZTUB0yduyxtZdJw6TF6GSfkKND0XDMqNVxIU/AwuHaR8kUarVn8S8aqmauMVH3/uKct7C
	 HzQvgOLiWJIu/tGa+k1Mzy2TiE4bZU5y7DRhamJKEKYIVy9ufV37EJOyYWCMThK9ygRal
	 RG/alNQOA2Gr0KudN27peOoG9t/Ei7QNMRppH86jXGlCEruSqGPlfqKXaAduyWlPuGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=exzp8FYE;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF2C606A31E
	for <llvm@lists.linux.dev>; Fri, 27 Nov 2026 07:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCF2C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=exzp8FYE
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-491846221ffso6805154f8f.3
        for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 23:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795763716; x=1796368516; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wSJgjK+A00lNH/iVraNbWq5SwVJ5+VOU0GV4DugumqU=;
        b=exzp8FYEfFPmpwhewpa/AXX96hyLlhGsCqiZJ9TvtP9iRkY/5A6IxaIC+LpTMAeLz8
         6fw3eEmiT3hct4nJsxtyhyOhY2YDZ7eihOqvlpp3aT2RlYY8+lojS1AWfQIElunSmulO
         KcYwERHPNnbq+OK4GuUvVU7bpB2HfFd5p4ruc6ldyEZzMtuGb9WkvnnQtiFUuylnd3VT
         zcMuB0xq7wkVE9V9TEybYRJta3WvQATXa9K7YhDJDbYoSEkXcOqsJ6W7XkwH+nt+7QVN
         jgiUxYZEV6h8ij5decc45wPr+a6KUcGo2fASuOtD8j7M5To42IkqgJpQIO9uyZiYMyXt
         alcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795763716; x=1796368516;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wSJgjK+A00lNH/iVraNbWq5SwVJ5+VOU0GV4DugumqU=;
        b=vZxZgLXLg9jKROvqdUJT+9PAOIySL5Go+sj6TKgDIXQ9tEbOggiTblcH4GKQ11hVol
         bSY5bPIkyk15lVCZX//MHQDhQDKcTjOC9hrhl3Ls3+Kgz+BQQLW/g9xAN6soEw7hNSMP
         An+Ys032uMY4cwIC729OzDcWYy7yNYQszHDIopNr/PeXgo6WQTJQkWnvVFBwGJh7p5+I
         1jwtpydBaGxLfaN7tm2py4mkr8AAqBpJLyHFaY1a8r/IAE6PWCgaAFVKCTS2zBMXhZn7
         IsDEacGIrX7BbqcP24Rpt7rytuzdFVroahP+J0zaAQrzL9zdV5csaTniWhc3nUD80BmS
         UsZw==
X-Forwarded-Encrypted: i=1; AL+hErF2Khp/fQmd2Vp//kKwGftnzqS8J5EWh8c4V2xHvdua769JOFKvzcSw3uKOSI0JXsa7e46A@lists.linux.dev
X-Gm-Message-State: APuU4Z8rZKfF1My+0lDKBS4CQfN03DVYf7hKLxqiY197CMrIgqiMboEd
	Fkx3wvev+agDXlKFMBt1k7K24BPY6nNvLwRh2o3zWqg2Uz1nt6kToRYI
X-Gm-Gg: AZFdTZfArdL2qrnGsVggXB/cXaTUplYhhtGLaHw5BP+zO3I9CUQO4BIbANIk40Z0sJy
	RhAolvKQ2LVZkhzLN3/IjyL/yLmJjs4aZvyxDQ7njW65BPYpUkEisBSHPps+rXBsR09MbpdEybm
	ld4PJhYBDjU/WSfEEdwFgNdFUqUyP/CbWyUomhNE2hpjoGO6Mkmyv5TnjqdgQwGZsekflOFXkUw
	WSGcY3DQl4vEI8VO79YM2j44SzhV2VQrWO7SGZYm6W6s4uL1n7Wyq0Y/Rf7CXmNAmTA/OJK4i/M
	zqCLa2p95CYoz3qzugJWfoZhMFTE93jwhQHDbcyLLl+Ny+35KGVFOdF+0ASZcPpqn7FIbp3yXyS
	muBUfZXJLuHmfPlji1kP9nKwQDf+0QJbgjaRvILcm8c5vMGDoB0psazDJLDeQrw/NjQzAldXcmL
	ICAGkhp9lj6/Mi6Om1sff0isSudewLX8ZrHavJTgWAusyesO57idu7384IbZ51P8jCwmv6+1koX
	nUp1cmclfBVkaTrNnmH6H9gSbIeUSGjSeNL5BoR5A6BatTaGsMLUByYW/72zFRbx/FbJwjTfspT
	rG+9aDIo0pCum+cqiEtx4JUEkcd9254=
X-Received: by 2002:a05:6000:2506:b0:48d:ba3b:af36 with SMTP id ffacd0b85a97d-4abb47b0f64mr55547662f8f.37.1795763715954;
        Thu, 26 Nov 2026 23:15:15 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c50sm44603961f8f.37.2026.11.26.23.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:15:15 -0800 (PST)
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
	llvm@lists.linux.dev
Subject: Re: [PATCH v7 31/43] drm/vkms: Introduce connector type
Date: Fri, 27 Nov 2026 08:15:03 +0100
Message-ID: <awkt6PBpmDa69llM@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126-vkms-all-config-v7-31-21194cda2468@bootlin.com>
References: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com> <20261126-vkms-all-config-v7-31-21194cda2468@bootlin.com>
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

On Thu, Nov 26, 2026 at 12:29:14PM +0100, Louis Chauvet wrote:
> In order to emulate connector-specific behavior, add the connector type
> to the connector configuration.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/tests/vkms_config_test.c |  5 +++++
>  drivers/gpu/drm/vkms/vkms_config.c            |  3 +++
>  drivers/gpu/drm/vkms/vkms_config.h            | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_connector.c         |  2 +-
>  4 files changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> index a43dff511fc3..257ba0342034 100644
> --- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> +++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> @@ -137,6 +137,7 @@ static void vkms_config_test_default_config(struct kunit *test)
>  	struct vkms_config *config;
>  	struct vkms_config_plane *plane_cfg;
>  	struct vkms_config_crtc *crtc_cfg;
> +	struct vkms_config_connector *connector_cfg;
>  	int n_primaries = 0;
>  	int n_cursors = 0;
>  	int n_overlays = 0;
> @@ -211,6 +212,10 @@ static void vkms_config_test_default_config(struct kunit *test)
>  
>  	/* Connectors */
>  	KUNIT_EXPECT_EQ(test, vkms_config_get_num_connectors(config), 1);
> +	vkms_config_for_each_connector(config, connector_cfg) {
> +		KUNIT_EXPECT_EQ(test, vkms_config_connector_get_type(connector_cfg),
> +				DRM_MODE_CONNECTOR_VIRTUAL);
> +	}
>  
>  	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index 342b844bfc6d..b415d4bf6edb 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -647,6 +647,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  			seq_puts(m, "connector:\n");
>  			seq_printf(m, "\tstatus=%s\n",
>  				   drm_get_connector_status_name(vkms_config_connector_get_status(connector_cfg)));
> +			seq_printf(m, "\ttype=%s\n",
> +				   drm_get_connector_type_name(vkms_config_connector_get_type(connector_cfg)));
>  		}
>  	}
>  
> @@ -1005,6 +1007,7 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *c
>  
>  	connector_cfg->config = config;
>  	connector_cfg->status = connector_status_connected;
> +	vkms_config_connector_set_type(connector_cfg, DRM_MODE_CONNECTOR_VIRTUAL);
>  	xa_init_flags(&connector_cfg->possible_encoders, XA_FLAGS_ALLOC);
>  	/* refcnt starts at 1: this reference is owned by config->connectors */
>  	kref_init(&connector_cfg->refcnt);
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index eb29008e54f0..efebb190ce40 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -150,6 +150,7 @@ struct vkms_config_encoder {
>   *
>   * @link: Link to the others connector in vkms_config
>   * @rcu: RCU head for deferred freeing of this object
> + * @type: Store the type of connector using DRM_MODE_CONNECTOR_* values
>   * @config: The vkms_config this connector belongs to
>   * @status: Status (connected, disconnected...) of the connector
>   * @possible_encoders: Array of encoders that can be used with this connector
> @@ -167,6 +168,7 @@ struct vkms_config_connector {
>  	struct rcu_head rcu;
>  	struct vkms_config *config;
>  
> +	int type;
>  	enum drm_connector_status status;
>  	struct xarray possible_encoders;
>  	bool unlinked;
> @@ -397,6 +399,28 @@ vkms_config_plane_set_default_pipeline(struct vkms_config_plane *plane_cfg,
>  }
>  
>  /**
> + * vkms_config_connector_get_type() - Return the connector type
> + * @connector_cfg: Connector to get the type from
> + */
> +static inline int
> +vkms_config_connector_get_type(const struct vkms_config_connector *connector_cfg)
> +{
> +	return connector_cfg->type;
> +}
> +
> +/**
> + * vkms_config_connector_set_type() - Set the connector type
> + * @connector_cfg: Connector to set the type to
> + * @type: New connector type
> + */
> +static inline void
> +vkms_config_connector_set_type(struct vkms_config_connector *connector_cfg,
> +			       int type)
> +{
> +	connector_cfg->type = type;
> +}
> +
> +/*
>   * vkms_config_plane_get_default_rotation() - Get the default rotation for a plane
>   * @plane_cfg: Plane to get the default rotation from
>   *
> diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
> index bb023b5af4e4..84c49915ed44 100644
> --- a/drivers/gpu/drm/vkms/vkms_connector.c
> +++ b/drivers/gpu/drm/vkms/vkms_connector.c
> @@ -89,7 +89,7 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
>  		return ERR_PTR(-ENOMEM);
>  
>  	ret = drmm_connector_init(dev, &connector->base, &vkms_connector_funcs,
> -				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
> +				  vkms_config_connector_get_type(connector_cfg), NULL);
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> 
> -- 
> 2.56.0
> 

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
