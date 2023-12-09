Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580731FA3
	for <llvm@lists.linux.dev>; Sat,  9 Dec 2023 21:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="cvHA9bOc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JLgUH7wa"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id D4D73320046E;
	Sat,  9 Dec 2023 16:43:53 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Sat, 09 Dec 2023 16:43:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1702158233; x=1702244633; bh=We
	6kY3gAvHmi9sxQSDSEwapFQp49viPEwJBBDd9ci5w=; b=cvHA9bOcnXtURsTD7h
	hQIwOkrnSC/IEaopUb7jcU3SO71P2HglKc/Uf/tbOJgiQdVvBbYUi5wIeI/SuHdN
	yihGgZozlJtPuOEBXBUtit4VmIrrw4iI9wyvOpZtesme/XJI4CB73j6HIO/29i2g
	J9jzcjTXS3e2q7va1k83+YbmF98nTRA9aZv5rVUKh4ua+HV757M6xE1l6PExeBOH
	4AkKpOCn6h7HzggQz1bKkZ1QqQEmo4X7lqBxD3JHribrEUCKyubmKlBs8AncEceS
	WsxBv/4g9Tsa57PG4+KEQ8Z9hREEBU5ah1hjoC1XZRXhc0YlNTK5bJ/RHhiFPZSQ
	R4MQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1702158233; x=1702244633; bh=We6kY3gAvHmi9
	sxQSDSEwapFQp49viPEwJBBDd9ci5w=; b=JLgUH7waXEbUzBEVje+yS8gqR3UZv
	0CffHOWY0+Z+wwB+vW7KwAu70naHiDTc5u+OYzUVLCv0unDsrJpC93z3zETAGff7
	e0/T0GRtbRg0+VnKpUtTWPl/Q4nlGcTAyPFjPNVovSCRC1cUnlcC3O2I04IH5cok
	MESfiIG+6tt4R9ba3Gg9/9KnbqSVFlntTrRNLbzBRy93epWnYX5VTNrGGgOaENLy
	XlEPzcvCm3VRq9ydeqbEFCF21r5ibe7XRlynlw5bEBTNt50vdbXTP7QJa37rnJfz
	NT1ZcZ4nx6pbp3NiCJ8HgiHHtOAi3T7I/d1Ju8OBaYA2CHgazdrnZNtIw==
X-ME-Sender: <xms:mN90Zcj1t9YVcktHsm-DKH45IHMXpA9-Hpk1MgTfZICEl6zlaEQO-Q>
    <xme:mN90ZVBye_9O77lTM1mzlC0eY5rXGnN3rcl8YdJFkH31am33R7m_eb1Es3R2UGMnB
    7ZiLaTlclBhknsZ7ls>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudekkedgudehgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeu
    feehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:mN90ZUHkY2lVvRTuVB80nWKONPPFQfKxiUCPeYhQNqvjAx9BHimUqg>
    <xmx:mN90ZdQBaq15D8xNbGkhH8mnW9rg4RLUFMqWhsHROKx2rdbi3lmzmw>
    <xmx:mN90ZZwDe9e9jmJA9g9aU6t06uGsYV23Rtq8P4aLnmtVN_b5V5QsZg>
    <xmx:md90ZeJ8gleODk1pUugxxYDlZwxKnUBYXS_E8L8KAxGPRh2PldOCLA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A87CDB60089; Sat,  9 Dec 2023 16:43:52 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1178-geeaf0069a7-fm-20231114.001-geeaf0069
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <7996d21a-3e97-408b-82a3-3bad432095a2@app.fastmail.com>
In-Reply-To: <07d27191-12b6-4c84-b80e-75c618df9de4@sifive.com>
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
 <20231122030621.3759313-4-samuel.holland@sifive.com>
 <20231123-headdress-mold-0dd7a74477f7@wendy>
 <20231130004224.GE2513828@dev-arch.thelio-3990X>
 <4f277982-fffb-4fe1-bc02-007633400f31@sifive.com>
 <5090a015-5b6f-44be-bb25-d2ca3fdf5d40@app.fastmail.com>
 <07d27191-12b6-4c84-b80e-75c618df9de4@sifive.com>
Date: Sat, 09 Dec 2023 22:42:56 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Samuel Holland" <samuel.holland@sifive.com>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Conor.Dooley" <conor.dooley@microchip.com>
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Harry Wentland" <harry.wentland@amd.com>, "Leo Li" <sunpeng.li@amd.com>,
 "Rodrigo Siqueira" <Rodrigo.Siqueira@amd.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Dave Airlie" <airlied@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Alex Deucher" <alexander.deucher@amd.com>,
 "Pan Xinhui" <Xinhui.Pan@amd.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, llvm@lists.linux.dev
Subject: Re: [PATCH 3/3] drm/amd/display: Support DRM_AMD_DC_FP on RISC-V
Content-Type: text/plain

On Sat, Dec 9, 2023, at 22:29, Samuel Holland wrote:
> On 2023-12-09 2:38 PM, Arnd Bergmann wrote:
>> On Fri, Dec 8, 2023, at 06:04, Samuel Holland wrote:
>>> On 2023-11-29 6:42 PM, Nathan Chancellor wrote:
>>>>
>>>> https://lore.kernel.org/20231019205117.GA839902@dev-arch.thelio-3990X/
>>>
>>> I also see one of these with clang 17 even with KASAN disabled:
>>>
>>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:37:6:
>>> warning: stack frame size (2208) exceeds limit (2048) in 'dml32_recalculate'
>>> [-Wframe-larger-than]
>>> void dml32_recalculate(struct display_mode_lib *mode_lib)
>>>
>>>      ^
>>> 1532/2208 (69.38%) spills, 676/2208 (30.62%) variables
>>>
>>> So I'm in favor of just raising the limit for these files for clang, like you
>>> suggested in the linked thread.
>> 
>> How about just adding a BUG_ON(IS_ENABLED(CONFIG_RISCV))
>> in that function? That should also avoid the build failure
>> but give a better indication of where the problem is
>> if someone actually runs into that function and triggers
>> a runtime stack overflow.
>
> Won't that break actual users of the driver, trading an unlikely but
> theoretically possible stack overflow for a guaranteed crash? The intent of this
> series is that I have one of these GPUs plugged in to a RISC-V board, and I want
> to use it.

Ah, I thought you just wanted to get it to compile cleanly
so you could use some of the more common cards. If you
are trying to run the dcn32 code specifically, then you
should definitely fix the stack usage of that function
instead.

      Arnd
