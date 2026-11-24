Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529300;
	b=jWGVs9ses5sPJP8QDq/psPoSAA32P+gWMSzwF6dD22PNdn2fsAD1pXbjtCmQR1spTVq7
	 SJU6yJ4XS2FM1PnjX5QM0+z5FVZikJcgH7spsIMeKRnGt6WuPDFk6xTT0NtVzJnOeRbji
	 2+3P9fwT1KEfXfHxSl5fC7U/19sFh/JqwEpyYc2OEKBAxXqv6D/7ts2Sljqi7TyRHZQgM
	 Jf/NOFyBFK4IJEy+cwPAWxicBcvWDwjVh9pTO6TKDGN5F8ABgDMMkq6188Mxn+gwGozFQ
	 OcalKTMoTh7tE6g2W1w+xkrXCip5KHgfLv4v5srjlvpJRw1A4Yfbd6rjz9iKcckB6Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=anD5m1AxXBnKPgg8ZQZ0gwUoffnh9QZT8UfPtY8eE3c=;
	b=z5FfoHvhMiHpuhK2QphIJt/zy4VdpdMKwT3KLShALKNLZuorZB9x3wMg22lRxkbGfrac
	 2kP267/Da6KBTYe8Y/lVfChJIbkAFqUYlnyuK9zy2RZX6Gn5Nt+CyYsoNqu5l7ksV6+FY
	 PbdlhqY2gc6hrElkK8Ih97icbAPO2J0RA33/IvjWIyn78U/lNZPd4bqcMF2jzJLHdK+/R
	 mw5GB5wxvm1JbAmNEEymvBysEa2US2V8AqcOkBzsxNQvWxFonEnhC4/j/AbSN65SbT/cn
	 AZ1pyWJcUWPOmVakqg0eMIIIMCnJZsVdHxpDmf9Ee9gdf/U/QtMdZRv2xEI639jy0JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rIG2JiOC;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E098606D0DA
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 14:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E098606D0DA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rIG2JiOC
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c50aaad19fbso505799366b.0
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 06:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795529298; x=1796134098; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=anD5m1AxXBnKPgg8ZQZ0gwUoffnh9QZT8UfPtY8eE3c=;
        b=rIG2JiOCsMAD+3waevoHJFj4VS7UCLzqTHNIYSjhvo/b0WphAMn38KbSbTbzF+j4DH
         XjnLem4+E8CV8SjugsyWnJL8joThuWnzBDHRNqftUs0g1b3wUxXYYmCcq0NmoDx3ZzUD
         KM2DD3lCbWULzYIHacggeLSsn0rkTkEaCxYoix6X5Z1D56QTEhcH6n6HhJu9lXlCSZpY
         EHw0uEXCI7n1rFyrHrX9D14vgRpTYE+v0iQGTdIWKJSaHnu34BvSUDvkcZxZUB7Jun5p
         yklJ1uDQoUEwbMaTxdxFPllbg8/t/i0EUAHWZd+Eo5YHJCoGZYgODEUB4xmjzOw/vYhg
         QCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529298; x=1796134098;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=anD5m1AxXBnKPgg8ZQZ0gwUoffnh9QZT8UfPtY8eE3c=;
        b=ojlbUeJjcpbpB7XB8Po3L7/mmoOtUo5zLwqKvZekuE2vgKWu2WRnhvQZnZ8brPcGVs
         21/mIYLNxsicDI0kv8wGvqiuhOOkJLhqBtZYLthBgRz0MsqO+kIhe0B0gNJlU0bfaoPf
         cSdCw7xalSNERt+g4VIndJ/0caXIWCs4w9XPaJvwo/cfyshVpbnybGKYEmLynEYnVeiJ
         /b947EZ/KVJAWCxu6FNTFojnxGZSPFBtTm4HDcs+9tkLNGUMRdHzx+hqxLjoAfnBi82s
         7P7WNPqcrHJNmOf1WzqEk2hKAJQIsZWsvyW4Hf1wAdY82f7hbvHU4+PVyrpq9af7Xmob
         gyzA==
X-Forwarded-Encrypted: i=1; AL+hErFuWVWBQUPv356vkBEt3Zpwg0usiIPuA6AktfISxCX9yR0MTy7UndNvbKdIXubrpoUnKP4l@lists.linux.dev
X-Gm-Message-State: APuU4Z/G34uH52LYFGclSnSNjHh7eg2digUtggL1DK8OOQihdGRGWMPI
	Vgz4pZpgIzaLzW444bdzjfa/uguDkoP/qdSvJ7J9W9qM7rjq3y4/16X7
X-Gm-Gg: AZFdTZexeswSXanhuxc5fw0P0SbfBUQh0FuvFkjBxdVxRrHMS2RmhEGGc/SjOyGAJJO
	si5dAZ0cFjAlyXp8rU/a4iNYLaWgLwGj5yqBUjAeOLvKFieYq+W6AUpPnLDVCeFKz0ElLwPY6Bb
	RR6p/Gkl08lr2uSSy0E+fDB1KJ4fg6EX+rE7QUHml9MH6enQvBpwJ1CypM/WY/lXzyuNfDVwPhv
	73tywIqLmMxhDAw2zh1aYVGy5jZo3A1j18dMrZX84hS5eSedIinq2djTtzVPdse8wtyIyB8cAo4
	BZjrM1CBeFN2UITAgCzKFpILp9B3I4tPvlX0HZeeTbCEKbebE3p0XVb87KmlLR7VW39EX+YOuCE
	wlCvwfYs0g0BEOoBPt22uVrDsEqqRl1wD5gGQBX/xDeVHnxNk6BoCjhqHHi5zzng2tUinUdt61P
	U7lZLd8lOyzND93CVsv4Jv97yGq1GCCaLRgahaEd/dMb4MTdIZSxG0aL9C9sI6xhnpVhzeRIRAe
	sLKPebm3Ned8zYmpGYYGnToiCOTsroxNmC8n7Aq3RTBaKb5HBayOrfTfWAjHTQBfQJG69I039Zc
	B372qpfdBhEMD4CF0Vm8VPhveawWP8M=
X-Received: by 2002:a17:907:3e92:b0:c51:9ab4:393c with SMTP id a640c23a62f3a-c519ab43c77mr120246166b.32.1795529297432;
        Tue, 24 Nov 2026 06:08:17 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea1fd8sm512929666b.38.2026.11.24.06.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:08:16 -0800 (PST)
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
Subject: Re: [PATCH v6 09/43] drm/connector: Export drm_get_colorspace_name
Date: Tue, 24 Nov 2026 15:08:02 +0100
Message-ID: <awWaMHsJ2EAn1Tpa@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-9-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-9-78ace90f4fc1@bootlin.com>
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

On Fri, Nov 20, 2026 at 06:58:51PM +0100, Louis Chauvet wrote:
> Export drm_get_colorspace_name so it could be used by VKMS
> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index d66188521881..fbff5871355d 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1528,6 +1528,7 @@ const char *drm_get_colorspace_name(enum drm_colorspace colorspace)
>  	else
>  		return "(null)";
>  }
> +EXPORT_SYMBOL(drm_get_colorspace_name);
>  
>  static const u32 hdmi_colorspaces =
>  	BIT(DRM_MODE_COLORIMETRY_SMPTE_170M_YCC) |
> 
> -- 
> 2.56.0
> 

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
