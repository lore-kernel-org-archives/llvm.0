Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DA2248893
	for <llvm@lists.linux.dev>; Wed, 24 Jun 2026 05:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782280173; cv=none; b=Sjj5mr6uNNpdwWuDkEkjxeICayJ3GGuckAhXsTMGaqUVsZU83oKO+mzyHxL6xed7jAyR71Z5sX902jRBKtuFRKtS4qg0pof+wYm7dZbdL6QM/zo0Ob+eXE94sGbwESsdvrPBnikF38ySW6JUaYq4VrZy5KwCd4VUW7zlqUqSSM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782280173; c=relaxed/simple;
	bh=2UD1Ba21SO0RJefYK7/wC/wRqJz6OROXKyJEZo4WrbM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=fbSKnTGvaN3RD/mBzCnbyeAh0BNaPCEVgLP2hfP8Xli3B3UQ2Eciny/n7ExbhEUuqy7H4WquqQyUdbpip55HcxVAQipHWqaQ3bwDuB4ce4nGiQCOxh5BJ9f954AIsO9F57cT5ofFilH8QoEU3glOLC2sjJzUU5k2i8HVO79Kf5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=rx7sddxA; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rx7sddxA"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260624054928epoutp0300459409c8602338d3f5f608265c8871~77l7XWN6V1529215292epoutp03j
	for <llvm@lists.linux.dev>; Wed, 24 Jun 2026 05:49:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260624054928epoutp0300459409c8602338d3f5f608265c8871~77l7XWN6V1529215292epoutp03j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1782280168;
	bh=RAptsAgRillTg9ihT9mp4dczw3MEuFVKsPPvJnifRS8=;
	h=From:To:Cc:Subject:Date:References:From;
	b=rx7sddxAROcoIyFgKQnVLRgzSJX+uvFRxS0ZNmhv5Ls5blmhw66Ghlrrng0IR9p8K
	 3bRlWuKcWQ6Zzu8DheUu3h9KExURH8o323o2QQgU3SB4eiZ7/Smy3WjJvl5sueQYy6
	 riUnEsrWseYsAWR+bp1mikiZKmHSQXteEQMjXDHg=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260624054928epcas5p46b037bda448e455f9122a95a9983e626~77l6ziEe72827228272epcas5p43;
	Wed, 24 Jun 2026 05:49:28 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4glWGc0CxWz6B9m9; Wed, 24 Jun
	2026 05:49:28 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260624054927epcas5p3f8e7be966570a89e722cc718475320fa~77l6Xya9_0735707357epcas5p3d;
	Wed, 24 Jun 2026 05:49:27 +0000 (GMT)
Received: from localhost.localdomain (unknown [107.97.243.203]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260624054925epsmtip2374dda9b4bc1ecbabe76c265023d0a94~77l4mCgzd2341323413epsmtip2r;
	Wed, 24 Jun 2026 05:49:25 +0000 (GMT)
From: Maninder Singh <maninder1.s@samsung.com>
To: linux@armlinux.org.uk, nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com
Cc: onkarnath.1@samsung.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, r.thapliyal@samsung.com,
	Maninder Singh <maninder1.s@samsung.com>
Subject: [PATCH 1/1] arm: backtrace-clang: fix wrong sp usage for unwinding
Date: Wed, 24 Jun 2026 11:19:16 +0530
Message-Id: <20260624054916.1571701-1-maninder1.s@samsung.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260624054927epcas5p3f8e7be966570a89e722cc718475320fa
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20260624054927epcas5p3f8e7be966570a89e722cc718475320fa
References: <CGME20260624054927epcas5p3f8e7be966570a89e722cc718475320fa@epcas5p3.samsung.com>

show_stack() can be called for any task, however c_backtrace always unwinds
frames based on the "sp" register. This results in printing the backtrace of
the current task instead of the target task.

Try with normal TC:
==================
       for_each_process(p) {
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

With fix:
=========
[13.933732] task:kthreadd        state:S stack:0     pid:2     tgid:2     ppid:0      task_flags:0x208040 flags:0x00000000
[13.934165] Call trace:
[13.934604] [<80afa1a8>] (schedule) from [<8015426c>] (kthreadd+0x124/0x208)
[13.934654]  r10:8100bbf0 r4:8116f440
[13.934664] [<8015426c>] (kthreadd) from [<8010010c>] (ret_from_fork+0x14/0x28)
[13.934691] Exception stack(0xf081df9c to 0xf081dfe4)

Additionally, the extra manipulation of "sp" register appears unnecessary in the "current"
task also since the "fp" register is already provided.

Signed-off-by: Onkarnath <onkarnath.1@samsung.com>
Signed-off-by: Maninder Singh <maninder1.s@samsung.com>
---
 arch/arm/lib/backtrace-clang.S | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/lib/backtrace-clang.S b/arch/arm/lib/backtrace-clang.S
index 290c52a60fc6..993410a6afd1 100644
--- a/arch/arm/lib/backtrace-clang.S
+++ b/arch/arm/lib/backtrace-clang.S
@@ -105,10 +105,6 @@ ENDPROC(c_backtrace)
 		moveq	mask, #0xfc000003
 		movne	mask, #0		@ mask for 32-bit
 
-/*
- * Switches the current frame to be the frame for dump_stack.
- */
-		add	frame, sp, #24		@ switch to false frame
 for_each_frame:	tst	frame, mask		@ Check for address exceptions
 		bne	no_frame
 
-- 
2.34.1

