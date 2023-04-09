Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500441FC2
	for <llvm@lists.linux.dev>; Sun,  9 Apr 2023 10:43:29 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 58C2C320076F;
	Sun,  9 Apr 2023 06:43:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sun, 09 Apr 2023 06:43:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1681037007; x=
	1681123407; bh=GnOjAlW4cFLZB5e9fEbCpcj/9ZFTx5uDLBq5V/Tp2os=; b=P
	cGaozlAWWfKBnGkm/9+Z8zBQf/0/y/hz+FjWEVJ2tTXYJcunVS0WIkFSl5If8yP+
	KLeaZtzTV23IbXGk41VcHkKoKEbHPOn2UgeDIGJHDGZie07AeoaLiCDH/AjbicCv
	RTGdGRnrIada/IqsmWZDHOb0l/Mrum6IZTVK924x2BB60roEqVjkTBIUHEdEhzma
	MZLBROr+S1wTLeQjEtxCaF+exwYLMqYS6Dq73eA+wWVgf1D2SVFq8y54VVC3kn8A
	FB1aclo1SWb50CC3E03la0c/GbYxz+EIc6yVmGt6/yqSh+rnt3aidmDqmZ/MJWfd
	LLZtbz7XKxcAZvByNpIcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1681037007; x=
	1681123407; bh=GnOjAlW4cFLZB5e9fEbCpcj/9ZFTx5uDLBq5V/Tp2os=; b=h
	ZHmj3jOB7FiKa4Bs6NPob85d8nAYtNYNs8pDmdmHorp45Z+4Y/+zP8RCfaAJ2Lr3
	PvJGRYcRTAkFCxsJbHg2HcST+iOhZQhJhqI3vpgfIRbJyGqviGRI2bTtpoUa+TZE
	ZouzPcyloZ8WkKu7Hp55xV+SAVe2RKsV6I97HXR/1yD+72DZfNBIhNpmdwwxfhAV
	f8Gv86EvvmG85dzOVVM1vjq0dLjtNNtDal4zpeSnHJT+i7m10wtDd/WAoriyjgCe
	r8HwylGpY9r/+XDqvpMtUnqCtjUBfSJZzMcogniVWwintCjEz5hTiCTpD0dz6EjV
	/qNseF3x39OeYKcpBJcTA==
X-ME-Sender: <xms:z5YyZBbZqIabt6bUjtY4HUEvq4aeogNDPRJD8b8YFofdmvIPFbK0Fg>
    <xme:z5YyZIZOLIUlOVfZsa6Kc3rnAlmzTO5687pV9VPR4F39Zx0p6K5-Cmzd-575Lsabb
    fNw0jm26Q9uohmyaNs>
X-ME-Received: <xmr:z5YyZD8rUhHz5A5bHO8yRLe3HkuVWgymQr-bGVhfAnx_FfZVSPPivIlDzz4M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdektddgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:z5YyZPpvzvd_Y6tJOrwZ-TzG2Pp842mdS0k9uDiMb-4d9AgVgPnCBg>
    <xmx:z5YyZMoNPD6OCr8VdxObOwDvB7S-ePZD-DtO5B2M0NE9xzipI40YIA>
    <xmx:z5YyZFT3E9eLbrXGs5jdC0BXVC5rUxZy_akTY-dSIPXRtm024duSgg>
    <xmx:z5YyZFnmpym2HxrdfRQftuq_FB9gI-SFUSj47JGRY5MD2Dpw8ZmK4Q>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 9 Apr 2023 06:43:26 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: linux-mips@vger.kernel.org
Cc: llvm@lists.linux.dev,
	tsbogend@alpha.franken.de,
	ndesaulniers@google.com,
	nathan@kernel.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 4/8] MIPS: asmmacro: Restore fp macro after undef
Date: Sun,  9 Apr 2023 11:43:05 +0100
Message-Id: <20230409104309.13887-5-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230409104309.13887-1-jiaxun.yang@flygoat.com>
References: <20230409104309.13887-1-jiaxun.yang@flygoat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fp macro is used by several place to reference frame pointer.
Restore macro at end of file with {push,pop}_macro pragma to
avoid break other assembly files.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/asmmacro.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/include/asm/asmmacro.h b/arch/mips/include/asm/asmmacro.h
index 2491a6c68390..de9688911cae 100644
--- a/arch/mips/include/asm/asmmacro.h
+++ b/arch/mips/include/asm/asmmacro.h
@@ -20,6 +20,7 @@
 #endif
 
 /* preprocessor replaces the fp in ".set fp=64" with $30 otherwise */
+#pragma push_macro("fp")
 #undef fp
 
 /*
@@ -655,4 +656,6 @@
 	.set	pop
 	.endm
 
+#pragma pop_macro("fp")
+
 #endif /* _ASM_ASMMACRO_H */
-- 
2.39.2 (Apple Git-143)

