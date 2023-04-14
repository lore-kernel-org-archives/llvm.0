Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A32D7F1
	for <llvm@lists.linux.dev>; Fri, 14 Apr 2023 08:07:38 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id C9D3D5C00C5;
	Fri, 14 Apr 2023 04:07:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 14 Apr 2023 04:07:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1681459657; x=
	1681546057; bh=60PlD2MyZgNIk/JWFkkJ/HhQAbjvbcqYgeFeUzfxVX4=; b=H
	He3OMK/2SxbRROumRYhSngFQvhDhE4kCRXRU8t6K90E9JEud15H9tcWYRg7TIjzK
	iKrE+81nDS/z4MTLXZDh7OZ9EVj9YS74G8NzjK8IATp9PWKDAweEuZS6Wg3Ms5jr
	YasvTSAE63Xt0p1VQRYyYsEyCTQiD+b+iLgDWi/chNVeKBR1ShZnWZGvIZAr2eL8
	YY/2bxhnI77u6coDnfSmG4gyu+WZaBEQLtoo1m+an2MyiHmuYEjmIoz+KkamR4ZH
	0AzvOtJIz1ApZkPlGMwvW6EvSbnZPfaFvoeZ0lqSBTkyP+soJPiG/78nVAS11fMx
	jAFUFil7WItDPAHkDZzrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1681459657; x=
	1681546057; bh=60PlD2MyZgNIk/JWFkkJ/HhQAbjvbcqYgeFeUzfxVX4=; b=R
	+DG39sOCMrIJALMPWneV2LJlc+CZkek9A1KDDHhvyY8Vb4hHVjqWCZA89Ld15obA
	+iDc3wP0EP8RQwCw3L4ezdn6O9s7t9OygoqXh+9zoTge023FOFu80GiK8XPWlZt3
	TDPPrltz16kFBBTLAEKQjPitVfoITM5E5pcCR2aQCDa5FRbYao8772/aSYoCHIDE
	zp3kkRNmWFC5JE2C/WcuFNvVRVls9wIyTmtOF33T6g4Sa6/frE5lI7UQGtLceKya
	e0bRxluXMcnpwIfCEyHlUOPkSPFBHIaH8eCEWATFqAt/mrIXqXTK7Kf+R6awW/IO
	QZll/P+Quv0WoDBUa9toQ==
X-ME-Sender: <xms:yQk5ZPGaN1rUQFna8x-mEYOWpqRABLHNnTDnigPc-y1cEXEuuz67TQ>
    <xme:yQk5ZMWaA3vHTFAFm0TB8jsXd8yq8zVMPQSgdAW0nQMcr0VvOnI6zg7FQ_IVO1uwI
    WEomDhNNQE7tqVr1Mw>
X-ME-Received: <xmr:yQk5ZBI8khikt4OunBDSISlyxnezvojPUH8T_esH9BFlF-bwI-P7zr6-3vbt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekledgudeftdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
    ekredtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigr
    nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeefledufeehgedvue
    dvvdegkefgvddttedtleeiiefhgeetudegkefhvdfhjeeftdenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflh
    ihghhorghtrdgtohhm
X-ME-Proxy: <xmx:yQk5ZNErtxlHLeys8ijlcAKbYz7HTa4eEEFYhmvmWf5VKAQYDnc_Kw>
    <xmx:yQk5ZFUyS2MyJW4W78tQ2h7rMKtCtBHpqj2LDafPyyXol4abHT25QA>
    <xmx:yQk5ZINof3PxJ80zj0KkwvOOct6nSYvmGoXxDD7axp3gNqONtY-c6w>
    <xmx:yQk5ZDek-AYqrtYk0JOtlo8BlreI9jkTylZJaeeT_maJ9QxUp7l3rA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Apr 2023 04:07:36 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: linux-mips@vger.kernel.org
Cc: llvm@lists.linux.dev,
	tsbogend@alpha.franken.de,
	ndesaulniers@google.com,
	nathan@kernel.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 7/7] MIPS: Limit MIPS_MT_SMP support by ISA reversion
Date: Fri, 14 Apr 2023 09:07:01 +0100
Message-Id: <20230414080701.15503-8-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230414080701.15503-1-jiaxun.yang@flygoat.com>
References: <20230414080701.15503-1-jiaxun.yang@flygoat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MIPS MT ASE is only available on ISA between Release 1 and Release 5.
Add ISA level dependency to Kconfig to fix build.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 2374f859e001..a61f860771e2 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2194,7 +2194,8 @@ config CPU_R4K_CACHE_TLB
 config MIPS_MT_SMP
 	bool "MIPS MT SMP support (1 TC on each available VPE)"
 	default y
-	depends on SYS_SUPPORTS_MULTITHREADING && !CPU_MIPSR6 && !CPU_MICROMIPS
+	depends on TARGET_ISA_REV > 0 && TARGET_ISA_REV < 6
+	depends on SYS_SUPPORTS_MULTITHREADING && !CPU_MICROMIPS
 	select CPU_MIPSR2_IRQ_VI
 	select CPU_MIPSR2_IRQ_EI
 	select SYNC_R4K
-- 
2.39.2 (Apple Git-143)

