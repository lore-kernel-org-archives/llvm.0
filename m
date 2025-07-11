Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE2F279DB5
	for <llvm@lists.linux.dev>; Fri, 11 Jul 2025 14:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752242953; cv=none; b=PTTfXCkQswWdnJNX2g0alxqSxsLOyeV/th18vn1rfwWzhytwfi0kQ5SEY8o2CmUyKlT+KAtYrLqcpOc1zLlfOVFo6gVaMVijIyrz+uE7T99C05XLBmNvP7PPNaVU9jrahkLPVzk/S9172QAdgCgGYlnuQjNOzkv6HdtKsmC0z2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752242953; c=relaxed/simple;
	bh=yZKvYHncBfQJe0YWJMImi87EGAalGmTkBDddUMRaINc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fvbqfmA9WvUpTlOvYYyUh62rPK0YEMn32QkM7AgeQPOvgmunOnflc0MiDRO+0hw+H4C1JI6oQOiC9MT/KVfY2SFxV38LUPiOhF9Wq5GamBEgKiZAbiNAS6aNsDSt9flRNgY17UvjUb1WANEfloehKUShBsHbcEqQI2O4JYnFn3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=WvjTNo3B; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="WvjTNo3B"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4a5851764e1so41762291cf.2
        for <llvm@lists.linux.dev>; Fri, 11 Jul 2025 07:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1752242949; x=1752847749; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6bI52/xgjAZypaQPclB5mkFlqrEG93vCH4YqlmfbgHw=;
        b=WvjTNo3BKBz9u+yt7DXw9tYpjX/bCb4YtH3fxmFSbSAzhbiY0U8HVdKzTwkZo+t3CG
         HOsSVidzZ/HvARC/3fQLjwsdR0k7ie0HdYD7xFQrb0KGlbGgSYR8Y6jA1kZZxHFqTD/0
         /DWTJ6nkzymuu5pZ7zxhJia4xwbOQLCdzSN3j2df3QdNYvqEPBMZW4Xmmmf16nzGGx7g
         cfQdPs3ZTfUFham8uJRliQh+zz9esujPKLJpi81rolwWvaebmQBX6rgJHhptji4HtTLm
         PLnRhmqAE6nehr6oC3xdtfEH/C6rmiaVU10VHaEVGy8A3fnkXQTUyRmJzNDKD2VIlV4h
         xctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752242949; x=1752847749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bI52/xgjAZypaQPclB5mkFlqrEG93vCH4YqlmfbgHw=;
        b=P9IGWBkW8Gjku6Zz8rrhr0CHav2n50+HpCHNzJ2dTPT8CvSBI/acpPZ1xVWuwflQxD
         84Nr3Nr1JZtHRIhNazo4pu4L+cMkZgUprr44hAJk5WiZlGdCr5k7D2hX5p/hZqXTWD0G
         PaZTkIoyvZkRRU9NiKNjKlpBvIlusOYgAh9s7jLGhaa7qZfpd6EshOx5+Ds4VZd9EQGl
         HbBtylIjHm7cZnECXuvgZXPetvEhFH4FWvtwZu3hRo7ZgNx63KPE+OuUNgayi5ovX35l
         h9CG3k8rRoVUrqtocZDTwhYggKgHhovhJFpu7HmoxUGUvRMtCn5Gzcdk4oE1i/85F1at
         DAsg==
X-Forwarded-Encrypted: i=1; AJvYcCVkVsaICVElUunLWiSWRYd4W/QyzqXJgoY2/Z/5I5ikoaFuIp1GBbG/N5tvvBOe0Pz/eY2q@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6u90oJAI5Rd8vdDYQhzDN+jhyW6RO8pWPWMtrQWZOcquNMF1A
	qN3n5Dn5aUtCXti/ngD8Nd3jnBQCjNVKkYUxXjIS4Aay3RpdE274+t8cuhAMfyjBvWs=
X-Gm-Gg: ASbGnctV9lxSGsG2/y7+2VpP05tVSzvVkJpNjXWwfgAmCoBQ35SMGpWnpaABmg6Od8b
	9Pd34uKoR+ZlyPcjgMNeSTQ/5umtNOoBOrOo4bej+2JTW5QuMi4BviiS+UajhTWmff28pcxm8l8
	diFLEEQSMm8JLXoYW40DFGDi6qEq8xYSCLxmVDz3qGSM7QxNC3ujlF79fVLMIWGspoxrpgCi9gX
	MayidTBpDBbgeiI9gt7jgvKCqEgtMwl0+1eisADNVRcKUrHPkquKPnDwJ81m4KoYJyiu0LzV9t8
	+f0fckU91DhxhRGss90OJzQEgfd28ZXzdzGay+O6QEdYvZXx0cUGACbVwH/cqeDeZP0eNtQ8dM6
	RaZ7ovnMtjU3zZLvFHp7hnJetdnnV/X9llCpafJDpChivaJSn4u3t/6twtmQpJrR6zWDsw3KG7w
	==
X-Google-Smtp-Source: AGHT+IEixxsJ1OPzAr8wF1jAqr76ZRx+zlHFTsJPyONXB0Hzt8glfUePTCHimwJLnXKMKDXsmrZPVQ==
X-Received: by 2002:ac8:4e04:0:b0:4aa:939b:2e75 with SMTP id d75a77b69052e-4aa939b3654mr25585771cf.5.1752242949082;
        Fri, 11 Jul 2025 07:09:09 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9fc780367sm9922481cf.61.2025.07.11.07.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 07:09:08 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uaER1-00000008ECi-2QSO;
	Fri, 11 Jul 2025 11:09:07 -0300
Date: Fri, 11 Jul 2025 11:09:07 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: kernel test robot <lkp@intel.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: Re: [jgg-iommufd:for-next 25/43] Warning:
 drivers/iommu/iommufd/pages.c:2114 function parameter 'lock_area' not
 described in 'iopt_area_add_access'
Message-ID: <20250711140907.GC1870174@ziepe.ca>
References: <202507111555.VxJIWo2k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202507111555.VxJIWo2k-lkp@intel.com>

On Fri, Jul 11, 2025 at 03:35:12PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jgg/iommufd.git for-next
> head:   7de5cc04caf979c6a1978b283eb8ad8fe5167e24
> commit: 940d0dd200c80a77133156bb3e1aaed47e2a9c23 [25/43] iommufd/access: Bypass access->ops->unmap for internal use
> config: i386-buildonly-randconfig-006-20250711 (https://download.01.org/0day-ci/archive/20250711/202507111555.VxJIWo2k-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250711/202507111555.VxJIWo2k-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507111555.VxJIWo2k-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> Warning: drivers/iommu/iommufd/pages.c:2114 function parameter 'lock_area' not described in 'iopt_area_add_access'
> >> Warning: drivers/iommu/iommufd/pages.c:2173 function parameter 'unlock_area' not described in 'iopt_area_remove_access'

I fixed this with:

--- a/drivers/iommu/iommufd/pages.c
+++ b/drivers/iommu/iommufd/pages.c
@@ -2103,6 +2103,7 @@ iopt_pages_get_exact_access(struct iopt_pages *pages, unsigned long index,
  * @last_index: Inclusive last page index
  * @out_pages: Output list of struct page's representing the PFNs
  * @flags: IOMMUFD_ACCESS_RW_* flags
+ * @lock_area: Fail userspace munmap on this area
  *
  * Record that an in-kernel access will be accessing the pages, ensure they are
  * pinned, and return the PFNs as a simple list of 'struct page *'.
@@ -2165,6 +2166,7 @@ int iopt_area_add_access(struct iopt_area *area, unsigned long start_index,
  * @area: The source of PFNs
  * @start_index: First page index
  * @last_index: Inclusive last page index
+ * @unlock_area: Must match the matching iopt_area_add_access()'s lock_area
  *
  * Undo iopt_area_add_access() and unpin the pages if necessary. The caller
  * must stop using the PFNs before calling this.
 
