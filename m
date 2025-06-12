Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7552C325B
	for <llvm@lists.linux.dev>; Thu, 12 Jun 2025 20:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749759043; cv=none; b=GgNTsQbxwyGZMbYJr4lLEjFHntRhH7SjlERAoff05lSSvRp4WsTR7MK3k0rNjTY4mBXX47bHPCiJviUybnFuKyWAu/ImKJExegNe+u4Hc8j8G88RVC9tDCUXKrjb2dBW14acqIT3dmQ70KXcpaPWBzCViz37AioP6t8AuBSMbtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749759043; c=relaxed/simple;
	bh=+YxhKp8pbLzEr9fypYT/DVhapjMVFFU4pxYzJ32Tuf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WsXvPVzK5rScy15yhfGWfbkyr9gr46nrSYeNnBHr0oeXyVflKH4No5zJR4vCmXi5mcKQ/qnR1TXw8OmULnhZHRHZVSr5agh4HIqP5qFPW639LjZytFL8rh2KrbO35DzeLw0Q2zfv+JRNPPAkExiUIV4Puu11e/hSDpT0hKbqQeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WA5A+/dV; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WA5A+/dV"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-742caef5896so1382450b3a.3
        for <llvm@lists.linux.dev>; Thu, 12 Jun 2025 13:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749759041; x=1750363841; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ACQzSKiLB081J7RKsan9TDO2EOdfGESNIDhEKLy5me8=;
        b=WA5A+/dVLqLIClkdzOMbZHqYajlmGQv/mpi8cl2aaotnWuDpEHguS+SKe5+pHzCrVU
         e4mD6rL7rnZCR9txmDdeRGRriMfqLUABrs4MIZazFk8kKpuj4bqMYotQFi1IK3Z9tGHT
         ypmvogxWNrF58gY9IeFz4YBSsciEjIUF314tS7w8wbQXIGmmYRyAV7Ke7Gb2LUL+ZlBP
         5OHUU76fVtfh4RK9ixZyb1kQg+0C0tkJLPkfVnSMQnRJ4/GKoRHyvozvVHaRYQ2MgCpP
         PLucJwJsoAaXC5PDvmA7a+7hOexs/72qz2j+qsjoBvq7cKYURQQnubUG0J023sl2CMlr
         CLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749759041; x=1750363841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ACQzSKiLB081J7RKsan9TDO2EOdfGESNIDhEKLy5me8=;
        b=eH0Jw429mOP05wjBY4DgGgEdWYU5hOeqLPvFwKmhzfHQYeTPb0kZGk9vBlaMT5INLj
         XY19xiLa2APC5CFxkZImtRYJsVLtGgUgVfOcgMglWYx1qQp4B2JWAg0UIGDiWIh+cbt6
         9FW1A/YvoMY2PFgWcWZ2eZJFm7CyUgIuo/AUB94+Kd4gtKe5EhkQjn7Hy5EGUmgx/BEu
         3atDTBe1zCAPmrF/pvUvy+W5YUNKvwHaK0MHQjzybMj5simQOUy15N7Ru3Udvb1L8Ezn
         xEOYUEIaJw4neP6Q0uEuERYBLWxBhA5mlOh2/WqhHoCo2BQjbXmLl81/HF9TbAdAw5MC
         j9Rg==
X-Forwarded-Encrypted: i=1; AJvYcCVzni+teDZlS7/mt0z2fz53Hn/soYRabSXOMcCoEbOL989UVspkjB8obVtWQsl4FOW+Ku30@lists.linux.dev
X-Gm-Message-State: AOJu0Yzjm/BCJh+eaCdEFxZpBrLIJXiJU+taD2fSfMQcNVQgovv0EP/V
	FwiI7zvXx6xp9K+h7usD7pt0VCpY+0pHMY2JZHze2tTKKn8XBQuhC6Kt
X-Gm-Gg: ASbGncvtus1l4GM9ww7mqjKpnze4dzLwy8394p6PWRz6sTL0gqf3jkkghdfj9NadSvO
	kIV1JQfmvVfcA/74AqLh15yTtxSfVX9K44+eKSVdhgAvcu0V/hthuwksNzN/pfP9Umgpc794qd3
	zI45DuFD6DgQ+tCv5BDpLp6o69QmJ3agcX705mHIZfIdKXnQka/Bv/agQtjvptaWdzhbss1zpi5
	chRGW/nXJaYLhtz9gcVrNZkpIWq1SSNcgFoEZUD4ktfL41YOmN4DoVypfibRb/OEGe8JhJ843uV
	vAsPV5Wqw3FcbEiAoc+I4RR8WxdHgDLjDfNIWeSRqKzrv0JG/eZaVuY8eBW2Ag==
X-Google-Smtp-Source: AGHT+IG8TocKyZo9LiHYpgmcLhk97cCKpOT9D/IFBCoE4AePraGyNKa1PzBXNuqHoDVO+xHoWj80Yg==
X-Received: by 2002:a05:6a21:8dc4:b0:1f5:6c94:2cd7 with SMTP id adf61e73a8af0-21fad11efd4mr288514637.42.1749759040324;
        Thu, 12 Jun 2025 13:10:40 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1691d7fsm150701a12.69.2025.06.12.13.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 13:10:39 -0700 (PDT)
Date: Thu, 12 Jun 2025 16:10:37 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
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
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
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
	llvm@lists.linux.dev
Subject: Re: [PATCH 01/20] bitfield: introduce HWORD_UPDATE bitfield macros
Message-ID: <aEs0PVkwFN9uRgU0@yury>
References: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>
 <20250612-byeword-update-v1-1-f4afb8f6313f@collabora.com>
 <20250612124415.3399e26b@kernel.org>
 <22744779.EfDdHjke4D@workhorse>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22744779.EfDdHjke4D@workhorse>

On Thu, Jun 12, 2025 at 09:50:12PM +0200, Nicolas Frattaroli wrote:
> On Thursday, 12 June 2025 21:44:15 Central European Summer Time Jakub Kicinski wrote:
> > On Thu, 12 Jun 2025 20:56:03 +0200 Nicolas Frattaroli wrote:
> > > Hardware of various vendors, but very notably Rockchip, often uses
> > > 32-bit registers where the upper 16-bit half of the register is a
> > > write-enable mask for the lower half.
> > 
> > Please limit the spread of this weirdness to a rockchip or "hiword"
> > specific header. To a normal reader of bitfield.h these macros will
> > be equally confusing and useless.
> > 
> 
> That is how this change started out, and then a different maintainer told
> me that this is a commonly used thing (see: the sunplus patch), and
> Rockchip just happens to have a lot of these with consistent naming.

That other maintainer was me, and the macro is indeed not used by rockchip
weirdness solely:

$ git grep HIWORD | grep -v rockchip | wc -l
326

I don't think that that having HWORD_UPDATE() in bitfield.h is a wrong
thing. Jakub, if you do, we can just create a new header for it.

Thanks,
Yury
