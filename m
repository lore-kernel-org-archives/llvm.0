Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8EA2C83
	for <llvm@lists.linux.dev>; Sun, 21 Nov 2021 12:31:02 +0000 (UTC)
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6C96C3F0EA
	for <llvm@lists.linux.dev>; Sun, 21 Nov 2021 12:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1637497855;
	bh=ovlM/CtBg6oq/VSBNYal4pBA1JGsuS4PHZvDuipUS7A=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type;
	b=ejWEwyshrivtNOxKtMWHoCstTy55eA1xQwJjeim6DyPly6NNiVhvJdj7QjQBF3McN
	 vlPAXzB9e2EX4snoPrH+9z7Yd/5pyoTaQhEpaZ852q0enprAKx35oV4KvFpZf9z5xj
	 My76aMWdcGLK/Y+OkPiAN4Umq8HMZzio4qP4+0DxIfGnDASEqQSYG1GxRpl4mBqTum
	 GHLr9liN5oubvAMs3CbES0zBJXDtnOEnNG1+pXm0iJR0atu7yKWwR3QDv56uEL6mqQ
	 uOLu2xIl2wIILMyztr1vTmoE2SQXj50PRQs6Wt0vKgJvxlyh563LEKQWfr+ABfLiQu
	 AjEDxxHNlOetA==
Received: by mail-lf1-f72.google.com with SMTP id q26-20020ac2515a000000b0040adfeb8132so10017370lfd.9
        for <llvm@lists.linux.dev>; Sun, 21 Nov 2021 04:30:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=ovlM/CtBg6oq/VSBNYal4pBA1JGsuS4PHZvDuipUS7A=;
        b=w3E9TbQKkBbrqlGQZDFYqFHtj2nRABnkqmjLL2iCaYNLSgch24FFZQtU0oeeCYzc8b
         Vw2F0dxCef4D0ddZucNSWnS4X7MfZKlhGuiC7ZUGYvKYPKPM5VnkW0KguvAYAHmnknit
         /hTc1sBht9autTsBOrX5uz6zI4Zgdzb/1ZSgA8pBLCZV98eVpQaLjqYxPQ3mLVVwXsct
         PB7Ealy0JZA0XTtYRr2OCO5Rv8mJdkuu6I69yJdIRG1QCK2/OFLxpNHtwlThny7c0ADz
         FzZCpgKXXM01I+5aCGYeFNlQr3aIUDqQ71PUfq/0juxYlAnQrSIwc8P8G11t85QQXU7U
         nC8w==
X-Gm-Message-State: AOAM530L54VDqWbrXdBDCyn8vm9hVfZQEPkEi0N1CTTNPWz5jWjGaLAs
	e7oeFWgPd1yU7Dhn5u4NK4iPyD/bwWRGFDg7f2i/Wc6IC5kwxEDYlyzG0zPi2xLiHgkMdVhc+5f
	gBJdz7eyZfWVv1xQUK/01c7HLqnf6w+o=
X-Received: by 2002:ac2:41c6:: with SMTP id d6mr48246875lfi.400.1637497854564;
        Sun, 21 Nov 2021 04:30:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz54pin1D7rFlw1LnJUNf2/CGNRs7yPccadRWC2tmQyaevRHFB96zxX94YlDnCFyX7+DXDo2w==
X-Received: by 2002:ac2:41c6:: with SMTP id d6mr48246847lfi.400.1637497854330;
        Sun, 21 Nov 2021 04:30:54 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id x6sm628813lfe.201.2021.11.21.04.30.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Nov 2021 04:30:52 -0800 (PST)
Message-ID: <fb145fb3-61e0-5c24-4a87-5d17420abc72@canonical.com>
Date: Sun, 21 Nov 2021 13:30:50 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [krzk-mem-ctrl:for-v5.17/renesas-rpc 5/5]
 drivers/memory/renesas-rpc-if.c:253:14: warning: cast to smaller integer type
 'enum rpcif_type' from 'const void *'
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: kernel test robot <lkp@intel.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Wolfram Sang <wsa-dev@sang-engineering.com>
References: <202111171118.XlLOUQ87-lkp@intel.com>
 <e448d7b7-0a7d-7c88-271f-75ed5ac7e13a@canonical.com>
In-Reply-To: <e448d7b7-0a7d-7c88-271f-75ed5ac7e13a@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/11/2021 09:27, Krzysztof Kozlowski wrote:
> On 17/11/2021 04:56, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git for-v5.17/renesas-rpc
>> head:   b04cc0d912eb80d3c438b11d96ca847c3e77e8ab
>> commit: b04cc0d912eb80d3c438b11d96ca847c3e77e8ab [5/5] memory: renesas-rpc-if: Add support for RZ/G2L
>> config: x86_64-buildonly-randconfig-r002-20211116 (attached as .config)
>> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4c2cf3a314d9131b1b288e7c8ab0c75ac1b2be1d)
>> reproduce (this is a W=1 build):
>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         # https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git/commit/?id=b04cc0d912eb80d3c438b11d96ca847c3e77e8ab
>>         git remote add krzk-mem-ctrl https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git
>>         git fetch --no-tags krzk-mem-ctrl for-v5.17/renesas-rpc
>>         git checkout b04cc0d912eb80d3c438b11d96ca847c3e77e8ab
>>         # save the attached .config to linux build tree
>>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=x86_64 
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All warnings (new ones prefixed by >>):
>>
>>>> drivers/memory/renesas-rpc-if.c:253:14: warning: cast to smaller integer type 'enum rpcif_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]
>>            rpc->type = (enum rpcif_type)of_device_get_match_data(dev);
>>                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>    1 warning generated.
>>
> 
> I am afraid several drivers repeat this pattern and will be affected as
> well on clang. GCC does not complain (apparently cast is enough for
> GCC), but still this has to be fixed. Maybe cast via  uintptr_t would
> quite it?
> 
> Let me know when I can expect the fix.
> 

Any progress on fixing this one? It blocks entire set (and further
Wolfram's patches) from being included in pull-request and might be
postponed till next release.


Best regards,
Krzysztof
