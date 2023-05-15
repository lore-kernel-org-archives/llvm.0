Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF164400
	for <llvm@lists.linux.dev>; Mon, 15 May 2023 05:51:26 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-51b0f9d7d70so11304418a12.1
        for <llvm@lists.linux.dev>; Sun, 14 May 2023 22:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684129886; x=1686721886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GSuTggFYj3JSbFizfFEsySbatkGCHwC0oNgPzvEucIg=;
        b=N/nEoBi1IhlRZ9CA881iWLxPDRiFM7TN0axFq55jgRFI0HzgM/gu3bZSyxElFk7QWD
         7otIJzo7+7meV48mkvNZCJxZawrzXozmTB0Q2Bqn8vkP883pYK2FRpI9ZYE7RwT5Rj9B
         StPDjI/BtZtk18xCuGBlG9pmbq6yar811CImxS0228D62zJ8vXGP4RjsUQR4I99CGJia
         50FJvVJp1hOyLaBPdelPVylBVfsqD8yN1GMqwzdGC9rAOKH3gXoE7zFJ6dcG5bDUGUOm
         ZzgUOS96O+nmdPnmV19HIlw6piIhm1QLdVKR/C/EKB2qJ99coohMLbsLEL6DGhTlT5Bk
         Dbew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684129886; x=1686721886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GSuTggFYj3JSbFizfFEsySbatkGCHwC0oNgPzvEucIg=;
        b=kfAiXzihnYNnrGNxqNrveyUhGBPOfDs2iI1R+TvteOgCfKuFDaz6PRvHuawu2nv+mK
         rbCodoUEBlcMStFwWjstuywzYP+dveM6Sm9dNu3hNEM7ytfyAiRLit/8cBXdkjulKVDq
         btlDO5lxsv+VubKR/n4noJHDMrZixrBaUfMf3Co1SSCux+KgvVet53EDmSh9WerANBGU
         OSwxQy8UPcvpyqlR0U/MS2d7WTwNZ7efoa5clbE0TGZ+m4dM4b0JZikf78H9uMH0KF7g
         tXqxdoHw9Qh7oFv/RrRUMGVw8iZC53OQ3YWe8HT8sFgg6HXeK3zbzEVQNF9xuXjK8Sn1
         i/aQ==
X-Gm-Message-State: AC+VfDzGkWXG8rQqaTWFjIRyZZGanQfWCiey9oXN47NLYM6abK6/8dfE
	1NCzbetZ71yxTnMb2VzlSvKa4w==
X-Google-Smtp-Source: ACHHUZ5L1dEB7b+crifctGB4IsSENtd1txKmn3V9/3C72QMO4O3l6XKu/jd477p77JFAR+LgEbrzbg==
X-Received: by 2002:a17:902:c950:b0:1ac:71ae:ce2f with SMTP id i16-20020a170902c95000b001ac71aece2fmr36753283pla.20.1684129886062;
        Sun, 14 May 2023 22:51:26 -0700 (PDT)
Received: from localhost.localdomain ([106.51.191.118])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090274ca00b001ab28f620d0sm12423277plt.290.2023.05.14.22.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 22:51:25 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH V6 16/21] irqchip/riscv-intc: Add ACPI support
Date: Mon, 15 May 2023 11:19:23 +0530
Message-Id: <20230515054928.2079268-17-sunilvl@ventanamicro.com>
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

Add support for initializing the RISC-V INTC driver on ACPI
platforms.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/irqchip/irq-riscv-intc.c | 70 +++++++++++++++++++++++++-------
 1 file changed, 55 insertions(+), 15 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index f229e3e66387..4adeee1bc391 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -6,6 +6,7 @@
  */
 
 #define pr_fmt(fmt) "riscv-intc: " fmt
+#include <linux/acpi.h>
 #include <linux/atomic.h>
 #include <linux/bits.h>
 #include <linux/cpu.h>
@@ -112,6 +113,30 @@ static struct fwnode_handle *riscv_intc_hwnode(void)
 	return intc_domain->fwnode;
 }
 
+static int __init riscv_intc_init_common(struct fwnode_handle *fn)
+{
+	int rc;
+
+	intc_domain = irq_domain_create_linear(fn, BITS_PER_LONG,
+					       &riscv_intc_domain_ops, NULL);
+	if (!intc_domain) {
+		pr_err("unable to add IRQ domain\n");
+		return -ENXIO;
+	}
+
+	rc = set_handle_irq(&riscv_intc_irq);
+	if (rc) {
+		pr_err("failed to set irq handler\n");
+		return rc;
+	}
+
+	riscv_set_intc_hwnode_fn(riscv_intc_hwnode);
+
+	pr_info("%d local interrupts mapped\n", BITS_PER_LONG);
+
+	return 0;
+}
+
 static int __init riscv_intc_init(struct device_node *node,
 				  struct device_node *parent)
 {
@@ -133,24 +158,39 @@ static int __init riscv_intc_init(struct device_node *node,
 	if (riscv_hartid_to_cpuid(hartid) != smp_processor_id())
 		return 0;
 
-	intc_domain = irq_domain_add_linear(node, BITS_PER_LONG,
-					    &riscv_intc_domain_ops, NULL);
-	if (!intc_domain) {
-		pr_err("unable to add IRQ domain\n");
-		return -ENXIO;
-	}
+	return riscv_intc_init_common(of_node_to_fwnode(node));
+}
 
-	rc = set_handle_irq(&riscv_intc_irq);
-	if (rc) {
-		pr_err("failed to set irq handler\n");
-		return rc;
-	}
+IRQCHIP_DECLARE(riscv, "riscv,cpu-intc", riscv_intc_init);
 
-	riscv_set_intc_hwnode_fn(riscv_intc_hwnode);
+#ifdef CONFIG_ACPI
 
-	pr_info("%d local interrupts mapped\n", BITS_PER_LONG);
+static int __init riscv_intc_acpi_init(union acpi_subtable_headers *header,
+				       const unsigned long end)
+{
+	struct fwnode_handle *fn;
+	struct acpi_madt_rintc *rintc;
 
-	return 0;
+	rintc = (struct acpi_madt_rintc *)header;
+
+	/*
+	 * The ACPI MADT will have one INTC for each CPU (or HART)
+	 * so riscv_intc_acpi_init() function will be called once
+	 * for each INTC. We only do INTC initialization
+	 * for the INTC belonging to the boot CPU (or boot HART).
+	 */
+	if (riscv_hartid_to_cpuid(rintc->hart_id) != smp_processor_id())
+		return 0;
+
+	fn = irq_domain_alloc_named_fwnode("RISCV-INTC");
+	if (!fn) {
+		pr_err("unable to allocate INTC FW node\n");
+		return -ENOMEM;
+	}
+
+	return riscv_intc_init_common(fn);
 }
 
-IRQCHIP_DECLARE(riscv, "riscv,cpu-intc", riscv_intc_init);
+IRQCHIP_ACPI_DECLARE(riscv_intc, ACPI_MADT_TYPE_RINTC, NULL,
+		     ACPI_MADT_RINTC_VERSION_V1, riscv_intc_acpi_init);
+#endif
-- 
2.34.1

