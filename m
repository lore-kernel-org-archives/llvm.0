Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4152710F5
	for <llvm@lists.linux.dev>; Wed, 23 Nov 2022 04:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669177890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VQl9ff+pm3Bk3aH204X24mZs6zyamDTWXwNuFP1xLlU=;
	b=BE2Jd2JiTxIAziEI1lwG9jPXE1vPmPB6U4a3H38f+q1WJfNCS81jUx9e7qPJieLoKwIgmD
	nvq5PyRK+44prohOz2a/yJHWP2QcqN8W1LtwrAJahzMjXNPyDcglkc/kEyjqtF895q7KAo
	RnvPwjeRNJynbbOoptR5iaH+94CtrHU=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-139-noLHRxbeNgG5E1PmCVDNTQ-1; Tue, 22 Nov 2022 23:31:27 -0500
X-MC-Unique: noLHRxbeNgG5E1PmCVDNTQ-1
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-13bc77c87f6so8126288fac.19
        for <llvm@lists.linux.dev>; Tue, 22 Nov 2022 20:31:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VQl9ff+pm3Bk3aH204X24mZs6zyamDTWXwNuFP1xLlU=;
        b=Sh5EsRWP0SG+jB9EL1nzC4qeJoKWynupVe9ryHYqFOidw//VfQZ0X0wFpnXZAzapTT
         qWc+KAtHY9w4LPetwO9EObL6y5cXWdbUXEv6bQin5YCCqga/YJfJtHG+jdP1dYw1cO6d
         Ll0Wbit65ABBxzlm4BMPTOMtuoDCmLGTKfbzuv6kgjUkfILb09LF4LIuDFFqtY9gPygg
         vRZYh8024TEGZ2HCBCIXNXAUVNlW6x1+eyhIer52hrNnWWyDSH0BSeYmGft2MuyGP0TW
         S1YYg8d60/Sa9Qsu6ceUDBFjywMeE0dawPvJVLEyvVlWjf21WFiUeMhTExOeZ1P3bCdM
         PE3A==
X-Gm-Message-State: ANoB5pmnENDiBs5fXYKiLHXPlsSzsE12VyIDDQR8Biq1WuDUta/DmiG7
	WR/nmcnLYedZBitkV+cS8lD7Ah0oE3i4vQP+DrBbPenY78UIok1bIov5qzw9L6bCoFqFmBzOSU4
	Mshb4PVFD1NAT9U06cuVO0KHDPdc3Wg==
X-Received: by 2002:a4a:94a9:0:b0:480:8f4a:7062 with SMTP id k38-20020a4a94a9000000b004808f4a7062mr3093721ooi.57.1669177886409;
        Tue, 22 Nov 2022 20:31:26 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5p+2/kgwNtkcV/tZnRU73FzLwSP/0hnFdBUnffLOt1Eb3cLSA1SD07EWvhtzopVZbm5DQMqgdOyOqC6G2YoCA=
X-Received: by 2002:a4a:94a9:0:b0:480:8f4a:7062 with SMTP id
 k38-20020a4a94a9000000b004808f4a7062mr3093711ooi.57.1669177886199; Tue, 22
 Nov 2022 20:31:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0-v5-4001c2997bd0+30c-iommufd_jgg@nvidia.com> <15-v5-4001c2997bd0+30c-iommufd_jgg@nvidia.com>
 <BN9PR11MB5276B0219008568A30F5A4738C099@BN9PR11MB5276.namprd11.prod.outlook.com>
 <Y3ejMSTWvJuELQ7K@nvidia.com> <BN9PR11MB5276939555C1460EFBFD15A68C0C9@BN9PR11MB5276.namprd11.prod.outlook.com>
In-Reply-To: <BN9PR11MB5276939555C1460EFBFD15A68C0C9@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 23 Nov 2022 12:31:15 +0800
Message-ID: <CACGkMEumUoHfWE0NkdmNbnx-nmgXrm3ZL6Jrj6x+M=wSXQK32g@mail.gmail.com>
Subject: Re: [PATCH v5 15/19] iommufd: vfio container FD ioctl compatibility
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, David Woodhouse <dwmw2@infradead.org>, 
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>, Joerg Roedel <joro@8bytes.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Shuah Khan <shuah@kernel.org>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Tom Rix <trix@redhat.com>, 
	Will Deacon <will@kernel.org>, Anthony Krowiak <akrowiak@linux.ibm.com>, 
	Alex Williamson <alex.williamson@redhat.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Chaitanya Kulkarni <chaitanyak@nvidia.com>, 
	Cornelia Huck <cohuck@redhat.com>, Daniel Jordan <daniel.m.jordan@oracle.com>, 
	David Gibson <david@gibson.dropbear.id.au>, Eric Auger <eric.auger@redhat.com>, 
	Eric Farman <farman@linux.ibm.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>, 
	Jason Herne <jjherne@linux.ibm.com>, "Martins, Joao" <joao.m.martins@oracle.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "Yang, Lixiao" <lixiao.yang@intel.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Halil Pasic <pasic@linux.ibm.com>, 
	Niklas Schnelle <schnelle@linux.ibm.com>, 
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>, "Liu, Yi L" <yi.l.liu@intel.com>, 
	Keqian Zhu <zhukeqian1@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 23, 2022 at 9:33 AM Tian, Kevin <kevin.tian@intel.com> wrote:
>
> > From: Jason Gunthorpe <jgg@nvidia.com>
> > Sent: Friday, November 18, 2022 11:22 PM
> >
> > On Fri, Nov 18, 2022 at 02:58:49AM +0000, Tian, Kevin wrote:
> > > > From: Jason Gunthorpe <jgg@nvidia.com>
> > > > Sent: Thursday, November 17, 2022 5:01 AM
> > > > index ca28a135b9675f..2fdff04000b326 100644
> > > > --- a/drivers/iommu/iommufd/Makefile
> > > > +++ b/drivers/iommu/iommufd/Makefile
> > > > @@ -5,6 +5,7 @@ iommufd-y := \
> > > >   io_pagetable.o \
> > > >   ioas.o \
> > > >   main.o \
> > > > - pages.o
> > > > + pages.o \
> > > > + vfio_compat.o
> > > >
> > >
> > > move vfio_compat out of core? it's not required if VFIO
> > > is not configured.
> >
> > We can, but I don't know if we should. Compat ioctls are part of
> > /dev/iommu, and technically have nothing to do with VFIO. A native
> > iommufd application using VDPA could use them, if it wanted, for
> > instance.
> >
>
> I'm not sure whether that requires further VDPA support. Be safe
> I'd like VDPA to explicitly select vfio_compact when that new
> mixed scheme is supported.
>

This sounds strange. If I don't misunderstand the code, it tries to
provide ioctl compatibility with the VFIO container. I don't see how
it can be used for vDPA, the ioctls used by vDPA is not compatible
with VFIO.

Thanks

