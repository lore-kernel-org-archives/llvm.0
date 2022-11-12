Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B877B
	for <llvm@lists.linux.dev>; Sat, 12 Nov 2022 09:05:15 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id 130so6809920pfu.8
        for <llvm@lists.linux.dev>; Sat, 12 Nov 2022 01:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n0R04nFNy0DCngCUBrZtirCliOmgkwyhcEcHNxIQXNQ=;
        b=LZYK/mAepGZs5cWhglbOU46eQZTa3XI43hwKiwjnyUO/LeNOCpb6RURS1fUVxCRHHs
         4+Hgx8crpZj56lCnfIaaTboqmyrutKSSDA+PRlNkR+DKDNI4i1QJrhxRhw0bwVG/eOq7
         cS/1UqkJQpSVVtkMbFTNhyrXodYKku2TwJ62E7043da40BSFBxYZhf2ZsdGd9enuC2at
         p5+GolSpr7nIhoxPJ9u9h+BitABwxyp9K6GttYpE646rl1J7loFW1kgwbMfjGz2B34HO
         FQ0jDXH1boiZJ0OoF5z9Tskz5wUCp8UPCEtjSYrBwOVNB4Bl8LH8nRSMX+N2kEUzRD8w
         9cYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n0R04nFNy0DCngCUBrZtirCliOmgkwyhcEcHNxIQXNQ=;
        b=Le3XdApIOpgLIQxxineLVz8jdHShKAQlPw4fH3YEnTYxmIvYwwT+JPLJUlbgbfMVW/
         aEgu08wv4iwCgZXf0w+WkcGG4BA6WnduBMw+iT2rSqwjAfHQRnl1TeSp3h8oja4dOIQO
         BI6GMbNde1KoWJeUEK3Z7xk072uITnNe5bddQQBlQ6KeIjXwRfVZhnbd2eBsX1QAUU04
         ySn1jh90OVFfCUP6EcPQPxn6UqkBle0+g0vPmcPwTpjs6+HaYww59ylDLHvvgRRL01+r
         ZVZsOUdWZOvb9FIoKWdfmJSFkARZylHR6AQfY4LA6kEtMPquWm6ns/u626FD/8L/le+c
         XeDA==
X-Gm-Message-State: ANoB5pk5zz/2QzQ27tCTrrMwXX50fvBq82FYytH6xwNX2+eEdfsdbJ+R
	j7B7nB2iqVutAIzRKgmroV0=
X-Google-Smtp-Source: AA0mqf5se48K0xgxyaRfaRO+h4u+KthWO1jIhyM1ZxSLXoPk5RrK9daVAsaH0CDs7lnjtmTe0EmrxQ==
X-Received: by 2002:a63:cf53:0:b0:470:15cd:d425 with SMTP id b19-20020a63cf53000000b0047015cdd425mr4795001pgj.27.1668243914670;
        Sat, 12 Nov 2022 01:05:14 -0800 (PST)
Received: from fedora.. ([203.220.17.21])
        by smtp.gmail.com with ESMTPSA id oj17-20020a17090b4d9100b00212d9a06edcsm6072611pjb.42.2022.11.12.01.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 01:05:14 -0800 (PST)
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
Subject: [RESEND PATCH v2 1/2] arch/x86/tools/objdump_reformat.awk: Ensure regex matches fwait
Date: Sat, 12 Nov 2022 19:04:16 +1000
Message-Id: <20221112090418.284656-2-samuelzeter@gmail.com>
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

Acked-by: Masami Hiramatsu <mhiramat@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
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
2.38.1

