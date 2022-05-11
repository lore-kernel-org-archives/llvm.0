Received: from smtp-42a8.mail.infomaniak.ch (smtp-42a8.mail.infomaniak.ch [84.16.66.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147102F25
	for <llvm@lists.linux.dev>; Wed, 11 May 2022 17:40:35 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Kz2Hb53XRzMqGVb;
	Wed, 11 May 2022 19:40:27 +0200 (CEST)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
	by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4Kz2HZ3RQVzlhMC3;
	Wed, 11 May 2022 19:40:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1652290827;
	bh=huDBKAvemFeLNSrEns2wEl+ddvdp4cf6NbrovNveSNg=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=uvBYf/7oUC9cw4mua9tQliavsBgd2bFRUl5Vb6dMxCNtPZC4iavHWJdKOw1NuNAuS
	 +GPmHKWQ2zgGjk1x9sdhyUGWHYTGAB3FygfxEioo20QiWaQv3JHE/Jr0MD53J6leDn
	 B8qR2+LO68yIaUBZ8V/a3rh6enWChJ3Fa45whE/Y=
Message-ID: <9c5eb09f-8f7d-2339-c8bb-4b908d7abab0@digikod.net>
Date: Wed, 11 May 2022 19:40:25 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent:
Content-Language: en-US
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Brian Norris <briannorris@chromium.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andy Whitcroft <apw@canonical.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>, Joe Perches <joe@perches.com>,
 Kees Cook <keescook@chromium.org>,
 Konstantin Meskhidze <konstantin.meskhidze@huawei.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Paul Moore
 <paul@paul-moore.com>, Tom Rix <trix@redhat.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
References: <20220506160106.522341-1-mic@digikod.net>
 <152da06a-330d-3125-6f41-262e0751f41b@digikod.net>
 <CANiq72mST6rfJDVGGT2+=_FUCXwms6N8mo2eoLzQ6KW64M9BtQ@mail.gmail.com>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Subject: Re: [PATCH v2 0/5] Fix clang-format configuration according to
 checkpatch.pl
In-Reply-To: <CANiq72mST6rfJDVGGT2+=_FUCXwms6N8mo2eoLzQ6KW64M9BtQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/05/2022 17:29, Miguel Ojeda wrote:
> Hi Mickaël,
> 
> On Wed, May 11, 2022 at 4:19 PM Mickaël Salaün <mic@digikod.net> wrote:
>>
>> Miguel, what do you think about this series? Do you plan to take it for
>> the next merge window? FYI, I plan to use it for Landlock [1] and send
>> it for the next merge window. Could you publish your pending
>> clang-format changes so that I can make sure everything is OK?
> 
> It looked good to me overall (though it indeed conflicts with what I
> was doing) -- I will take it for the next merge window.

Good. Please keep me in the loop, I would like to try your changes as 
soon as possible (before you make a PR).

> I am thinking
> of putting Brian as author and you as Co-developed-by for the last one
> to be fair (Brian: is this OK with you too?).

Looks fair.
