Received: from dggsgout12.his.huawei.com (unknown [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBC018C1C
	for <llvm@lists.linux.dev>; Thu, 21 Sep 2023 12:31:18 +0000 (UTC)
Received: from mail02.huawei.com (unknown [172.30.67.143])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4RrvVL5QH4z4f4Pk2
	for <llvm@lists.linux.dev>; Thu, 21 Sep 2023 20:15:06 +0800 (CST)
Received: from [10.174.178.55] (unknown [10.174.178.55])
	by APP4 (Coremail) with SMTP id gCh0CgCHHt7IMwxl99sdBA--.15172S3;
	Thu, 21 Sep 2023 20:15:06 +0800 (CST)
Subject: Re: [PATCH] kallsyms: Fix kallsyms_selftest failure
To: Petr Mladek <pmladek@suse.com>
Cc: Yonghong Song <yonghong.song@linux.dev>, Kees Cook
 <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Song Liu <song@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Fangrui Song <maskray@google.com>, kernel-team@fb.com,
 Leizhen <thunder.leizhen@huawei.com>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, kernel test robot <oliver.sang@intel.com>,
 live-patching@vger.kernel.org
References: <20230825034659.1037627-1-yonghong.song@linux.dev>
 <95a7d98c-b227-7929-b833-f6adc3b7e3ca@huaweicloud.com>
 <ZQwb3NiOEkqHtrnD@alley>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huaweicloud.com>
Message-ID: <174a8093-0739-a502-8cf7-f5996a740f5a@huaweicloud.com>
Date: Thu, 21 Sep 2023 20:15:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZQwb3NiOEkqHtrnD@alley>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:gCh0CgCHHt7IMwxl99sdBA--.15172S3
X-Coremail-Antispam: 1UD129KBjvJXoW3Jr47KF4xGw4ktr43AF4UCFg_yoWxGFW3pr
	WrAFsFkF48AryF9a4qqay0qFy2krs7Xr18W3s0ka4kuFyDZFyktrn7Kw4fu34DZr409FW0
	qanYyFy2qF18AFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IE
	e2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
	Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q
	6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
	kF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE
	14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf
	9x07UWE__UUUUU=
X-CM-SenderInfo: hwkx0vthuozvpl2kv046kxt4xhlfz01xgou0bp/
X-CFilter-Loop: Reflected



On 2023/9/21 18:33, Petr Mladek wrote:
> Adding live-patching list into Cc.
> 
> On Fri 2023-08-25 15:19:10, Leizhen (ThunderTown) wrote:
>> On 2023/8/25 11:46, Yonghong Song wrote:
>>> Kernel test robot reported a kallsyms_test failure when clang lto is
>>> enabled (thin or full) and CONFIG_KALLSYMS_SELFTEST is also enabled.
>>> I can reproduce in my local environment with the following error message
>>> with thin lto:
>>>   [    1.877897] kallsyms_selftest: Test for 1750th symbol failed: (tsc_cs_mark_unstable) addr=ffffffff81038090
>>>   [    1.877901] kallsyms_selftest: abort
>>>
>>> It appears that commit 8cc32a9bbf29 ("kallsyms: strip LTO-only suffixes
>>> from promoted global functions") caused the failure. Commit 8cc32a9bbf29
>>> changed cleanup_symbol_name() based on ".llvm." instead of '.' where
>>> ".llvm." is appended to a before-lto-optimization local symbol name.
>>> We need to propagate such knowledge in kallsyms_selftest.c as well.
>>>
>>> Further more, compare_symbol_name() in kallsyms.c needs change as well.
>>> In scripts/kallsyms.c, kallsyms_names and kallsyms_seqs_of_names are used
>>> to record symbol names themselves and index to symbol names respectively.
>>> For example:
>>>   kallsyms_names:
>>>     ...
>>>     __amd_smn_rw._entry       <== seq 1000
>>>     __amd_smn_rw._entry.5     <== seq 1001
>>>     __amd_smn_rw.llvm.<hash>  <== seq 1002
>>>     ...
>>>
>>> kallsyms_seqs_of_names are sorted based on cleanup_symbol_name() through, so
>>> the order in kallsyms_seqs_of_names actually has
>>>
>>>   index 1000:   seq 1002   <== __amd_smn_rw.llvm.<hash> (actual symbol comparison using '__amd_smn_rw')
>>>   index 1001:   seq 1000   <== __amd_smn_rw._entry
>>>   index 1002:   seq 1001   <== __amd_smn_rw._entry.5
>>>
>>> Let us say at a particular point, at index 1000, symbol '__amd_smn_rw.llvm.<hash>'
>>> is comparing to '__amd_smn_rw._entry' where '__amd_smn_rw._entry' is the one to
>>> search e.g., with function kallsyms_on_each_match_symbol(). The current implementation
>>> will find out '__amd_smn_rw._entry' is less than '__amd_smn_rw.llvm.<hash>' and
>>> then continue to search e.g., index 999 and never found a match although the actual
>>> index 1001 is a match.
>>>
>>> To fix this issue, let us do cleanup_symbol_name() first and then do comparison.
>>> In the above case, comparing '__amd_smn_rw' vs '__amd_smn_rw._entry' and
>>> '__amd_smn_rw._entry' being greater than '__amd_smn_rw', the next comparison will
>>> be > index 1000 and eventually index 1001 will be hit an a match is found.
>>>
>>> For any symbols not having '.llvm.' substr, there is no functionality change
>>> for compare_symbol_name().
>>
>> Reviewed-by: Zhen Lei <thunder.leizhen@huawei.com>
>>
>>>
>>> Fixes: 8cc32a9bbf29 ("kallsyms: strip LTO-only suffixes from promoted global functions")
>>> Reported-by: kernel test robot <oliver.sang@intel.com>
>>> Closes: https://lore.kernel.org/oe-lkp/202308232200.1c932a90-oliver.sang@intel.com
>>> Signed-off-by: Yonghong Song <yonghong.song@linux.dev>
>>> ---
>>>  kernel/kallsyms.c          | 17 +++++++----------
>>>  kernel/kallsyms_selftest.c | 23 +----------------------
>>>  2 files changed, 8 insertions(+), 32 deletions(-)
>>>
>>> diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
>>> index 016d997131d4..e12d26c10dba 100644
>>> --- a/kernel/kallsyms.c
>>> +++ b/kernel/kallsyms.c
>>> @@ -188,16 +188,13 @@ static bool cleanup_symbol_name(char *s)
>>>  
>>>  static int compare_symbol_name(const char *name, char *namebuf)
>>>  {
>>> -	int ret;
>>> -
>>> -	ret = strcmp(name, namebuf);
>>> -	if (!ret)
>>> -		return ret;
>>> -
>>> -	if (cleanup_symbol_name(namebuf) && !strcmp(name, namebuf))
>>> -		return 0;
>>> -
>>> -	return ret;
>>> +	/* The kallsyms_seqs_of_names is sorted based on names after
>>> +	 * cleanup_symbol_name() (see scripts/kallsyms.c) if clang lto is enabled.
>>> +	 * To ensure correct bisection in kallsyms_lookup_names(), do
>>> +	 * cleanup_symbol_name(namebuf) before comparing name and namebuf.
>>> +	 */
>>> +	cleanup_symbol_name(namebuf);
>>> +	return strcmp(name, namebuf);
>>>  }
> 
> Hmm, I think that this is not the right fix.
> 
> The problem is that compare_symbol_name() does not longer allow
> to match the full name of the extra .llwm. symbols.
> 
> I think that the problem is that the problem is that the symbols
> are sorted using cleanup_symbol_name(). They should be sorted
> by using the full name.
> 
> Note that the original compare_symbol_name() returned return value
> when comparing the non-stripped name. It will work correctly when
> the non-stripped names are sorted.
> 
> I believe that the correct fix is:
> 
> diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> index 653b92f6d4c8..da1f8ae68999 100644
> --- a/scripts/kallsyms.c
> +++ b/scripts/kallsyms.c
> @@ -339,25 +339,6 @@ static int symbol_absolute(const struct sym_entry *s)
>  	return s->percpu_absolute;
>  }
>  
> -static void cleanup_symbol_name(char *s)
> -{
> -	char *p;
> -
> -	/*
> -	 * ASCII[.]   = 2e
> -	 * ASCII[0-9] = 30,39
> -	 * ASCII[A-Z] = 41,5a
> -	 * ASCII[_]   = 5f
> -	 * ASCII[a-z] = 61,7a
> -	 *
> -	 * As above, replacing the first '.' in ".llvm." with '\0' does not
> -	 * affect the main sorting, but it helps us with subsorting.
> -	 */
> -	p = strstr(s, ".llvm.");
> -	if (p)
> -		*p = '\0';
> -}
> -
>  static int compare_names(const void *a, const void *b)
>  {
>  	int ret;
> @@ -533,10 +514,6 @@ static void write_src(void)
>  		printf("\n");
>  	}
>  
> -	if (lto_clang)
> -		for (i = 0; i < table_cnt; i++)
> -			cleanup_symbol_name((char *)table[i]->sym);
> -
>  	sort_symbols_by_name();
>  	output_label("kallsyms_seqs_of_names");
>  	for (i = 0; i < table_cnt; i++)
> 
> 
> Unfortunately, I could not check it easily because I do not have any
> experience with building kernel with C-lang.

make CC=clang distclean defconfig
make CC=clang -j64 2>err.txt

make LLVM=1 LLVM_IAS=1 distclean defconfig
scripts/config -e LTO_CLANG_THIN
scripts/config -e KALLSYMS_SELFTEST
make LLVM=1 LLVM_IAS=1 -j64

> 
> Anyway, what do you think, please?

I'm busy these days. There's a lot of things before the holiday.
I'll think about it over the holidays.

> 
> Best Regards,
> Petr
> .
> 

-- 
Regards,
  Zhen Lei

