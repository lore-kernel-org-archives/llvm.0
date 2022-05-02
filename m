Received: from smtp-8fa8.mail.infomaniak.ch (smtp-8fa8.mail.infomaniak.ch [83.166.143.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970AF17D3
	for <llvm@lists.linux.dev>; Mon,  2 May 2022 11:05:29 +0000 (UTC)
Received: from smtp-2-0000.mail.infomaniak.ch (unknown [10.5.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4KsK7L19PDzMpnT4;
	Mon,  2 May 2022 12:28:30 +0200 (CEST)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
	by smtp-2-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4KsK7K1rsBzlhSLy;
	Mon,  2 May 2022 12:28:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1651487310;
	bh=bptxyVnLNXDttaSUgFWYcO2XLQjIKj3V2V77zSKRijg=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=sYTRVnzK1acffNdh7/XJLYB4Fjo92WqaJCNs/hMVa+uJfHNWBKhAZHNpBtt1fEaMD
	 237w1h/545j3O0sw7hscVWWqPSrmj4czUN0G/e84DS0j+Fw9voO3MZkJyguMiD9ffv
	 FTxBLd6NoJWv7jjmx56xV1bhdGBqEtTYdhXHZ2Xc=
Message-ID: <32f41b83-2019-475b-b72a-6b824fe796f8@digikod.net>
Date: Mon, 2 May 2022 12:29:41 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent:
Content-Language: en-US
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andy Whitcroft <apw@canonical.com>,
 Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 llvm@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
References: <8b6b252b-47a6-9d52-f0bd-10d3bc4ad244@digikod.net>
 <CANiq72nLOfmEt-CZBmm2ouEB_x6Jm9ggDVFCVJxYxKw7O0LTzQ@mail.gmail.com>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Subject: Re: clang-format inconsistencies with checkpatch.pl
In-Reply-To: <CANiq72nLOfmEt-CZBmm2ouEB_x6Jm9ggDVFCVJxYxKw7O0LTzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 23/04/2022 18:14, Miguel Ojeda wrote:
> Hi Mickaël,
> 
> On Sat, Apr 23, 2022 at 1:45 PM Mickaël Salaün <mic@digikod.net> wrote:
>>
>> I also noticed that there is some clang-format configuration lines that
>> are commented because of incompatibilities with versions older than 6.
>> Shouldn't we require a minimal version, at least the 6th?
> 
> I will be increasing this cycle the version to 11, which is the
> minimum LLVM supported at the moment, and then keep it sync'd to that
> minimum.

OK, thanks.

> 
>> About checkpatch.pl, it incorrectly warns about space between function
>> name and open parenthesis for *for_each* functions (specifically
>> interpreted as "for" statements in .clang-format, e.g. list_for_each_entry).
> 
> Note that the prevailing kernel style is to not have a space. This
> should be fixed with the increase to 11.

I was talking about the ForEachMacros exceptions. Should these be 
removed or at least not updated for new for_each functions [1]?

[1] https://lore.kernel.org/r/20220412153906.428179-1-mic@digikod.net
