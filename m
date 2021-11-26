Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780822C82
	for <llvm@lists.linux.dev>; Fri, 26 Nov 2021 04:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637901654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KXDnhWi2lUYPDK6SyEW/Lwdc8ugbHrrHb9AhpqrT7Ds=;
	b=GOLk5PmMR/GjZ6h8Drad2RO7xB5p5ZzGE2gnm2u9jS9+qJKBcrbiWFhj+OVJNXxnWUHsTX
	EI6Fd4Er/5+Od2Y81UyMfD2POMDv4gwpt1Q9zS6+DIu+PbseyoZcAMMFbdv1MS1vjiN8W6
	bLtUSiD2EsXGYPqXs+Nu3GaTu40aWIQ=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-105-Z1QM0iBlNN-7LSlQjjtcBw-1; Thu, 25 Nov 2021 23:40:51 -0500
X-MC-Unique: Z1QM0iBlNN-7LSlQjjtcBw-1
Received: by mail-lj1-f199.google.com with SMTP id o15-20020a2e90cf000000b00218dfebebdeso2695369ljg.13
        for <llvm@lists.linux.dev>; Thu, 25 Nov 2021 20:40:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KXDnhWi2lUYPDK6SyEW/Lwdc8ugbHrrHb9AhpqrT7Ds=;
        b=nclnwabIKhVZ1teitcFy9W2QIa1WqEGAlu3VEymq1IGEIVSLiyGOjUHVzZbQKTPFno
         8ra0WDYuLsMs+BiWQkv9WWkJMj7fB1sVyl1nAqEn0sVMIf+Xl6s5+sdalRoNylDNM5H7
         GaJcdN8V41iWES8siPSMHpeJIsw9qMorhf9VcK650NWuOSf2IIYh+FncIT1tqGRzoUxA
         +nEauDVBOQu4C8QDpGL4CAcedpzKTdkGp58ut3GngiLWAK06usXdTdhVaxkse93GBdOp
         QTMm40YXjCb5TZFtnjqiZrdRSdqFyycWldDKtuIJ/CE3itMXwo2GBnGXV5jM/8gdhEEf
         hC9g==
X-Gm-Message-State: AOAM532T71pX3VFmmTLMnVy29G9GEoUDvM6Nr/fhwXeCeAjtxbe55+ga
	fwlbBVWcPtP9UAk2W1e/730wrvhF8fGZRJpA8PF2LL96ejC3W5csS5Cs+HeWTrZkv48y9raN1AL
	+D/6QrHFhKfaLoirOq73JT9hWUH61rQ==
X-Received: by 2002:a2e:2ac1:: with SMTP id q184mr29135778ljq.420.1637901649419;
        Thu, 25 Nov 2021 20:40:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9I5mU3QuZFkDuRPx0Xw0T8Go262yO+nZT2CPCiRrJPdz2yhCYrQfj1jDQiyWXOOYvCeOvH2AKgtNQcLIDrW8=
X-Received: by 2002:a2e:2ac1:: with SMTP id q184mr29135753ljq.420.1637901649134;
 Thu, 25 Nov 2021 20:40:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211125063034.12347-1-jasowang@redhat.com> <202111252001.Z5tli1Np-lkp@intel.com>
In-Reply-To: <202111252001.Z5tli1Np-lkp@intel.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 26 Nov 2021 12:40:38 +0800
Message-ID: <CACGkMEuOGR9K4Nq++EG9RzE3F7G6Rj9P0kkOyrJHm=K-Vap9Ow@mail.gmail.com>
Subject: Re: [PATCH] virtio-mmio: harden interrupt
To: kernel test robot <lkp@intel.com>
Cc: mst <mst@redhat.com>, 
	virtualization <virtualization@lists.linux-foundation.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	kbuild-all@lists.01.org
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 25, 2021 at 8:08 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Jason,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on linus/master]
> [also build test WARNING on v5.16-rc2 next-20211125]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]

Will fix this in V2.

Thanks

>
> url:    https://github.com/0day-ci/linux/commits/Jason-Wang/virtio-mmio-harden-interrupt/20211125-143334
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 5f53fa508db098c9d372423a6dac31c8a5679cdf
> config: mips-buildonly-randconfig-r003-20211125 (https://download.01.org/0day-ci/archive/20211125/202111252001.Z5tli1Np-lkp@intel.com/config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 67a1c45def8a75061203461ab0060c75c864df1c)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install mips cross compiling tool for clang build
>         # apt-get install binutils-mips-linux-gnu
>         # https://github.com/0day-ci/linux/commit/e19a8a1a95bd891090863b2d6828b8dc55d3633f
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Jason-Wang/virtio-mmio-harden-interrupt/20211125-143334
>         git checkout e19a8a1a95bd891090863b2d6828b8dc55d3633f
>         # save the config file to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=mips
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/virtio/virtio_mmio.c:105:6: warning: no previous prototype for function 'vm_disable_cbs' [-Wmissing-prototypes]
>    void vm_disable_cbs(struct virtio_device *vdev)
>         ^
>    drivers/virtio/virtio_mmio.c:105:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    void vm_disable_cbs(struct virtio_device *vdev)
>    ^
>    static
> >> drivers/virtio/virtio_mmio.c:121:6: warning: no previous prototype for function 'vm_enable_cbs' [-Wmissing-prototypes]
>    void vm_enable_cbs(struct virtio_device *vdev)
>         ^
>    drivers/virtio/virtio_mmio.c:121:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    void vm_enable_cbs(struct virtio_device *vdev)
>    ^
>    static
>    2 warnings generated.
>
>
> vim +/vm_disable_cbs +105 drivers/virtio/virtio_mmio.c
>
>    103
>    104  /* disable irq handlers */
>  > 105  void vm_disable_cbs(struct virtio_device *vdev)
>    106  {
>    107          struct virtio_mmio_device *vm_dev = to_virtio_mmio_device(vdev);
>    108          int irq = platform_get_irq(vm_dev->pdev, 0);
>    109
>    110          /*
>    111           * The below synchronize() guarantees that any
>    112           * interrupt for this line arriving after
>    113           * synchronize_irq() has completed is guaranteed to see
>    114           * intx_soft_enabled == false.
>    115           */
>    116          WRITE_ONCE(vm_dev->intr_soft_enabled, false);
>    117          synchronize_irq(irq);
>    118  }
>    119
>    120  /* enable irq handlers */
>  > 121  void vm_enable_cbs(struct virtio_device *vdev)
>    122  {
>    123          struct virtio_mmio_device *vm_dev = to_virtio_mmio_device(vdev);
>    124          int irq = platform_get_irq(vm_dev->pdev, 0);
>    125
>    126          disable_irq(irq);
>    127          /*
>    128           * The above disable_irq() provides TSO ordering and
>    129           * as such promotes the below store to store-release.
>    130           */
>    131          WRITE_ONCE(vm_dev->intr_soft_enabled, true);
>    132          enable_irq(irq);
>    133          return;
>    134  }
>    135
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
>

