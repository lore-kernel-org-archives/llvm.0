Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9859D171AE
	for <llvm@lists.linux.dev>; Mon,  8 May 2023 11:55:15 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-52c759b7d45so4027337a12.3
        for <llvm@lists.linux.dev>; Mon, 08 May 2023 04:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683546915; x=1686138915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTcS6ERydBi3sd7UUw2QFTJaMwmeqvxl7dgO0DDj6Ys=;
        b=fw9w2wVvyg18HQUViAb/q8qFm0YGCFl6OA5t0nEkt/x4efJjZz1AlZazIVHATLSW+w
         heUG1plkNWqhle47JUQzWHWSG+vGxo82ayY9ANGhfWkzbQO8Dr6YUiheG3svkLfmg+NN
         2GZx2gFnSEjoQGMVoLG9jHAqVyTSd707Zvc6pVK2NLdcrbmEHn3Glt7k/emJkDKaKSq2
         MIRlCk1P2l9380YHjRqRfnRuqH8OWIWYheVO0szdRaxlAliT5X3EoD3CDOtTxHsFXQ1y
         F8OptUnVg8xt4KdB2scf8uJ5YrNv+5MozGjfHscY0OiyRNm/5t2/AQGAJfIYOrKzz/J2
         rCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683546915; x=1686138915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTcS6ERydBi3sd7UUw2QFTJaMwmeqvxl7dgO0DDj6Ys=;
        b=D6Y0NMBOZ3eghaBDWlpIgoroAc3X2KJ52W3djyYruc2TuktrkJuyzIwZhDBXIEJMgj
         CKmQm40l9FRluLiPciEEF9blFEVvbtHlSxWvfmlbegpOs/kVz3QuaeyDpzTnS3ljCQix
         C57jf0csoaBMqB+gOHL53oA0V9zlg4oaoLgpTDvrZgtWMT4sUGRjIWVXNtMhk6FNgvDb
         dP9SnSuOhRJcQYZ8849rbzWgP7MmTiXrA7wbuzol4JPgwFmRbaSDx7HHofJweFf7eK5W
         NNzzLmt+VCYaIdxwvI7OTR5M7rsZAzQIZn0bGpTL98Rtu8rOXv24DwbRpWNYMC7JVyN1
         b1YQ==
X-Gm-Message-State: AC+VfDx5cEoUCEZP9TPtqeG1hIRD/S18Yho4a0FLnX/yQf2LgTsxI+z7
	7YYaCmP3ySaNeNjK58JJVlCAGg==
X-Google-Smtp-Source: ACHHUZ5LX88i99DmSCUmXSBK7hbOW5754EnsnTa/mud3XPBdrIA3mmjSCvDHn3cMXRSoaPysS72Dog==
X-Received: by 2002:a17:902:868f:b0:1a6:b971:faf8 with SMTP id g15-20020a170902868f00b001a6b971faf8mr9907040plo.53.1683546915118;
        Mon, 08 May 2023 04:55:15 -0700 (PDT)
Received: from sunil-laptop.. ([106.51.189.144])
        by smtp.gmail.com with ESMTPSA id w9-20020a170902904900b001aaed524541sm7015149plz.227.2023.05.08.04.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 04:55:14 -0700 (PDT)
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
Subject: [PATCH V5 17/21] clocksource/timer-riscv: Add ACPI support
Date: Mon,  8 May 2023 17:22:33 +0530
Message-Id: <20230508115237.216337-18-sunilvl@ventanamicro.com>
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

Initialize the timer driver based on RHCT table on ACPI based
platforms.

Currently, ACPI doesn't support a flag to indicate that the
timer interrupt can wake up the cpu irrespective of its
power state. It will be added in future update.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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

