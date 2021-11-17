Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2C92C89
	for <llvm@lists.linux.dev>; Wed, 17 Nov 2021 17:48:27 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id g14so14708466edb.8
        for <llvm@lists.linux.dev>; Wed, 17 Nov 2021 09:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yZjOXRFe4kBHeHpuMhDtkr/g9/szioJdpeaJnfZ4kbQ=;
        b=F8R+uJ3fc4fFkn5jwhW2fdO+lATwUDuRWeIjB0BW6ubv0DQtKO6LzirZrw4DhgBYGg
         2Z0baDB+gQctNSyPOOwgmm+V6+09YSTbwUFvmYssUJtz2EzYnwakqPvKb9IZm/o1wAgI
         n99CDdOwMSpu/5fa2uz1Vl08Wf79RFNQrF74q2Yr+BQ2pvD2VyaQ/q0vErB5tab8W6Ng
         RIbzWt3HFFeZBHhgtc18saTKKrmfaKk2qtGSZ8i/iEfePqSF135ZSjvae4ddlu17KC28
         3cAf5VowCXr60ydlI7vqY7IvMjOlsBABjG8kPK3piT/u+iGfoFjxOIqVnDFZQPuinDsg
         0DHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yZjOXRFe4kBHeHpuMhDtkr/g9/szioJdpeaJnfZ4kbQ=;
        b=wZXqT5JVOHAOjR/6myAp/ijNK/Lehric9bsMQvC5xI/j5j0UI8jPkC3HzDC+ZYKoHE
         ZpiqTj5lW4ERV/tF3OmJ1aX71ms2oNnv9YXOViWgzT9AcnIGnGW3lQH48KY1LJ6TYjiF
         Vy3um2AK/ziP12FHswcKjBZQOANDeZ4PNu3bKvXjR2Fk4eGzgnTz1qgTN3+wddBK57iM
         c1qgyRN5fGMVIPo9Pn/o61nwfs8rNkaq1Ei9RCKybaTO3uZ8R9JPDJz2cjCps957Wp4l
         /AO6NpPCKn0jsWeu4mG/68NpXU6eKTRXFNZopuNYdbkgKIfCwkHpRZU/1vw+K1Gc9gi9
         eJLg==
X-Gm-Message-State: AOAM532RNCSimUSbmqzQjLWxUkNBIn88BESoH+yTPOAdAoUdUXl4GJd2
	CJATS7NaUPSWARG67HqOm3k=
X-Google-Smtp-Source: ABdhPJw+qL1QPzZ5AdE2opgq04rudnPWXFWVMorBLzCbct64V52ZFe3zXCWxuEt5RIeKDZAlTdSpHA==
X-Received: by 2002:a05:6402:1914:: with SMTP id e20mr762999edz.96.1637171306150;
        Wed, 17 Nov 2021 09:48:26 -0800 (PST)
Received: from localhost.localdomain ([82.78.89.185])
        by smtp.gmail.com with ESMTPSA id go10sm253902ejc.115.2021.11.17.09.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 09:48:25 -0800 (PST)
From: Ilie Halip <ilie.halip@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Ilie Halip <ilie.halip@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Mete Durlu <meted@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	linux-s390@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] s390/test_unwind: use raw opcode instead of invalid instruction
Date: Wed, 17 Nov 2021 19:48:21 +0200
Message-Id: <20211117174822.3632412-1-ilie.halip@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building with clang & LLVM_IAS=1 leads to an error:
    arch/s390/lib/test_unwind.c:179:4: error: invalid register pair
                        "       mvcl    %%r1,%%r1\n"
                        ^

The test creates an invalid instruction that would trap at runtime, but the
LLVM inline assembler tries to validate it at compile time too.

Use the raw instruction opcode instead.

Link: https://github.com/ClangBuiltLinux/linux/issues/1421
Reported-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Ilie Halip <ilie.halip@gmail.com>
---
 arch/s390/lib/test_unwind.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/s390/lib/test_unwind.c b/arch/s390/lib/test_unwind.c
index cfc5f5557c06..d342bc884b94 100644
--- a/arch/s390/lib/test_unwind.c
+++ b/arch/s390/lib/test_unwind.c
@@ -176,7 +176,7 @@ static noinline int unwindme_func4(struct unwindme *u)
 		 * trigger specification exception
 		 */
 		asm volatile(
-			"	mvcl	%%r1,%%r1\n"
+			"	.insn e,0x0e11\n"	/* mvcl	%%r1,%%r1" */
 			"0:	nopr	%%r7\n"
 			EX_TABLE(0b, 0b)
 			:);
-- 
2.25.1

