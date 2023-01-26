Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C670F1C3F
	for <llvm@lists.linux.dev>; Thu, 26 Jan 2023 07:36:18 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id EE47D5C04C9;
	Thu, 26 Jan 2023 02:36:17 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 26 Jan 2023 02:36:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1674718577; x=1674804977; bh=r5GoeYBjFo
	+WeG7azm3XT3+ZR1ttmIhAZMOKMfD4BxU=; b=QIvUG/1RSl99XWYCEHehynLsc3
	otBaFpoM5K3+gnY/Xv2Qiw/r7pHGugJyyfUD8MnH2BbNFU24riYsNjKfV5WBej5a
	3Huf4wpPYoUlmYubMH/bKLNj/neuhoNntr02nu3jdg1APPYCHMippRzGqBLHHkt1
	8V5HLaJPUigLp4vABf5dBqOc9bFPCbKfo58LcerWlnUYUbogV3ZCatihG4jocqwr
	kw20eTsbxPppA0kGQzNEBX0rsmfrs3GWPpy/Rs3Vq2uq6C0sg+Xq+qewjhC/eE5g
	jMWjzdP72u1rhLxOprCe7UOoq5IIAjAVvrdQDxMpvb4jRIUJH49aZdAh7GVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1674718577; x=1674804977; bh=r5GoeYBjFo+WeG7azm3XT3+ZR1tt
	mIhAZMOKMfD4BxU=; b=YH4dGZ3+Fz45U89pHXuWSx5NAFmJ5SLP5emLKpuBQ7t+
	lRcGqxn33Jgdl04Zn9TOMkc0/HQ9v4vYFn1faUDQWG0+fJ0+0CLMI8GVqLHaMmAL
	mD/10n1DT0Ej9K5m1wsIadDWOublDP03eN7dzcb3jEtLsgye4+CZciUJKN4dRiUn
	bCs4TqriMgONNR4NONuvtdVFstwlziCw0D9UzrkBBIBupXvKc+byivR9HVqzjzIu
	VS5wInAYTP08HSRAj0Sxd+TqOyDFHDoTpbjI7JpTGdSBRAu9rtauiyI9lVZX5gGY
	33DRrwhmmr5cSlQ0vb2nef+dZIv2x6eQ4r4rA2Gjmw==
X-ME-Sender: <xms:cS3SYzsr0pFR8xXF09ufUY1Ik0NAqv5FnM3uXR_ntex9aIFry6WzcA>
    <xme:cS3SY0eGrTWIGD9YUC8ScX1sTpU32oI0ytqf7Wqs1sx3Uj2qxmF-mlUNmxEEW3Z31
    ljcaWsU18FOW3hiXts>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvfedguddtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvfevufgtse
    httdertderredtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgu
    segrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnhepffehueegteeihfegtefhjefgtd
    eugfegjeelheejueethfefgeeghfektdekteffnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:cS3SY2xOWhRRRYrsLF_uPnPBb5rKBvkqALTnARXrdsBPgonrzETVkw>
    <xmx:cS3SYyPYWwUNOim3MnTT8pekiOTUQAmX33EaChJPLmSW5_T7nARLVg>
    <xmx:cS3SYz890qIj26lzE2DM_j4j5zv1UzwZHvLRV_YAojcqXeHgCFPJYQ>
    <xmx:cS3SYwFNQkj9Bzl0vao19HVNkitloEOMJSgZWdMMYfljlP8Zf6zx_A>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id AD0CDB60086; Thu, 26 Jan 2023 02:36:17 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <65706593-66f8-4c15-84b8-5c1514b6dfcf@app.fastmail.com>
In-Reply-To: <936824449.4202.1674688110564@jenkins.jenkins>
References: <936824449.4202.1674688110564@jenkins.jenkins>
Date: Thu, 26 Jan 2023 08:35:57 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: ci_notify@linaro.org
Cc: llvm@lists.linux.dev, "Arnd Bergmann" <arnd@linaro.org>
Subject: Re: [TCWG CI] Failure after v6.2-rc1-10-gc09846fc1ff4: ARM: orion: remove
 unused board files
Content-Type: text/plain

On Thu, Jan 26, 2023, at 00:08, ci_notify@linaro.org wrote:
> Failure after v6.2-rc1-10-gc09846fc1ff4: ARM: orion: remove unused board files:
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
> 21023
> # First few build errors in logs:
> # 00:21:35 drivers/gpu/drm/tests/drm_mm_test.c:344:12: error: stack 
> frame size (1040) exceeds limit (1024) in '__drm_test_mm_reserve' 
> [-Werror,-Wframe-larger-than]
> # 00:21:35 make[5]: *** [scripts/Makefile.build:252: 
> drivers/gpu/drm/tests/drm_mm_test.o] Error 1
> # 00:21:41 make[4]: *** [scripts/Makefile.build:504: 
> drivers/gpu/drm/tests] Error 2
> # 00:54:50 drivers/net/ethernet/mellanox/mlx5/core/en_main.c:3597:12: 
> error: stack frame size (1256) exceeds limit (1024) in 'mlx5e_setup_tc' 
> [-Werror,-Wframe-larger-than]


> from
...


Sorry, but I don't see any difference between those two logs. 
I believe I have sent patches for both of the build failures.

The patch that ended up as the bisection result is clearly
unrelated to both of them, so my guess would be there is a bug
in the CI tooling rather than the kernel.

     Arnd
