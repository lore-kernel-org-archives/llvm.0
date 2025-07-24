Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5861D242D98
	for <llvm@lists.linux.dev>; Thu, 24 Jul 2025 23:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753400231; cv=none; b=MELGL2cHLYATTN2aAQe1vAhE7CjLx9JYV2E6JaE50aglZiPzVev1Th+0uOVmAgXx0USgtg17eiywzMroKYXSJzzXdU/zFSXpvcZa9R/Yttd3yWiWIY5kylyU41F7EUnXDFhfsKSihG6CY+58TjAqMSadiHsAbCjJdCCa+M9Rswk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753400231; c=relaxed/simple;
	bh=h7Os8p1r034RH4lkAG8aM6UqzQvcIU6v8/5QpRCRTlU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lwPcagpHZNfiQNdCh+mokIlPKbOOXU4fKCrR+t9/El8SVXQdJTb6I45AN89NpSW17xD8T8fCF/91PoP5l/OVeWf7AqN2+fl8qO2b/DfmDF2N6+D01tJcECD+nQyabkgTIXVBnmcln8f1aGDlkNJFHf49MGVH98fileXZ8RZi5m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=bfsvGUh/; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="bfsvGUh/"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2350b1b9129so10751565ad.0
        for <llvm@lists.linux.dev>; Thu, 24 Jul 2025 16:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753400230; x=1754005030; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CG5iG7HEmzaJkQJOJy5GwPyyfPnsO8eGyVBmIiBheIs=;
        b=bfsvGUh/7lrAJ0EfrqUK1PZKhnlLobPYXdBTlPb1IwDrzvtTem47jDFfcFLmQG1Zal
         vddb7bXr4nTzrMHQ+/6Gp0lTZazNBQ380QyGYfeHdGTwhO8H66EadA4Wwc0H2IFd7Cx5
         gXu4oEye2eNoSRYvq7jzS63/zwEy0+0zl5a7jdNM26TKoBe9TBfY5hG0PbjJfXtAoupr
         S23J4vrkBekWIEprrCtPAqxLH8k+pfkZNLrM7xHh4AvOBErUcYvwAILAy1Cavt7QgHD3
         GwWu34qpbUCHNDIZIbZ/YwyoPy5wkE0vp2b2KKqn4ARlEDPlmnA/LnCe2DtQW4ph2bbW
         XvQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753400230; x=1754005030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CG5iG7HEmzaJkQJOJy5GwPyyfPnsO8eGyVBmIiBheIs=;
        b=F08UhmM/72CK3dr00XhILm/MaLbHIn5MMsuDISE1cubBp6PBJM6ih0vaxdpdepwKYI
         x2GL+f08I21W5d8lH4aVu0R5+SJrQHsSS8H4YfFYrJncmPMlgiJT/fYakJLQKvK2YOEH
         9ijl8PO1HCgUz6cqQwFl3u4Oy6oZ4si1QpvvRKkdSzynN4FChESNgpL+JbbKMUly2Wyx
         MkZjjdxbA9J6VC6emafhx5d7JTzSJVu3q7Uf0oWb/nn9h/vlZh68a81urlGFYZcnsd4c
         QD0dzjsetMdASdgZJWfsl8nrYGQ1JfisuFAuo9F/QdKxHsNskf+JtqU5mBTeMYXeP6T2
         KNnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj2XpJtwsJg6rPOaH+9JgWCmvIPBVxDk8CxAyYzf3vebcUQQq3Tqq0jjGkPFfEPgGOjuoi@lists.linux.dev
X-Gm-Message-State: AOJu0Yyapn5AgxPtKXQIo06A/Ilu4i2WYGDqEmsoUmi9c+N+YnS07+of
	w9gaxh/21+6AF4wV1rBg6KtocBRgas1xYz/JzRddKhkxfHHzuxOZOpolsKew8ibBGPc=
X-Gm-Gg: ASbGncuSCIecuE5MFaicT61zYbXwOz0wsbNPOG+3Ho3iCwJOEMN5MSJuZTCjKinWPYp
	rmpqqkZXQyN35HfmQRfJqJ2PH6RKV9054m1bgjrUQ7zTCrgR3y7YUVeH0jBAUJGyqTmjAqRL35I
	Da0Jeaz7t3E+LKxREdM6NwTigY+kvLCX734BieWLf+JRjTafUFx2BlVz+XGqFznyCTPrSv67WqX
	dORrYtjQiVU2MqQAywwDhLub5T8s933c8hoXE1jkBdlzGHP+V1bt8i4hRKnjXUMRpr1FWeQOFZ3
	gJCQx8TZ7q9m1yYRXgbfMuyW9oR9qGokjngF7QgL7FBUAQ6iT86NuXfV6axCAFFg03mjDpJnioi
	le+eOmV/L8XTEhK4psKkw2hufWDD0onBL
X-Google-Smtp-Source: AGHT+IFimijtxboQ83ruW5Lf/Edn+u8E7CK8azktAcnwGUUTAe1++zEjf4xwnHFBVkfDbfBbAK27Uw==
X-Received: by 2002:a17:903:2a84:b0:238:2990:6382 with SMTP id d9443c01a7336-23f980de085mr106900615ad.0.1753400229626;
        Thu, 24 Jul 2025 16:37:09 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc706sm23598685ad.106.2025.07.24.16.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 16:37:09 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Jul 2025 16:36:55 -0700
Subject: [PATCH 02/11] riscv: update asm call site in `call_on_irq_stack`
 to setup correct label
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-riscv_kcfi-v1-2-04b8fa44c98c@rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
In-Reply-To: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Monk Chiang <monk.chiang@sifive.com>, 
 Kito Cheng <kito.cheng@sifive.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
 rick.p.edgecombe@intel.com, broonie@kernel.org, cleger@rivosinc.com, 
 samitolvanen@google.com, apatel@ventanamicro.com, ajones@ventanamicro.com, 
 conor.dooley@microchip.com, charlie@rivosinc.com, samuel.holland@sifive.com, 
 bjorn@rivosinc.com, fweimer@redhat.com, jeffreyalaw@gmail.com, 
 heinrich.schuchardt@canonical.com, andrew@sifive.com, ved@rivosinc.com, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

Call sites written in asm performing indirect call, they need to setup
label register (t2/x7) with correct label.

Currently first kernel was compiled with `-save-temps` option and
normalized function signature string is captured and then placed at the
asm callsite.

TODO: to write a macro wrapper with toolchain support.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/entry.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 2660faf52232..598e17e800ae 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -389,6 +389,7 @@ SYM_FUNC_START(call_on_irq_stack)
 	load_per_cpu t0, irq_stack_ptr, t1
 	li	t1, IRQ_STACK_SIZE
 	add	sp, t0, t1
+	lui t2, %lpad_hash("FvP7pt_regsE")
 	jalr	a1
 
 	/* Switch back to the thread shadow call stack */

-- 
2.43.0

