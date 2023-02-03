Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A260257D
	for <llvm@lists.linux.dev>; Fri,  3 Feb 2023 11:47:49 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id EFE205C00CB;
	Fri,  3 Feb 2023 06:47:48 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 03 Feb 2023 06:47:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1675424868; x=1675511268; bh=K1awbjIRzv
	mqci9lLxxjkCXo+T8jIOhbxM75qAfp3Oo=; b=AxQJsnL954qhnYWv6O7xiUbGc6
	PhuIb0eEbHAWXKSlFtJIMJkP4kMrQ9OMJWft+X9WjKWv3nKw7UlfceZ6/Fpq8cFF
	wqbnKaawreATez4Pd8HJsMNWJC/UHQ4cF/aOhtnGM24CJmI2/xhhQxjzR6RNODJk
	08lIJuRLS4zRZE/dps/Y7dErkDO67w7CT7viNxq33BN8q2hcx5CPR1uakMhZZEyl
	BoYgyNZxGuEPscRUmH/dEbc+E0DVUORnqP5FQehOIXSsNdgR9MG/oSwOpDAfGt84
	+MYwwc+W91nUMuuodzz5w2ly22WEBkp5+u3i30d/XJeAVCoogL6FXtqp/StA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1675424868; x=1675511268; bh=K1awbjIRzvmqci9lLxxjkCXo+T8j
	IOhbxM75qAfp3Oo=; b=Y4MHf/y4i/sZT7K9T9TYddYqt5bZ+egfsJEud24qsGSG
	+n5NXZOPWXIuqKSw7AWelH5l1jdHcxTqG1E1c96s0XyTCUCDXEYNu5D6ExbWZjic
	Vz+ERgLNfeo+GyTd2ou3Qp06Sg3tBiQ/d0KcnWr9+F8c8EFQBybCjRUo+Ih4OiLC
	zWY8FOR9Zrakxt7gbbNQh5Dtu3tn1KwTBTPYYKsmEwKIRT+Dohn03LOaDNjWlC+g
	19qcDZpA2Av7o2ogiUY/5lLxSlwd9rgVa+IFy80EYBH2PSejaezbmvI42h4shMoa
	s9N80bQW38iYKeeqX5JzAQ5EzRmTyNj8Qj/Jvkg5qQ==
X-ME-Sender: <xms:ZPTcYxAq_kt3Yp_HiGjOwlJ4fehl_Se4_6XDXE73rWNRweZhV7b5aQ>
    <xme:ZPTcY_hkuKOaf3l6IAu_fIIfSbmhF3BufuaS29q24BQPBuWgzxOdu_1nkvYxwN_Dj
    iVSq7xN6k2qGeOFswE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudegtddgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvvefutgesth
    dtredtreertdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnuges
    rghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpeffheeugeetiefhgeethfejgfdtue
    fggeejleehjeeutefhfeeggefhkedtkeetffenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:ZPTcY8klOnwezQzMpf8zjg2dyDSvYDVvVzTwPao51QoP1MqR-G0cHA>
    <xmx:ZPTcY7wY5Ir93MxNZuYNpPCuL0r_c4yRclGQYfsdmfXOliRYtH4qew>
    <xmx:ZPTcY2Q06yJ-DFAOQAil_3_U7dHL9rHC6WQ4IzWXm4DSM3TYcBRy0A>
    <xmx:ZPTcY_7SUJaJTAYqWiDm3eG8cjSIqtLJ65g8VF1uwJw5W_99Tl6Nmg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D5431B6044F; Fri,  3 Feb 2023 06:47:48 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-107-g82c3c54364-fm-20230131.002-g82c3c543
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <a20db5a2-92e9-4fcc-964a-16c3b7f3b4ce@app.fastmail.com>
In-Reply-To: <1876530996.8739.1675384465825@jenkins.jenkins>
References: <1876530996.8739.1675384465825@jenkins.jenkins>
Date: Fri, 03 Feb 2023 12:47:30 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: ci_notify <ci_notify@linaro.org>
Cc: llvm@lists.linux.dev, "Arnd Bergmann" <arnd@linaro.org>
Subject: Re: [TCWG CI] Failure after v6.2-rc2-24-g6437a549ae17: drm/panfrost: fix
 GENERIC_ATOMIC64 dependency
Content-Type: text/plain

On Fri, Feb 3, 2023, at 01:34, ci_notify@linaro.org wrote:
> Failure after v6.2-rc2-24-g6437a549ae17: drm/panfrost: fix 
> GENERIC_ATOMIC64 dependency:
>
> Results changed to
> -10
> # build_abe binutils:
> -9
> # build_kernel_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 23221
> # First few build errors in logs:
> # 00:41:02 drivers/net/ethernet/mellanox/mlx5/core/en_main.c:3597:12: 
> error: stack frame size (1256) exceeds limit (1024) in 'mlx5e_setup_tc' 
> [-Werror,-Wframe-larger-than]
> # 00:41:02 make[6]: *** [scripts/Makefile.build:252: 
> drivers/net/ethernet/mellanox/mlx5/core/en_main.o] Error 1
> # 00:46:08 make[5]: *** [scripts/Makefile.build:504: 
> drivers/net/ethernet/mellanox/mlx5/core] Error 2
> # 00:46:08 make[4]: *** [scripts/Makefile.build:504: 
> drivers/net/ethernet/mellanox] Error 2
> # 00:46:08 make[3]: *** [scripts/Makefile.build:504: 
> drivers/net/ethernet] Error 2
> # 00:46:08 make[2]: *** [scripts/Makefile.build:504: drivers/net] Error 
> 2

Why are you emailing me about this bug? It has nothing to do with
the fix from $subject.

     Arnd
