Received: from out30-44.freemail.mail.aliyun.com (out30-44.freemail.mail.aliyun.com [115.124.30.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508317B
	for <llvm@lists.linux.dev>; Wed, 23 Feb 2022 09:06:00 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R931e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04426;MF=ashimida@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0V5HHvjC_1645606221;
Received: from 192.168.193.152(mailfrom:ashimida@linux.alibaba.com fp:SMTPD_---0V5HHvjC_1645606221)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 23 Feb 2022 16:50:22 +0800
Message-ID: <69d351c6-a69d-6ebb-53bc-b46dfe4da08a@linux.alibaba.com>
Date: Wed, 23 Feb 2022 00:50:21 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] [PATCH] AARCH64: Add gcc Shadow Call Stack support
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, ndesaulniers@google.com,
 keescook@chromium.org, masahiroy@kernel.org, tglx@linutronix.de,
 akpm@linux-foundation.org, mark.rutland@arm.com, samitolvanen@google.com,
 npiggin@gmail.com, linux@roeck-us.net, mhiramat@kernel.org,
 ojeda@kernel.org, luc.vanoostenryck@gmail.com, elver@google.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 llvm@lists.linux.dev, linux-hardening@vger.kernel.org
References: <20220222095736.24898-1-ashimida@linux.alibaba.com>
 <YhUMRoLDan7tJRiL@dev-arch.archlinux-ax161>
From: Dan Li <ashimida@linux.alibaba.com>
In-Reply-To: <YhUMRoLDan7tJRiL@dev-arch.archlinux-ax161>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/22/22 08:16, Nathan Chancellor wrote:
> On Tue, Feb 22, 2022 at 01:57:36AM -0800, Dan Li wrote:
>> Shadow call stack is available in GCC > 11.2.0, this patch makes
>> the corresponding kernel configuration available when compiling
>> the kernel with gcc.
>>   config SHADOW_CALL_STACK
>> -	bool "Clang Shadow Call Stack"
>> -	depends on CC_IS_CLANG && ARCH_SUPPORTS_SHADOW_CALL_STACK
>> +	bool "Shadow Call Stack"
>> +	depends on ARCH_SUPPORTS_SHADOW_CALL_STACK
>>   	depends on DYNAMIC_FTRACE_WITH_REGS || !FUNCTION_GRAPH_TRACER
>>   	help
>> -	  This option enables Clang's Shadow Call Stack, which uses a
>> +	  This option enables Clang/GCC's Shadow Call Stack, which uses a
> 
> I wonder if we want to just ditch the mention of the compiler if both
> support it?
> 

My intention is to remind users that this is a compiler feature.
But since there is also a hint in CC_HAVE_SHADOW_CALL_STACK:
+# Supported by clang >= 7.0 or GCC ...

Removing the specific compiler here also looks fine to me.
Would this look better?

"This option enables Shadow Call Stack, which uses a ..."

or maybe:

"This option enables compiler's Shadow Call Stack, which uses a ..."

>>   	  shadow stack to protect function return addresses from being
>>   	  overwritten by an attacker. More information can be found in
>>   	  Clang's documentation:
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index 09b885cc4db5..a48a604301aa 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -1255,7 +1255,7 @@ config HW_PERF_EVENTS
>>   config ARCH_HAS_FILTER_PGPROT
>>   	def_bool y
>>   
>> -# Supported by clang >= 7.0
>> +# Supported by clang >= 7.0 or GCC > 11.2.0
> 
> Same thing here, although eventually there may be a minimum GCC version
> bump to something newer than 11.2.0, which would allow us to just drop
> CONFIG_CC_HAVE_SHADOW_CALL_STACK altogether. No strong opinion.
> 

As Guenter said, I thought maybe we could mark the minimum available
version for users :)

Thanks,
Dan.

