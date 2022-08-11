Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1702CA7
	for <llvm@lists.linux.dev>; Thu, 11 Aug 2022 08:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660205558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NJNU3MM2RXJ6DrBzu4YH+KkztVQ4GVVSaiORxtGIIGs=;
	b=NQwThE7vyxOH29Mwk50IkIKMymMmoBVcyvaY1KiCuLuUsaU4L39w5COE66D405iMRIrTG/
	er4C1e5qf1ZjmoSuG1206ojOek9NXxv1B7XCz/yZUCi8ypHaJaXPRUAu0iYJ9cuBz73oWG
	7Y2z9bnWPxTArw5MZAsMnrDQ4e+yjtk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-32-eN2eaC7vOBmuV4nHjl_odg-1; Thu, 11 Aug 2022 04:12:37 -0400
X-MC-Unique: eN2eaC7vOBmuV4nHjl_odg-1
Received: by mail-wm1-f70.google.com with SMTP id v24-20020a7bcb58000000b003a37681b861so1400645wmj.9
        for <llvm@lists.linux.dev>; Thu, 11 Aug 2022 01:12:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=NJNU3MM2RXJ6DrBzu4YH+KkztVQ4GVVSaiORxtGIIGs=;
        b=uM3MT+h7mzce25M1Eu32alcCQINtv1YQpvBjZ0Equ2dMwNkBGeuRkY4eJaRPkovrNi
         dmXMPEQ8GPLEiaXSNLEqo5C3KQvxL56nqRt3bwCMbxWzUIuplUy/IZeTP/VNz/4tkjOi
         5RvPjoNFoGAv9nMJJHfs1X6MKK9lpoOiCPoGNvQIuLGKF3DPDQ86AU5wox90CFD418L7
         iO6+BAU1tJSgCToE/E7VduRLt9fditqPshxWg34TNSaO489/6uLkf0m9L7ugTg+T49rB
         BXkVGEsZxQvjd5mEyKufz3sqDQ+6LTYiX/T8E23FM1rCREqcwzE8goTjR4icNJrg4Dw/
         bCAA==
X-Gm-Message-State: ACgBeo1fJArOM9JisXQrInA74/6oEeP4edEe439fk4X88JQMEPQm3mWv
	TDx7o9jAMQJslB7O8QGvcWkHxPOn1FJHUYv5QHRk7NTptYq5dbA0GNk13XosQm8L7JMEKUTCcIn
	8VoUt2tS/FniyAw==
X-Received: by 2002:adf:e588:0:b0:21f:ace:dd82 with SMTP id l8-20020adfe588000000b0021f0acedd82mr18967066wrm.226.1660205556641;
        Thu, 11 Aug 2022 01:12:36 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5LMFV14g3LvzQgZisOYaUxYd0g2tc7/YwMEHND7sNI1Bqq1wbdXk/6Mc7XtKe8cFceYVA6vA==
X-Received: by 2002:adf:e588:0:b0:21f:ace:dd82 with SMTP id l8-20020adfe588000000b0021f0acedd82mr18967059wrm.226.1660205556384;
        Thu, 11 Aug 2022 01:12:36 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-178.retail.telecomitalia.it. [79.46.200.178])
        by smtp.gmail.com with ESMTPSA id u6-20020a05600c19c600b003a545fe9db4sm5279687wmq.23.2022.08.11.01.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 01:12:35 -0700 (PDT)
Date: Thu, 11 Aug 2022 10:12:17 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [linux-next:master 14849/15097]
 drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:201:3: error: expected expression
Message-ID: <20220811081217.ugn7vslc2nlqv6l3@sgarzare-redhat>
References: <202208111501.5PSP1WaM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202208111501.5PSP1WaM-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

Hi Michael,

On Thu, Aug 11, 2022 at 03:46:35PM +0800, kernel test robot wrote:
>tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>head:   40d43a7507e1547dd45cb02af2e40d897c591870
>commit: d79b32c2e4a4e66d5678410cd45815c1c2375196 [14849/15097] vdpa_sim_blk: add support for discard and write-zeroes
>config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20220811/202208111501.5PSP1WaM-lkp@intel.com/config)
>compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
>reproduce (this is a W=1 build):
>        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>        chmod +x ~/bin/make.cross
>        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=d79b32c2e4a4e66d5678410cd45815c1c2375196
>        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>        git fetch --no-tags linux-next master
>        git checkout d79b32c2e4a4e66d5678410cd45815c1c2375196
>        # save the config file
>        mkdir build_dir && cp config build_dir/.config
>        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/vdpa/vdpa_sim/
>
>If you fix the issue, kindly add following tag where applicable
>Reported-by: kernel test robot <lkp@intel.com>
>
>All error/warnings (new ones prefixed by >>):
>
>>> drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:201:3: error: expected expression
>                   struct virtio_blk_discard_write_zeroes range;
>                   ^
>>> drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:204:25: error: use of undeclared identifier 'range'
>                   if (to_pull != sizeof(range)) {
>                                         ^
>   drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:207:21: error: use of undeclared identifier 'range'
>                                   to_pull, sizeof(range));
>                                                   ^
>   drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:212:60: error: use of undeclared identifier 'range'
>                   bytes = vringh_iov_pull_iotlb(&vq->vring, &vq->out_iov, &range,
>                                                                            ^
>   drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:222:38: error: use of undeclared identifier 'range'
>                   sector = vdpasim64_to_cpu(vdpasim, range.sector);
>                                                      ^
>   drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:224:43: error: use of undeclared identifier 'range'
>                   num_sectors = vdpasim32_to_cpu(vdpasim, range.num_sectors);
>                                                           ^
>   drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:225:37: error: use of undeclared identifier 'range'
>                   flags = vdpasim32_to_cpu(vdpasim, range.flags);
>                                                     ^
>>> drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:202:7: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
>                   u32 num_sectors, flags;
>                       ^
>   1 warning and 7 errors generated.

I'll send followup patches to fix this issue and another that I found 
building with C=2 (virtio_blk_discard_write_zeroes fields are __leX not 
__virtioX, so I should use leX_to_cpu).

Is that okay or should I re-send the original series fixed?

Thanks,
Stefano

