Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD1C2C83
	for <llvm@lists.linux.dev>; Wed, 17 Nov 2021 08:27:53 +0000 (UTC)
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9F8283F190
	for <llvm@lists.linux.dev>; Wed, 17 Nov 2021 08:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1637137668;
	bh=P95dsz5DnmdjZd6IIMhwxlUD+8WIlKXIhjrCFJuQBiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=E8tXvgq8uF/ZfcZKiqIp67hA/VWGABwKzdRUFi/1cvcWZB6/owQ8HDqeivx4LAGX6
	 5pxHcc5khPvecWmVj6YDtamVmhlzX7hbq58Jo8aCDqjdW910KAs4i6Qy/Wfho4Cbwc
	 d7HUe2Kdpv4ajkZ4sm+Q990LkIX0AIB8Vr1C6eXnTBAb05GG4gBgXeoHcDwQKTl8o9
	 j0JWWXMzZAnB/8aYRcjeloGGRhRITh5nqp790qV9hMw4KsB74QjwAmBffAuOj6PR5H
	 r8v04ZDfdnTqrcYlFSBElbfi92A+yl5UKxqXQ22cUJYYCMnHLGvXCGi1fmmV41AY10
	 KbEtjRFyjKXoA==
Received: by mail-lf1-f71.google.com with SMTP id n18-20020a0565120ad200b004036c43a0ddso987840lfu.2
        for <llvm@lists.linux.dev>; Wed, 17 Nov 2021 00:27:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=P95dsz5DnmdjZd6IIMhwxlUD+8WIlKXIhjrCFJuQBiY=;
        b=wkH+XK6E9Nk92v9Ze+esRq/GvygXvjjz48Bw5GCoGmqNrLxutPCrBXl4hZqualvrML
         Z5BuNTmbn0Mw/ongT24NHzldG/PpNpuS903gfvpO7uX63ur7TrPLU8eOBqYKzvC8P4yo
         Ozuf2LfQjzcVsSAQWo+YBbsZJzewEFpQSfCygrbgqlP23yI8iDv0CHI3uUqaVRbH3H4K
         c0XrZVy1b6a4bL11H4wqB/BQVENro81HwY8FMRob8AlqeauVMHadHqZWU+N2dkmm73aF
         mSf3TOhztC9owJS0OG0MHh3lyLFFMtxQeOvcpaxuwBBBFD60XNpBwSXNNl7aOisZHl0f
         kEmw==
X-Gm-Message-State: AOAM530Kq+EliVp9lcbPdqC2dPAL5EZWkEIJO5bCzQ4M7X1uCF4J2Gia
	q0CexfVwFJHDH0J+l8GYze+64qscJCfVIWpXL9QXUEtov1aXJ2fOvVinb99+boLlUexg5N0aC0f
	DMX/IWLH7/SR3umEBS3KrkEWh4dSDLZ0=
X-Received: by 2002:a05:6512:308b:: with SMTP id z11mr13039264lfd.177.1637137668142;
        Wed, 17 Nov 2021 00:27:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdracRFgDN5bjVOqJs9kEp8rGYLeXyKT3Z97paO0yilkiZKv3mOw7ITb5/C3y0gQHc7iq+FQ==
X-Received: by 2002:a05:6512:308b:: with SMTP id z11mr13039238lfd.177.1637137667915;
        Wed, 17 Nov 2021 00:27:47 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id k5sm2085654lja.34.2021.11.17.00.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Nov 2021 00:27:47 -0800 (PST)
Message-ID: <e448d7b7-0a7d-7c88-271f-75ed5ac7e13a@canonical.com>
Date: Wed, 17 Nov 2021 09:27:46 +0100
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
To: kernel test robot <lkp@intel.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Wolfram Sang <wsa-dev@sang-engineering.com>
References: <202111171118.XlLOUQ87-lkp@intel.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <202111171118.XlLOUQ87-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/11/2021 04:56, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git for-v5.17/renesas-rpc
> head:   b04cc0d912eb80d3c438b11d96ca847c3e77e8ab
> commit: b04cc0d912eb80d3c438b11d96ca847c3e77e8ab [5/5] memory: renesas-rpc-if: Add support for RZ/G2L
> config: x86_64-buildonly-randconfig-r002-20211116 (attached as .config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4c2cf3a314d9131b1b288e7c8ab0c75ac1b2be1d)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git/commit/?id=b04cc0d912eb80d3c438b11d96ca847c3e77e8ab
>         git remote add krzk-mem-ctrl https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git
>         git fetch --no-tags krzk-mem-ctrl for-v5.17/renesas-rpc
>         git checkout b04cc0d912eb80d3c438b11d96ca847c3e77e8ab
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=x86_64 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>>> drivers/memory/renesas-rpc-if.c:253:14: warning: cast to smaller integer type 'enum rpcif_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]
>            rpc->type = (enum rpcif_type)of_device_get_match_data(dev);
>                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    1 warning generated.
> 

I am afraid several drivers repeat this pattern and will be affected as
well on clang. GCC does not complain (apparently cast is enough for
GCC), but still this has to be fixed. Maybe cast via  uintptr_t would
quite it?

Let me know when I can expect the fix.

Best regards,
Krzysztof
