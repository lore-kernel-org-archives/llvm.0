Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB09D168
	for <llvm@lists.linux.dev>; Wed, 12 Jan 2022 19:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642017486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/fVIoXcUDxCaqlrP4EIsauwQJleBaGegrSKdeG6vK/Q=;
	b=LjUrRDk+wqw9a6MTWIlH58YZQJOn1ee5JmbJb3d9IOyyJxkn3UgKjbF0pOTJto+CnTiBA8
	kMI89Arh3ey8m446pfGc6IxpdRxujuyoQsH8neQBtIx/gYqaY0s7qvevo+BlNVRwnKSAkc
	57aV830+JRs7DUDbdeQEqC5p1u4CRuk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-YCApbdjhMZi6SrBtTmz8iA-1; Wed, 12 Jan 2022 14:58:02 -0500
X-MC-Unique: YCApbdjhMZi6SrBtTmz8iA-1
Received: by mail-ed1-f69.google.com with SMTP id c8-20020a05640227c800b003fdc1684cdeso3234177ede.12
        for <llvm@lists.linux.dev>; Wed, 12 Jan 2022 11:58:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/fVIoXcUDxCaqlrP4EIsauwQJleBaGegrSKdeG6vK/Q=;
        b=48rDhW55QOXNSqyPrbXv4HhRzsyTXiwSliHutfRSzeiGCc114jN74Hrwb3d5VA23M/
         b5M7J6yBh/ASQ1czMtnRWU9onrUSJ5K3IjTbPHxiA1W0YTdJCEiqMUxhW0/xtLy27hwQ
         VSUbcnF4xfJrlGSd3a/KDbfeISPe98Dp0/bWTQjyzdRK6IvUFIMeOvzTwLzITTatrUfL
         2B2X/qCMUk9R9J5D/GNtULQJtT1TSUoLVP2LJt0gHWtRWLsErHtFq+jbvHUm6ncMXf8+
         GIIRrM2A/OpUaQvjMAg8n49T84FnV4RMehj706t+PPG4TB9xdKnHpqMIkytiMUohSWxF
         dUuA==
X-Gm-Message-State: AOAM5338L9g38UAF8M6bD3bAxLjRZWlO1XcwnBW0Qs2OIN925OMw/weN
	k+AN6Gsv5JyeWn/OGOGRLwXsWsJHaWpcMF9dCidm0+OIJsXi6Or7i7mDNWAz1mLpVflhiKYgRGw
	cvjansYwpKitWgg==
X-Received: by 2002:a17:907:1606:: with SMTP id hb6mr1110221ejc.606.1642017481656;
        Wed, 12 Jan 2022 11:58:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKALj9WN9AdAiGT9SQyIWLDcxFR9WtNB0UWPKvLJSafSeIslvbON4e1IPIueEs9UNuVh+qgw==
X-Received: by 2002:a17:907:1606:: with SMTP id hb6mr1110197ejc.606.1642017481407;
        Wed, 12 Jan 2022 11:58:01 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id kw18sm216481ejc.9.2022.01.12.11.58.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jan 2022 11:58:01 -0800 (PST)
Message-ID: <eb4ef470-cfaf-13be-cb66-ca38c1a85a23@redhat.com>
Date: Wed, 12 Jan 2022 20:58:00 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3] pinctrl: baytrail: Clear direct_irq_en flag on broken
 configs
To: kernel test robot <lkp@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, linux-gpio@vger.kernel.org
References: <20220107234456.148389-1-hdegoede@redhat.com>
 <202201090203.kgCw6bSd-lkp@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <202201090203.kgCw6bSd-lkp@intel.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/8/22 19:54, kernel test robot wrote:
> Hi Hans,
> 
> I love your patch! Perhaps something to improve:
> 
> [auto build test WARNING on linusw-pinctrl/devel]
> [also build test WARNING on v5.16-rc8 next-20220107]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Hans-de-Goede/pinctrl-baytrail-Clear-direct_irq_en-flag-on-broken-configs/20220108-074637
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
> config: i386-randconfig-c001-20220107 (https://download.01.org/0day-ci/archive/20220109/202201090203.kgCw6bSd-lkp@intel.com/config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f3a344d2125fa37e59bae1b0874442c650a19607)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/fc9eb527f62b0bebde64745ec5b0a838fde7ef41
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Hans-de-Goede/pinctrl-baytrail-Clear-direct_irq_en-flag-on-broken-configs/20220108-074637
>         git checkout fc9eb527f62b0bebde64745ec5b0a838fde7ef41
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/pinctrl/intel/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>>> drivers/pinctrl/intel/pinctrl-baytrail.c:1483:58: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
>                    dev_dbg(vg->dev, "Pin %i: uses direct IRQ %ld\n", pin, match - direct_irq);
>                                                              ~~~          ^~~~~~~~~~~~~~~~~~
>                                                              %d
>    include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
>                    dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
>                                                        ~~~     ^~~~~~~~~~~
>    include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
>                    _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
>                                            ~~~    ^~~~~~~~~~~
>    1 warning generated.

Hmm, ok. so x86_64 needs a %ld for the pointer arithmic result on i386 needs a %d
without the 'l' what fun. I'll just store it in a temp int variable in the next
version.

I need to do a new version anyways since I ended up going down a bit of a rabithole
wrt the direct IRQ stuff and I now finally completely understand how this all works
including how the trigger bits in the pinctrl work together with the ones in the
IO-APIC. See the next version of this patch for details.

Regards,

Hans

