Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E21813B58F
	for <llvm@lists.linux.dev>; Tue, 22 Oct 2024 01:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729562371; cv=none; b=VOPMP5gh5za/VhTCIXdPsORqnLTNcXVFWrcO9e85zC7cyar398sMxvEMvzQLE8pXFP44NHZqXMR0WIIfOPDaOm0pF1sh1W/h+FXs8nodbWIk2Z+1+hB00VXKfZim01s5GqgvoqbbRvxb4hGEbG3K6JibE3+FTI0WXLGER2Mdev4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729562371; c=relaxed/simple;
	bh=O5lWqpDcFOKaIADUL30wY0OO26drBl/ty+OTgNOwqp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TLKH/DilY3ZNjinUvXFKMTRT7IIOvClxrGG50GRRzTS85C/UP7OIV3kA+zSAyo8c+Eta6n46k1pKgb4l5hq9p1+t9E3y/JOTF4e77QgH6Rcr8E/ExKAuUCnWUDF717u7TzWAgJsALE8WKErvztb9KRZne7nn+Jm5MM8QeSYUfA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=DMsfgVNf; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="DMsfgVNf"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-288b392b8daso1816893fac.2
        for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 18:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1729562368; x=1730167168; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=559wueV0PG6xFm1m5EmJll56/fKSQJhn2CptHQFJIX4=;
        b=DMsfgVNfHvX4Y+RZC5jW0pwfu0Kml4eTM37JG7oelgr74LrTVS9bgeIqweGDuhRF7m
         ELQCGRAndaJZSlZ1OIdae+CQNNUxIqQw/mHsoZ5YSfWiIizpsdMdvMVbBQ02jckanILV
         eCbOzkbCb/OblBfAc933tlxVnmuMkIHEyr4uDWj+cfHsmHplRHF8VWj3YlDJurVntAYu
         H2wWjetiGk784/6rpwNJYLpY4UZoVGKl+be4PZ+uj7nDATYaPWiMV+2TD/MK4YGfR686
         c3Ti8W7BptgZgpYEkX+0oJtvMrTmffcr/IaRfMvAMhBkWBCWQ2KY2O7ZFAWDww4DRjWr
         MICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729562368; x=1730167168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=559wueV0PG6xFm1m5EmJll56/fKSQJhn2CptHQFJIX4=;
        b=iKGalh4gRQ6nyqfqpstO6OPggDOE0sItTZLa0DwUkerS3f1T9YHs/axTr10nAeIolb
         awt+NZPwclNZgUH5KrqQirt3WOCr/3pCxrhfTwHO1D19dFUMG9qHtuH+1i6iM0uvFjXO
         V2GM1/CPSXK9v1y3Ib3g930k4EKfMTPTXCkGMkezx+ueoQrh/62mbJuj9Ahy6LrpWZqq
         HfcNM7jmeWl6RdBruqQ6F1CLsNrPWZErepcu/V1M9Ux0jRpWbZrWI0cDX3SkSE2ZlXrl
         MPE2GUtWv9bGWV6p6BHST+1AyzOcpOD6OCGqAruq4JjnoHoS1rkh//4r6U0AC3eLE2RL
         ThQQ==
X-Gm-Message-State: AOJu0YwoX8TIr1KFsbBeda1zn28yKRjCt3jfBu7Drv6WQye5G/TNF5Sd
	oW1PfeNSlkbH5UEtZsslcYdQCcJ/80wOd4SaotBJYNYfX7gokupk91YB6fbkmfw=
X-Google-Smtp-Source: AGHT+IEp2UA/bF+2FyY3t++ENshpm/xo2VESMIC3hEEwlJcPqi8vvi8Dyd6MCRyyBM+qcOZbinhyoQ==
X-Received: by 2002:a05:6870:95aa:b0:277:a43a:dac2 with SMTP id 586e51a60fabf-2892c2df34amr10113787fac.17.1729562368580;
        Mon, 21 Oct 2024 18:59:28 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec132ffdcsm3600710b3a.46.2024.10.21.18.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 18:59:28 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com
Cc: llvm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Will Deacon <will@kernel.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 7/9] riscv: Align the sv39 linear map to 16 GiB
Date: Mon, 21 Oct 2024 18:57:15 -0700
Message-ID: <20241022015913.3524425-8-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241022015913.3524425-1-samuel.holland@sifive.com>
References: <20241022015913.3524425-1-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The KASAN implementation on RISC-V requires the shadow memory for the
vmemmap and linear map regions to be aligned to a PMD boundary (1 GiB).
For KASAN_GENERIC (KASAN_SHADOW_SCALE_SHIFT == 3), this enforces 8 GiB
alignment for the memory regions themselves. KASAN_SW_TAGS uses 16-byte
granules (KASAN_SHADOW_SCALE_SHIFT == 4), so now the memory regions must
be aligned to a 16 GiB boundary.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 Documentation/arch/riscv/vm-layout.rst | 10 +++++-----
 arch/riscv/include/asm/page.h          |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/arch/riscv/vm-layout.rst b/Documentation/arch/riscv/vm-layout.rst
index eabec99b5852..c0778c421b34 100644
--- a/Documentation/arch/riscv/vm-layout.rst
+++ b/Documentation/arch/riscv/vm-layout.rst
@@ -47,11 +47,11 @@ RISC-V Linux Kernel SV39
                                                               | Kernel-space virtual memory, shared between all processes:
   ____________________________________________________________|___________________________________________________________
                     |            |                  |         |
-   ffffffc4fea00000 | -236    GB | ffffffc4feffffff |    6 MB | fixmap
-   ffffffc4ff000000 | -236    GB | ffffffc4ffffffff |   16 MB | PCI io
-   ffffffc500000000 | -236    GB | ffffffc5ffffffff |    4 GB | vmemmap
-   ffffffc600000000 | -232    GB | ffffffd5ffffffff |   64 GB | vmalloc/ioremap space
-   ffffffd600000000 | -168    GB | fffffff5ffffffff |  128 GB | direct mapping of all physical memory
+   ffffffc2fea00000 | -244    GB | ffffffc2feffffff |    6 MB | fixmap
+   ffffffc2ff000000 | -244    GB | ffffffc2ffffffff |   16 MB | PCI io
+   ffffffc300000000 | -244    GB | ffffffc3ffffffff |    4 GB | vmemmap
+   ffffffc400000000 | -240    GB | ffffffd3ffffffff |   64 GB | vmalloc/ioremap space
+   ffffffd400000000 | -176    GB | fffffff3ffffffff |  128 GB | direct mapping of all physical memory
                     |            |                  |         |
    fffffff700000000 |  -36    GB | fffffffeffffffff |   32 GB | kasan
   __________________|____________|__________________|_________|____________________________________________________________
diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 32d308a3355f..6e2f79cf77c5 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -37,7 +37,7 @@
  * define the PAGE_OFFSET value for SV48 and SV39.
  */
 #define PAGE_OFFSET_L4		_AC(0xffffaf8000000000, UL)
-#define PAGE_OFFSET_L3		_AC(0xffffffd600000000, UL)
+#define PAGE_OFFSET_L3		_AC(0xffffffd400000000, UL)
 #else
 #define PAGE_OFFSET		_AC(CONFIG_PAGE_OFFSET, UL)
 #endif /* CONFIG_64BIT */
-- 
2.45.1

