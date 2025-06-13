Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9F71D8E01
	for <llvm@lists.linux.dev>; Fri, 13 Jun 2025 14:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826353; cv=none; b=n/HDXZJUS9Su3iyaf/oL33YXAeTehlfNtqlHBDVz63cAiUZndMKt0bLIbxCAW+0ikCw46vtwdnDnlDLgvsDkvN7BeS/BoBqwI6cbPtXWIPQp6zPhAtXlQ8gv7y28UnrBYQg07vnja9bz8h/e+o3chJ3uXGCO/q2bayeZW6v6eEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826353; c=relaxed/simple;
	bh=Q9XbAxGbPKwPgpFGLC6BiXPwoGl54z+or5xHNF9dw1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XqZxmGvImmRMsT3w5IE1OYrap6J8EHgoJjAGHhJqboJut5dHBgNeK+/QTjPHbMRm0FEO4rez+vEi1oZmHD8C54lFsyWGjDVP2WoDfw+LgwX7W7fxjOQlq0bWr6FYnOfgTdFtJa07pMHEbOUprPImwdRu0GVjk99uG+gbKrloGsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Opd3CLz7; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Opd3CLz7"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-74264d1832eso2384045b3a.0
        for <llvm@lists.linux.dev>; Fri, 13 Jun 2025 07:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749826351; x=1750431151; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nX9ttAjMiBk5GnAWKnbFZ+j4zoLGHNZodgimLxzGDTU=;
        b=Opd3CLz7RnU7SdeZIwadFq6Xx8baNzg3elg75Ga/UfwSI4vfCnCXyEivtG+DW5k9sd
         a/MA37rQh4Ayt5dq0C0vVpRZeCD07PrUPMRTV0nUWg7TJ0Jpyq87cqYp4zHMYbhU8MoF
         g3bI7qe59zwtG3G9GxEBdx57oTAZGYzon7sgP/0I7GWgsfsafaZpK9EymjOIFbgbG6+m
         JnhAax/AEAr2VsJSnyZxU+C0JALE0VihPXGF/jbemQ5PnZ79mvmqA33EfFxbeSiN8piO
         DAWJL3us3Xp49JuZ/5zMQZoKE9PgjLZuc1w5lEq0K3sLLJLza0JQ9gzJK5gKKO2x0/z3
         CdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749826351; x=1750431151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nX9ttAjMiBk5GnAWKnbFZ+j4zoLGHNZodgimLxzGDTU=;
        b=YB7FL7kw+1WxQ1hoFdLph0ePO4GPm/1/Qft55H/Xdstc4591q3R0fSWaJt38E06+Jk
         eCeGUAOhTqny+E7fuiUZfPAkqvMUcyk3PGQi8uaYFfEoenk+erjo3YNxLfe5x0s58wtQ
         Y5G3DmjQr4CeSHX02sx1JCyzxwoWBNtjrp50GTsLhiRPtT7RbiT6nOfMpvVpaGOEXP91
         5AAglINmGVeKBsu0+J7kKlBnKc9d1tfC5VzJoSVZjF5akeP7lx17vX6OzAkOIEHD/Dnf
         OoEPchsv7iFJlQNYYe8eOAqAAAaB9ICYc/1vK9qk4OQBN8fu0NpiQ7Kd97QqIF41LHnn
         iq+w==
X-Forwarded-Encrypted: i=1; AJvYcCWGWecido1dB4i+lXdHBbgC46gsFBPOu/uiQA64hRbNNpew1sb1S8GEop7WsvgY9WjZDass@lists.linux.dev
X-Gm-Message-State: AOJu0Yzwagv23T7TTi7X3xXs9meUNbWxCrfoZRL09kScuplBSMzbQxK8
	B7N3qWOJo9zB6/K8dtdRcJ/4IzEbdmJL9fJ8vzUiK68I/EtIG722gIZ0
X-Gm-Gg: ASbGnctnvJ9o3G2B1afjMOF0BeJe2c4pqoZISTBxFiuuqR5Oss2/kXKm7IjCC8aH4J2
	kkJPwQEX5baeD6AQhfiZs75Cf2TBladYzcMLIVI2KBiVsA6UwQ9bsRh+2s0qsleThDiXqf6+mDd
	NFRWWqW0UnxQAHq4be4ZyqK4mUgxx//n9wpyuPCt2y9uWAJQBwQAuOg2r4+WI14quDTjIBe0r9i
	HGZ6Wtwt1mB48rwzDlpS8iduNkwNlvG6QnM2I/cp6+zkVq7UytbsTOrNvDaYSdxF6sGm/jxLufE
	mWIM/3WQqZhJjx0hMbSEAn3UqoyrmBYO840R80ZOnPkrKETMOftDZfGYOcWMdA==
X-Google-Smtp-Source: AGHT+IGmduwXbHVfGIDlskqKLcCBNDCHGWRFnOFCbxfY7iXbpVq03NTOlkVGcUndD/CI3gBb8mRMVQ==
X-Received: by 2002:a05:6a00:2d8d:b0:742:b3a6:db16 with SMTP id d2e1a72fcca58-7488f7e38f1mr4843190b3a.20.1749826350828;
        Fri, 13 Jun 2025 07:52:30 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900cbf58sm1723692b3a.148.2025.06.13.07.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:52:30 -0700 (PDT)
Date: Fri, 13 Jun 2025 10:52:28 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
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
	Justin Stitt <justinstitt@google.com>, linux-pm@vger.kernel.org,
	netdev@vger.kernel.org, llvm@lists.linux.dev,
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
	kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 01/20] bitfield: introduce HWORD_UPDATE bitfield macros
Message-ID: <aEw7LBpmkfOqZgf1@yury>
References: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>
 <20250612-byeword-update-v1-1-f4afb8f6313f@collabora.com>
 <1437fe89-341b-4b57-b1fa-a0395081e941@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1437fe89-341b-4b57-b1fa-a0395081e941@arm.com>

On Fri, Jun 13, 2025 at 02:54:50PM +0100, Robin Murphy wrote:
> On 2025-06-12 7:56 pm, Nicolas Frattaroli wrote:
> > Hardware of various vendors, but very notably Rockchip, often uses
> > 32-bit registers where the upper 16-bit half of the register is a
> > write-enable mask for the lower half.
> > 
> > This type of hardware setup allows for more granular concurrent register
> > write access.
> > 
> > Over the years, many drivers have hand-rolled their own version of this
> > macro, usually without any checks, often called something like
> > HIWORD_UPDATE or FIELD_PREP_HIWORD, commonly with slightly different
> > semantics between them.
> > 
> > Clearly there is a demand for such a macro, and thus the demand should
> > be satisfied in a common header file.
> > 
> > Add two macros: HWORD_UPDATE, and HWORD_UPDATE_CONST. The latter is a
> > version that can be used in initializers, like FIELD_PREP_CONST. The
> > macro names are chosen to not clash with any potential other macros that
> > drivers may already have implemented themselves, while retaining a
> > familiar name.
> 
> Nit: while from one angle it indeed looks similar, from another it's even
> more opaque and less meaningful than what we have already. Personally I
> cannot help but see "hword" as "halfword", so logically if we want 32+32-bit
> or 8+8-bit variants in future those would be WORD_UPDATE() and
> BYTE_UPDATE(), right? ;)
> 
> It's also confounded by "update" not actually having any obvious meaning at
> this level without all the implicit usage context. FWIW my suggestion would
> be FIELD_PREP_WM_U16, such that the reader instantly sees "FIELD_PREP with
> some additional semantics", even if they then need to glance at the
> kerneldoc for clarification that WM stands for writemask (or maybe WE for
> write-enable if people prefer). Plus it then leaves room to easily support
> different sizes (and potentially even bonkers upside-down Ux_WM variants?!)
> without any bother if we need to.

I like the idea. Maybe even shorter: FIELD_PREP_WM16()?
