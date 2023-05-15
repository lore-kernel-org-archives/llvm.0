Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296F94400
	for <llvm@lists.linux.dev>; Mon, 15 May 2023 05:50:45 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-64ab2a37812so17225113b3a.1
        for <llvm@lists.linux.dev>; Sun, 14 May 2023 22:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684129844; x=1686721844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0nwVNZh7ok4nFqCGOtk3GB5ee+yA98GCkbh3FEbeZck=;
        b=E/akYS7O6yGgTDZ3Bf1T/P6nEJT968oaRhtj9rnRPRkcrOZSH3VS3K+x12YdT6/pch
         bCrXJMtYnM0QbaQqUhysZVUOx1hvleobJhLyQ2v9Uo/Coo4TSFaQII32wL0puYRy4kel
         YD3LtEyjx+e9J4c+uIR1fhu7TP8WOromrEOwE4Q50AGU7/Ma6U6Nz6v492FYkJw1JCP0
         axsv8nlEsljhLjcZ2TuPLj0zj0QrqKnIwxeqCEc+epcl/4QKIO1ZGbHD8RDbbfnZHB/C
         IRzXw3yI7cTvq0aEjEObSoZoTF/I6pTsk0EvE6JFtdCmgGRYkc29VbLRfF6gJfukbRPH
         pDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684129844; x=1686721844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0nwVNZh7ok4nFqCGOtk3GB5ee+yA98GCkbh3FEbeZck=;
        b=ASM+1j0y0n4SRQa8GhOxc65+2kleZb2kucAaunV4iE8pOgybkasT+0G0c9Xf4UsuIh
         kw0RhlFfHJ0Z6bFBGYqAwPSxw+1u5mnSPGxsiXk5/RBX4ymew7e7td4dlLvmPW1kGXNz
         G7y7Xen3bUW+AA38QBanKvQ7JDY6vBR+ZolBI4ZFGU+6ZvOy6/GJsdDiPavRorIIX1qX
         d7ZopettCoxGm1L0/ZGBk+7MNqseevAOsZ4POHVvvSmlgSw/gDGk4I7GFrpoiGpfKGko
         VQFkMvp3nEo1I5X2CZh+4CyAdw3IKFtIKiWuhTQwKKnU3rvszll+iS8eEc7ayP9vsrD+
         HmPQ==
X-Gm-Message-State: AC+VfDycib52M8qqGyZgkuBn+fwOjluzY/JIEVi9mIb0li1LW/BncHuj
	azVtXjjfMLDv0NZG/NBRU8DmUQ==
X-Google-Smtp-Source: ACHHUZ6euLK+fb0ZLxEx3Vl3C/9VK9lGGJGI4k7u7ozBo6cPm3CVju4UVTH6MQZqohncZzWYO7T0Vg==
X-Received: by 2002:a17:902:ea05:b0:1ad:d542:6e14 with SMTP id s5-20020a170902ea0500b001add5426e14mr14552690plg.12.1684129844559;
        Sun, 14 May 2023 22:50:44 -0700 (PDT)
Received: from localhost.localdomain ([106.51.191.118])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090274ca00b001ab28f620d0sm12423277plt.290.2023.05.14.22.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 22:50:44 -0700 (PDT)
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
	Sunil V L <sunilvl@ventanamicro.com>,
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
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH V6 10/21] drivers/acpi: RISC-V: Add RHCT related code
Date: Mon, 15 May 2023 11:19:17 +0530
Message-Id: <20230515054928.2079268-11-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
References: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RHCT is a new table defined for RISC-V to communicate the
features of the CPU to the OS. Create a new architecture folder
in drivers/acpi and add RHCT parsing code.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/include/asm/acpi.h |  8 ++++
 drivers/acpi/Makefile         |  2 +
 drivers/acpi/riscv/Makefile   |  2 +
 drivers/acpi/riscv/rhct.c     | 83 +++++++++++++++++++++++++++++++++++
 4 files changed, 95 insertions(+)
 create mode 100644 drivers/acpi/riscv/Makefile
 create mode 100644 drivers/acpi/riscv/rhct.c

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index 6519529c8bdf..39471759bec1 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -62,6 +62,8 @@ static inline void arch_fix_phys_package_id(int num, u32 slot) { }
 void acpi_init_rintc_map(void);
 struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu);
 u32 get_acpi_id_for_cpu(int cpu);
+int acpi_get_riscv_isa(struct acpi_table_header *table,
+		       unsigned int cpu, const char **isa);
 #else
 static inline void acpi_init_rintc_map(void) { }
 static inline struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
@@ -69,6 +71,12 @@ static inline struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
 	return NULL;
 }
 
+static inline int acpi_get_riscv_isa(struct acpi_table_header *table,
+				     unsigned int cpu, const char **isa)
+{
+	return -EINVAL;
+}
+
 #endif /* CONFIG_ACPI */
 
 #endif /*_ASM_ACPI_H*/
diff --git a/drivers/acpi/Makefile b/drivers/acpi/Makefile
index feb36c0b9446..3fc5a0d54f6e 100644
--- a/drivers/acpi/Makefile
+++ b/drivers/acpi/Makefile
@@ -131,3 +131,5 @@ obj-y				+= dptf/
 obj-$(CONFIG_ARM64)		+= arm64/
 
 obj-$(CONFIG_ACPI_VIOT)		+= viot.o
+
+obj-$(CONFIG_RISCV)		+= riscv/
diff --git a/drivers/acpi/riscv/Makefile b/drivers/acpi/riscv/Makefile
new file mode 100644
index 000000000000..8b3b126e0b94
--- /dev/null
+++ b/drivers/acpi/riscv/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-y 	+= rhct.o
diff --git a/drivers/acpi/riscv/rhct.c b/drivers/acpi/riscv/rhct.c
new file mode 100644
index 000000000000..b280b3e9c7d9
--- /dev/null
+++ b/drivers/acpi/riscv/rhct.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2022-2023, Ventana Micro Systems Inc
+ *	Author: Sunil V L <sunilvl@ventanamicro.com>
+ *
+ */
+
+#define pr_fmt(fmt)     "ACPI: RHCT: " fmt
+
+#include <linux/acpi.h>
+
+static struct acpi_table_header *acpi_get_rhct(void)
+{
+	static struct acpi_table_header *rhct;
+	acpi_status status;
+
+	/*
+	 * RHCT will be used at runtime on every CPU, so we
+	 * don't need to call acpi_put_table() to release the table mapping.
+	 */
+	if (!rhct) {
+		status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
+		if (ACPI_FAILURE(status)) {
+			pr_warn_once("No RHCT table found\n");
+			return NULL;
+		}
+	}
+
+	return rhct;
+}
+
+/*
+ * During early boot, the caller should call acpi_get_table() and pass its pointer to
+ * these functions(and free up later). At run time, since this table can be used
+ * multiple times, NULL may be passed in order to use the cached table.
+ */
+int acpi_get_riscv_isa(struct acpi_table_header *table, unsigned int cpu, const char **isa)
+{
+	struct acpi_rhct_node_header *node, *ref_node, *end;
+	u32 size_hdr = sizeof(struct acpi_rhct_node_header);
+	u32 size_hartinfo = sizeof(struct acpi_rhct_hart_info);
+	struct acpi_rhct_hart_info *hart_info;
+	struct acpi_rhct_isa_string *isa_node;
+	struct acpi_table_rhct *rhct;
+	u32 *hart_info_node_offset;
+	u32 acpi_cpu_id = get_acpi_id_for_cpu(cpu);
+
+	BUG_ON(acpi_disabled);
+
+	if (!table) {
+		rhct = (struct acpi_table_rhct *)acpi_get_rhct();
+		if (!rhct)
+			return -ENOENT;
+	} else {
+		rhct = (struct acpi_table_rhct *)table;
+	}
+
+	end = ACPI_ADD_PTR(struct acpi_rhct_node_header, rhct, rhct->header.length);
+
+	for (node = ACPI_ADD_PTR(struct acpi_rhct_node_header, rhct, rhct->node_offset);
+	     node < end;
+	     node = ACPI_ADD_PTR(struct acpi_rhct_node_header, node, node->length)) {
+		if (node->type == ACPI_RHCT_NODE_TYPE_HART_INFO) {
+			hart_info = ACPI_ADD_PTR(struct acpi_rhct_hart_info, node, size_hdr);
+			hart_info_node_offset = ACPI_ADD_PTR(u32, hart_info, size_hartinfo);
+			if (acpi_cpu_id != hart_info->uid)
+				continue;
+
+			for (int i = 0; i < hart_info->num_offsets; i++) {
+				ref_node = ACPI_ADD_PTR(struct acpi_rhct_node_header,
+							rhct, hart_info_node_offset[i]);
+				if (ref_node->type == ACPI_RHCT_NODE_TYPE_ISA_STRING) {
+					isa_node = ACPI_ADD_PTR(struct acpi_rhct_isa_string,
+								ref_node, size_hdr);
+					*isa = isa_node->isa;
+					return 0;
+				}
+			}
+		}
+	}
+
+	return -1;
+}
-- 
2.34.1

