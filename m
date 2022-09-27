Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com [66.111.4.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8B24C64
	for <llvm@lists.linux.dev>; Tue, 27 Sep 2022 20:03:02 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.nyi.internal (Postfix) with ESMTP id 5CA4A58085C;
	Tue, 27 Sep 2022 16:03:01 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Tue, 27 Sep 2022 16:03:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1664308981; x=1664312581; bh=Y4UY9dgxeJ
	9HeYcK3xvosbvo1tduGFnW3f63znw/KyA=; b=VDqJJtgmlRKakGv+MgK3h5fnuG
	DFHT6aOu1R47Xg5EOjmonYuaeoStNDqxLMzmZQvfcG8YzdrKYiNT2ZznsQCth9o/
	HnnNeyUmC93jdlowufB5YKnGv+sZlfZgKphzUrirpPKyFSp9rCwIufFFwm2sk4Gw
	Aa05DFCWF4VRfoJ/xzWmT/17qQpQPpFYgwFeNb8Dpa8VPCh06LOaZD7FJMbH4+M5
	kRWcnfLHnRiDE45vtnmfY5KPqJ0GbPTZgRNSe8q0DO9QANT88MCkw3brOayVW6UO
	vWOG5kGFX3TM+5TBBmB/0QDYbQqsBiE14PzySaeHBHfL4+52FA8pmVZG/rdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1664308981; x=1664312581; bh=Y4UY9dgxeJ9HeYcK3xvosbvo1tdu
	GFnW3f63znw/KyA=; b=05gshFron9/QrzAgqyBQ6bU9ydICJD6WCaEfkKbHN2nG
	HwnwToE47JS19zerYgjmjEnPvYmOXlfemKuWsIh6yDmJsX3dAxlvp/r4xdIGqkX3
	h79f0sjDW3hlFGjpuJ/PAHugPvGHElxI8XqEQV8Jz+u66cGQIO0PAOJOk61nvH/O
	cDojHx9giN8eqBXlnHpF5EPSA68WJWoTiAtvgRivdMFAl5nHEOGPfCH9LBMB2HS5
	J37cvh+CMMIQyAzd6ceFiYgli5dUEpR3ruTSr9vnN+99K3Fk6cecW+G026HLxZAw
	TrO52RQGavztSfNksM51S49zZZkaREtw1l//jd/ZEw==
X-ME-Sender: <xms:9FYzY7luKVsACXNDpOzG8YPp2sIuchIMxIhxvZeGFwLUt1Xru1S1SQ>
    <xme:9FYzY-12oNI4RyZ2eFAifex9Jb-u4oOwqG9rQm9f-bSadUfD4Pg-w01dY26MnTLww
    GnBFaHVuQ6VZ-zFfDY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegiedguddvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:9FYzYxrpB_no66c1NVSYmKYp3mr2zWK6vCsa4TcRI_bqjSjfWwRcBQ>
    <xmx:9FYzYzkIp9jvesPZbsEFd0QIQH9x0Mj75QhNMvlocpUysLSLWvQHOw>
    <xmx:9FYzY516UY8_QlZe398ERf9YRsuhmPohg9WHhM0-S7z1KfXymSEbgQ>
    <xmx:9VYzYyzfk4N6ZYL1-VUJ6vocbgK7dHQsMX4sgN6ogqmuE_fplwrSBg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 659BFB60086; Tue, 27 Sep 2022 16:03:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-968-g04df58079d-fm-20220921.001-g04df5807
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <e0a3bc54-a1be-4e10-afcb-bee1888c4066@www.fastmail.com>
In-Reply-To: <da19f271-6ad6-7158-2ebe-e54fa5c91f6b@sequans.com>
References: <202209210641.MziHAbW7-lkp@intel.com>
 <20220921104002.226ff3f6@xps-13>
 <ffde44bc-d4ae-4052-c60c-35c8775a5101@sequans.com>
 <7074197c-aa8d-f763-cb0f-03ea5335b923@sequans.com>
 <20220921164720.6bbc56d5@xps-13>
 <ef9a2618-2dd0-4d1b-b9d2-37d59506f004@www.fastmail.com>
 <20220921183807.241e2518@xps-13>
 <b7e5ebb4-0de8-4958-9bc4-fe06ec4c3635@www.fastmail.com>
 <6b5a2b19-39c6-5116-60c2-d292ae2e7bae@sequans.com>
 <20220922113613.4d7273c8@xps-13>
 <01210adb-ff77-4ec5-8d10-ab56ae986d58@www.fastmail.com>
 <da19f271-6ad6-7158-2ebe-e54fa5c91f6b@sequans.com>
Date: Tue, 27 Sep 2022 22:02:39 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Valentin Korenblit" <vkorenblit@sequans.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>
Cc: "kernel test robot" <lkp@intel.com>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org
Subject: Re: [mtd:nand/next 11/31]
 drivers/mtd/nand/raw/cadence-nand-controller.c:1893:4: error: implicit
 declaration of function 'ioread64_rep' is invalid in C99
Content-Type: text/plain

On Tue, Sep 27, 2022, at 4:56 PM, Valentin Korenblit wrote:
>>> 
>>> But in the mean time I am only half satisfied, because we plan to do
>>> twice more accesses than needed _just_ because of a the COMPILE_TEST
>>> constraint.
>> In my example, I had an #ifdef so it would only fall back
>> to 32-bit accesses on the 64-bit register when running an
>> actual 32-bit kernel, but leaving the 64-bit case efficient. Sorry for my late reply. I've just tested this and unfortunately
> the two sequential 32-bit accesses (with OFF0==0 and OFF1==4 seem
> to trigger sdma_err. I need to check some waveforms to verify if it 
> happens right after the first access. 

What happens if you do pairs of read from offset 0, effectively
doing a readsl() instead of readql(), obviously with twice the number
of accesses.

It's also possible you have to read from the second word first,
like

  u32 *buf;
  do {
     buf[1] = __raw_readl(reg + 4);
     buf[0] = __raw_readl(reg);
     buf += 2;
  }  while (buf < end);

   Arnd
