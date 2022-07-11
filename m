Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0257153A4
	for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 23:02:02 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id z9-20020a170903018900b0016c39b2c1ffso3869137plg.12
        for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 16:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=6HZTXRLqo/8phSSGx4LtiryFoKC4QXTfVKLTgEMjAPM=;
        b=o3liI5oKlmf3CRZ3JudkUyA+S45s1xuUjQgg4qUAgzbUSSujxg49gSp0NnUZkgYNbR
         rHpUSfdNJjROD77RNYHlkBV5fo8d1/p8YdE1na4Ny48l+efsyWXQBNtnscRZExG1oYRb
         qEZ4Sf/+/R9glUdZqMpAImdqO9UMG2fyRv1SCg5Fk5v7dPr5D9GPf0ghw9lOpDQ0Ft48
         +fEFM56q6B9ddNI9k8LzGZGsf1q3f7tZHqkeGZZ1UICHTPTvG69YFHVOp8QKJz4PEn0W
         Ta/uaowo7hlglqqOdTBFbdM70PUUhgFgKc1Vy6+Ddgl24GW5avbvTKjdiPgPGHYxTM2W
         BkGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=6HZTXRLqo/8phSSGx4LtiryFoKC4QXTfVKLTgEMjAPM=;
        b=sCrhsERJnSicSBDr6JmVFSVEBlrsoqpEizqluFTwWD4CMnoE5JI22d87AdMdq3wDAe
         XxxYSgxAY91HJovWrIHOHXDY5suq24vFRGobJNsHjCnOu9N42ajN4hbUKIaBnseBjXMH
         FCHMeCmMplP5p1q2z1kSr1MjcGT11BnHcJxvRRXhO0j9s73f7gp+Pj5BitR6QPxn6MLO
         S/Z0AHpWJwAw/2SteFYqW7c/ZIsB05IIgl5iO5tV2ZHG0RAWXjMDGFnOxOAx/uWMA8Qw
         aRIT/kG7HTUHKFbC5TRTGFbBl4cHDilBthh3FmoufYq1Ot1CT9wP+rPwqP/+X69J9Vwn
         tzpQ==
X-Gm-Message-State: AJIora95+snnQNjfxJuwWsQh5kv1I1spJoLfGeVtDkQpE2HC/ZewKG83
	Y3t4yg61TX08+eauVBa5uUV1YQalfvXpidYxCA==
X-Google-Smtp-Source: AGRyM1s8GAUw6oJb4kdKctccEL9cc/33sTeAzDqLpBI9KS5As9yYb495GOej4rAX/0fCqnwT+cLLAWkWWXzBrvAh8w==
X-Received: from justinstitt.mtv.corp.google.com ([2620:15c:211:202:4bd0:f760:5332:9f1c])
 (user=justinstitt job=sendgmr) by 2002:a17:90a:249:b0:1e0:a8a3:3c6c with SMTP
 id t9-20020a17090a024900b001e0a8a33c6cmr31669pje.0.1657580522068; Mon, 11 Jul
 2022 16:02:02 -0700 (PDT)
Date: Mon, 11 Jul 2022 16:01:48 -0700
Message-Id: <20220711230148.2130871-1-justinstitt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.144.g8ac04bfd2-goog
Subject: [PATCH] ntb: idt: fix clang -Wformat warnings
From: Justin Stitt <justinstitt@google.com>
To: Serge Semin <fancer.lancer@gmail.com>
Cc: Jon Mason <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>, 
	Allen Hubbe <allenbh@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, ntb@lists.linux.dev, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"

When building with Clang we encounter these warnings:
| drivers/ntb/hw/idt/ntb_hw_idt.c:2409:28: error: format specifies type
| 'unsigned char' but the argument has type 'int' [-Werror,-Wformat]
| "\t%hhu-%hhu.\t", idx + cnt - 1);
-
| drivers/ntb/hw/idt/ntb_hw_idt.c:2438:29: error: format specifies type
| 'unsigned char' but the argument has type 'int' [-Werror,-Wformat]
| "\t%hhu-%hhu.\t", idx + cnt - 1);
-
| drivers/ntb/hw/idt/ntb_hw_idt.c:2484:15: error: format specifies type
| 'unsigned char' but the argument has type 'int' [-Werror,-Wformat], src);

For the first two warnings the format specifier used is `%hhu` which
describes a u8. Both `idx` and `cnt` are u8 as well. However, the
expression as a whole is promoted to an int as you cannot get
smaller-than-int from addition. Therefore, to fix the warning, use the
promoted-to-type's format specifier -- in this case `%d`.

example:
``
uint8_t a = 4, b = 7;
int size = sizeof(a + b - 1);
printf("%d\n", size);
// output: 4
```

For the last warning, src is of type `int` while the format specifier
describes a u8. The fix here is just to use the proper specifier `%d`.

See more:
(https://wiki.sei.cmu.edu/confluence/display/c/INT02-C.+Understand+integer+conversion+rules)
"Integer types smaller than int are promoted when an operation is
performed on them. If all values of the original type can be represented
as an int, the value of the smaller type is converted to an int;
otherwise, it is converted to an unsigned int."

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: This patch silences the -Wformat warnings for this file (which is
the goal) but in reality all instances of `%hh[dux]` should be converted
to `%[dux]` for this file and probably every file. That's a bit larger
scope than the goal of enabling -Wformat for Clang builds, though.

 drivers/ntb/hw/idt/ntb_hw_idt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/ntb/hw/idt/ntb_hw_idt.c b/drivers/ntb/hw/idt/ntb_hw_idt.c
index 733557231ed0..0ed6f809ff2e 100644
--- a/drivers/ntb/hw/idt/ntb_hw_idt.c
+++ b/drivers/ntb/hw/idt/ntb_hw_idt.c
@@ -2406,7 +2406,7 @@ static ssize_t idt_dbgfs_info_read(struct file *filp, char __user *ubuf,
 				"\t%hhu.\t", idx);
 		else
 			off += scnprintf(strbuf + off, size - off,
-				"\t%hhu-%hhu.\t", idx, idx + cnt - 1);
+				"\t%hhu-%d.\t", idx, idx + cnt - 1);
 
 		off += scnprintf(strbuf + off, size - off, "%s BAR%hhu, ",
 			idt_get_mw_name(data), ndev->mws[idx].bar);
@@ -2435,7 +2435,7 @@ static ssize_t idt_dbgfs_info_read(struct file *filp, char __user *ubuf,
 					"\t%hhu.\t", idx);
 			else
 				off += scnprintf(strbuf + off, size - off,
-					"\t%hhu-%hhu.\t", idx, idx + cnt - 1);
+					"\t%hhu-%d.\t", idx, idx + cnt - 1);
 
 			off += scnprintf(strbuf + off, size - off,
 				"%s BAR%hhu, ", idt_get_mw_name(data),
@@ -2480,7 +2480,7 @@ static ssize_t idt_dbgfs_info_read(struct file *filp, char __user *ubuf,
 		int src;
 		data = idt_ntb_msg_read(&ndev->ntb, &src, idx);
 		off += scnprintf(strbuf + off, size - off,
-			"\t%hhu. 0x%08x from peer %hhu (Port %hhu)\n",
+			"\t%hhu. 0x%08x from peer %d (Port %hhu)\n",
 			idx, data, src, ndev->peers[src].port);
 	}
 	off += scnprintf(strbuf + off, size - off, "\n");
-- 
2.37.0.144.g8ac04bfd2-goog

