Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0A272
	for <llvm@lists.linux.dev>; Tue, 16 Nov 2021 10:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637058412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zzfJFFs1yOAsVs8rA5VCSt3swVTOoJ3a9p/d2W4NYtA=;
	b=UdvBfpUuRTYY4L09w7/7NLt7x3DPKdz8q2gZn1iGymsHdmsLplWkrmFp5cwrPMC5z4C38K
	xRpp2+QWWS8WLu3G9yQU93TZLKlCARxXxq1n5tdD1Vddh48FwXKNS0r+/7QO+xUB69G8sc
	HEcR925Ei8NXJTf8mhpm/WwWAQLZQa4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-MXhcohq6MP2t99TaV6c4LA-1; Tue, 16 Nov 2021 05:26:51 -0500
X-MC-Unique: MXhcohq6MP2t99TaV6c4LA-1
Received: by mail-ed1-f70.google.com with SMTP id v9-20020a50d849000000b003dcb31eabaaso16830398edj.13
        for <llvm@lists.linux.dev>; Tue, 16 Nov 2021 02:26:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zzfJFFs1yOAsVs8rA5VCSt3swVTOoJ3a9p/d2W4NYtA=;
        b=Pu31sJCmrtTLp37bGXXH+6PTwz4dfVjsGOi264inweB7LlRRkIcurpa4niBeyfrI4i
         KXa+rLwuhrVIuocUoSb74lgyaZRfkW9m/5T2WnRFIR1kGqBIH7gC/j5q3aB3sWXlVbtV
         LeytSGxzYYqt3BuqwB0RiDsQcuE9QGgEMRMG1LyDEQAVeXADWK5ZeVNrIxAqc3NI0J0d
         vU413iaQrfgolP3Y3mWr5izP0eE0fYLplAiCTuuYXQfKm1kkkbhlh6i5AFzrHNA24r/T
         NQ+Q+9+MJaPBS3PNd5qdMmb/pO3qvK4YhlOpfCmaic3ENnv2LtdHlLmkxpFdz5o//xWD
         kJ7A==
X-Gm-Message-State: AOAM532sElXYhrWXk4RskwkAN8icm8CYVDxU7b01MJClLvq5io0UE3si
	GvRvC8fuqzzFucWI6PF9T4WpdriW8H0Xa8AG/bG2aESJmzhd+rnnPvSFO8Rj7nLKKvl6fMw1HwN
	lVIwrh3R47tn/nQ==
X-Received: by 2002:a05:6402:2753:: with SMTP id z19mr8678687edd.143.1637058409880;
        Tue, 16 Nov 2021 02:26:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJze7G27h6q4hHPzijH2DQOjmRBhIvl8m2KOckBL3/bxl/7qDqMgG0oYB+v+0OuZPnwC8PE2gA==
X-Received: by 2002:a05:6402:2753:: with SMTP id z19mr8678666edd.143.1637058409713;
        Tue, 16 Nov 2021 02:26:49 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id hv17sm8177026ejc.66.2021.11.16.02.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Nov 2021 02:26:49 -0800 (PST)
Message-ID: <009706db-230a-1e49-0a42-447a0ff97fbb@redhat.com>
Date: Tue, 16 Nov 2021 11:26:48 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: drivers/platform/x86/thinkpad_acpi.c:4475:35: error: unused
 variable 'fwbug_cards_ids'
To: kernel test robot <lkp@intel.com>, Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>
References: <202111141153.mtggZgGq-lkp@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <202111141153.mtggZgGq-lkp@intel.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/14/21 04:10, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   c8c109546a19613d323a319d0c921cb1f317e629
> commit: fd96e35ea7b95f1e216277805be89d66e4ae962d platform/x86: thinkpad_acpi: Fix bitwise vs. logical warning
> date:   4 weeks ago
> config: i386-buildonly-randconfig-r005-20211114 (attached as .config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c3dddeeafb529e769cde87bd29ef6271ac6bfa5c)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fd96e35ea7b95f1e216277805be89d66e4ae962d
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout fd96e35ea7b95f1e216277805be89d66e4ae962d
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=i386 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>>> drivers/platform/x86/thinkpad_acpi.c:4475:35: error: unused variable 'fwbug_cards_ids' [-Werror,-Wunused-const-variable]
>    static const struct pci_device_id fwbug_cards_ids[] __initconst = {
>                                      ^
>    1 error generated.

So this *again* has absolutely nothing to do with the:

"platform/x86: thinkpad_acpi: Fix bitwise vs. logical warning"

commit, the problem is that:

1. the .config does not have CONFIG_PCI set; combined with:
2. include/pci.h using a #define instead of a
   static inline for pci_dev_present() when this is the case
3. This is a clang WERROR build

I'll submit a fix for 2. upstream which should also fix
similar errors in a lot of other drivers.

Again I must say that as a maintainer I'm unhappy about the amount
of noise being generated by clang WERROR builds here though,
is it really necessary for the kernel test robot to do builds
of this type ?

Regards,

Hans


> 
> 
> vim +/fwbug_cards_ids +4475 drivers/platform/x86/thinkpad_acpi.c
> 
> f7db839fccf087 Jiaxun Yang 2019-03-07  4474  
> f7db839fccf087 Jiaxun Yang 2019-03-07 @4475  static const struct pci_device_id fwbug_cards_ids[] __initconst = {
> f7db839fccf087 Jiaxun Yang 2019-03-07  4476  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x24F3) },
> f7db839fccf087 Jiaxun Yang 2019-03-07  4477  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x24FD) },
> f7db839fccf087 Jiaxun Yang 2019-03-07  4478  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x2526) },
> f7db839fccf087 Jiaxun Yang 2019-03-07  4479  	{}
> f7db839fccf087 Jiaxun Yang 2019-03-07  4480  };
> f7db839fccf087 Jiaxun Yang 2019-03-07  4481  
> f7db839fccf087 Jiaxun Yang 2019-03-07  4482  
> 
> :::::: The code at line 4475 was first introduced by commit
> :::::: f7db839fccf087664e5587966220821289b6a9cb platform/x86: thinkpad_acpi: Disable Bluetooth for some machines
> 
> :::::: TO: Jiaxun Yang <jiaxun.yang@flygoat.com>
> :::::: CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 

