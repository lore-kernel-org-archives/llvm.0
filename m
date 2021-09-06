Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3495172
	for <llvm@lists.linux.dev>; Mon,  6 Sep 2021 18:46:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 698D06103C;
	Mon,  6 Sep 2021 18:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630954017;
	bh=zisaWbqqpGZ0wJmqZifUDVA1T5K6vpZ+x87rw+yc3jw=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=XrXAZ688983y7H+REwEZFvY9DDo4IC3ESBbIy+kC6FZml0Jk5QIBvsQacWYSsDHbS
	 g0CaNBnwoVKfJsoO2/26iRzZMK66+yJVkb0CxHsFqIDnlN1fTAUUf8/MVC075ayNaQ
	 2XKiG7oR/8yLmNBYsa/1j20Lstr/Vy18uVtxlTA7+qNpjNbqZT7gHkTuI9oJZvv/KY
	 So9vFoCl0PHb3XduhFpqPKQlYeqcWrNm0QZvcTqhcI5uVjehXN17dix3CcP8yp6d5/
	 MC4jYo+UdOd4IRpu0dnwNUPKAR5i6jlEY8sQKvNpEyZVD9R3xtBfVXGT4iJcLlbQml
	 Y/S3j22y1bU+A==
Subject: Re: [linux-next:master 10023/11721]
 include/linux/memory_hotplug.h:312:26: warning: unused parameter 'group'
To: David Hildenbrand <david@redhat.com>, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <202109061139.7rjMTWLn-lkp@intel.com>
 <8e405e43-c5f0-d58b-e38a-fe19f97c3333@redhat.com>
From: Nathan Chancellor <nathan@kernel.org>
Message-ID: <ece61908-f8eb-4c45-5d5f-bfc52f3b8f45@kernel.org>
Date: Mon, 6 Sep 2021 11:46:56 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <8e405e43-c5f0-d58b-e38a-fe19f97c3333@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/6/2021 3:35 AM, David Hildenbrand wrote:
>>     include/linux/memory_hotplug.h:311:47: warning: unused parameter 
>> 'start_pfn' [-Wunused-parameter]
>>     static inline int offline_pages(unsigned long start_pfn, unsigned 
>> long nr_pages,
>>                                                   ^
>>     include/linux/memory_hotplug.h:311:72: warning: unused parameter 
>> 'nr_pages' [-Wunused-parameter]
>>     static inline int offline_pages(unsigned long start_pfn, unsigned 
>> long nr_pages,
>>                                                                            
>> ^
>>>> include/linux/memory_hotplug.h:312:26: warning: unused parameter 
>>>> 'group' [-Wunused-parameter]
>>                                     struct memory_group *group)
> 
> What a bunch of useless warnings ...
> 
> Nothing to fix here.

Sorry for the noise, it is a known issue with this randconfig :/

https://lore.kernel.org/r/YSQE2f5teuvKLkON@Ryzen-9-3900X.localdomain/
https://lore.kernel.org/r/20210824022640.2170859-1-nathan@kernel.org/

Cheers,
Nathan
