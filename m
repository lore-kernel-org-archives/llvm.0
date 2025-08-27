Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8432FF67D
	for <llvm@lists.linux.dev>; Wed, 27 Aug 2025 18:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756320969; cv=none; b=rO3NnkTzru8Xvl0gIu/eR12OAPoo0SiUCTf7p5DF1Yqsmu1T3QLeltLb03EKz1ieKfPGcvQUuiacas6kDEh1Wm6uy98ZFhfR5xKnTT5RizqphJKlTpPqdAhyeeKHYHI2taIZTn+Ua+JEIIWKh5bEkqrpsPKCKFTWUeE6gZEY/mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756320969; c=relaxed/simple;
	bh=8ok7WAgHWHzIb67w4OKsGxYVKHOMk/whxVn9yr022jA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GSehkEB/8tU9BBhRniDNmINv0s2wLocJZmlVqrtrw9nH1arHvHaLqmBm2vUIX29J8uNeIm4XZCpfJStPPkHqMMBR1jUuxy5PaIE4I+TDXJf+6Qab3l2a1mf25G5JdiLNt0vV7eFVSe98nct2JILo3TYh6uF5j97jq7UCudrzFTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F6KldMlY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F6KldMlY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756320966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LaJTrQIELffdqMUepm7rFcVjoX613nWdx1blyGA6qhk=;
	b=F6KldMlY8fXKB2cMnIsFUlEvh1SO3JPz5i3jSCkJnAgCqV5gUYcAsZxJpM3/ZBDv+T2zU5
	KyaG6P+22l2qbIINMfMYwj3ZLSCUx35QJ52nCA9lM6yqjQ4zaNm6X/IiI5rA/hdV5/as/9
	MvlJX7pGNkogsZRJv7ELSCALSk5933w=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-281-J2zTK49APXe21y9EWZW2Zw-1; Wed, 27 Aug 2025 14:56:01 -0400
X-MC-Unique: J2zTK49APXe21y9EWZW2Zw-1
X-Mimecast-MFC-AGG-ID: J2zTK49APXe21y9EWZW2Zw_1756320960
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3f08869d948so387915ab.3
        for <llvm@lists.linux.dev>; Wed, 27 Aug 2025 11:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756320960; x=1756925760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LaJTrQIELffdqMUepm7rFcVjoX613nWdx1blyGA6qhk=;
        b=BqQnp52ggIMdZyDCFKaYIy5AOTBKbg+Is1OSo7e4eXaTiWjoi8PQ7mYqhLzxpxGW6P
         AV4u4Z+4rVZyLleRWsfmZtDEupSIuPyjGaP0+0jz/BOvJKErZB7w59Zfj5SliJ8Dj2Wm
         Mtf3k5h4KoO04fnaYvzZBTuubdn1A+beIUyDnSJevDtgfIhT1s9WdvLkc5DI0JoO5jiD
         NK4sFlV0zPHBgATUQhxdGqfmdkr1sRmDcCjRrFIk4vWCY8PGa0V00WjMi3UuK8gkicKf
         /Gtn1sjrHlMQ4/wiUH/fQSHaxWVIKQHORg1g6IJhB1df6HkqD24pFAYA8t40UqF6IMQM
         2ulg==
X-Forwarded-Encrypted: i=1; AJvYcCVWCBO1I2I3dY6cn0xXlwnHyufcPl3r3S+YABUzDusny/2CqmiYrjGyrjukTBSiT3nHTf0a@lists.linux.dev
X-Gm-Message-State: AOJu0YyleeIoat5tuj4nqNfj6eZ7isJESxbPWfuTbsW3nwYqxE4nnFz2
	Tt7yHH+zu9psdNspcOD5smZgEeREGUv8Wfecr/y1X9ktIbhyrZONnzDd7LpNYk8N16dZGbNr9VK
	mdyK3cQtlaGAhXTRnMq7gwpDmy0PbibZ+gnBFlZ1dbHSrcYtJFxy3h8g=
X-Gm-Gg: ASbGncvdpAz017vB+FVOSmJaWWg7MBKD7fqlHoHfBf82fyicKwZCTcy0TWq4z6LQSAc
	PuH6UZ49Qe61q+iJ0Sci93aRuYCM4MCjSP7sjNknVdp9SlYiXhCNGaTst+aXeP+ZUL0+AJWD2Mt
	B8RbgsZOjWABJQNFr7gBTL9aDDhwAtnWHg7MuhfzaVMPdIWTYXdwA227rfB23da8PmZwSha5h4K
	1emwofPs42MtcQMLHfYiZfY/IfCbyn+z68iKajKZ59Rn9LulonIEB8lJGqXzlkKFqY5OuU7xEM6
	gvFTVUM6nqYTf0AlvRS3AGlqk3+bNtcAf4zwdutAo3s=
X-Received: by 2002:a05:6e02:1c0b:b0:3ec:173e:8b6c with SMTP id e9e14a558f8ab-3ec173e8e6emr65344385ab.4.1756320960271;
        Wed, 27 Aug 2025 11:56:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPb2pJYAkguncuQSx6IZaNOZrvdB1Zk3MUKrevEct/LLAhqT63GRfQVhKzRAZJNEzz7BkGLQ==
X-Received: by 2002:a05:6e02:1c0b:b0:3ec:173e:8b6c with SMTP id e9e14a558f8ab-3ec173e8e6emr65344105ab.4.1756320959727;
        Wed, 27 Aug 2025 11:55:59 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3f0a3a1ae9esm10463375ab.3.2025.08.27.11.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 11:55:59 -0700 (PDT)
Date: Wed, 27 Aug 2025 12:55:57 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Gupta, Nipun" <Nipun.Gupta@amd.com>
Cc: "arnd@arndb.de" <arnd@arndb.de>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "Agarwal, Nikhil" <nikhil.agarwal@amd.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "llvm@lists.linux.dev"
 <llvm@lists.linux.dev>, "oe-kbuild-all@lists.linux.dev"
 <oe-kbuild-all@lists.linux.dev>, "robin.murphy@arm.com"
 <robin.murphy@arm.com>, "krzk@kernel.org" <krzk@kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>, "maz@kernel.org"
 <maz@kernel.org>, "linux@weissschuh.net" <linux@weissschuh.net>,
 "chenqiuji666@gmail.com" <chenqiuji666@gmail.com>, "peterz@infradead.org"
 <peterz@infradead.org>, "robh@kernel.org" <robh@kernel.org>, "Gangurde,
 Abhijit" <abhijit.gangurde@amd.com>, "nathan@kernel.org"
 <nathan@kernel.org>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 2/2] vfio/cdx: update driver to build without
 CONFIG_GENERIC_MSI_IRQ
Message-ID: <20250827125557.6340d8d3.alex.williamson@redhat.com>
In-Reply-To: <CH3PR12MB91935A30AE6BFFA18A5D4B32E838A@CH3PR12MB9193.namprd12.prod.outlook.com>
References: <20250826043852.2206008-1-nipun.gupta@amd.com>
	<20250826043852.2206008-2-nipun.gupta@amd.com>
	<20250826102416.68ed8fc6.alex.williamson@redhat.com>
	<CH3PR12MB91935A30AE6BFFA18A5D4B32E838A@CH3PR12MB9193.namprd12.prod.outlook.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: myDEbuEkRsKscRQ8ePmEwLForNFnJ3n3R4s29AI9jJg_1756320960
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 27 Aug 2025 11:04:12 +0000
"Gupta, Nipun" <Nipun.Gupta@amd.com> wrote:

> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> > -----Original Message-----
> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Tuesday, August 26, 2025 9:54 PM
> > To: Gupta, Nipun <Nipun.Gupta@amd.com>
> > Cc: arnd@arndb.de; gregkh@linuxfoundation.org; Agarwal, Nikhil
> > <nikhil.agarwal@amd.com>; kvm@vger.kernel.org; linux-kernel@vger.kernel.org;
> > llvm@lists.linux.dev; oe-kbuild-all@lists.linux.dev; robin.murphy@arm.com;
> > krzk@kernel.org; tglx@linutronix.de; maz@kernel.org; linux@weissschuh.net;
> > chenqiuji666@gmail.com; peterz@infradead.org; robh@kernel.org; Gangurde,
> > Abhijit <abhijit.gangurde@amd.com>; nathan@kernel.org; kernel test robot
> > <lkp@intel.com>
> > Subject: Re: [PATCH v4 2/2] vfio/cdx: update driver to build without
> > CONFIG_GENERIC_MSI_IRQ
> >
> > On Tue, 26 Aug 2025 10:08:52 +0530
> > Nipun Gupta <nipun.gupta@amd.com> wrote:
> >  
> > > Define dummy MSI related APIs in VFIO CDX driver to build the
> > > driver without enabling CONFIG_GENERIC_MSI_IRQ flag.
> > >
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202508070308.opy5dIFX-  
> > lkp@intel.com/  
> > > Reviewed-by: Nikhil Agarwal <nikhil.agarwal@amd.com>
> > > Reviewed-by: Alex Williamson <alex.williamson@redhat.com>
> > > Signed-off-by: Nipun Gupta <nipun.gupta@amd.com>
> > > ---
> > >
> > > Changes v1->v2:
> > > - fix linking intr.c file in Makefile
> > > Changes v2->v3:
> > > - return error from vfio_cdx_set_irqs_ioctl() when CONFIG_GENERIC_MSI_IRQ
> > >   is disabled
> > > Changes v3->v4:
> > > - changed the return value to -EINVAL from -ENODEV  
> >
> > What are your intentions for merging this series, char-misc or vfio?  
> 
> Yes please, this can be taken via vfio.

Series applied to vfio next branch for v6.18.  Thanks,

Alex

