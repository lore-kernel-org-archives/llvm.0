Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFF97C
	for <llvm@lists.linux.dev>; Fri,  4 Mar 2022 03:25:22 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id w7so8196210ioj.5
        for <llvm@lists.linux.dev>; Thu, 03 Mar 2022 19:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=riAePIdOHWyX+kWI5kEIlQkDYdGowAInsgUw4gn0/e4=;
        b=BlrpAc0LSalr08lxLvWHUF9xqsdrYeT/1mov5HdmySdHvY7zpjGGpvRBzSVE7uyStd
         RFfWon9VgWK3xggfoUkXejf4U8sLAeW88vzXIDjUl4CZZ63tpT4qE6fUpp5hRy5ZbDrt
         nV+6kcnrv5q7GtjDy8B4cuC/te60S6o70rBXya6sDNs0UKra6WerMmeR5cPU5qB4Yn7K
         Zr+hE8G4Zd67A2sks8WC/4yo6JcqOJvYva1NS8pJKDTSj4Ln2MgUpNcvSXvHCgd6yfHw
         dBnvBaKOXYA3nV5h24Uy8mbxbdXBqVBFiOe45hX4Q/scfBbfLF16+Gi4pk+w2DDsMGpJ
         T5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=riAePIdOHWyX+kWI5kEIlQkDYdGowAInsgUw4gn0/e4=;
        b=pKKM90TQQ8ZaajFl2bm86S6MbYYLc5wHFlsa0BNp2IRN2SEpnt6RRKxoa70yxYnGFN
         ar7QAHNFv+/jfYk4wH6+FtK9KAH8fbYY3lRGlfrjA5eMQGEb1yUXtYLbaIePa50T0KUu
         dJsQyU/2/D24mke1qq4KjvdTj+0essM7cCTT0dJtP1KPUfBjaubksv0ADZ5T+pJL8okv
         6yufSruv8rmBtHBfDE9yyxLBd/rbVN5g9FsGYD/CiAWlhO43SSQRYTGoXVMf/pzNs8+N
         00Ued5GcZZjp4sW0w3Tl6RvcXJW+xesMUajviDcvC9l1SKWM4AOesg8SRl8ZAxd77lIC
         TN5A==
X-Gm-Message-State: AOAM531/YOmCs16PIctdzShiLO4l9Z/RF3MnCCEDFrQnjDOQdRskCLPW
	ZzXgmF4BzCcxly5RtoTYjaA=
X-Google-Smtp-Source: ABdhPJz78E3vx6SBHXiEi1GHfCNZ5vzWX8+ufbWBvKEaxufsqAfodAKhOc+yxeeg/AGwmU7KQpmD/Q==
X-Received: by 2002:a02:ccea:0:b0:314:8504:cdd8 with SMTP id l10-20020a02ccea000000b003148504cdd8mr32604002jaq.117.1646364321340;
        Thu, 03 Mar 2022 19:25:21 -0800 (PST)
Received: from localhost.localdomain (118-208-215-36.tpgi.com.au. [118.208.215.36])
        by smtp.gmail.com with ESMTPSA id a13-20020a056e02180d00b002c25b51d5ecsm4114751ilv.55.2022.03.03.19.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 19:25:21 -0800 (PST)
From: Sam Zeter <samuelzeter@gmail.com>
To: mhiramat@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Samuel Zeter <samuelzeter@gmail.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 2/2] arch/x86/tools/objdump_reformat.awk: Allow for spaces
Date: Fri,  4 Mar 2022 14:16:11 +1100
Message-Id: <20220304031611.5763-3-samuelzeter@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220304031611.5763-1-samuelzeter@gmail.com>
References: <YdeGWyzvsXxntcAT@archlinux-ax161>
 <20220304031611.5763-1-samuelzeter@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Samuel Zeter <samuelzeter@gmail.com>

objdump and llvm-objdump have differing output formats. Specifically,
objump will format its output as: address:<tab>hex, whereas
llvm-objdump displays its output as address:<space>hex.

objdump_reformat.awk incorrectly handles this discrepancy due to
the unexpected space and as a result insn_decoder_test fails, as
its input is garbled.

The instruction line being tokenized now handles a space and colon,
or tab delimiter.

Signed-off-by: Samuel Zeter <samuelzeter@gmail.com>
---
 arch/x86/tools/objdump_reformat.awk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/tools/objdump_reformat.awk b/arch/x86/tools/objdump_reformat.awk
index 276e572a6..a4120d907 100644
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
2.35.1

