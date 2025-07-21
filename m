Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB7678F3B;
	Mon, 21 Jul 2025 01:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753060845; cv=none; b=KHPyQ9NnkLDe+QnlwCTRokl9sUhNYxPabP8w5jw4f0+bK1AM9r2/QVgKnmw28yDX/jgxzu5EyNeiBQycMkU2FrUo7I6Td4wBVd8Olm9qpMUSIFWl8uiXi0Kz/0umIJYj+5BAI89hBEMs/uvXuMEraitLDZf9lcKAqA5lHK1cSP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753060845; c=relaxed/simple;
	bh=BNkQIjOZSKu9ZGwc4tHzEhkbq/LUxVSJG18QsLj5xUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m775I5vrPMMSb9P8rBE2MtSub9R9CmkJ77L+zdI0qP9k6eloIu5+r+n7+vZEKXxl+m0/9YglDobaeqAbPaqx+2aDyzL5N8Bk6XwEqckhvCpZC5xmEUNr04D/NeyKxWNwfQR/0JV3Ew4ywm/Xn6egqpngnx0nHojPJVeaLCqph7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4bljJL4ZNGzKHMX3;
	Mon, 21 Jul 2025 09:20:34 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 52C711A0C3D;
	Mon, 21 Jul 2025 09:20:33 +0800 (CST)
Received: from [10.174.176.88] (unknown [10.174.176.88])
	by APP4 (Coremail) with SMTP id gCh0CgDnYhPblX1o4WHSAw--.16917S3;
	Mon, 21 Jul 2025 09:20:29 +0800 (CST)
Message-ID: <b60e4ef2-0128-4e56-a15f-ea85194a3af0@huaweicloud.com>
Date: Mon, 21 Jul 2025 09:20:27 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs: Add additional checks for block devices during mount
To: kernel test robot <lkp@intel.com>, viro@zeniv.linux.org.uk,
 jack@suse.com, brauner@kernel.org, axboe@kernel.dk, hch@lst.de
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 yukuai3@huawei.com, yangerkun@huawei.com
References: <20250719024403.3452285-1-wozizhi@huawei.com>
 <202507192025.N75TF4Gp-lkp@intel.com>
From: Zizhi Wo <wozizhi@huaweicloud.com>
In-Reply-To: <202507192025.N75TF4Gp-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgDnYhPblX1o4WHSAw--.16917S3
X-Coremail-Antispam: 1UD129KBjvJXoW7uFyxuFW8XF15AFy8Ww18Grg_yoW8ZFyDpa
	yrC39xtryrWr1rWa97KrWq9w1Yqws5JwnxGF18Cw47ZFWqvF17WrWI9r43Jryqqr1vgrWU
	Jr9rurykKw1UAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8
	ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU1
	7KsUUUUUU==
X-CM-SenderInfo: pzr2x6tkl6x35dzhxuhorxvhhfrp/



在 2025/7/19 20:32, kernel test robot 写道:
> Hi Zizhi,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on brauner-vfs/vfs.all]
> [also build test ERROR on jack-fs/for_next linus/master v6.16-rc6 next-20250718]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Zizhi-Wo/fs-Add-additional-checks-for-block-devices-during-mount/20250719-105053
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
> patch link:    https://lore.kernel.org/r/20250719024403.3452285-1-wozizhi%40huawei.com
> patch subject: [PATCH] fs: Add additional checks for block devices during mount
> config: i386-buildonly-randconfig-001-20250719 (https://download.01.org/0day-ci/archive/20250719/202507192025.N75TF4Gp-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507192025.N75TF4Gp-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507192025.N75TF4Gp-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> ld.lld: error: undefined symbol: disk_live
>     >>> referenced by super.c:1385 (fs/super.c:1385)
>     >>>               fs/super.o:(super_s_dev_test) in archive vmlinux.a
> 

Sorry, disk_live() is only declared but not defined when CONFIG_BLOCK is
not set...

Perhaps, as hch suggests, it can be verified through GD_DEAD?

Thanks,
Zizhi Wo

