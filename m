Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795450352;
	b=XmA7zht6PMbo9mv7WkHY9IBoqr5xDaV0GBYAcXhTiU5WwhBcvtN3uvlvmju+4m3uMGR4
	 tsvKHxQvpQHVcgAGUkrqLRNn7fcddpw5PA8Tu0mAan3pTt6eLaGa3sPwAezJlKZEmwsHN
	 xKtGi974ATZ4Ctd3wjf4cFc9kZyqzBe6a+l+ZmOSrQymtDaofl9y+oDjYgi3B3tpFZBCx
	 yWAhX3/YKRPcqL7fWSGYuFFkpahGU1hKmGpqWF64WptxqZw6wwEyOQgdvGi76WbJkLjAD
	 mpfhas/LkRBECEN+H0tpps5/65OK7ZAl2kl+sMTiVpRTMyBVHaBtgo+xqDDSooXUVOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=q8nYEbLZ2llq6j+JAuDJiblDLINgvbNEzxuytFyLiig=;
	b=kqEqCdn8GVkcosT9sdVUIlmjsBOwSmZ25bSK+k40spO6QLxr+fz5z8IQQTPk5hvEPoWp
	 HesuB0NMTWG3VXM3395o2wBc40K9J/qAv6HFifCS2yqWUnD+h6uM5NdfZWlQn35aWT73o
	 qLylBmtMml+uBOwNF+h0AwelIT0s4SSMFc+mrCu07gwq2wQMzDgDb1QJTLrSA46JbGdGD
	 7K3Bh2J0/3nikf62yMMNODzKTadAZQRBpwIqJ5Ik6vCXjJc9CVcigs6voAtuj4NLvUVI7
	 +KvBuccEWxnqNpfqVKHshQQ7lapG6V/pn70/v2NUez1mmq2B4zOf7IpUvFrEBbRQ60g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tB5XAWTh;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E542D606A321
	for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 16:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E542D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tB5XAWTh
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so22242305e9.0
        for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 08:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795450350; x=1796055150; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q8nYEbLZ2llq6j+JAuDJiblDLINgvbNEzxuytFyLiig=;
        b=tB5XAWThJJSBP6w/hImyBc0yMpfwMLF1OnjExLJwJ14cgZ2AUyRcelU4AkM/opOoc7
         qJN8wjtMWHeQ/xTTe95R4r/6wVyNi/jf0eRhtYwpbw+Qe3mDFbbfrBl2/S9cboAKRQGy
         waFvnMz1fH1zKzmIT6QTCJaai/FDhiP2q9oypehIY0icD9QewGpj8S3EhCBS8/hJ6dgS
         6kOwXzs0KTAwskCmveXw3fB5Wf7MYVz0R69gwySdQHKRWIKbuULHegBYizQoO4yRL1wD
         PHhYOSeplokIVRcAEHOfIqWEDkJv8LFRWNaxs51YZSioLN7WFlpShC/umKI9jCdTuRZ5
         E4gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795450350; x=1796055150;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q8nYEbLZ2llq6j+JAuDJiblDLINgvbNEzxuytFyLiig=;
        b=24xMobP7JDY28LfrM5Cn14vXmFNmkyH8JS+2pbw+Y52DORrPDoA+dnqCYcYJnFXcu5
         oXACIV9fKYE1S4OZDp4OEnEhT4EBvyLQEOf01RtGHPkMKNWsM2Bp53QVZyYi1lLAcmaF
         HzacD6QVi23hKDzu8cAq+p24J33no4uz8qmciIS6nsVNRD8B4JyrrrLFVh4AKzikq2IP
         H9NKxXxfi80JOZ/lULrsZ+95a5wchAlPI8UEC5pEwEivRXGF0SblkYbk6bNtl+edpQFG
         LmX1RN3jxNVwR0L8N03UXMfFHuIWicMmcWqYXOmRFq4r8u2WBS32Z78MrGhjlHTuK+dA
         yiHA==
X-Forwarded-Encrypted: i=1; AL+hErGHXRKssYMA4Sp9tdsQJq2wSmAcYjCh4E9WcN9QnmYOMfnLsPS6DrG4NG7XYp56tBb5aVLP@lists.linux.dev
X-Gm-Message-State: APuU4Z8N9ut5Rk6t3V3ibEyQhcLBthX8GnjH4kNbGc5I9yHcJEkV6POX
	7hSoKUKmNB6WHYpXBvJHXJh6Fdx6dWNWecrEF74AzkwuwUq46Dh6/7oH
X-Gm-Gg: AZFdTZdQXClmjmLRCkHiZdHOZZT/pODh8Vk2Vc5vrMJGcMGkJzBSONIEHKP7i875t1k
	B16R0VyDYD3nI7XC3lYzmOdVsxPWyVH6fs7Hi00RdbKHNXcJG9lapaRUfzT4gHBTUy+BF6rJzMM
	YCGjYt82EW5ATMDUY9BYAe/SJ3blAfweaDEv59Hs75HRmTOwQ3gnX7UUZwGw2dWxeXSWmYxw/0H
	rpGp4ikq0TCM2hZj7bO5Q67Ak+A6a/0xEqbyhUbQvEgjk7psWNeuQ+YQ0FCpQ+rPVoHdajEkIYY
	JWOVSMP3Q4h+tBauP5mAbYQKQB8DOSadCMYsCQ80JY07VphZqn+qrbdcrwO7o7ohIxhEzVbL/P/
	fv0xangZpzL+7hSAdURY5FNIl5QaF8Qg5u0ItbXrdelI5C3/5eHc+3lQ9rJs5lF/u6rvV+YT/Y7
	gg8y8gpRxCXjCsMFkdwprU9a8Ca2aaDxwUzApXryqubqwwZeqOK0CeWXsd3M90FLtbEYDpPk6Ms
	48Z1g9E9ywglFHNS+w+Pf/EZdi4NICEvgvx4NfTQwqYDkx33Frd/7hG824DHnmMtlyCV5iBsaki
	S1LsNgBPeHy0tkSdI3HFuFc8S/Qia2PurA==
X-Received: by 2002:a05:600c:848a:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4bb887fb678mr237295105e9.4.1795450350202;
        Mon, 23 Nov 2026 08:12:30 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066e34esm201819645e9.3.2026.11.23.08.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:12:29 -0800 (PST)
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
Subject: Re: [PATCH v6 32/43] drm/vkms: Introduce connector type
Date: Mon, 23 Nov 2026 17:12:08 +0100
Message-ID: <awRlnGwi30MkhfyZ@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-32-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-32-78ace90f4fc1@bootlin.com>
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

On Fri, Nov 20, 2026 at 06:59:14PM +0100, Louis Chauvet wrote:
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
> index 963e32d5adf7..291c0330bc56 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -651,6 +651,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  		seq_printf(m, "\tstatus=%s\n",
>  			   drm_get_connector_status_name(
>  				   vkms_config_connector_get_status(connector_cfg)));
> +		seq_printf(m, "\ttype=%s\n",
> +			   drm_get_connector_type_name(vkms_config_connector_get_type(connector_cfg)));
>  	}
>  
>  	return 0;
> @@ -984,6 +986,7 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *c
>  
>  	connector_cfg->config = config;
>  	connector_cfg->status = connector_status_connected;
> +	vkms_config_connector_set_type(connector_cfg, DRM_MODE_CONNECTOR_VIRTUAL);
>  	xa_init_flags(&connector_cfg->possible_encoders, XA_FLAGS_ALLOC);
>  	kref_init(&connector_cfg->refcnt);
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index 9d0a0087c9da..88429e01089b 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -138,6 +138,7 @@ struct vkms_config_encoder {
>   * struct vkms_config_connector
>   *
>   * @link: Link to the others connector in vkms_config
> + * @type: Store the type of connector using DRM_MODE_CONNECTOR_* values
>   * @config: The vkms_config this connector belongs to
>   * @status: Status (connected, disconnected...) of the connector
>   * @possible_encoders: Array of encoders that can be used with this connector
> @@ -150,6 +151,7 @@ struct vkms_config_connector {
>  	struct list_head link;
>  	struct vkms_config *config;
>  
> +	int type;
>  	enum drm_connector_status status;
>  	struct xarray possible_encoders;
>  
> @@ -371,6 +373,28 @@ vkms_config_plane_set_default_pipeline(struct vkms_config_plane *plane_cfg,
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
> index 11e313440225..f5e99e77e84f 100644
> --- a/drivers/gpu/drm/vkms/vkms_connector.c
> +++ b/drivers/gpu/drm/vkms/vkms_connector.c
> @@ -88,7 +88,7 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
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

Reviewed-by Oarora Etimis <oaroraetimis@gmail.com>
