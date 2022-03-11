Received: from out30-43.freemail.mail.aliyun.com (out30-43.freemail.mail.aliyun.com [115.124.30.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5E17E
	for <llvm@lists.linux.dev>; Fri, 11 Mar 2022 02:46:40 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=ashimida@linux.alibaba.com;NM=1;PH=DS;RN=23;SR=0;TI=SMTPD_---0V6rDYwB_1646966789;
Received: from 192.168.193.160(mailfrom:ashimida@linux.alibaba.com fp:SMTPD_---0V6rDYwB_1646966789)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 11 Mar 2022 10:46:30 +0800
Message-ID: <fc2fa0a9-eae8-edc4-f86f-b9056d93ee12@linux.alibaba.com>
Date: Thu, 10 Mar 2022 18:46:29 -0800
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
 <92a767c4-09e1-8783-2581-9848bb72890d@linux.alibaba.com>
 <202203091211.4F00F560@keescook>
From: Dan Li <ashimida@linux.alibaba.com>
In-Reply-To: <202203091211.4F00F560@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/9/22 12:16, Kees Cook wrote:
> On Mon, Mar 07, 2022 at 07:16:36AM -0800, Dan Li wrote:
>> But currently it still crashes when I try to enable
>> "-mbranch-protection=pac-ret+leaf+bti".
>>
>> Because the address of "&&redirected" is not encrypted under pac,
>> the autiasp check will fail when set_return_addr returns, and
>> eventually cause the function to crash when it returns to "&&redirected"
>> ("&&redirected" as a reserved label always seems to start with a bti j
>> insn).
> 
> Strictly speaking, this is entirely correct. :)
> 
>> For lkdtm, if we're going to handle both cases in one function, maybe
>> it would be better to turn off the -mbranch-protection=pac-ret+leaf+bti
>> and maybe also turn off -O2 options for the function :)
> 
> If we can apply a function attribute to turn off pac for the "does this
> work without protections", that should be sufficient.
> 

Got it, will do in the next version :)

Thanks,
Dan.
