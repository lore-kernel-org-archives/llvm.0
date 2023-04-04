Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0770C951
	for <llvm@lists.linux.dev>; Tue,  4 Apr 2023 18:23:08 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id d13so31510003pjh.0
        for <llvm@lists.linux.dev>; Tue, 04 Apr 2023 11:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680632588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8jniZVFM5VdIC7zEQqZON+ttcH4hGM09Ty8jho7PtM=;
        b=l4Jw1Rq2ntfHAMU4Y/Hm9cQCfDsI39b8psQRCZLgg7ZBeveqOfGhPNw3A44NfjsPNt
         CDKqtSOQE0ZvLjdx7COmE7Mmmrg95qIj8JP5YmXaGEVFBmrJrdMDDFWnVXKN/Hi3Wdzv
         m7j9aJzVpOi+j8aj17Zs85oruoTEu/NnXDzWeoMKKL+qQSnp6dtAlbbUr8MJhZ7snY/m
         UAdB4JApQKXF0moipSxBKcnvaKFXZhpP/jzffrNHKJ3HaMLoqBJk2NDoulhVo6A56Xt4
         64gplAMVGV20KfPamu5185j/DJgIptQzQinjGOAraB+/y3g6Hlz9Pwdurbr5SvSLD1Kn
         nvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680632588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O8jniZVFM5VdIC7zEQqZON+ttcH4hGM09Ty8jho7PtM=;
        b=VCJSp7f+FEX7jXtliK+OKX9B9fw/jSzm3jUYBCvIFWmRTOEcZ6XqeHC+r13lMBDxF1
         rGcDNqfOjdjiRoc+w3EWsBIgMQ3aXzj1KKrsvoDqVOWIpAlas0linspRDqrdRfFwvaI0
         RN5GLik6jzhxo9cqXyp6aXHctQZj6TYW0sENfm2hqa2Hs9CvxZAq4cmFGPTawMLgPD1y
         mY7OTNCbxHJN4Q9QmD//POiGKx2QnDfv72A4VnxaSzYA0uc7GVtt45X2gzwvvrwrSPXa
         OabSqGYYdhx5pF+pWifFGKoBEMVWMD0nsNBz0CYeGE6tXh3lQA2n8Z8taCfHfixfYfTp
         y7uw==
X-Gm-Message-State: AAQBX9cvYjGaWRcTLqc5239KS7pqhzmhnSzCM6zlCPgLG1/S9BmFYBp+
	LzCyEZi0EOf6LZvL0OXAQs4fTg==
X-Google-Smtp-Source: AKy350YWtiByLvuA5MHF6bNdPYqUjMVVmlzTK+bqmZihos/8knO44e4LwsVq3Bx9usreNyRcUWXZ0w==
X-Received: by 2002:a05:6a20:7b2a:b0:db:1d43:18fe with SMTP id s42-20020a056a207b2a00b000db1d4318femr3016723pzh.8.1680632588299;
        Tue, 04 Apr 2023 11:23:08 -0700 (PDT)
Received: from localhost.localdomain ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id o12-20020a056a001bcc00b0062dcf5c01f9sm9018524pfw.36.2023.04.04.11.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 11:23:08 -0700 (PDT)
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
Subject: [PATCH V4 20/23] RISC-V: Enable ACPI in defconfig
Date: Tue,  4 Apr 2023 23:50:34 +0530
Message-Id: <20230404182037.863533-21-sunilvl@ventanamicro.com>
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

Add support to build ACPI subsystem in defconfig.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index d98d6e90b2b8..8822b49ddb59 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -238,3 +238,4 @@ CONFIG_RCU_EQS_DEBUG=y
 # CONFIG_FTRACE is not set
 # CONFIG_RUNTIME_TESTING_MENU is not set
 CONFIG_MEMTEST=y
+CONFIG_ACPI=y
-- 
2.34.1

