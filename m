Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201007C
	for <llvm@lists.linux.dev>; Fri,  4 Mar 2022 03:25:13 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id u2so6123737ioc.11
        for <llvm@lists.linux.dev>; Thu, 03 Mar 2022 19:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Xdoric3RTXYKwt8RzxRE1iq6shIZZ4Zbnw0lFh9QTVo=;
        b=jeaZuKcsBmQce6PQhFrYx4iFqsn3He+X6muOBJ200kVs09Zu3QRdyk624e3vxeZghv
         u7vWIXZMzrebbTRdroLdnGa1hv9tt+n6IIyb6Rif4Ry8k7MWhPsRumdFWgxEVE/uPI5D
         TQwWRHLfih2vxL3zgCRca5/f7tYptB2hwsBE1tnbdpbdNAEbzzK6tzCZLTt05RwoUttZ
         hZORyRZCSrHXm/cuMN9JJhjPjXgK8U1e/PIdLnFEXAWU/giF4Bm4a8WbeDoHKZf6xhsy
         vk/JPVaLxDmcJMr9nbKr44RJkw9hl/fH+W53dpsXtqaH52UkbzxCZg232iWUXS8wYqu/
         BF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xdoric3RTXYKwt8RzxRE1iq6shIZZ4Zbnw0lFh9QTVo=;
        b=PoBsW0FaMxsKeNq4ouwKL28a8JfFy/NDO5sEL6RLjpoup4Z3i8TCINuhDtrYObja7A
         VILfbhjVHboVCbt9MU/MDqaj/sOHyS3Z8AqdK0kszisYRk1nKLPcKj7ze1lpaALiCXyI
         BHVaVKcysPY1mDVVECNsqasZ0lPtt4r4hGsLIU0JGw9TFc0gkUXe9F1/HelX/CJSllQ/
         eseZc/iKSqH2dgnLQS+O7dGn81eH33ZuqLZQ5m/+4ILD1/Xwsn56kqPw/VuG1OIXOnSe
         M0PShnj8laG4jG/KAHZ+MhOE17zyVf2wVfqajnNkpOMp8VdfhW9Y/iy3ywjlrh1Cd3Dp
         B1Og==
X-Gm-Message-State: AOAM533xUBLloj+JZRIIaj9TAMm4Pevmwh7+K+l0nO0rie+ZHOo/Jo/M
	xduNcP1UQH5C5Si9JERVSP4=
X-Google-Smtp-Source: ABdhPJwczl11AmL9YsZuJB7WvjCsPze/5RxIoLnjktu+CCtjBpHKnTXGmtaIq3m4efV1wMbl4R5ZMg==
X-Received: by 2002:a05:6638:1514:b0:317:738a:8418 with SMTP id b20-20020a056638151400b00317738a8418mr4836433jat.71.1646364312169;
        Thu, 03 Mar 2022 19:25:12 -0800 (PST)
Received: from localhost.localdomain (118-208-215-36.tpgi.com.au. [118.208.215.36])
        by smtp.gmail.com with ESMTPSA id a13-20020a056e02180d00b002c25b51d5ecsm4114751ilv.55.2022.03.03.19.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 19:25:11 -0800 (PST)
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
Subject: [PATCH v2 1/2] arch/x86/tools/objdump_reformat.awk: Ensure regex matches fwait
Date: Fri,  4 Mar 2022 14:16:10 +1100
Message-Id: <20220304031611.5763-2-samuelzeter@gmail.com>
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

If there is "wait" mnemonic in the line being parsed, it is incorrectly
handled by the script, and an extra line of "fwait" in
objdump_reformat's output is inserted. As insn_decoder_test relies
upon the formatted output, the test fails.

This is reproducible when disassembling with llvm-objdump:

Pre-processed lines:
ffffffff81033e72: 9b                    wait
ffffffff81033e73: 48 c7 c7 89 50 42 82  movq

After objdump_reformat.awk:
ffffffff81033e72:       9b      fwait
ffffffff81033e72:                               wait
ffffffff81033e73:       48 c7 c7 89 50 42 82    movq

The regex match now accepts spaces or tabs, along with the "fwait"
instruction.

Signed-off-by: Samuel Zeter <samuelzeter@gmail.com>
---
 arch/x86/tools/objdump_reformat.awk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/tools/objdump_reformat.awk b/arch/x86/tools/objdump_reformat.awk
index f418c91b7..276e572a6 100644
--- a/arch/x86/tools/objdump_reformat.awk
+++ b/arch/x86/tools/objdump_reformat.awk
@@ -12,7 +12,7 @@ BEGIN {
 	prev_hex = ""
 	prev_mnemonic = ""
 	bad_expr = "(\\(bad\\)|^rex|^.byte|^rep(z|nz)$|^lock$|^es$|^cs$|^ss$|^ds$|^fs$|^gs$|^data(16|32)$|^addr(16|32|64))"
-	fwait_expr = "^9b "
+	fwait_expr = "^9b[ \t]*fwait"
 	fwait_str="9b\tfwait"
 }
 
-- 
2.35.1

