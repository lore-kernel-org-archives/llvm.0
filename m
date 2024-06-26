Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41661E52A;
	Wed, 26 Jun 2024 14:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719410790; cv=none; b=RRKTDHiOnM27I5IMXdqlmo5WmgTkEhzn0/vbI8wdbGXgtuKm4Vznu5NWfW0wKJ0TG8NfWS/kul90KGK1dfbisN7fembZJ3AZoqAZJsTl3Ly3VaUUKOWU72DvtcJ0h0l6k4Ap6H5BdyYrG03jN4e3fczMG2hhBdLkL6shnXXJYtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719410790; c=relaxed/simple;
	bh=z+CexOtuod0lfQKr/Uz0/ewzN/aH3ld1+zvdmCXxnPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CMUD8tkEJDkqQ9h1z0DKwqD+iROxWqosRlZjbmeP537rtF6xUCd+K1Ub6Y1LBXdxXjeRxh/7BZCLj5uQuSCZm5fm7/G1lYy/MftmGKaouIq2Uf3ucfCgHwDCX2JDnSfEJ9++3OmaQdYG6mMHafjhGL+t6YJhteVUAB2dKr1nOr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FbvYMAoP; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FbvYMAoP"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so4408635e9.1;
        Wed, 26 Jun 2024 07:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719410787; x=1720015587; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TCJWO8pYy1pCV+fI3h1hz9BtW0SdkaQWYmwWRyrttJs=;
        b=FbvYMAoPhPlRQah76A+QcrmrVjNb8Oq3yexrOypLT61clPB1VE+aBfiUorgbCBrB/B
         yE5nuf65lFpNr+mllfjsKUkQGS19AnX+ry1MOd55JpiXdAhDD8IYvOZ3OnT/0DUR4gV/
         jbHscXRp/swNyBMNiXzLZ1O4LhwFb3JHQWWDpC0I7HrQCXke+ogTijPeW9mTEKhgLg8H
         QeKGtDvH4jvZ3JMvj+Odwz5WYTS7R4hBUFJGTWMstrIPriMK11gW8uG0IOEpEckBPiPi
         pl0ax+Nd2ru6Ntod3S4jM/FMNvRV653lBLlnW9t8MpEAC1zpoAb9Chehpc6JpChji8iN
         y0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719410787; x=1720015587;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCJWO8pYy1pCV+fI3h1hz9BtW0SdkaQWYmwWRyrttJs=;
        b=rh2jl5HbhSF6ODbvCEsYFyuQuL2t1Dt97jwAbzGQGhlN/d8Kd2+wT01QztBmNOHZ7o
         4RANw/YAs/XJTByyAnOpWIsJ8Bd/XdkkCCinf4Nf+k4ia9GjAAdD+Q9eK9jPeVo+l0E2
         Cggq561sKvWOOkoJ/2N3cq1ctSPV+bjF/xn0Gt8b97+aZ0yGOt5WuQIE9eNQoU7tsKPb
         RM+8TEbJk+Ifp5yyMhxknUgIr5VGm4h5nQc5WgdfMEO4x8MkzRVGXYBhdATpK7vPiw/c
         gggf9zgv+thJvWtQB6V/R7vyI0UlzCOS5DVwBdRSM3UFSqk/VCGeu9W3jQ6Xh927L1lq
         pDNQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1hFcIA1V0x6fOAq9ypXZme1eE+V93BeXUWdpiiLalJIEsGVHnXME945iTUZr8GZKy2MN8JBmWRnLMfOxOJ2ziRbH95SN3Gd3WWg7kKnEYmfb/bGKkGdUcTdp1Lq4VBupk0Us=
X-Gm-Message-State: AOJu0YyQBk8b+u2i9jGlns/O7XzkseG3BggxzXBHZbu0epzxoAiH7YHZ
	Lp9I4erY+p9XY0Ls0i6llB1i3PlIyN+YRmiUjxi+ojVTM7JNsx0b
X-Google-Smtp-Source: AGHT+IF3ry4rO2+gkoziIvVV6PiJ5Arx0ZGpxYJD3SVWw7rDf/IM1AqIgI7RKDFMBugpghsAwV+89Q==
X-Received: by 2002:a05:600c:3583:b0:424:ade3:c6b7 with SMTP id 5b1f17b1804b1-424ade3c894mr19285775e9.2.1719410786647;
        Wed, 26 Jun 2024 07:06:26 -0700 (PDT)
Received: from skbuf ([79.115.210.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c82519bdsm27908795e9.13.2024.06.26.07.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 07:06:26 -0700 (PDT)
Date: Wed, 26 Jun 2024 17:06:23 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: kernel test robot <lkp@intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kuba@kernel.org, horms@kernel.org, Roy.Pledge@nxp.com,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] soc: fsl: qbman: FSL_DPAA depends on COMPILE_TEST
Message-ID: <20240626140623.7ebsspddqwc24ne4@skbuf>
References: <20240624162128.1665620-1-leitao@debian.org>
 <202406261920.l5pzM1rj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202406261920.l5pzM1rj-lkp@intel.com>

On Wed, Jun 26, 2024 at 08:09:53PM +0800, kernel test robot wrote:
> Hi Breno,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on herbert-cryptodev-2.6/master]
> [also build test WARNING on soc/for-next linus/master v6.10-rc5 next-20240625]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Breno-Leitao/crypto-caam-Depend-on-COMPILE_TEST-also/20240625-223834
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
> patch link:    https://lore.kernel.org/r/20240624162128.1665620-1-leitao%40debian.org
> patch subject: [PATCH 1/4] soc: fsl: qbman: FSL_DPAA depends on COMPILE_TEST
> config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240626/202406261920.l5pzM1rj-lkp@intel.com/config)
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240626/202406261920.l5pzM1rj-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406261920.l5pzM1rj-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/net/ethernet/freescale/dpaa/dpaa_eth.c:3280:12: warning: stack frame size (16664) exceeds limit (2048) in 'dpaa_eth_probe' [-Wframe-larger-than]
>     3280 | static int dpaa_eth_probe(struct platform_device *pdev)
>          |            ^
>    1 warning generated.
> --
> >> drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c:454:12: warning: stack frame size (8264) exceeds limit (2048) in 'dpaa_set_coalesce' [-Wframe-larger-than]
>      454 | static int dpaa_set_coalesce(struct net_device *dev,
>          |            ^
>    1 warning generated.

Arrays of NR_CPUS elements are what it probably doesn't like?
In the attached Kconfig, CONFIG_NR_CPUS is 8192, which is clearly
excessive compared to the SoCs that the driver is written for and
expects to run on (1-24 cores).

static int dpaa_set_coalesce(struct net_device *dev,
			     struct ethtool_coalesce *c,
			     struct kernel_ethtool_coalesce *kernel_coal,
			     struct netlink_ext_ack *extack)
{
	const cpumask_t *cpus = qman_affine_cpus();
	bool needs_revert[NR_CPUS] = {false};
	...
}

static void dpaa_fq_setup(struct dpaa_priv *priv,
			  const struct dpaa_fq_cbs *fq_cbs,
			  struct fman_port *tx_port)
{
	int egress_cnt = 0, conf_cnt = 0, num_portals = 0, portal_cnt = 0, cpu;
	const cpumask_t *affine_cpus = qman_affine_cpus();
	u16 channels[NR_CPUS];
	...
}

While 'needs_revert' can probably easily be converted to a bitmask which
consumes 8 times less space, I don't know what to say about the "channels"
array. It could probably be rewritten to use dynamic allocation for the
array. I don't have any better idea...
