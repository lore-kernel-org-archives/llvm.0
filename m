Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80752C951
	for <llvm@lists.linux.dev>; Tue,  4 Apr 2023 18:22:18 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id ix20so32160721plb.3
        for <llvm@lists.linux.dev>; Tue, 04 Apr 2023 11:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680632538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A0yVz+rx5mJyuV/igvCpVezJBLvGHPHOHFjhwqh4528=;
        b=oEps0B7/DRSDt7bmDQYZ0dBfuyVUjzaipEBZoaExzXEqzsQMPLL9DUjQK+NxXQ88Mo
         QavpjuheqcQal2txIqOI+efI25mzgX9Y1IQpUhYVttp1lL8+k4iMq7i2pJYM/LgqMneU
         Z7UvFh5byuD3lCl4oLc3SK/KteJ9lYrD7EDFx0qTyCaIhqdsfDF/sijS3MXtxWfwmF4N
         Uvb8cIJ0PAWn+i6td6w6ysH+tC9NHniNj1dh3hInHEdibXbvcArsFlWDKSpSp2CL27Ak
         reOjjWWbC+6tAboZU7ZWaxcW3QuhWhrM5A/2C/j7zflSdn4AI4RmgnvrI4DoaoLF+R46
         Px/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680632538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0yVz+rx5mJyuV/igvCpVezJBLvGHPHOHFjhwqh4528=;
        b=SAfwwQc6/2D/bUyx0Y8lGBv3GoLbBNqUf8K8pdXIE86/ioiHG2Q7ZGDorvQIx54iRC
         LnyjSVe6ua7cfgj9I1Qq6N15uIEK9ULWvAUD2LvPsSA0rflA+SHcU4t2husRd0ll0MjL
         CpyYkKbAhKlO73MPuEri4HKmCZoL2H4jMdMzjC04+Xu5hgAmXJ52006gALuT2C9hvcYD
         n2MZlcIBB1ktqybpSFlr7RT4CVf5oPS/MAr1yMQER3PQCmYfXSmcCgdNBnt7ZyrXPsg5
         2C6Xs4+aXo2nNzhhLqHNlwqdoUXDjWaIUoMilPrXwCHxUq2yO2LH39BvaLz3UUxp9AkF
         N+5A==
X-Gm-Message-State: AAQBX9d3VWUs8ig/i9jrM68i57KvxmW1SkncMvhGYDJtzunNuzqwYldB
	Aq3y7dnEE4BqL/wRTSoV6HCKng==
X-Google-Smtp-Source: AKy350aDIqed68Tg6fTeWtMp8izSaSZsVOimTSd1vrtt0fPi1Ga8SebKpp0Erae9ssuYrl2S+uCy0A==
X-Received: by 2002:a05:6a20:4d97:b0:bc:80bd:462d with SMTP id gj23-20020a056a204d9700b000bc80bd462dmr2867307pzb.46.1680632538022;
        Tue, 04 Apr 2023 11:22:18 -0700 (PDT)
Received: from localhost.localdomain ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id o12-20020a056a001bcc00b0062dcf5c01f9sm9018524pfw.36.2023.04.04.11.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 11:22:17 -0700 (PDT)
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
	Len Brown <lenb@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Weili Qian <qianweili@huawei.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Sunil V L <sunilvl@ventanamicro.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH V4 13/23] RISC-V: cpufeature: Add ACPI support in riscv_fill_hwcap()
Date: Tue,  4 Apr 2023 23:50:27 +0530
Message-Id: <20230404182037.863533-14-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404182037.863533-1-sunilvl@ventanamicro.com>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On ACPI based systems, the information about the hart
like ISA is provided by the RISC-V Hart Capabilities Table (RHCT).
Enable filling up hwcap structure based on the information in RHCT.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/cpufeature.c | 39 ++++++++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 63e56ce04162..5d2065b937e5 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2017 SiFive
  */
 
+#include <linux/acpi.h>
 #include <linux/bitmap.h>
 #include <linux/ctype.h>
 #include <linux/libfdt.h>
@@ -13,6 +14,8 @@
 #include <linux/memory.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
+#include <asm/acpi.h>
 #include <asm/alternative.h>
 #include <asm/cacheflush.h>
 #include <asm/errata_list.h>
@@ -91,6 +94,9 @@ void __init riscv_fill_hwcap(void)
 	char print_str[NUM_ALPHA_EXTS + 1];
 	int i, j, rc;
 	unsigned long isa2hwcap[26] = {0};
+	struct acpi_table_header *rhct;
+	acpi_status status;
+	unsigned int cpu;
 
 	isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
 	isa2hwcap['m' - 'a'] = COMPAT_HWCAP_ISA_M;
@@ -103,14 +109,36 @@ void __init riscv_fill_hwcap(void)
 
 	bitmap_zero(riscv_isa, RISCV_ISA_EXT_MAX);
 
-	for_each_of_cpu_node(node) {
+	if (!acpi_disabled) {
+		status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
+		if (ACPI_FAILURE(status))
+			return;
+	}
+
+	for_each_possible_cpu(cpu) {
 		unsigned long this_hwcap = 0;
 		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
 		const char *temp;
 
-		if (of_property_read_string(node, "riscv,isa", &isa)) {
-			pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
-			continue;
+		if (acpi_disabled) {
+			node = of_cpu_device_node_get(cpu);
+			if (node) {
+				rc = of_property_read_string(node, "riscv,isa", &isa);
+				of_node_put(node);
+				if (rc) {
+					pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
+					continue;
+				}
+			} else {
+				pr_warn("Unable to find cpu node\n");
+				continue;
+			}
+		} else {
+			rc = acpi_get_riscv_isa(rhct, cpu, &isa);
+			if (rc < 0) {
+				pr_warn("Unable to get ISA for the hart - %d\n", cpu);
+				continue;
+			}
 		}
 
 		temp = isa;
@@ -243,6 +271,9 @@ void __init riscv_fill_hwcap(void)
 			bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
 	}
 
+	if (!acpi_disabled && rhct)
+		acpi_put_table((struct acpi_table_header *)rhct);
+
 	/* We don't support systems with F but without D, so mask those out
 	 * here. */
 	if ((elf_hwcap & COMPAT_HWCAP_ISA_F) && !(elf_hwcap & COMPAT_HWCAP_ISA_D)) {
-- 
2.34.1

