Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E703C199E9B;
	Thu, 27 Jun 2024 18:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719513630; cv=none; b=Zu18UCBu9zeEYUftXfeHV6F+Fb7DfSBZCi0SChrJMDctH9OaeDR+VWJrlic6A/OKZaTyaNF0S4fjR9ZIXq1IKF9eg4cnR0tbUSkj+E9xsnnMXOcYxKWG4E/3S+axXLFdkJgpQglKVivIUQorCjTXoMOZFTN79ValZFKnfd667z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719513630; c=relaxed/simple;
	bh=KkLyl1RC/EwhIBQ23wSnNwb/PtCW43HptLeyStQCzBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C37TX/0Z5GOAQKvqqxICo+dEG9VoToRPNN2MEFlnE1dfhbz4ycsYeqH9mhRrxFJ1aohyCDW8OfAIb8wfMZGXNxNVAZB2AyKCloKQvAY2RMxEX8V/fkLEx++JXj6VRpyfTMvRdxWk54rycKPkrgtS14uAInMvUjyFviwp7Wxs/MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5854ac817afso1116391a12.2;
        Thu, 27 Jun 2024 11:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719513627; x=1720118427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRtwt1nHk/eFQfYHJCx8+U3yM4OGoY8sGkg3XpVPOa0=;
        b=qD3UbQwVX+iF9YHsNxkQSQJB2wpVqR1Ira3pXpFnigRN2OB6pmA4BL0JqYS+nZKVLG
         wtmvR/MNJtgpktUcv9C3BgO2ghBBcB6X9SJrghDO/e06uZIh/MtA09eI+OUU109rzeqf
         syNbkoYm2qzpGCZlpaAE1IH4C3XvNR2sxUvvlo8KPF0wgZkmHKJ9cuNyhVpE5aOFOtoS
         8IK5fR+bTRstEQDiCRxB8qHNKrrz/LfVYM7kYycyz5lNK4Iz1V7eJ1EF1+/mpfa0vjBv
         uaZugFzzFmbZGVBrpC2hCtRF+9XMnWinczhDGES39jrnvAoG6aFpt36rZ2ehdJPb81aK
         E79A==
X-Forwarded-Encrypted: i=1; AJvYcCV83pyv0q8BDEkyLwhNq6fz+QwtUEkcOLF9+FtFTQVhccZ7T3rR6mh90LPKIwlN9qYTpmH/dNNOp6HQabf2dsrcXtTA7useoE2J5CP9hQbzeWIErCTErqY8KmO+66lcRxm2rqk=
X-Gm-Message-State: AOJu0Yy6O+1/YuvRQv2L2X57dVpdOoiSeMOXHr+JJ2cUd/C3+Fvhlg7z
	5qpmFBOCAfbi38enDlrmkVNwfo2iZBFfsGnTTIKCuX/Qpdhou+Ti
X-Google-Smtp-Source: AGHT+IGyWL39Gdti/FMrbm7JkEdRxyFNJ+JC9do85JtWo4z+QZkEpUt2llHGxHDQC6aOi9kuwYXphQ==
X-Received: by 2002:a50:c34d:0:b0:57c:7151:2669 with SMTP id 4fb4d7f45d1cf-57d4a276171mr11107130a12.7.1719513626964;
        Thu, 27 Jun 2024 11:40:26 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-115.fbsv.net. [2a03:2880:30ff:73::face:b00c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58612c83578sm28651a12.18.2024.06.27.11.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 11:40:26 -0700 (PDT)
Date: Thu, 27 Jun 2024 11:40:24 -0700
From: Breno Leitao <leitao@debian.org>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: kernel test robot <lkp@intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kuba@kernel.org, horms@kernel.org, Roy.Pledge@nxp.com,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] soc: fsl: qbman: FSL_DPAA depends on COMPILE_TEST
Message-ID: <Zn2yGBuwiW/BYvQ7@gmail.com>
References: <20240624162128.1665620-1-leitao@debian.org>
 <202406261920.l5pzM1rj-lkp@intel.com>
 <20240626140623.7ebsspddqwc24ne4@skbuf>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626140623.7ebsspddqwc24ne4@skbuf>

Hello Vladimir,

On Wed, Jun 26, 2024 at 05:06:23PM +0300, Vladimir Oltean wrote:
> On Wed, Jun 26, 2024 at 08:09:53PM +0800, kernel test robot wrote:

> > All warnings (new ones prefixed by >>):
> > 
> > >> drivers/net/ethernet/freescale/dpaa/dpaa_eth.c:3280:12: warning: stack frame size (16664) exceeds limit (2048) in 'dpaa_eth_probe' [-Wframe-larger-than]
> >     3280 | static int dpaa_eth_probe(struct platform_device *pdev)
> >          |            ^
> >    1 warning generated.
> > --
> > >> drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c:454:12: warning: stack frame size (8264) exceeds limit (2048) in 'dpaa_set_coalesce' [-Wframe-larger-than]
> >      454 | static int dpaa_set_coalesce(struct net_device *dev,
> >          |            ^
> >    1 warning generated.
> 
> Arrays of NR_CPUS elements are what it probably doesn't like?

Can it use the number of online CPUs instead of NR_CPUS?

Other than that, I would say we can drop this patch in the meantime, so,
we can move with the others, while this one is being addressed.
