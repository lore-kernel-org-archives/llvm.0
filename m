Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA797B
	for <llvm@lists.linux.dev>; Sat, 12 Nov 2022 09:05:21 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id q1so6168241pgl.11
        for <llvm@lists.linux.dev>; Sat, 12 Nov 2022 01:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95GT+CzPNXJHEEeCgfKVSRCFhHGq9YtSWe72aa0XfkQ=;
        b=Zg44tReFu/Dkdm10k+vsqEyM3jv8PLAlzzlni9UD7FvfoMUyxKgEsl2ZLMuT9uXD++
         xmGOpy8ixIQCGQ9nFY62d5zHmIyBqt9V+TmzbI1/53Qbe2RbyVIhfakd/2Q3EUGr+mlT
         pBC2hho0J+K7Iw3HQVlLJi/tlzs9NL/yMUj0iZcPDVOkqmaadZPDX9w8/w0XzX17xsP4
         NrfrSfV9I4EDzbfdrWYedv85qBABJlu+rPutlUauQau3af/NCEjLukPl8HmRyyZXYxWo
         ufVNUX3bl424BRlzwMMMN6k770sGt1Xyvu4TFGeHk9M+dkLR7nZdYySbzZQ5uo2aO6MJ
         Yrrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=95GT+CzPNXJHEEeCgfKVSRCFhHGq9YtSWe72aa0XfkQ=;
        b=FBIRdbap+k6bBOFwL1iCxpWaW+DKkUX7pZISfB/8A4nPaJ7y/E0c0En7Juk1LpLp6j
         m87sJlziyT3BIq1Ew1zZtVYmlrs/J5oLBL4TB7482E+jnpaX17xI07Sxk1O7h55WYK35
         S6vYV+PzxSVStN95vuDDzwVpbdQ+ocDWBIlO9mF8/MWc2av0XRnj9tHdMWuuG+5iI7Uv
         Bu0MK8lK+pCUYaBOtrKIdJcb7OY7I5UJ0CKHb6v1uiQxP8C2eoMo+t/D79wcWRGrhNTj
         33iv9JC9NZwSHfp/Q0C3rCt70+bNSAHLBBZ40oQQ6IcQJ6s9ob4XNLLrgmBtRiol4PA+
         0+jg==
X-Gm-Message-State: ANoB5pl+Hj1H7jyowsqtL2z+sB2VV5gI+0PRLeQmYLtOxqXshYMlgLKs
	748NucdXyuqJWDj+3EhY020=
X-Google-Smtp-Source: AA0mqf72pC10icczFCZ6doTOF7zUy8z7B+V3YgCUju/LjZRoxaJHMltwLlS7H7wm8x8z65N0TTYqUg==
X-Received: by 2002:a63:5063:0:b0:45f:88b2:1762 with SMTP id q35-20020a635063000000b0045f88b21762mr4553333pgl.341.1668243920882;
        Sat, 12 Nov 2022 01:05:20 -0800 (PST)
Received: from fedora.. ([203.220.17.21])
        by smtp.gmail.com with ESMTPSA id oj17-20020a17090b4d9100b00212d9a06edcsm6072611pjb.42.2022.11.12.01.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 01:05:20 -0800 (PST)
From: Samuel Zeter <samuelzeter@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Cc: Samuel Zeter <samuelzeter@gmail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [RESEND PATCH v2 2/2] arch/x86/tools/objdump_reformat.awk: Allow for spaces
Date: Sat, 12 Nov 2022 19:04:17 +1000
Message-Id: <20221112090418.284656-3-samuelzeter@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221112090418.284656-1-samuelzeter@gmail.com>
References: <20221112090418.284656-1-samuelzeter@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

objdump and llvm-objdump have differing output formats. Specifically,
objump will format its output as: address:<tab>hex, whereas
llvm-objdump displays its output as address:<space>hex.

objdump_reformat.awk incorrectly handles this discrepancy due to
the unexpected space and as a result insn_decoder_test fails, as
its input is garbled.

The instruction line being tokenized now handles a space and colon,
or tab delimiter.

Acked-by: Masami Hiramatsu <mhiramat@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Samuel Zeter <samuelzeter@gmail.com>
---
 arch/x86/tools/objdump_reformat.awk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/tools/objdump_reformat.awk b/arch/x86/tools/objdump_reformat.awk
index 276e572a6f60..a4120d907277 100644
--- a/arch/x86/tools/objdump_reformat.awk
+++ b/arch/x86/tools/objdump_reformat.awk
@@ -22,7 +22,7 @@ BEGIN {
 }
 
 /^ *[0-9a-f]+:/ {
-	if (split($0, field, "\t") < 3) {
+	if (split($0, field, /: |\t/) < 3) {
 		# This is a continuation of the same insn.
 		prev_hex = prev_hex field[2]
 	} else {
-- 
2.38.1

