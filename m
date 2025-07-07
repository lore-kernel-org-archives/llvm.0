Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59CA28E7;
	Mon,  7 Jul 2025 01:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751852993; cv=none; b=LSbrRkcbMg068qlGpObAPgXnSzSpxG8YqlQRqBFw+oZ2lONTF6wCZA0wwvpWq3Fj2s04f4zOigeFIqBOfMCZ2l7A62wuC9PMfmYSuWYMrPDwQcYh/0Du1N2grPq7CJXrtxgm2spnEQAsqpWOn6oyKhKigN9X7GJLPdAjXehsYLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751852993; c=relaxed/simple;
	bh=R9wOoivrfZOJIBWeWht1zr7HlkSe8WY9GbFRkNpF3iM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mHgMfgyTj3oQlUd6hFxW5b0rLSrZBsiUEi+WkGsNDvjaqMuYW/92JOcpzIVgljHUCOC/Rwnu4so2rN91u089KBczm2IiLd/WrhQBk5NsVR1j9A84B0maaT5/RJzuG1/vH25LgKEGWXGRUpphIItDZjcwdPGXjDaTdaWmQb/wu6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hisilicon.com; spf=pass smtp.mailfrom=hisilicon.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hisilicon.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4bb6ZD13rJz2SSqq;
	Mon,  7 Jul 2025 09:47:48 +0800 (CST)
Received: from kwepemf100018.china.huawei.com (unknown [7.202.181.17])
	by mail.maildlp.com (Postfix) with ESMTPS id 722FD140145;
	Mon,  7 Jul 2025 09:49:40 +0800 (CST)
Received: from [10.67.120.168] (10.67.120.168) by
 kwepemf100018.china.huawei.com (7.202.181.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 7 Jul 2025 09:49:39 +0800
Message-ID: <5f9d93c3-ea97-b951-fc68-e23bb1337120@hisilicon.com>
Date: Mon, 7 Jul 2025 09:49:39 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [mellanox:wip/leon-for-next 29/35]
 drivers/infiniband/hw/hns/hns_roce_hw_v2.c:2225:38: error: use of undeclared
 identifier 'cmd_numi'; did you mean 'cmd_num'?
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, Leon Romanovsky
	<leon@kernel.org>
References: <202507070359.Ng3M8gut-lkp@intel.com>
From: Junxian Huang <huangjunxian6@hisilicon.com>
In-Reply-To: <202507070359.Ng3M8gut-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemf100018.china.huawei.com (7.202.181.17)



On 2025/7/7 6:13, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mellanox/linux.git wip/leon-for-next
> head:   bdc5726cdd454f91d7bf49f47c8c31377cb3d7ce
> commit: 6cbf3ee2e409ca573ef1ebb3f383ae3873850ee7 [29/35] RDMA/hns: Get message length of ack_req from FW
> config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250707/202507070359.Ng3M8gut-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250707/202507070359.Ng3M8gut-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507070359.Ng3M8gut-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> drivers/infiniband/hw/hns/hns_roce_hw_v2.c:2225:38: error: use of undeclared identifier 'cmd_numi'; did you mean 'cmd_num'?
>     2225 |         hns_roce_cmq_setup_basic_desc(&desc[cmd_numi - 1], cmd, true);
>          |                                             ^~~~~~~~
>          |                                             cmd_num
>    drivers/infiniband/hw/hns/hns_roce_hw_v2.c:2210:6: note: 'cmd_num' declared here
>     2210 |         int cmd_num;
>          |             ^
>    1 error generated.
> 

Leon, just to confirm that this can be fixed in your wip branch
and I don't need to resend a patch, right?

Junxian
