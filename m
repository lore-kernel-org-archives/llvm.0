Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D8C171AE
	for <llvm@lists.linux.dev>; Mon,  8 May 2023 11:55:41 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-51f6461af24so3054743a12.2
        for <llvm@lists.linux.dev>; Mon, 08 May 2023 04:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683546941; x=1686138941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38k1Pzb7K1cfn0j2an7l+ypiTAB8VfWPvQzIb1c40CU=;
        b=PChmFsn3jZ8YIN6et/HE2FT9KTKcn+85yUyr9DAN37WxMFW8+DniecytVJXMB+E4Yt
         cwg8NffeENFCvkKnaWixs6tUyDd3Pe6n2aLn4UIePpKETvgDRw/tKZj+YWWWcT4mL8PX
         tYib/TSvHrN7Ey/NaA2sBIl3ZhsF/OALW01VQPmUVWr5lFOnvHHzhr8ONcBU4wdYDXUM
         2glikRs238NvoLM/xUbz0Xj6aUVZA+JwoGLMj1OClPKRSjyvFoYHdvDFP9z9Wm3UBUso
         nG8WFplmCxjrRVNpFWVJOLFxXe7WeRsIP9yzHVTVBjY97ncMG5iq4wNUkEILfoLw9j50
         tEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683546941; x=1686138941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=38k1Pzb7K1cfn0j2an7l+ypiTAB8VfWPvQzIb1c40CU=;
        b=iXIXW2a5SDEWIFZO8h+fL401VoMkfy1YZrhvQastwZemgikpwLT2y9QWKtEAIYjWdZ
         PvnsLIv3rbM4nzSXc45kJQkR+qSfpaXfbQZYgVv0GVG5AmaAUg/8NbHBSJFO6b4FbR6k
         Ow3cqW3ymwgRp7AZAzyokfMkXshN/NFzfh/+IkdVTnYC0clCmBka/KxK877MZlFtFWC7
         idIC6MWUBxa2sFjSU8Lz7W71puGWTT5K8mWQK4mlDz1j8rgSf/xFirKIFODPXazl5ibD
         IMWvHoV1fCXM2OiqBq/ke4ZbBdWUWs1n6k1qyJ0PFasmhvK1zmFSJp/WJHtHmQnhpocA
         6kcQ==
X-Gm-Message-State: AC+VfDwly4mpXUWdP/HNTuuPK8q0ziCMBef3vO4OY6mFS+SQ8AiDr7uI
	K3QM2uZ3cRPl7qxtZlyBqTXuFQ==
X-Google-Smtp-Source: ACHHUZ6zMo1/GVdCMuvw4uqUNbB5el8P538gaRe9zZQmHaDTlvRjtiHbiNIa2a1kNbjX1A6CxKl+VA==
X-Received: by 2002:a17:902:8c96:b0:1a9:631b:7d68 with SMTP id t22-20020a1709028c9600b001a9631b7d68mr8947702plo.8.1683546941248;
        Mon, 08 May 2023 04:55:41 -0700 (PDT)
Received: from sunil-laptop.. ([106.51.189.144])
        by smtp.gmail.com with ESMTPSA id w9-20020a170902904900b001aaed524541sm7015149plz.227.2023.05.08.04.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 04:55:40 -0700 (PDT)
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
Subject: [PATCH V5 20/21] RISC-V: Enable ACPI in defconfig
Date: Mon,  8 May 2023 17:22:36 +0530
Message-Id: <20230508115237.216337-21-sunilvl@ventanamicro.com>
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

Add support to build ACPI subsystem in defconfig.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index d98d6e90b2b8..d3d1fbf2dd5f 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -37,6 +37,7 @@ CONFIG_PM=y
 CONFIG_CPU_IDLE=y
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM=m
+CONFIG_ACPI=y
 CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
-- 
2.34.1

