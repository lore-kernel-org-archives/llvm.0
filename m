Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DFA2C88
	for <llvm@lists.linux.dev>; Tue, 16 Nov 2021 12:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637066454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RBJ7RWyv48x4mnCXA2rB7PkoXVIkHv6ITPGrMo6Rs0o=;
	b=PMUATPne0WwqPl3kRBo/2GIQjmC3njJi9r9P7SRFuqol460rDHyCD/3M952P6R6IukveID
	pi0gV4LIeRGYruR/xmuiTnC3zINFPAmw3hoWQ7kKSBXwLEw0XRD5KzzwC9LubpjghumqGo
	Tid399ugCwBH30NB7wfAOo7lWg8D0UM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-5bFBBgEUOUqoDuq2zelH9g-1; Tue, 16 Nov 2021 07:40:52 -0500
X-MC-Unique: 5bFBBgEUOUqoDuq2zelH9g-1
Received: by mail-ed1-f70.google.com with SMTP id i19-20020a05640242d300b003e7d13ebeedso4560107edc.7
        for <llvm@lists.linux.dev>; Tue, 16 Nov 2021 04:40:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RBJ7RWyv48x4mnCXA2rB7PkoXVIkHv6ITPGrMo6Rs0o=;
        b=wHrr2p0+lgS/E17kj247HgYqEGPRJCKnICUvu0ITxMVaeo5Zmd39s14Sq+LkXO0s8I
         zIzazRkJWxG+cfIRkK42zuldDeN0mORSlLLabtW4Ze5bmVocfld6tM3nNdDf/AaBbosz
         yzunS02Z/qEoicrS91Azm2R0E+xWkPIagGAqxrRwoVzb3i42lXyLZ4b4D9kRSLyyjemw
         NfY6S+T9sj0cMOh2unW0ZVY/nD0pswtG0Q2VmDMh9zzIISG45KlDcHanlp5nhhNY2zM1
         vJiTk6VpHBA6eH3wpFXVRAXU36c4CQMyeRiwwCFnT8reVNyi40cihO/xED4ng66J2YOj
         sR5A==
X-Gm-Message-State: AOAM531vcpYZZMZeIDzHaPakv+9dMLzO2luo4cmIqFOnxdoL8XVrOThH
	KX9xrZ78yQjj7ZKD3aKg67dndYQoHxQqopws6+ye2HL3lMJ3M9RZuQKwWL6nom0Djn/bEW1vlLZ
	MuZAHGEbSs7ZfnA==
X-Received: by 2002:a05:6402:f:: with SMTP id d15mr9246237edu.331.1637066451282;
        Tue, 16 Nov 2021 04:40:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwl66oKIgG9QUCBpjpJg1S1BOk+OPFJog9GvSqjZbbRQu57C7NgQhPvg0QQ8T/V5I8E5gJnFg==
X-Received: by 2002:a05:6402:f:: with SMTP id d15mr9246193edu.331.1637066451017;
        Tue, 16 Nov 2021 04:40:51 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id w1sm9830839edd.49.2021.11.16.04.40.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Nov 2021 04:40:50 -0800 (PST)
Message-ID: <de7f0b11-373b-6d7b-ca34-20d2162a7f70@redhat.com>
Date: Tue, 16 Nov 2021 13:40:50 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [kbuild-all] Re: drivers/platform/x86/thinkpad_acpi.c:4475:35:
 error: unused variable 'fwbug_cards_ids'
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>, Nathan Chancellor <nathan@kernel.org>,
 llvm@lists.linux.dev, kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>
References: <202111141153.mtggZgGq-lkp@intel.com>
 <009706db-230a-1e49-0a42-447a0ff97fbb@redhat.com>
 <YZOlZPna3djQPYsp@rli9-dbox>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YZOlZPna3djQPYsp@rli9-dbox>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/16/21 13:34, Philip Li wrote:
> On Tue, Nov 16, 2021 at 11:26:48AM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 11/14/21 04:10, kernel test robot wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>>> head:   c8c109546a19613d323a319d0c921cb1f317e629
>>> commit: fd96e35ea7b95f1e216277805be89d66e4ae962d platform/x86: thinkpad_acpi: Fix bitwise vs. logical warning
>>> date:   4 weeks ago
>>> config: i386-buildonly-randconfig-r005-20211114 (attached as .config)
>>> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c3dddeeafb529e769cde87bd29ef6271ac6bfa5c)
>>> reproduce (this is a W=1 build):
>>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>>         chmod +x ~/bin/make.cross
>>>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fd96e35ea7b95f1e216277805be89d66e4ae962d
>>>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>>>         git fetch --no-tags linus master
>>>         git checkout fd96e35ea7b95f1e216277805be89d66e4ae962d
>>>         # save the attached .config to linux build tree
>>>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=i386 
>>>
>>> If you fix the issue, kindly add following tag as appropriate
>>> Reported-by: kernel test robot <lkp@intel.com>
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>>> drivers/platform/x86/thinkpad_acpi.c:4475:35: error: unused variable 'fwbug_cards_ids' [-Werror,-Wunused-const-variable]
>>>    static const struct pci_device_id fwbug_cards_ids[] __initconst = {
>>>                                      ^
>>>    1 error generated.
>>
>> So this *again* has absolutely nothing to do with the:
>>
>> "platform/x86: thinkpad_acpi: Fix bitwise vs. logical warning"
>>
>> commit, the problem is that:
>>
>> 1. the .config does not have CONFIG_PCI set; combined with:
>> 2. include/pci.h using a #define instead of a
>>    static inline for pci_dev_present() when this is the case
>> 3. This is a clang WERROR build
>>
>> I'll submit a fix for 2. upstream which should also fix
>> similar errors in a lot of other drivers.
>>
>> Again I must say that as a maintainer I'm unhappy about the amount
>> of noise being generated by clang WERROR builds here though,
>> is it really necessary for the kernel test robot to do builds
>> of this type ?
> Sorry Hans for the noise, we will look into this to consider the
> solution. And want to consult, do you specially have concern about
> -Wunused-const-variable or all W=1 related build issues?

Thank you.

W=1 is know to cause many many warnings, so to me it seems that
combining W=1 with CONFIG_WERROR=1 is a bad idea.

If it would be possible to avoid that combination then that would
be great.

Regards,

Hans






>>> vim +/fwbug_cards_ids +4475 drivers/platform/x86/thinkpad_acpi.c
>>>
>>> f7db839fccf087 Jiaxun Yang 2019-03-07  4474  
>>> f7db839fccf087 Jiaxun Yang 2019-03-07 @4475  static const struct pci_device_id fwbug_cards_ids[] __initconst = {
>>> f7db839fccf087 Jiaxun Yang 2019-03-07  4476  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x24F3) },
>>> f7db839fccf087 Jiaxun Yang 2019-03-07  4477  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x24FD) },
>>> f7db839fccf087 Jiaxun Yang 2019-03-07  4478  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x2526) },
>>> f7db839fccf087 Jiaxun Yang 2019-03-07  4479  	{}
>>> f7db839fccf087 Jiaxun Yang 2019-03-07  4480  };
>>> f7db839fccf087 Jiaxun Yang 2019-03-07  4481  
>>> f7db839fccf087 Jiaxun Yang 2019-03-07  4482  
>>>
>>> :::::: The code at line 4475 was first introduced by commit
>>> :::::: f7db839fccf087664e5587966220821289b6a9cb platform/x86: thinkpad_acpi: Disable Bluetooth for some machines
>>>
>>> :::::: TO: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>> :::::: CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>>
>>> ---
>>> 0-DAY CI Kernel Test Service, Intel Corporation
>>> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
>>>
>> _______________________________________________
>> kbuild-all mailing list -- kbuild-all@lists.01.org
>> To unsubscribe send an email to kbuild-all-leave@lists.01.org
> 

