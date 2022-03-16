Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F2C3B56
	for <llvm@lists.linux.dev>; Wed, 16 Mar 2022 21:31:26 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id x9-20020a5b0809000000b00631d9edfb96so2905410ybp.22
        for <llvm@lists.linux.dev>; Wed, 16 Mar 2022 14:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=5OneduaV2OXxq5CcxBruCxPc/Swfi9F6sRQ7+F/Zn1I=;
        b=MRL/HERqsHGSzx7y32S51BGQMoiBHeB6Cac8hgvSAKrK13IeqgqUD0pF+IS1FNw2cu
         jzx0VSzjCKMVY/v/1HF3qvNOqzulYYGxRKPwzym+fFTaatGnenQgu/BlhganrO3lc7pa
         iAlJdEMkfkTkIh4RyCP48yTbZOApgrxxBPps7Knw6Gfxn9nl/Vce0Qx1CNuTpXFnz/IM
         zo7DjxNlX39rtwjd0dbKZyovA7jTL6mFEoVM4PB6Lz6LUITgS0k9hc7ZWzp8J3VUTp3K
         Az6bpTViSCQUih3Fu8fspJosmAoqOqh3ZyxiBmT8utrrzoWhmtq0pDnkPq/OGvgqnBKY
         1srQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=5OneduaV2OXxq5CcxBruCxPc/Swfi9F6sRQ7+F/Zn1I=;
        b=RXRNtkmvVA7XLBt21/1NOMNCfU7hDkmijQVPxe/lrTj9JENlUUru+1Ut0DZEbpzFOA
         ZkiLEYJieB03qbh5VKaS3wPzONVrAk+PfXt8I/YdanSbJSykR61fFgobhCx9pOnNxAUc
         pq+fX+KKl3k19QSp2AXSfjeoa2A1voLMnEeQC5znkc7ljQkNXl20RTDDS/e49RV7xnbS
         PRYrt43LQ6I90r7S1k0y7sGZmTAhT2DCVdPWIkaTOWyAhgp/DOau74ogheOIbYvvaLHA
         spln2kE2qxdm1mZ+UIk1I2NV5R4v/z1abTEo3wA0MID94yX25mWFmPBctxVejFtZ0Qj2
         gn+g==
X-Gm-Message-State: AOAM531cwNzvcBXIcq1odeOan+Rxp+Tq050IhqfX8u0vVdouuj/wNzzh
	1PzGzx+RkuRwKDb7PD97wVtKzR8x
X-Google-Smtp-Source: ABdhPJyTwqZyQZ2E7Cpqu4oUlQxwPrDN5wlJTROylLffKhLFiErEmY9B2AIxfLeeJ8g38ybOZntyYvfoiw==
X-Received: from fawn.svl.corp.google.com ([2620:15c:2cd:202:7dae:6503:2272:5cd1])
 (user=morbo job=sendgmr) by 2002:a5b:34c:0:b0:61e:1cd0:c93f with SMTP id
 q12-20020a5b034c000000b0061e1cd0c93fmr2113282ybp.269.1647466285413; Wed, 16
 Mar 2022 14:31:25 -0700 (PDT)
Date: Wed, 16 Mar 2022 14:31:22 -0700
Message-Id: <20220316213122.2352992-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.723.g4982287a31-goog
Subject: [PATCH] nfsd: use correct format characters
From: Bill Wendling <morbo@google.com>
To: Chuck Lever <chuck.lever@oracle.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, linux-nfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: Bill Wendling <morbo@google.com>
Content-Type: text/plain; charset="UTF-8"

When compiling with -Wformat, clang emits the following warnings:

fs/nfsd/flexfilelayout.c:120:27: warning: format specifies type 'unsigned
char' but the argument has type 'int' [-Wformat]
                         "%s.%hhu.%hhu", addr, port >> 8, port & 0xff);
                             ~~~~              ^~~~~~~~~
                             %d
fs/nfsd/flexfilelayout.c:120:38: warning: format specifies type 'unsigned
char' but the argument has type 'int' [-Wformat]
                         "%s.%hhu.%hhu", addr, port >> 8, port & 0xff);
                                  ~~~~                    ^~~~~~~~~~~
                                  %d

The types of these arguments are unconditionally defined, so this patch
updates the format character to the correct ones for ints and unsigned
ints.

Link: ClangBuiltLinux/linux#378
Signed-off-by: Bill Wendling <morbo@google.com>
---
 fs/nfsd/flexfilelayout.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/nfsd/flexfilelayout.c b/fs/nfsd/flexfilelayout.c
index 2e2f1d5e9f62..070f90ed09b6 100644
--- a/fs/nfsd/flexfilelayout.c
+++ b/fs/nfsd/flexfilelayout.c
@@ -117,7 +117,7 @@ nfsd4_ff_proc_getdeviceinfo(struct super_block *sb, struct svc_rqst *rqstp,
 
 	da->netaddr.addr_len =
 		snprintf(da->netaddr.addr, FF_ADDR_LEN + 1,
-			 "%s.%hhu.%hhu", addr, port >> 8, port & 0xff);
+			 "%s.%d.%d", addr, port >> 8, port & 0xff);
 
 	da->tightly_coupled = false;
 
-- 
2.35.1.723.g4982287a31-goog

