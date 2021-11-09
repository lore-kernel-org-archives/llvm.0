Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9D72C96
	for <llvm@lists.linux.dev>; Tue,  9 Nov 2021 01:07:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0DB1561284;
	Tue,  9 Nov 2021 01:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636420073;
	bh=fZXrAMowt1mPhO6b8vKZbcOJ66dxfQP3LqK1emOm2MI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eFFF5u50Swqb8NtLkN64ubK5qlNUCu5iXIce0ecHF6kUha/yDuzpiSfrtnrWoIBCj
	 YYT8g4ZslL1ZNlThlf03e/YEndnBNx4ZHQ7babSe/Wux7ujd2A9HN5kQGJfSoxU55J
	 EhdJoBYzEauX8r4LAnDLBrSzAlqx4P5LMP3FVyS77nAeP5kkWJ2nbEMVyLTXKaI7MY
	 BXSgFtMHeb7v8U6T5N06rXk7darWiBuuVSblxg0018L5ifiNfZvYpXy+8QL6PZKL1d
	 04LAcTpCM2g9v3bGtLpu1kMZucwukCYpi9MpKKejpjiQty0hIcZ1S1QJ799Og49W1L
	 pBCuNiU6G0sbw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sasha Levin <sashal@kernel.org>,
	linux@armlinux.org.uk,
	nathan@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH AUTOSEL 4.14 33/39] ARM: clang: Do not rely on lr register for stacktrace
Date: Mon,  8 Nov 2021 20:06:43 -0500
Message-Id: <20211109010649.1191041-33-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211109010649.1191041-1-sashal@kernel.org>
References: <20211109010649.1191041-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Masami Hiramatsu <mhiramat@kernel.org>

[ Upstream commit b3ea5d56f212ad81328c82454829a736197ebccc ]

Currently the stacktrace on clang compiled arm kernel uses the 'lr'
register to find the first frame address from pt_regs. However, that
is wrong after calling another function, because the 'lr' register
is used by 'bl' instruction and never be recovered.

As same as gcc arm kernel, directly use the frame pointer (r11) of
the pt_regs to find the first frame address.

Note that this fixes kretprobe stacktrace issue only with
CONFIG_UNWINDER_FRAME_POINTER=y. For the CONFIG_UNWINDER_ARM,
we need another fix.

Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/kernel/stacktrace.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/kernel/stacktrace.c b/arch/arm/kernel/stacktrace.c
index ba9b9a77bcd2c..31af81d46aaed 100644
--- a/arch/arm/kernel/stacktrace.c
+++ b/arch/arm/kernel/stacktrace.c
@@ -52,8 +52,7 @@ int notrace unwind_frame(struct stackframe *frame)
 
 	frame->sp = frame->fp;
 	frame->fp = *(unsigned long *)(fp);
-	frame->pc = frame->lr;
-	frame->lr = *(unsigned long *)(fp + 4);
+	frame->pc = *(unsigned long *)(fp + 4);
 #else
 	/* check current frame pointer is within bounds */
 	if (fp < low + 12 || fp > high - 4)
-- 
2.33.0

