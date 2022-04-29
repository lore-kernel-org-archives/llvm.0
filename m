Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070311869
	for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 20:36:50 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-2f8bbaa6b16so23490357b3.14
        for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 13:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=iDcj9a5wJ6KF8f+uE+XRRsjEqScwcRIl55nWoICQltk=;
        b=VW+j5ZfVSptad3iPsruCkmIS1Tj3Z+za8DnZQ9e2AKAAU1hwwE3U6zANtt1LiP1k70
         PzjE1z73jFzrB112joxauNMQ7A45H0tJGDuSlPSbAkkgl0e3ZEPQRiNEWDP5Rl25Bosg
         1Jbc55usRzrGRJ7TH0UHTB1o1NoYAtnTmNJbDf2m0fTX0WGg1OWpottuVKIyom9vgc2G
         g02UrUWiCKRLI2CBIhG7xcec/Rqdm4RcaOPKyUBUFZ58TP/nP+2EaksYUAjCuWA25uKS
         PSlCtU+tZy+9cCncww3S1LgNuV6zJgQ9j1nbp0AQ0N6x7+2QXFSR9dTOjLrDfk8eMVkq
         RopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=iDcj9a5wJ6KF8f+uE+XRRsjEqScwcRIl55nWoICQltk=;
        b=sts+4rW9ETneoKuaXxpRiSevvKhsZ0WOEfk+n/s+hgtJebN9Cxqoc+ewHNKqkYGqYl
         KHrEqi29RVo2BoSm0kyOYBpnPgzux47zf/DDzyh2k3RHClKCmDOQE+YNeOTfrE7tr1GF
         GweepFDk/k8spafxOA2b7PP/KErJAqcrZb3hfIOWL/xr3GhiOPPRQANVgroTMw5clq1c
         ItSAfWWQVBegzT6/oyMX3JBQitqUGu4DYmeebBVdw9Fh/pq7vurxaJj5n3x+zXPL8aaW
         CazQVhXVMG5kTgURx2eLYxvqm/AxO8WKoiw2vz/kMRVN09PyKTSc9gMecCZzMmar92IN
         E2pw==
X-Gm-Message-State: AOAM533tbiGzfV5SehzgZyYOmnby6m0XM9IFNQ9HZ7sYZ95ubfxDkvAO
	v7HSX/DRJpzsa+DqVFPBKRyGtYZs4UJFOa6639s=
X-Google-Smtp-Source: ABdhPJzA35JbNRKDKaxDQaRXbam70YWDIDvwSLWyFMqWNAxB9wR20Jtx/sX3avgqy+VoqLJBj9AK8KPqLrHXIWBAEoM=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:351:bea9:f158:1021])
 (user=samitolvanen job=sendgmr) by 2002:a25:8391:0:b0:648:b50e:3702 with SMTP
 id t17-20020a258391000000b00648b50e3702mr1249824ybk.551.1651264609911; Fri,
 29 Apr 2022 13:36:49 -0700 (PDT)
Date: Fri, 29 Apr 2022 13:36:24 -0700
In-Reply-To: <20220429203644.2868448-1-samitolvanen@google.com>
Message-Id: <20220429203644.2868448-2-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220429203644.2868448-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=880; h=from:subject;
 bh=bTBRIvqJN0r4QxW0Fiqjtc1SR+oznSS8ydEfQr7tcSo=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBibExVtkZEXF4lWFd0quNeiDzZL9e1AigoAzh9F8Ek
 vYmOPRaJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYmxMVQAKCRBMtfaEi7xW7t1EC/
 47sHOPPMx1FdEmLi3pxA8b6kFaGgSF4qhS4uCyWFckVJ1yyehiGk20aNGPxlvFyGac+BdaOuQipIxN
 Ou37XvXH8DIf8oJjUTCr3v2DLhnVRSN/mHuBi+0o2xQq7uCIiEZwujO3w2ajffL/L2OmGR5bDM7bFi
 31QqrHChTCaYmswmWq4i7BibuTh0EsIkGnG+BrI/myJEKtebWiQxmcSLIYIXs/e+GF9i0JnhVAvOkb
 W2ercajsgf4zDhfp2PAml/n3V7kt3BjFjuqMp/JmrWBc3QUcYAZ7zDZ8QWB2G8lFAFr3JkRdDJSWF6
 8nv0nx0ZHKmGMIz6sZfts+c7m+x26Y2JJqqPSv0Jtr6TyxPYTiudk/LobE+R7VCoRJSRE0QMhBBIu1
 PqRy883di9Kp8Gj8kY8K3M7eGw9RUG9pDPQIN1eBqV3wbn6G3Baw7odJCOA0x3TWGsuJHKPCHNlKdf
 FfFz1EMuWGs4NAUh0tqYXIeUXTD6w3yAqsj1M54wU9ryQ=
X-Mailer: git-send-email 2.36.0.464.gb9c8b46e94-goog
Subject: [RFC PATCH 01/21] efi/libstub: Filter out CC_FLAGS_CFI
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

Explicitly filter out CC_FLAGS_CFI in preparation for the flags being
removed from CC_FLAGS_LTO.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 drivers/firmware/efi/libstub/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index d0537573501e..234fb2910622 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -39,6 +39,8 @@ KBUILD_CFLAGS			:= $(cflags-y) -Os -DDISABLE_BRANCH_PROFILING \
 
 # remove SCS flags from all objects in this directory
 KBUILD_CFLAGS := $(filter-out $(CC_FLAGS_SCS), $(KBUILD_CFLAGS))
+# disable CFI
+KBUILD_CFLAGS := $(filter-out $(CC_FLAGS_CFI), $(KBUILD_CFLAGS))
 # disable LTO
 KBUILD_CFLAGS := $(filter-out $(CC_FLAGS_LTO), $(KBUILD_CFLAGS))
 
-- 
2.36.0.464.gb9c8b46e94-goog

