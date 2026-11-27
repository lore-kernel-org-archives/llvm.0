Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779590;
	b=rQ8s1weUzhd5xcwnLD95T+ScqU/hTr1lsnPQG7BH5pLfWH/fUKbhjO0QqmQRHivvJTXu
	 HYVBJtaRiraD4F6rB8wRAeBbunrfy4iYBsXkiPpmM6u5JJqYhef1eKadTDmXL3Mml8SUH
	 uD0S5CHhf1oAtjwD3oYJRbe2M8aGnlCipfw95rzkl0Isb8trPzIEQxwK4Vv0S77xj+iwl
	 SRCTBBKbNhG4cLoUB9T936v8IcDI7thyUri5ISP+yu7mHQpwH/iuXwISQTUboAUyoekIJ
	 26ipyv7nHIE0cEdf4aSbICaRnm8ltNERi2MZ0lvicGifBudndpvwrhbh5xn0JhjlEBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=YwGjvP6ctTxZun8XTu6GbbqiRyztei0tj/DC1LKv/lo=;
	b=RdKQE6IfpX7FKtX7ZWsB7HZiUB/MZD4FUfYsSziTsh0tfSrRyHyeBjwXTvGBp1pLIyon
	 ttRVXUwf6oXDgWGwUfLBmtDHKtJ/lJGzH4BFa/PcJVWNRB4KE9EHNCzgPxk37ZmOpHjUv
	 Daxm4k5bVsdDBzKO+yqdLlFkCCZVeLd5//K/iNhNE4RC7dkenbbXv/ce7u+dOKDqOAmQY
	 qge16nJ+VFiWgLM0Q3Bf6ujFQ10Ret1GhnRYxbEV+W5P5IW91or+eyx9woNxzAxEmXDCY
	 a66HNC626kYM5ZLGfm6ogwYmedDRBny7gIn8ZjSLLaOvuGPDkrVr3bShc3Bcq1ut/7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fwe+eUNd;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD359606A330
	for <llvm@lists.linux.dev>; Fri, 27 Nov 2026 11:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD359606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fwe+eUNd
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-498f5fa5103so4754282f8f.2
        for <llvm@lists.linux.dev>; Fri, 27 Nov 2026 03:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795779588; x=1796384388; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YwGjvP6ctTxZun8XTu6GbbqiRyztei0tj/DC1LKv/lo=;
        b=fwe+eUNdJ2+Y54yr7PTQl47O/WD2lK6E8CBuyQfL6ze+sAplFXTBEe18D7gYz4QM0Z
         GYJH1JAw4NIjUgLp0HH/AqOsRIH+fxV6WJN//CiMG3C9xnyMPh8CZOJJy5z+tp6bEs8U
         rv+D/Wf9QJ47DF87zuyVihgaYS9RGbyFNHox7pk4TRVXo+bKGjjXTTIvwe8RjXv9rGmP
         2MKsuC9Lmz2JpPNJpIIF/KYCcfNhXQWJ5SH0uHR9718mYxBWBNY+GumGTCvCsAqf58L4
         SpvnfAtfo2p/fFL3AKJqQwDPPFMMddEf1Kp9wsQoukSS0YhUbRZG2gZ6QfGN/rk794K0
         fIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779588; x=1796384388;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YwGjvP6ctTxZun8XTu6GbbqiRyztei0tj/DC1LKv/lo=;
        b=Rf1FV2eaH0/XI0Fb237/xkV1VHHURhHbTHJ9ZSfpMwABj4AN7CcrtcFVoZxAbbSbWU
         35crbWfq0jCqnQqig096osJ9QAUowRoiJrXpYDWZJ2/xV9Np6oihAEXUbcU3R7pIsgrN
         7mQm+XjAT4ncBbAH0OYKU38aW+JPlHkRBhjr3w7mYSBiauQnXFU+OX2da9qg627mKD3U
         In2TSHdzcwAmpfLcQPsuNFS9uT6qGPfZebLI+3bZ45r2FkSO5CUS2AprBZTVfty3vbih
         K+JrfH4piHBQlkPqEn+daWPejRkCaB7KPvbzjlF/oC0aELa1lBwB2MEarCqX28FMy/1J
         PS3w==
X-Forwarded-Encrypted: i=1; AL+hErGaMwkKmX7CZ51/YVV41QWeYfYQzXtFPlnItyjajUhgwxVOjWgcqpLv4GsEvZ/lBtiZUKD1@lists.linux.dev
X-Gm-Message-State: APuU4Z9RV9NMk2po3fdmMKdDknEM0a9G9hk7LKSDCooOWkCIE4rKc+VL
	ig68M7bVUhieNAyZ3AOds95QLwLJx5VB7P37bM8bnJ1B+8X1TyIUAiUq
X-Gm-Gg: AZFdTZfSlj5YBxaVuP5Zi8V0Lw0Z7mtVpa2gStLDZt4aYjoj1Ka+Lz2NwWl50DmgqQK
	GhJ7lePndrK82cgv1gJ+Kt2Ftm1C6RKBfZNG4HgJW6f7ZnqjIb6BCxYu83UunZZnQAjJog177uR
	TfK4RsE+22WKse7b4V4hv9Z1cC60L/3Zc+1s5TSS0fibyGwWKOlfgpgT7htl0LIt6K3+SZZMR9p
	XyOpaZYVpcKWjaZ/DlJ384uTn6MyjQ+tri9fCMeRsIBA+irRR2CefMdUtFsEFs1mYirgcNTRBRp
	KhM2pErtDnqrfdDfnWnNBls7nEUhoZpNLJYW/zq+jWhnCKFUXZKFB7ECntXt4d5lZn/JeKV4Oe5
	IHEAOqzQYe5+UtK9e3uxGZKoQ1Ln1FBZWE3zlOy6B7R4wnzxVAluYRyMBhU7I1FMlNYo5ffDgOd
	L/5aNP9s7YcwKGPzb/swYfHYU7GyKJqel+Di+LHT6OBxKo3cAtFtLeLN07RpklD91Rb7vmat2Qn
	wJHShwKkz6qZScrsH3q6m7rpvVnwweh3uVGhhRYgYyingYFJV7V41vtYW+/q7LOVEXDStc3yOme
	0qZR1AyxMNaFl9VQ9YdSOyfVk5r6t1Q=
X-Received: by 2002:a05:6000:184d:b0:48c:7386:af18 with SMTP id ffacd0b85a97d-4abacfea55cmr51711565f8f.8.1795779587982;
        Fri, 27 Nov 2026 03:39:47 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm31135419f8f.19.2026.11.27.03.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:39:47 -0800 (PST)
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
Subject: Re: [PATCH v7 17/43] drm/vkms: Introduce config for plane name
Date: Fri, 27 Nov 2026 12:39:33 +0100
Message-ID: <awlqNR4-W6a8w6QN@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126-vkms-all-config-v7-17-21194cda2468@bootlin.com>
References: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com> <20261126-vkms-all-config-v7-17-21194cda2468@bootlin.com>
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

Hello,

vkms_config_destroy_plane() frees the plane through call_rcu() and
vkms_config_plane_rcu_free(), which is module text. vkms_exit() has no
rcu_barrier(), so a queued callback can still run after the module is
unloaded.

Thank you,
Oarora Etimis
