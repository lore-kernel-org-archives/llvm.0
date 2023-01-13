Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1728F76
	for <llvm@lists.linux.dev>; Fri, 13 Jan 2023 15:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673624202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I700DdA5+87CqalrCgVe0wgjpImXv87ud6g5vJ4qa4U=;
	b=XtZkmSOm7mAheFiANi2xeNLMzlTPZyVPXg0pSVZpvmdyFs9hXPnXUN4hG3d80kwBOLMg8e
	88PNlZwqcfKXcoE5Q2Pdl2/duMR4ogu2Vebl8Aqwn53zVsOI+klxpmCxbBUcITbq5pGDNp
	Xhb9YgaFth+yhe0G0tLnHKVg5ZPPdOE=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-613-VoER2PkoPK2LIQAK19dlTQ-1; Fri, 13 Jan 2023 10:36:41 -0500
X-MC-Unique: VoER2PkoPK2LIQAK19dlTQ-1
Received: by mail-vs1-f72.google.com with SMTP id a62-20020a671a41000000b003c08f2a8d7bso5301234vsa.14
        for <llvm@lists.linux.dev>; Fri, 13 Jan 2023 07:36:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I700DdA5+87CqalrCgVe0wgjpImXv87ud6g5vJ4qa4U=;
        b=pVubQF0PjYVvufCPUiD91QjbQP7i0nMaEE9ZqO4+x4z51gRJ0BdNuM3wg6OUaHcfmW
         9oA2NescFtNQ/i6mHUph9h0kZDowjEoHLmSZqA0eFtTQiyc19JjZV+4QHHWn3ObVuPU8
         Z1Ax1nZkGbNxv3YEVJ1Fsa7vCTHLXszgS24JL1MH88wGqn/YbqkfnuRcG4aGQRzpItW1
         DUZKtl2mP0erQiKSMDoY+NgcXlEZqP2fwUMMaLErn6SD54QCsoT1tU4Z3RcJ2TE+O9DY
         JyWl4F62LIB6+FRlz9uikxXs+Q4hA+Wx7cEM+zlP44IDWxswcZfF0QVPJ/wMNH0L2bQz
         h/Rw==
X-Gm-Message-State: AFqh2koofcWn3Cej7nzDaHEk7oitDY/ysqnuH8iW/InNcaegHfgUNjs7
	s7dwLCYwq3tNIV+XTNQK9RS8Nd1r2ATylxY52vZahFXJJ8WJhbNbYUtyF7YmONoP9nmtugZF2Mc
	8gNkqM8mGh5Vx7HLJa5kKDkTNlhDsIQ==
X-Received: by 2002:a05:6122:e20:b0:3dd:f386:1bca with SMTP id bk32-20020a0561220e2000b003ddf3861bcamr108735vkb.33.1673624199263;
        Fri, 13 Jan 2023 07:36:39 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsTcquavVHh2LGJon70r35hTGFJQHVvioXxV5viax0L+CXfJlSCxa4WETUFcgzBaSXMtuGTn7XNGrboTMumTbM=
X-Received: by 2002:a05:6122:e20:b0:3dd:f386:1bca with SMTP id
 bk32-20020a0561220e2000b003ddf3861bcamr108726vkb.33.1673624199039; Fri, 13
 Jan 2023 07:36:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202301062107.EPkAEoe2-lkp@intel.com>
In-Reply-To: <202301062107.EPkAEoe2-lkp@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 13 Jan 2023 16:36:27 +0100
Message-ID: <CABgObfZQC3qaiKqLifcfiPoRPrqti3A16G-hyvmFW2F3TvFNnA@mail.gmail.com>
Subject: Re: [kvm:queue 121/153] arch/arm64/kvm/arm.c:2211: warning: expecting
 prototype for Initialize Hyp(). Prototype was for kvm_arm_init() instead
To: kernel test robot <lkp@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	kvm@vger.kernel.org, Robert Hu <robert.hu@intel.com>, 
	Farrah Chen <farrah.chen@intel.com>, Danmei Wei <danmei.wei@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 6, 2023 at 2:52 PM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
> head:   91dc252b0dbb6879e4067f614df1e397fec532a1
> commit: db139c0c865d775b19709cc4671e2e611815e575 [121/153] KVM: arm64: Do arm/arch initialization without bouncing through kvm_init()
> config: arm64-randconfig-r022-20230106
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 8d9828ef5aa9688500657d36cd2aefbe12bbd162)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # https://git.kernel.org/pub/scm/virt/kvm/kvm.git/commit/?id=db139c0c865d775b19709cc4671e2e611815e575
>         git remote add kvm https://git.kernel.org/pub/scm/virt/kvm/kvm.git
>         git fetch --no-tags kvm queue
>         git checkout db139c0c865d775b19709cc4671e2e611815e575
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kvm/ drivers/gpu/drm/mxsfb/ drivers/gpu/drm/udl/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>    arch/arm64/kvm/arm.c:133: warning: Function parameter or member 'type' not described in 'kvm_arch_init_vm'
>    arch/arm64/kvm/arm.c:1933: warning: expecting prototype for Inits Hyp(). Prototype was for init_hyp_mode() instead
> >> arch/arm64/kvm/arm.c:2211: warning: expecting prototype for Initialize Hyp(). Prototype was for kvm_arm_init() instead

Ok, this is just a "/**" comment where one ought to have just "/*" instead.

Paolo

