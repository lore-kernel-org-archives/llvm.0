Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E478214B95B;
	Mon,  8 Jul 2024 19:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720465692; cv=none; b=tkwUFFgoVxEEEZA05hESXiAjV0hMLn90q68SKUGFKNQurWo8F7rxYjQOxVq5RihYmudSraanzb9dKqBptdqbO3VLcNKswDqCmj0rGb/sVhgrcjoFV2/8rMLZzPbZEobZ87WmgNbGy6S5aW8nIg9mPfoqKr2NTRsLGYDZ9/QxOss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720465692; c=relaxed/simple;
	bh=pYbSygs6DFw3cN9dVfNQF3w63IPyDQV/ph7ZmPU1o+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j0fd4d/aykUOQyErb3lOfjESAY0BS9/XVlt36s7HcbSQvCy9vuLdjecy2aCKmEueg8upJ6TcCEk+5GsADatlsxlLPCCK9oIkXz66yNhG1lrhMg1OrdZmtq9vZEC4NdlRak0jAnJUEwZUsEagTMc8QQXqlWppVvoCSenc7GGy4oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-58b447c513aso5078312a12.2;
        Mon, 08 Jul 2024 12:08:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720465689; x=1721070489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5VCdX60NWwfC1nVwekLYgNiGy5kNm96Cosdiq19/GM=;
        b=ApdeeJPp/UdtudN84ODsxi0OVr9Mmzd5us6Za0T8otBOjIcm3qaeLmaiGAVCCqzNvm
         b2raYVvADG+wzXRh87VvNUTUx0X++vDbCPs3oM+RPHqi/aLqaGvPQR/Ai+HhE7wQtJkG
         ikU2eJKnL+XiltrP00UVCO726MLJ1H2RC0sa18yh3XdIzaQMsIoWFCsa6flFGuGQseyh
         A2MTeRgDWfY8ifcvSfVMfdQO+lzcbWBH4n+cJUxKC0pFFNfQjY0SBrCQn1PFDW/1+bvx
         u+yx1OLBWwQK0ri/2uZoIXRjXbAKYev1KqqGbw9Ut4ZmVP+VbsRj20GWdnJuKoGwnk/3
         2jqA==
X-Forwarded-Encrypted: i=1; AJvYcCVGFXkS9G9MCbkwBy6CW+/wlAXE8TfEE1sOpoRBlyqrQ/7UZ7kBIdqw1tNF4S6c2d31Hz+3IoHmFb5lKkLDT0710sKx/X6WUm7Th7eyFbhzxtqKtol9o1TFwgD2KvP146seUkY=
X-Gm-Message-State: AOJu0YwvyY5eQj8dCsaKEQb9nuGNitb6Mk7nWvknA5PZiixM1DhzGK1G
	Y1WYBVPkDGs+IoEbDrupIq4ZOLxpei2v5fOeVsJr8wWvY/JUOAQJ
X-Google-Smtp-Source: AGHT+IHe2bAuF3QoVgM+CiLRff4u7OuOz5mDHUAISjnBCInvO4afmYAsw4m/dW4O/4hmNTBdmgEXYA==
X-Received: by 2002:a05:6402:84d:b0:57d:12c3:eca6 with SMTP id 4fb4d7f45d1cf-594ba0ced20mr293140a12.18.1720465688385;
        Mon, 08 Jul 2024 12:08:08 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-001.fbsv.net. [2a03:2880:30ff:1::face:b00c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bda30f76sm146037a12.97.2024.07.08.12.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 12:08:08 -0700 (PDT)
Date: Mon, 8 Jul 2024 12:08:05 -0700
From: Breno Leitao <leitao@debian.org>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: kernel test robot <lkp@intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kuba@kernel.org, horms@kernel.org, Roy.Pledge@nxp.com,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] soc: fsl: qbman: FSL_DPAA depends on COMPILE_TEST
Message-ID: <Zow5FUmOADrqUpM9@gmail.com>
References: <20240624162128.1665620-1-leitao@debian.org>
 <202406261920.l5pzM1rj-lkp@intel.com>
 <20240626140623.7ebsspddqwc24ne4@skbuf>
 <Zn2yGBuwiW/BYvQ7@gmail.com>
 <20240708133746.ea62kkeq2inzcos5@skbuf>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240708133746.ea62kkeq2inzcos5@skbuf>

Hello Vladimir,

On Mon, Jul 08, 2024 at 04:37:46PM +0300, Vladimir Oltean wrote:
> On Thu, Jun 27, 2024 at 11:40:24AM -0700, Breno Leitao wrote:

> > > >      454 | static int dpaa_set_coalesce(struct net_device *dev,
> > > >          |            ^
> > > >    1 warning generated.
> > > 
> > > Arrays of NR_CPUS elements are what it probably doesn't like?

> > Can it use the number of online CPUs instead of NR_CPUS?

> I don't see how, given that variable length arrays are something which
> should be avoided in the kernel?

I thought about a patch like the following (compile tested only). What
do you think?

	Author: Breno Leitao <leitao@debian.org>
	Date:   Mon Jul 8 11:57:33 2024 -0700

	    net: dpaa: Allocate only for online CPUs in dpaa_set_coalesce
	    
	    Currently, dpaa_set_coalesce allocates a boolean for every possible CPU
	    (NR_CPUS). This approach is suboptimal and causes failures in COMPILE_TEST.
	    For reference, see:
	    https://lore.kernel.org/all/202406261920.l5pzM1rj-lkp@intel.com/
	    
	    Modify the allocation to consider only online CPUs instead of
	    NR_CPUs. This change reduces the function's memory footprint and resolves
	    the COMPILE_TEST issues.
	    
	    Signed-off-by: Breno Leitao <leitao@debian.org>

	diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c b/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
	index 5bd0b36d1feb..7202a5310045 100644
	--- a/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
	+++ b/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
	@@ -457,7 +457,7 @@ static int dpaa_set_coalesce(struct net_device *dev,
				     struct netlink_ext_ack *extack)
	 {
		const cpumask_t *cpus = qman_affine_cpus();
	-	bool needs_revert[NR_CPUS] = {false};
	+	bool *needs_revert;
		struct qman_portal *portal;
		u32 period, prev_period;
		u8 thresh, prev_thresh;
	@@ -466,6 +466,11 @@ static int dpaa_set_coalesce(struct net_device *dev,
		period = c->rx_coalesce_usecs;
		thresh = c->rx_max_coalesced_frames;
	 
	+	needs_revert = kmalloc_array(num_possible_cpus(), sizeof(bool), GFP_KERNEL);
	+	if (!needs_revert)
	+		return -ENOMEM;
	+	memset(needs_revert, 0, num_online_cpus() * sizeof(bool));
	+
		/* save previous values */
		portal = qman_get_affine_portal(smp_processor_id());
		qman_portal_get_iperiod(portal, &prev_period);
	@@ -498,6 +503,7 @@ static int dpaa_set_coalesce(struct net_device *dev,
			qman_dqrr_set_ithresh(portal, prev_thresh);
		}
	 
	+	kfree(needs_revert);
		return res;
	 }
	 
