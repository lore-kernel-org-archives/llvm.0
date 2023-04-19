Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BC4D2FC
	for <llvm@lists.linux.dev>; Wed, 19 Apr 2023 21:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59EF3C4339E;
	Wed, 19 Apr 2023 21:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681940524;
	bh=/UYmwUwYQs7440o2kiPbrEuQwRSg8GJBGRE90WwDB9M=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
	b=uL3eRnSQg/lrtNtoVEQVVC135yFOWOzmNXiD60SqEq5gRYyecug+a+aA0loWTs/yH
	 HhuKX1Lwm9kw429oUVNtNliwdJ/xu7BjeNB5mg/n5CBFpJxjdU/wU0zEH1cmJMBmTl
	 1KvP53ZqIxUexnUdPCbG5jF0hbv9sZWvZA30FAry1j9Bm/XMcFVIBcWHsJhY0KQHsI
	 CgNs55CPcdaX3kSXSH+69R8dJv+/SiTPVdzDZ0CppL1dXKBIMlW19tf8CEa/Xo4T6c
	 /H7niEZ/zV8mwGHWZSkOQdgzzB85ctJTUk7e20zb1FXm/j15KiFRA0eV3p+h22j+j2
	 iu7Iu6ZYpZICg==
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailauth.nyi.internal (Postfix) with ESMTP id 2FE6D27C0054;
	Wed, 19 Apr 2023 17:42:03 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 19 Apr 2023 17:42:03 -0400
X-ME-Sender: <xms:K2BAZI020YzCMZHgbOMIiRb5dyUb70gY-hW9stxT6sn4kz12csd_hA>
    <xme:K2BAZDEECcQ79Vy4d6ME6Qyk6-m9UnMVl0nphIcNnJeq3_3CrOyyatFmW7Nccv3r5
    LVCrNY4QnxBqx16qhE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedtuddgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtf
    frrghtthgvrhhnpedvtddtffejfeeggefgleefgfeghfehfeefffetgffgleegudevveet
    hfefjeevkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrrhhnugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvkeehudej
    tddvgedqvdekjedttddvieegqdgrrhhnugeppehkvghrnhgvlhdrohhrghesrghrnhgusg
    druggv
X-ME-Proxy: <xmx:K2BAZA4nJ-Q7sQ3bSd96Ai88fk8hXz0D_ZtKnblqxSbhZWnwMMBGwQ>
    <xmx:K2BAZB2hjbsKnwBS-Q9_w7ENPUh60d-ZWbX7mMbHhj9NL4_aRBLpBA>
    <xmx:K2BAZLFrDQNtddpsRVkrwQChWIcaUyVd_kiO32MU8rTmLltwDddXzQ>
    <xmx:K2BAZCBDcbip_MVao0dA1GarJTf7gimm_U0ywbBXLZLuXjlCDsuWqA>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E837CB60089; Wed, 19 Apr 2023 17:42:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-372-g43825cb665-fm-20230411.003-g43825cb6
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <8d070a27-fa53-4965-95b0-e0bf8bb90609@app.fastmail.com>
In-Reply-To: 
 <CAKwvOd=kShNVxFvjODEghrHGXK7Gekwcwb3cEFUgEBhZcOHC_Q@mail.gmail.com>
References: 
 <20230418-vchiq_platform_init-static-v1-1-3c38ba81bc66@kernel.org>
 <e1fed875-059d-bf98-f9da-09c51f362be8@i2se.com> <ZD+rethobzN+rONr@kernel.org>
 <CAKwvOdkKACfOvZ4BcG9NcO1Kh97vqSx0y7ZBc+BOJnHUpq8qWw@mail.gmail.com>
 <20ac24d6-4d94-4003-9203-d852714e1a46@app.fastmail.com>
 <CAKwvOd=kShNVxFvjODEghrHGXK7Gekwcwb3cEFUgEBhZcOHC_Q@mail.gmail.com>
Date: Wed, 19 Apr 2023 23:41:42 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Nick Desaulniers" <ndesaulniers@google.com>
Cc: "Simon Horman" <horms@kernel.org>,
 "Stefan Wahren" <stefan.wahren@i2se.com>,
 "Broadcom internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>,
 "Nathan Chancellor" <nathan@kernel.org>, "Tom Rix" <trix@redhat.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev, llvm@lists.linux.dev,
 "Florian Fainelli" <f.fainelli@gmail.com>
Subject: Re: [PATCH] staging: vchiq_arm: Make vchiq_platform_init() static
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2023, at 23:38, Nick Desaulniers wrote:
> On Wed, Apr 19, 2023 at 2:35=E2=80=AFPM Arnd Bergmann <arnd@kernel.org=
> wrote:
>>
>> On Wed, Apr 19, 2023, at 23:21, Nick Desaulniers wrote:
>> > On Wed, Apr 19, 2023 at 1:51=E2=80=AFAM Simon Horman <horms@kernel.=
org> wrote:
>>
>> > Marking something as `depends on OF_DYNAMIC`. (Not sure whether Arnd
>> > meant that for BCM2835_VCHIQ or BCM_VIDEOCORE).
>> > Perhaps try that?
>> >
>> >>
>> >> I'm a bit surprised as I didn't observe such a thing.
>> >> But I also don't dispute it - clearly my testing was inadequate.
>> >>
>> >> I'll try and dig a bit deeper into this one.
>> >> Perhaps starting with the report from the kernel test robot [3]
>>
>> I have this in my randconfig build tree, but it looks like I never
>> sent it out.
>
> What else have you got hidden up in there? ;)
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Actually, I have fixes for all missing-prototype warnings
in my tree, just remembered that this one is part of my
longer series. I have about 150 patches that are already split
up and just need to be sent out, plus more that are currently
sitting in a combined changeset.

     Arnd
