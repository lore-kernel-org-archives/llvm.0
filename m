Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48423CD8CA
	for <llvm@lists.linux.dev>; Wed,  5 Aug 2026 04:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785905730; cv=none; b=T0KemxPdd+oIwZMtmFCrGmjTCOfQoa+fVryAommuLZDfmIX/bVXE9kdN8LhQRGB74p2vmnVvhIa6IMSUjy8/xWdpae7joxVS509+oRnYktgrQYcA+OoK8ZcwHfxLBD30WNutJFMyw23Skim/dTiuveZilNC7WU05wRiX3nFH6/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785905730; c=relaxed/simple;
	bh=7lgQOwwROlLGGMojdu8y+B4QlhHHE/gcFh6eszEYRig=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=iggZ611xXulcIztsmFuUky1MjdJeaEMnNElgfiLo810ynomo11ahSZrKA2JLWijWL9GLtggagTlT9MysgzNjG2jtR5p1Jv8lfCA2dBxJ7KY1aFM0YwsSS43bnt9W3j4n58raKCSXzagfBbwX+/tizyjVYzj7vFyXCQIVgdSNngM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=uPSXaU4D; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="uPSXaU4D"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260805045523epoutp03fc668e40a44ffdcb721f1dc25f1a12be~Iz8sRjCeT1510615106epoutp03M
	for <llvm@lists.linux.dev>; Wed,  5 Aug 2026 04:55:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260805045523epoutp03fc668e40a44ffdcb721f1dc25f1a12be~Iz8sRjCeT1510615106epoutp03M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785905723;
	bh=959m67otqZAOB+bSiozvknK6yQHUeLEn+YS7gQXp5TY=;
	h=From:To:Cc:Subject:Date:References:From;
	b=uPSXaU4D8V+nVqEjxUA+Kvts5fsDqmwlcYZRMnrG578Ez5wvogREABXO0X0J7QQXg
	 4jPSQFl2+MmQBnfFsguB2OS5HIeAvDiFDo/Nh2VlcbRy9L3CR7q8IfQNE5odSKz6B1
	 jq/0cVwAw6tZMA+CRfqG5Opx93mYY777d+PkSfxY=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260805045523epcas5p2c75c6803f516f2ebf2e07bf6225edbb8~Iz8sDk7II1688716887epcas5p2s;
	Wed,  5 Aug 2026 04:55:23 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4hFJ4q09zjz6B9m9; Wed,  5 Aug
	2026 04:55:23 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260805045522epcas5p39659721ef26a447b71e860c2990a60c0~Iz8r2ADa41503215032epcas5p3K;
	Wed,  5 Aug 2026 04:55:22 +0000 (GMT)
Received: from localhost.localdomain (unknown [107.97.243.203]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260805045520epsmtip10dfef74adc619443291cdf7c438bc991~Iz8p2RuEP2630826308epsmtip1H;
	Wed,  5 Aug 2026 04:55:20 +0000 (GMT)
From: Maninder Singh <maninder1.s@samsung.com>
To: ardb@kernel.org, ndesaulniers@google.com, linux@armlinux.org.uk,
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com,
	justinstitt@google.com
Cc: onkarnath.1@samsung.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, r.thapliyal@samsung.com,
	Maninder Singh <maninder1.s@samsung.com>
Subject: [PATCH v2] arm: backtrace-clang: fix wrong sp usage for unwinding
Date: Wed,  5 Aug 2026 10:25:14 +0530
Message-Id: <20260805045514.1599433-1-maninder1.s@samsung.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260805045522epcas5p39659721ef26a447b71e860c2990a60c0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20260805045522epcas5p39659721ef26a447b71e860c2990a60c0
References: <CGME20260805045522epcas5p39659721ef26a447b71e860c2990a60c0@epcas5p3.samsung.com>

show_stack() can be called for any task, but c_backtrace is always
unwinding frames based on "sp" register.

Which leads to printing backtrace of current task instead of
required task.

Try with normal TC:
==================
       for_each_process(p){
               sched_show_task(p);
       }

[7.433271] task:kthreadd        state:S stack:0     pid:2     tgid:2     ppid:0      task_flags:0x208040 flags:0x00000000
[7.433633] Call trace:
[7.433640] [<80113418>] (dump_backtrace) from [<80113510>] (show_stack+0x14/0x18)
..
[7.433676] [<8016749c>] (sched_show_task) from [<803cb324>] (meminfo_proc_show+0x6c/0x930)
[7.434019]  r5:8158e300 r4:8b4882d0
[7.434024] [<803cb324>] (meminfo_proc_show) from [<80365788>] (seq_read_iter+0x148/0x4bc)
[7.434045] [<80365788>] (seq_read_iter) from [<803c044c>] (proc_reg_read_iter+0xb8/0xc4)
[7.434060] [<803c044c>] (proc_reg_read_iter) from [<80377104>] (copy_splice_read+0x228/0x308)

It should unwind frame based on passed "fp".
(CONFIG_UNWINDER_FRAME_POINTER=y)

Extra sp manipulation is needed only when c_backtrace()
is called from dump_backtrace() with "frame == fp" i.e.
NULL regs and not current task. (Suggested by Ard Biesheuvel)

Otherwise passed "fp" should be used to unwind backtraces.

With fix:
=========
[13.933732] task:kthreadd        state:S stack:0     pid:2     tgid:2     ppid:0      task_flags:0x208040 flags:0x00000000
[13.934165] Call trace:
[13.934604] [<80afa1a8>] (schedule) from [<8015426c>] (kthreadd+0x124/0x208)
[13.934654]  r10:8100bbf0 r4:8116f440
[13.934664] [<8015426c>] (kthreadd) from [<8010010c>] (ret_from_fork+0x14/0x28)
[13.934691] Exception stack(0xf081df9c to 0xf081dfe4)

Signed-off-by: Onkarnath <onkarnath.1@samsung.com>
Signed-off-by: Maninder Singh <maninder1.s@samsung.com>
---
v1 -> v2: don't ignore sp manipulation completely, instead use it for NULL regs.

 arch/arm/lib/backtrace-clang.S | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/lib/backtrace-clang.S b/arch/arm/lib/backtrace-clang.S
index 290c52a60fc6..bf9738070af7 100644
--- a/arch/arm/lib/backtrace-clang.S
+++ b/arch/arm/lib/backtrace-clang.S
@@ -107,8 +107,10 @@ ENDPROC(c_backtrace)
 
 /*
  * Switches the current frame to be the frame for dump_stack.
+ * (Only in case of current task using current registers)
  */
-		add	frame, sp, #24		@ switch to false frame
+		cmp	frame, fp
+		addeq	frame, sp, #24		@ switch to false frame
 for_each_frame:	tst	frame, mask		@ Check for address exceptions
 		bne	no_frame
 
-- 
2.34.1

