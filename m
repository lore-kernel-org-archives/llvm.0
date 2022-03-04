Received: from out30-54.freemail.mail.aliyun.com (out30-54.freemail.mail.aliyun.com [115.124.30.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC132C7C
	for <llvm@lists.linux.dev>; Fri,  4 Mar 2022 14:59:56 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R231e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=ashimida@linux.alibaba.com;NM=1;PH=DS;RN=23;SR=0;TI=SMTPD_---0V6CkHJB_1646405664;
Received: from 192.168.193.155(mailfrom:ashimida@linux.alibaba.com fp:SMTPD_---0V6CkHJB_1646405664)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 04 Mar 2022 22:54:25 +0800
Message-ID: <c26c8946-f979-de83-38ff-ab6533b55885@linux.alibaba.com>
Date: Fri, 4 Mar 2022 06:54:23 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 2/2] lkdtm: Add Shadow Call Stack tests
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>
Cc: akpm@linux-foundation.org, arnd@arndb.de, catalin.marinas@arm.com,
 gregkh@linuxfoundation.org, linux@roeck-us.net, luc.vanoostenryck@gmail.com,
 elver@google.com, mark.rutland@arm.com, masahiroy@kernel.org,
 ojeda@kernel.org, nathan@kernel.org, npiggin@gmail.com,
 ndesaulniers@google.com, samitolvanen@google.com, shuah@kernel.org,
 tglx@linutronix.de, will@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 llvm@lists.linux.dev, linux-hardening@vger.kernel.org
References: <20220303073340.86008-1-ashimida@linux.alibaba.com>
 <20220303074339.86337-1-ashimida@linux.alibaba.com>
 <202203031010.0A492D114@keescook> <202203031105.A1B4CAE6@keescook>
From: Dan Li <ashimida@linux.alibaba.com>
In-Reply-To: <202203031105.A1B4CAE6@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/3/22 11:09, Kees Cook wrote:
> On Thu, Mar 03, 2022 at 10:42:45AM -0800, Kees Cook wrote:
>> Though, having the IS_ENABLED in there makes me wonder if this test
>> should instead be made _survivable_ on failure. Something like this,
>> completely untested:
>>
>>
>> And we should, actually, be able to make the "set_lr" functions be
>> arch-specific, leaving the test itself arch-agnostic....
> 
> Yeah, as a tested example, this works for x86_64, and based on what you
> had, I'd expect it to work on arm64 too:
> 
> #include <stdio.h>
> 
> static __attribute__((noinline))
> void set_return_addr(unsigned long *expected, unsigned long *addr)
> {
>      /* Use of volatile is to make sure final write isn't seen as a dead store. */
>      unsigned long * volatile *ret_addr = (unsigned long **)__builtin_frame_address(0) + 1;
> 
>      /* Make sure we've found the right place on the stack before writing it. */
>      if (*ret_addr == expected)
>          *ret_addr = addr;
> }
> 
> volatile int force_label;
> int main(void)
> {
>      do {
>          /* Keep labels in scope. */
>          if (force_label)
>              goto normal;
>          if (force_label)
>              goto redirected;
> 
>          set_return_addr(&&normal, &&redirected);
> normal:
>          printf("I should be skipped\n");
>          break;

 From the assembly code, it seems that "&&normal" does't always equal
to the address of label "normal" when we use clang with -O2.

> redirected:
>          printf("Redirected\n");
>      } while (0);
>

The address of "&&redirected" may appear in the middle of the assembly
instructions of the printf. If we unconditionally jump to "&&normal",
it may crash directly because x0 is not set correctly.

>      return 0;
> }
> 
> 
> It does _not_ work under Clang, though, which I'm still looking at.
> 

AFAICT, maybe we could specify -O0 optimization to bypass this.


BTW:
Occasionally found, the following code works correctly, but i think
it doesn't solve the issue :)

#include <stdio.h>

static __attribute__((noinline))
void set_return_addr(unsigned long *expected, unsigned long *addr)
{
     /* Use of volatile is to make sure final write isn't seen as a dead store. */
     unsigned long * volatile *ret_addr = (unsigned long **)__builtin_frame_address(0) + 1;

     /* Make sure we've found the right place on the stack before writing it. */
//    if (*ret_addr == expected)
         *ret_addr = addr;
}
volatile int force_label;
int main(void)
{
     do {
         /* Keep labels in scope. */
         if (force_label)
             goto normal;
         if (force_label)
             goto redirected;

         set_return_addr(&&normal, &&redirected);
normal:
         printf("I should be skipped\n");
         break;

redirected:
         printf("Redirected\n");
         printf("\n");				//add a new printf
     } while (0);

     return 0;
}
