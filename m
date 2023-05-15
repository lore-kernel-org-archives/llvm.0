Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D243D64
	for <llvm@lists.linux.dev>; Mon, 15 May 2023 05:50:04 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1ab032d9266so113803525ad.0
        for <llvm@lists.linux.dev>; Sun, 14 May 2023 22:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684129804; x=1686721804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wcGbfhUP5NrwGCYl7Q1yL0FMzRdJBr1PIlnUSkktJs=;
        b=n/aiVJ2ZI/20dmw/nnIas4SmVxjrQZ4QoNuC10rt/EBsMYeY3s9rOAtcRswQ/rS0gj
         +YF3uZ3+BrCTAsb8/zas05gp3eHMHogoCDyF5CgphQCtWV7jDS0w6dAIyI/LOHIuFUD/
         66tP/o1kfQ8lwgIgmMGChYLD4QdvhYXxlgITerrPqiWqRvbQqD1j+FMl1+Z+T/R1rPbg
         biqO2FNrYffCTix/m9i9JkHtz7X1ewyYTYJ/wpngbMBRGNjNr/kfcPGXoWWvX02AFi5Z
         JZRL5gwnt9JqBz9jMuE4h8qnmO/g76/vz4OrXrBsX3Ex3DVowPdQK8yPfYn/rHP5EbLV
         lenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684129804; x=1686721804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1wcGbfhUP5NrwGCYl7Q1yL0FMzRdJBr1PIlnUSkktJs=;
        b=Y/Wqi1UkGE6OV04bVt116hGxWWIXI2Qu2QMh+Fey/RREvcWsyvJSVK+PacpKfsL4OH
         er50az9Qu5uiL/wXrXb+ecDYtJumTnkcfyrjhDhOUV2Er6FlH1EXXwWXfP5ANRaidsiX
         IrFguI8KgFtI8Taa7eYiE1gcwP+SPmDHWbyHaVN6EERDHwr2cfIgpCNxZIhu2g/iWabu
         eflmTU60AhMAmfMo7ICjUuPGwq074hs9AxNGhwRHA7xY9ztYpHs28vuasxcQUvT9350y
         meyCYJd2SRWoBGCC+Xh5Bsr54q/Z3kNfeadAPFbNiNX7W6DEb3K6UigHzD/rBS5ra2RQ
         PANg==
X-Gm-Message-State: AC+VfDzdru8KopdSAEN7KmoiM63KTZQCssaGESUhslfMSbcE1G2bVHEw
	HQyheshBqggxdLGOqi0aQ0Kcog==
X-Google-Smtp-Source: ACHHUZ5G5pSurpLSfBqE/5dREIdQpF2iiBuall6PO0uWHa8iwPoH3QvLtzsBkdmMfKChnq/qafBiBQ==
X-Received: by 2002:a17:902:c1cd:b0:1ab:18ea:f922 with SMTP id c13-20020a170902c1cd00b001ab18eaf922mr32696313plc.52.1684129804048;
        Sun, 14 May 2023 22:50:04 -0700 (PDT)
Received: from localhost.localdomain ([106.51.191.118])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090274ca00b001ab28f620d0sm12423277plt.290.2023.05.14.22.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 22:50:03 -0700 (PDT)
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
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH V6 04/21] ACPI: tables: Print RINTC information when MADT is parsed
Date: Mon, 15 May 2023 11:19:11 +0530
Message-Id: <20230515054928.2079268-5-sunilvl@ventanamicro.com>
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

When MADT is parsed, print RINTC information as below:

ACPI: RISC-V INTC (acpi_uid[0x0000] hart_id[0x0] enabled)
ACPI: RISC-V INTC (acpi_uid[0x0001] hart_id[0x1] enabled)
...
ACPI: RISC-V INTC (acpi_uid[0x000f] hart_id[0xf] enabled)

This debug information will be very helpful during bring up.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/acpi/tables.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/acpi/tables.c b/drivers/acpi/tables.c
index 7b4680da57d7..8ab0a82b4da4 100644
--- a/drivers/acpi/tables.c
+++ b/drivers/acpi/tables.c
@@ -220,6 +220,16 @@ void acpi_table_print_madt_entry(struct acpi_subtable_header *header)
 		}
 		break;
 
+	case ACPI_MADT_TYPE_RINTC:
+		{
+			struct acpi_madt_rintc *p = (struct acpi_madt_rintc *)header;
+
+			pr_debug("RISC-V INTC (acpi_uid[0x%04x] hart_id[0x%llx] %s)\n",
+				 p->uid, p->hart_id,
+				 (p->flags & ACPI_MADT_ENABLED) ? "enabled" : "disabled");
+		}
+		break;
+
 	default:
 		pr_warn("Found unsupported MADT entry (type = 0x%x)\n",
 			header->type);
-- 
2.34.1

