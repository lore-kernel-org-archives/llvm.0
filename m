Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA274A2B
	for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 17:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661968097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MFM8G20h2y86tadKGRfdgvSUOpPfLBfziDAHYvDVzjw=;
	b=UXWfiLxOH7p6CrJyKWs+7eVVVdnhASCBK7cAkCSKTwBZHBxapWLbSJmZ9pEpjCWcqOlnx0
	IEZsP11z1ArPQKWTckJX9Rayt+ZlWpJxNl1H0GZKL4tr/UyiSl1E0O80VD44nqEgNJvKTF
	3RHOfdxx6k9FbxYCGpgYpf/shKlvyGE=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-446-l6_97q3OOJu_TfcruURe6Q-1; Wed, 31 Aug 2022 13:48:15 -0400
X-MC-Unique: l6_97q3OOJu_TfcruURe6Q-1
Received: by mail-io1-f69.google.com with SMTP id l205-20020a6b3ed6000000b0068b49dd0a61so7209966ioa.14
        for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 10:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc;
        bh=MFM8G20h2y86tadKGRfdgvSUOpPfLBfziDAHYvDVzjw=;
        b=nEvH9+jaeTXs6jqd0mmQDVy7qkKwUszrR7ElbQCBJo79FQ5TU80/LP2kdNQwh7gi63
         VYySMOgRj/eUP4LzUlCknaVrYUJGyQnTxB7hfkIuYrp3vg2x2rtMxxDHe/661J5lbPZN
         EIKSzupFmVwpUGzTwmMiRh4h6/S3fXfvQRDAQ7UD53eBBiQLMVIZwOWI661flqbhNFT1
         iNwJCKew6EY1Ld9zuI4RE15GWEo4NZeUo2wqhXrB+geEB6Y/MKhNMBhR3u0j1+P40uNO
         qwIFVj7nb+Q/2mELmBurt+V0NHaR5h/YrOiMvEs8ShudrmzCeMY/kqjT8T2knS+yznhA
         ou+w==
X-Gm-Message-State: ACgBeo0rKlVswePUZ70QhwjTuq5Xg3mRqGgA8ffwR8jEIactcSgE3/+O
	RVvQCbMOplvEaO7p4UFCUX0eGoslu+7x5GdVk2kGKwpPNyoONu6AOnRliWZ+rpaG7Wah+YyBXdq
	87c9tNO4J58LcBA==
X-Received: by 2002:a05:6638:3043:b0:341:d8a4:73e8 with SMTP id u3-20020a056638304300b00341d8a473e8mr15430053jak.239.1661968094896;
        Wed, 31 Aug 2022 10:48:14 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6+CfcvzPBONN2iPT2RRzjHiaxFZVzBVT87w2WH85kZRbul/NpX2oCrEUi/sPZ8Y4GRBDekjw==
X-Received: by 2002:a05:6638:3043:b0:341:d8a4:73e8 with SMTP id u3-20020a056638304300b00341d8a473e8mr15430044jak.239.1661968094717;
        Wed, 31 Aug 2022 10:48:14 -0700 (PDT)
Received: from redhat.com ([38.15.36.239])
        by smtp.gmail.com with ESMTPSA id d7-20020a02a487000000b003428c21ed12sm6911808jam.167.2022.08.31.10.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 10:48:14 -0700 (PDT)
Date: Wed, 31 Aug 2022 11:48:12 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Cornelia Huck <cohuck@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "llvm@lists.linux.dev"
 <llvm@lists.linux.dev>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Subject: Re: [PATCH 7/8] vfio: Follow the naming pattern for
 vfio_group_ioctl_unset_container()
Message-ID: <20220831114812.4a8a0e95.alex.williamson@redhat.com>
In-Reply-To: <Yw5ABqI20sMyNiG9@nvidia.com>
References: <0-v1-11d8272dc65a+4bd-vfio_ioctl_split_jgg@nvidia.com>
	<7-v1-11d8272dc65a+4bd-vfio_ioctl_split_jgg@nvidia.com>
	<BN9PR11MB5276B0A8F6DD36C6482F37038C769@BN9PR11MB5276.namprd11.prod.outlook.com>
	<YwzbB5NZGOqOsOVK@nvidia.com>
	<20220830104231.0bbb7c89.alex.williamson@redhat.com>
	<Yw5ABqI20sMyNiG9@nvidia.com>
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

On Tue, 30 Aug 2022 13:51:18 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Tue, Aug 30, 2022 at 10:42:31AM -0600, Alex Williamson wrote:
> > On Mon, 29 Aug 2022 12:28:07 -0300
> > Jason Gunthorpe <jgg@nvidia.com> wrote:
> >   
> > > On Mon, Aug 29, 2022 at 12:41:30AM +0000, Tian, Kevin wrote:  
> > > > > From: Jason Gunthorpe <jgg@nvidia.com>
> > > > > Sent: Thursday, August 18, 2022 12:07 AM
> > > > > 
> > > > > Make it clear that this is the body of the ioctl - keep the mutex outside
> > > > > the function since this function doesn't have and wouldn't benefit from
> > > > > error unwind.    
> > > > 
> > > > but doing so make unset_container() unpair with set_container() and
> > > > be the only one doing additional things in main ioctl body.
> > > > 
> > > > I'd prefer to moving mutex inside unset_container() for better readability.    
> > > 
> > > Yes, I tried both ways and ended up here since adding the goto unwind
> > > was kind of ungainly for this function. Don't mind either way
> > > 
> > > The functions are not intended as strict pairs, they are ioctl
> > > dispatch functions.  
> > 
> > The lockdep annotation seems sufficient, but what about simply
> > prefixing the unset ioctl function with underscores to reinforce the
> > locking requirement, as done by the called function
> > __vfio_group_unset_container()?  Thanks,  
> 
> Could do, but IMHO, that is not a popular convention in VFIO
> (anymore?).
> 
> I've been adding lockdep annotations, not adding __ to indicate
> the function is called with some kind of lock.
> 
> In my tree __vfio_group_get_from_iommu() is the only one left using
> that style. uset_container was turned into
> vfio_container_detatch_group() in aother series
> 
> Conversly we have __vfio_register_dev() which I guess __ indicates is
> internal or wrappered, not some statement about locking. I think this
> has become the more popular usage of the __ generally in the kernel
> 
> So I will do a v2 with the extra goto unwind then
> 
> Are there any other remarks before I do it?

None from me.  The pile of things relying on this series is growing, so
it looks like time to push v2.  Thanks,

Alex

