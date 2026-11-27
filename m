Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795764108;
	b=sXlNg6oMW/mJVs07gQ949Gqq6ArFSDu/HMfmqkEJ+qZP1k02iNPsQGZXm/NyiyvYz7PW
	 TxvtrEr9Gdc1DtT/2UPGXhzSox2T7Vv2/tRQDufuqX8hQk229zS1VCKZTZAaO+UJjuQa5
	 xanGL/Rsh0OUQjzwZinwJeYCDjW966skzJdXjCceTBt/1GJl4niT3CGqqocX9S9c/eiVp
	 9sTWLmT1gEa+WWoR4/CzqJOtpyd584qjaQI2v+a/QtHOZHnLSUMdeoGpTSkuYqm6H43LE
	 d4aOfKHbnJmAMr77P0iYvutTYAmRRS6+r2U2OhD74JnDvrfacQzbyF3QUmmm+XvYJow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795764108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=RFWIIK5B2bXDOJcKTvFKiX1dOLs0oT0s7HmTLBjeOw8=;
	b=HEpZwm1nvkKL4ZC9Sam/2Sl7aeZLm7RBCY/7PIS9Jo8npMGLwiwCYyZGj6t3F5B/iBIX
	 wCLbtGHfdiQLQAxAAMdrxvFYDVP0p2RQ7HPIccmXZl/aRIEV2uuaYuhWVwobEpEWY3oUb
	 bX7GJ8DE1/j7eBCdEXaJx+DKFpClgRHiXSU7MAsXjt5VtvwEpYBoqWjS6/TKKSNgX0S+6
	 6T3NVterX1lvypY5CbHfwB++5EGL5yMGVnUtE+gnkR7hARNlisKjBsBOK1Y68e7sZtlpv
	 rOhnuS7y6GkemKgtDpqTrxtrmVSeDLmkUrbm10NMdDLvweHk1UXiS1v24QXPJxhwR9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uMaLlvcN;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64C1606A31E
	for <llvm@lists.linux.dev>; Fri, 27 Nov 2026 07:21:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C64C1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uMaLlvcN
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso60229705e9.0
        for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 23:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795764106; x=1796368906; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RFWIIK5B2bXDOJcKTvFKiX1dOLs0oT0s7HmTLBjeOw8=;
        b=uMaLlvcNF/iapdQJRX5piQtA6+Sj8Cf7bh/Myb1UlxUpDztMKdZA0wUM11DH70neD1
         PiqJw3XdqhzQvl71meMfsBFUMNG8Wh7ae6vKCDGBHXgq2PxomAa4fWb7pmND/K0gIZqa
         7LESXlyxnKtDED7+37mrTEHXDw10+D4ggdZm+DOO4EsICGKhoyzEwFI4QqX9LpNxBDIh
         MZliTjqgu+mAZrFXEBEyXpbporD7ldmaBxFMyq3sA/FS0D/7FiyHZvMhY/U7GrSsjbYx
         KxGALS6rA6GY6mX9toTRz8/udRrf8ddlMjtk9Gl+RzpXXvMD4jynh4gXGjgo1P3eSOae
         4rjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795764106; x=1796368906;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RFWIIK5B2bXDOJcKTvFKiX1dOLs0oT0s7HmTLBjeOw8=;
        b=Bs0lXwVeNQDZdFpYMXFJ3ZtTn+QLLCBzuE5AdbacEpC0Wij/bfD+0yFdMmosnLSYjD
         uN+nsyh03UC8sv64ewN1DxpKrOLYKq0vOtNmr5UPPgL543VF4dTscHLTGrMym/TznWL0
         4Gv4JbW8f6xPza1bk1y3rftywKI7sSKPW0guv2BpuIJazQyuvV2lsKiMoa3p96hDQQrz
         +D71G14tuF88eqxxOjSDvOjaX6Nqb9ZD4vfG7i8jYCWB4nhMbHBRx3eK3LkBHROzhnlY
         d7OEQdLQRL+avexmwdj14Z9jkeK0zdWuTfmTnx8D2IhRJBc8I8mL1GMuyTR/guuKJgbY
         r5YA==
X-Forwarded-Encrypted: i=1; AL+hErHSxbLQX9TCzZBDJC4BWNp6PDmzi8tl0aIcsnunZ6H6Xh64io+RvPm4Wbwpolv3odKZl818@lists.linux.dev
X-Gm-Message-State: APuU4Z8DXhbL27lfnd2c2ckimPMFElDOv6JxQhiXtbkDe7VSiJNeFQPE
	oVMVeGc5ld3Btj1vMchYtaJfWkKh+BOg7yUUbbCppxqO4AFXmNBBu/5w
X-Gm-Gg: AZFdTZfTJgreE9GdEQT2kpuZQCLPaRCnOi6sK0QQJuK65Hj6rQwzyTVZs5WNzrjaFui
	YRHWK7jVFdV7MtfKEDPJEnbKK7MGs1tnOeRdGe6k9tvdOXKUmp/kj5+T7rP3+aosz5ZCR9K7VTY
	fNv3o1QaRoCuRRWIjtEmQoVWaMiyVpXXMHT8FnRE2mMgv+QQA3rJAxjmUEMuw7qflkKnMZkAZrG
	CEPP73oYu9UvIOoL4yKTjRSqzzQPmeNhiU8bWl4qfc1jsdwIcnjvt4aT16orMZ4SpWpKhOFTEVA
	C2VCu7JVyyz7T2cMLAybArqwkXqPNd+L2ntlPvmyGsgoLQbx0HZ5uRSZ1MG/Ec1dgo5+HGgZlWh
	hs7eQt6SPgZF+6BiCmaDTxwEKzj+uc0v54wkwu9jHP4nfuHuCAZQnfU1JGpgAMYx/CLZrDIc/Hz
	UVugyon12vlDF6+WoBd3fMKtvNX1TShJUMG5C9Fi/8u1X8nGk8LacSbhXidr+attu6wiojVSiTx
	Otg79uNWJaujt2lAVEC/oQiI8hSdGMVH+PnkhPFU10CRB4jslBx1Exjexa990XycOQscbyd2q4J
	+LLWipSwDHIFm9xJF15oKkAqepyMWuI=
X-Received: by 2002:a05:600c:1d09:b0:4bb:73d5:ab33 with SMTP id 5b1f17b1804b1-4bb88816acemr509462955e9.22.1795764106011;
        Thu, 26 Nov 2026 23:21:46 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm885577375e9.0.2026.11.26.23.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:21:45 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
To: 
Cc: Oarora Etimis <oaroraetimis@gmail.com>,
	"To : Louis Chauvet" <louis.chauvet@bootlin.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
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
Subject: Re: [PATCH v7 10/43] drm/vkms: Reset config->dev when the device creation fails
Date: Fri, 27 Nov 2026 08:21:30 +0100
Message-ID: <awkvQvRhbFLBKy8q@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126-vkms-all-config-v7-10-21194cda2468@bootlin.com>
References: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com> <20261126-vkms-all-config-v7-10-21194cda2468@bootlin.com>
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

From: Oarora Etimis <oaroraetimis@gmail.com>, To:  Louis Chauvet <louis.chauvet@bootlin.com>

On Thu, Nov 26, 2026 at 12:28:53PM +0100, Louis Chauvet wrote:
> vkms_create() stores the vkms_device in config->dev, but the error paths
> after that point free the device (through devres_release_group()) without
> clearing the pointer. The configuration then keeps a dangling pointer,
> which can be dereferenced later (for example by vkms_destroy() or by the
> configfs disable path) once the device is already gone.
> 
> Clear config->dev in the out_devres error path so the configuration stays
> consistent when the device creation fails.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 28b99511f186..4cbb1173fcc6 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -215,6 +215,7 @@ int vkms_create(struct vkms_config *config)
>  
>  out_devres:
>  	devres_release_group(&fdev->dev, NULL);
> +	config->dev = NULL;
>  out_unregister:
>  	faux_device_destroy(fdev);
>  	return ret;
> 
> -- 
> 2.56.0
> 

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
