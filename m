Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B62CC951
	for <llvm@lists.linux.dev>; Tue,  4 Apr 2023 18:22:47 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id s19so20245211pgi.0
        for <llvm@lists.linux.dev>; Tue, 04 Apr 2023 11:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680632566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zD5rRL/Qo33kIFahZhwUm29X+6vMDi/30v04/QLcXUQ=;
        b=UIHu2giA5QAUdfrzphOrCNgf8TXf9Q337RJyaEDTsCelh5V0xJtnF5gy2TpNyJ3dib
         JQxA71u/Yth+XIXINwX7ERs/pWdRfR6fiMjDKHJrVNobDIWnvCxoz9SL3ii/bn6LJZBh
         qavA3ViuTfTTmh5JPoKTiEy/TNg6PKmzql59rAOOlKjT0+Y4VR4Tllzag0CkfB7JI8mN
         oIT1dLLjFZkxEing3aWpLI3zfjPVUyoxqBL3Fp8HxThPD9NCws5Lfe2SXIhYWU6ns9yU
         ByteigMnS++tSxUZybtfzf4EpK7ugZVUS13o1Pu+O+857FM6pQJjzjC1bEyIuyYsBPBJ
         sKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680632566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zD5rRL/Qo33kIFahZhwUm29X+6vMDi/30v04/QLcXUQ=;
        b=XVC2I3ZTJP3i11zbA4d96ozcosWF4nVtNzwUZjjLdKPVP5azBAKxZh6fA+CBZc1YGC
         hQMtYbcbimVUgEd5XnbPsMvT6qicYWBzgayUDCfQ2vTXSO/7poxbz6u4EI7ctjDyppMc
         n9F0EFqFb3Jfzr4/4TYWhIQkB7HM4q4HMgu9MLFbAfH777+iMfIxnimA/Lehyvp3OPo/
         r1bqgGUD68ds68Sa60r/filc4nAi1ifuS7/Clmrd0ym3Y/FJ7e+jLmxgyX+WIEW7TYLH
         5D/zx3iEIGTPwdP9w2CWZDGBd3myM7DQPJNkBRy9UM73SXGGZUj8M6zAIoCidUhNERgJ
         9l5A==
X-Gm-Message-State: AAQBX9eRfj6EKVJM1xGDNDqSD0AyqU5NDksrmPLX4c2K9fZutfSU7G5y
	Y2sB9oMBjH1/7gpYWN3moDuMHAUi4g7Jm2u0/7s=
X-Google-Smtp-Source: AKy350bhrHRdDWNUPNswRwG+i3CBb1KLXEYk2mzXo0XGX7CeXMoT6FgV3O1l78I2J1umA2T5+KrIUw==
X-Received: by 2002:a62:6203:0:b0:62a:9d6f:98dc with SMTP id w3-20020a626203000000b0062a9d6f98dcmr2813704pfb.11.1680632566619;
        Tue, 04 Apr 2023 11:22:46 -0700 (PDT)
Received: from localhost.localdomain ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id o12-20020a056a001bcc00b0062dcf5c01f9sm9018524pfw.36.2023.04.04.11.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 11:22:45 -0700 (PDT)
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
Subject: [PATCH V4 17/23] clocksource/timer-riscv: Add ACPI support
Date: Tue,  4 Apr 2023 23:50:31 +0530
Message-Id: <20230404182037.863533-18-sunilvl@ventanamicro.com>
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

Initialize the timer driver based on RHCT table on ACPI based
platforms.

Currently, ACPI doesn't support a flag to indicate that the
timer interrupt can wake up the cpu irrespective of its
power state. It will be added in future update.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/clocksource/timer-riscv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index cecc4662293b..da3071b387eb 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -10,6 +10,7 @@
 
 #define pr_fmt(fmt) "riscv-timer: " fmt
 
+#include <linux/acpi.h>
 #include <linux/clocksource.h>
 #include <linux/clockchips.h>
 #include <linux/cpu.h>
@@ -207,3 +208,13 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 }
 
 TIMER_OF_DECLARE(riscv_timer, "riscv", riscv_timer_init_dt);
+
+#ifdef CONFIG_ACPI
+static int __init riscv_timer_acpi_init(struct acpi_table_header *table)
+{
+	return riscv_timer_init_common();
+}
+
+TIMER_ACPI_DECLARE(aclint_mtimer, ACPI_SIG_RHCT, riscv_timer_acpi_init);
+
+#endif
-- 
2.34.1

