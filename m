Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2156FA1;
	Mon,  3 Apr 2023 16:02:33 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso20198144wmb.0;
        Mon, 03 Apr 2023 09:02:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680537752;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/V8WveeNDBzp0IHh+qSCFbEW9k3MTm/mzkbEoM7fhfQ=;
        b=Jtv6ucwvOmGZXzie86bJG6CS053Hulw3IYuW+qbwAyruvTco8Wa7rL2hpX7YhyKU8o
         PhtJFOBHcWkLPsZmDaThgUWtMivKU7TsmZ5dPyqp5InX6XFtJou+83KgPvAqUnwNKnca
         IfgVkZoBK8obBtiTi5D2mf52U1GwuUTADnWUwFb8G64TSGufl+zyHkw0RTsCfauu1Bse
         AY7DSPnjtF9zENqC7VNEGF7jFz5YiDktAniSjt7TMFjrZZzD16WATQJYB+dpBothQW1X
         dqboe0Ry8pTuzj+eP5OaKqz1cOupZLS0tpjL7CMF+7UlcHE/xRDz6JMWWVAWS4bGklOs
         0VSA==
X-Gm-Message-State: AAQBX9cXrbeECZjBkt5HFQvWeLH8ubjubbmPuMnwWH3OJieShgd74Dsa
	OGikz0Q9fiuaHJcLlrXxXEc=
X-Google-Smtp-Source: AKy350bpGt64rQyufEOfS3Vxn5FImqXlXF3n1YNY09Pluio1lQlVpu2fVxIMyeRFrxpZdb94vAGqYQ==
X-Received: by 2002:a05:600c:3b99:b0:3ed:2a41:8529 with SMTP id n25-20020a05600c3b9900b003ed2a418529mr18952wms.2.1680537751715;
        Mon, 03 Apr 2023 09:02:31 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id r8-20020a5d4e48000000b002c70e60abd4sm10166853wrt.2.2023.04.03.09.02.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 09:02:31 -0700 (PDT)
Message-ID: <27cc24d8-c7f4-66b8-954c-d3cb11b5764f@grimberg.me>
Date: Mon, 3 Apr 2023 19:02:30 +0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [stable:linux-5.4.y 5319/9999] ld.lld: error:
 drivers/nvme/host/core.o: contains a compressed section, but zlib is not
 available
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Max Gurtovoy <mgurtovoy@nvidia.com>,
 Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
 Christoph Hellwig <hch@lst.de>, Sasha Levin <sashal@kernel.org>
References: <202304032219.jG1sChqf-lkp@intel.com>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <202304032219.jG1sChqf-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> Hi Sagi,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.4.y
> head:   09b1a76e7879184fb35d71a221cae9451b895fff
> commit: 3e9aa125f69c0006d10f101898932acedc942b59 [5319/9999] nvme-tcp: remove incorrect Kconfig dep in BLK_DEV_NVME

The failure looks unrelated to the commit IMO. Is it maybe some issue
with clang linkage with zlib?

> config: x86_64-randconfig-a001-20230403 (https://download.01.org/0day-ci/archive/20230403/202304032219.jG1sChqf-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=3e9aa125f69c0006d10f101898932acedc942b59
>          git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
>          git fetch --no-tags stable linux-5.4.y
>          git checkout 3e9aa125f69c0006d10f101898932acedc942b59
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/nvme/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202304032219.jG1sChqf-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> ld.lld: error: drivers/nvme/host/core.o: contains a compressed section, but zlib is not available
>>> ld.lld: error: drivers/nvme/host/core.o: contains a compressed section, but zlib is not available
>>> ld.lld: error: drivers/nvme/host/core.o: contains a compressed section, but zlib is not available
>>> ld.lld: error: drivers/nvme/host/core.o: contains a compressed section, but zlib is not available
>>> ld.lld: error: drivers/nvme/host/core.o: contains a compressed section, but zlib is not available
>>> ld.lld: error: drivers/nvme/host/core.o: contains a compressed section, but zlib is not available
>>> ld.lld: error: drivers/nvme/host/core.o: contains a compressed section, but zlib is not available
>>> ld.lld: error: drivers/nvme/host/trace.o: contains a compressed section, but zlib is not available
>>> ld.lld: error: drivers/nvme/host/trace.o: contains a compressed section, but zlib is not available
>>> ld.lld: error: drivers/nvme/host/trace.o: contains a compressed section, but zlib is not available
>>> ld.lld: error: drivers/nvme/host/trace.o: contains a compressed section, but zlib is not available
>>> ld.lld: error: drivers/nvme/host/trace.o: contains a compressed section, but zlib is not available
>>> ld.lld: error: drivers/nvme/host/trace.o: contains a compressed section, but zlib is not available
>>> ld.lld: error: drivers/nvme/host/trace.o: contains a compressed section, but zlib is not available
>>> ld.lld: error: drivers/nvme/host/multipath.o: contains a compressed section, but zlib is not available
>>> ld.lld: error: drivers/nvme/host/multipath.o: contains a compressed section, but zlib is not available
>>> ld.lld: error: drivers/nvme/host/multipath.o: contains a compressed section, but zlib is not available
>>> ld.lld: error: drivers/nvme/host/multipath.o: contains a compressed section, but zlib is not available
>>> ld.lld: error: drivers/nvme/host/multipath.o: contains a compressed section, but zlib is not available
>>> ld.lld: error: drivers/nvme/host/multipath.o: contains a compressed section, but zlib is not available
>     ld.lld: error: too many errors emitted, stopping now (use -error-limit=0 to see all errors)
> 
