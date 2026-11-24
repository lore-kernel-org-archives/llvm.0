Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795544526;
	b=hyrV/VKP0i2WP6FBe3pLc7sHaqwUq/NV8SACR3lclusW/dt91SOfpCCJIKACPZGxdQBp
	 SvDg+NlnxmoV6Fg4nCIbwKMrTxZhNxzKrBI0FpP9dxKJT31wVvrft2zhGxTe84G1etPbF
	 UdObzB3HNh6SVDHlErl9yHeHzCRLjcYjQ3yyHuXZ0NxwQbYBxkD0cWWmjw4NWx9Fh4NlR
	 2lZni7pN3KPFz5TRpG2tm/aFmIIYvSDXU9WFV8EvNlLr4Pcms0XmwfB5oAEOLUsni3x6Y
	 JyJL1qLu0E8zkRP+Smq/o9g5xmCYpk17hOFL3cnDq1CnvLCdgnK3Au2Zutq7MKOoF/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795544526;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=UNWM0kxmEWnOWwACmt2LEHoYvhY3LG1h6QPQ7rX8clQ=;
	b=oMY4TCKWeJv7WvJVJ8nue3mzoewfc2EkD89BAI1oNTtrkPUYsoyu7S/UIxTXauQz4iK3
	 Txutkj/gT5VMzjOJHmJ5sYN80WF16OlxoCS4fFJQgrBewP3/Gibhpe14hUmxBia8q0g+F
	 B5beYIMV6KCOvfHp7jBLZBnAbmnwW6rF5LwcnB5wT/EHERtgnzNql5ZdJz0+GYNUtvhTd
	 shuDLKuJ8j8kJRnKXc+GJst3PA2zOkouPuLJV08CTbJa/NteIjy6IgREdDR5GH6ypq+vu
	 PLOvs1ftHK41t9mQF7/MMxHUnaKYKdi5nMW13FCj2MHRrQBcIZOGglTBM5hv8b+xPcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vRtGLiJf;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA47F606A33D
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 18:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA47F606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vRtGLiJf
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so31712325e9.0
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 10:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795544524; x=1796149324; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UNWM0kxmEWnOWwACmt2LEHoYvhY3LG1h6QPQ7rX8clQ=;
        b=vRtGLiJf6j0f//g9gAqyOIsqkinEgcr+X5D5etOjEeRcapKGif5R8f7KOPj+/we8Ix
         BRuHrUH5Xirw3GL2cJCZVtkX2GnpCxKJIuYqCSPZjyiN1LBKQ4oI1nuyAAWCcg3VDj5V
         pDVRbe/XCfMgg30EyKX4GVyTkaXI5caMy/U9QyP6lPpTha0w8O4tfaPYAQ/yDy7+8F+s
         gBSrkhyP/iHF4FoSpBHnKfG0tmUh/4CtF1hHdh4f8b8z6YWZij9NdjrpRofn9YG2VHAq
         Pm4txE/F/k7YzEOXxr4rPqp2yk3SpYbQa0+kTukmTCvpcOE7EfUsLQOoXR3sE9CA48BP
         6C5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795544524; x=1796149324;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UNWM0kxmEWnOWwACmt2LEHoYvhY3LG1h6QPQ7rX8clQ=;
        b=Sch1uDp447RkhKUFXWuakf3DUB3IKHZqYFEW6ERai8sz3ESgKOcvMwLCqjcIEH1PFM
         /wgF1fU/OR8vHOoj6rRfp5NP6v/mxd2SmkXpM/4yHtKlpeNQn2sWpKpZhOOeNeR9DeAd
         /HjoubrwPjkrGUFGWUv5aOI59SujMyxJSdLVJSMSZRkzANfEfJ14hoCwHhZ6/NJ3hJc+
         Z82fsqZqSZXNFXYr1+X8UOSk2Vm/PoUJG2XCfi3J1uEfv3INeuz2Du3T+nq8+3c9lbRL
         /ql4B6OV0GRjcfupSurXAQrwaCJkRVoRT30nL2KaVda2JAR1zZeZdxfcNr4pqwa9uqdz
         hUhQ==
X-Forwarded-Encrypted: i=1; AL+hErEsbtuQL1dn4HfK2tIhuMiQhM19L5nEwWkELc2XPK8pXDsscDBKok/HompPN0IRWnYSPCfg@lists.linux.dev
X-Gm-Message-State: APuU4Z8OqDln/eil6pTkqrj3/0Fc6jXXbJwGnfe5Roufn053NzTcQ0QE
	nnrtMTMWjZXuQwiqsiiWPKmGkt0rabqcQNz0SD1z958DxtUQfmML8aJj
X-Gm-Gg: AZFdTZcjIEwYG6BuiRrfLNJ4cQalJSzOn79lrSDUyJ4cscuFiE60Cox7c93sVKPeTDO
	YlWYViZtusrYiXCtdM4/VwBCBZCRCHhRGl9bNZPYQzhaW77RHPHAD/0Ohxr9nNWjMMSkly3K8r1
	SqSnWqkjXhoRUFfcYq62wOn0w45eJFVtQ6m4LhCTX7Bk0poWQpMNxV33uwT8brAvp1Svg6H45Aa
	f4Q6Lt+NAV4m9Xwy121L93pZssY/Zb5s5fMRRx/jaLawG2TsapgeuJuMcJuBp/hiOPHrKjcEOL+
	F89RAeIUmP6E8gAZUmIpY0Olnr7YvnTALvvru7wJoWe3PN1OJ27S9Wj/89IEfHp7iY6u7J6bxy1
	xDCuw3sTZAUl2+30E+ULaee7o1MPA58SfofuLIFYTNvbuxs7sDfVS7PqoeXxSDwEYgqnI9rZ6UI
	3q82zSEm2mZWzHoX/a7P2nCi2pjruqoadWiyIWyvLPdQ/nxHO+6lacZn8dGyXz9ZXet3cvfY2Bs
	GkHQ+VcU5kcSLtEvdC/9TDSBKkYgqlIRhHgibm35Ub0AUf+6HNdra45Xk31tF5jQESzltss1YHX
	jqfzCZ8LkuCoqdKpXPh46t3bWI1L3/n6
X-Received: by 2002:a05:600c:3b88:b0:4a1:e672:5721 with SMTP id 5b1f17b1804b1-4bb8880789dmr358586325e9.13.1795544523856;
        Tue, 24 Nov 2026 10:22:03 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm34524117f8f.21.2026.11.24.10.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 10:22:03 -0800 (PST)
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
Subject: Re: [PATCH v6 13/43] drm/vkms: Add KUnit test for device lifecycle
Date: Tue, 24 Nov 2026 19:21:49 +0100
Message-ID: <awXRsQbfxPzFWHzw@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-13-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-13-78ace90f4fc1@bootlin.com>
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

Hello Louis,

Two problems.

.kunitconfig fails the config stage, so none of the four suites runs:

- DEBUG_SLAB and PAGE_POISONING_ZERO are gone (2a19be61a651, f289041ed4cf);
  PAGE_POISONING_NO_SANITY too (8f424750baaa), but it is =n and skipped.
- DEBUG_KMEMLEAK and DEBUG_OBJECTS* need DEBUG_KERNEL, unset in the UML base
  config.

The device name collides, 9 of 12 cases fail:

- vkms_config_default_create() uses DEFAULT_DEVICE_NAME, already taken by
  vkms_init(); device_add() fails with -EEXIST, vkms_create() returns
  -ENODEV.
- 12/12 with create_default_dev=0.

Tested at f046b77fa3e9, CONFIG_DRM_VKMS=m.

Thank you,
Oarora Etimis
