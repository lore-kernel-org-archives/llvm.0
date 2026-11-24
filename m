Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795525942;
	b=47RCAkTWvsDHMbvY0WAYDu6W6mR0FKL8RsCz5BhYTHTcFFdFSWvPw/xjKP9PyBgzk+Bi
	 A/YdyQN0D9RV7tudEebWi7X2XMJ2hNiDWqBJRFERT7aTI/jugTpv0INWgk1cPXLqpy+2t
	 6MDuuHBjTgUGL5cdi07G04QQDdQi7jXnqEZqYm88/ZR7lEXXigHnpbhgoHEUq2m6FjFzT
	 51mR6ykmQUq7nmeUVysAEn66QKEshAuaXcxBktXwo+gJLSH/LCNESAT9x5tLhcd4w78nV
	 NPE5P+ozl9PI9DWn9fHFoyF7aeIX3wJhMzyb7WFe+71SKQtm8XS4GXSddPRPJuT35ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795525942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=SPsNgyVVAqeT7i1RiIgNXc+OMJpYpOzW291/apl/HkE=;
	b=diE5JdPfHsLxm9Nb/H1klCRmHuPcj93yOukqbmbopep8A3i6wuGiJfUpQdpfq32mBFB9
	 8I6k8kUS1vwN5S4j6qqLkiagFCGbr0KFoekDQ70Isk2S/PliqwN6g9YCOAnVizza4rq5v
	 qZoCIopjX7qDrpoIKzXY3QZjFvbghYkAUKshrFNa4JNuA0U8ZD6DRB/ZipFxyxUaeEptb
	 dvEGaVB1v0RFqYNuVd+FaRolAKCurdafyu1uw6m5A+mHos9jCfXlhqFlZchmYoYo12FSw
	 M7Tz/EVk7zlX2GNwLRrmQqEZ3Iy97g8XZyoBNTWfqy/ebrF8E2MRQeO3WDaASm5Z1zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="A5/bJpmW";
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C07D606A322
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 13:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C07D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A5/bJpmW
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso2079850f8f.2
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 05:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795525940; x=1796130740; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SPsNgyVVAqeT7i1RiIgNXc+OMJpYpOzW291/apl/HkE=;
        b=A5/bJpmW0JY7yfzIUJ5SKNd3UyXsvzOwmvyJIycXJY5WFVQxKG4fj4clvwIROM+15u
         HrS+U46FA8xnrvkDVIZQM2zI1KPbW4KqFTgPIj+50Ogd6NhbWXsClykJS3YVrlNQlmZC
         HKXLbwumJOKynaW0hWZNCywXf15xVqHuqkkIvJxw1/rExh+N4AtsZnlyhwXDVISYlPnC
         VqPQYJVwM2k1nmESrrcW6bSwZK6nMVYn3CQB/s41hXrfIarQ+cDkm8mqYEvQXMvSJ0ju
         K+M8KwFdw9VgwPkKmUjXIhAf24Q5UujWrE+CF5wdP/fstKR73du82an7gJFjcGtMvj1m
         jb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795525940; x=1796130740;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SPsNgyVVAqeT7i1RiIgNXc+OMJpYpOzW291/apl/HkE=;
        b=L7zyQ+BjRj7GvT2FmTR3oaSDcR0bh/2FaVtnAzsG6cNqsmheQmlMosdl2sSEHrN9ii
         jV3KVwG9CXuvM4C3qkGtH0mOwJw9UCo/ZlnHkUxxySRa1CWQMCtqaoA0y48P/4wjXYLh
         dOX9XbCBFWiTl/Pz6jrnnI1uerqTnGMSMh69AbpEbKuK/mh7U10m3Tt34PAaeWimw8J+
         9qFI2E3qR/SFdje7h+KCKzU2OZGpkTMK4BjQmF2x52KVscadBGqpjy0HEl7+LYIaIob6
         r8Au/ZC9c5jWvwGTezPi9RHSPW9PoFcI0OI21WmOdu7uVH3PV/nVUAURNugyT/Yk+Lsh
         JU+g==
X-Forwarded-Encrypted: i=1; AL+hErH3TgggLXtFYS/pI+dY66FohSXSA6bku9IE5+saFzbU2f+AJZ/sxNVf5lgQF1Njh5S2Mw8Z@lists.linux.dev
X-Gm-Message-State: APuU4Z8PV0m1oIpgMOVW2/5heVArjed/UafEq53+s+VsV11hAOuzv6np
	CO4PQox/m356XbNNp9cMWnRXedDZJHGIfYVlTUyqHq/Gv0mFMWndOpuQ
X-Gm-Gg: AZFdTZe5443u0LS2W9itb9s+X50AxzhJZ+fIZSqf/hHoRXxitmlXqFvEnq+e5rzoifE
	TmGVygbYmYEHubd6I4PoZ+Fd9LdQ2q0NlJ0hqXR2lkVVbRjeLqwGAZwJKeAyAu0q/b8KLT531IY
	Ncg2+Lxqk7ukRh2mxIV5kiSp243NEDlRguNQJ7nvnemwg0z1hJEcdxP6KebzUmFMLnrckTTCoOm
	rmflJuIcppoyiYOGjFeoEa9uEcsNIFhn6rZ/fuv2GKdiJ48n5A9c1W9XPS4cCnwf3DR3B2XeBiu
	mThJdimeHmLzad7P0mY9HoZ1zZGptCNgK0lRzdvaoJVJUZ3Hw/HmSPHr3uxPBVbIp8Bn/Zlb0zg
	6I36dLSoDRkVnl4TNvwfrOjj25Rz3oJZotGm4ZxhKf115j5aMaKryxIjx0hQFNJgtq8JNNH3sfh
	v93+OArgdgRb0iAoQWA2be0XVeIu3zYXIDLmurn0C9/L5IioimDXBoQdAU0mO/kwzTNN7KtW9Ts
	BBpdXg7XULVVvYoywd63Mn2yy0txVeb9TVqW22qS98STUYLOHCa4JhgdOlLRInLMk6vgAAdUiv0
	A2UO0Ey+TPKcycW6UvE+012ReJxbjIQ=
X-Received: by 2002:a5d:5d05:0:b0:491:6c24:65f5 with SMTP id ffacd0b85a97d-4abaf74024cmr30988416f8f.17.1795525940203;
        Tue, 24 Nov 2026 05:12:20 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c43563esm29088126f8f.57.2026.11.24.05.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:12:19 -0800 (PST)
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
Subject: Re: [PATCH v6 06/43] drm/tests: Add test cases for DRM rotation name
Date: Tue, 24 Nov 2026 14:12:02 +0100
Message-ID: <awWLyW77VcEKkt1w@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-6-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-6-78ace90f4fc1@bootlin.com>
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

Tested-by: Oarora Etimis <oaroraetimis@gmail.com>
Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
