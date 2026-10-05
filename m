Received: from mail-vs2-f37.google.com (mail-vs2-f37.google.com [74.125.227.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545BF1A6822
	for <llvm@lists.linux.dev>; Mon,  5 Oct 2026 20:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791232776; cv=none; b=H9NVPXJCSiH7BUJdolnPTjSeIZG4LYyXZFKkZM/rx9AhabX3pnuS2b8HMKkAwDJRlRcrUn+3nb68/aX/u33mPs7uKEEsopC5V8VTOi0yoE76cNtXupIM/Ootu98ShB6Tay2FEmEz9OFNhzdjLr36KQbbVLOgkFKbNtebGB0VAGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791232776; c=relaxed/simple;
	bh=W8+JkQSMqBDxJZXNAx4qDJE766xaxIYGmX4KE6Hx2As=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jDb2+evlFenACuo/q5lOxqtid9AR5+8V6+2U//Xd93uaLbQ78VtCGq3jNR1r0fUoH2WZ5UdAn8d3ymKSgELyagFaUHLHLKWnc7G1wbw9ru8vd6xlwHA3vLMvwMiqOcsMFxm6ZSlh4oLo/x4LB7PnBbtNCEjakDeYA+v065Qkqac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gru6ZwAl; arc=none smtp.client-ip=74.125.227.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gru6ZwAl"
Received: by mail-vs2-f37.google.com with SMTP id 71dfb90a1353d-5e29744c11eso480911e0c.2
        for <llvm@lists.linux.dev>; Mon, 05 Oct 2026 13:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791232774; x=1791837574; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AxI9jOWrXLzRQeo91PfnufO4X1292wU3kDq7ULz84yY=;
        b=Gru6ZwAl9tBs6LBXur0LXJRuxNpUPZPJRIHVpUPeih0tQZjMDBfrH5bunoeB+++Phe
         rua5n6tgkxUbdDXxSKM5pvxkKwC4PG68WLsDkKg+NGrnYDvbQS5ahxSCrs2XalqHE9HP
         81KFGG4ZF7KhKVHazIO6sksuJSNTrx1A9ESRt6NJQNAE8TSzzEvjJ8rHix8ONnNzBm26
         3fZi87G0OvLOE6MUTlPYVlFneuh80LtfByQ+5e6ELHoTSKRwRZHyLK38wfUPTqBeqxTs
         5OiI3q6+teRdWo70f8pqnLSPCcuGjG9We2QqMnt5av6R5/gYpeDhBkJ8TopWzHeY8ll2
         SnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232774; x=1791837574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AxI9jOWrXLzRQeo91PfnufO4X1292wU3kDq7ULz84yY=;
        b=wt2UyosLoJJeawavi2vEzI1F6bbEf+31jWtvoY7YkzB+lR5zgFR8NGpgrgP2nNQwyr
         AlBZCJJlOy5jqywIGOu9V+9lLPEb28vkQJlTgzGSQsCyK/mm2b4p07DaSlHRBD2cnhql
         Jnd3CgQw7N9pzXW8k78rAtDkZWs9bPfho54bNxuUqb0iK9F0svdXhfVVaIwtPyLOe/LV
         GpLoQiXKsID0nOKzSgO+xsebaR3YIolWlqOxDTuETXBj7JioAUh+slpPCa/08I4j58+H
         OaLcEZzrdiCXfI6sU4u1nEtAMTr2UXDkfzakmKTEsXoZz3KiJ5eFc+v83a9yNefTMzkW
         Pa7w==
X-Forwarded-Encrypted: i=1; AKwUvBzSKYmHiH8xiaSYlE0/bQghUTtifG7BmbKaT1AL9BxdrNT1tKO375aX2RfguCnLEgQR32ih@lists.linux.dev
X-Gm-Message-State: AFq9FYKNnAV5zOno6af+08VWFmq1uwrAu3C7AoagJR8YJuGoZChB/jNH
	PzDrxkq2cnBC7mjImTJlqsip+iMkVZgoObbBlQPMY/x7xHOfblu93hvY
X-Gm-Gg: AYBFou3EWZ8ZaM1sifhBONofv4XwR+LefZuER08AucH+TP12LqWTS9sh3J0tBQ5vjbs
	XA2rhdvp1AkiIcL9H0Jf+uF0i+IkwR8vn3TIO3YclRVJs1ln5ndjhOWqGs2BEqgTACjFHWUV49u
	tsQtLbk3m//xxNXZ1zBggxUkrLUgJeyFOFMRysCUPmdtxIA0VC8dJL13YhUIBRdLEd+JVaCApf4
	mjsI5xXvdJAK9dp5a199uJsT706LH/x0sMVg6i7WPPmxEBtUOZXZRnvq8kz4XiCK1x4XuE3W5T/
	YE20XZOQ8OQDsJRTG/RGeDB1tUXNyyeL4VmOKRRyVf+lv9QECdQiDEK/WgKza8cS7uirzTjqB20
	dRpaCEi2uKzd18c8mBUzPD9UyRcKFZ608jSnc3Kv8jUQOA+DNmW9921X67dKZzH3avNUgbuwgBq
	f05h33rcPp37MmBOYNLp/p493lX2DTDAbSmgTvYMdsMurSYvv/BCMu6FDJ7oOwGGE55qdfvaHaL
	vO6mUCQ6fbFY+cjWo9ydIrwbZUj1D68PedH5UMD1/1fJ6wYTf9ApWViNkx8M5BlzIO6GKYHnWxW
	34amgfCWSscEGRM00eRiLgoOVW/6E333yWFu9+dyfsK+ol2n
X-Received: by 2002:a05:6122:d0b:b0:5c9:c60e:3a4a with SMTP id 71dfb90a1353d-5dab3263c43mr4109827e0c.22.1791232773813;
        Mon, 05 Oct 2026 13:39:33 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e54e8006d9sm542088e0c.4.2026.10.05.13.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:39:33 -0700 (PDT)
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
Subject: [PATCH] sparc64: Define p4d_page() instead of stubbing it to NULL
Date: Mon,  5 Oct 2026 13:39:30 -0700
Message-ID: <20261005203930.246598-1-rosenp@gmail.com>
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

Define p4d_page() in terms of p4d_pgtable(), the same way pud_page() is
defined in terms of pud_pgtable(). sparc64 has no p4d leaf mappings, so
there is no functional change.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/sparc/include/asm/pgtable_64.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index 35a217bf6e5c..c5eff6efe514 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -850,8 +850,7 @@ static inline pmd_t *pud_pgtable(pud_t pud)
 #define p4d_present(p4d)		(p4d_val(p4d) != 0U)
 #define p4d_clear(p4dp)			(p4d_val(*(p4dp)) = 0UL)
 
-/* only used by the stubbed out hugetlb gup code, should never be called */
-#define p4d_page(p4d)			NULL
+#define p4d_page(p4d)			virt_to_page((void *)p4d_pgtable(p4d))
 
 #define pud_leaf pud_leaf
 static inline bool pud_leaf(pud_t pud)
-- 
2.56.0

