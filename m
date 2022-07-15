Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2EB7A
	for <llvm@lists.linux.dev>; Fri, 15 Jul 2022 09:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657877303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FwagMD2hoc3wzBqKiMKzHc92i8Hj3Ect7oNteaZb3NE=;
	b=Ktg/oXEq6i/sCrQc5orqhQ4CeXvdfnxmCoMP8jNPBxxqefM1age5NAb62iFk8K1ebK4k6u
	g+WsBqNc6xb3ALR2tDKfO4mp4mHDHKMXqMwBqhzQjf6HKDZ/U0lE01JuOl+fnpJsc/6wzP
	dKkNvNWWeKBc1cMRw/DFWJjguLPAETk=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-ayYy22ZYMY2lqkzCxLoc-w-1; Fri, 15 Jul 2022 05:28:22 -0400
X-MC-Unique: ayYy22ZYMY2lqkzCxLoc-w-1
Received: by mail-pj1-f71.google.com with SMTP id fs24-20020a17090af29800b001f12e0e640aso528246pjb.2
        for <llvm@lists.linux.dev>; Fri, 15 Jul 2022 02:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FwagMD2hoc3wzBqKiMKzHc92i8Hj3Ect7oNteaZb3NE=;
        b=0OYkHLv0H4J+91ruT8jxBvR5qwfpgKayMAs2H/A8RaEC2XUi00xXgFUjh0/b90Aek8
         vmgl9Wga+SYNM3gKUxaivQXN+kudmQVQxHQsJ3sliGxrRvMA4bYCzUsQUjrZChjr8gTv
         FJ5cldA0BHMevmTRstLTSVYY3aHy2TrtZquGrBVqY64jQ35jO8GRM4o3cQUVjBOh4is4
         lr9WQe1U+d1GVRUemFCktZ8j25CZjkOrr5SVzEw9Es6pM6idpp0+yxpnRbuD8ymh6PMd
         ad+qymflWbghngZWZJ1kiNOLuX84MyVqBuYp1NO2jRai5ep7y8SvluY8/uouOU9BMNV/
         jQeg==
X-Gm-Message-State: AJIora+Int1MtB+9c8AJg72zurFLjksbZeKWRqLC524Edo2q1Lz5jIyV
	tcaG548SkPvYTDse1cgdv/3QOk0tcG18xjeO4iadqLVSau7XwwXyLPnbEmYIctG8s/ndVQ771LR
	+mDSy8Uqxap4ARyw7kzJhDD5Wo/dbmw==
X-Received: by 2002:a17:90b:4a08:b0:1ef:f36b:18e1 with SMTP id kk8-20020a17090b4a0800b001eff36b18e1mr21188447pjb.246.1657877301335;
        Fri, 15 Jul 2022 02:28:21 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ujwb1OZgqHxeLW4dCH3ktSGI4Vq0FVokpo9/EPvhl0+epkQEjdRR5OiYrKy5Xz6Mmhrf2eEug+fbWFo/mvhvQ=
X-Received: by 2002:a17:90b:4a08:b0:1ef:f36b:18e1 with SMTP id
 kk8-20020a17090b4a0800b001eff36b18e1mr21188426pjb.246.1657877301024; Fri, 15
 Jul 2022 02:28:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220712145850.599666-13-benjamin.tissoires@redhat.com> <202207150008.O4t08On6-lkp@intel.com>
In-Reply-To: <202207150008.O4t08On6-lkp@intel.com>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Fri, 15 Jul 2022 11:28:09 +0200
Message-ID: <CAO-hwJKVJBw9uKGZFKUDvbnYBN7yW60Nw5ts6jf_d87C2-zmHg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v6 12/23] HID: initial BPF implementation
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=btissoir@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 14, 2022 at 6:43 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Benjamin,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on bpf-next/master]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Tissoires/Introduce-eBPF-support-for-HID-devices/20220712-230852
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
> config: arm-vexpress_defconfig (https://download.01.org/0day-ci/archive/20220715/202207150008.O4t08On6-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e61b9c556267086ef9b743a0b57df302eef831b)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://github.com/intel-lab-lkp/linux/commit/57eb5074a35029f30cc13ed3a526b3342b169788
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Benjamin-Tissoires/Introduce-eBPF-support-for-HID-devices/20220712-230852
>         git checkout 57eb5074a35029f30cc13ed3a526b3342b169788
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: undefined symbol: dispatch_hid_bpf_device_event
>    >>> referenced by hid-core.c
>    >>> hid/hid-core.o:(hid_input_report) in archive drivers/built-in.a
> --
> >> ld.lld: error: undefined symbol: hid_bpf_device_init
>    >>> referenced by hid-core.c
>    >>> hid/hid-core.o:(hid_allocate_device) in archive drivers/built-in.a
> --
> >> ld.lld: error: undefined symbol: hid_bpf_destroy_device
>    >>> referenced by hid-core.c
>    >>> hid/hid-core.o:(hid_destroy_device) in archive drivers/built-in.a
>

Good catch!

The issue is in include/linux/hid_bpf.h, the declaration of the
functions are guarded by #ifdef CONFIG_BPF instead of #ifdef
CONFIG_HID_BPF.

I'll amend it in the next version (and same for the other missing
static declarations).

Cheers,
Benjamin

