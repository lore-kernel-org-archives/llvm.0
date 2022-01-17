Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF58D2C9D
	for <llvm@lists.linux.dev>; Mon, 17 Jan 2022 13:13:48 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EDB8B3F1C8
	for <llvm@lists.linux.dev>; Mon, 17 Jan 2022 13:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642424902;
	bh=e08JKMUCF9rkW7h8herQx6Sp+GfYHkpXq4pM7aKk9D8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=JCS971oYpLCicqRde2+c/8NwgD5ACT+QtHobGIeb3zlJPMma4iY/zxG3IKuCEUsDF
	 FO+6OLSMO7zu0LJVPbB08PSrgEsfzKLEvasU+iW493lH5T0KqupFG1+xTuu3UttZNP
	 TocpZLkyk9kVMQ5ULCGkej8nGShFfT6ev5CZ6do5zvcY2Hb0AgW3HAQ3O48+mfEMib
	 3JXmrZisG+YnhN3pl87qDlvL+oWCoLG5gQC/zTfpHxkCYn2QPSdY5qW4v2WyLA503b
	 B8/FeJc004hoc1zprZIbX73Bb4h8KOXEjUsH2BKQBUCSKT3+QUUtntUbNIM+APAkTT
	 KhKOLPgYfLaNw==
Received: by mail-ed1-f69.google.com with SMTP id g2-20020a50ee02000000b0040217f163ffso4267158eds.3
        for <llvm@lists.linux.dev>; Mon, 17 Jan 2022 05:08:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=e08JKMUCF9rkW7h8herQx6Sp+GfYHkpXq4pM7aKk9D8=;
        b=giBfYdFhbqe8pctI9jkJ7/PGm47LREtcfHCMrRPVcfh98kll+0cZKMbPyFQTSGPCeL
         4E01RNyRcsUe970v91DQKxGMXvhNzwayiOZS+93zrDhN5PHxc+veKQB6ySM6M5wd+awZ
         J+0SiBjkLCe/ZAZk2aPw8nwoZgbqb8NF8FuMBxYajGZ3FHusSnMdwbCBxqA9q4CoZD7c
         q1eSRXh7oQCqv+3pMS5EfRgWzbMr7EfsCWJC/17ERxfBVzFL8qJWmIy1evni/65Ocqt3
         aryEJqf6WC26oi4sTk+awzlo43kmDLx/ZuJn9BhzjtygYGm+Qfh0ZUPogxJXAgJ7TS5h
         LMdw==
X-Gm-Message-State: AOAM530wZagife0us1zLeM1rZNmsGEvrRHC72MArzHMqA5674bJY2Fij
	0UudJGl+s50qV3sgfVHGAKOBpYJJBXW4Uq0l9fcc+1A5CggXfa8R9GImWpiIixpPjW+SbsBLShu
	EH1IZ52Ho3ZlOJSm2v02GtSYmlkIp++0=
X-Received: by 2002:a50:eacb:: with SMTP id u11mr20647272edp.290.1642424902564;
        Mon, 17 Jan 2022 05:08:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwaB8f22s1yf7HiR470gf2zwStoCK0L+L42jchbE9hJLljq12+sbh42N7thqto1gshz4ZpU+w==
X-Received: by 2002:a50:eacb:: with SMTP id u11mr20647256edp.290.1642424902353;
        Mon, 17 Jan 2022 05:08:22 -0800 (PST)
Received: from [192.168.0.37] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id vr3sm4408676ejb.107.2022.01.17.05.08.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jan 2022 05:08:21 -0800 (PST)
Message-ID: <57ad6f87-2198-92c6-8c26-f5b5a8d8a354@canonical.com>
Date: Mon, 17 Jan 2022 14:08:21 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: ERROR: modpost: "gpmc_omap_get_nand_ops"
 [drivers/mtd/nand/raw/omap2_nand.ko] undefined!
Content-Language: en-US
To: Roger Quadros <rogerq@kernel.org>, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org
References: <202201171805.5HeoR4rS-lkp@intel.com>
 <232ecd71-c4f8-6272-9a1e-91372763c3f5@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <232ecd71-c4f8-6272-9a1e-91372763c3f5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/01/2022 13:35, Roger Quadros wrote:
> Hi,
> 
> On 17/01/2022 12:51, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> head:   0c947b893d69231a9add855939da7c66237ab44f
>> commit: dbcb124acebd8148e9e858a231f1798956dd3ca6 mtd: rawnand: omap2: Select GPMC device driver for ARCH_K3
>> date:   4 weeks ago
>> config: arm64-randconfig-r001-20220117 (https://download.01.org/0day-ci/archive/20220117/202201171805.5HeoR4rS-lkp@intel.com/config)
>> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5f782d25a742302d25ef3c8b84b54f7483c2deb9)
>> reproduce (this is a W=1 build):
>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         # install arm64 cross compiling tool for clang build
>>         # apt-get install binutils-aarch64-linux-gnu
>>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=dbcb124acebd8148e9e858a231f1798956dd3ca6
>>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>>         git fetch --no-tags linus master
>>         git checkout dbcb124acebd8148e9e858a231f1798956dd3ca6
>>         # save the config file to linux build tree
>>         mkdir build_dir
>>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>, old ones prefixed by <<):
>>
>>>> ERROR: modpost: "gpmc_omap_get_nand_ops" [drivers/mtd/nand/raw/omap2_nand.ko] undefined!
> 
> The issue is that CONFIG_MEMORY is not set so OMAP_GPMC driver is not built causing the above undefined symbol error.
> 
>>
>> Kconfig warnings: (for reference only)
>>    WARNING: unmet direct dependencies detected for OMAP_GPMC
>>    Depends on MEMORY && OF_ADDRESS
>>    Selected by
>>    - MTD_NAND_OMAP2 && MTD && MTD_RAW_NAND && (ARCH_OMAP2PLUS || ARCH_KEYSTONE || COMPILE_TEST && HAS_IOMEM && ARCH_K3
>>
> 
> A possible fix would be to select MEMORY along with OMAP_GPMC at the below location
> 
> config MTD_NAND_OMAP2
>         tristate "OMAP2, OMAP3, OMAP4 and Keystone NAND controller"
>         depends on ARCH_OMAP2PLUS || ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST
>         depends on HAS_IOMEM
> 	select MEMORY
> ^^
>         select OMAP_GPMC if ARCH_K3 
>         help
>           Support for NAND flash on Texas Instruments OMAP2, OMAP3, OMAP4
>           and Keystone platforms.
> 
> 
> Is this OK?

Instead rather "select MEMORY if ARCH_K3"?

However I had impression that selecting a user-visible options is
discouraged, especially from within the drivers. What I would expect is
to select it from the machine/architecture code like you did before [1]
but was rejected by Nishanth.

https://lore.kernel.org/linux-devicetree/20211217161417.q2qwwlki7oieqzjd@headlock/

In such case, your choice (with if ARCH...?) seems sensible.
MTD_NAND_FSL_IFC already does it.

Best regards,
Krzysztof
