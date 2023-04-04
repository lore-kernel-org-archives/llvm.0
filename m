Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BAAC951
	for <llvm@lists.linux.dev>; Tue,  4 Apr 2023 18:21:43 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id y19so20218666pgk.5
        for <llvm@lists.linux.dev>; Tue, 04 Apr 2023 11:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680632503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sK3yofAaBPCm3lmjxfNqOeEWtEi7+pbDB/M30NYTLb4=;
        b=JtyGYEmj3+3zXeCs5rBdEDlUNt6swvT2m0XrsA3IxnpAIAobJbh35p79poWYW0Y6DK
         /NatfbFv1zcZu5PtRqFFn7Bsw50dOsX/WRlTS4Oqgzyz+qtXNFGqVS6tgUfG6Givx9N2
         In/h+M3U6bNqy0rDKS7kJWHaCI5EgCPUJNoXaIZ+nQXKmfIoVE/uQZXVwLXSHJ2+wPSL
         sTJBuz6w8MHN0b+gl3Jp/kbsanaFYKHbb2MfHz4Hz/y/V++YkTeXD74E3tw48NW9w1gJ
         PSRM3VIJgLuJlkFRrz3GJC+HXFj0K9F/uZhGuFYR1Vkg91JK/xEqUbHtTgfzxNX2/ciU
         pUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680632503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sK3yofAaBPCm3lmjxfNqOeEWtEi7+pbDB/M30NYTLb4=;
        b=VB3yleytvAQJN4tl05xdunMeA9QgZNRD1D+N+4dFrgoMw1jvMW2ws0QU2MLx+QS6iS
         iM90GG3Brx7CulfVFtjM5TWc5xMTuRHIfT0nFkogSLVhkQp35SqgyG+qgTF5leXussd1
         GKsLkFd3mnwANpl6tstDHcMozudQKLIB9PjVHjwzHrfu1Rw2CbXek59MMil+kgavFBL4
         WdI/1g5GmHN80sDfeuR0J12MiIbdyFGIsPC5l9hS0azn43fNtk8yMuFtKvAO3Quvryk6
         RiYuoCpP20nEeAjM9H06ESCjUmuNMw6AqxN+EsF3lZm0nN9BElHFBHsJtod2NDIOD9ry
         JACQ==
X-Gm-Message-State: AAQBX9cSUYHjL620lAhSFibFbk7HKTvS2+7R/VIp96P6ChkIu9kTM0p0
	RmIMetn9h8sucFTEhGGlEDH5IQ==
X-Google-Smtp-Source: AKy350Zq77XC/3ltqtm+S71XwJcX4T+QzSOKmhTEaeBoYJGiZG4Bnpd3gPBIhVtabyUTjk5IKAo18g==
X-Received: by 2002:aa7:9793:0:b0:626:658:c998 with SMTP id o19-20020aa79793000000b006260658c998mr3204222pfp.10.1680632502984;
        Tue, 04 Apr 2023 11:21:42 -0700 (PDT)
Received: from localhost.localdomain ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id o12-20020a056a001bcc00b0062dcf5c01f9sm9018524pfw.36.2023.04.04.11.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 11:21:42 -0700 (PDT)
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
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH V4 08/23] RISC-V: ACPI: Cache and retrieve the RINTC structure
Date: Tue,  4 Apr 2023 23:50:22 +0530
Message-Id: <20230404182037.863533-9-sunilvl@ventanamicro.com>
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

RINTC structures in the MADT provide mapping between the hartid
and the CPU. This is required many times even at run time like
cpuinfo. So, instead of parsing the ACPI table every time, cache
the RINTC structures and provide a function to get the correct
RINTC structure for a given cpu.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 arch/riscv/include/asm/acpi.h |  2 ++
 arch/riscv/kernel/acpi.c      | 60 +++++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index 9be52b6ffae1..1606dce8992e 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -59,6 +59,8 @@ static inline bool acpi_has_cpu_in_madt(void)
 
 static inline void arch_fix_phys_package_id(int num, u32 slot) { }
 
+struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu);
+u32 get_acpi_id_for_cpu(int cpu);
 #endif /* CONFIG_ACPI */
 
 #endif /*_ASM_ACPI_H*/
diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
index 81d448c41714..40ab55309c70 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -24,6 +24,66 @@ EXPORT_SYMBOL(acpi_disabled);
 int acpi_pci_disabled = 1;	/* skip ACPI PCI scan and IRQ initialization */
 EXPORT_SYMBOL(acpi_pci_disabled);
 
+static struct acpi_madt_rintc cpu_madt_rintc[NR_CPUS];
+
+static int acpi_parse_madt_rintc(union acpi_subtable_headers *header, const unsigned long end)
+{
+	struct acpi_madt_rintc *rintc = (struct acpi_madt_rintc *)header;
+	int cpuid;
+
+	if (!(rintc->flags & ACPI_MADT_ENABLED))
+		return 0;
+
+	cpuid = riscv_hartid_to_cpuid(rintc->hart_id);
+	/*
+	 * When CONFIG_SMP is disabled, mapping won't be created for
+	 * all cpus.
+	 * CPUs more than NR_CPUS, will be ignored.
+	 */
+	if (cpuid >= 0 && cpuid < NR_CPUS)
+		cpu_madt_rintc[cpuid] = *rintc;
+
+	return 0;
+}
+
+static int acpi_init_rintc_array(void)
+{
+	if (acpi_table_parse_madt(ACPI_MADT_TYPE_RINTC, acpi_parse_madt_rintc, 0) > 0)
+		return 0;
+
+	return -ENODEV;
+}
+
+/*
+ * Instead of parsing (and freeing) the ACPI table, cache
+ * the RINTC structures since they are frequently used
+ * like in  cpuinfo.
+ */
+struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
+{
+	static bool rintc_init_done;
+
+	if (!rintc_init_done) {
+		if (acpi_init_rintc_array()) {
+			pr_err("No valid RINTC entries exist\n");
+			return NULL;
+		}
+
+		rintc_init_done = true;
+	}
+
+	return &cpu_madt_rintc[cpu];
+}
+
+u32 get_acpi_id_for_cpu(int cpu)
+{
+	struct acpi_madt_rintc *rintc = acpi_cpu_get_madt_rintc(cpu);
+
+	BUG_ON(!rintc);
+
+	return rintc->uid;
+}
+
 /*
  * __acpi_map_table() will be called before paging_init(), so early_ioremap()
  * or early_memremap() should be called here to for ACPI table mapping.
-- 
2.34.1

