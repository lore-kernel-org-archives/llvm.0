Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB240C8EF;
	Fri, 28 Jul 2023 08:18:12 +0000 (UTC)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 3DE02120008;
	Fri, 28 Jul 2023 11:10:12 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 3DE02120008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1690531812;
	bh=DMA54MDYYn1d7RJ2bPPgn5wYIP4JhDLprZGiK20t+F8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=Ff6+t92+UTOrTlGglnRaX2lMNPS2bB31/Nfy91Lxf+duUEltCJPIiZcTjd5vMF/wj
	 obWF9VdWkb5zohbEyW/WTrg9Bc3TMfgURKZEZiGxPGFijAzufdhSKoEAwWzAqV6SY9
	 iF8IsDzguI5xdtJEmmIBrnxDtPZCOvtv0aOQy0yiHRElUHGJFkliumLE+ELsbJJ+Qc
	 fXttfRu3QSRHoKyJAtXiPDnQ2YPPVr551PenEm+TidyJer2McoCrBCPHGNxbzVvYWq
	 zKrYi+b0Sc4JDps9B/zfU+9RKF1VlQGTaGbYhYXWxys3rdUMHLIYBcwbSg6hsHZAO8
	 5qmI22MccgtFg==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 28 Jul 2023 11:10:12 +0300 (MSK)
Received: from [192.168.0.106] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 28 Jul 2023 11:09:48 +0300
Message-ID: <7c774f17-b8fd-649e-0071-d344b7eb8512@sberdevices.ru>
Date: Fri, 28 Jul 2023 11:04:38 +0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [mtd:nand/next 31/32] drivers/mtd/nand/raw/meson_nand.c:244:59:
 error: initializer element is not a compile-time constant
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>, kernel test robot
	<lkp@intel.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>
References: <202307281007.MMuVjmJ9-lkp@intel.com>
 <20230728095729.0acda79b@xps-13>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230728095729.0acda79b@xps-13>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178796 [Jul 22 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: AVKrasnov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 525 525 723604743bfbdb7e16728748c3fa45e9eba05f7d, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/07/23 10:45:00
X-KSMG-LinksScanning: Clean, bases: 2023/07/23 10:46:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/23 08:49:00 #21663637
X-KSMG-AntiVirus-Status: Clean, skipped



On 28.07.2023 10:57, Miquel Raynal wrote:
> Hi Arseniy,
> 
> lkp@intel.com wrote on Fri, 28 Jul 2023 10:57:07 +0800:
> 
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
>> head:   6680d8b67921fc732a59792dec6d3f94c031451c
>> commit: 0e1db39336d8be4ddeb9f0d99720056f3ff41310 [31/32] mtd: rawnand: meson: support for 512B ECC step size
>> config: x86_64-buildonly-randconfig-r003-20230727 (https://download.01.org/0day-ci/archive/20230728/202307281007.MMuVjmJ9-lkp@intel.com/config)
>> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
>> reproduce: (https://download.01.org/0day-ci/archive/20230728/202307281007.MMuVjmJ9-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202307281007.MMuVjmJ9-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>>> drivers/mtd/nand/raw/meson_nand.c:244:59: error: initializer element is not a compile-time constant  
>>    static const struct nand_ecc_step_info axg_stepinfo[] = { axg_stepinfo_1024, axg_stepinfo_512 };
>>                                                              ^~~~~~~~~~~~~~~~~
>>    1 error generated.
>>
>>
>> vim +244 drivers/mtd/nand/raw/meson_nand.c
>>
>>    243	
>>  > 244	static const struct nand_ecc_step_info axg_stepinfo[] = { axg_stepinfo_1024, axg_stepinfo_512 };  
> 
> Could you have a look?

Hello Miquel,

Sure, I'll send fix today/tommorow!

Thanks, Arseniy

> 
> Thanks,
> Miquèl
