Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FED2399
	for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 16:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661877755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uPZ0ww9vg3e5wba1jpMWDOMwxa9Ldy+iPGjIGTE5slw=;
	b=Xu+LE3gvraNijWToZ6/DSA8CPHgl3qucrxx7Zf6wuy2sj2r7fcWznwtSLJUOLj0oE1cuHx
	5hA32i4pAvht0itRGQ5xc1E12Tr4KVILyrRLL8bGCCsYSjntoBee21vixN6DvPAKGngjm/
	jqb961Bgz5Cg8QezGr7AumV+8lxf3ao=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-383-ia_mKYn2Nnit6BhabnW-Xg-1; Tue, 30 Aug 2022 12:42:33 -0400
X-MC-Unique: ia_mKYn2Nnit6BhabnW-Xg-1
Received: by mail-io1-f70.google.com with SMTP id z30-20020a05660217de00b00688bd42dc1dso6993523iox.15
        for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 09:42:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc;
        bh=uPZ0ww9vg3e5wba1jpMWDOMwxa9Ldy+iPGjIGTE5slw=;
        b=VtXZG88f9KQ0zCgTgbz5nvs5nedbjc3aVchhkBCEgFWIzj7qixcX28yBENod7XeEQN
         9rY3YCMkIdBFgBpFje5BOsYtV4HiDoHvr53j4o+zvpjWQEsicijdb5o1Pt4c8vt8glDu
         0EAHOhvKAW2XFBLe5egh895EKgs6bziyPTuGWR81OfH+OO3Q5vgTT2CyoCezJy9ZYfJc
         BfmZ3F9qoPNFq5i+6J6jLzXir1/XUGFUkZekOAlAD9nh+NkO9HMgkRvWWOUIUJLdkpho
         sjQpBcmlrP852v4UZgJWEsB0tRgcW31p6eJRg0CkfbdQ88048wJmUh5LccNabLKysyRW
         rbsQ==
X-Gm-Message-State: ACgBeo3JP0YmJPSlgmESKGw72CDeYlPhjcQ5gReKVTRk2p7AsPOz/EsE
	x3jD3XOOC1H02fS2DN1krtEPn9YWpNQgsgoXDaqiIOrFYiZyiPVTfmhXGnIsE1oK0ehdjfcgltm
	27Cq2TZkb+xN3gg==
X-Received: by 2002:a05:6602:27c1:b0:688:6a81:8d91 with SMTP id l1-20020a05660227c100b006886a818d91mr11618136ios.189.1661877753306;
        Tue, 30 Aug 2022 09:42:33 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6i3F6bgTizb0kdbW2f//YvjaU2wFi/oE+HdztyPkBjmAd9hjsyqXqwCRNS3hWZFU5Akgcxeg==
X-Received: by 2002:a05:6602:27c1:b0:688:6a81:8d91 with SMTP id l1-20020a05660227c100b006886a818d91mr11618129ios.189.1661877753077;
        Tue, 30 Aug 2022 09:42:33 -0700 (PDT)
Received: from redhat.com ([38.15.36.239])
        by smtp.gmail.com with ESMTPSA id n15-20020a02c78f000000b003434a4acb8fsm5650072jao.117.2022.08.30.09.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 09:42:32 -0700 (PDT)
Date: Tue, 30 Aug 2022 10:42:31 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Cornelia Huck <cohuck@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "llvm@lists.linux.dev"
 <llvm@lists.linux.dev>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Subject: Re: [PATCH 7/8] vfio: Follow the naming pattern for
 vfio_group_ioctl_unset_container()
Message-ID: <20220830104231.0bbb7c89.alex.williamson@redhat.com>
In-Reply-To: <YwzbB5NZGOqOsOVK@nvidia.com>
References: <0-v1-11d8272dc65a+4bd-vfio_ioctl_split_jgg@nvidia.com>
	<7-v1-11d8272dc65a+4bd-vfio_ioctl_split_jgg@nvidia.com>
	<BN9PR11MB5276B0A8F6DD36C6482F37038C769@BN9PR11MB5276.namprd11.prod.outlook.com>
	<YwzbB5NZGOqOsOVK@nvidia.com>
Organization: Red Hat
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 29 Aug 2022 12:28:07 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Mon, Aug 29, 2022 at 12:41:30AM +0000, Tian, Kevin wrote:
> > > From: Jason Gunthorpe <jgg@nvidia.com>
> > > Sent: Thursday, August 18, 2022 12:07 AM
> > > 
> > > Make it clear that this is the body of the ioctl - keep the mutex outside
> > > the function since this function doesn't have and wouldn't benefit from
> > > error unwind.  
> > 
> > but doing so make unset_container() unpair with set_container() and
> > be the only one doing additional things in main ioctl body.
> > 
> > I'd prefer to moving mutex inside unset_container() for better readability.  
> 
> Yes, I tried both ways and ended up here since adding the goto unwind
> was kind of ungainly for this function. Don't mind either way
> 
> The functions are not intended as strict pairs, they are ioctl
> dispatch functions.

The lockdep annotation seems sufficient, but what about simply
prefixing the unset ioctl function with underscores to reinforce the
locking requirement, as done by the called function
__vfio_group_unset_container()?  Thanks,

Alex

