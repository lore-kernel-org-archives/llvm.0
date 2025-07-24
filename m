Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D953424728F
	for <llvm@lists.linux.dev>; Thu, 24 Jul 2025 23:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753400243; cv=none; b=gXI0fil201s0HomAHIZ0OlzqszUGH7ZR5XwlD9BcjJ5qDnGNNfER5gtmGKhTGgoLWRLNcQUitG3FSTQ9BVljNEm50/Iqp4z45DTODPc3z2FAW1qKPmZgmKGQaMoc1hit4SpujgMyCgoUfUZv0mE5ysFqwcoewBrWwlaOv76k1eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753400243; c=relaxed/simple;
	bh=NgW9QCO8Pafn6dRlZF7K76jleyDt5hjCF27uUi1KY9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TZRQoC+adTboSMbHVqd6cgaRpX/YemU/IN7Z+XLadOvvJCH/1d2iYfEE+oTagxBrCMp9DNmCWt+aYnXxxI73KiNUfPVDfBse1QZsM8wkzTnJQqR3ZNop0Pv7RSZS6QraTGPTfi/7XJEN4A2mDRMGqfv84ZkFr+XM8AvE4ne8vuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=W95vB5i1; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="W95vB5i1"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2350b1b9129so10752125ad.0
        for <llvm@lists.linux.dev>; Thu, 24 Jul 2025 16:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753400241; x=1754005041; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yl+fpaUgVvAgmSBmN0Uf0wW/gDpMMKoNCvx2z4Q9Om8=;
        b=W95vB5i1R3Dg+v+lBTjymkJkSw8UH/rDBwidJ9buWehOwDeFPcZQTw9U7BrIeIGp8U
         mIm+1vNton/CzqTsdoavwvYREew5uqi7oMc1vxYEQqmuWVjvApWBEKOBZLxEhK8ixiBF
         R4hNmFCq5J7GHjqoG6lqfljxPNaJ11Vsc191aAMxBEs0iP9JrvjOTkQxommcftXo2IJu
         e80LDobkGEwUJ+Ws5RC9CKn62EeroIumwVbNBGPdrem0bwbM7bJNPmO/TjbFxEe+MtYM
         rXb9O3sIdlrGQYmMolOulwrRrBnXQ4sZJYXiR0dTplDYwVHQnmSKsvQwg5Q05w/YewY7
         dncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753400241; x=1754005041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yl+fpaUgVvAgmSBmN0Uf0wW/gDpMMKoNCvx2z4Q9Om8=;
        b=dN82nkawQ4GMjnPC7r440KFBp5Ag8I3EPJNyusYas72lvW/cMPj+SP88BVvyDEwTuN
         qV8ckTfTL/ev8vDniBLD3KRX77LCkcyDr9ff2bI/EwOnmD8O6TlkAE+sv4V2JGYKqzcO
         7OGKtn8qmYg2AI5gaxzhSUVzqP/AtOEbJOk+WhE6KqWDqYeDe2jik0RDwSVrMFSlSwQX
         tKs8WnDQ5YzyP/VAdwqp5d8lNC4lO90hO8roVCbjQoNV4R76T9BJt1XKxuSDP5BXyrT4
         pmHu4Y3oBIs2cJD6f7DivPQSAlQVu3bGzXVxlqQK8Y4m3IBZ+rAHOuAj36jbaw3ifRIF
         AzmA==
X-Forwarded-Encrypted: i=1; AJvYcCVdVaUrOSFrhxhpgjoGKHxC6v3Bq2gdUED1QFOjxwpqpoPypSDdj1a6hO0A1ti9BWPgjd1t@lists.linux.dev
X-Gm-Message-State: AOJu0YwzFLJzKStbeZ66N9nWzkEPWrrXyJOMPF4QGzarmdqVqTyucPU3
	q+dvVGPovbsiSHfWvA2bzYyn8FJLczkkq+zRvIPFl9dyC0mHMGIb5vVryXa0+JDvOr0=
X-Gm-Gg: ASbGncuAP6A4H4NtiSEdCv41jbJXFuTZVN/Me8Z2+qK0nZxP9Fksf26ZVTkQBLleETP
	x5bJ+IER9vxE9LE/4Z4d9c/dCNprdIDWL3GC0NTF8FUQFR4kWeEl1GuEgFIDkMQoU3kB/fp+9A0
	+IY34wMaavpxurjU9eO19x4OmmH9HeRl86sc6Gl6xxDaeP9bAUXS6XkJxZdOymHUrO55a46raEO
	tkL8QogkjtaFD/t9njhRKUMUE424ZbgNjTUuCzTS4AlJ3wG/q81RLrUeKMZ1CB+hni4eSnzvnmx
	mF02ijxS5tHAZF701pzQ75lCYGNjpArygCZ6M3jnr23FyOltRALOr29pL+vrnOnlZfs3p1/lXE5
	yys2qIGPQcQiKkD62GKTcYbWVzWMeVf63
X-Google-Smtp-Source: AGHT+IEFvddaBDkybC2q7ob0zwYNRuGaOi2n4X57ciJYKI00Yd6EYfDqXnoJ8jUoGCKUz8NAesStww==
X-Received: by 2002:a17:902:fc48:b0:23f:8df8:e7b1 with SMTP id d9443c01a7336-23f9820d012mr133037965ad.32.1753400241217;
        Thu, 24 Jul 2025 16:37:21 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc706sm23598685ad.106.2025.07.24.16.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 16:37:20 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Jul 2025 16:37:00 -0700
Subject: [PATCH 07/11] scs: place init shadow stack in .shadowstack section
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-riscv_kcfi-v1-7-04b8fa44c98c@rivosinc.com>
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

If compiled scs and arch kernel shadow stack support, place shadow stack in
`.shadowstack` section.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/init_task.h |  5 +++++
 init/init_task.c          | 12 ++++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/include/linux/init_task.h b/include/linux/init_task.h
index bccb3f1f6262..a2569cc5a7ff 100644
--- a/include/linux/init_task.h
+++ b/include/linux/init_task.h
@@ -40,4 +40,9 @@ extern struct cred init_cred;
 /* Attach to the thread_info data structure for proper alignment */
 #define __init_thread_info __section(".data..init_thread_info")
 
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
+/* init shadow stack page */
+#define __init_shadow_stack __section(".shadowstack..init")
+#endif
+
 #endif
diff --git a/init/init_task.c b/init/init_task.c
index e557f622bd90..e21af9db5c09 100644
--- a/init/init_task.c
+++ b/init/init_task.c
@@ -54,10 +54,18 @@ static struct sighand_struct init_sighand = {
 };
 
 #ifdef CONFIG_SHADOW_CALL_STACK
-unsigned long init_shadow_call_stack[SCS_SIZE / sizeof(long)] = {
+unsigned long init_shadow_call_stack[SCS_SIZE / sizeof(long)]
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
+	/* shadow stack must go in special section */
+	__init_shadow_stack = {
+	[0] = SCS_END_MAGIC
+};
+#else
+	= {
 	[(SCS_SIZE / sizeof(long)) - 1] = SCS_END_MAGIC
 };
-#endif
+#endif /* CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK */
+#endif /* CONFIG_SHADOW_CALL_STACK */
 
 /*
  * Set up the first task table, touch at your own risk!. Base=0,

-- 
2.43.0

