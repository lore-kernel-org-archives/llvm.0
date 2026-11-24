Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795528415;
	b=vZI20Q1W8mw/wpFwyoQILPc+GPEQ7vGRvXxK8+fNFOdNUjD1lYTsL/VeFaEXSqJuHBDq
	 jbL/fTZbxWmo4eioE5A5rvnphhaOLGssAfty0XjPkN6I5j4xtAnbR8rKhsFrwobrhfLiV
	 lfGMPyFwDPz4PjmT7vv4P0NdaYKM57+ozEYKWyAx2khUkqdbBaX1hW62miDjt3mzSQMrF
	 5oBNtiv5U9Ro0jG0sUylv+HaZ1shatQkD0u2pSjy89vqOp1jWlx+SCCkyuZF22j2UbBLJ
	 mvxLKiwavcawBqcR2WD9AX48Mi5HtAxPAgXLz2qxLOG52UEPWn8M7OfcukS+MwiNutA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528415;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=q6JmaR/skCNhplZj+MXI58e71T+5r4bXzYFahMOHLqU=;
	b=vkswjYzByZEbw2RSr+s6xwEgqNnYbp9wEq0F/Jv1gOigTTPTvoCP46Lk4eqE8qfqf3Mj
	 /RhaJjh0kf6j4Q0qTS57LeaJD7mpivpLww9QvlhYrMbURyGjMR61jR0etybtwbeL4Pbxw
	 hoygFI9Hb1D7fEkh9nH8vAeQIefmwgcowH+iM7fsqjciwYUT1WYreNoDslS/Rjz3W04zJ
	 PTtplQrjnGXVjEOQ2ob06y/rkzXHv1A/ndljdhNzB6Nc0oJiLfagiSTCQO3EuUq5igJcc
	 H7ZoDnQ4/ysjSpax8CIqfk8VlkFYY/R4/LHK5FZtLdQmjNoflhmzjD5iHIoG3u/tUeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tjG4znKO;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD79606A322
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 13:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAD79606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tjG4znKO
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b8a2518f7cso5261740a12.2
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 05:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795528413; x=1796133213; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q6JmaR/skCNhplZj+MXI58e71T+5r4bXzYFahMOHLqU=;
        b=tjG4znKOCkrDCX2LnYPFOBAw5YAvl/USNVqEYAuWIGhiCKmiz2BQ7c+szUfYphgIvu
         nLO8x/92rUxYKDPc+XhXLl/DTeRhIwghHMFJAjtvkBQV3eQqmDjwaFL2YIUkdkc6Xri9
         HHKZf84iQabanPpcS6I9yh59TW88yKjO/sTd1JMe2njWgAxuMsLp65U311gSLNAxTke9
         N0wOY77T8TISatdu+E/RwYH0t/mL0OdT27YXIZuPt9zwBWVLdPNFA+Rs66Lip+z+rhNe
         /gqx0LJWlzkbIzCst2gJyUvtlGBoMMUJaku2ssX33bnWeOOT2rk62FfOGwWxUmrZPzfY
         Y07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795528413; x=1796133213;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q6JmaR/skCNhplZj+MXI58e71T+5r4bXzYFahMOHLqU=;
        b=Plim1/O4wtxdAma/9IMA/sWcZYNmDh3PPdI6EIQ8w5/YXd/y05SWlNkOMKoo0OR/7t
         wqEPEFKfTzdi4uoBMP8ntvv7SLqK63w3jr9OrI/EcYMQrZ7unZj7iDWVJwhG6G4Uv5v5
         uJGB6tu90mDnu5XXL9ObKhinX2XvMJfk/HKh2dGpaxZ97K5+HrKbbOBqzPQ6TxIB8/wB
         aDtfhu9yE2JBzM0YgbJoUi1CZpapJgvJ7Oa0ZBcr4hFwMQWBFYS1OPeQz9UOwTZCa8K0
         +A6E1RMGEeO6PaiCkR7kViaAnfJYutXPXBPAye5tyTGAwccU8EtrvtenNeuFpRKA0TTk
         owAQ==
X-Forwarded-Encrypted: i=1; AL+hErFmLduiJ9cX3JebpwBzXR4JaO+sKRr2G7L4CWA2O9Cg5A9yaB0PD6MWfDbT+BfzpZWP9Hs5@lists.linux.dev
X-Gm-Message-State: APuU4Z+7aDiNS6oBH4Q2QBGc2RW75WayQ1oWdZiK4J0K9tlbm1l+wsRy
	YUGJR0YuuSgnBahU5M9QYEE8ASUvh2nE2Ch/Jes615z/Myy+eaJ117IK
X-Gm-Gg: AZFdTZct7qY3BO5aItESuO+gd7hOxzi/sNq9cymF89025dMi20KxgY8F94kiVqB/sYI
	yna739xZrPqFwahdgobO8vhdY3aqmRlQKkG67GcI4BYWPR7FOjtNQMoFqa9uddoSUswIUGjyccA
	X0bBvhyRIBCk6EGa6Xx6ji9mjKhdHQxSswP9cpmEO2n30OsgL2XdNwy0L2UwaRO70EyVwHMccFu
	q/kbx5WT/bWOesfpFf9coY9oqlCTjdhqtVGEjX1CzxVEi7O6cy5W+ywwygQTCb+EyWCUWbpqcZs
	+R3nEn6DCPsSLAEzNfjGFLcml0Q7pjpBE9pZcgM54gv2rWQqtf0JwJF8og7aoRlSmbMZr7YWJtz
	Q2ArFDD6pFHqO3K/2e48QvNoJcm4J2PP4/EsqA6T7AHhaK6D+/RNN7DuD+TNcO3vggvINVJdn0Z
	oFc4fx5bNdGb3H0iRgsjTZ9USLE4bOdQfMscjWLqNKu9BCwcj0PIDmtiruSn9IA7GEYQiwzpWfn
	+tOxG67zWKQJPK2Or7yVIvKI4R2Ez1xGPKJRDA9eAyO/0Y2tvCEHD2qx9zGDngm21aFs5tETF+w
	ApuBZcRj/8Gy4uiY966k2YwPS4G40hQ=
X-Received: by 2002:a05:6402:c70c:20b0:6ba:1347:5cd with SMTP id 4fb4d7f45d1cf-6ba37c7ad6bmr7580207a12.2.1795528412985;
        Tue, 24 Nov 2026 05:53:32 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36d730d1sm6833598a12.0.2026.11.24.05.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:53:32 -0800 (PST)
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
Subject: Re: [PATCH v6 08/43] drm/drm_color_mgmt: Expose drm_get_color_range_name
Date: Tue, 24 Nov 2026 14:53:15 +0100
Message-ID: <awWWuPbKPoIkMxNC@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-8-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-8-78ace90f4fc1@bootlin.com>
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

On Fri, Nov 20, 2026 at 06:58:50PM +0100, Louis Chauvet wrote:
> drm_get_color_range_name can be useful to print debugging information.
> Export it so it could be used from VKMS.
> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/drm_color_mgmt.c    | 2 +-
>  drivers/gpu/drm/drm_crtc_internal.h | 4 ----
>  include/drm/drm_color_mgmt.h        | 1 +
>  3 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
> index de219c23322f..a65fef5702ab 100644
> --- a/drivers/gpu/drm/drm_color_mgmt.c
> +++ b/drivers/gpu/drm/drm_color_mgmt.c
> @@ -512,7 +512,7 @@ const char *drm_get_color_range_name(enum drm_color_range range)
>  
>  	return color_range_name[range];
>  }
> -EXPORT_SYMBOL_IF_KUNIT(drm_get_color_range_name);
> +EXPORT_SYMBOL(drm_get_color_range_name);
>  
>  /**
>   * drm_plane_create_color_properties - color encoding related plane properties
> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
> index f3a3ffd358dc..168799fac7c8 100644
> --- a/drivers/gpu/drm/drm_crtc_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_internal.h
> @@ -38,7 +38,6 @@
>  #include <linux/err.h>
>  #include <linux/types.h>
>  
> -enum drm_color_range;
>  enum drm_connector_force;
>  enum drm_mode_status;
>  
> @@ -119,9 +118,6 @@ int drm_mode_mmap_dumb_ioctl(struct drm_device *dev,
>  int drm_mode_destroy_dumb_ioctl(struct drm_device *dev,
>  				void *data, struct drm_file *file_priv);
>  
> -/* drm_color_mgmt.c */
> -const char *drm_get_color_range_name(enum drm_color_range range);
> -
>  /* IOCTLs */
>  int drm_mode_gamma_get_ioctl(struct drm_device *dev,
>  			     void *data, struct drm_file *file_priv);
> diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
> index 133ca77d91c7..e91f494e5a63 100644
> --- a/include/drm/drm_color_mgmt.h
> +++ b/include/drm/drm_color_mgmt.h
> @@ -114,6 +114,7 @@ enum drm_color_range {
>  };
>  
>  const char *drm_get_color_encoding_name(enum drm_color_encoding encoding);
> +const char *drm_get_color_range_name(enum drm_color_range range);
>  
>  int drm_plane_create_color_properties(struct drm_plane *plane,
>  				      u32 supported_encodings,
> 
> -- 
> 2.56.0
 
Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
