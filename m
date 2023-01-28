Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE623C0B
	for <llvm@lists.linux.dev>; Sat, 28 Jan 2023 09:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674898879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k/+dGwbz0zDWDEkIhYFWgOukr6XgocaommysHbGNBvs=;
	b=FNNu0H7nIxeb/ZDoL76lgYmPyrW1R9/98RCkSvTBArNwU8+WwgSbjwH4urVn5ypNYvqhSz
	K6OVxPXzEROQCsGCLFmeyJZ3qcdXidxyG+Ig3l+i1er1poWrCcg3omj19cX4Ez6u3CD1NS
	U++oCrWXm89bY/s3oM9yP/Q0k0Uw/Jo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-584-5YcDXOzAOc-_fL6W6RaUpQ-1; Sat, 28 Jan 2023 04:41:18 -0500
X-MC-Unique: 5YcDXOzAOc-_fL6W6RaUpQ-1
Received: by mail-ej1-f72.google.com with SMTP id hr22-20020a1709073f9600b0086ffb73ac1cso4759937ejc.23
        for <llvm@lists.linux.dev>; Sat, 28 Jan 2023 01:41:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k/+dGwbz0zDWDEkIhYFWgOukr6XgocaommysHbGNBvs=;
        b=3FgCioXm1iPczCfOmGlXtYEHb4X3jkD2fde9nzyfgEtShsPA6S4j0ftuWho1AsW03+
         TgTM3gPbQ0QPIBdQVlcG7p0rcFGzS7vbIU53otw5neEgNNUvB1BudIq/XivbCAUsNpUR
         HA+URqU7fmiv+Sx3M5OLRJkBxuVudJVUWGbv4tAuSy0sxh5QIk2c8ADG00oJtGLp4ss8
         IS6DdQ7h1Zrl/iXnzQHpZEPczIJ2nfsffSF2AqVls5a88XjsNOKK11+90WxVEnzlyVTt
         BeKYrb69kiRapcrCn0s1wlNjk0sI8pU/ZY9FPEVk7BzH4CeH/mjMhlHI/etNonNjDk0F
         gz8g==
X-Gm-Message-State: AFqh2kodjI6EVkqymHH25wMZZg/+SqPiZA/nHN/j/zOfGqZ6TH3+/EDU
	3WlrAdebsNaP6dWa/BknvAyMK5gjsuyU1YXyYL6SC5nfLYbJ6jEn5zCHJg5ODzkeS3cPF6SGAj4
	DfoOxN4ALznATWA==
X-Received: by 2002:a05:6402:189:b0:499:376e:6b27 with SMTP id r9-20020a056402018900b00499376e6b27mr44119986edv.5.1674898877066;
        Sat, 28 Jan 2023 01:41:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvkr8z/9KKq2AYlcjqdBULj9zqbIQz12ZEaKsbRqhQk9ARLEd7wxrB+TnsmtMDNVq2t+/Hisg==
X-Received: by 2002:a05:6402:189:b0:499:376e:6b27 with SMTP id r9-20020a056402018900b00499376e6b27mr44119972edv.5.1674898876844;
        Sat, 28 Jan 2023 01:41:16 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l11-20020aa7d94b000000b004954c90c94bsm3709340eds.6.2023.01.28.01.41.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jan 2023 01:41:16 -0800 (PST)
Message-ID: <17f5f57e-0003-2b6b-bfaa-18b03a6d1874@redhat.com>
Date: Sat, 28 Jan 2023 10:41:15 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v6 1/5] media: v4l2-core: Make the v4l2-core code
 enable/disable the privacy LED if present
To: kernel test robot <lkp@intel.com>, Mark Gross <mgross@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Scally <djrscally@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
 Mark Pearson <markpearson@lenovo.com>, Andy Yeh <andy.yeh@intel.com>,
 Hao Yao <hao.yao@intel.com>
References: <20230127203729.10205-2-hdegoede@redhat.com>
 <202301281534.9Z8xRsrX-lkp@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <202301281534.9Z8xRsrX-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/28/23 08:35, kernel test robot wrote:
> Hi Hans,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on v6.2-rc5]
> [cannot apply to media-tree/master]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/media-v4l2-core-Make-the-v4l2-core-code-enable-disable-the-privacy-LED-if-present/20230128-131233
> patch link:    https://lore.kernel.org/r/20230127203729.10205-2-hdegoede%40redhat.com
> patch subject: [PATCH v6 1/5] media: v4l2-core: Make the v4l2-core code enable/disable the privacy LED if present
> config: riscv-randconfig-r026-20230123 (https://download.01.org/0day-ci/archive/20230128/202301281534.9Z8xRsrX-lkp@intel.com/config)
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install riscv cross compiling tool for clang build
>         # apt-get install binutils-riscv64-linux-gnu
>         # https://github.com/intel-lab-lkp/linux/commit/000ccec1824b3256e3fc1a94079bb953f19faab5
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Hans-de-Goede/media-v4l2-core-Make-the-v4l2-core-code-enable-disable-the-privacy-LED-if-present/20230128-131233
>         git checkout 000ccec1824b3256e3fc1a94079bb953f19faab5
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/media/v4l2-core/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>>> drivers/media/v4l2-core/v4l2-subdev.c:1124:20: error: call to undeclared function 'led_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>            sd->privacy_led = led_get(sd->dev, "privacy-led");
>                              ^
>>> drivers/media/v4l2-core/v4l2-subdev.c:1124:18: error: incompatible integer to pointer conversion assigning to 'struct led_classdev *' from 'int' [-Wint-conversion]
>            sd->privacy_led = led_get(sd->dev, "privacy-led");
>                            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    2 errors generated.

As mentioned in the cover-letter this series depends on this immutable-branch:

https://lore.kernel.org/platform-driver-x86/Y9QGcA+9nlmOOy2d@google.com/

That branch not being present in the base used by LKP is what is causing this
error.

Regards,

Hans

