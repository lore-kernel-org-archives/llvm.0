Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A23953362;
	Mon, 26 Aug 2024 13:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724679461; cv=none; b=ShObpKJB8Y713jKu2sfmySv70NhxGtvGRTumm4L59Y58A3buZu5YVEoMLWN8aPuu5pUQSXpemjWlOvuT+0Tczl+ZYrLLULn+Afyzx1CuM9y9u2LJO55xIVZtSX4yNC+fH7B4oWhy6OHPWZMMkXkmfclfmjdAnauUCk2rCfRux6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724679461; c=relaxed/simple;
	bh=xiGocR7nIh1k/qlLWTMuuA1jG3/Z6R0f7bMz1TYPhRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BIylk0V82+qbTn4Xa/FB8Cj/CNpYyYBFOrvX1lxD98EsT1rfYiijnumwr+GWEkNcMxoSptYZRPdG0Tih11Zz3eqR8OtcYdR57MFBDxxF7pU24mjCQDV4v+l+zLVPqrVzxCw9fIx3gHGff99uOi7L/oiy7sR3/jgmb8DqPLdNP68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Wss760yc1z20mkp;
	Mon, 26 Aug 2024 21:32:50 +0800 (CST)
Received: from kwepemg500010.china.huawei.com (unknown [7.202.181.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 63E481402E0;
	Mon, 26 Aug 2024 21:37:37 +0800 (CST)
Received: from [10.67.109.211] (10.67.109.211) by
 kwepemg500010.china.huawei.com (7.202.181.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 26 Aug 2024 21:37:36 +0800
Message-ID: <836bcd4e-fb5f-447a-b23f-c6f1d5ddc745@huawei.com>
Date: Mon, 26 Aug 2024 21:37:36 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: WARNING: modpost: vmlinux: section mismatch in reference:
 imx7d_enet_init+0x18 (section: .text.unlikely.imx7d_enet_init) ->
 imx7d_enet_clk_sel (section: .init.text)
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>, kernel test robot <lkp@intel.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, "Russell King (Oracle)"
	<rmk+kernel@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Linus Walleij
	<linus.walleij@linaro.org>
References: <202408232129.sx7nsk3e-lkp@intel.com>
 <20240824033225.GB1733394@thelio-3990X>
From: "liuyuntao (F)" <liuyuntao12@huawei.com>
In-Reply-To: <20240824033225.GB1733394@thelio-3990X>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemg500010.china.huawei.com (7.202.181.71)

I reproduce the warning, even if reset the patch
`ARM: 9404/1: arm32: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION`,
it seems not this patch cause the warning.


On 2024/8/24 11:32, Nathan Chancellor wrote:
> On Fri, Aug 23, 2024 at 09:56:36PM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> head:   3d5f968a177d468cd13568ef901c5be84d83d32b
>> commit: ed0f941022515ff40473ea5335769a5dc2524a3f ARM: 9404/1: arm32: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
>> date:   2 months ago
>> config: arm-randconfig-002-20240823 (https://download.01.org/0day-ci/archive/20240823/202408232129.sx7nsk3e-lkp@intel.com/config)
>> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 08e5a1de8227512d4774a534b91cb2353cef6284)
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408232129.sx7nsk3e-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202408232129.sx7nsk3e-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>>
>> WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
>>>> WARNING: modpost: vmlinux: section mismatch in reference: imx7d_enet_init+0x18 (section: .text.unlikely.imx7d_enet_init) -> imx7d_enet_clk_sel (section: .init.text)
> 
> This is caused by a recent LLVM change, I sent
> https://lore.kernel.org/r/20240822-imx7d-mark-imx7d_enet_init-as-init-v1-1-8dfadee3bed4@kernel.org
> for it.
> 
> Cheers,
> Nathan
