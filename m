Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776018;
	b=KnyyzpGOdZSRgcVT18fCCN3ghTczHc8aKmW/47iasUaVmxE7RIFYViY+MduCXP7b8Voi
	 WY+KC30vPOBV6M5UPB8nOjTxQcQ5hNCamUc7dluQZPK2jvPqfjlaluSbB1s4w8SZXdQG7
	 JmpH4WaJs/GkNxularL38xqDcbHhIKwIEF5F8e40BGpwUXWPR7+e6mn+BVBWTO2TshVAk
	 buQJNo0mrj+yhwtJ/rmgOvADBjPb05/mpHC7l0usqOxqPOZWublwUp0eznh4InCJLPq3F
	 W0EGyl7s89EAEPE1hWY8DyQ/qUOt228nZLum1j9+XfeJYRmWlMOrvzHteiRA1Gh5wxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=1AjK2nvlqvf8IJCDZeqJhDHtg4Ek4fFwEyf2Q1hpYQA=;
	b=hrj6SLcLFGMzUJ605sjpRGlcMLbpJMGQM7Cji5RRlPvmXyObVCGtTCJYx6UQLn0Q5aHZ
	 BXJ/Hyjzh5Bmy/o0Rsylq5ol8bM3pq836siJ4JFfoGQSPdRPo5Vm5ghtbc0gYWqyWKBUx
	 NOWHICxty0v49nW0pSAPEcIXWceWrQePGa1mirOiXL2ZoaV5GLiY1q4ylangoVMi5J2S6
	 voceBNWQSkPp5BcK/yNiqyvkl8EdxcBiifHDfnaVXD2JXqvzhN6v9RQabSDjAJC59ABdx
	 2OnaEY62gdqbTpfNHH2B5xKYYXoC2IF+3w1tK+WMlQpIkYBfC850tzpc+vNwRUuAflA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pxvi6UWL;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC5D606A327
	for <llvm@lists.linux.dev>; Fri, 27 Nov 2026 10:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BC5D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pxvi6UWL
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-497614c95f0so4522532f8f.1
        for <llvm@lists.linux.dev>; Fri, 27 Nov 2026 02:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795776016; x=1796380816; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1AjK2nvlqvf8IJCDZeqJhDHtg4Ek4fFwEyf2Q1hpYQA=;
        b=Pxvi6UWLTACWf1XTz13YGEfoUx1fWjr1KhjGWMQ4Rn5JCTeq0688oMUY4imkp9tp7D
         CCycNRRJC5k3LyJCLV57PcoIAUPSrBOEFrAFNTyu7t5rTPM3SLfvFnCLYudfwP1t0XeL
         AkfdaPiru/S9hd+8mBOZtx/1z/RLSB4JmiRdUHRICnvC2Nk8No0xc2o64F+l+JZP35jW
         aeYyGDa35ns6Cfum//KAYnCmP5NjuonuoVhXnv0OL8IsytZs/57gWv1Y3GCzMzCAiNjs
         /DS+CHR/kZJwcMyokNWLMLu9p5/HltXVDfnItcVrXlt/fufJqeBMa97DXtE7WeSekQR4
         lcwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776016; x=1796380816;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1AjK2nvlqvf8IJCDZeqJhDHtg4Ek4fFwEyf2Q1hpYQA=;
        b=RJ2YlbwMV9dYPFLRr9tsRBwqpbAA1a+6ixpwXGWRMC6wA9Vrkac8pNCZQ6hGh1a0xT
         LVOLVdpF8itW4fMZXcSHu8TbEC3sbA/l6VNKeP2+wXal5tXdkIf7T+RvNGECovy+qm0Z
         i09MAT/xeSj+AIPxE9S31WBRkCIcxo2WAg/9kudWpJjnMsLiwxy4X3MLOxvNiiHT35t4
         fjIkKBfEEJgDWqa2sjfu+SDXpjBajuqWJ6iQtVOkAcIUDybdhpZ+Vi2LvZYAhoUtDfS2
         ivJd4QNGyHc3Py6TywKevJv7hNor+pBO5OsLwW08UDFXjYaQvi007VTt9uCpjJWhaZYk
         6rtg==
X-Forwarded-Encrypted: i=1; AL+hErGmjZPZMARRZQzheL4KFzBFEJ9JbE4FL3YPO1eBrLfD08HKkk26aI9r7dq9mEIjzWKZn/Om@lists.linux.dev
X-Gm-Message-State: APuU4Z9OHdnzANrxha43MfCozaXzLrPiTP3cIGNe7lS5TQR/Ty1d+VHM
	Dl599rOrXzoGaLNyjxgE48nSKjXY6LDP0iRq8nvG8UNHMrRcwfJCsbt4
X-Gm-Gg: AZFdTZcqZ/qizzOUxgjm0t3W9pOFQQXo4SDl7yV4PwzOOdi8Nh5s6aLZp8BP5aPZtsL
	cNkLjihokopEyM9EBCh3e2VxYU/aa5oejJ1LGDvO/VQcg5dVfRqOdtBYl2bcmSDjzPX8QueEgCM
	EqiJZHBSu6hjYRo2c+XxJMbnCY3YIf1tnsAw8zyWOorofBQvsJBVdwpWPkZ9cCZTQvTESE66rov
	lVnP8f5FcDg/80SOEl7GnRfjvOQ9qvdWT9N58O1sIzEhy0D5pSdGrIOHSeNYgwxq2msZET5wwhI
	Q8LEK1z+mpWJGQ2Y2Ps0cyr7D/L6zsisVXXZn+Y69Z6BXF2/jGIAPSrFDy0MJrZLQeTmCcl0blD
	Y8XDVsXBZ52NW63PPWdW6ifzjMQMOSfpZT04nhVH1gX3/C3+cMZuzAHZMUw7irdQJbAfBffBvYl
	iDQSf+/v2sik3DkrRk9RE6a/9/ay3z0jouyVnVKyKovHET2yJFFpocYZNAR5H3RdonpUDAamlcf
	Va6a6DPBFqcURvCcr11VmL/1un8HGYe+GtQr8eAbQEcrGRp8gSPaCEbLM7A98nGcjbaz9Xh4HUC
	jOt+kQTzodUjyV4ZUL0cH2Cl65NzB5U=
X-Received: by 2002:a05:600c:4584:b0:4bb:6c71:b269 with SMTP id 5b1f17b1804b1-4bb8881fbd2mr479775985e9.28.1795776016441;
        Fri, 27 Nov 2026 02:40:16 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb4341sm46259273f8f.4.2026.11.27.02.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:40:15 -0800 (PST)
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
	llvm@lists.linux.dev,
	=?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito@redhat.com>
Subject: Re: [PATCH v7 15/43] drm/vkms: Explicitly display plane type
Date: Fri, 27 Nov 2026 11:40:01 +0100
Message-ID: <awld6GvGP5acwJxu@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126-vkms-all-config-v7-15-21194cda2468@bootlin.com>
References: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com> <20261126-vkms-all-config-v7-15-21194cda2468@bootlin.com>
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

On Thu, Nov 26, 2026 at 12:28:58PM +0100, Louis Chauvet wrote:
> Debug information are mainly read by human, so use full name instead
> of values.
> 
> Reviewed-by: José Expósito <jose.exposito@redhat.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_config.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index c5d90f7e934a..e933d61cb526 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -388,8 +388,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  
>  		vkms_config_for_each_plane(vkmsdev->config, plane_cfg) {
>  			seq_puts(m, "plane:\n");
> -			seq_printf(m, "\ttype=%d\n",
> -				   vkms_config_plane_get_type(plane_cfg));
> +			seq_printf(m, "\ttype=%s\n",
> +				   drm_get_plane_type_name(vkms_config_plane_get_type(plane_cfg)));
>  		}
>  
>  		vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
> 
> -- 
> 2.56.0
>

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
