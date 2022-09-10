Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07260EC0
	for <llvm@lists.linux.dev>; Sat, 10 Sep 2022 11:56:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7BF972283E;
	Sat, 10 Sep 2022 11:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1662810986; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yc7+zruoccX/v8RIqknQmogxIBHXvGc140WBauTS49s=;
	b=msfqEDXaWXsSdbv7lakSBc9LyXxyrztz8DXhizlid35cHB2gef880Mze2R7cMPyIJq4Vu8
	QJMYgRRfE/Q2Htwd57+pZsLp5ydopkc4A6pqOAVFZGfxuuoAWC/yXZxSdll3gy6lFkdPGT
	CDd9NlMeEZBF+6Gz9150ieK+pux1JdI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1662810986;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yc7+zruoccX/v8RIqknQmogxIBHXvGc140WBauTS49s=;
	b=YostTkIhqPjXQqa/vGr28+KXQyYTZDKjK46Jne+QYOdcygJd8MwaZEXNvBLkeMSmY9LMaU
	A+aRuoBSP2xXEBCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 63B42133B7;
	Sat, 10 Sep 2022 11:56:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id KWKoF2p7HGOoLQAAMHmgww
	(envelope-from <vbabka@suse.cz>); Sat, 10 Sep 2022 11:56:26 +0000
Message-ID: <5b672980-a590-06cc-56c2-f63a3727d994@suse.cz>
Date: Sat, 10 Sep 2022 13:56:26 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [vbabka-slab:for-6.1/fit_rcu_head 2/2] mm/slab.h:94:1: error:
 static_assert failed due to requirement '((__builtin_offsetof(struct slab,
 counters)) & ((unsigned int)(16) - 1)) == 0' "IS_ALIGNED(offsetof(struct
 slab, counters), 16)"
Content-Language: en-US
To: Hyeonggon Yoo <42.hyeyoo@gmail.com>, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, linux-mm@kvack.org
References: <202209101614.lMCcS0Zj-lkp@intel.com> <YxxL7zWWuWnCtXW4@hyeyoo>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <YxxL7zWWuWnCtXW4@hyeyoo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/10/22 10:33, Hyeonggon Yoo wrote:
> On Sat, Sep 10, 2022 at 04:05:44PM +0800, kernel test robot wrote:
>> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git for-6.1/fit_rcu_head
>> head:   2af0ec317dc8f99f0620af23ff6c288bb6f49be5
>> commit: 2af0ec317dc8f99f0620af23ff6c288bb6f49be5 [2/2] mm/sl[au]b: rearrange struct slab fields to allow larger rcu_head
>> config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220910/202209101614.lMCcS0Zj-lkp@intel.com/config)
>> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
>> reproduce (this is a W=1 build):
>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         # https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git/commit/?id=2af0ec317dc8f99f0620af23ff6c288bb6f49be5
>>         git remote add vbabka-slab git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git
>>         git fetch --no-tags vbabka-slab for-6.1/fit_rcu_head
>>         git checkout 2af0ec317dc8f99f0620af23ff6c288bb6f49be5
>>         # save the config file
>>         mkdir build_dir && cp config build_dir/.config
>>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
>> 
>> If you fix the issue, kindly add following tag where applicable
>> Reported-by: kernel test robot <lkp@intel.com>
>> 
>> All errors (new ones prefixed by >>):
>> 
>>    In file included from mm/mempool.c:21:
>> >> mm/slab.h:94:1: error: static_assert failed due to requirement '((__builtin_offsetof(struct slab, counters)) & ((unsigned int)(16) - 1)) == 0' "IS_ALIGNED(offsetof(struct slab, counters), 16)"
>>    static_assert(IS_ALIGNED(offsetof(struct slab, counters), 16));
>>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>    include/linux/build_bug.h:77:34: note: expanded from macro 'static_assert'
>>    #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>>                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>    include/linux/build_bug.h:78:41: note: expanded from macro '__static_assert'
>>    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>>                                            ^              ~~~~
>>    1 error generated.
>> 
>> 
>> vim +94 mm/slab.h
>> 
>>     90	
>>     91	#undef SLAB_MATCH
>>     92	static_assert(sizeof(struct slab) <= sizeof(struct page));
>>     93	#if defined(CONFIG_HAVE_CMPXCHG_DOUBLE) && defined(CONFIG_SLUB)
>>   > 94	static_assert(IS_ALIGNED(offsetof(struct slab, counters), 16));
>>     95	#endif
>>     96	
> 
> Ah, it should be sizeof(void *) * 2, instead of 16.

Oops, I kinda assumed CMPXCHG_DOUBLE is 64bit only thing.
Wonder why bots didn't catch this in the previous push...

>> -- 
>> 0-DAY CI Kernel Test Service
>> https://01.org/lkp
>> 
> 

