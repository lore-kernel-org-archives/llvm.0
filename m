Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4F918E
	for <llvm@lists.linux.dev>; Wed, 12 Oct 2022 06:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2E8BC433D7;
	Wed, 12 Oct 2022 06:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665556452;
	bh=JlN2GYIDGhgzb1XkFrQBRMI7OzJ6UI1sdIqUjARw8Q0=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
	b=YyHvCTwPX19iAhelPXaEXMmRvQ2v1aGzOw59E22Od9Ny52hwapoTtwbmKl7xVkO7V
	 54gKjchEUix4NGEnqR7WgE08GTc8UlQS8KQg90K1g1OBYva4G0jAZltmm8AhY9UNp+
	 Cc5XpZ4ZjF/koER7NSjqXMVM7nUnfAnHLLx4+PuaG1rpi8bg8/u2gMpJ8owK8e2fcP
	 LC1gyESPi2o1xftbP/OnJJNgexuBcKP+2km0ZKepKA9B7Qjq7Z027aQN+7XQMn2F01
	 EyJqAF162T9D1oY6LbHHGjuRAuYAOwreWdqw1NT5TENBlTsXyTEKH5U2vm5fXeiI+e
	 2ODTe5JQQu+4Q==
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailauth.nyi.internal (Postfix) with ESMTP id BC25A27C0054;
	Wed, 12 Oct 2022 02:34:10 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Wed, 12 Oct 2022 02:34:10 -0400
X-ME-Sender: <xms:4l9GY-qKVjMqoB0tXiZo4hNV4plM1eyv96XunGUx9DX3ZN9VYzRNqg>
    <xme:4l9GY8p9VeDxd76iBsnm7qdDUOjMiuxQ1Z50mmqfKb-SIwqFHaqa01QeMZdxIjxwx
    ouR_C3xFFWOKWO1800>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejjedguddutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtf
    frrghtthgvrhhnpefgtdffheekffduteevtddujedvudeltdfgveehiedutefggefgjefh
    hfetkedtleenucffohhmrghinheplhhkmhhlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguodhmvghsmhhtphgruhhthhhp
    vghrshhonhgrlhhithihqdduvdekhedujedtvdegqddvkeejtddtvdeigedqrghrnhgupe
    epkhgvrhhnvghlrdhorhhgsegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:4l9GYzNjAm0Lj4DNsnZtT2EdZRBkx_PlPByaikzOyFbijxmE5pey6A>
    <xmx:4l9GY956C4E_T5a0JZkYH3XnyEhSEhL9RgEUlQqmXLgjJEpDoyolKA>
    <xmx:4l9GY96IMkcM39oaR_lbtU74UnDinVC8BuIKbYnZhHCmhCghqQyUzQ>
    <xmx:4l9GY9GTZvdawO5Mog2aKU4zvqj-QHF6g2kNT7lnIUnLPW880pOcXw>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 75050B60086; Wed, 12 Oct 2022 02:34:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1047-g9e4af4ada4-fm-20221005.001-g9e4af4ad
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <43ee826c-5f1a-4fb3-b644-49caf5778ad4@app.fastmail.com>
In-Reply-To: 
 <CABgnqwDx_tiQKonycPMKKDXnnhyoEvcvaBSZVeyNuVenJ2FrkQ@mail.gmail.com>
References: 
 <CABgnqwAZW=ro3BWdjar97RLif5mdeNGz7XssiKFyHcnfnC+uqA@mail.gmail.com>
 <CABgnqwDx_tiQKonycPMKKDXnnhyoEvcvaBSZVeyNuVenJ2FrkQ@mail.gmail.com>
Date: Wed, 12 Oct 2022 08:33:50 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Luong Ngo" <lngo@google.com>, suzuki.poulose@arm.com
Cc: llvm@lists.linux.dev, "Nick Desaulniers" <ndesaulniers@google.com>,
 "Nathan Chancellor" <nathan@kernel.org>
Subject: Re: coresight: etm4x build failure with unrolled loops
Content-Type: text/plain

On Wed, Oct 12, 2022, at 1:20 AM, Luong Ngo wrote:
> Resend with another Arnd's email as arnd@arndb.be is not working any more.

arnd@arndb.de is my normal address, if you are seeing problems with it, can
you tell me what went wrong? If you got a bounce, please forward that to
my @kernel.org address.

>> Hello Arnd and Suzuki,
>> 
>> We recently enable coresight driver in our kernel and the build failed with the exact same error that I found your discussion of same issue in this mail thread (https://lkml.org/lkml/2021/4/29/862). The suggestion fix by changing etm4x_relaxed_read32 with csdev_access_relaxed_read32 indeed fix the compilation error. However, the change was not upstreamed. Do you have insight into why the fix was not submitted?  Is there any chance for it to be submitted?

I think that issue came up again on the clangbuiltlinux project, and
we concluded that we should resend one of the old patches, but I don't 
know if anyone did, or which one of the them we decided on. It should
not be hard to fix.

    Arnd
