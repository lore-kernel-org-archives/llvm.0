Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF875809
	for <llvm@lists.linux.dev>; Fri,  1 Jul 2022 23:21:51 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id h198-20020a25d0cf000000b0066e14d5ad1dso631401ybg.8
        for <llvm@lists.linux.dev>; Fri, 01 Jul 2022 16:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=r1hNWMzTHbP1T3u0oJfFG4ATF129b7TBwtFs10zIbH0=;
        b=AfniH5QTWUN+wqcSlLlKuJx5yJp8JJHk89CfEEMl5lQ1ICN/xG92kx5WNxs+hwMLDj
         y1MPwtf1lGA1NblcuJoqXrs4bHlUiq1iRR4w2azrECLCuIIInWJydMnwbeDO9A1gacJ3
         6MGIh5dly4GfP0UxK6LkaOJEKAyc0fb9wkYVNqLZI/LJvBlKOBg9aYrMP5pGDiKej7u1
         +TSLG69EXbh9UkRVy1yh07pPtZuKzomVtNA3mYLLapw8CWSLayla3G2XPDgskRdknVyf
         NEpGzNbVutswz0xnFL6MooUMFGxU0t5boARFQ0DJRPTPIgfUU9whtp2A/smT/aBmeW2C
         fGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=r1hNWMzTHbP1T3u0oJfFG4ATF129b7TBwtFs10zIbH0=;
        b=mAZUwAgLgu+raMyIHhM6+Ltbv9pEfxpUVWFc2un6JA2Py6CwXbvtSUregG5EWA/804
         T+xIoA56okG+KJ6Ha7XqqKEKI8EnMDbWQ/WluyX1VLeL2Ld3otsJfSHsKot9erpGnmD+
         xdqmkKDdzrBabC2/T9q2QFj9Mm5g3Mj7QNkrNncX/Qv4lC+axtfdd3bQko5W8P9Nbcme
         vlBFIJokspnFAMIgBU/kmgc2eegsjEdrBZuou+u+vr1jdT/K6u6dswirYalec3pMkuMi
         lJv12bedGnwNjcyaeUdp8Ef6+kgXKU5rCHFBma5SygUdX7wydzNf8SB6GWbtgYoV3VbT
         vkvQ==
X-Gm-Message-State: AJIora9K62bk7WjSwuPZFVO22+A1uqPi67PqVE1dfPeounWFbJtpyXVp
	60glX2Ma3UNTgqS7RTGnEQMJogQk2pNJPmOFgg==
X-Google-Smtp-Source: AGRyM1vS8lR6ohgVW9YKUmSTvCAVBF+D2wOLXwW/aqjioj8VQIMa9zehx7RkG7my6+BiriAauGh24+9hI4ngKzSURg==
X-Received: from justinstitt.mtv.corp.google.com ([2620:15c:211:202:a7a5:71:ddd5:892b])
 (user=justinstitt job=sendgmr) by 2002:a0d:f9c1:0:b0:31b:726f:9ef2 with SMTP
 id j184-20020a0df9c1000000b0031b726f9ef2mr20290827ywf.252.1656717710164; Fri,
 01 Jul 2022 16:21:50 -0700 (PDT)
Date: Fri,  1 Jul 2022 16:20:31 -0700
Message-Id: <20220701232031.2639134-1-justinstitt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH] eeprom: idt_89hpesx: fix clang -Wformat warnings
From: Justin Stitt <justinstitt@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"

see warnings:
| drivers/misc/eeprom/idt_89hpesx.c:570:5: error: format specifies type
| 'unsigned char' but the argument has type 'u16' (aka 'unsigned short')
| [-Werror,-Wformat] memaddr);
-
| drivers/misc/eeprom/idt_89hpesx.c:579:5: error: format specifies type
| 'unsigned char' but the argument has type 'u16' (aka 'unsigned short')
| [-Werror,-Wformat] memaddr);
-
| drivers/misc/eeprom/idt_89hpesx.c:814:4: error: format specifies type
| 'unsigned short' but the argument has type 'unsigned int'
| [-Werror,-Wformat] CSR_REAL_ADDR(csraddr));

There's an ongoing movement to eventually enable the -Wformat flag for
clang. See: https://github.com/ClangBuiltLinux/linux/issues/378

The format specifier for idt_89hpesx.c:570 and 579 was `0x%02hhx`. The
part we care about `%hhx` describes a single byte format, wherein the
leftmost byte of our u16 type (of which memaddr is) is truncated.

example:
```
uint16_t x = 0xbabe;
printf("%hhx\n", x);
// output is: be
// we lost 'ba'
```

There exists a similar issue at idt_89hpesx.c:814 which involves the
CSR_REAL_ADDR macro. This macro returns a u16 but due to default
argument promotion for variadic functions (printf-like) actually
provides an int to the dev_err method.

My proposed solution is to expand the width of the format specifier to
fully encompass the provided argument (which is promoted to an int, see
below). I opted for '%x' as this specifies an unsigned hexadecimal
integer which, with a guarantee, can represent all the values of a u16.

As per C11 6.3.1.1:
(https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1548.pdf)
`If an int can represent all values of the original type ..., the
value is converted to an int; otherwise, it is converted to an
unsigned int. These are called the integer promotions.`

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 drivers/misc/eeprom/idt_89hpesx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/eeprom/idt_89hpesx.c b/drivers/misc/eeprom/idt_89hpesx.c
index b0cff4b152da..42eac114edd7 100644
--- a/drivers/misc/eeprom/idt_89hpesx.c
+++ b/drivers/misc/eeprom/idt_89hpesx.c
@@ -566,7 +566,7 @@ static int idt_eeprom_read_byte(struct idt_89hpesx_dev *pdev, u16 memaddr,
 		eeseq.memaddr = cpu_to_le16(memaddr);
 		ret = pdev->smb_write(pdev, &smbseq);
 		if (ret != 0) {
-			dev_err(dev, "Failed to init eeprom addr 0x%02hhx",
+			dev_err(dev, "Failed to init eeprom addr 0x%02x",
 				memaddr);
 			break;
 		}
@@ -575,7 +575,7 @@ static int idt_eeprom_read_byte(struct idt_89hpesx_dev *pdev, u16 memaddr,
 		smbseq.bytecnt = EEPROM_RD_CNT;
 		ret = pdev->smb_read(pdev, &smbseq);
 		if (ret != 0) {
-			dev_err(dev, "Failed to read eeprom data 0x%02hhx",
+			dev_err(dev, "Failed to read eeprom data 0x%02x",
 				memaddr);
 			break;
 		}
@@ -810,7 +810,7 @@ static int idt_csr_read(struct idt_89hpesx_dev *pdev, u16 csraddr, u32 *data)
 	smbseq.bytecnt = CSR_RD_CNT;
 	ret = pdev->smb_read(pdev, &smbseq);
 	if (ret != 0) {
-		dev_err(dev, "Failed to read csr 0x%04hx",
+		dev_err(dev, "Failed to read csr 0x%04x",
 			CSR_REAL_ADDR(csraddr));
 		goto err_mutex_unlock;
 	}
-- 
2.37.0.rc0.161.g10f37bed90-goog

