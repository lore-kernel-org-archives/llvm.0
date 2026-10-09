Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7942F9D85
	for <llvm@lists.linux.dev>; Fri,  9 Oct 2026 21:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791581577; cv=none; b=nY2ZjvAEsbrNIC69yYTgUTRONtz3n/7ix5Nml1CDfMmnFvmuC1WvJTWioXWogP9R+3BVJ20pThA6Cb0QKPtREw9mI93dE4CUGNkzQN3l+oPRHGna6BzYk9Syi1dsEhCCmVkQTbNt0upw7lCWW5BTVwlbiiwwByKJemqtrhIwnLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791581577; c=relaxed/simple;
	bh=tYoPTUJ3dCvu5GHSRIsiqDZLpqiBVrZfjRC+6TGss30=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=crHonVN9+HnOPZygXiQe0m6RLnnDjbfZeRy9GX7ovhUUZHTjHbHX1hq9u4VoMxP2AVpnY4EcXaOK/FqM9GnYrgN/wKKzTcjIPi/thSFVdlCveeEWtG3CpW2iaG3aEA3Hf12MmovWHjpc1O1xKhsdU5CPlwo6sDuRt+biNE5p+h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eLRT/h1R; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eLRT/h1R"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e541dc9cb9so582995ad.3
        for <llvm@lists.linux.dev>; Fri, 09 Oct 2026 14:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791581576; x=1792186376; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W/FpltOJ2Bx3xU6yFNT6UsoheDoakZFC4nFP/xB2F2U=;
        b=eLRT/h1Rho4GJ/2Bs/cHkGuLRLtANPT8AkkzTbXpgH8oK5EEbtegydUNtZc0W6gtjy
         ewLHYAqgD9vw3U6B8fNEuZmc3HBaUXgtQXUjzl4RUkAqBggodw+7EkFysJsbuBeKy16F
         nA7CNHpRisxuuSVi/D4cK7mawnM+3yYYT1CT/zHH71rnUPWvCPM42yly2ridH9+AigYA
         oc7KK6JgSXS9fS9crdeMkcv8VTJpI2lMT7yE0vs7guQxJTnPWkVsrHTwlIblk6fSNNRr
         sRsL08cPCp73gIXqnqoKrfI89OyV7Znsfr7mkQ4wXnlCFc4DgK1BvpbUDjoFDoPDC3ls
         M5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791581576; x=1792186376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W/FpltOJ2Bx3xU6yFNT6UsoheDoakZFC4nFP/xB2F2U=;
        b=zOrjRGRG3Jz+hyqEhItW4NNk+b8AMrcbqT6Q2Ny0GRw+6d8pBZkFvFANDDtxEqtBCl
         TFoXjQ4bkrX32MKhMMobbFxTeHCFFIES5ceQAB3j6elnbA6apFfBgDVtl1fJN/mA03Bd
         /bFzGrJe6b4yVgoZUaCUcD8RRuOciil0HV7f3nig2yZ9vZg33cWRt9FTS31GwQ1Ie0nQ
         tlurs5kUSPxuSVCObx4pLmK04uuRVQHFvBcDAb10ezKZMCmzylf7VMbxgnb527q1535x
         2p8moBJRpBVR4vmnwoe0bVZjN8LYVuQoEfXvcAUuFFynnLkNRAnVNFWk55nYXSV35uRF
         uLZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGCy+Esaj1aP+Y7xtFMfwYBkgu69EE6Bss3kvGPJgDBYgSrlmkkusKCW6JhnHHuH875b7i@lists.linux.dev
X-Gm-Message-State: AFq9FYLRxZbYVLKb7bFae6BPjIG37BtElS1ufDGYLwjmpD/O+FPeOMA0
	j1Y9Op9c+noNG3urizTT5oEdRm/nl3FVi1NK6qgHXry9dxyslUam8Gwp
X-Gm-Gg: AYBFou2p+AwECvrYze++BIchX/Ay5UmlhcSE1EsLXu8n0WWvdwaPcBTRpAtrRPcL/ee
	TC2PxZiWIdRSaEN0vdrcgBIolMUPW+MOkkqWmSm679SLaNY5lKEcW9xAieYIjRpcNCr3VDFqF4k
	QrTNzweI5NYKn6c3NIgjDHcAGrBRHehc2/4EklWS1Y18xPo4D2cnB6cLe8KaqM1l2j1A5A5bWAq
	dAZHq+7pR+N2sDGKcG0wZz1V4JDzqU159bMa43wnW5WVSyxR2KzX5cNN+adFywzxqvw0W0Owv8M
	HGSQ/vkluF0OASiIhD9VOYR9g0/MheymWAp5xEXTTi6BbdIITWVF9HkXBFw5wkn2nI5CU4PgChh
	+7tlE5WYEany0Ijdua5y1a7/9zPuBmnl+EMYzBW0ybX+1KW8PkGIaocfIF4N6T2oUiIlSFQp1KC
	QpU+d0jkx4c1PEn/Dkv5/kd1/YbcJLLgSb95i73Er64sw2s4WAYTJ7lbz5stcStKzZk6qoyd1UU
	AQkamrljRxqHMUkJkRDaqWaVT1yV+Ab4gUgCPdGXAL1AUUkjm07flJg5Xi2mTainyVKe1M1yEMD
	dYIBzYQJ7FJ8L3mWlqD1bzX4iz2hEUes7vj2lh7ddIh4bckk
X-Received: by 2002:a17:903:2987:b0:2e2:b557:aa56 with SMTP id d9443c01a7336-2e842dfb377mr27906225ad.57.1791581575590;
        Fri, 09 Oct 2026 14:32:55 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8dabsm16581735ad.58.2026.10.09.14.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:32:55 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: sparclinux@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH v3] sparc64: Define p4d_page() instead of stubbing it to NULL
Date: Fri,  9 Oct 2026 14:32:52 -0700
Message-ID: <20261009213252.111043-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A sparc64 allmodconfig build with LLVM fails in vmalloc_to_page():

  mm/vmalloc.c: error: performing pointer arithmetic on a null pointer
  has undefined behavior [-Werror,-Wnull-pointer-arithmetic]

sparc64 defines p4d_page() as NULL, on the assumption that it is only
used by stubbed out hugetlb gup code. Generic code now uses it in
vmalloc_to_page(), ptdump and KASAN. In vmalloc_to_page() the NULL is
used in pointer arithmetic, which clang diagnoses even though the
branch is unreachable on sparc64.

Define p4d_page() as a NULL function to silence clang's warning on an
unreachable branch. sparc64 has no p4d leaf mappings, so there is no
functional change.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: do it properly.
 v2: use a NULL function instead.
 arch/sparc/include/asm/pgtable_64.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index 35a217bf6e5c..bd4fc65e4bfe 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -851,7 +851,11 @@ static inline pmd_t *pud_pgtable(pud_t pud)
 #define p4d_clear(p4dp)			(p4d_val(*(p4dp)) = 0UL)
 
 /* only used by the stubbed out hugetlb gup code, should never be called */
-#define p4d_page(p4d)			NULL
+#define p4d_page p4d_page
+static inline struct page *p4d_page(p4d_t p4d)
+{
+	return NULL;
+}
 
 #define pud_leaf pud_leaf
 static inline bool pud_leaf(pud_t pud)
-- 
2.56.0

