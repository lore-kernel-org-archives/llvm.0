Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60586727F
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 21:12:02 +0000 (UTC)
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1c604a5a53eso120130525ad.0
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 14:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696021922; x=1696626722; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=19scQT+vZguMbMPGvwbswmmwWeMyYkP13y1R8IKgsdo=;
        b=hEe6DZnK6zs1ZLeb2zlM6r3+Hk/jIjo1+iArpVHaWs1mSoNt0nBmno834VOscNDFiv
         pvbhmEaCZegkHMVOFYpnS3qyptOuFHpU1oU0MODSTuT9hOsTE0JgjYJOpvVb4JHdjlhz
         EUs+tvteL6BrH5Utj7zrv0UzMWN2PXOGt9tR2038GBiMRlgxtf8UsgU3DM/iCbds3enT
         YEzE139Bc/sjxNrlNpwoMwgsibk87D8Omv/ZAgnzc/rvgdA0VkreuQ81LQKFglyw8xQo
         /46rlDgEslXqW2VHHjtOSUQ4pxc1LEiRCBQtAOOtiZLr/iWKdgFZf+wTF6g6L9VYhuwY
         7ZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696021922; x=1696626722;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=19scQT+vZguMbMPGvwbswmmwWeMyYkP13y1R8IKgsdo=;
        b=eZUof3+3Rugm7VffFQ6ENp+qb5dhekphZSejKU19wkREmWi+/bWcbjk3NOaHUx2rvt
         FRvE8WDAf+1hcw/U1IQuHd0B068TtDSGb+tabsjspQ3pANfyPm5Xn3mJqIwQdoEVMz5J
         1cDgxN6t6NQflb6XMK9QeurgxOJAsbimvlRyZfhtROBF+Z+zlojJWB0Z1DEt10pN8y/Y
         SkzpTXWF2ek3qMSxSxW8GcQUTWB77NPQXs6qC0Oh8jHrpvDJ74FDkvs2sq0a/+CNdE2G
         WLP1/MsT5VH31JSa12nRQXyFDPc3r9/obcUD60tlUNGVVmhsbFi773AzINJw5k9nGVhr
         HP2g==
X-Gm-Message-State: AOJu0YyeP9+iuUO2QrEOK63ib5V77JqO/X5ROytv9xw4GTcgg0Hajujx
	lAgGXfAeKUz3Kan30oB1GkSSeMI1YLYRxiSfiko=
X-Google-Smtp-Source: AGHT+IEu8pWqkhn949EN2w2MEEmF4sIQU2CD0ztiPLeuQl+OuKcbvmbHD9LpYfISQSvkmvSO3SxPVHDUipdN2Hi1oC8=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:903:1c8:b0:1c6:d25:8730 with SMTP
 id e8-20020a17090301c800b001c60d258730mr75155plh.0.1696021921796; Fri, 29 Sep
 2023 14:12:01 -0700 (PDT)
Date: Fri, 29 Sep 2023 21:11:58 +0000
In-Reply-To: <20230929211155.3910949-4-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230929211155.3910949-4-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1191; i=samitolvanen@google.com;
 h=from:subject; bh=MSLQAq+u1Gq1vqQPv1L24OvfGxs9lQjVrKINsuZaDko=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBlFz2bXFheIUWsMCgpXroYNEMEHJSzh7lHXZPhb
 Ah07CUmBI2JAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZRc9mwAKCRBMtfaEi7xW
 7oPqC/9r2/xEbO/XFpLcUfW8kI4zwGyW+1Bc7PLy9I1XUD02QER16SuVa1TjN8rJQPDmOMsvTB5
 T5jEE8zHkuv5iPAUTq/yfdsqgq7Z9o7WUqulun2nOY9Z455ZDOwLvbCIfEXhOthriqRBjm08Kd8
 068lN/FADXcZatUB50UlQahfJo08fLC7oUQ5xDGv0aXR6pnqONVNs/F1FhlysA15ZmM0HVhJePX
 6NcJ3HNNPyvbDbeafLIysEsEirdqqDLbxHXo6W0v7OFcevxKffQom+ZUD8w0SlBJsnrgLSQYfrL
 4SDgYPIT3RgVrVY58SpSU/IrpswNMkcW1oGV+VpuE8vh5HfISvX0Y/jFIK76jIL1xM9gdG/5oKD
 xSBdaJPOnpK9Gcze/0uC08IM5oubP3raIy1qzWvrbWFce1KlRfKgkHLVVNp7KcJmqHe0lhZqoI4 gKx2VGQd8AOM+C9TUeca+0u6bNkxxIvvO6e8Zupt2MkaleKzO1xxv6N14XGwr2/VkIpsg=
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
Message-ID: <20230929211155.3910949-6-samitolvanen@google.com>
Subject: [PATCH 2/2] riscv: mm: Update mmap_rnd_bits_max
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, 
	Kees Cook <keescook@chromium.org>
Cc: linux-mm@kvack.org, linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

ARCH_MMAP_RND_BITS_MAX is based on Sv39, which leaves a few
potential bits of mmap randomness on the table if we end up enabling
4/5-level paging. Update mmap_rnd_bits_max to take the final address
space size into account. This increases mmap_rnd_bits_max from 24 to
33 with Sv48/57.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/riscv/mm/init.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 0798bd861dcb..ff8d21a6cb2d 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -762,6 +762,11 @@ static int __init print_no5lvl(char *p)
 }
 early_param("no5lvl", print_no5lvl);
 
+static void __init set_mmap_rnd_bits_max(void)
+{
+	mmap_rnd_bits_max = MMAP_VA_BITS - PAGE_SHIFT - 3;
+}
+
 /*
  * There is a simple way to determine if 4-level is supported by the
  * underlying hardware: establish 1:1 mapping in 4-level page table mode
@@ -1071,6 +1076,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 
 #if defined(CONFIG_64BIT) && !defined(CONFIG_XIP_KERNEL)
 	set_satp_mode(dtb_pa);
+	set_mmap_rnd_bits_max();
 #endif
 
 	/*
-- 
2.42.0.582.g8ccd20d70d-goog

