Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795528613;
	b=eNgQTkp8IcKFGAy+LVO3kyzxwNYettaBNA/OqlmRMvA9tMKoZrJVt36kK9AgA9Lc1ZRG
	 YFD1cHn3WAKpjmVtYcyCAcfsepDCnqKEjITEJ/2fl7CXq8bxoZeR6gucOUgrFgxKwJYs0
	 vc3xIKnj18aUYZXEhf4dBXxyf2Xc3DlpTtUhRPa7oJIX22Yn32KAL8jlLwIPjrQ/gtgp+
	 /JPaDa+7oUyb62tm1SfOuawhb2knvjSX0Xi5WGHYCbnnHVoA6NlioR960GvQDJQlU/mZw
	 A7oT3Wp5ByxLIghLiDFG9+cWCa4a79rVrxx6wIm4aC6m7GavOxy2c6O4K09VuJpjc2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=anD5m1AxXBnKPgg8ZQZ0gwUoffnh9QZT8UfPtY8eE3c=;
	b=o2HatxM1qCKG2I/oQPWu15J5pacSedh0F+UMnp4c586SwF5dpu2NfCtiGmxvnHe0n26B
	 T7iCyW/j0NRIANFu8VJv4sQyyj9MOhD/BbdJxpA6Mr49gnfSPwr9jMaqFtlQXEyxCBgBg
	 7ElKk9OoaotbxAXfGzn7LHE1/X39LsZCDBfoYnJGZuvSv97o21vWWUVPROf8L5G3ypuwv
	 scbDb7BGCH+y3qH9Xb8XmVNcW3J3PiP0X1q9hdmxRQ902iev5hY+jfQ9RS4z40kc2E+ny
	 F1Y8orGMe3zI12J7seYSOoNgtNvMibcw/JiyldeI67N6q2wLWSq2umPjCTDLAb7X29Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kg8LH9Kw;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BAC606A327
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 13:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1BAC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kg8LH9Kw
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so2939258f8f.3
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 05:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795528611; x=1796133411; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=anD5m1AxXBnKPgg8ZQZ0gwUoffnh9QZT8UfPtY8eE3c=;
        b=kg8LH9Kwfh+nSAxnCP6V1iB4vEcFrKJg6pGVl2AU/Ivkfxxfa90jJulRl5IdqGrXiC
         b7ylDbhw75vmPvj/qv9bp0OHinOw3N9HQNe24jB2M5Laq7d52bRYQ0quLl13lRE+7SvT
         K0NgforqE9oVliywn37aKRuxHJ1wW/ZnSVm6KMUiDtOJguCdzOS7SFxNnoD8zz9ZRp/y
         cmfdsNSmnowld1nOE+smki4UkTs5bwNleOm85Usv758dQbCGsGozpYZhGIA5F4yjIfrO
         wpav2WuvswQo6iR67dC5ypt7QqOOTUy72EETWNAI5SrQhyV5COsAnRwipJmuIu8iYwXS
         pU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795528611; x=1796133411;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=anD5m1AxXBnKPgg8ZQZ0gwUoffnh9QZT8UfPtY8eE3c=;
        b=xDUq4rbfzzBIZv+zCjvHR4ByHOV5bzAVF3uqINa2CN0xiKwJXhxDRMDc5S+Evze5ik
         vnNZJV6pxdIoUI3kLWHwTdOigm5cb122KSaaO23o5y9SMUfLnIvrlb0KTBz7DAjUkoE7
         DB/Qa4I+KkcLRvhYsImjNLwuZVLTLivKc7TPkljIGGFrxk/+3IobM2N/d9srzJ6Au2jT
         R8ebcB7ZMHuHnMnJVNAsHPGCf+YF/YjabWXo/mnwX33YOBDPdRKg2svNJ4mUt5l0FO0n
         MXBpJSQRsY5kzm2l16ugdR/1FMGBBrZWBNSWk+Brm/h6aKOqNHE4mJ/mzvXhGTpogPO0
         6p0w==
X-Forwarded-Encrypted: i=1; AL+hErEtgFReGaddpVwgfqIdhQ7xzEpPbdbDSf1pMD33OF8Edd7nHTlGlfidYbqTZubtVKlUP5jU@lists.linux.dev
X-Gm-Message-State: APuU4Z9fyRd2OPTyfleTAbaWvcWJ/Pd6kO+8CMIzhgVjSP5i2oimKicM
	sK3phOEIOW8+UcAJB2Q0w20tgUvGYucsnByAi6D/1bLbzTRk0psdF9D8
X-Gm-Gg: AZFdTZcGJEvGmSqrWPGFr2KWP/QtdQl9RNV4QbNFYWVX2qV6sjL9U4x4I+sDxt7dvh8
	79v7PJ9djy+5YRH2RFmg8TcIYmWhzHZCZuvNtZmMa6HfIziPCrWQTw7+fnoi1do1rGwVgM5b/H9
	j/sDMRNSgWPMO0sa0cHEzJd9zpEkxF9v8h/EmfIbdc0++4y6RTatNkFnCVoC8D7EWCa+DxtEQVC
	StsYEdpBIF3orRzru8XdbHbAbIqEFiTtQWeGWR/RT4TfVKzSzterxFqmCToOZjr3Y9WYFbreD24
	rxnKcB/DFmx3vWb4Mnrfu1Hc1dCUhdxUeCZYkV/DtvX7pmSmfcXtwPhI4FJmJxOqjjsgLjjkO7p
	X2UrgCp6UabZJldXvWEutNPBHmRJADrf1Jduy22l44y7cX3YFIp9jjQa3hG1PsSuRbnbmocKhhY
	OzmdlNRWsSOuOAl0DcxxNMPKJn7M+FfRZTLJVQDti9WsYCP3th45MJABF1hg7i6mQo2Ql5n48fK
	Dd2LoWwvzhJ4IaNC86WwfUfX2stVHtzDajrKcGbaY2FBa9BQFpk8h0016ifMUM41xwB5bAnE0iE
	xLiFBY3u6ncvcRETMKJ5+VS0CaqhYPs=
X-Received: by 2002:adf:e197:0:b0:492:b5d9:feb9 with SMTP id ffacd0b85a97d-4abb3a4d8f7mr26010339f8f.30.1795528611263;
        Tue, 24 Nov 2026 05:56:51 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm28936616f8f.48.2026.11.24.05.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:56:50 -0800 (PST)
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
Date: Tue, 24 Nov 2026 14:56:38 +0100
Message-ID: <awWXgzY_0Q2Wtn7n@Oarora>
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
