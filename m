Received: from out-249.mta0.migadu.com (out-249.mta0.migadu.com [91.218.175.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71391938B
	for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 20:04:49 +0000 (UTC)
Message-ID: <7b87a1b5-238c-bbe2-ab6f-c0c5d643c18f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1692993887; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hcuN4Dty1PG3JjOON7u0fm7QJOO/fLICXqHfu1XOFMI=;
	b=rw5/nVmDcC3O45WjJjFwgsaDtmOjvi0seuFc38DHzYAhKdgydwjjoc9WWtlU+bgV2ddjB6
	qP8tMGK6YccAct06fPomyaMTYB9yeCaGBaJ4LrZ0lEX3ilu/OKjDrjC5gyXIFgdMXfRbGA
	nbPLpwkV+01n9isdta98mvf47mmoC2k=
Date: Fri, 25 Aug 2023 13:04:39 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Reply-To: yonghong.song@linux.dev
Subject: Re: [PATCH] kallsyms: Fix kallsyms_selftest failure
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 Nick Desaulniers <ndesaulniers@google.com>
Cc: Petr Mladek <pmladek@suse.com>, Song Liu <song@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Fangrui Song <maskray@google.com>,
 kernel-team@fb.com, Leizhen <thunder.leizhen@huawei.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 kernel test robot <oliver.sang@intel.com>
References: <20230825034659.1037627-1-yonghong.song@linux.dev>
 <CAKwvOdk7knYxOzaeq4gWjTiy=zRk4wc1jgq0d6fyFS5x43Cv9g@mail.gmail.com>
 <202308251258.C6770EAA9@keescook>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <202308251258.C6770EAA9@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 8/25/23 12:59 PM, Kees Cook wrote:
> On Fri, Aug 25, 2023 at 10:51:58AM -0700, Nick Desaulniers wrote:
>> On Thu, Aug 24, 2023 at 8:49 PM Yonghong Song <yonghong.song@linux.dev> wrote:
>>>
>>> diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
>>> index 016d997131d4..e12d26c10dba 100644
>>> --- a/kernel/kallsyms.c
>>> +++ b/kernel/kallsyms.c
>>> @@ -188,16 +188,13 @@ static bool cleanup_symbol_name(char *s)
>>>
>>>   static int compare_symbol_name(const char *name, char *namebuf)
>>>   {
>>> -       int ret;
>>> -
>>> -       ret = strcmp(name, namebuf);
>>> -       if (!ret)
>>> -               return ret;
>>> -
>>> -       if (cleanup_symbol_name(namebuf) && !strcmp(name, namebuf))
>>> -               return 0;
>>> -
>>> -       return ret;
>>> +       /* The kallsyms_seqs_of_names is sorted based on names after
>>> +        * cleanup_symbol_name() (see scripts/kallsyms.c) if clang lto is enabled.
>>> +        * To ensure correct bisection in kallsyms_lookup_names(), do
>>> +        * cleanup_symbol_name(namebuf) before comparing name and namebuf.
>>> +        */
>>> +       cleanup_symbol_name(namebuf);
>>
>> Hi Yonghong,
>> Thanks for your work on this patch.
>> So if this change is removing the last place where the return value of
>> cleanup_symbol_name is checked, then perhaps this commit should
>> additionally change the function signature of cleanup_symbol_name to
>> have `void` return type.
> 
> I've landed this in -next as-is just because I want to make sure the bug
> gets fixed ASAP, so if this gets adjusted, I can just include that
> change on top.

Thanks, Kees! I can provide a followup soon.
