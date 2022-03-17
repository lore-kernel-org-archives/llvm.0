Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2123B2F30
	for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 18:43:01 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id j5-20020a056902020500b00628ab64be30so5064360ybs.16
        for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 11:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=59Falx1QipnOpVp+g67QBMvE6iYq8zxhlBnPf1xrsxQ=;
        b=N9TuMKj7xgqUZ3w1thOjgIC6B1a9mU9wqKlyUDCUE6axRDNhTLl3QHlAQHvfY6P1B4
         +f2G848IBwedRiX7eYfwzVdKPUKb7+MIlD/ml8SvIC3lcSQLVyBGP60QzosdJlsTdrFz
         7NvWsyCj1jzHGPi16UJTf2W1HbNWraHB62Td18Jnxaqbsu892Lj4KjLrT33LqEG7BdMl
         k6QdsrJjV9jmUssm4k7pPiRH3+TyKSb3BSjzL1L97RdkhYjToWVIHhWiQIPyf2ALSB2X
         kHedd8YuXuVhC0jI9Ry2r2AkujCUR/sVFg9YfMNRsZodlZaxs2qa5x/gqhSyM5tL+orq
         AAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=59Falx1QipnOpVp+g67QBMvE6iYq8zxhlBnPf1xrsxQ=;
        b=EndJa3+epCgaslZyZnNBkY9LFnsea0HLKuqUP1E7sSZ6mf5uULoMXCJjeut+VpaRJq
         YQkds5mMNVUkjuqBGwZBVUQFYpj51rCSZ2IPTIBtI+D9PAKcmD931sNnKamthgJ52Hrz
         pLFt7nyeCd4Elin5TVz6tSUY10K2HKgSfVWJG+IvXBB73PAmbD9QKpTqA7s2mMaRq1BH
         4ZR+te/rqgo790SW1AnKlJ6OtQG/CfAYGf7ZClrDHhq2aYcK1LyRGh89VCo07ySPGevn
         l1suendpkO56EFCBtD8T7rjNoIa0KcVgpg/A5xKPEz9/lvFzV49JW8FXHNQznKDV0NYE
         Oskg==
X-Gm-Message-State: AOAM5319VpU5M4wk/qCqlW9vySh5DsMFocIx1vAYrn9WDC/0zfek0aM/
	uwTr+3byZoPfo3kmXQ6zmRYwkn0X
X-Google-Smtp-Source: ABdhPJwMI+lrhJ9gVYsW67xnAL2ERDzGLQuxxvJw3le7MyfdvotLE0WONGhwnwOAR8S6H/0BgopV4mC2Vw==
X-Received: from fawn.svl.corp.google.com ([2620:15c:2cd:202:7dae:6503:2272:5cd1])
 (user=morbo job=sendgmr) by 2002:a5b:b92:0:b0:633:406:db3c with SMTP id
 l18-20020a5b0b92000000b006330406db3cmr6622995ybq.547.1647542580016; Thu, 17
 Mar 2022 11:43:00 -0700 (PDT)
Date: Thu, 17 Mar 2022 11:42:22 -0700
In-Reply-To: <20220316213122.2352992-1-morbo@google.com>
Message-Id: <20220317184222.2476811-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220316213122.2352992-1-morbo@google.com>
X-Mailer: git-send-email 2.35.1.894.gb6a874cedc-goog
Subject: [PATCH v2] nfsd: use correct format characters
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

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Bill Wendling <morbo@google.com>
---
v2 - Fixed "Link" to be a valid URL.
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

