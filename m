Received: from out199-6.us.a.mail.aliyun.com (out199-6.us.a.mail.aliyun.com [47.90.199.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA4A7B
	for <llvm@lists.linux.dev>; Wed, 23 Feb 2022 08:58:19 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04357;MF=ashimida@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0V5Hmy0a_1645606685;
Received: from 192.168.193.152(mailfrom:ashimida@linux.alibaba.com fp:SMTPD_---0V5Hmy0a_1645606685)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 23 Feb 2022 16:58:06 +0800
Message-ID: <887572c7-b508-ca51-6cd5-54a2c9ecaa75@linux.alibaba.com>
Date: Wed, 23 Feb 2022 00:58:05 -0800
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
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Kees Cook
 <keescook@chromium.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mark Rutland <mark.rutland@arm.com>, Sami Tolvanen
 <samitolvanen@google.com>, Nicholas Piggin <npiggin@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 Marco Elver <elver@google.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20220222095736.24898-1-ashimida@linux.alibaba.com>
 <YhUMRoLDan7tJRiL@dev-arch.archlinux-ax161>
 <f44612ce-5bb1-da45-d6cb-39464898c4ff@roeck-us.net>
 <CANiq72nhu+CtYYNfWLYxf19OscoEEZj=TATM0SHNU8ic1iDhyQ@mail.gmail.com>
From: Dan Li <ashimida@linux.alibaba.com>
In-Reply-To: <CANiq72nhu+CtYYNfWLYxf19OscoEEZj=TATM0SHNU8ic1iDhyQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/22/22 08:59, Miguel Ojeda wrote:
> On Tue, Feb 22, 2022 at 5:48 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> The point here, I think, is to list the minimum gcc version.
>> It is going to be a long time until gcc 12.0 is the minimum version,
>> so I think it makes sense to list the minimum version number for
>> each compiler here.
> 
> Yeah, please list the minimum version (ideally `>=` instead of `>`,
> with the actual version where it first appeared). It makes it easy to
> then remove things that are not needed anymore when the minimum GCC
> version is upgraded.
> 

Got it, I'll use "gcc >= 12.0.0" in the next patch.

Thanks,
Dan.
