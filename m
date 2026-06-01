Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A56F1D6195
	for <llvm@lists.linux.dev>; Mon,  1 Jun 2026 02:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780280056; cv=none; b=sQTGSMcLoS7tGGzE60CyC4R36g4/MJqnxmP6SYxJshSIjtDI/DyeN/Nvx3D2b+/QgFrPf4+m4T28cIyeKG+KrHHLVMuq+yXPPcIFjI8jo9wtVvkw41UlkrN6SOtMI1KyOLazXS65VKcjU4vtd3fV3krQuY9wmEvKrkQ0HhrApxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780280056; c=relaxed/simple;
	bh=ApywM32w3xP8JdiWd/z3UPrLc/O8BblXkqZWzABDwAM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tsjXuw8fe8IkZMknXazq9y8X1iHRtOJoPV4BDQS1btiSPxwpWZdN9hATRnDsqf8ywePrzt/KOHV1s0P3KcGrMIaWqlJM3A1/INbn7W6QEk5qYn//MS3DTm8Vsd/NmR4KQZN2+OndbwwA3X1Tvk9mC9TDKxWrNgme+K+d1A8A37w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PaM44NXC; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PaM44NXC"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-45ef5146b56so1291449f8f.0
        for <llvm@lists.linux.dev>; Sun, 31 May 2026 19:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780280053; x=1780884853; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4uZKitu/k9/5JSANzvOomViSDb/g+Kd/QgmGZPTwZXg=;
        b=PaM44NXCUoOx/NRALbPtb1atfGpZb4Z9gj/jUqrxXnZtOjBSS/453b6fuqz1jv3pIq
         JTFuHrcr3MIUfZ3AWpmDmFtQRNyOVaD95CceNvM8PmAaw4JMmVbU1kBEnUwkDZIC16xY
         ba94uuqJ2GHAf28SApe6rFkIh1rByIB6xLeidUtpGQuCgTLoo8dP+VOmAeUQT0/1NUuH
         NzfojuhNWopupLQjnnIjAsT8Dg/8x6kiC1CY3N1jFNwY1MTTNYRGby+Cs4JvC23dv+/u
         wvQlzb1RkwhlWyM5FyQLfZs8WOBENBvGMC9eDonQiMZBCqIMuR6LNedyfXdjXBUtHKe5
         B0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780280053; x=1780884853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4uZKitu/k9/5JSANzvOomViSDb/g+Kd/QgmGZPTwZXg=;
        b=YAjrIA3OCjj58Y2gImGkjj8KLGYO7/NXno7aDc1pnUeDQ/9nr/lg3lhYWhVyTsyPW4
         +vixibt6qgOLJ8Ub+duW8Jnc3R+C+/yql8SZoBS9HK4sKTILf0lkz0vlLggnraBlP1XQ
         rky/GhQp/e2KaxNqv36yv5L0R+Xg+Z4/2xKDIwo/PizbQDrCmREvpu/c1n+jCcaotYTh
         cOGpsBcweXcdmvajNxT0cbEQ9gkzBMLFlHxy/KFFB5qLJl70wkMeBjPjTVkaTbxJ4m+f
         wAONJgX+uhtOBwYcDUCYthf4wZumwm1LKYgEE2GaZIJ8rD4YHQyBFN+oVqzMu0kxJyMC
         GHBA==
X-Forwarded-Encrypted: i=1; AFNElJ+EDWtZtW4Nz0zhTipYyxrJwDFaqeugYeR4/bpQiSYzVMWr+jmBVy/T85MVBL+usyhD2doQ@lists.linux.dev
X-Gm-Message-State: AOJu0YzyvDQgHSqh3juZ60cJ+Wpful3pn6B/SDkCxELyS7QbQh+auP6y
	xSIZLFzqUqFPfG0/AVI37Eqiat3rXJFndPVjpPfVRBbTSDyZkNr0rLaw
X-Gm-Gg: Acq92OFAA+ttlHtaEn/ZbtXcYMngBFVd0vqltb3lqrghm/xfmBscP+SIjJg/gS8I63t
	jav9Sq07yD1Ko9xyYf15t24VqjjS7M/sVRkalSqi9Q5NDqLwDh/m553O88+NIibaV4erQGuqd6g
	36o5fTgyaTBsUDXnWByh0UeUo/kt0MJCTSbPYG9mq9aokhdTat2RNrSiKM1xRc2WiL9oFj83Maq
	iP6Z8j1sUPZRUYdAExnWRaVBQi541EcAwZ+z5zJfa3V5o/bvgh6bAwqiegeO52TdpHVqb3U6KF0
	j8Ifnesn3QP93XluZobnev5K8HWPL6i+/FBQMj3CMMw8xTuDr7/Flnb2AugBgdsGk1nwHtB51yP
	0YlMOilLzYh9B2fY/+NT+tfYJA9FVXISmU+b2+HWk/zsdtEDN8PDNWVtKXG5gP+2W0n3o94mqg3
	G3Gs2nZXi2NgBBQ7b85v0SH+ckMdRW06/k8y56sfmoj8zBbrhQRSpPfeMOUzwg
X-Received: by 2002:a5d:4489:0:b0:460:11a7:f82e with SMTP id ffacd0b85a97d-46011a80429mr1488423f8f.8.1780280052463;
        Sun, 31 May 2026 19:14:12 -0700 (PDT)
Received: from lima-ubuntu.hz.ali.com ([47.246.98.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a0374sm19735955f8f.2.2026.05.31.19.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 19:14:11 -0700 (PDT)
From: Qing Wang <wangqing7171@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Ingo Molnar <mingo@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Qing Wang <wangqing7171@gmail.com>,
	syzbot+185a631927096f9da2fc@syzkaller.appspotmail.com
Subject: [PATCH] rseq: fix using an uninitialized stack variable in rseq_exit_user_update
Date: Mon,  1 Jun 2026 10:13:59 +0800
Message-Id: <20260601021359.3679327-1-wangqing7171@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is an bug which is an uninitialized stack variable use in
`rseq_exit_user_update()` reported by syzbot:

BUG: KMSAN: kernel-infoleak in rseq_set_ids_get_csaddr include/linux/rseq_entry.h:502 [inline]

The local variable:
```c
	struct rseq_ids ids = {
		.cpu_id	 = task_cpu(t),
		.mm_cid	 = task_mm_cid(t),
		.node_id = cpu_to_node(ids.cpu_id),
	};
```
According to the C standard, the evaluation order of expressions in an
initializer list is indeterminately sequenced. The compiler (Clang, in this
KMSAN build) evaluates `cpu_to_node(ids.cpu_id)` *before* `ids.cpu_id` is
initialized with `task_cpu(t)`.

This is fixed by moving the assignment of ids.node_id outside the structure
initialization.

Reported-by: syzbot+185a631927096f9da2fc@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=185a631927096f9da2fc
Fixes: 82f572449cfe ("rseq: Implement read only ABI enforcement for optimized RSEQ V2 mode")
Signed-off-by: Qing Wang <wangqing7171@gmail.com>
---
 include/linux/rseq_entry.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/rseq_entry.h b/include/linux/rseq_entry.h
index 63bc72086e75..e05f4c18f39e 100644
--- a/include/linux/rseq_entry.h
+++ b/include/linux/rseq_entry.h
@@ -638,8 +638,8 @@ static __always_inline bool rseq_exit_user_update(struct pt_regs *regs, struct t
 	struct rseq_ids ids = {
 		.cpu_id	 = task_cpu(t),
 		.mm_cid	 = task_mm_cid(t),
-		.node_id = cpu_to_node(ids.cpu_id),
 	};
+	ids.node_id = cpu_to_node(ids.cpu_id);
 
 	return rseq_update_usr(t, regs, &ids);
 efault:
-- 
2.34.1

