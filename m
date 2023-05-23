Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436D61F93C;
	Tue, 23 May 2023 18:37:01 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-94f9cd65b1aso108856366b.0;
        Tue, 23 May 2023 11:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684867019; x=1687459019;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ByLgtaiEsa0QeTXW3DyarZcxNKiXD9fuD3SlHYwW9RE=;
        b=U8s9gMhkkj5uSixf0kHzMJ83OPGdJfYE0ce0nBc7rLwEeN9IBFNouqn/yFCPkZXjYs
         f684sBdk4xrneSEPzX4+hYUrZiuVTDZM9NusdLgBT3jayM8BuJ0YCDirpg7m+d2X56YQ
         8i/sLK8FqsQJn9v04N1lLp2JVqxtcE4m8L485Y/AsDpA9K3NPmOEqFO24IRqdtYzvibN
         QlHdI2CMntchi8SvVOhjVZqM4Gk0nzR7aL0J6XYeCan7W/PlH57nbBGbntEF5nv+8/r3
         Cwg5JE01qJMVxx0RD8PUTppWctTWoqtxZvUfCAqaeMUuwoHDB1BGybnEFgTtyWRvrGBV
         ZFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684867019; x=1687459019;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ByLgtaiEsa0QeTXW3DyarZcxNKiXD9fuD3SlHYwW9RE=;
        b=eQTAGSjKTE/gsMaNVz8yIYboYIB4vmvwrCL6ttA8bb+n3FK2FHHMIW6z9ehbPy6Cm7
         z5j0cOgBiwMPXdKMPrqPMwlJtqtc4xvthU7PWOHbv31EIxdjzeFEwXSmkfKf3ZJxAqaW
         qyiJ7+q42HtCrjI51iLRRKRU+xvmOCqcxh/jbkMkN0vtPgZmetpPfHoRCBb/Q5iIiOXR
         gC3jHs4aJT5sdlNRZI7imeWj+Ki1G9tPF0w2+9YJVMJBmEGLvlA/J/++rk8jBeDaz0cV
         czDDerGBkd671HVFnDia4u7zX/AQQPHNboNNzItSY6ykipEzd0BcqB5SXtccI7f1eQhT
         mGiA==
X-Gm-Message-State: AC+VfDzZ0CblFAmp2QYuFDwzA2G6dma1AvyzVIohx3ADpVTUofcZ2fjC
	sv8PZ8ocmZI3TwIeFYUdYHY=
X-Google-Smtp-Source: ACHHUZ70btunfl1oIGBuhq1ZkRmBuiUgVGNHzQzLqzHKw5OVv4hk4ecaKeID1OeN2JXaxdasPfGfsg==
X-Received: by 2002:a17:906:1019:b0:96f:4cd0:56a1 with SMTP id 25-20020a170906101900b0096f4cd056a1mr13227386ejm.5.1684867019119;
        Tue, 23 May 2023 11:36:59 -0700 (PDT)
Received: from [192.168.0.105] (p57935e01.dip0.t-ipconnect.de. [87.147.94.1])
        by smtp.gmail.com with ESMTPSA id p23-20020a1709060e9700b0096b3f72b1a0sm4687469ejf.107.2023.05.23.11.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 11:36:58 -0700 (PDT)
Message-ID: <60c698b9-83e0-2408-de6e-2922e78842a0@gmail.com>
Date: Tue, 23 May 2023 20:36:57 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [linux-stable-rc:queue/5.15 78/106]
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c:29:33: warning: unused variable
 'rtl819xp_ops'
Content-Language: en-US
To: Nick Desaulniers <ndesaulniers@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
References: <202305210810.njuOWlC1-lkp@intel.com>
 <61f75542-0bb2-e601-60b3-cdefa08cba28@gmail.com>
 <CAKwvOdnaL-kNLLjLFG0irYc5ROqShcUWnfSsQESeAvquKsULzQ@mail.gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <CAKwvOdnaL-kNLLjLFG0irYc5ROqShcUWnfSsQESeAvquKsULzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/22/23 18:52, Nick Desaulniers wrote:
> Hi Philipp, below is my interpretation of this report:
> 
> On Sun, May 21, 2023 at 2:10 AM Philipp Hortmann
> <philipp.g.hortmann@gmail.com>  wrote:
>> On 5/21/23 02:59, kernel test robot wrote:
>>> tree:https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git  queue/5.15
> ^ So Greg and Sasha are cherry picking patches to linux-5.15.y branch
> of stable...
> 
>>> head:   632aeb02f8e831197a9a01b1e93cb00b4363be05
>>> commit: f13ecbca1796208fa2f888843223ea289f8e2b39 [78/106] staging: rtl8192e: Replace macro RTL_PCI_DEVICE with PCI_DEVICE
> ^ ...of the 106 patches picked up f13ecbca179620 is introducing a new failure...
> 
>>> config: x86_64-allyesconfig
> ^ ...in allyesconfig builds...
> 
>>> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project  f28c006a5895fc0e329fe15fead81e37457cb1d1)
>>> reproduce (this is a W=1 build):
>>>           wgethttps://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross  -O ~/bin/make.cross
>>>           chmod +x ~/bin/make.cross
>>>           #https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=f13ecbca1796208fa2f888843223ea289f8e2b39
>>>           git remote add linux-stable-rchttps://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
>>>           git fetch --no-tags linux-stable-rc queue/5.15
>>>           git checkout f13ecbca1796208fa2f888843223ea289f8e2b39
>>>           # save the config file
>>>           mkdir build_dir && cp config build_dir/.config
>>>           COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
>>>           COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/platform/x86/ drivers/staging/rtl8192e/rtl8192e/
>>>
>>> If you fix the issue, kindly add following tag where applicable
>>> | Reported-by: kernel test robot<lkp@intel.com>
>>> | Closes:https://lore.kernel.org/oe-kbuild-all/202305210810.njuOWlC1-lkp@intel.com/
>>>
>>> All warnings (new ones prefixed by >>):
>>>
>>>>> drivers/staging/rtl8192e/rtl8192e/rtl_core.c:29:33: warning: unused variable 'rtl819xp_ops' [-Wunused-const-variable]
> ^ ... does Greg or Sasha need to pick up
> commit 5e2b6593f270 ("staging: rtl8192e: Remove empty struct rtl819x_ops")
> for linux-5.15.y in addition to f13ecbca1796208fa2f888843223ea289f8e2b39?
> 
> 5e2b6593f270 lacks a fixes tag, so it's probably not obvious to them
> or their automation.
> 
Hi Nick,

thanks for your response. The fix they applied does also not contain a
fixes tag. If they want to get quit of this message they need to apply
the patch you mentioned.

Thanks

Bye Philipp
