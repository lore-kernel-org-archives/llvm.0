Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6670C951
	for <llvm@lists.linux.dev>; Tue,  4 Apr 2023 18:21:36 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id r7-20020a17090b050700b002404be7920aso33013018pjz.5
        for <llvm@lists.linux.dev>; Tue, 04 Apr 2023 11:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680632496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvg+GJpfRbLLmDkZ0StW7roD1sWqDLKd1ZxLgpiB2U8=;
        b=I3YBhdL+3Xu+llKzrnwX1PUwlziaWfYZYAn6dc7RWq3v8qQ5bWdgGSvxCKmlXVBO6+
         rekwV0s8mtQsUQ5+R5rntkObGS4DCiB67c5WHPJHjXpH1FI3ldw8JPXKTvadU94zPUEq
         3MoSjz8vNOVFECLMc3b8PcTCxSp04tEPFOksmPgCMVu98oUh7zudU2b0dGhPvdMf3bq2
         tb7nhujvFAJbspAzqq9BA4BbHp9YilY1deH4pMAEkoyBFSWtCg6cei+qkzWCtuWGEFrS
         n/PBi6qYsRJU3PlEGBXGHpmKo1j22/fKx1+DLBUi4RnXsud0TPYfOw6Od4r7sNSzRIGQ
         JbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680632496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bvg+GJpfRbLLmDkZ0StW7roD1sWqDLKd1ZxLgpiB2U8=;
        b=ojfLn52Ls8iY1bCoX0cUAF3morE7jQP5KJRMC5/Px0kshh8mHLSX72PuAYZpRKprkk
         6z95LnTwahVxt4as12NOmRm0pVvBZR9P9s9f1f7EbQrmxoXL1jussSfHQKchlkOu/6bs
         z8H0wRZ1nK5ji/ywSS1qKNBNkKKx7PKzNKId6NwRDCfuruHQ2sxiXz517KXtZTi0+4in
         UwwoGlhj4/sn/L4/FQBmtl8+rPDWRUXiCDgd3A5K0MkPqIScAWuPLkgwpYCc9oJT1wyL
         vFIjuFxDBjyTwg8b5dxAo3gkJTxge0XLLsCPkhJh414b8m3KyFPnZjy32sLC9VCW60O3
         iM0w==
X-Gm-Message-State: AAQBX9cNUY9gDMaKK6J8HBhyj8hrkAo/8uCUHBur1ibsow1zIxRekeuW
	811Xxta5VdDSALLEGrHSSfv0mw==
X-Google-Smtp-Source: AKy350YCFZALzxG1f0ZKLaXTb3ZCE0kWpOL0W2R5mZxwsFoNCva7gK3Ymc4i1Uu1qokGXlcAi0tynQ==
X-Received: by 2002:a05:6a20:cf63:b0:db:b7:fe3f with SMTP id hz35-20020a056a20cf6300b000db00b7fe3fmr3101830pzb.10.1680632496052;
        Tue, 04 Apr 2023 11:21:36 -0700 (PDT)
Received: from localhost.localdomain ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id o12-20020a056a001bcc00b0062dcf5c01f9sm9018524pfw.36.2023.04.04.11.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 11:21:35 -0700 (PDT)
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
Subject: [PATCH V4 07/23] ACPI: processor_core: RISC-V: Enable mapping processor to the hartid
Date: Tue,  4 Apr 2023 23:50:21 +0530
Message-Id: <20230404182037.863533-8-sunilvl@ventanamicro.com>
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

processor_core needs arch-specific functions to map the ACPI ID
to the physical ID. In RISC-V platforms, hartid is the physical id
and RINTC structure in MADT provides this mapping. Add arch-specific
function to get this mapping from RINTC.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/acpi.h |  3 +++
 drivers/acpi/processor_core.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index bcade255bd6e..9be52b6ffae1 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -15,6 +15,9 @@
 /* Basic configuration for ACPI */
 #ifdef CONFIG_ACPI
 
+typedef u64 phys_cpuid_t;
+#define PHYS_CPUID_INVALID INVALID_HARTID
+
 /* ACPI table mapping after acpi_permanent_mmap is set */
 void *acpi_os_ioremap(acpi_physical_address phys, acpi_size size);
 #define acpi_os_ioremap acpi_os_ioremap
diff --git a/drivers/acpi/processor_core.c b/drivers/acpi/processor_core.c
index 2ac48cda5b20..d6606a9f2da6 100644
--- a/drivers/acpi/processor_core.c
+++ b/drivers/acpi/processor_core.c
@@ -106,6 +106,32 @@ static int map_gicc_mpidr(struct acpi_subtable_header *entry,
 	return -EINVAL;
 }
 
+/*
+ * Retrieve the RISC-V hartid for the processor
+ */
+static int map_rintc_hartid(struct acpi_subtable_header *entry,
+			    int device_declaration, u32 acpi_id,
+			    phys_cpuid_t *hartid)
+{
+	struct acpi_madt_rintc *rintc =
+	    container_of(entry, struct acpi_madt_rintc, header);
+
+	if (!(rintc->flags & ACPI_MADT_ENABLED))
+		return -ENODEV;
+
+	/* device_declaration means Device object in DSDT, in the
+	 * RISC-V, logical processors are required to
+	 * have a Processor Device object in the DSDT, so we should
+	 * check device_declaration here
+	 */
+	if (device_declaration && rintc->uid == acpi_id) {
+		*hartid = rintc->hart_id;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
 static phys_cpuid_t map_madt_entry(struct acpi_table_madt *madt,
 				   int type, u32 acpi_id)
 {
@@ -136,6 +162,9 @@ static phys_cpuid_t map_madt_entry(struct acpi_table_madt *madt,
 		} else if (header->type == ACPI_MADT_TYPE_GENERIC_INTERRUPT) {
 			if (!map_gicc_mpidr(header, type, acpi_id, &phys_id))
 				break;
+		} else if (header->type == ACPI_MADT_TYPE_RINTC) {
+			if (!map_rintc_hartid(header, type, acpi_id, &phys_id))
+				break;
 		}
 		entry += header->length;
 	}
-- 
2.34.1

