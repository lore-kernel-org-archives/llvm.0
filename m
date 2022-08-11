Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D25B2CA7
	for <llvm@lists.linux.dev>; Thu, 11 Aug 2022 08:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660206128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EEtmDPDEfm6ZN6xmlgAYrdfRiGRj8DNGtUE2f/V2pis=;
	b=EukgBTEr2Y1ONkoEnx4noOYqqx5Y4IIGx6oaB5VgbOCTdOHOQo622D+e6F9e0twSMc2Yh1
	FnBhDZ8iGZjKE0F+1rUGIyX4iHEboQcsVHV0n6IGmQm3ff+raAf9WmAoyezuWtHW19jxKq
	+qyRgp3VeawLtvklvhbk4wpAMU45eTg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-lrL8KP00NSSz75x2T6jMyQ-1; Thu, 11 Aug 2022 04:22:06 -0400
X-MC-Unique: lrL8KP00NSSz75x2T6jMyQ-1
Received: by mail-ed1-f72.google.com with SMTP id o2-20020a056402438200b0043d552deb2aso10410745edc.0
        for <llvm@lists.linux.dev>; Thu, 11 Aug 2022 01:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=EEtmDPDEfm6ZN6xmlgAYrdfRiGRj8DNGtUE2f/V2pis=;
        b=fBnjos0rn5NkzQrM0F4TYFFG+he0oSt0uMC6bc+B7gBx+f8KvjpcgX7ZD5rqN5klDt
         lO3I64YooR9TbpRwllOA5PYA4EzvE3yxpFohy0KcKv9BNIk8dMtIewIe3tX3TpOMC7qM
         4/S5MxlTBjxwBWom+I/l/mnVidnlqiAW+SAraWS5AcsAjRoAxpwmCedTm7J/JImlHgV3
         AIKXhTnA4DeFTOC3wpPDyzb/mgCJF9bb+76j8O3xv7VGVEP1BdvigwC1jDZuTIY5gmNr
         ec/nwNN0mCjsNzYZiJxzn7VMPAoDRZmvfwqY7Z3ekB49x7c6/uFo4cmUnnfzRl3dtqtI
         KxgQ==
X-Gm-Message-State: ACgBeo1zTZu807OgF0oWgdgFLnq4+lMO2loBapFmeE5NbPacaMZd8KSg
	Xa5GEQXv+XW8cBfB1I2ibayFK5cGG9NjTZrpq+O8/8s7u1H9uT9Guv2TWOZWqk0de792rtZNYc7
	d10WtrRrCQvFWGw==
X-Received: by 2002:a17:906:8477:b0:730:a658:b286 with SMTP id hx23-20020a170906847700b00730a658b286mr23573593ejc.646.1660206124972;
        Thu, 11 Aug 2022 01:22:04 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6y/Q+GVb2CZ/UTdsNXn1wHQDoBdSdMDWesZKQeNKJjBCRfbKXoa2c/80fT12UpDm6WNKSfPw==
X-Received: by 2002:a17:906:8477:b0:730:a658:b286 with SMTP id hx23-20020a170906847700b00730a658b286mr23573585ejc.646.1660206124748;
        Thu, 11 Aug 2022 01:22:04 -0700 (PDT)
Received: from redhat.com ([2.52.152.113])
        by smtp.gmail.com with ESMTPSA id g18-20020a17090604d200b0072fb3704e49sm3237910eja.46.2022.08.11.01.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 01:22:04 -0700 (PDT)
Date: Thu, 11 Aug 2022 04:22:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 14849/15097]
 drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:201:3: error: expected expression
Message-ID: <20220811042124-mutt-send-email-mst@kernel.org>
References: <202208111501.5PSP1WaM-lkp@intel.com>
 <20220811081217.ugn7vslc2nlqv6l3@sgarzare-redhat>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220811081217.ugn7vslc2nlqv6l3@sgarzare-redhat>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 11, 2022 at 10:12:17AM +0200, Stefano Garzarella wrote:
> Hi Michael,
> 
> On Thu, Aug 11, 2022 at 03:46:35PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   40d43a7507e1547dd45cb02af2e40d897c591870
> > commit: d79b32c2e4a4e66d5678410cd45815c1c2375196 [14849/15097] vdpa_sim_blk: add support for discard and write-zeroes
> > config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20220811/202208111501.5PSP1WaM-lkp@intel.com/config)
> > compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
> > reproduce (this is a W=1 build):
> >        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >        chmod +x ~/bin/make.cross
> >        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=d79b32c2e4a4e66d5678410cd45815c1c2375196
> >        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> >        git fetch --no-tags linux-next master
> >        git checkout d79b32c2e4a4e66d5678410cd45815c1c2375196
> >        # save the config file
> >        mkdir build_dir && cp config build_dir/.config
> >        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/vdpa/vdpa_sim/
> > 
> > If you fix the issue, kindly add following tag where applicable
> > Reported-by: kernel test robot <lkp@intel.com>
> > 
> > All error/warnings (new ones prefixed by >>):
> > 
> > > > drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:201:3: error: expected expression
> >                   struct virtio_blk_discard_write_zeroes range;
> >                   ^
> > > > drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:204:25: error: use of undeclared identifier 'range'
> >                   if (to_pull != sizeof(range)) {
> >                                         ^
> >   drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:207:21: error: use of undeclared identifier 'range'
> >                                   to_pull, sizeof(range));
> >                                                   ^
> >   drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:212:60: error: use of undeclared identifier 'range'
> >                   bytes = vringh_iov_pull_iotlb(&vq->vring, &vq->out_iov, &range,
> >                                                                            ^
> >   drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:222:38: error: use of undeclared identifier 'range'
> >                   sector = vdpasim64_to_cpu(vdpasim, range.sector);
> >                                                      ^
> >   drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:224:43: error: use of undeclared identifier 'range'
> >                   num_sectors = vdpasim32_to_cpu(vdpasim, range.num_sectors);
> >                                                           ^
> >   drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:225:37: error: use of undeclared identifier 'range'
> >                   flags = vdpasim32_to_cpu(vdpasim, range.flags);
> >                                                     ^
> > > > drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:202:7: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
> >                   u32 num_sectors, flags;
> >                       ^
> >   1 warning and 7 errors generated.
> 
> I'll send followup patches to fix this issue and another that I found
> building with C=2 (virtio_blk_discard_write_zeroes fields are __leX not
> __virtioX, so I should use leX_to_cpu).
> 
> Is that okay or should I re-send the original series fixed?
> 
> Thanks,

Resend, I dropped them for now. Unlikely to be included in this window, at this point.

-- 
MST

