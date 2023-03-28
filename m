Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8C88BE0;
	Tue, 28 Mar 2023 15:29:28 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id C0EE75C012F;
	Tue, 28 Mar 2023 11:29:27 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 28 Mar 2023 11:29:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1680017367; x=1680103767; bh=04
	hLKD+xWhkBIhadK/hWrq7vdkof5TtjWTzhRNoj4zI=; b=sfdyKRAbmeckYWZiFB
	yn3stllbfomGQuvPuTYnXgO87XQLUHUxTxi1ioyqHqwAdEV0+iOJE/yodinmZ0Bu
	EYMBPzMBSKLkKqRPlC2Ka6k/xHpI5Lh3Vs7Fh+bNooRj2KYvkbzQXogsqcauFARe
	6BKpsitj9rMabyu+xDMljGQivtJyKNmlcmTzC8VJWT7jD/otdLs2b95HcI2s4khf
	ZCkCOwLYzyoFYQb15ACBhA5mUbFmXv3htVvaiPfqI3JQ/5IdN6WekSEjgOHFgpVV
	NDXU9y6hYltc1HW2GaYWveCEUR2xQvM/J3dod1wVjspev4R9lI50gn6vhrvOGlGJ
	kjQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680017367; x=1680103767; bh=04hLKD+xWhkBI
	hadK/hWrq7vdkof5TtjWTzhRNoj4zI=; b=c+gYfBNXg3rKbHpriliIwcBagbXUs
	L1K2QLpzIVuzG/tqsHeU2V3ImrUUeiovxOoEqjek0Q3dJ0M30wZVmNGVG+WPPTjm
	0gVtmveVB61U4lMrVkrohnqOHonVhe9zBmVmRoZ1ITqah75tyvu1XJh85ebA8qWs
	x7dVNA6Z5Y6O68F5fb81ESV4Rz0nE24GQkpshId3klReW0uivCG2Q7htBfFq1l/J
	8xCmPgsJ3NTAkd3wuLgjoZP6owU8b+0pUm7i747H9NBoPoKwNjp78GL2Ysu7DpKO
	XdWOPbpdl7DXyrPVT9tFXsjACtPStc1EIY89OMewKy/UiDt00B8JsyYYw==
X-ME-Sender: <xms:1wcjZJdcK448sd6lJotNqV9-uEUsJ52ZRsXW5RA4u_QG5DijgG1LFw>
    <xme:1wcjZHMy0BIZcOXIzyqRjejOSGejn5QWRPffU6iDG3gTBn4MtDb5NXyJXmuCLQmeo
    7afhtXeszwQfzu5oWA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehgedgkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:1wcjZCglXUMEtTNZhzKQy29xfFexP2P_XtiUk2YTfowkxnR2ldKx3A>
    <xmx:1wcjZC8uzpNaZLNvneiwrWbeqNZ0C51Czc65aZsB900rUsn-jgynEQ>
    <xmx:1wcjZFuo372EszA_0DqxiqEwALWSfSaodG5v1nyg6yRdoDKPnY66cQ>
    <xmx:1wcjZPILx0ssYRlqcgi7FkvGr2yIBTsEsjxaFgEXRIQD1IjGJO7xvg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 795A7B6008F; Tue, 28 Mar 2023 11:29:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-237-g62623e8e3f-fm-20230327.001-g62623e8e
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <d2de874e-d2e8-435e-a90e-a3aef763f2b3@app.fastmail.com>
In-Reply-To: <20230328122138.GA1275@willie-the-truck>
References: <202303281539.zzI4vpw1-lkp@intel.com>
 <20230328122138.GA1275@willie-the-truck>
Date: Tue, 28 Mar 2023 17:29:07 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Will Deacon" <will@kernel.org>, "kernel test robot" <lkp@intel.com>
Cc: "Marc Zyngier" <marc.zyngier@arm.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev,
 "Linux Memory Management List" <linux-mm@kvack.org>,
 "Zaid Al-Bassam" <zalbassam@google.com>
Subject: Re: [linux-next:master 6577/7309] drivers/perf/arm_pmuv3.c:44:2: error: use of
 undeclared identifier 'PERF_MAP_ALL_UNSUPPORTED'
Content-Type: text/plain

On Tue, Mar 28, 2023, at 14:21, Will Deacon wrote:
> On Tue, Mar 28, 2023 at 04:01:49PM +0800, kernel test robot wrote:

> I think the Kconfig warning is relevant here:
>
>> Kconfig warnings: (for reference only)
>>    WARNING: unmet direct dependencies detected for ARM_PMUV3
>>    Depends on [n]: PERF_EVENTS [=y] && HW_PERF_EVENTS [=n] && (ARM [=y] && CPU_V7 [=y] || ARM64)
>>    Selected by [y]:
>>    - ARCH_VIRT [=y] && ARCH_MULTI_V7 [=y] && PERF_EVENTS [=y]
>
> Since we're selecting an option which has its own dependencies. I think
> the easiest bet is to invert the linkage so that PMUV3 has a dependency
> on ARCH_VIRT for 32-bit Arm (diff below).
>
> Marc, Zaid -- what do you think?

I think dropping the 'select' is best, as this is still a user-visible
option. How about this instead:

--- a/drivers/perf/Kconfig
+++ b/drivers/perf/Kconfig
@@ -103,7 +103,7 @@ config ARM_SMMU_V3_PMU
 config ARM_PMUV3
        depends on HW_PERF_EVENTS && ((ARM && CPU_V7) || ARM64)
        bool "ARM PMUv3 support" if !ARM64
-       default ARM64
+       default ARM64 || ARCH_VIRT
          help
          Say y if you want to use the ARM performance monitor unit (PMU)
          version 3. The PMUv3 is the CPU performance monitors on ARMv8

This way, it's still enabled by default for most people, but
there is no dependency problem and it's also possible to
turn it off.

     Arnd
