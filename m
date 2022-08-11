Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837C32CA7
	for <llvm@lists.linux.dev>; Thu, 11 Aug 2022 08:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660206596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5zwB8RRPPBklna2VPR8/MnOJ97E1gjZsjroyCLMcD44=;
	b=BnSRk2iDJYdf3Fi2aChhIDmGgM9Rs2L5ieZCa9GSjzKxsD52hq7d0XGSX/4ONw76RcBt5z
	ZG7FuqTO544gyIjDEyjetNqI7TK2D35PiCVyhFP7Zrcn+NqMZ4AnLhjZ8GZdotoRsIm/VK
	E/pBMpUBff0DhqL2kjOqJPmFJLIguK8=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-Xu4V4aaRPd-wrvMVTbHUTA-1; Thu, 11 Aug 2022 04:29:55 -0400
X-MC-Unique: Xu4V4aaRPd-wrvMVTbHUTA-1
Received: by mail-lj1-f198.google.com with SMTP id j15-20020a2e850f000000b0025e6da69e18so5182089lji.18
        for <llvm@lists.linux.dev>; Thu, 11 Aug 2022 01:29:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=5zwB8RRPPBklna2VPR8/MnOJ97E1gjZsjroyCLMcD44=;
        b=G9KRMbxaPNPgskhZbfm6aTouYf8vxOa6uDFijy7FAo6+pM5i+6IVrlcRDafIsoRTNH
         UCwThHM5MqRUhpBHSQUkF3pBcmiE5G+uluWibkXF5WW1NWBM5J3/FkGA6Jh0Y3VWYcAM
         7mGRbB4GFD0sQRolpcu7e/i7+4lQpph2bRPU3DFzVUqR1r1jEJ4q5i8A75vWv8FzEOOR
         VcusBpa8NjZR00/bdf4+gTkt43KeIBfzOIDEewlqdFWbyVGcBT1SOczq5sc/gVwZT4Xx
         WWeZjsiDGVkS6N3UVgO0Qy2+2u72C3zItvM4I+2n4wffBXjELZ2yd48tLHdUpA0YutDZ
         Sdxg==
X-Gm-Message-State: ACgBeo3gPzAzoZrSl4pa60xNNa0bWKqVdTy4Fc/YVEywLBCYXjrK9ksx
	tMCijlImMEQNIBFk5HqXM9vPjoTi41trT080Mmvku8Sg9bCM18vXobflhSCTLWZjTO9Sv54Hdna
	uimkG4T/INjcXKh9488GaHOnoPtKJJQ==
X-Received: by 2002:a05:6512:3e1e:b0:48a:f315:443f with SMTP id i30-20020a0565123e1e00b0048af315443fmr11952648lfv.519.1660206593844;
        Thu, 11 Aug 2022 01:29:53 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4K/MIeDVc/7YUsDy0BAh9v/jMmZR6FPK4DL+l1rTkmhLZY4jIha1y8WqlKNUc6N+RTMK2NbDFIGW3lUVRhoYM=
X-Received: by 2002:a05:6512:3e1e:b0:48a:f315:443f with SMTP id
 i30-20020a0565123e1e00b0048af315443fmr11952638lfv.519.1660206593571; Thu, 11
 Aug 2022 01:29:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202208111501.5PSP1WaM-lkp@intel.com> <20220811081217.ugn7vslc2nlqv6l3@sgarzare-redhat>
 <20220811042124-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220811042124-mutt-send-email-mst@kernel.org>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Thu, 11 Aug 2022 10:29:41 +0200
Message-ID: <CAGxU2F4GC_5K_CESZ0YT18nuKKLSyXDv8yOtym0Nt7nZZLskrQ@mail.gmail.com>
Subject: Re: [linux-next:master 14849/15097] drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:201:3:
 error: expected expression
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Linux Memory Management List <linux-mm@kvack.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 11, 2022 at 10:22 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Aug 11, 2022 at 10:12:17AM +0200, Stefano Garzarella wrote:
> > Hi Michael,
> >
> > On Thu, Aug 11, 2022 at 03:46:35PM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > head:   40d43a7507e1547dd45cb02af2e40d897c591870
> > > commit: d79b32c2e4a4e66d5678410cd45815c1c2375196 [14849/15097] vdpa_sim_blk: add support for discard and write-zeroes
> > > config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20220811/202208111501.5PSP1WaM-lkp@intel.com/config)
> > > compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
> > > reproduce (this is a W=1 build):
> > >        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > >        chmod +x ~/bin/make.cross
> > >        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=d79b32c2e4a4e66d5678410cd45815c1c2375196
> > >        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > >        git fetch --no-tags linux-next master
> > >        git checkout d79b32c2e4a4e66d5678410cd45815c1c2375196
> > >        # save the config file
> > >        mkdir build_dir && cp config build_dir/.config
> > >        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/vdpa/vdpa_sim/
> > >
> > > If you fix the issue, kindly add following tag where applicable
> > > Reported-by: kernel test robot <lkp@intel.com>
> > >
> > > All error/warnings (new ones prefixed by >>):
> > >
> > > > > drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:201:3: error: expected expression
> > >                   struct virtio_blk_discard_write_zeroes range;
> > >                   ^
> > > > > drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:204:25: error: use of undeclared identifier 'range'
> > >                   if (to_pull != sizeof(range)) {
> > >                                         ^
> > >   drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:207:21: error: use of undeclared identifier 'range'
> > >                                   to_pull, sizeof(range));
> > >                                                   ^
> > >   drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:212:60: error: use of undeclared identifier 'range'
> > >                   bytes = vringh_iov_pull_iotlb(&vq->vring, &vq->out_iov, &range,
> > >                                                                            ^
> > >   drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:222:38: error: use of undeclared identifier 'range'
> > >                   sector = vdpasim64_to_cpu(vdpasim, range.sector);
> > >                                                      ^
> > >   drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:224:43: error: use of undeclared identifier 'range'
> > >                   num_sectors = vdpasim32_to_cpu(vdpasim, range.num_sectors);
> > >                                                           ^
> > >   drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:225:37: error: use of undeclared identifier 'range'
> > >                   flags = vdpasim32_to_cpu(vdpasim, range.flags);
> > >                                                     ^
> > > > > drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:202:7: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
> > >                   u32 num_sectors, flags;
> > >                       ^
> > >   1 warning and 7 errors generated.
> >
> > I'll send followup patches to fix this issue and another that I found
> > building with C=2 (virtio_blk_discard_write_zeroes fields are __leX not
> > __virtioX, so I should use leX_to_cpu).
> >
> > Is that okay or should I re-send the original series fixed?
> >
> > Thanks,
>
> Resend, I dropped them for now. Unlikely to be included in this window, at this point.
>

Okay, next time I'll build also with clang.

FYI, rebuilding with C=2 I also had this warning:

../drivers/vdpa/vdpa.c:811:19: warning: cast to restricted __le16
../drivers/vdpa/vdpa.c:811:19: warning: cast from restricted __virtio16

I'll send a separate patch for that.

Thanks,
Stefano

