Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63E91DB12B;
	Wed, 15 Jan 2025 08:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736928856; cv=none; b=N+3rogxAet1OSce3H3pzZIwyjhrOFyudZRKVGEO5UeXtAJDdPI7ccIrTaYhdgfNpfwVKibipPb8b7OJ1fDYJl7DxUKXwRwfl401J3wHMsnheqJV2pKKHJq/bH8u6OAljIqMlDW72QcKA5BJUhsYHB1PqM+MT7OMvqZp7fHXOd/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736928856; c=relaxed/simple;
	bh=jas7kGxdejQkbc9lYmi3Md8pxjWYwZvZ3Daw1n3v5qE=;
	h=Subject:References:CC:To:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=uiWl56Nvp2fdVeK4TPqIU5hBC5H8T6SvFlMYUbZi9L+rryARF64Yj4PxBrB63UlF9kcNRwU9WNGvhLf3gsO2xENHBZ3CFIOMeVsb9iIhX7UAGk8veY+BagnfqW/LjApBVXbB0CRKTNeTZG/nA7jLtViZmvw+9J3eL866qqpZvoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4YXzGD3Hw2z2Dkbq;
	Wed, 15 Jan 2025 16:11:00 +0800 (CST)
Received: from kwepemh100016.china.huawei.com (unknown [7.202.181.102])
	by mail.maildlp.com (Postfix) with ESMTPS id 9E9FF1A016C;
	Wed, 15 Jan 2025 16:14:10 +0800 (CST)
Received: from [10.174.179.93] (10.174.179.93) by
 kwepemh100016.china.huawei.com (7.202.181.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 15 Jan 2025 16:14:09 +0800
Subject: Re: [sysctl:sysctl-testing 8/16] mm/nommu.c:394:12: error: static
 declaration of 'sysctl_nr_trim_pages' follows non-static declaration
References: <202501150216.3RVz44uS-lkp@intel.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, Joel Granados
	<joel.granados@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Joel Granados <joel.granados@kernel.org>
From: yukaixiong <yukaixiong@huawei.com>
Message-ID: <34e7c573-8af8-dab9-d435-ffa50e9efea2@huawei.com>
Date: Wed, 15 Jan 2025 16:14:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202501150216.3RVz44uS-lkp@intel.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggpeml500001.china.huawei.com (7.185.36.227) To
 kwepemh100016.china.huawei.com (7.202.181.102)



On 2025/1/15 2:39, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sysctl/sysctl.git sysctl-testing
> head:   2fc99f285719e0cce8df1fe21479cb9e6626c2fe
> commit: 0450345eca3ca45264db9ab09d31281e001236b7 [8/16] mm: nommu: move sysctl to mm/nommu.c
> config: arm-randconfig-001-20250115 (https://download.01.org/0day-ci/archive/20250115/202501150216.3RVz44uS-lkp@intel.com/config)
> compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250115/202501150216.3RVz44uS-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501150216.3RVz44uS-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> mm/nommu.c:394:12: error: static declaration of 'sysctl_nr_trim_pages' follows non-static declaration
>     static int sysctl_nr_trim_pages = CONFIG_NOMMU_INITIAL_TRIM_EXCESS;
>                ^
>     include/linux/mm.h:4082:12: note: previous declaration is here
>     extern int sysctl_nr_trim_pages;
>                ^
>     1 error generated.
Help me!

Hi all;

         I have deleted the line : "extern int sysctl_nr_trim_pages;" in 
patch8 of v5. Why still produce this error? I don't understand!

Due to the environment configuration of the server, I have not installed 
the necessary setup for compilation and testing as mentioned in
download.01.org/0day-ci/archive/20250115/202501150216.3RVz44uS-lkp@intel.com/reproduce. 
But I compile the code with the config
as same as 
https://download.01.org/0day-ci/archive/20250115/202501150216.3RVz44uS-lkp@intel.com/config, 
and didn't find the error.

my environment as shown as below:
Linux ubuntu-2288H 5.13.0-40-generic #45~20.04.1-Ubuntu SMP Mon Apr 4 
09:38:31 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux

The compile steps as below:

1. export ARCH=arm;export CROSS_COMPILE=arm-linux-gnueabihf-
2. cp ../stm32_config.log ./.config
3. make ARCH=arm olddefconfig
4. make -j200

the content of stm32_config.log is same as 
https://download.01.org/0day-ci/archive/20250115/202501150216.3RVz44uS-lkp@intel.com/config.
no error as shown above. the compile result as  below shown:

yukaixiong@ubuntu-2288H:~/linux_next/linux-next$ file arch/arm/boot/zImage
arch/arm/boot/zImage: Linux kernel ARM boot executable zImage 
(little-endian)
yukaixiong@ubuntu-2288H:~/linux_next/linux-next$ file ./mm/nommu.o
./mm/nommu.o: ELF 32-bit LSB relocatable, ARM, EABI5 version 1 (SYSV), 
with debug_info, not stripped

Can you tell me the reason for the error? It would be best if you could 
directly tell me how to fix it.
Can I fix this error by "git send-email -in-reply-to xxxxx" so that I 
don't need to send a new version?

Thank you so much!
>
> vim +/sysctl_nr_trim_pages +394 mm/nommu.c
>
>     393	
>   > 394	static int sysctl_nr_trim_pages = CONFIG_NOMMU_INITIAL_TRIM_EXCESS;
>     395	
>

