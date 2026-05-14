Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBCD3C98B8
	for <llvm@lists.linux.dev>; Thu, 14 May 2026 12:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778760860; cv=none; b=R8+BbsPML0DlmVlikH4B0eJlqfUXy4XPMlY0MhFjBXnzAEfkLB2TQa9A/MtnBrR/j9KVgsO76yI6qENCf/YGmEpCBtGdnVccg1WZ0B7otDeVb6/W5MYKEzmgO2c3JjhZr/rkSoB2Sbjvw6a376QmGbX94LRSP6ikuAqaeZO4Mhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778760860; c=relaxed/simple;
	bh=IAO71bX6/0l+Uffip8mV9c2OUmrqf/4IKgA70H+dCIU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CHAn5PRdWeUcoS3P3HdghAdQtWu7Q2BhtsqcfloFy/fXfXDt86uXP1LfXadViHWXPAEo5KgU/acoKKDzNkh221Cnc0Ggpok3DanUetOL1NdpdNER1O8UkvU/HOg7cUTp9U20M8aoMbXRvIVPljWZgxT+OKThkgaK3Ohlw8wrWI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o6NULJmk; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o6NULJmk"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-44a14580111so5792059f8f.0
        for <llvm@lists.linux.dev>; Thu, 14 May 2026 05:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778760858; x=1779365658; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bGqf3rD2el4Fophu1OMYrfA7Yv/0FbhBVG7jdE96agc=;
        b=o6NULJmkcTnMEF82xPR7rgGYCHKSfjOE0eRtv/jQrzqQsd/OGCid3QjvPjAtrgUusu
         unrgjCk3GenVuLURluBsHEbq8lMCxHkNjGlY3HNcolrPrPwF/44bvKi/6GcLSaPRezuR
         CPdz99dVkXceL3HiO1VuqYBJpCmN9Zk7xB36hqUfriIpc1e8/KE/tEEeLaIIUwphRGqz
         AVfF6wY7YtAOPr1WdBd4HDY+Ks14b13Fi47lr84mu7MPPQk3hpo7UjEFjG/t/Zxpy6eO
         KoqmbndOEEox5EFDcPQkESAiHu4q5NfRydVIzxGUWMUtd2FTn+rlOa66wFAc+jxaIso8
         CfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778760858; x=1779365658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGqf3rD2el4Fophu1OMYrfA7Yv/0FbhBVG7jdE96agc=;
        b=o0XF9L1sFTuXRQLGIuQHhhHZqO7NzKOLeZOBe9j3/SqgH+kEAer3ZcV421hUVPrS4U
         ZFVP2xQljojRVgIthT6D8V7KdbtNz6oNiDxI9q/fR+6+TQQYmLu6fLFXO6H4KTRCr/Yt
         R7UrvWRZfRByqo5ZrPW4AONB3Y2VuQVFQU2gyD5boIGCOiOnRIx08CTXMXTU9XN6wmYf
         MWwtRSb1xk6FqAYZ0WItGDnSvoimXa6CiaOq5WCe5jDs1FChGFOBE9eq3tgyDZHbf750
         bcEwhkJUQ42U1uuyDBhXVoLhZwtrZoFaMtmZKXVGdMaN1btIpVoaBbu5yV+Qz8hftB7K
         6A2Q==
X-Forwarded-Encrypted: i=1; AFNElJ8y3N1xyY03o3lJK7JN4MPfQODPs2rtwcVJ/87HczIB6pvB6g+nHTRgwxhC4CWhQeE9syrf@lists.linux.dev
X-Gm-Message-State: AOJu0Yzt4/1DlWwgxhFyxpZSEx2f7WXyU8JP+3DlWjZFi0n1oWppbPdb
	Lw2M8/8uSY4QzsTsnvS6L7DehCAadU3lFH0Md/V/n+eBu4pGjMUgAzny
X-Gm-Gg: Acq92OGbFEW8MaHsjbY4EnjCWSeBoCi+BGo7WBTzRFGWwe+54DjYuV8O6QtHXeKDKmA
	qnsoScB6zE5DJu0ojmevC5LyvnkwPrCoBqY0sPIFxqFtRJVs3NFW3r9d2/+FsmTZaC9t1K4etAe
	eh4Fc4ytPAj53lsNVzSAXxVDzLT7MVlTIeL4NEJ/xNvBz34yJghB+dGt1HR5kMrsMGHuRfvMiei
	L/OCQmCp5Ni0AOlZf9kfCF8tqDQserzSqiB1ugVIb8XKl0ZD5wIb8cEfiQtSEDHT/vLOqqXmGSj
	XSzpIsXR09RZ0AKC5zX+vPWojmwigSvtD4KqLQzC1HWOKv0DwkJEcVgU0iR4Dv3tGFYSZcf9CR9
	CIB8XdK9zYPTZiadKlizB0QvGkMIRPabibgFntUwLo6Wc6cid+PfDTRgG3jfyZ1qSCRMQf482Qb
	KhY4dZKI1Kn26Oawl8fvy0rKi1DAFExY26IkNTGTr98/JTkbgmjrMc
X-Received: by 2002:a05:6000:1acc:b0:43d:7af0:3a7c with SMTP id ffacd0b85a97d-45c7a4ef3e4mr11408615f8f.29.1778760857731;
        Thu, 14 May 2026 05:14:17 -0700 (PDT)
Received: from RTRKW671-LIN.domain.local ([77.243.27.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e767cb9sm6285630f8f.2.2026.05.14.05.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 05:14:17 -0700 (PDT)
From: Milan Tripkovic <milant2002@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev,
	Dusan Stojkovic <Dusan.Stojkovic@rt-rk.com>,
	Milan Tripkovic <milant2002@gmail.com>,
	Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
Subject: [PATCH v2 0/2] riscv: lib: add optimized memcmp() and extend KUnit tests
Date: Thu, 14 May 2026 14:13:56 +0200
Message-ID: <20260514121359.931999-1-milant2002@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an assembly implementation of memcmp() for RISC-V. This version
incorporates feedback from v1 regarding alignment safety, loop 
efficiency, and ZBB usage.

The second patch extends the KUnit string tests to include functional
verification and benchmarking for memcmp().
        
Signed-off-by: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>

---
v2 changes:
    - Added alignment checks for buffers to avoid expensive misaligned loads.
    - Optimized the loop using end-pointers to reduce per-iteration overhead.
    - Implemented word-aligned tail handling using ZBB shifts.
    - Removed redundant pointer equality (a0 == a1) check.
    - Retained BE support via #ifndef; ZBB rev8 is used for the LE fast-path.
    - Fixed KUnit build failures for Clang and non-benchmark configs.

Milan Tripkovic (2):
  riscv: lib: add memcmp() implementation
  lib/string_kunit: extend benchmarks and unit test to memcmp()

 arch/riscv/include/asm/string.h |   2 +
 arch/riscv/lib/Makefile         |   1 +
 arch/riscv/lib/memcmp.S         | 124 ++++++++++++++++++++++++++++++++
 arch/riscv/purgatory/Makefile   |   5 +-
 lib/tests/string_kunit.c        | 106 +++++++++++++++++++++++++++
 5 files changed, 237 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/lib/memcmp.S

-- 
2.43.0

