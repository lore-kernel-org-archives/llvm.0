Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D877538C;
	Mon, 12 Jun 2023 20:44:48 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3f78a32266bso48756765e9.3;
        Mon, 12 Jun 2023 13:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686602687; x=1689194687;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALjtb1mIX+GZejE31to3xfsby/eOvSoCSDDPLC+nH8A=;
        b=nWnT2Ip48Z5YrH4Iz+A80ravFKFkjRg8lIRgfaBRLgKcEx98gjWQA7RmTzbceBJJ9b
         OhYeE3/mnEV+oQRgE83mD3lo6WDjv20Q/EPdhypuvJG7iIyUiykjQWne1GhOUkIQlESL
         /2D5H7ARsaaEIEcWg9vKSxFOBkKmT1GQBdBNANEV++VL1HOVmC3Gp6cZsaemY1kMJ/++
         d2Js7egZ3mc0CNaIXkmm1RgRk7Bjt7Klj2dbHG2hCJk1ylFmXEbX1IgDbVTnWeeovddE
         g8gXS7EaFiuIfhiB74kd01JFJ/wLf7Y1zCtkSdtThgKWZK29RXv3HLc1MhyvAnvs7if8
         DxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686602687; x=1689194687;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ALjtb1mIX+GZejE31to3xfsby/eOvSoCSDDPLC+nH8A=;
        b=hJ9F3Cmj37x6UlCW5lMVbq0r/GH4fj5qDjjJOyy+xxuSDcOwcgDcRg5whp4utrpJWi
         ivx6EfZAbOlpglv8hnpnRmL5pF4wwNEyyZ2969XrQ+JFSclxDeX+hYpmDNFoxjV4LTyV
         q7RCzfz6VXwgap+No4upfWGFotPngsHV3wHOgAc+QjWSxTVysvyYZLMmVXNFCT1VmNat
         gukjcX7OYRmddnxTwldGlNbhSd40JeyE0tVmJ/9PxL3JjcsB7OK/QNx+oLtXV/OQb4fd
         4A7IVQumSrEOxZIoKyBgcyjKREd+4y+0DaawDUfE2eOe/Ce+pLJKhmBBvFq+2las3hkA
         xQTw==
X-Gm-Message-State: AC+VfDy9jfOdimjwayNedxL3zA8t7C9yx+j0mKBp2JFIGlMgA4JuUtlX
	NKaGZV602E6hQQl85ybum3A=
X-Google-Smtp-Source: ACHHUZ6HgQri17EQgGB6hP+QvkVq22s68BSuTg5TQ0W3NZO1vKc/aDZCMWNSlqdZMSs2Nka6Slh6wg==
X-Received: by 2002:a05:600c:2245:b0:3f7:33cf:707f with SMTP id a5-20020a05600c224500b003f733cf707fmr8494315wmm.35.1686602686967;
        Mon, 12 Jun 2023 13:44:46 -0700 (PDT)
Received: from [192.168.1.122] (cpc159313-cmbg20-2-0-cust161.5-4.cable.virginm.net. [82.0.78.162])
        by smtp.gmail.com with ESMTPSA id y24-20020a05600c365800b003f735ba7736sm12310321wmq.46.2023.06.12.13.44.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 13:44:46 -0700 (PDT)
Subject: Re: [netdev-net-next:main 26/28] ld.lld: error: undefined symbol:
 efx_tc_netdev_event
To: Simon Horman <simon.horman@corigine.com>,
 kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>,
 Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>
References: <202306102026.ISK5JfUQ-lkp@intel.com>
 <ZIbUNpktWf2TmKGZ@corigine.com>
From: Edward Cree <ecree.xilinx@gmail.com>
Message-ID: <8724de62-fe9b-cdd4-bb39-b3c06b440f5f@gmail.com>
Date: Mon, 12 Jun 2023 21:44:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZIbUNpktWf2TmKGZ@corigine.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 12/06/2023 09:15, Simon Horman wrote:
> On Sat, Jun 10, 2023 at 09:10:45PM +0800, kernel test robot wrote:
>> All errors (new ones prefixed by >>):
>>
>>>> ld.lld: error: undefined symbol: efx_tc_netdev_event
>>    >>> referenced by ef100_netdev.c:313 (drivers/net/ethernet/sfc/ef100_netdev.c:313)
>>    >>>               drivers/net/ethernet/sfc/ef100_netdev.o:(ef100_netdev_event) in archive vmlinux.a
>> --
>>>> ld.lld: error: undefined symbol: efx_tc_netevent_event
>>    >>> referenced by ef100_netdev.c:329 (drivers/net/ethernet/sfc/ef100_netdev.c:329)
>>    >>>               drivers/net/ethernet/sfc/ef100_netdev.o:(ef100_netevent_event) in archive vmlinux.a
> 
> A cursory investigation leads me to thinking this occurs
> if the CONFIG_SFC is set but CONFIG_SFC_SRIOV is not.

Yep, looks that way.  Patch on its way shortly.
