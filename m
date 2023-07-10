Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CE9134D1
	for <llvm@lists.linux.dev>; Mon, 10 Jul 2023 18:35:59 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-c595cadae4bso5589959276.1
        for <llvm@lists.linux.dev>; Mon, 10 Jul 2023 11:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689014159; x=1691606159;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=U5TIV77Gf9BVe9e6kCB4/ILVtLRCWpn2g7fhFOBoE3s=;
        b=qwyEfW3Cmou0wgR8ApNwjEhaMEQudKFycuSBNRASsvYbO6BVLK0h2HB5eRL+9FdoMU
         cHkqVYioIwvINUHdXDqouKSsUkMhNEt3vlZ5EhDdG/GJ7aS6sxT9BTuMO57QznLtk4Do
         UOyDz2FVIrzepF2aCMOr8gdFR+IFDr8Yizd130zu+X1a5ZNeGj0E1pS9r4u2rgJl03cn
         LvhEifvwZc9TS+BeKevDHotAcWKC0F37ns1qqWpTSOjO5WQ638Ecmx2sZTcvgnkz4ikm
         f0djXHkpR6yjiOb0JfKYanYVo4ymoKD9Tm6gnQSjri0cs478Yrmox99UBLIWxPCVcuw2
         insg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689014159; x=1691606159;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U5TIV77Gf9BVe9e6kCB4/ILVtLRCWpn2g7fhFOBoE3s=;
        b=T8MzKDp4Qz1JCIXijiilHcxoMSSi7fmrvk601RCyQNEZx8e0f/7gQjlppQyOhtcn/6
         xu9yixjUPtHDJZvzBp/rX/kIWxH9mA7SxmlJw7JuTq4ShuHriRZjQGQLj6rbbjwCaNPq
         MvhLQGImej7DmfAEp+UY+KDFDUq59AyYO8So73jJckyqhuiOWtTjWw9C/wXH/UV0RgOu
         q3LyXyWChP9N2ifopwyFm3wo6Wzcv9/9Ok2sHCSWdS3r2abXGGoTFNfCOMONPWFMni0h
         Z5mEbcfnn14bTdZ/4mnZpWXAbAafkhAxFpwVivkRKoNjrW91lmpgA+1Hj8+UmNGrdo2F
         8oUg==
X-Gm-Message-State: ABy/qLbNbYfU+Ub01g3OwH5mk9Qih7P4h2dgaNQV39mtxR7iCN2sruHf
	FV3qpVaRMd3sVMr4L++PbEdk8+HuSV4BzOMmny4=
X-Google-Smtp-Source: APBJJlHCBpDFRan8lF/OCBAcQRzjHMIn7AKZyi8KrXyHj/pOEPwKO6DHb0dieV8Bld6b3gSNsuAgryF6lwn80bKvU1E=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a5b:90e:0:b0:bc0:bfa7:7647 with SMTP
 id a14-20020a5b090e000000b00bc0bfa77647mr78507ybq.0.1689014159077; Mon, 10
 Jul 2023 11:35:59 -0700 (PDT)
Date: Mon, 10 Jul 2023 18:35:51 +0000
In-Reply-To: <20230710183544.999540-8-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230710183544.999540-8-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=786; i=samitolvanen@google.com;
 h=from:subject; bh=Kirtl/2CH574RlVli6RH7Tr3lxFM3RdB5GGPayWpFT0=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBkrE+BGANkjs7x+hs99YYaMrhZLk9av9PmK51ek
 dJTYVpr+pWJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZKxPgQAKCRBMtfaEi7xW
 7nVMC/0YbuLZxw85M9u6LDaUUwcWbWuX73K0i6Ow+fZlwze0XWWIw6HwbB4a4LtG5NRd9Tb+RYJ
 j6jVsSUO6MPXn4uUYYiSa9lKiKsUoXUkG02C9xDkX6cCn9Zd507LQGKmZW/mzDns+m5H6sdb4O+
 9tuXpgxHMtOmmnM9pQseqzSsfOHRdBqZat4JjmG7GjuAU4mco3J7hCmubi/E4RyACCVYpYkk+wb
 gKCmfg89QQ/bzonXsdRv8Wj2wGDw0IOP+vQvx+19bw1u/LnPEx3L4TuXxYIXoVxS/vpYmdH56dc
 MNLQWYITWJbBzw5z9es2HByxf1uOi1N7FAVFxi9/wKQruIfPbzdUCWTSfhXRFBJ9bfh5ByFoLAx
 mOa+Dld6KrZPLvF+QuOnUt5fiMN8Fk77zFkUYLruYGIDyhJci/wxjNRwjHzVLnN4VwJPWlqZnUZ xd4WtDmOT5gKbgSr/iqHLa2YfhwhUraInyaAMD6csG1kxRAfyFOeiEWRFpP63KzG8Oz78=
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230710183544.999540-14-samitolvanen@google.com>
Subject: [PATCH v2 6/6] riscv: Allow CONFIG_CFI_CLANG to be selected
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Select ARCH_SUPPORTS_CFI_CLANG to allow CFI_CLANG to be selected
on riscv.

Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 29fdba9d8514..68c790b181c3 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -43,6 +43,7 @@ config RISCV
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
 	select ARCH_STACKWALK
 	select ARCH_SUPPORTS_ATOMIC_RMW
+	select ARCH_SUPPORTS_CFI_CLANG
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
 	select ARCH_SUPPORTS_HUGETLBFS if MMU
 	select ARCH_SUPPORTS_PAGE_TABLE_CHECK if MMU
-- 
2.41.0.255.g8b1d071c50-goog

