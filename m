Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF495CA1
	for <llvm@lists.linux.dev>; Sat, 28 Jan 2023 13:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674913598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OnWLal2NxQnGf3pRQ9fvHZZFlIom2ggk+6Bw3pxljoo=;
	b=AfjJiGTev9zcrFoT0KiGnFg5IUzjZEa3/lucunIWT8cO8vrWa5OTu3/Pp/iUcPaQeLXS9l
	FS6fWiSQGdxlskRXLpkuEz4PivjzQeGKjJ2HRYFQmBs+v1+P0wAk+rBucn3SNf7+38Ew4w
	5W0wh7pbNiIGaYnd2zMVrAmTwy+K/3Q=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-668-MHK2Ugm6MfiWUCAyZtXE3A-1; Sat, 28 Jan 2023 08:46:35 -0500
X-MC-Unique: MHK2Ugm6MfiWUCAyZtXE3A-1
Received: by mail-ej1-f71.google.com with SMTP id nd38-20020a17090762a600b00871ff52c6b5so4879187ejc.0
        for <llvm@lists.linux.dev>; Sat, 28 Jan 2023 05:46:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OnWLal2NxQnGf3pRQ9fvHZZFlIom2ggk+6Bw3pxljoo=;
        b=S5VTB2mc9Mo4EdddT1M//2TzwgL2FS+CiFZxtpukc93K+9DEhyUAr2I3KWoj12reIh
         4Lrr6+N/IUlJujWh95l0zENlQnddORiBWaOcWIe9KegAVxTuJjjgcxnXhY3L26qG/85A
         TlqRGDt4ZmVpfX2levUHopthxxi9Ye7VIj8DhqnSA2FWePLJgIx7o2NuP+rg780fCawQ
         eH4zEPttjt85nTog/oItYaMI7sPHhbfWOaI8K7/ZdgVbd5vabfs6llIhiJBrkeHKW/lD
         nryMhYHLpKtZyRHvEltWmWVUvxoKKsTbAesgGXHAVcOfMraYFsUW3kuIr3hMeAaT7fgE
         8A0Q==
X-Gm-Message-State: AO0yUKVmaercqjF/s1hF1q9LqqjryaUXJ2oElOaMR4SfHh3vOKD+nBIb
	AtoeI7fiSKpnFio4NoYZC9JJ8JhnOUvUmZ6kxA/PTrn5BKAScR5CFo3hy1ny/Z9z+LLHKfDpSQh
	CCT9rcjp9MDKRng==
X-Received: by 2002:a17:906:e8c:b0:878:762b:d8fc with SMTP id p12-20020a1709060e8c00b00878762bd8fcmr8958215ejf.28.1674913594573;
        Sat, 28 Jan 2023 05:46:34 -0800 (PST)
X-Google-Smtp-Source: AK7set8JiGNYmwm+QzlGg7STAT5nhbxMmuBeZ39NXLwCHxhMfKk4gWfvoF27XN9vqZb/BXzHB+uQaA==
X-Received: by 2002:a17:906:e8c:b0:878:762b:d8fc with SMTP id p12-20020a1709060e8c00b00878762bd8fcmr8958203ejf.28.1674913594368;
        Sat, 28 Jan 2023 05:46:34 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id t1-20020a170906268100b0087be1055f83sm2077279ejc.206.2023.01.28.05.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jan 2023 05:46:33 -0800 (PST)
Message-ID: <d5d0bdb1-3d49-2179-7aa7-08c8bf849ee7@redhat.com>
Date: Sat, 28 Jan 2023 14:46:32 +0100
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
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: kernel test robot <lkp@intel.com>, Mark Gross <mgross@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Daniel Scally <djrscally@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
 Kate Hsuan <hpa@redhat.com>, Mark Pearson <markpearson@lenovo.com>,
 Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>
References: <20230127203729.10205-2-hdegoede@redhat.com>
 <202301281534.9Z8xRsrX-lkp@intel.com>
 <17f5f57e-0003-2b6b-bfaa-18b03a6d1874@redhat.com>
 <Y9UmYOJI3zvpne09@pendragon.ideasonboard.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y9UmYOJI3zvpne09@pendragon.ideasonboard.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/28/23 14:42, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Sat, Jan 28, 2023 at 10:41:15AM +0100, Hans de Goede wrote:
>> On 1/28/23 08:35, kernel test robot wrote:
>>> Hi Hans,
>>>
>>> I love your patch! Yet something to improve:
>>>
>>> [auto build test ERROR on linus/master]
>>> [also build test ERROR on v6.2-rc5]
>>> [cannot apply to media-tree/master]
>>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>>> And when submitting patch, we suggest to use '--base' as documented in
>>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>>
>>> url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/media-v4l2-core-Make-the-v4l2-core-code-enable-disable-the-privacy-LED-if-present/20230128-131233
>>> patch link:    https://lore.kernel.org/r/20230127203729.10205-2-hdegoede%40redhat.com
>>> patch subject: [PATCH v6 1/5] media: v4l2-core: Make the v4l2-core code enable/disable the privacy LED if present
>>> config: riscv-randconfig-r026-20230123 (https://download.01.org/0day-ci/archive/20230128/202301281534.9Z8xRsrX-lkp@intel.com/config)
>>> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
>>> reproduce (this is a W=1 build):
>>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>>         chmod +x ~/bin/make.cross
>>>         # install riscv cross compiling tool for clang build
>>>         # apt-get install binutils-riscv64-linux-gnu
>>>         # https://github.com/intel-lab-lkp/linux/commit/000ccec1824b3256e3fc1a94079bb953f19faab5
>>>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>>>         git fetch --no-tags linux-review Hans-de-Goede/media-v4l2-core-Make-the-v4l2-core-code-enable-disable-the-privacy-LED-if-present/20230128-131233
>>>         git checkout 000ccec1824b3256e3fc1a94079bb953f19faab5
>>>         # save the config file
>>>         mkdir build_dir && cp config build_dir/.config
>>>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
>>>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/media/v4l2-core/
>>>
>>> If you fix the issue, kindly add following tag where applicable
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>>> drivers/media/v4l2-core/v4l2-subdev.c:1124:20: error: call to undeclared function 'led_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>>>            sd->privacy_led = led_get(sd->dev, "privacy-led");
>>>                              ^
>>>>> drivers/media/v4l2-core/v4l2-subdev.c:1124:18: error: incompatible integer to pointer conversion assigning to 'struct led_classdev *' from 'int' [-Wint-conversion]
>>>            sd->privacy_led = led_get(sd->dev, "privacy-led");
>>>                            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>    2 errors generated.
>>
>> As mentioned in the cover-letter this series depends on this immutable-branch:
>>
>> https://lore.kernel.org/platform-driver-x86/Y9QGcA+9nlmOOy2d@google.com/
>>
>> That branch not being present in the base used by LKP is what is causing this
>> error.
> 
> The --base argument to git-format-patch will record the base commit ID
> in the cover letter, that can possibly help bots getting it right.

Thanks I was not aware of the --base argument, that is useful to know.

Regards,

Hans

