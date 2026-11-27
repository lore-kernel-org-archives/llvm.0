Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779660;
	b=wLfsB5VDeJKZiaEbeZMhn5Es0F7kGBZl13BAGdArCG6fEfMNVz78IqEvYh3r0YZ4Z61L
	 CXjQ7P/uu9bYeL5/9qu0nOIg1Oy2tHm1z2fLcc1vpDz0skFw8h7YUzndik/5AWo13AlIe
	 aT8LDs/6N8D0JBxDjfZSHnfZgYHnUF3l4+CDZWofRdRIbuJsjREzWK7go8nS9b6jv+GYP
	 dnr5QIeHJB87fIMs3hE1MzUVXTAlZOg/dBn4T2H1XBOTQM7sgiMp63igw7+3+FyY0aKlA
	 CGdCFJAoaTqwCkEbrjmB8YL+tPH7i/hS4W9pbm4PkC3LR83v9PFK+ekZW34wgkKW/Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=bp/KRA36N8EH7qPrylVQjtX79x1i14QeIGDoVR7yhis=;
	b=0MpIIfxppjWj7lN5i/9hMzNYFw03SeQmQmMZoKESn3jzBJpHO/J7YQxZ19MwFdmwR+pt
	 s84JkaSMQCxMO4iuCk4YVYAFZghTQqrX8dQtnS1W0DF8j0+dUZfFeCEuJBTF/PLE6zXXC
	 1mGMnDu2+xp7GZNkRsmGK+VwNOcuSuMLd6u4f0JHpPizs/GHs4TSbutMNX0yP4Hs/ykMQ
	 Cgsbll4nea1WMkRFmWisMkpWWkAwN1rXJuTZr+dGkLKDdPRfxr+Q+BgaYyDgHKZ6NbXvA
	 u206m2E7f70TsQAUekh6a65Ic50qH103hYq/66ZlG8e2K0bwuvmZqZhN6qxlgfXYi6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vTwYvJB7;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186B6606A33A
	for <llvm@lists.linux.dev>; Fri, 27 Nov 2026 11:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 186B6606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vTwYvJB7
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so84837615e9.0
        for <llvm@lists.linux.dev>; Fri, 27 Nov 2026 03:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795779658; x=1796384458; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bp/KRA36N8EH7qPrylVQjtX79x1i14QeIGDoVR7yhis=;
        b=vTwYvJB7hkY3UlkfuUc/7735jKrUISj3IGuAoxQ2pmB3wSqAL4Z3fjuTItmuDoQzH7
         ei41k3Gqo9bjvWigMIpg/Gq8yrC6up1+rSCTPvjJVgEVD7jlfpkGmCDxtFt2XBDC4A8O
         0l3i3ELOWo+k46dZS5oMNFeFcqZg0duLfefvyEXQ3T+gUJd4Rr+Qmo4BLdY/oEzsB0dD
         usdjrOvDpV0bTjHoXJS4Z23kIwJobRDzi7ZfV33JkGoRDqXLEggQal+jJNfeqxoZafa7
         /1LvMOco29iVK9D2vfymn6PyoRh/N39EXtmTEE+m6LYBWVpguHGNi7Lh1xcrXjc/uR2I
         wDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779658; x=1796384458;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bp/KRA36N8EH7qPrylVQjtX79x1i14QeIGDoVR7yhis=;
        b=zjEy8XrZnKwokX4apty26tnBsIAsU3FsFeblFtAY5d7+uUe1bTXjAzc1jINM98UrgO
         3HsUuLN8lfNxpsDL0dHaQIg2UzlPGjZHdXCHdM6yR+AYozfq9vZgbArLfVfH1niM1d6F
         CE5P/VMh01myPoOwoM+8yPaFS0A1yYEcbZ9sSuuWi022bg2lrASE2FHlYj0DCGIqsVls
         w0W8SNyer37DGhUxH9Zc39t7IBXyRAzZ3uQW4fJET3x8mDALv6oH/44b6Hy+oRQg2CI0
         dAzL0e45HffxK8Tuy0qBCkb/gqrTnmkxjOL/2l96Egdy7c/XkYUKLAOEjS749eaBzds3
         qD6A==
X-Forwarded-Encrypted: i=1; AL+hErECU7Jj7dojp1AsuI7l+bswErrfMswiyVuKg5YpzUTOMt0FrFFoKe+ou7jWdqQpHfW8AYH2@lists.linux.dev
X-Gm-Message-State: APuU4Z/qo1yhZKeOFQOaxN/jvsqzL7gVjv4AGCH2yfhw6rYQGBmvyCP+
	MaSabxDbbwejip5QAXRWDyBmAvSFjL311UXp3mqqS5I37K9t6CY9UXOQ
X-Gm-Gg: AZFdTZezWyshWZqXGZhWiGu3OZHwvANi1oOAJZ4STh61WaXpZwkDKGr3Frun4Ypv8ek
	8/82HbNXuJebvMoc5StM8cGCIi8yBE0QXhQRsrvTYPBtUAnR4br6gPcb8EvXbJ30b8kdjlH4AZN
	c9+AGhMZEUYx8vJXoQyMtJ+XA/sQEqy6LNCSmWG/Do936rQHix8j9q5QkiM3xaLexZPsMVR9Gj9
	LfIP5zHu95auHoBGOSO8NeKUAl7kBFOAra5B+DAXf7Px9/EdMYdvXIHTUx0pEIDtazlj7jOycHf
	hIBC0LNTZn+4Q7lGrC32YIJe6MjUUhKSyboGNv0h1yXixYPzRxlqwb4V5yr4OuxiPWJZRs//hzf
	qSRIr0REHfWjw81WDTZDDDpn/WX4icFv+a9nuQK4kZ94/rVYSf6yUUZ7yvzQ9M49OTe9luVuZy5
	jkkU7tatJ2AunQ3EDgP5PCHib8aCleqkguI/ci7Zqgh+SZgaxmHY39q+nbxFDEEwsYduMbqIPvm
	Yxlb8A9aH2//eIAjZ6QbSWcLKQWZV/LOKP3NRoc8RCfFFK4tnwZH6hUvthWek3IFJ7AOBF/p2wx
	Py7Xhjx5yUrie8tc8F4F/qHWELZU+ZU=
X-Received: by 2002:a05:600c:5246:b0:4bb:6de4:2f7c with SMTP id 5b1f17b1804b1-4bb8881c5bdmr504767125e9.20.1795779658410;
        Fri, 27 Nov 2026 03:40:58 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm47752163f8f.3.2026.11.27.03.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:40:57 -0800 (PST)
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
Subject: Re: [PATCH v7 18/43] drm/vkms: Use plane folder name as plane name
Date: Fri, 27 Nov 2026 12:40:44 +0100
Message-ID: <awlsJLmNiJhyZH6Y@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126-vkms-all-config-v7-18-21194cda2468@bootlin.com>
References: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com> <20261126-vkms-all-config-v7-18-21194cda2468@bootlin.com>
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

On Thu, Nov 26, 2026 at 12:29:01PM +0100, Louis Chauvet wrote:
> The plane name is now directly derived from the configfs folder
> name. When a plane directory is created under
> /config/vkms/<device>/planes/, the folder name is used as the
> plane name via vkms_config_plane_set_name.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  Documentation/ABI/testing/configfs-vkms | 3 ++-
>  drivers/gpu/drm/vkms/vkms_configfs.c    | 7 +++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
> index 26e7f81b5b7d..55e4183046ec 100644
> --- a/Documentation/ABI/testing/configfs-vkms
> +++ b/Documentation/ABI/testing/configfs-vkms
> @@ -98,7 +98,8 @@ Date:		Nov 2025
>  Contact:	dri-devel@lists.freedesktop.org
>  Description:
>  	This group contains attributes corresponding to the
> -	plane <plane> of the VKMS device <device>.
> +	plane <plane> of the VKMS device <device>. The name of
> +	the directory becomes the name of the DRM plane.
>  
>  What:		/sys/kernel/config/vkms/<device>/planes/<plane>/type
>  Date:		Nov 2025
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index c57791df72cb..bbfc0c8a922c 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -375,6 +375,13 @@ static struct config_group *make_plane_group(struct config_group *group,
>  			return ERR_PTR(ret);
>  		}
>  
> +		ret = vkms_config_plane_set_name(plane->config, name, strlen(name));
> +		if (ret) {
> +			vkms_config_destroy_plane(plane->config);
> +			kfree(plane);
> +			return ERR_PTR(ret);
> +		}
> +
>  		config_group_init_type_name(&plane->group, name, &plane_item_type);
>  
>  		config_group_init_type_name(&plane->possible_crtcs_group,
> 
> -- 
> 2.56.0
> 

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
