Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F2D171AE
	for <llvm@lists.linux.dev>; Mon,  8 May 2023 11:54:52 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1a50cb65c92so30388535ad.0
        for <llvm@lists.linux.dev>; Mon, 08 May 2023 04:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683546891; x=1686138891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyhfCZ5csOlZFGV4bhDymGpgdY5PFJC+Se96opk/VAw=;
        b=mZVolCAzG8wvIf6oLT4D4ZY0rlzt0iN1IwMS4s8MGydTIshmGFWZmlzbShfdzJOuBW
         px2AO5xanvA1J4MGpklcisJXnEEqeF//ddT/JS6zappzr1KbcZ1cDxjBNH/A6h3+gbA8
         Z7CohGl6S5DR78mc3xk2ypWYhJvMw01eEs7obS4aSo6CTG/pvT9MZF8oywQI8QZn89rq
         7+iiLWswwwgBc2etohzciXWK2a0h9JdMrdKMKYI+uTPQ3lzwut4nG8jzhqgfjVqMee8E
         uUVdk5gYm0y74iCLkXN6AuWLTotIsWxKoyS9SExB+rM/4pjksv/WO50M3ug19w1NVtYp
         MkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683546891; x=1686138891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VyhfCZ5csOlZFGV4bhDymGpgdY5PFJC+Se96opk/VAw=;
        b=YuhRZMAelzmBewhefx08BblRRQIMXyvqHXJvIZN/kxeFXgQiUt+Sf3jE3z1BkAt/lO
         Sf2jc/w6/bFZoheVc+YPGc9S/4LNTbXAcL40ET3ktjL0CgII1NIZhSDxqqrQ+ruy5Bg6
         ItmJAa/awlrYG+yIhWwernjBPm7A9+bs4WkMdfMwKgmHzl0Ml20UcywUUbrkT4vxWE8U
         0SP7WZSY8HPUJu7FRbQelMZzDWrx51L+S41XhWCbpRwSdy0X3OGt7/mM6IQYtGBkTx69
         qUWVS/do9yMiamgSQ7Kgm67YN0ERfGzU9raMXuSihWMtn6NsF9JLiu5b0VtfQbVif1Pw
         cLyw==
X-Gm-Message-State: AC+VfDwbJWWQN1pV9zCzO6QkXKHcDVdtSyUJwl9DRXXh8gNaQRDGrUxf
	p/Wxsqoet0xagVd9M5vbvIP5Uw==
X-Google-Smtp-Source: ACHHUZ7fIR3m0mAK+PAQajTnE1Ep8+CpD/PcOgSSG5R7OWV3PrMXc4KDXQ6LmGExgO8pEE9BvOM6Dg==
X-Received: by 2002:a17:902:d701:b0:1ab:624:38cb with SMTP id w1-20020a170902d70100b001ab062438cbmr9348824ply.14.1683546891602;
        Mon, 08 May 2023 04:54:51 -0700 (PDT)
Received: from sunil-laptop.. ([106.51.189.144])
        by smtp.gmail.com with ESMTPSA id w9-20020a170902904900b001aaed524541sm7015149plz.227.2023.05.08.04.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 04:54:51 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Weili Qian <qianweili@huawei.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Marc Zyngier <maz@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH V5 14/21] RISC-V: cpu: Enable cpuinfo for ACPI systems
Date: Mon,  8 May 2023 17:22:30 +0530
Message-Id: <20230508115237.216337-15-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230508115237.216337-1-sunilvl@ventanamicro.com>
References: <20230508115237.216337-1-sunilvl@ventanamicro.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On ACPI based platforms, few details like ISA need to be read
from the ACPI table. Enable cpuinfo on ACPI based systems.

ACPI has nothing similar to DT compatible property for each CPU.
Hence, cpuinfo will not print "uarch".

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpu.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index c96aa56cf1c7..5de6fb703cc2 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -3,10 +3,12 @@
  * Copyright (C) 2012 Regents of the University of California
  */
 
+#include <linux/acpi.h>
 #include <linux/cpu.h>
 #include <linux/init.h>
 #include <linux/seq_file.h>
 #include <linux/of.h>
+#include <asm/acpi.h>
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
 #include <asm/hwcap.h>
@@ -283,23 +285,35 @@ static void c_stop(struct seq_file *m, void *v)
 static int c_show(struct seq_file *m, void *v)
 {
 	unsigned long cpu_id = (unsigned long)v - 1;
-	struct device_node *node = of_get_cpu_node(cpu_id, NULL);
 	struct riscv_cpuinfo *ci = per_cpu_ptr(&riscv_cpuinfo, cpu_id);
+	struct device_node *node;
 	const char *compat, *isa;
 
 	seq_printf(m, "processor\t: %lu\n", cpu_id);
 	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
-	if (!of_property_read_string(node, "riscv,isa", &isa))
-		print_isa(m, isa);
-	print_mmu(m);
-	if (!of_property_read_string(node, "compatible", &compat)
-	    && strcmp(compat, "riscv"))
-		seq_printf(m, "uarch\t\t: %s\n", compat);
+
+	if (acpi_disabled) {
+		node = of_get_cpu_node(cpu_id, NULL);
+		if (!of_property_read_string(node, "riscv,isa", &isa))
+			print_isa(m, isa);
+
+		print_mmu(m);
+		if (!of_property_read_string(node, "compatible", &compat) &&
+		    strcmp(compat, "riscv"))
+			seq_printf(m, "uarch\t\t: %s\n", compat);
+
+		of_node_put(node);
+	} else {
+		if (!acpi_get_riscv_isa(NULL, cpu_id, &isa))
+			print_isa(m, isa);
+
+		print_mmu(m);
+	}
+
 	seq_printf(m, "mvendorid\t: 0x%lx\n", ci->mvendorid);
 	seq_printf(m, "marchid\t\t: 0x%lx\n", ci->marchid);
 	seq_printf(m, "mimpid\t\t: 0x%lx\n", ci->mimpid);
 	seq_puts(m, "\n");
-	of_node_put(node);
 
 	return 0;
 }
-- 
2.34.1

