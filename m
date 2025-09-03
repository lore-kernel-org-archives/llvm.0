Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235C61E4AB
	for <llvm@lists.linux.dev>; Wed,  3 Sep 2025 00:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756859435; cv=none; b=Iew/zKIH7jB72wbrlYuq6HkARD2uQBDDc/p6WokbnW0t7h2Ueaf5zPt9tj4XNDshy3PTjhMoFyTaBTeLAXZKR7xEFwEloT7/WKqBfx7wjxKX8fGb4cgSCTzVUu8P6MgsNYAzfe85X/UVQT78tggTka88xVWDunTWVjiqxPD8nq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756859435; c=relaxed/simple;
	bh=kN1SVeqqtF7jjk4r9ClxSGmVc8Agt/K+EhDBYCzp8ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fPlk6NapYMJq3O7apg4stnRVrfr6KKp+uC+P1kRMPWGrcLtoM5uSUVQgvHfRlEs/zGZIDe00Crk7Vu3w+3HH84ALmuYp0iTD8RSaEIMoGLs79uaZHLbIUjLt6UZDzNUv7scdjdvgbZdqLxbQtYIq+zyEaBPb5ENbtJGtxL0/2Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JQNkhSaL; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JQNkhSaL"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-323267bc2eeso4666379a91.1
        for <llvm@lists.linux.dev>; Tue, 02 Sep 2025 17:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756859433; x=1757464233; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CmMfbXYYghLau518ZkBS9EQ6iyJ6tyWuJVdbkNRuMJc=;
        b=JQNkhSaL160Xq6P/aLENe9RcaVi4XhOw0oA4k1O7m4IurN/AgBIsjohi465AkIGdEf
         p0d+PpXm8VEUl7eztyfSLpqPgaTKvkNfm4+DUwSzC7cwY7bPXISR7tq1dAcpXdCQ3b2T
         +JLOy7hy8zas4H1XiRs91VqRS6bx3xcklaEguShHH9Qy9PF5T9q23H0/NgpmIaXNbNI4
         v384NO4ZMHtJFaKOecky3R3lvnKFOZln10mGxFTZIgTO7FruK0Kkz+ZNNIPFeHbBJt77
         7YWoRRN/qIeGucB75EImA0HVpsjAVmW0iqzguy82gNykfwRLtmSLYeXupiu0DAxy9CcT
         MTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756859433; x=1757464233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmMfbXYYghLau518ZkBS9EQ6iyJ6tyWuJVdbkNRuMJc=;
        b=PovsbwivRLq6O0WPEdv2XJJH1LZaz9GvrqRixDBTlDKpR2p4c5ji+rzqOPuKygTMHH
         7b01jW4pa2/pfhFRzdIFt4IDpf3p1bvWja8/zk0rVAxONYeAuSMPCgB/mBndR5EnnD2o
         0tvEm5A6w37f9WVhqnoHAiy7/4xGLru0oLSEqapCKwqITNGxEse3Xshtvu/3iYrTlAA6
         FF5OjWS3aNgIPsnXKx8N5RBGG8OApMqBGH9yYQeVgzBFLfcbW5GA5Evrr3VWSMkZvBvj
         HP65YPAtJWPGw4xbp20ZKJZgU9EGlSaIHCUPuudM9lmVuVsopSqzAS4mfKYMsefXELWJ
         QotQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1mX4sQEbnYFO7PuOPAnK2EGDJogtu8PzQlHRAv1sv0wtbvFuUWIsG4PHyC+Le9sLO2SvA@lists.linux.dev
X-Gm-Message-State: AOJu0YwiJCxtCC8Ch4qXutkjC/rBQfC8VY8sAdLLR3XlhtmntcumWEW6
	ItnknTdTO5u+1e13KTkFBYPH+1SFWnVFoozezi/OzvqH5GaKlX3fYaLG
X-Gm-Gg: ASbGncsUxoP82k9u6QJEZb1XOe+0KAW79NezMYPzxVhvEOgWgGldH+2y8wYgI7F/VyU
	6Ii3CywIvYxqml3wkrxiCwSEq1UcFdJczI1vJnA7/j/wC7Lj0OD9n1tzdkC1z39oJgT/UHOwFZj
	41v2SotL0OwpAEwNjEuI9Rz5meE3XpOQgX/ZBsMbGjIOTKyf/aO2uXqN0fmxVvg5nWo2oKqXUNY
	AUyLtvvdAhHxW6fjQZp8fBoBfhYJhYZbtGZYtNqQuHl1SHcLlQB7e4wqIDK8dTh0rmayvERGi6J
	gvjw21XEAD/rt2z64qdmvIrOmew6lFe4irvi8CrJyioNfCTqd4wMrUexfF5eRX1lZXgDWdFLBkD
	yoZywGMjHP3eZTm/RohuG8g==
X-Google-Smtp-Source: AGHT+IHKuGow4ZFuttu6aoYR+s2VkdzBbs1o2jEf8YSpdi38rlMbKdEgFtFxfdUZ56XgWRNUklItiw==
X-Received: by 2002:a17:90b:1b12:b0:323:7e80:8818 with SMTP id 98e67ed59e1d1-328156e5627mr18724374a91.37.1756859433210;
        Tue, 02 Sep 2025 17:30:33 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329e23858ecsm3480217a91.14.2025.09.02.17.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 17:30:32 -0700 (PDT)
Date: Tue, 2 Sep 2025 20:30:30 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Shreeya Patel <shreeya.patel@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Qin Jian <qinjian@cqplus1.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, kernel@collabora.com,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
	linux-sound@vger.kernel.org, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
	llvm@lists.linux.dev,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v3 00/20] BYEWORD_UPDATE: unifying (most) HIWORD_UPDATE
 macros
Message-ID: <aLeMJjfhisYSIEph@yury>
References: <20250825-byeword-update-v3-0-947b841cdb29@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-byeword-update-v3-0-947b841cdb29@collabora.com>

On Mon, Aug 25, 2025 at 10:28:20AM +0200, Nicolas Frattaroli wrote:
> This series was spawned by [1], where I was asked to move every instance
> of HIWORD_UPDATE et al that I could find to a common macro in the same
> series that I am introducing said common macro.
> 
> The first patch of the series introduces a new header file,
> hw_bitfield.h, which contains two new macros: FIELD_PREP_WM16 and
> FIELD_PREP_WM16_CONST. The latter can be used in initializers.
> 
> I've cheekily added the hw_bitfield.h header to the BITMAP API section
> of the MAINTAINERS file.
> 
> This macro definition checks that the mask fits, and that the value fits
> in the mask. Like FIELD_PREP, it also shifts the value up to the mask,
> so turning off a bit does not require using the mask as a value. Masks
> are also required to be contiguous, like with FIELD_PREP.
> 
> For each definition of such a macro, the driver(s) that used it were
> evaluated for three different treatments:
>  - full conversion to the new macro, for cases where replacing the
>    implementation of the old macro wouldn't have worked, or where the
>    conversion was trivial. These are the most complex patches in this
>    series, as they sometimes have to pull apart definitions of masks
>    and values due to the new semantics, which require a contiguous
>    mask and shift the value for us.
>  - replacing the implementation of the old macro with an instance of the
>    new macro, done where I felt it made the patch much easier to review
>    because I didn't want to drop a big diff on people.
>  - skipping conversion entirely, usually because the mask is
>    non-constant and it's not trivial to make it constant. Sometimes an
>    added complication is that said non-constant mask is either used in a
>    path where runtime overhead may not be desirable, or in an
>    initializer.

Applied in bitmap-for-next for testing.

Thanks,
Yury
