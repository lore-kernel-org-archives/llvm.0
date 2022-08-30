Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267AD3D7F
	for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 16:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661877809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sYkEcIEcYJVPnhVJ5B4453HGLPxDPLa2+9KAMnSSp18=;
	b=K/hfQEuDHF+nY1aqJIkSpqI7lAZbkT0E2lv/l43tQP4ZZ2wRaZ3MRLpr3Iv/pP10DOr0Rr
	yabiGR6RUfYdYcaI4XolegSdQ0mYIDpWwYev4Ku8ZEFZzaAfOTfOgbA6KAuxNnw6XD6379
	80j+RCsx6l3p+M+nNo1OsSK5pCfpXRQ=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-581-MHVQN0TNNbibA2h-FSrx3Q-1; Tue, 30 Aug 2022 12:43:26 -0400
X-MC-Unique: MHVQN0TNNbibA2h-FSrx3Q-1
Received: by mail-io1-f69.google.com with SMTP id c2-20020a6bec02000000b00689b26e92f0so6924961ioh.6
        for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 09:43:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc;
        bh=sYkEcIEcYJVPnhVJ5B4453HGLPxDPLa2+9KAMnSSp18=;
        b=3PHG9cerW9vbooT23rxwVSotZjTHUGVlB9JQed+8XsUOdqwrFKzrsDMhH3edYAEMgH
         eJ/vnKYa8nj/aOMTZvM7HIshXzzV7ZshTI5BS9JY27XVRlwHfHpGKJn91+olRt0/bQd1
         9LQkSAelHwD7ioX2G04D/QZzinymtmdiNRQiOtfbwALFgOE2ftI5K7xSbicI/OtZZhqT
         B1MBMUQcZBlyK2kJ2O8Ul1HGS/VcVjRg78WVVhHQXmxhHzmVY+cAkm9yb5f0iD2wqAHT
         XHYx9tBzcjOFz/dl8m4fPqUhcNaAiRR9GX/LUIC2w0pmUt2LR6jtk5OFq4NbUp4aRTMh
         CFEw==
X-Gm-Message-State: ACgBeo2R27iwXde6auxHs4gdZkNAkG+3UwgRM/S/pc4/sqURO0iUeLKK
	OjLSkMsToJkaBmzms8Gjc9jU6Gfd/v3EQ8AI8fm/HJdwiwT7oHr5XvGLhWtDIAWQ3oCQy5C930U
	uZbr9sphil3MJtA==
X-Received: by 2002:a6b:580e:0:b0:689:af21:6f3f with SMTP id m14-20020a6b580e000000b00689af216f3fmr11840463iob.116.1661877805305;
        Tue, 30 Aug 2022 09:43:25 -0700 (PDT)
X-Google-Smtp-Source: AA6agR74qq+ShMV0B7MOD9pLRKsUex3QAMRhvAeMKdRCeHWVY7Q4aWani6aoYi2AyG2iCWoRh0iOVg==
X-Received: by 2002:a6b:580e:0:b0:689:af21:6f3f with SMTP id m14-20020a6b580e000000b00689af216f3fmr11840450iob.116.1661877805128;
        Tue, 30 Aug 2022 09:43:25 -0700 (PDT)
Received: from redhat.com ([38.15.36.239])
        by smtp.gmail.com with ESMTPSA id f30-20020a02a11e000000b0034a0275ae76sm5682440jag.139.2022.08.30.09.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 09:43:24 -0700 (PDT)
Date: Tue, 30 Aug 2022 10:43:23 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>, kvm@vger.kernel.org,
 llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Subject: Re: [PATCH 8/8] vfio: Split VFIO_GROUP_GET_STATUS into a function
Message-ID: <20220830104323.14b6d460.alex.williamson@redhat.com>
In-Reply-To: <Ywlai0AR7RuF9FlI@nvidia.com>
References: <0-v1-11d8272dc65a+4bd-vfio_ioctl_split_jgg@nvidia.com>
	<8-v1-11d8272dc65a+4bd-vfio_ioctl_split_jgg@nvidia.com>
	<Ywlai0AR7RuF9FlI@nvidia.com>
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

On Fri, 26 Aug 2022 20:43:07 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Wed, Aug 17, 2022 at 01:07:25PM -0300, Jason Gunthorpe wrote:
> > This is the last sizable implementation in vfio_group_fops_unl_ioctl(),
> > move it to a function so vfio_group_fops_unl_ioctl() is emptied out.
> > 
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > ---
> >  drivers/vfio/vfio_main.c | 55 ++++++++++++++++++++--------------------
> >  1 file changed, 27 insertions(+), 28 deletions(-)
> > 
> > diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> > index 78957f45c37a34..6f96e6d07a5e98 100644
> > --- a/drivers/vfio/vfio_main.c
> > +++ b/drivers/vfio/vfio_main.c
> > @@ -1227,6 +1227,32 @@ static int vfio_group_ioctl_get_device_fd(struct vfio_group *group,
> >  	vfio_device_put(device);
> >  	return ret;
> >  }
> > +static int vfio_group_ioctl_get_status(struct vfio_group *group,
> > +				       struct vfio_group_status __user *arg)  
> 
> There is a missing blank line after the } here

Fixed locally if there's no other need for a respin.  Thanks,

Alex

