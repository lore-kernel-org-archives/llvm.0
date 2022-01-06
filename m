Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8E12C80
	for <llvm@lists.linux.dev>; Thu,  6 Jan 2022 02:37:33 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id p14so1512937plf.3
        for <llvm@lists.linux.dev>; Wed, 05 Jan 2022 18:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6F+wgRNGA6fmbi/NQHkyKHDOaLPRpTVQjDWUyB2GPWs=;
        b=GvA3rXcKfSWrlZAUME9wINoWn7f8pSfd/2Ds8BW2zGgDk1lp8ibquF/buACF79wpwf
         sLkViwkR5MJpIdl40Vo2HcbhCdr6OjT+caVm91LhfA4phGuTC+e4WZxMJmAxmK/Nteuj
         kuj9PVQEtOT4wkME91KVVUK0ar10CNb46Djdt3hH6hoGcjTXvXGWRnE5B8Go2zPfXz2M
         1GAiZ6PQL0F6xf+BsE7Rwa5eeIj/MD7+sG5bcNqWKBxuIy5oKkck5w263IGLxfzO0S2W
         RIBuow/+T58Ik9rybBUvwYRutvEgfxhMg1h5vs8IJ/HrTCagirO7tERNYX2uvBW/yMHX
         35Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6F+wgRNGA6fmbi/NQHkyKHDOaLPRpTVQjDWUyB2GPWs=;
        b=EfbIiO53RCMhHnawcvuwqmT2HhA2CCS781qPpuRFvWy8QFJBzi/dmpiD7FhZJ/Zw9o
         ZoJ7JbpTUjZNLq/fcb8oCjRZDVY1asc2Rk3QIrO1snj7O9vSGS2NtptM9olgqFO+amr/
         fpi2zsN8j3ktbMTxnXSsU3ttLU1aulGZEG/1nQ9w1SqljZjiSLetssFsDxjn6vwhV67k
         ZBVv04PUdRZ3Q/NZ0L+G2d+EzyKID9kALZPE3t6AXB2S7Zb5EcpMw+zBWtsClw2AJ0x1
         JyFC++azJqHpW6Q+OBk5HO0pe+ykfHP5F/eImcId/kIwynIBe6ydgN5+e+4rSSS86qza
         hyMg==
X-Gm-Message-State: AOAM5326VERxPGIadbHPl5SIxVifJy8mszvsye0GpmBnf6x44Olxc5Nt
	MWq8HC9mnXLIjZuayso7Wyo=
X-Google-Smtp-Source: ABdhPJzxZu1N5RV7hhwDk6hn3lgcW3Vx1ADnJ/qD/dkyPtxwow6lgw84fht+Zu496a7mZFLa+PaeZQ==
X-Received: by 2002:a17:90b:4b0c:: with SMTP id lx12mr7654723pjb.146.1641436652809;
        Wed, 05 Jan 2022 18:37:32 -0800 (PST)
Received: from szeter.. ([2001:8004:44e0:acae:b2b7:5ce1:129d:48de])
        by smtp.gmail.com with ESMTPSA id ot7sm4575514pjb.12.2022.01.05.18.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 18:37:32 -0800 (PST)
From: Samuel Zeter <samuelzeter@gmail.com>
To: 
Cc: samuelzeter@gmail.com,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 1/2] arch/x86/tools/objdump_reformat.awk: Ensure regex matches fwait
Date: Thu,  6 Jan 2022 13:36:04 +1100
Message-Id: <20220106023606.283953-2-samuelzeter@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220106023606.283953-1-samuelzeter@gmail.com>
References: <20220106023606.283953-1-samuelzeter@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

This patch fixes the issue by requiring spaces, or tabs, along with the
"fwait" instruction in the regex match.

Signed-off-by: Samuel Zeter <samuelzeter@gmail.com>
---
 arch/x86/tools/objdump_reformat.awk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/tools/objdump_reformat.awk b/arch/x86/tools/objdump_reformat.awk
index f418c91b71f0..276e572a6f60 100644
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
2.32.0

