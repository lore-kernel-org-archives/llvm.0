Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DDF4400
	for <llvm@lists.linux.dev>; Mon, 15 May 2023 05:51:05 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-52cb78647ecso7498444a12.1
        for <llvm@lists.linux.dev>; Sun, 14 May 2023 22:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684129865; x=1686721865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/XDEVfXqS4FP0KdGTx6jL5yfIe6/oO8gDCIQfJ1eWZE=;
        b=eo+hRK3Y6dFcpXE+MFhCwXrUsWBWvgOpcG+KbYVEc0DqQgCL+swnaKrDmIfoDh8TRe
         2hKgFyvx9N6JbNkAa121GRj+WzhpUml5rUfGm4nN89OoFCceHUiKktEO6no31ZDHA2dm
         vu3aQ2Y0qbCdrwrMHzB7oxlpvZnl0+wjHjhF38ju8yd5O4GM0lgTnoBN+QhEt2YgYAuB
         KjX/ebuvlXou1OgUYvoC4/ceYoRbK1BF7oG+yD58urPPEfekTeQmm4yGKdqbhbhdgo+K
         kxQbbm5n3OpfAAOFYRtjP0l883SnrIMgXvEQGPn8Amcd3XQA8zjuIuvbINQVit0iuDax
         vrTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684129865; x=1686721865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/XDEVfXqS4FP0KdGTx6jL5yfIe6/oO8gDCIQfJ1eWZE=;
        b=QEr67Asop7Rd2ibEwmJtVNH9mKNWF9JbgHQDolGZodNuCf9aI/Ic3QFji4c+46DeTH
         BsZuvvSzxxxQGLL783tDcutQzOpF/myJHnmgKKwXXD5cOL/7H40yaxFCSF6WrgpvVo2n
         bHShLXdxTXH5p9KTonl7IcOKA6HPL+uZsvZwkbZBfscmUM0DAvZuADtfoSVr2nPABONs
         78ee/jjCactZbNR2gx3bFhvVu/txlYRUJ3fc241DNI8pv60p7fK9MknuPv0+sNV4h52L
         9TiEdxOmAPszqEANW9HeUGTQkN4+x1EqcA95v8kYy5W2+T/0zFSD+P1lTYuPk+ihgDfx
         7NFg==
X-Gm-Message-State: AC+VfDzkaf1TaP5cmQgHvK7rmvFeI8DuyPGDNBn8uEAlVpXtAR1Mh2sH
	6/B2ttfhEEUUcXcxbGp0aeQi6A==
X-Google-Smtp-Source: ACHHUZ6UQir4ba9Ebio27KXOD5zQZPs31XYvm+RGv/D0bj2Ha4phrPNjik5ybphmkZHP2SryZzKRYg==
X-Received: by 2002:a17:902:eb46:b0:1a6:5487:3f97 with SMTP id i6-20020a170902eb4600b001a654873f97mr31149745pli.64.1684129865387;
        Sun, 14 May 2023 22:51:05 -0700 (PDT)
Received: from localhost.localdomain ([106.51.191.118])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090274ca00b001ab28f620d0sm12423277plt.290.2023.05.14.22.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 22:51:05 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH V6 13/21] RISC-V: only iterate over possible CPUs in ISA string parser
Date: Mon, 15 May 2023 11:19:20 +0530
Message-Id: <20230515054928.2079268-14-sunilvl@ventanamicro.com>
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

During boot we call riscv_of_processor_hartid() for each hart that we
add to the possible cpus list. Repeating the call again here is not
required, if we iterate over the list of possible CPUs, rather than the
list of all CPUs.

The call to of_property_read_string() for "riscv,isa" cannot fail
either, as it has previously succeeded in riscv_of_processor_hartid(),
but leaving in the error checking makes the operation of the loop more
obvious & provides leeway for future refactoring of
riscv_of_processor_hartid().

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/cpufeature.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index b1d6b7e4b829..c607db2c842c 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -12,6 +12,7 @@
 #include <linux/memory.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <asm/alternative.h>
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
@@ -99,7 +100,7 @@ void __init riscv_fill_hwcap(void)
 	char print_str[NUM_ALPHA_EXTS + 1];
 	int i, j, rc;
 	unsigned long isa2hwcap[26] = {0};
-	unsigned long hartid;
+	unsigned int cpu;
 
 	isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
 	isa2hwcap['m' - 'a'] = COMPAT_HWCAP_ISA_M;
@@ -112,16 +113,20 @@ void __init riscv_fill_hwcap(void)
 
 	bitmap_zero(riscv_isa, RISCV_ISA_EXT_MAX);
 
-	for_each_of_cpu_node(node) {
+	for_each_possible_cpu(cpu) {
 		unsigned long this_hwcap = 0;
 		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
 		const char *temp;
 
-		rc = riscv_of_processor_hartid(node, &hartid);
-		if (rc < 0)
+		node = of_cpu_device_node_get(cpu);
+		if (!node) {
+			pr_warn("Unable to find cpu node\n");
 			continue;
+		}
 
-		if (of_property_read_string(node, "riscv,isa", &isa)) {
+		rc = of_property_read_string(node, "riscv,isa", &isa);
+		of_node_put(node);
+		if (rc) {
 			pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
 			continue;
 		}
-- 
2.34.1

