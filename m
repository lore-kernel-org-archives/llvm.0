Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74A6A29;
	Fri, 11 Aug 2023 01:58:06 +0000 (UTC)
Received: from canpemm500002.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RMRjs3rD5zrSHN;
	Fri, 11 Aug 2023 09:56:49 +0800 (CST)
Received: from [10.174.151.185] (10.174.151.185) by
 canpemm500002.china.huawei.com (7.192.104.244) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 11 Aug 2023 09:58:03 +0800
Subject: Re: [linux-next:master 7083/7933] ld.lld: error: assignment to symbol
 __init_end does not converge
To: kernel test robot <lkp@intel.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, Linux Memory
 Management List <linux-mm@kvack.org>, Andrew Morton
	<akpm@linux-foundation.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>
References: <202308090338.AqDF9eEK-lkp@intel.com>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <95122552-df11-c75c-4957-911e58ec9410@huawei.com>
Date: Fri, 11 Aug 2023 09:58:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202308090338.AqDF9eEK-lkp@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.151.185]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500002.china.huawei.com (7.192.104.244)
X-CFilter-Loop: Reflected

On 2023/8/9 3:26, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   71cd4fc492ec41e4acd85e98bbf7a13753fc1e03
> commit: 489dcf298fbc8c0be81d98a6477ddeadc7327858 [7083/7933] mm/mm_init.c: remove obsolete macro HASH_SMALL
> config: arm64-randconfig-r032-20230808 (https://download.01.org/0day-ci/archive/20230809/202308090338.AqDF9eEK-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce: (https://download.01.org/0day-ci/archive/20230809/202308090338.AqDF9eEK-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308090338.AqDF9eEK-lkp@intel.com/
> 
> Note: the linux-next/master HEAD 71cd4fc492ec41e4acd85e98bbf7a13753fc1e03 builds fine.
>       It may have been fixed somewhere.
> 
> All errors (new ones prefixed by >>):
> 
>>> ld.lld: error: assignment to symbol __init_end does not converge

Thanks for your report. It seems that commit is irrelevant to the problem and I have no idea what
this error means. Could you please give me some more information?

Thanks!

