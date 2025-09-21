Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A42C229B16
	for <llvm@lists.linux.dev>; Sun, 21 Sep 2025 21:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758490301; cv=none; b=JgS5KRusv6svRTWz2NgATOFk1/6fTods4N/l3UdPlqFpsbPiocNJaF1FoKine4k7bYlvXkxJhDoiXu7ld46mdhNM+3GXFzckVW6W0dF7DnIYh64jQTltZfEnbPl278sKPAaCA/TPj7EgSGzRi3immjdfYs8kkp62tCWphOUgc2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758490301; c=relaxed/simple;
	bh=zqT1TnahnRM17p1/i8bRil1o0nqomS89t3+MM6Zthw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=jSY/dVYsyMgTZDNYtMtKdQV06Kgg/Rrf00IH9xoPC6iusO2N+ufaPL+a8Yt0GPs6GQg8WOLuzP/F38l+IZZPH3JTtm9ffEONKvFUAGx5gUcH5lQARq8RTGT1tNTvz6u4zH6wbMaOF3a26ViAdHfwxLnmFzQIMAghTNtFv7szvzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CYYb9pq/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CYYb9pq/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758490297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vMzJv7FtrWlT5/pOKIu9OWpMHtet5A15OykeYCUitfw=;
	b=CYYb9pq/WNb1n82XiWAHKeu4xuWOOOSRnsJ9FD5p/51Y4hStXwaAlhByv7Nr5QMk/t5LOg
	TzWVuLvbgLzfKPKqXdNFd4TEno3VgmSWbiMfQujnTCZy5y+xH6GQRiCDkaK+g2x8hPiFm0
	wH6HF6ZZhO8fvl/5+YJ602x9+r1e+hc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-zAUPkx6SN1-4p9VDUhleFg-1; Sun, 21 Sep 2025 17:31:30 -0400
X-MC-Unique: zAUPkx6SN1-4p9VDUhleFg-1
X-Mimecast-MFC-AGG-ID: zAUPkx6SN1-4p9VDUhleFg_1758490289
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45b98de0e34so33494185e9.0
        for <llvm@lists.linux.dev>; Sun, 21 Sep 2025 14:31:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758490289; x=1759095089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMzJv7FtrWlT5/pOKIu9OWpMHtet5A15OykeYCUitfw=;
        b=YNkU0vuYJ7YQat0bkk0CZlhfw46+kXdb9TKqV8wzXil3Ubn9ZdQ3xXCoCM5GEiES00
         xp8A8inLO3fCsSJ+jrvS8axWJfrwBGUAjqh3cjzTwL+cohfDOk6FMSVSjgzWT46e7WUL
         l+csxEVhZavedpXMIWXreui5Okk/gKX2HzsxF0TzYovlrs76PIhUcXXNvGF2Kl1dONcp
         wFhgrWlX5/P3CYppanykkCMu2yqhCTJsU7C2cxrMZPYrHceNZbPpDel5NLE49kxIH05J
         8c8aCvN9RYKJKe6TdkcetBMuNvL46GVgacF+ORChxRneh8i5Psx4gHeumLqsOqlWGaTy
         83XQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkuYRCVfDdk+lzzXjKuWHYB/246q3ffxXhDDwjlG4iTZ2UMk0Cv42aXwHdlgwkWcjBzk9X@lists.linux.dev
X-Gm-Message-State: AOJu0Yy16/p+LB0/zIxLH3szEN5LrjSimf1NxbHbPUoEI6ZFpiOQfAlU
	M7jaMP5p1V29fkWAJF8lwdC4P73JhPUo9QF67rmKYjykAZQB2u/3w5xeXiMUPzD7WHepFCK2Ycz
	dooB6LRpVuR7Pnk6OJqEec3sd+cGCXqLZCuTCznh9EboZSUwDRrZphgo=
X-Gm-Gg: ASbGncu0DiHY2pEo7a3B04OMbo8IMITgi/jMqvVO54NGWAHFu4UF8FA4a4xKm7NqwjK
	6YJjmpAYPGT/87K7qlRaX/aTUL9nIaCXuTqGsY5WvPXDHFRhFDVTKwq4n13KTfZ9IUsitdBQ6Ud
	YE8H7HZxuH1j9WFMQ0GZEHw/8C2cBAiRFgUVr4Sk0glZNkDFJ+GdvAA9Fn9LVQ2tb0NUGWynYm6
	ia2dA55bDZO5lUR9ylXtBEGA3alijCU9/5zoCqRJ6uVS/5LEj0S2aSkpSYKK+6Q4OIJSLa/gwpj
	0Yt2xbkdlozlLcJzBmTRImomHQbcXZRe/CQ=
X-Received: by 2002:a05:600c:a43:b0:45d:f7cb:70f4 with SMTP id 5b1f17b1804b1-467e6f37f06mr92245365e9.13.1758490289238;
        Sun, 21 Sep 2025 14:31:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnBRTWDkC6y2pA+1GqSrUmiizkLbPjFI1ya/MytaZ7T1ocVq1gR43EQYG+wvlvwojzYCFD3w==
X-Received: by 2002:a05:600c:a43:b0:45d:f7cb:70f4 with SMTP id 5b1f17b1804b1-467e6f37f06mr92245285e9.13.1758490288758;
        Sun, 21 Sep 2025 14:31:28 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73ea:f900:52ee:df2b:4811:77e0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46138695223sm217767975e9.5.2025.09.21.14.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 14:31:28 -0700 (PDT)
Date: Sun, 21 Sep 2025 17:31:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
	netdev@vger.kernel.org
Subject: Re: [mst-vhost:vhost 41/44] drivers/vdpa/pds/vdpa_dev.c:590:19:
 error: incompatible function pointer types initializing 's64 (*)(struct
 vdpa_device *, u16)' (aka 'long long (*)(struct vdpa_device *, unsigned
 short)') with an expression of type 'u32 (struct vdpa_device *, u16)' (aka
 ...
Message-ID: <20250921173047-mutt-send-email-mst@kernel.org>
References: <202509202256.zVt4MifB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202509202256.zVt4MifB-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WH6m_9jfS0e8PUbxEamNZj8FpMjvd1slw2rncDaAgO0_1758490289
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 20, 2025 at 10:41:40PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git vhost
> head:   877102ca14b3ee9b5343d71f6420f036baf8a9fc
> commit: 2951c77700c3944ecd991ede7ee77e31f47f24ab [41/44] vduse: add vq group support
> config: loongarch-randconfig-001-20250920 (https://download.01.org/0day-ci/archive/20250920/202509202256.zVt4MifB-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7c861bcedf61607b6c087380ac711eb7ff918ca6)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509202256.zVt4MifB-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509202256.zVt4MifB-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/vdpa/pds/vdpa_dev.c:590:19: error: incompatible function pointer types initializing 's64 (*)(struct vdpa_device *, u16)' (aka 'long long (*)(struct vdpa_device *, unsigned short)') with an expression of type 'u32 (struct vdpa_device *, u16)' (aka 'unsigned int (struct vdpa_device *, unsigned short)') [-Wincompatible-function-pointer-types]
>      590 |         .get_vq_group           = pds_vdpa_get_vq_group,
>          |                                   ^~~~~~~~~~~~~~~~~~~~~
>    1 error generated.
> 

Eugenio, just making sure you see this. I can not merge patches that
break build.

> vim +590 drivers/vdpa/pds/vdpa_dev.c
> 
> 151cc834f3ddafe Shannon Nelson 2023-05-19  577  
> 151cc834f3ddafe Shannon Nelson 2023-05-19  578  static const struct vdpa_config_ops pds_vdpa_ops = {
> 151cc834f3ddafe Shannon Nelson 2023-05-19  579  	.set_vq_address		= pds_vdpa_set_vq_address,
> 151cc834f3ddafe Shannon Nelson 2023-05-19  580  	.set_vq_num		= pds_vdpa_set_vq_num,
> 151cc834f3ddafe Shannon Nelson 2023-05-19  581  	.kick_vq		= pds_vdpa_kick_vq,
> 151cc834f3ddafe Shannon Nelson 2023-05-19  582  	.set_vq_cb		= pds_vdpa_set_vq_cb,
> 151cc834f3ddafe Shannon Nelson 2023-05-19  583  	.set_vq_ready		= pds_vdpa_set_vq_ready,
> 151cc834f3ddafe Shannon Nelson 2023-05-19  584  	.get_vq_ready		= pds_vdpa_get_vq_ready,
> 151cc834f3ddafe Shannon Nelson 2023-05-19  585  	.set_vq_state		= pds_vdpa_set_vq_state,
> 151cc834f3ddafe Shannon Nelson 2023-05-19  586  	.get_vq_state		= pds_vdpa_get_vq_state,
> 151cc834f3ddafe Shannon Nelson 2023-05-19  587  	.get_vq_notification	= pds_vdpa_get_vq_notification,
> 151cc834f3ddafe Shannon Nelson 2023-05-19  588  	.get_vq_irq		= pds_vdpa_get_vq_irq,
> 151cc834f3ddafe Shannon Nelson 2023-05-19  589  	.get_vq_align		= pds_vdpa_get_vq_align,
> 151cc834f3ddafe Shannon Nelson 2023-05-19 @590  	.get_vq_group		= pds_vdpa_get_vq_group,
> 151cc834f3ddafe Shannon Nelson 2023-05-19  591  
> 151cc834f3ddafe Shannon Nelson 2023-05-19  592  	.get_device_features	= pds_vdpa_get_device_features,
> 151cc834f3ddafe Shannon Nelson 2023-05-19  593  	.set_driver_features	= pds_vdpa_set_driver_features,
> 151cc834f3ddafe Shannon Nelson 2023-05-19  594  	.get_driver_features	= pds_vdpa_get_driver_features,
> 151cc834f3ddafe Shannon Nelson 2023-05-19  595  	.set_config_cb		= pds_vdpa_set_config_cb,
> 151cc834f3ddafe Shannon Nelson 2023-05-19  596  	.get_vq_num_max		= pds_vdpa_get_vq_num_max,
> 151cc834f3ddafe Shannon Nelson 2023-05-19  597  	.get_device_id		= pds_vdpa_get_device_id,
> 151cc834f3ddafe Shannon Nelson 2023-05-19  598  	.get_vendor_id		= pds_vdpa_get_vendor_id,
> 151cc834f3ddafe Shannon Nelson 2023-05-19  599  	.get_status		= pds_vdpa_get_status,
> 151cc834f3ddafe Shannon Nelson 2023-05-19  600  	.set_status		= pds_vdpa_set_status,
> 151cc834f3ddafe Shannon Nelson 2023-05-19  601  	.reset			= pds_vdpa_reset,
> 151cc834f3ddafe Shannon Nelson 2023-05-19  602  	.get_config_size	= pds_vdpa_get_config_size,
> 151cc834f3ddafe Shannon Nelson 2023-05-19  603  	.get_config		= pds_vdpa_get_config,
> 151cc834f3ddafe Shannon Nelson 2023-05-19  604  	.set_config		= pds_vdpa_set_config,
> 151cc834f3ddafe Shannon Nelson 2023-05-19  605  };
> 25d1270b6e9ea89 Shannon Nelson 2023-05-19  606  static struct virtio_device_id pds_vdpa_id_table[] = {
> 25d1270b6e9ea89 Shannon Nelson 2023-05-19  607  	{VIRTIO_ID_NET, VIRTIO_DEV_ANY_ID},
> 25d1270b6e9ea89 Shannon Nelson 2023-05-19  608  	{0},
> 25d1270b6e9ea89 Shannon Nelson 2023-05-19  609  };
> 25d1270b6e9ea89 Shannon Nelson 2023-05-19  610  
> 
> :::::: The code at line 590 was first introduced by commit
> :::::: 151cc834f3ddafec869269fe48036460d920d08a pds_vdpa: add support for vdpa and vdpamgmt interfaces
> 
> :::::: TO: Shannon Nelson <shannon.nelson@amd.com>
> :::::: CC: Michael S. Tsirkin <mst@redhat.com>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

