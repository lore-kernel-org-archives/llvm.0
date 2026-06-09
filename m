Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8085D403B1E
	for <llvm@lists.linux.dev>; Tue,  9 Jun 2026 22:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781043604; cv=none; b=FeMLB867TpBPJoitvaDDGRm5EK9J1BOHrsxDjvMniomSEUQhy58fHCdclnaRwcNdV+fIDs1svhwjM95eiblqGqyyYPsjSIM5aOjw+dc4elrd0bD8FZiRR5wk6sH+jHWJ4Cq+dtADzLt1l0ViKBPgp+ohHzgpjX3kEoVkAjPBPyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781043604; c=relaxed/simple;
	bh=QNstBAc1L91v28F1oF1V1UBDhakUFuGDQ4mwwDQaYVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hIrZ39pMLOB0SIo3JEMQyF1kcfV44g8y/WpMcMRUaAahPuHsfCFUblNo1z+07xI4wQtfp6S4ajj8th9VD0icQMk3INbdv72EDU+EhYUc2UZYoWNkx5VFPyphxPxmVRSIkBGxTCMLHpQdjaqy9QX9DYJgl9AEDo4hsgC7nXxaKoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WsA/0Qtx; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WsA/0Qtx"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c86484d35d1so64349a12.3
        for <llvm@lists.linux.dev>; Tue, 09 Jun 2026 15:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781043599; x=1781648399; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1tT9xKJ0Z4ILZqTxJ8ZpiwY1jbcqBK/pYbLAZ3NF4IQ=;
        b=WsA/0QtxTUiw8oybqAz6Tu8gxe+0OtoDWQeRHx5/o6v2UW4kv3eVjIcZ+gyXAedVjO
         DEPYDvdJO7UhPyVi9rL7S4M2RPx8TWTKxYkzoDkmEQ7cQDB5TebKVU7Vx/5+klX4ZKT2
         zLa7P/eC+uobF8b0fZprIpawtxRPwxMeOiuwJGpkMDcOMfBpfEpYfALW5pOvII3q6qHh
         tOhXBjUooa9ZnOoATk05ynTxJqLHlTYonQFwya6jLsJd27wKEZ1dOlTlROUvnOvxRUE5
         VV8WjXOopAHxo3Fnl5lzTCxE35wQMrrVYbYqADMx7fFF1FFnqzZmJF9GvnZvzq2gM/MO
         A8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043599; x=1781648399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1tT9xKJ0Z4ILZqTxJ8ZpiwY1jbcqBK/pYbLAZ3NF4IQ=;
        b=Mk0Be1ZeNokyuI6Usd+cJMZpaYT51UqBlJBOZITyb6l6WrKcBzG2IJY+bA8GLjMsFe
         TW0UApjUFJI9rjkxbwHw8cOAPrhlh8jzMsblZUOEn6FdFQGorz1kSyRkKooUEXMYZSEE
         GO4LVgipnFliBhtMdg4Xxy60mytYtTSFq4fkL6NJv6dyz5fJUc0lAfnx2itbv6xqnkIr
         Je4dnshd0+Hlge7PnhTGn4UukDPD0sekg2/HszLE49a9TKh20BU+SxW4qsmeuUNIboys
         AxIjxgzIVFONZ8oQNqztEBSgCJn3UEU9zaIQZ1OStqWck/h+nHJzhESSTEd1kuHopgUV
         8uiw==
X-Forwarded-Encrypted: i=1; AFNElJ+2oiQDGDG6bsGu0l8e5Fd/dxuhP3C4yHYWFsMDJoe2/V5DzRgg6kSGFi1PJvRZTNMZkTH2@lists.linux.dev
X-Gm-Message-State: AOJu0YxUEmKn+kUSstZcpjyAGU84IogdMTLWeaekdHintzmP+cJ8Ow9h
	dbQpMQY1mcVkhgyw+zAJYNPfa6sDoQn/qf/sl7EntgPk8BdwKpL4M60v
X-Gm-Gg: Acq92OEtjTp6UVeag2knjwDaRf1T33SmAnYat6kOAAzmJt7EdKeW2P8lDtmosfEDAkZ
	sBnIwZUXSpTSuu51KBskmKnzKcbC1fohjGTBlE1qGVm+Ahm2UaL13HrAfNp7bnO23FS+D/SA1RV
	ULnCNkoFUbQDUXK1Fb9R2YmAjBXo+B6cdGxRccnmFx+i7uomAP/LMmbGPaLS3CuBTUwMUlhQLu7
	y95OjQsTj/7AT2UDFIVPABcnZue3uVZLbpX+/QP6nQAIPafcNDP6vzqnMITtatUay2+4Rd2+foQ
	9dieiq/R4PWXikQXcPu69qwsrqyL8CywJ587e6+m4suoYNxcwgZBTCONx4ArMG1M4NjvGtGvR/b
	O+OUHNnmiDlKfR4SCKkXHrJgsYgZTzQdig48HJnO+LRq5oZLocOkiulv8QC8QQ5WWh22SEvq3he
	iUoe3HsZizrM2k4BReWMZBr98rhDZMhe0zcYQzjHZdUu8NMsxvpAnaWqbifHS4siBANtYmZE9fq
	FiqcZ7rBFEaDnp/ChYb6TEpq08M2MwFjHCuV5x87HfV3A==
X-Received: by 2002:a05:6a21:104:b0:3b4:7eb0:479f with SMTP id adf61e73a8af0-3b4ccd3a851mr24318303637.5.1781043599239;
        Tue, 09 Jun 2026 15:19:59 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04ff24sm19661834a12.14.2026.06.09.15.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:19:58 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Zhang Wei <zw@zh-kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE DMA DRIVER),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv3 07/15] dmaengine: fsldma: fix request_irqs unwind freeing unregistered IRQ
Date: Tue,  9 Jun 2026 15:19:18 -0700
Message-ID: <20260609221926.35538-8-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609221926.35538-1-rosenp@gmail.com>
References: <20260609221926.35538-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When fsldma_request_irqs() fails on a per-channel IRQ, the unwind
loop starts at the current index i, which calls free_irq() on the
IRQ that request_irq() just failed to register.  Decrement i before
the loop to skip the failed channel.

Bug introduced by commit 586f54672b33 ("dmaengine: fsldma: convert
to platform_get_irq_optional()").

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsldma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 4475d50a94f5..c04a7fbd2ed0 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1088,7 +1088,7 @@ static int fsldma_request_irqs(struct fsldma_device *fdev)
 	return 0;
 
 out_unwind:
-	for (/* none */; i >= 0; i--) {
+	for (i--; i >= 0; i--) {
 		chan = fdev->chan[i];
 		if (!chan)
 			continue;
-- 
2.54.0

