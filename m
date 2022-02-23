Received: from out30-56.freemail.mail.aliyun.com (out30-56.freemail.mail.aliyun.com [115.124.30.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627357B
	for <llvm@lists.linux.dev>; Wed, 23 Feb 2022 08:55:45 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=ashimida@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0V5HULum_1645606540;
Received: from 192.168.193.152(mailfrom:ashimida@linux.alibaba.com fp:SMTPD_---0V5HULum_1645606540)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 23 Feb 2022 16:55:41 +0800
Message-ID: <769ae7ad-e860-722d-59b7-cd7be5f6f1ee@linux.alibaba.com>
Date: Wed, 23 Feb 2022 00:55:40 -0800
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
To: Guenter Roeck <linux@roeck-us.net>, Nathan Chancellor <nathan@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, ndesaulniers@google.com,
 keescook@chromium.org, masahiroy@kernel.org, tglx@linutronix.de,
 akpm@linux-foundation.org, mark.rutland@arm.com, samitolvanen@google.com,
 npiggin@gmail.com, mhiramat@kernel.org, ojeda@kernel.org,
 luc.vanoostenryck@gmail.com, elver@google.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20220222095736.24898-1-ashimida@linux.alibaba.com>
 <YhUMRoLDan7tJRiL@dev-arch.archlinux-ax161>
 <f44612ce-5bb1-da45-d6cb-39464898c4ff@roeck-us.net>
From: Dan Li <ashimida@linux.alibaba.com>
In-Reply-To: <f44612ce-5bb1-da45-d6cb-39464898c4ff@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/22/22 08:47, Guenter Roeck wrote:
> On 2/22/22 08:16, Nathan Chancellor wrote:
>> On Tue, Feb 22, 2022 at 01:57:36AM -0800, Dan Li wrote:
>>> Shadow call stack is available in GCC > 11.2.0, this patch makes
> 
> The above suggests that the option will be available with gcc 11.3.0.
> Information available in public suggests that it will be introduced
> with gcc 12.0.
> 

Ah, yes, I think we could use "gcc >= 12.0.0" here.

> The point here, I think, is to list the minimum gcc version.
> It is going to be a long time until gcc 12.0 is the minimum version,
> so I think it makes sense to list the minimum version number for
> each compiler here.
> 
> However, it may make sense to add some reference indicating that
> support will indeed be added with gcc 11.3.0, and not only starting

I took a quick look at the gcc description, and it seems like the
y in x.y.z is usually used to fix bugs, and new features should be
added directly to the trunk.

Link: https://gcc.gnu.org/develop.html

> with gcc 12.0 (and maybe wait with applying this patch until it is
> actually available in gcc and can be confirmed to work as intended).
> 

It's also fine to wait for gcc 12 to be released, and I thought maybe
I could submit the "final" version of this patch to the community (or
mailing list) first so maybe more people would test it and if there
were any issues, it could be fixed before GCC 12 is released :)

Thanks,
Dan.
