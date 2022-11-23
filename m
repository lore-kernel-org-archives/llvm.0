Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924C37B;
	Wed, 23 Nov 2022 08:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669193413; x=1700729413;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=oqPLmurRiA/J12SZ/yTUE03N36gDsYMvqJElXO6tybk=;
  b=oDuJXD8pUfFsFL8cjNkGMnFcY4fjdBQTfC75+berbDHuDNHQHgwEoUdn
   lxxP75wqgJZQJ/ywoGoaMuqQJTi1yaX1KN0Y2NzMMTr9w71xt2IybYg0m
   /9AhUUyQE3E8Ffu/AwGoIfFAK17fx7T4HslJKtbIvJ61dcjhYYlXmsjGp
   g9BhBVjETHWlryrx9hMfqogGJp1K+IsRhipqOmUQ7CQpYPpdyB7M3y4dH
   FGe2jfE3q6Ad119cQhPBLmMQ/4toimM8mMiwXIw1wdmUMlf3patKgCX4O
   PpBXhXKWsSJeAIB6eA1Qdox4NXl8iUMUf7VI+v+0wG4MHBN9XLYOw92UB
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="314051105"
X-IronPort-AV: E=Sophos;i="5.96,186,1665471600"; 
   d="scan'208";a="314051105"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2022 00:50:11 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="705279153"
X-IronPort-AV: E=Sophos;i="5.96,186,1665471600"; 
   d="scan'208";a="705279153"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.254.208.60]) ([10.254.208.60])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2022 00:50:09 -0800
Subject: Re: [linux-next:master 5636/9540] ld.lld: error: undefined symbol:
 drm_of_get_data_lanes_count_ep
To: Biju Das <biju.das.jz@bp.renesas.com>, kernel test robot <lkp@intel.com>
Cc: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <202211222131.H2kT55xh-lkp@intel.com>
 <OS0PR01MB59222B2AADF54D1E41D81897860D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <0a033967-0336-b265-e346-e05eec14e204@intel.com>
Date: Wed, 23 Nov 2022 16:50:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <OS0PR01MB59222B2AADF54D1E41D81897860D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11/22/2022 11:17 PM, Biju Das wrote:
> Hi kernel test robot,
> 
>> Subject: [linux-next:master 5636/9540] ld.lld: error: undefined symbol:
>> drm_of_get_data_lanes_count_ep
>>
>> tree:
>>
>> head:   771a207d1ee9f38da8c0cee1412228f18b900bac
>> commit: 7a043f978ed1433bddb088a732e9bb91501ebd76 [5636/9540] drm: rcar-
>> du: Add RZ/G2L DSI driver
>> config: arm64-randconfig-r026-20221122
>> compiler: clang version 16.0.0
>> reproduce (this is a W=1 build):
>>          wget
> -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # install arm64 cross compiling tool for clang build
>>          # apt-get install binutils-aarch64-linux-gnu
>>          #
>>          git remote add linux-next
>>          git fetch --no-tags linux-next master
>>          git checkout 7a043f978ed1433bddb088a732e9bb91501ebd76
>>          # save the config file
>>          mkdir build_dir && cp config build_dir/.config
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1
>> O=build_dir ARCH=arm64 SHELL=/bin/bash
>>
>> If you fix the issue, kindly add following tag where applicable
>> | Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>>> ld.lld: error: undefined symbol: drm_of_get_data_lanes_count_ep
>>     >>> referenced by rzg2l_mipi_dsi.c
>>     >>>               drivers/gpu/drm/rcar-
>> du/rzg2l_mipi_dsi.o:(rzg2l_mipi_dsi_probe) in archive vmlinux.a
>> --
>>>> ld.lld: error: undefined symbol: drm_bridge_attach
>>     >>> referenced by rzg2l_mipi_dsi.c
>>     >>>               drivers/gpu/drm/rcar-
>> du/rzg2l_mipi_dsi.o:(rzg2l_mipi_dsi_attach) in archive vmlinux.a
>> --
>>>> ld.lld: error: undefined symbol:
>> drm_atomic_get_new_connector_for_encoder
>>     >>> referenced by rzg2l_mipi_dsi.c
>>     >>>               drivers/gpu/drm/rcar-
>> du/rzg2l_mipi_dsi.o:(rzg2l_mipi_dsi_atomic_enable) in archive vmlinux.a
>> --
>>>> ld.lld: error: undefined symbol: devm_drm_of_get_bridge
>>     >>> referenced by rzg2l_mipi_dsi.c
>>     >>>               drivers/gpu/drm/rcar-
>> du/rzg2l_mipi_dsi.o:(rzg2l_mipi_dsi_host_attach) in archive vmlinux.a
>> --
>>>> ld.lld: error: undefined symbol: drm_bridge_add
>>     >>> referenced by rzg2l_mipi_dsi.c
>>     >>>               drivers/gpu/drm/rcar-
>> du/rzg2l_mipi_dsi.o:(rzg2l_mipi_dsi_host_attach) in archive vmlinux.a
>> --
>>>> ld.lld: error: undefined symbol: drm_bridge_remove
>>     >>> referenced by rzg2l_mipi_dsi.c
>>     >>>               drivers/gpu/drm/rcar-
>> du/rzg2l_mipi_dsi.o:(rzg2l_mipi_dsi_host_detach) in archive vmlinux.a
>> --
>>>> ld.lld: error: undefined symbol:
>> drm_atomic_helper_bridge_duplicate_state
>>     >>> referenced by rzg2l_mipi_dsi.c
>>     >>>               drivers/gpu/drm/rcar-
>> du/rzg2l_mipi_dsi.o:(rzg2l_mipi_dsi_bridge_ops) in archive vmlinux.a
>> --
>>>> ld.lld: error: undefined symbol:
>> drm_atomic_helper_bridge_destroy_state
>>     >>> referenced by rzg2l_mipi_dsi.c
>>     >>>               drivers/gpu/drm/rcar-
>> du/rzg2l_mipi_dsi.o:(rzg2l_mipi_dsi_bridge_ops) in archive vmlinux.a
>> --
>>>> ld.lld: error: undefined symbol: drm_atomic_helper_bridge_reset
>>     >>> referenced by rzg2l_mipi_dsi.c
>>     >>>               drivers/gpu/drm/rcar-
>> du/rzg2l_mipi_dsi.o:(rzg2l_mipi_dsi_bridge_ops) in archive vmlinux.a
> 
> I was able to reproduce the issue and the same fix[1], will fix the issue
> here for clang compiler as well. Can you please apply [1] to avoid
> repeatedly sending the same issue for different compilers on the kernel test robot?

Hi Biju,

Thanks for your advice, we'll add it to ignore list.

Best Regards,
Rong Chen

> 
> [1] https://lore.kernel.org/linux-renesas-soc/Y3wVLU01mHp2zozI@pendragon.ideasonboard.com/T/#t
> 
> Cheers,
> Biju
> 
