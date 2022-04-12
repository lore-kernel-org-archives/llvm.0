Received: from smtp-bc0b.mail.infomaniak.ch (smtp-bc0b.mail.infomaniak.ch [45.157.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7471FD1
	for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 17:22:39 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
	by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4KdBtj1VTxzMqLVJ;
	Tue, 12 Apr 2022 19:05:33 +0200 (CEST)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
	by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4KdBth2cV3zlhMBP;
	Tue, 12 Apr 2022 19:05:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1649783133;
	bh=WIAqrTnf62NAS0tQGLe8JoQbbvgbUmacFvHp891JW6g=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=DWeNvZZDbPHmTCU+9PS7yiMNtuL8zaK+RZuoWGZjGUtOH8YoFj1gspSKJa5STgn/F
	 PxF7DDMrIHUTeYcm1arziMgGg0ELlv58gJWKuZk4iz5C/OkD6FqY7SW/PN7qlBEDeU
	 FstuiSvjT6tLhSKKFm+MzEXz1OcHnz0+qZDvtVeQ=
Message-ID: <acdf5af3-f256-8d53-ec44-fcef4022ec62@digikod.net>
Date: Tue, 12 Apr 2022 19:05:49 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent:
Content-Language: en-US
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <keescook@chromium.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 bpf <bpf@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 llvm@lists.linux.dev,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
References: <20220412153906.428179-1-mic@digikod.net>
 <CANiq72=ogSxwz8iJLZaYD4nSkE71sBhT4dZyDv1HYyo5R43=pw@mail.gmail.com>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Subject: Re: [PATCH v1] clang-format: Update and extend the for_each list with
 tools/
In-Reply-To: <CANiq72=ogSxwz8iJLZaYD4nSkE71sBhT4dZyDv1HYyo5R43=pw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

I'm wondering about the ASSERT_* and EXPECT_* macros from 
tools/testing/selftests/kselftest_harness.h
Do you think we should treat them as "for macros" as well? They can 
either be used with or without a following code block.


On 12/04/2022 17:58, Miguel Ojeda wrote:
> Hi Mickaël,
> 
> On Tue, Apr 12, 2022 at 5:39 PM Mickaël Salaün <mic@digikod.net> wrote:
>>
>> Add tools/ to the shell fragment generating the for_each list and update
>> it.  This is useful to format files in the tools directory (e.g.
>> selftests) with the same coding style as the kernel.
> 
> Sounds good to me. There have been discussions about doing it for the
> entire tree too, so we can start with this.
> 
> Cheers,
> Miguel
