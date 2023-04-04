Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92D1C951
	for <llvm@lists.linux.dev>; Tue,  4 Apr 2023 18:21:01 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id w4so32116974plg.9
        for <llvm@lists.linux.dev>; Tue, 04 Apr 2023 11:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680632461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DdBAV21+tEDurt/JvTaHJyUQ0LBM5nBDKYeMtin7GIs=;
        b=MX30zIpzC4L+H3vLtz3ly3GSsB3XwuvpMQpmEupPQ85QZVU8HRpoYlIf3wBZNQKKLD
         VtbAaOHFd13vmPsqb8jFR5LHfURvqMEP4PmA952ogWkFFfdnVfA6YrYXGpbue16V0vz2
         wzM4ZbBEVPBt9Hfsf9CnBQoG/TblQOmhq56mLVUSCQGP5RHhy/qlytMlTEr8MhtER2mp
         ep3IM4xNIUVffLhgHfWRXOI6Sdbay9+pGr84nAbg1Szv5728VCO39Ewtymzy8/qMQ/Vj
         +CXTYu46xi73R7egRio2zBf/pxKsdmHgApX/2r5Q29nuT1f3Vx5xSeoQlA9ll5cHiE2e
         OURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680632461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DdBAV21+tEDurt/JvTaHJyUQ0LBM5nBDKYeMtin7GIs=;
        b=aK5mv5aMxpfoI19BWDh04FQ6e2/QWqJc13blyxUlM65CclW0G6HtY6KU9Y/+2ag6n0
         qM30+OPOAiaeUDFCrEtO1Hr9n0oeDlRuksscPsXm089On9hvgPTllSiKppCqKEPyd9k0
         sREy4kf7ZQAlaym1JDHaMMj7KYOcyIDFPO6548lfvD3EJ/cbennK4ZhkrJYBM2oQU4JR
         PCfrM6xMaLTJRBXOuJCE7or9qimDQiSxnSlHS6Q89J5mjCw1KnQporxw2gY/9qZxYWkx
         Hk/j8y/XANawS0zOhdTMOsBzNP3kvk15xSk3Ccse7CP07qA03DaHhiYTBiMJXFYs+QYF
         AWKg==
X-Gm-Message-State: AAQBX9cvy8Pl+q7cNG4/FiyL64VqJOQ74USf6WAOjiP8KTCh+8DNP5GL
	aCOMzVGGgY9TOeEQ782VcYPzcQ==
X-Google-Smtp-Source: AKy350ZMHM/cKvyT+rOOWpftInPEoGFfEdxrUaZ3Pg6Dhz7B1J2sE85PLnSoaYL4fu4p8GglqFgtxg==
X-Received: by 2002:a05:6a20:4c9f:b0:d9:ecba:b9fc with SMTP id fq31-20020a056a204c9f00b000d9ecbab9fcmr2623263pzb.54.1680632461193;
        Tue, 04 Apr 2023 11:21:01 -0700 (PDT)
Received: from localhost.localdomain ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id o12-20020a056a001bcc00b0062dcf5c01f9sm9018524pfw.36.2023.04.04.11.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 11:21:00 -0700 (PDT)
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
	Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH V4 02/23] ACPICA: MADT: Add RISC-V INTC interrupt controller
Date: Tue,  4 Apr 2023 23:50:16 +0530
Message-Id: <20230404182037.863533-3-sunilvl@ventanamicro.com>
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

ACPICA commit bd6d1ae1e13abe78e149c8b61b4bc7bc7feab015

The ECR to add RISC-V INTC interrupt controller is approved by
the UEFI forum and will be available in the next revision of
the ACPI specification.

Link: https://github.com/acpica/acpica/commit/bd6d1ae1
Reference: Mantis ID: 2348
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 include/acpi/actbl2.h | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/include/acpi/actbl2.h b/include/acpi/actbl2.h
index b2973dbe37ee..c432fd15db65 100644
--- a/include/acpi/actbl2.h
+++ b/include/acpi/actbl2.h
@@ -891,7 +891,8 @@ enum acpi_madt_type {
 	ACPI_MADT_TYPE_MSI_PIC = 21,
 	ACPI_MADT_TYPE_BIO_PIC = 22,
 	ACPI_MADT_TYPE_LPC_PIC = 23,
-	ACPI_MADT_TYPE_RESERVED = 24,	/* 24 to 0x7F are reserved */
+	ACPI_MADT_TYPE_RINTC = 24,
+	ACPI_MADT_TYPE_RESERVED = 25,	/* 25 to 0x7F are reserved */
 	ACPI_MADT_TYPE_OEM_RESERVED = 0x80	/* 0x80 to 0xFF are reserved for OEM use */
 };
 
@@ -1250,6 +1251,24 @@ enum acpi_madt_lpc_pic_version {
 	ACPI_MADT_LPC_PIC_VERSION_RESERVED = 2	/* 2 and greater are reserved */
 };
 
+/* 24: RISC-V INTC */
+struct acpi_madt_rintc {
+	struct acpi_subtable_header header;
+	u8 version;
+	u8 reserved;
+	u32 flags;
+	u64 hart_id;
+	u32 uid;		/* ACPI processor UID */
+};
+
+/* Values for RISC-V INTC Version field above */
+
+enum acpi_madt_rintc_version {
+	ACPI_MADT_RINTC_VERSION_NONE = 0,
+	ACPI_MADT_RINTC_VERSION_V1 = 1,
+	ACPI_MADT_RINTC_VERSION_RESERVED = 2	/* 2 and greater are reserved */
+};
+
 /* 80: OEM data */
 
 struct acpi_madt_oem_data {
-- 
2.34.1

