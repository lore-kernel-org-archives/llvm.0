Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB921113
	for <llvm@lists.linux.dev>; Thu, 25 Aug 2022 09:16:08 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id v14so1741554ejf.9
        for <llvm@lists.linux.dev>; Thu, 25 Aug 2022 02:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=niRs2YtuH5B5oh1E7598uKEG/vRd1+c2zDxWBz4UkwE=;
        b=dlDNTnyiWbdKLsF4H0dN4LY83Z/ZJu5EphQ9OD+H5nha4HI+2ztnNtu3H4xzQCNcgh
         mNOG4qp514QMKCj/2ZO7UAKiKzABdTw5jAnwvMaDzaqv7JJv92BbGkXzEVoh39HbmJE0
         1yjCUQ7AnC9XKs1wroKmwh9iUqxnoyakyZlzFGhkzL17nRijZS9BUt1B7ZwoR/zcOFd5
         4bc6llE7Ehv/dkHf3loIQpdly3vqPc4bsQ3GtRfOyrofV5gjVKG956ErpCUleATYmyWS
         GCrSWcjKCTmSe8sDxO+Si6qz9rTxjI72lzU8/fUbVFZhyBwiiV0CGjQ5PUHXgQSSrIfF
         UFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=niRs2YtuH5B5oh1E7598uKEG/vRd1+c2zDxWBz4UkwE=;
        b=bWkxKmvDaBrBvZDn7O8YAJgWnTQWoixYiKvn92BXPfO0sdE3JcSKtqfejdQgWf1lws
         a++9T8F1St3RkSwBW1Bc/Y7iaeyczLPnoQSYbSz55Amfp+xzLgtpSMqBI3iDDefhDJ6t
         Cioh+Z199ZdeC4HlpRMN9T1iFq5CdcjaUPMpfFpNAFGPKH3ub/5pz4sGqqLv8rS7vp9g
         uPorepkxubhr5hFLswoNG2j/RD9zJ9OBslnNPhvqUuNoGq9dYqfUC0fF5Gfi1pRAQGhI
         uQTECYU1kBsMmpt+qSzQ5w3QaqjfTVevUb/DcdAHOUrt+GjHWhJ+okVIymggDj0NeJEq
         B1VQ==
X-Gm-Message-State: ACgBeo3qbwqUZd5eJsqX2XazQTD0OlkYyhwgplRJi5ZAMgsgVNzh5Gy2
	/J+rSftSoULxfGXAO/q7iLM=
X-Google-Smtp-Source: AA6agR4Umk4Ifs5d6wA4D+kyy9D/qgTCDDz9Wyl+uxvXmVoIjer/V+FotX39VNEdpIVpZqLufgERMg==
X-Received: by 2002:a17:906:5a50:b0:73d:ad57:e02e with SMTP id my16-20020a1709065a5000b0073dad57e02emr1789735ejc.431.1661418966961;
        Thu, 25 Aug 2022 02:16:06 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:310::2eef? ([2620:10d:c092:600::2:bb7b])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906218a00b0072af4af2f46sm2180299eju.74.2022.08.25.02.16.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 02:16:06 -0700 (PDT)
Message-ID: <ea498e38-d1b0-1011-834d-8574cd0d113b@gmail.com>
Date: Thu, 25 Aug 2022 10:14:59 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [axboe-block:io_uring-6.0 14/14] io_uring/net.c:1053:36: warning:
 variable 'addr' is uninitialized when used here
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
References: <202208250535.oP4RWEEL-lkp@intel.com>
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <202208250535.oP4RWEEL-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/24/22 22:41, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-6.0
> head:   0596fa5ef9aff29219021fa6f0117b604ff83d09
> commit: 0596fa5ef9aff29219021fa6f0117b604ff83d09 [14/14] io_uring/net: save address for sendzc async execution
> config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220825/202208250535.oP4RWEEL-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?id=0596fa5ef9aff29219021fa6f0117b604ff83d09
>          git remote add axboe-block https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git
>          git fetch --no-tags axboe-block io_uring-6.0
>          git checkout 0596fa5ef9aff29219021fa6f0117b604ff83d09
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>

Yeah, that part is trashy, I'll fix it up, thanks


-- 
Pavel Begunkov
