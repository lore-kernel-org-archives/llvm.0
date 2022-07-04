Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7941A23B5
	for <llvm@lists.linux.dev>; Mon,  4 Jul 2022 09:27:16 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id r14so6774282wrg.1
        for <llvm@lists.linux.dev>; Mon, 04 Jul 2022 02:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=8ajViNQRBuqUSn02uQYgcqcIAiyCQZm2aY6tb0Jvxow=;
        b=FwV11uqFxCK4IkZ4zVZiQ64I4Ggdzep3kIDUZ2+1HDpOAhUlfzAYQJUacB1phfkN2X
         B2HQRkjXpwoAcuKnts64swRREXrVL4xJrJZ9WYfFyoHRvfGx3SOlMfDHIoShfgM86eoE
         AD6c8Vs5c95BaGGO/di2Xh5BNHGRZ6t1xKrPqwmbwreDxwQt9H7npJMcxNlxe16qrIxR
         bSGh6dmLpgE6CclNjxAIPWG2Vn4Kr0YDJAPJw/xemQN/PnikqQrEvbPdL20O9C3DsSfV
         41Y2ic/yf0dFgLd1K0r+o0E7pB2FuYAm4jbyeIXVo3hBUk4RtoVVAoJQ15c+5E4BZzlQ
         V8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8ajViNQRBuqUSn02uQYgcqcIAiyCQZm2aY6tb0Jvxow=;
        b=HFLZ4sENEiAJNOkPG3XpVRjCFX64Enw8lN421HO9EXaMc5h5Y1s5gkZVIHUaOHn/Zh
         ev8ojIAD6KR8cPNmf3/j2VPWSN0Pl76YYv8iayH7set4oJO8LgcmSpOByWDXHyoZJY7D
         oIGsJlorEJvj5XkFwCd36viNMQ8WCXQ9KDi+GKCB/Q6FIvzrArjGvNUa5723mzj+qRPm
         U4kXugFDxG3KdOaUWKY09UcksMV1O5wuRzxMazIcUZZCEq3r/CfU/VIyz4lseLiQwSSJ
         Y+rNeowjZRgzSASeLiPoDvMbsXY8un5QOnypkqKTY532iqLcPtqn/eBZtoTFunX/qEgb
         Njgg==
X-Gm-Message-State: AJIora8CZNoQ+esuqJNOnczQRwyQwn51CTKedjs3zyYZc1C6gHS2fUuP
	MnJuPPQL24urh+zGRw6HgME=
X-Google-Smtp-Source: AGRyM1toxERE0aCr4bhk9/9ushPcgnzqZmqbDSrQk4jk+lQaqJhem9chTZej0sQW5e9RrOi3uvfEsw==
X-Received: by 2002:a5d:47c7:0:b0:21d:12f8:e0be with SMTP id o7-20020a5d47c7000000b0021d12f8e0bemr26419284wrc.432.1656926834593;
        Mon, 04 Jul 2022 02:27:14 -0700 (PDT)
Received: from felia.fritz.box (200116b826716b008998943ac77556e4.dip.versatel-1u1.de. [2001:16b8:2671:6b00:8998:943a:c775:56e4])
        by smtp.gmail.com with ESMTPSA id d10-20020adff2ca000000b0021a38089e99sm29618815wrp.57.2022.07.04.02.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 02:27:14 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Mike Rapoport <rppt@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] secretmem: drop unneeded initialization in secretmem_file_create()
Date: Mon,  4 Jul 2022 11:26:05 +0200
Message-Id: <20220704092605.19604-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Drop the unneeded initialization of the local variable file in function
secretmem_file_create().

No functional change and no change in the resulting object code.

This unneeded initialization was already introduced with the introduction
of secretmem in commit 1507f51255c9 ("mm: introduce memfd_secret system
call to create "secret" memory areas"). This minor code-stylistic issue
was discovered as a dead store with clang-analyzer.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Mike, please ack.

Andrew, please pick this minor stylistic clean-up patch. Thanks.

 mm/secretmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/secretmem.c b/mm/secretmem.c
index 7584aab54d20..46b431d62761 100644
--- a/mm/secretmem.c
+++ b/mm/secretmem.c
@@ -171,7 +171,7 @@ static struct vfsmount *secretmem_mnt;
 
 static struct file *secretmem_file_create(unsigned long flags)
 {
-	struct file *file = ERR_PTR(-ENOMEM);
+	struct file *file;
 	struct inode *inode;
 	const char *anon_name = "[secretmem]";
 	const struct qstr qname = QSTR_INIT(anon_name, strlen(anon_name));
-- 
2.17.1

