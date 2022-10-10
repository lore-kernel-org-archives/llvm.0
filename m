Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29375CB0
	for <llvm@lists.linux.dev>; Mon, 10 Oct 2022 22:14:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9EDAC433B5;
	Mon, 10 Oct 2022 22:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665440055;
	bh=AkdUwXusUdPpUo4YAW5JR7xyOaeVx/EdiWBZcNyLQP0=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
	b=Qs70pAGUpfL5BAEBOY4oPhLLz+ZO6ZDwRWjOCbzGZynUVwo7gOsa0teg67w3eb9Tk
	 qmOOBGJteXtQ+LmYaxPoUzT5X2Ti+5W2ODo1fGkYnyTqTQLU6w26juAO4xBkhnAI8r
	 QWZXbdNLzSv5/s0nUR7sEeIGC3VUltkmWtHwUd8DvuUAt9gbrKSJCVBTkIx75NyQb2
	 LtWxwVDfYz3gC86ZzhswGsflPsxCaGkMCkY0XNChtb3whDtTSZdBkF23XvY5Nj9bMD
	 6yjRPs1D3sjY8ywTw3NfavIYokuYEMZjJ2lJwyWb1Z8XYSV0FtzQ0Auc/Yws1OufXz
	 dHGQfxqTebmuw==
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailauth.nyi.internal (Postfix) with ESMTP id B543727C005A;
	Mon, 10 Oct 2022 18:14:13 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Mon, 10 Oct 2022 18:14:13 -0400
X-ME-Sender: <xms:NZlEY9vXXSFnUjbGB0-rMsa1Awnwzz5Lh8NrDGCr6qyWgA4Bn8A0gQ>
    <xme:NZlEY2fGvbTthK1Zluvs2m2_N6uSKuoSx_iq_13VREcBxjywCqsTpg1ZLBImRDVob
    orIeItqYYTyxqgsTYk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejhedgtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnhgvlhdrohhrgheqnecuggftrf
    grthhtvghrnhepveejleeltdfhudetgfelhfeigffhieekkefgledvteelvdeitedtueet
    vdegieffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpjhhhrghushgvrhdruhhsne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgu
    odhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduvdekhedujedtvdegqddvke
    ejtddtvdeigedqrghrnhgupeepkhgvrhhnvghlrdhorhhgsegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:NZlEYwxcYqUqqz5Tj325vAlRBJZ8zcRdFJZvnQFGG49VAhn56LJjyQ>
    <xmx:NZlEY0Nlh1F5gPCfmz6eVzd-6S_5dvecrnAkt3GkSYYBLaC2gabvhw>
    <xmx:NZlEY98TqAuF0GiIcUblgYfo-wRgJg6CKI7yj1i5Lg1xZ-Wk8it-OQ>
    <xmx:NZlEY8ZcnOHakyd_qb481H13m2MC5a1jrAjl8UxPWlJN8blcWSTZOA1zal4>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 1E7F6B60086; Mon, 10 Oct 2022 18:14:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1015-gaf7d526680-fm-20220929.001-gaf7d5266
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <ddc3156d-5580-4ec1-a218-2cdf5c1e9a48@app.fastmail.com>
In-Reply-To: 
 <CAKwvOdnfPeFpkD7zqt0EGk-xC_v_Lxt+2eOciMfbXihYG936Kw@mail.gmail.com>
References: <20220716001616.4052225-1-ndesaulniers@google.com>
 <CAK8P3a0ky5w82=d2N_iZ2HYujeCDKJJqjT8P25-_+VpsZYWA_A@mail.gmail.com>
 <CAKwvOdnfPeFpkD7zqt0EGk-xC_v_Lxt+2eOciMfbXihYG936Kw@mail.gmail.com>
Date: Tue, 11 Oct 2022 00:13:08 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Nick Desaulniers" <ndesaulniers@google.com>
Cc: clang-built-linux <llvm@lists.linux.dev>,
 "Nathan Chancellor" <nathan@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Ard Biesheuvel" <ardb@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Russell King" <linux@armlinux.org.uk>,
 "Linux ARM" <linux-arm-kernel@lists.infradead.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 "Craig Topper" <craig.topper@sifive.com>,
 "Philip Reames" <listmail@philipreames.com>, jh@jhauser.us
Subject: Re: [PATCH] arm: lib: implement aeabi_uldivmod via div64_u64_rem
Content-Type: text/plain

On Mon, Oct 10, 2022, at 11:23 PM, Nick Desaulniers wrote:
> On Sat, Jul 16, 2022 at 2:47 AM Arnd Bergmann <arnd@kernel.org> wrote:
>> On Sat, Jul 16, 2022 at 2:16 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/nwfpe/softfloat.c#n2312
> Any creative ideas on how to avoid this? Perhaps putting the `aSig -=
> bSig;` in inline asm? Inserting a `barrier()` or empty asm statement
> into the loops also seems to work.

I was going to suggest adding a barrier() as well, should have
read on first ;-)

> I see this function seems to be based on Berkeley Softfloat
> http://www.jhauser.us/arithmetic/SoftFloat.html
> v2.  v3 looks like a total rewrite.  Looking at v3e, it looks like
> float64_rem() is now called f64_rem() and defined in f64_rem.c.  It
> doesn't look like there's anything from v3 that we could backport to
> the kernel's v2 to avoid this.
>
> Otherwise perhaps we just disable OABI_COMPAT for clang. Quite a few
> defconfigs explicitly enable FPE_NWFPE though.  Are there really a lot
> of OABI binaries still in use?

I'd do the minimal thing here, neither NWFPE nor OABI_COMPAT should
be too relevant here. Russell still uses some machines with old OABI
binaries, but I have not heard from anyone else using those in a
very long time.

Note that while gcc can still produce kernels that are OABI binaries,
gcc-4.6 marked the arm-linux-gnu target as obsolete and gcc-4.8
removed it, so any existing binaries were built with toolchains
predating that.

     Arnd
