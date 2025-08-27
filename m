Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F08B3595C
	for <llvm@lists.linux.dev>; Wed, 27 Aug 2025 01:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756256971; cv=none; b=GA1DHqnJQm9CfYKBwy0nZl8VDeM/pafem6Qs6UJsLtAksqm5pJzdxvnhM7MQhBnb8MLSwB0nG97iikmWKhZkpCttuHIjGyh97iw0Ay3AHiFF+AHTm/bUTJsmR0zN2NN6iGhkoFSQwoXa3u3UW3BFTuY5MqF84e4J0bz1jXuqDwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756256971; c=relaxed/simple;
	bh=niYjYnyBVkUaS+VEAYBdmWbeRY8+WA3IC2YXvYSH4F0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eQ3tervChRrYp/yh7k0LtAw1O9xMzX0bF/YhueFQjRnB6Xb+zTPze9DzCHt85FSumrYlC9VDH3aN6/bfW5xF3mhvK1bTSpRznICAfMx0PEn+0AjQEyjjPiEwx+2EYPItAYS8Cwegr51uD/IfDEDBz/E8QPwXZmvUe4SCQK/TUco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TgOWZelX; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TgOWZelX"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-76e2e6038cfso7072819b3a.0
        for <llvm@lists.linux.dev>; Tue, 26 Aug 2025 18:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756256969; x=1756861769; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rYru9aDq9lQqkQVO+bwcYPZ+KioVEL3wdcshlzZLQl8=;
        b=TgOWZelXX1X7az5Tw+05UYcGdGhtd6mka9cbjzMUwOC8ca3bcGPkvufCKHb0Sql0wX
         +YFs6r+euwQVNIG9n3bFE3rQjXgAg9ZGR2VM+Z+n65iCWuVgfnXJJSBHy6s0FXTbyMsl
         IsIFse+JCe5JO8Y9AvuhzZQqBBCyIQ5z+eFii6E10t7hx1zG4jOaqa9kec4+f/+JXIc3
         xaEVXkHgCjAwVDfLzOdRn/9hkak8ttKPRemeXjNweTBjDSwg1zwvrtbAg9crpkYgTflQ
         ZLbHTe95Qa6Uat+2VzuJFXjl8fyOgjA5dh6omAbOhJIKihORZ0sAb9fpFiiqzViYWUF6
         pyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756256969; x=1756861769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYru9aDq9lQqkQVO+bwcYPZ+KioVEL3wdcshlzZLQl8=;
        b=NEXyoOM1emp/7zmV0ODQYQPO3AO7U39jMMWEj1Mkejnitv5HVBv/CUFm2G0AxXBvfq
         2g2tm5DMdJT6fvI1hBMJ1lcEd99Q2gROjy2qWrAL9VC64psix2BSaHDHlSoOEL4JuoHB
         0H9TpJXQU3oGxWDr8ZbUGSGgf7nbEhZRUeC7xqDX76gKeuruzItBDxFNsuaACCkj3Ypf
         UrMyetCMcSsLg1QQWfi4GOY5CnLwdWPU0wYYsvwP1Je3vD5MEvtLIo3Wyeg4HMUqP8cl
         gE3c6t+YMgXluMTM4YjGAovi7tn7iXG/8Wpp4XP/vZXwPdQCKhfjTu7XwJkT8b6JNpv/
         TxQg==
X-Forwarded-Encrypted: i=1; AJvYcCV1xwkQXVuzl1bb6AU+siNkDK/EOonvfYbJ7BrfaTQTFhlMIdA4o1LKnrnQAplG7W1zkvGs@lists.linux.dev
X-Gm-Message-State: AOJu0Yw524feOysKQ9doQWpcMmbwsUw4gI7ztDbDTU4ipp4Yo3kOi2kL
	twhhCSjW09P4PNVG7/G4fYfCtl4rxNR0o3baNvgqenhKfQw/DgP0kV0d
X-Gm-Gg: ASbGncuvZ0v0+xR/58nsA6HiOtDyHcAN2H9Y2GEl06tjyRlYNpuVznpiHP2IUjXovEA
	zn5prIbm5V6O+KM9fgABlF76d6CxLJkNi1Sf8X1F8LlKlkRbEVEJWko5Sv2YnDqsZyNNUHbSCH+
	kWEQiH6ere0D+YJ0Ow7G5rAmvcN64L7sSd+X7qTSqaARNnZs5NBNeEm2a5VTKHWUt2/rZLifqcm
	X36ceX1kJrm3J8+j3rgi9eGkolWdlT+sN86rk8GNdT97aa2Il3KOPFiMx68Q1OQrwdwJRLZj4dg
	BoeN86n+qt/uuRFEr+L/T7r6m7pV8vcD0zNoWmX4cMcbUzzQialnUQqegPhJRV5iX09QVDYMNJP
	/SkfQ3fS/C3zrOvib+oNzoj1vJIuW4Pay
X-Google-Smtp-Source: AGHT+IHkfsVuZ+4qDUB9kGWXKNs3ixhtdzwAG20w+Ik2IkMK7IqkqBUunACMn5yLzf65+cgJRTumCw==
X-Received: by 2002:a05:6a20:7286:b0:240:d7a:9591 with SMTP id adf61e73a8af0-24340d1c50amr25873828637.46.1756256969084;
        Tue, 26 Aug 2025 18:09:29 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4a8b7b301csm6847632a12.35.2025.08.26.18.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 18:09:28 -0700 (PDT)
Date: Tue, 26 Aug 2025 21:09:26 -0400
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
Message-ID: <aK5aujavDc4PvvjO@yury>
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

Hi Nicolas,

Thanks for the work!

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
> 
> Left out of conversion:
>  - drivers/mmc/host/sdhci-of-arasan.c: mask is non-constant.

+ Michal Simek <michal.simek@amd.com>

>  - drivers/phy/rockchip/phy-rockchip-inno-csidphy.c: mask is
>    non-constant likely by way of runtime pointer dereferencing, even if
>    struct and members are made const.

+ Vinod Koul <vkoul@kernel.org> (already in the list)

>  - drivers/clk/rockchip/clk.h: way too many clock drivers use non-const
>    masks in the context of an initializer.

+ Heiko Stuebner <heiko@sntech.de> (already in the list)

Guys, can you please take a look? Would be nice to finish the
consolidation.

--

I'll take #1 and the acknowledged (or at least reviewed) per-driver
fixes in bitmap-for-next in 2-3 weeks before the end of cycle.
Everyone, please send your tags!

Nicolas, please ping me if I forget. For the rest of the series, in
case of no feedback from maintainers, let's wait for one more merge
window, and then move everything altogether.

Thanks,
Yury
