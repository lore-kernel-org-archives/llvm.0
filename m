Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BB4C951
	for <llvm@lists.linux.dev>; Tue,  4 Apr 2023 18:23:15 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id p13-20020a17090a284d00b0023d2e945aebso2307608pjf.0
        for <llvm@lists.linux.dev>; Tue, 04 Apr 2023 11:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680632595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxjRnY50ljGzDkjFJKwpbgFpDq6dD9KEN8bTRX7WND0=;
        b=DUjOausdvzFTVQlcC6m84GARZK5LmEhMht8gMLun6u8d/vhvQDQIhEE8PuNQKXP186
         0Sq8iIVodsU0Skgpet6N/Mb9uhXlJU2cQ0UAC8Odwjor6m+ubsGRHF1SKMN62ZIITSOx
         uKaCINtsM5qD+zb0+Ky44kERjcb2URa2HHFJVdN98U7df7b7TcXae/mpr60N9hSJEzcD
         bs0/UMMtuOougT+/ob1sPci2eYBARU1ovpXTnZh/fljveDgKCvU976b1VpvUFAqUS58A
         9a9W/4mKqFePf8VXn8kULaTt3TpsK/9yvMRoFqRBN/oG2lQ4z1BrZAk5fSXHuRGiqbrJ
         K/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680632595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bxjRnY50ljGzDkjFJKwpbgFpDq6dD9KEN8bTRX7WND0=;
        b=rl8/6YAzzhsdryXzhoIqR3tRkQfsSDDjEidc2ykyvDWk9ZsOISvIyL7Co67xPs1rcd
         99wOeIP6WLMxZbR4Ycnm3oI+ijUeK+8xS5d4Qx1ogTbl1hUoSXenPdPWolqZdbpnoWZY
         1yKv4DqZeB5+3cStcdq8aiI4Acz22t8IrRL0EleBY4zlTgJXnUV7TbTQknEklLz4QJGO
         dKuVDW8AEqbz9Q/KvBs1i5guht826jkeC/T9xAG3Kz6ow2toKkuFMPhMG7pltlE6WGDn
         hXt3JYyOipdTBllrAxXAdFzBZvTjHsEHcwXq4igrDCXeVNQjy+7uEnNxwRkm//iVbnJD
         PIyw==
X-Gm-Message-State: AAQBX9eBVNxhQgNSdys3KWYdINfDIZSKskD5v3wZTtoCnV3XdjdAtSlB
	vGKJrGo12df+MmKRtXoESyvLzg==
X-Google-Smtp-Source: AKy350bkfJy3/J/N4hFHpsA/SCejSzTneUJgG9jMyZsK97P+mZ2vHjDGEOqM8+xhJPDrUVdhideASg==
X-Received: by 2002:a05:6a20:4da3:b0:d9:a38d:3ec7 with SMTP id gj35-20020a056a204da300b000d9a38d3ec7mr36588pzb.29.1680632595264;
        Tue, 04 Apr 2023 11:23:15 -0700 (PDT)
Received: from localhost.localdomain ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id o12-20020a056a001bcc00b0062dcf5c01f9sm9018524pfw.36.2023.04.04.11.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 11:23:14 -0700 (PDT)
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
Subject: [PATCH V4 21/23] MAINTAINERS: Add entry for drivers/acpi/riscv
Date: Tue,  4 Apr 2023 23:50:35 +0530
Message-Id: <20230404182037.863533-22-sunilvl@ventanamicro.com>
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

ACPI defines few RISC-V specific tables which need
parsing code added in drivers/acpi/riscv. Add maintainer
entries for this newly created folder.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 90abe83c02f3..903a52027309 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -406,6 +406,14 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	drivers/acpi/arm64
 
+ACPI FOR RISC-V (ACPI/riscv)
+M:	Sunil V L <sunilvl@ventanamicro.com>
+L:	linux-acpi@vger.kernel.org
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	arch/riscv/kernel/acpi.c
+F:	drivers/acpi/riscv
+
 ACPI SERIAL MULTI INSTANTIATE DRIVER
 M:	Hans de Goede <hdegoede@redhat.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.34.1

