Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163EB7C
	for <llvm@lists.linux.dev>; Fri, 10 Jun 2022 23:35:58 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id j2-20020a2597c2000000b0064b3e54191aso528006ybo.20
        for <llvm@lists.linux.dev>; Fri, 10 Jun 2022 16:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Abw/XDnhYlMJRytVgbcavHSrRaNhWfsqM6nsq3SHmFg=;
        b=Mnnye5t4POMrfEpeBRChdzdv18aFspHy5HlM6NfSpwhux+r6eCkKz/CmmHrxQQeCWV
         RgJGiEkRoD1OaYq8rMIqfp1N2ypTETVzlRqxrHwZa0Z9ta9eBQC1rIXTeWIISvIcBpub
         M3lnsw2v+10gfThy3UMUH4dl4b3hrX3oPWHMZ9NW+ZwP1Imhog1YfSDsPVTtecIvLPkW
         4R0WANwpcc7Nd+JRbXUFzaofbyufCWMO0bfhIjqEeRsg8sp6P0jepNMhqNXj3RY1F6x0
         ZZwg8qoQHMF0Ola1aKnYqVXItmuXveuiv/3LLndaCwrfctJXvhm1P3poKmCAN540UvKQ
         nmiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Abw/XDnhYlMJRytVgbcavHSrRaNhWfsqM6nsq3SHmFg=;
        b=6xkizU4/b4YWbGzcE99jItRFEXMWU7I4rbrnJo9z6AIm6gf58kMwfxqP1dF1MDccTs
         IJlxZp8/LqU6mryLphklTNdkHtlSVvXp4qhvMYKX6BSzQakJK8/iokWiPCb0Ar1qXA+H
         KwKYlUlfMqJ9IqcbHtNLJGRbxrEF6NjFMsTMlhd9gHt7NO8nvE0TWhCKhnFNBvFDqQL0
         slaPKuxN+B/NEdWyyivHQwJxSRZOAw+JOwU5YWRtKSKcyf37GmJUKVjvMmPcDn6id+hR
         efJSUTjoFbLnF+hWxhtD8RSQ6i9ylRroyvvK4Jvn36mh+o9g+W98uosAUHqbOfM+yT1C
         TdSA==
X-Gm-Message-State: AOAM5308wAUVsHST8F4JJfr0Gu6uohw5AxbuCiFkYqTyGW06NcY5730X
	tkwUfePNRcgQ6uMVvBDK0708wXexN00mQ/GMPfA=
X-Google-Smtp-Source: ABdhPJzJ87O/ZB10aiSAIIKJiMs0MPiyPEQarDqtT48IEOt/gPSVrIVwSFGcxEs9HTqQeRN0QnK9rA77lXNWGat4Mv0=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f464:6db6:3d47:ed14])
 (user=samitolvanen job=sendgmr) by 2002:a25:8c87:0:b0:64f:cb1c:e7a9 with SMTP
 id m7-20020a258c87000000b0064fcb1ce7a9mr48335685ybl.519.1654904157125; Fri,
 10 Jun 2022 16:35:57 -0700 (PDT)
Date: Fri, 10 Jun 2022 16:35:10 -0700
In-Reply-To: <20220610233513.1798771-1-samitolvanen@google.com>
Message-Id: <20220610233513.1798771-18-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220610233513.1798771-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=804; h=from:subject;
 bh=G+/tIVkjbHjJrRoQokWdmBYkussKEDPQYIpl3t53Wn4=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBio9UvtHsK8AYBPSr7kbT2Y9kpNJwMx+Z9LWGdloaR
 HXF8kpWJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYqPVLwAKCRBMtfaEi7xW7t6PC/
 9zhJyKm3u3v9fGIjM6e9ahbA219jnvLDpBo2cs+R9u/TWb47Tub2gBZHDBGPScub4OKy8PJ+YNAQMA
 M+/V2RJ4gjmG4gZFohXpDaBWp3M7nMxoz1nc3xIVusNtGSxPd2GJza4O8Xc6O7eaQT4XqJdk1rlR2/
 g3fGK1oNaXUorSwjz8l05prq7Y/bQoLkUX8Q7q0oVyxSaFtSUjgfpficBEFT2hQjW+01ShJtRwk0Qi
 5heRxHXU3QRAskcjJy6Ye/Cb43uBxK1ZSx54LcCGwVIQUv8kkc0t1yCXooZjGOG3laP8xaHAXm3wLg
 p1mvtsekpf/xym2aEY+dhkXQd1on8J8rop1grTyFq0vvHngkgtLySNXW5AsNDUoF7niwATqwUdXnjs
 kqFsIcZ3/B6iaN+njChbFmCxjgXc8JR4fyEVWBOA1pGi9sQpF1ds54CRDdyhEEMWBN0ui6QjUxFuSD
 uSuguO5x80Ez6ipWJBhFeFikp4wjbuDGIPmOub86kyDug=
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [RFC PATCH v3 17/20] x86/tools/relocs: Ignore __kcfi_typeid_ relocations
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
2.36.1.476.g0c4daa206d-goog

