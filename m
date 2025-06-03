Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE1D79EA
	for <llvm@lists.linux.dev>; Tue,  3 Jun 2025 03:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748922532; cv=none; b=IYVw/ghNfKcvbXb0Ay18z55ioo16+jzi3Z3sMCxHF78+aH+5hpfZJd8FoPqqMHBNV3HsO4ze8Npku8MFBXlpNVrzxH65/XYhO7693qAAP/RCMN2Y5LbubGaeDqN70r0x2uj88VvF+nzlYZjZAM8FjvcYp1xjCmwxjvflEEgcQUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748922532; c=relaxed/simple;
	bh=bWBEuRcbXq8aJsRkCOuRq3h3zFdmbbpqBSOVwmVgcyc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pKZaQVo4o/N+o9l0XPMZsMXSjpYR5eacnZ98lLt0w9IeqXFJkxFfrLbRCjVWGMiP6x503nE76NO06dEH0nIhUVDDC5KekGghKy0slzIx+GpErdgruUvqw1W/wMKERkd3V9je7oAAr8S8DsaVcx4gAeswc+baUO7fU8I0WQKG9yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maskray.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maskray.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6062e41916dso2378385eaf.1
        for <llvm@lists.linux.dev>; Mon, 02 Jun 2025 20:48:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748922530; x=1749527330;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZdL6Pc63Mfaws2Erg/4lSldp2avlQyahxxSrxGNP9Ww=;
        b=tiu4LP1wulFdxjnAFydLEjfqZZHiNyrMAAquWlj51uN5qlu3GacE8KJqJcb7yVpsof
         kcgXxMkOzjDvvi6hr/53U4mZoXAFECWJRCmnXHdQNbZ0YWBm49J6Ho0VLwEiGZDpyuhn
         hPEjrV6bRBZnSBzc9JOXKMW2xAjAKPd5pM1ScNaTOPkO8OKbRSIEI/wVgmQImAxpaoWU
         nrNWQZapeoI7jvG0j4VoW5V/IaK7m58GA571qqnmY2gd8WbXojaY12QviyodKVl+GGu2
         rKtcQwnW7bRn0TzkPczP3KR8f+ww8SDc4QFXjjbiiMuK6m1GCMlF7P6RHwsIFXsKhSPL
         Lsow==
X-Forwarded-Encrypted: i=1; AJvYcCV0U2Iu3M1SAa3fqVYBtTPGi2BSdkWdSI9wJCj3HAn2pnDhMZCmQhVD3y5VfqiZewa61VtR@lists.linux.dev
X-Gm-Message-State: AOJu0YyR3U6W3eaCBl8mgUWPUAwv6S6t9XcZxt0UR59ngJRMtSOpAREn
	gAGOF9Y99uJMjmhCspQVBtiYkR3w1p0HqATJshDOiAffNiQphJDObaLb
X-Gm-Gg: ASbGnctukyJ8XdVZqvjOj5OrgKKfiiugE0+Sl30z3DycyLDjQULpJ/Q+fctA6gSAzc2
	Wi7GzsFvcPot4Dql87w1qqle+34WzWKXnmaoAi+luMfoXrfvL69ldZRCbJGY1z+r88CyQuP3+JP
	uVtqGuQ5vrmWCNv1kBHS42HWSdacMDAYwcKRB4mVz37MAFoIHMWFNmyOgmszEhM6fJRlniwIrM8
	T5MLp8pYxPiLpupb68jJDntGPprfHYfeJ0RvhMmRweWg1qa0hJoZeGnWtMIpc4aRpuEk+V1DnEX
	i4h0IZ254RLdinRED1g0NoweEtvfEVhs+AqpF7TEVMqmAkGDZKPv7++SB6IZphSDsYcbOdzfRsZ
	YhkGWZVwLjJvbNuY=
X-Google-Smtp-Source: AGHT+IFJ0a0/7zpdoajtkBcLg0pJalyYk1624WDxYssQNRcHtUpuFOsvwX5Z/G9JDfUurD4GyikbgQ==
X-Received: by 2002:a05:6820:2782:b0:60b:aeb2:988c with SMTP id 006d021491bc7-60d52db217dmr7757340eaf.1.1748922530242;
        Mon, 02 Jun 2025 20:48:50 -0700 (PDT)
Received: from localhost (37-72-172-174.static.hvvc.us. [37.72.172.174])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-60c14c7122bsm1740655eaf.14.2025.06.02.20.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 20:48:49 -0700 (PDT)
From: Fangrui Song <i@maskray.me>
Date: Mon, 02 Jun 2025 20:48:44 -0700
Subject: [PATCH] riscv: vdso: Exclude .rodata from the PT_DYNAMIC segment
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-riscv-vdso-v1-1-0620cf63cff0@maskray.me>
X-B4-Tracking: v=1; b=H4sIAJtwPmgC/x3MTQqAIBBA4avIrBP8q0VXiRaiY81GwwEJxLsnL
 b/Fex0YKyHDLjpUbMRU8oReBITb5wslxWkwyqxqU0ZW4tBki1yktpgionXeOJjBUzHR+8+Oc4w
 P+u4HylwAAAA=
X-Change-ID: 20250602-riscv-vdso-13efdee34a24
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Fangrui Song <i@maskray.me>
X-Mailer: b4 0.14.2

.rodata is implicitly included in the PT_DYNAMIC segment due to
inheriting the segment of the preceding .dynamic section (in both GNU ld
and LLD).  When the .rodata section's size is not a multiple of 16
bytes on riscv64, llvm-readelf will report a "PT_DYNAMIC dynamic table
is invalid" warning.  Note: in the presence of the .dynamic section, GNU
readelf and llvm-readelf's -d option decodes the dynamic section using
the section.

This issue arose after commit 8f8c1ff879fab60f80f3a7aec3000f47e5b03ba9
("riscv: vdso.lds.S: remove hardcoded 0x800 .text start addr"), which
placed .rodata directly after .dynamic by removing .eh_frame.

This patch resolves the implicit inclusion into PT_DYNAMIC by explicitly
specifying the :text output section phdr.

Reported-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://github.com/ClangBuiltLinux/linux/issues/2093
Signed-off-by: Fangrui Song <i@maskray.me>
---
 arch/riscv/kernel/vdso/vdso.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
index abc69cda0445b1f500a89b47deefa31349103f08..62e0410f69f09e2bbf27101c000d604193f525cb 100644
--- a/arch/riscv/kernel/vdso/vdso.lds.S
+++ b/arch/riscv/kernel/vdso/vdso.lds.S
@@ -30,7 +30,7 @@ SECTIONS
 		*(.data .data.* .gnu.linkonce.d.*)
 		*(.dynbss)
 		*(.bss .bss.* .gnu.linkonce.b.*)
-	}
+	}						:text
 
 	.note		: { *(.note.*) }		:text	:note
 

---
base-commit: 1a3f6980889df3fc90ad3e4a525061d2c138adba
change-id: 20250602-riscv-vdso-13efdee34a24

Best regards,
-- 
Fangrui Song <i@maskray.me>

