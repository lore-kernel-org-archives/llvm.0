Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD611D5AC2;
	Thu, 10 Apr 2025 06:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744266893; cv=none; b=t4MTr7vdwzH1UoFIfA20SYhJc1VqojfQE4GDQHAelyRET+yUHK+OId9WLC82n56R3oBKTsF2JkGMcQn8Zn1RVxyhycwTiAc5Vpi6Dn/a2EyD/jDuPrrdc57YW+ozGIu8WsymBjl9i9x838emMXh7+MOgVJapQ8rAoQoJHAmtqEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744266893; c=relaxed/simple;
	bh=My3z+0t3joOxDMV4JLHvK8HA30dSj487+eYcSeIpeLA=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=go/HHRsw+LhNyYv7IkpsbLryvPC/BVVkM1PSyb7+wEt8c/w3ahObXh0zBlkocihgc0AP273ptohK8RIrOqQ+MQ5Mmn/+X6rw6w8FC9G9rmNxvfkUbyU2qbuA4hQD6NImXrjaDuFbEJBx5cqCSLU5/NcBHfLMRg9PZE6xrxmhi10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4ZY95M056rz4f3jXp;
	Thu, 10 Apr 2025 14:34:15 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 7C3B31A0DAD;
	Thu, 10 Apr 2025 14:34:38 +0800 (CST)
Received: from [10.174.178.129] (unknown [10.174.178.129])
	by APP4 (Coremail) with SMTP id gCh0CgA3nGBwZvdn20kuJA--.36687S2;
	Thu, 10 Apr 2025 14:34:38 +0800 (CST)
Subject: Re: [linux-next:master 1753/1936] mm/swapfile.c:1517:20: warning:
 function 'swap_is_last_ref' is not needed and will not be emitted
To: Andrew Morton <akpm@linux-foundation.org>, SeongJae Park <sj@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Tim Chen <tim.c.chen@linux.intel.com>, Baoquan He <bhe@redhat.com>
References: <20250408173959.f501f65ec5d5e52cefe6b129@linux-foundation.org>
 <20250409165452.305371-1-sj@kernel.org>
 <20250409174233.b3703db45767fbe5b9cd3b5b@linux-foundation.org>
From: Kemeng Shi <shikemeng@huaweicloud.com>
Message-ID: <8d237c70-5aac-924f-a8a3-31c6ef11a25e@huaweicloud.com>
Date: Thu, 10 Apr 2025 14:34:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250409174233.b3703db45767fbe5b9cd3b5b@linux-foundation.org>
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:gCh0CgA3nGBwZvdn20kuJA--.36687S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYx7kC6x804xWl14x267AKxVW8JVW5JwAF
	c2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII
	0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xv
	wVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7
	xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
	FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
	0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxv
	r21l42xK82IYc2Ij64vIr41l4c8EcI0Ec7CjxVAaw2AFwI0_JF0_Jw1l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIda
	VFxhVjvjDU0xZFpf9x07UWE__UUUUU=
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/



on 4/10/2025 8:42 AM, Andrew Morton wrote:
> On Wed,  9 Apr 2025 09:54:52 -0700 SeongJae Park <sj@kernel.org> wrote:
> 
>>> I'll add this:
>>>
>>
>> ...
>>
>> This makes my build fails when CONFIG_DEBUG_VM is unset as below.
> 
> Uh, OK.  I'll leave this to Kemeng to address, please.
> 
Sure. Thanks to Baoquan and SeongJae for providing the solution and
testing it. I will address build warning by adding __maybe_unused
as Baoquan menthioned and update confusion comment before
swap_is_last_ref().

Thanks,
Kemeng

