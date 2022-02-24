Received: from www.kot-begemot.co.uk (ivanoab7.miniserver.com [37.128.132.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F40139D
	for <llvm@lists.linux.dev>; Thu, 24 Feb 2022 09:21:08 +0000 (UTC)
Received: from [192.168.18.6] (helo=jain.kot-begemot.co.uk)
	by www.kot-begemot.co.uk with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <anton.ivanov@cambridgegreys.com>)
	id 1nN9jO-0000IH-RI; Thu, 24 Feb 2022 08:44:14 +0000
Received: from jain.kot-begemot.co.uk ([192.168.3.3])
	by jain.kot-begemot.co.uk with esmtp (Exim 4.94.2)
	(envelope-from <anton.ivanov@cambridgegreys.com>)
	id 1nN9jK-008vBi-MW; Thu, 24 Feb 2022 08:44:09 +0000
Subject: Re: [PATCH] um: Remove unused timeval_to_ns() function
To: David Gow <davidgow@google.com>, Jeff Dike <jdike@addtoit.com>,
 Richard Weinberger <richard@nod.at>,
 Nick Desaulniers <ndesaulniers@google.com>, Kees Cook <keescook@chromium.org>
Cc: linux-um@lists.infradead.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220224081233.1765788-1-davidgow@google.com>
From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Message-ID: <78d6ac17-9492-7c41-d6dd-4c92dce8ce62@cambridgegreys.com>
Date: Thu, 24 Feb 2022 08:44:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220224081233.1765788-1-davidgow@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Score: -2.0
X-Spam-Score: -1.0
X-Clacks-Overhead: GNU Terry Pratchett



On 24/02/2022 08:12, David Gow wrote:
> The timeval_to_ns() function doesn't appear to be used anywhere, as far
> as I (or git grep) can tell, and clang throws up a warning about it:
> 
> ../arch/um/os-Linux/time.c:21:25: warning: unused function 'timeval_to_ns' [-Wunused-function]
> static inline long long timeval_to_ns(const struct timeval *tv)

Correct. Leftovers from the days when the timers subsystem was based on itimer_*() instead of POSIX timers.

>                          ^
> 1 warning generated.
> 
> Signed-off-by: David Gow <davidgow@google.com>
> ---
> 
> Warning can be reproduced under clang 13.0.1-+rc1 after applying:
> um: Allow builds with Clang -- https://lkml.org/lkml/2022/2/24/40
> 
>   arch/um/os-Linux/time.c | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/arch/um/os-Linux/time.c b/arch/um/os-Linux/time.c
> index 6c5041c5560b..4d5591d96d8c 100644
> --- a/arch/um/os-Linux/time.c
> +++ b/arch/um/os-Linux/time.c
> @@ -18,12 +18,6 @@
>   
>   static timer_t event_high_res_timer = 0;
>   
> -static inline long long timeval_to_ns(const struct timeval *tv)
> -{
> -	return ((long long) tv->tv_sec * UM_NSEC_PER_SEC) +
> -		tv->tv_usec * UM_NSEC_PER_USEC;
> -}
> -
>   static inline long long timespec_to_ns(const struct timespec *ts)
>   {
>   	return ((long long) ts->tv_sec * UM_NSEC_PER_SEC) + ts->tv_nsec;
> 

Acked-By: Anton Ivanov <anton.ivanov@cambridgegreys.com>

-- 
Anton R. Ivanov
Cambridgegreys Limited. Registered in England. Company Number 10273661
https://www.cambridgegreys.com/
