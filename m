Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B310146D5A
	for <llvm@lists.linux.dev>; Tue, 22 Oct 2024 01:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729562372; cv=none; b=V1OlkTXh6FWeMDvd15yn00h+Mp2P3XQkGS7xlNLEppCr/D2iXpPYCPe6cIJMTO2Zn9f8q5DR/llieXQGzVZ+c1Q0105huehWinv+EhXhit3dNRX05e6X2npyy4n2M5G907Jgrd5GQZjOFVvTTZX+/KbeeR9YWY8FI2d/dR8UTLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729562372; c=relaxed/simple;
	bh=vA+zJm4qoMQLI2hkp6NXbqiyhUSCAXA2wJHgTca3RRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OaNqDdUPojHbOF76eF7Cc9H026HVjUhvfjdSBJsl436PePyVFptWkrBNh2qFOheugS2fphnqmeDWN1UU3I1Dzs/hmxIlT2LU4+n73vw6TLyLLtpvBpb77v4jR4WQDF7hlXzi3lVGI5gRIkErHEEQX3H1WV/5Tj1DWXrrWMEfaUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=jPpzSjcJ; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="jPpzSjcJ"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7d916b6a73aso3193580a12.1
        for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 18:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1729562370; x=1730167170; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bo8mvyzhNAGog51IrcbhLjSHRzC25xwCT3do7aV0R5s=;
        b=jPpzSjcJv1rMqHrtekxV2DXHWvS2luRhKtSlbPthzD/3IE5jXX7AjyHsL2BiDeSNmU
         HLCQHK9VLV6TyKUpuF385Z6Q7Ur7xvzg80ScM+dvr7wOduUoYlmIWtrxP+8AWiracZhR
         az/Jw/xuNYZB6f8Y5SFcAsowUgvQqDHkr8thSt7clqRcWPQP/IIKtMRulGuRh/fWz8cp
         UrD9Jf3bS4XhWerf+7qUVsQZGwXaDcdAc7r9WB7Rvi0U4AD9+xkPSs3mG3RveMk48zw3
         3bvAy8ZBlmsuLl4gGW4186fwV5Z8EJkD7hKoRDkD2gL0/pq4wAOv/ExULmgVlI6paVob
         Hoyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729562370; x=1730167170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bo8mvyzhNAGog51IrcbhLjSHRzC25xwCT3do7aV0R5s=;
        b=paMV+xR/RRUEn6N6xa4cpJXcKdPTCUkIMNSbUTRJ1pkBtoLVolQTrinOLxRqCF/9ZT
         PH5ophmGF9cdbnTxfrRx5cRQ28dgmllmfY8bFdIYPKNbu3Pxyi7aiDQzUZlS6sO5P96V
         +SizX48aTL3kp3RDnGc4F6CDebtYeLZCIFz9M+poSYRnui/ssU2kMVAKfQkq4lgcK7Cl
         vIuUWupHAqVd80nYlEJ3ESgbbhVeTHjsNc2qOqA531jTaInoUgCVd2bHhjwotZbNaYgq
         40A7JCAavMp/BICDm1dIpzgShUkcTRTktn4Q96npTz7u3+Mm+lBWUHeZCHnXPjJ/ouQ8
         7kxA==
X-Gm-Message-State: AOJu0YwitBaL2FaXHEjEtAOVW2BpK4cf18m2/6FsGcx51iJDvSb9KG+B
	h+B4yeSh0/I94BTWWVbkX/s1Ifk47SePbFwxSIG8iC2bkXHpWFnkKfNZwkKweh4=
X-Google-Smtp-Source: AGHT+IGIGEeeGnC+KScU7RsGDXnOT3F+tOuXMVMoo+fGP2CQIBFtA2wtlRRoG48p3wyuBbKw6oUq4g==
X-Received: by 2002:a05:6a20:b40b:b0:1d9:b78:2dd3 with SMTP id adf61e73a8af0-1d92c5100b6mr19225561637.26.1729562370603;
        Mon, 21 Oct 2024 18:59:30 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec132ffdcsm3600710b3a.46.2024.10.21.18.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 18:59:29 -0700 (PDT)
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
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 8/9] riscv: Add SBI Firmware Features extension definitions
Date: Mon, 21 Oct 2024 18:57:16 -0700
Message-ID: <20241022015913.3524425-9-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241022015913.3524425-1-samuel.holland@sifive.com>
References: <20241022015913.3524425-1-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Clément Léger <cleger@rivosinc.com>

Add necessary SBI definitions to use the FWFT extension.

[Samuel: Add SBI_FWFT_POINTER_MASKING_PMLEN]

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - New patch for v2

 arch/riscv/include/asm/sbi.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 98f631b051db..4a35c6ffe49f 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -34,6 +34,7 @@ enum sbi_ext_id {
 	SBI_EXT_PMU = 0x504D55,
 	SBI_EXT_DBCN = 0x4442434E,
 	SBI_EXT_STA = 0x535441,
+	SBI_EXT_FWFT = 0x46574654,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -281,6 +282,33 @@ struct sbi_sta_struct {
 
 #define SBI_SHMEM_DISABLE		-1
 
+/* SBI function IDs for FW feature extension */
+#define SBI_EXT_FWFT_SET		0x0
+#define SBI_EXT_FWFT_GET		0x1
+
+enum sbi_fwft_feature_t {
+	SBI_FWFT_MISALIGNED_EXC_DELEG		= 0x0,
+	SBI_FWFT_LANDING_PAD			= 0x1,
+	SBI_FWFT_SHADOW_STACK			= 0x2,
+	SBI_FWFT_DOUBLE_TRAP			= 0x3,
+	SBI_FWFT_PTE_AD_HW_UPDATING		= 0x4,
+	SBI_FWFT_POINTER_MASKING_PMLEN		= 0x5,
+	SBI_FWFT_LOCAL_RESERVED_START		= 0x6,
+	SBI_FWFT_LOCAL_RESERVED_END		= 0x3fffffff,
+	SBI_FWFT_LOCAL_PLATFORM_START		= 0x40000000,
+	SBI_FWFT_LOCAL_PLATFORM_END		= 0x7fffffff,
+
+	SBI_FWFT_GLOBAL_RESERVED_START		= 0x80000000,
+	SBI_FWFT_GLOBAL_RESERVED_END		= 0xbfffffff,
+	SBI_FWFT_GLOBAL_PLATFORM_START		= 0xc0000000,
+	SBI_FWFT_GLOBAL_PLATFORM_END		= 0xffffffff,
+};
+
+#define SBI_FWFT_GLOBAL_FEATURE_BIT		(1 << 31)
+#define SBI_FWFT_PLATFORM_FEATURE_BIT		(1 << 30)
+
+#define SBI_FWFT_SET_FLAG_LOCK			(1 << 0)
+
 /* SBI spec version fields */
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
-- 
2.45.1

