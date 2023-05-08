Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3E4171AE
	for <llvm@lists.linux.dev>; Mon,  8 May 2023 11:53:36 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1aae5c2423dso43531115ad.3
        for <llvm@lists.linux.dev>; Mon, 08 May 2023 04:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683546816; x=1686138816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9sxg5LZ/1sJSiDItv56ESM72UWoohRRXZed1vK0StQ=;
        b=LI6hJFWMPnsAo7nIAUuNh8he07mq1qgBALuGpR9EPgsWn0RuQgqraPJfQDVda1IPzP
         dxfRnz2+Y1bBoCiW6MOE7juSAhHpWJ5eHqBpRXu6YmP8VojcJM4EoeZQlUqk7qVboH0r
         A+Q9G5B1hyxCv4ivTDFstBhRFjJb8+NWDTdCrbOGDjkl0MIJm5n95AroRQ88lMxfgPqT
         JrBnULZUv/fWaGdmODxR/f+VFKjEDxTExcbSfGxpMgB1dt+zxESFqt+Wjv/vLG4AQVAS
         35iYEQdCAIV6RHM2AkPKMrGfP5t56Mm4wvj4UplcEL3D8qytkfAH0uRNjcFGeSquvRNo
         SSAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683546816; x=1686138816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9sxg5LZ/1sJSiDItv56ESM72UWoohRRXZed1vK0StQ=;
        b=TCiqChc71J9dOujGRWLIoCzkQ1ih3iZoxdJNjkjzYI9DWWo98QH30k9GiYeJoL3KIz
         4Bi+rD192oAMAL5oIzrXYCoCnuQGq+B7aUcwI0JDilPVSGEwJ/8WudGA/Vv+rekX1MyT
         TQrxCYbE4IWq+OXSBSQ2Ht61+ZFCgFF00c4zDV6WTm6/3YODx4Oqwr/lTizGrVyuWFD6
         kY07nPz2bKeA228rT1243mzh/1frE+aqsn0WmR71m/aRKKGUoSlwqGxRYS15OaOXadnG
         Wefi4r3rc7h2qb4j4mpp+cgBUxBO162er1kiCfcDqvkpzk7HynZSHvqNcJYbE6ub+tbG
         Qaog==
X-Gm-Message-State: AC+VfDxLItNrOZm1qr+GEf7WOFG/nEcNTtPXR9QVsbctZHnxiTBqLwbV
	Gru5bdEN3uAxV4j/zc5/R5kTmA==
X-Google-Smtp-Source: ACHHUZ52W6P99fGjx1H1aTdF1PS++Nk8GKk+bQ6gsyNGyvgDs6xJ01TMTUEtUHiG/54yN9c7UrsPkQ==
X-Received: by 2002:a17:902:b085:b0:1aa:fdab:24a5 with SMTP id p5-20020a170902b08500b001aafdab24a5mr9199631plr.10.1683546816386;
        Mon, 08 May 2023 04:53:36 -0700 (PDT)
Received: from sunil-laptop.. ([106.51.189.144])
        by smtp.gmail.com with ESMTPSA id w9-20020a170902904900b001aaed524541sm7015149plz.227.2023.05.08.04.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 04:53:36 -0700 (PDT)
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
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH V5 05/21] ACPI: OSL: Make should_use_kmap() 0 for RISC-V
Date: Mon,  8 May 2023 17:22:21 +0530
Message-Id: <20230508115237.216337-6-sunilvl@ventanamicro.com>
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

Without this, if the tables are larger than 4K,
acpi_map() will fail.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/acpi/osl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/osl.c b/drivers/acpi/osl.c
index 3269a888fb7a..f725813d0cce 100644
--- a/drivers/acpi/osl.c
+++ b/drivers/acpi/osl.c
@@ -276,7 +276,7 @@ acpi_map_lookup_virt(void __iomem *virt, acpi_size size)
 	return NULL;
 }
 
-#if defined(CONFIG_IA64) || defined(CONFIG_ARM64)
+#if defined(CONFIG_IA64) || defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
 /* ioremap will take care of cache attributes */
 #define should_use_kmap(pfn)   0
 #else
-- 
2.34.1

