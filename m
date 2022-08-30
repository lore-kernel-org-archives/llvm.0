Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47C6612E
	for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 23:32:22 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-33e1114437fso190879597b3.19
        for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 16:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date;
        bh=dj50MXIaDJBD96/1Gdf430/wXU4xb7a84h2xVZMa0Ew=;
        b=Qy/xMjE+Z9tI/RI2eW9aQXEE+x9bgipZmkl1TRFX4nG3lQ2Cxw/MGc9YBEMVb79P8x
         K7ZB6jWVCCidlAiCQ0KHSLobGlEUBTBOYT+IN2cosr4rJjNKEzJDFeo0nWGSZgVhOFnN
         LnJtK+KQLFx71PgotB16ka4GRRJjpTFnPNLg7HhkuXjEppj+KAqhY9tM//ZHz2AfaJ4E
         ojP4CyQHCBUPqv0EbNTJy1R5yPCLjtX4xD1E5S+rzObYF7P/nQl/buKNJiO0O+4YpcJO
         KWS4peUjbZVcIeXOVLV02EwcnTADwVU+JJD9CdooT51s51cyuvBlc8byyEyM9/c9zYEC
         TUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=dj50MXIaDJBD96/1Gdf430/wXU4xb7a84h2xVZMa0Ew=;
        b=KN9H0fmBfKfIQp+k8wJApqK0MBRqbB6VmCtyd9YNvwazzpGfSgU3zwnxEvoqEKjMTO
         p/epmUFb/8QdH0VZ1zRhr4fZ0ARp8AAReOoS/fD0W1iQKXmzKLV3vr9JzdA3bW5hfOR3
         7GNqMCeTw+qHq79MwtMucsDLd7KLMi4Qv3OZHsHjixQj4c/beEPdeLYcqji/LvxHfYCZ
         7Nvua3oRgHmYdrCQx2YPiSVUGT1jZfljrI49qUMaiDYAbdCWBi/5LhinE1qmtrFV+uDK
         zqq/THagPOCggYykptNmb4Zdc371di2HSNji9bT9uxcrCJD509c4MPpahysbqgJ0C1VF
         qL6A==
X-Gm-Message-State: ACgBeo0jyhOuJEY6LfeLreWK7ihIJBnk+GfY8RWPuP8kEpgHjKtYKsWP
	I89y0ygX76FMHn9C/fHfJnMG+WsFuO7Nk2At+fs=
X-Google-Smtp-Source: AA6agR5LroJ1DHbPpfH8aFh9/G1HMs3AO252ceiCeo1jPAZmf7JXzZYp5Fa4eHZtuGTExuaU7+SLdODaNccTaYcpsSo=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:54d9:7143:6a7d:91d])
 (user=samitolvanen job=sendgmr) by 2002:a05:6902:1206:b0:676:e465:24b1 with
 SMTP id s6-20020a056902120600b00676e46524b1mr13676826ybu.323.1661902342496;
 Tue, 30 Aug 2022 16:32:22 -0700 (PDT)
Date: Tue, 30 Aug 2022 16:31:26 -0700
In-Reply-To: <20220830233129.30610-1-samitolvanen@google.com>
Message-Id: <20220830233129.30610-19-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220830233129.30610-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=804; i=samitolvanen@google.com;
 h=from:subject; bh=PQGbduDYSHEunY6Nux9oR4b8gX3kqUUQ66z3bs0DO/k=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBjDp3OHJOh3MpkrcMboNL3mLB+U7xNHC0btjo7mME4
 CgYIObyJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYw6dzgAKCRBMtfaEi7xW7ibxC/
 9u8tiBUAu11iMi2jQxB88ZoyRd3XcPtlmEJ49ZT4ibCRTKCQwU7x7cDMnDG2jMK91BvisB+yihmg9w
 N/xNoX9Du1hqgmpQ189vSRzZ8B3cTextiO0ei30mC5sYpY4O7ZzhfZ2RUhJ9GhDyhAqAEf/dyh6i7R
 slJI0p2V7MK2rO8Z0jyvl0g73TadyQ3IuIyhqfnc0JWw795W5qT0rTDncrsYsDg9bHqVA69umBLW/E
 JBpKqxPr5+1G3RypfC6VZNWayPrVcMVECCxIeWoI8JfgWyBD5zQ2Zeyjo3El1kUNH/J3pinc2ucgj0
 nCmZucarH0zhjvQSUJC5X8OSCGQyDJClv+hqBEIWhQ0gvLN9UVnXd5Ql7r49YFrN1kk9AWrqjbQ3Sc
 AD5ZEd5SjOGYRv3rAgmv+XiFslu7d+xB6EyKfNX1+EmfFdYMhyVFQNijCiaFZSRvXJJ7dnhc8wF96j
 FE3UOfpxc1eA3nQd4sJS9gasOaTmoIocuonggQXaz5kqM=
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Subject: [PATCH v4 18/21] x86/tools/relocs: Ignore __kcfi_typeid_ relocations
From: Sami Tolvanen <samitolvanen@google.com>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Joao Moreira <joao@overdrivepizza.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

The compiler generates __kcfi_typeid_ symbols for annotating assembly
functions with type information. These are constants that can be
referenced in assembly code and are resolved by the linker. Ignore
them in relocs.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/tools/relocs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/tools/relocs.c b/arch/x86/tools/relocs.c
index e2c5b296120d..2925074b9a58 100644
--- a/arch/x86/tools/relocs.c
+++ b/arch/x86/tools/relocs.c
@@ -56,6 +56,7 @@ static const char * const sym_regex_kernel[S_NSYMTYPES] = {
 	"^(xen_irq_disable_direct_reloc$|"
 	"xen_save_fl_direct_reloc$|"
 	"VDSO|"
+	"__kcfi_typeid_|"
 	"__crc_)",
 
 /*
-- 
2.37.2.672.g94769d06f0-goog

