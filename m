Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214CA4A4F1F;
	Wed, 16 Sep 2026 21:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789595965; cv=none; b=c719RGrC79vP2jxMyfFQeMfetxqQIPglCw8RIJUnibFPl0RM3kqplQIOY/uXAdvH1dFnVSKQWiuceTDcDxlrQDg6FozZTJcj6eMLA+k7vD7D1fj6LN4MNy98dh/dFR2FBWW/cKI8TP+LaHPmge/G+LkxbRPjER82x7JXcc0YkS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789595965; c=relaxed/simple;
	bh=BNcSQgSTj6WR5Bdg6c6KiBf2o/yyKbQ+vLuJugYOCOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=n0FIjBLdDZbBbgX1szkMF8quIeJi/7GbHNxC7bKSjsDzVDWNo0vIY1knIy5S3L0HWeH0cyARnhYtCFk6ZylcmAKlEjeEFDruNzOHQ3AKpRPpawnIFo44Ax53LnbCRHg2+rRdKC9VNhHtObiqPU419p8GlISK1Wey2WOSUMI1ETU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nzYQdAGo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nzYQdAGo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68D281F000FF;
	Wed, 16 Sep 2026 21:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789595955;
	bh=9mh+hNdVNou1TdLhd+FHhgaVzkAqNi5KZWIhNibhJsg=;
	h=From:Date:Subject:To:Cc;
	b=nzYQdAGommf7xzQqKPbpIbTmS0HgLYWKAFQR1APmzGA8A5sW/2CLh5EANRBN+lMAP
	 wReJR2joTAbmvBX7u6kmf/5q325sAlXdtCgdN2Il0wNnB1zSjtstDGknWZifPtKgf4
	 ODeI2GGAF4bjTxhfaDW+RpXnX8A+PXIxJHwkRa946WOrGTcCTT6mh5CdFf4XPnwU7w
	 uvAwgXAc36G1c6dNRnVyBAG+E+DZI1vJNNdCxvwxOHOcsBSf6QfJpJp7ASSY+qaf5Q
	 ScfkbXEHGgviNBHvAjbsws9DUkM2zOXrydzU2XYUfO/0mqPjvUNCLe3pn/cwLFSOxD
	 CSXeX9l3eRz3w==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 16 Sep 2026 14:58:44 -0700
Subject: [PATCH] random: vDSO: Avoid call to memset() when zeroing reserved
 in __cvdso_getrandom_data()
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-vdso-getrandom-avoid-memset-llvm-24-v1-1-80a92f2e225a@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ7CIBBA0as0s3YSQMToVYwLLNM6poBhkJg0v
 buoy7f5fwWhwiRwHlYo1Fg4pw69G2C8+zQTcugGo4xTJ+2wBck4Uy0+hRzRt8wBI0WhisvSIhq
 LRxvsYfJO7TVBLz0LTfz+XS7Xv+V1e9BYv2nYtg9pTCXjhwAAAA==
X-Change-ID: 20260916-vdso-getrandom-avoid-memset-llvm-24-74d45fa6031e
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2125; i=nathan@kernel.org;
 h=from:subject:message-id; bh=BNcSQgSTj6WR5Bdg6c6KiBf2o/yyKbQ+vLuJugYOCOo=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFmrBbU/x4c7qb4veSIQGn4q93rzx+QvW5q1lcNsag+sq
 Pbn/7ywo5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEwkuZ2R4YDWHW1vBsNnlz7k
 /NX39iw9/fanwcLwCL1ffk+nODpMsGFkeFVx8P7uF1y1DBMXzlq1YWp64UrBi1yrP62I9/hvta6
 sjxMA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

After a recent change in LLVM [1], RISC-V builds fail when checking the
vDSO:

  arch/riscv/kernel/vdso/vdso.so.dbg: dynamic relocations are not supported
  make[4]: *** [arch/riscv/kernel/vdso/Makefile:78: arch/riscv/kernel/vdso/vdso.so.dbg] Error 1

memset() is now generated when zeroing params->reserved because LLVM has
an optimization (now run in more instances) that can recognize at
compile time when it is assigning a static value to a contiguous area of
memory and turn that into a call to memset(). Both clang and GCC assume
memset() is always available [2].

Hide the value of the iterator variable from the optimizer using
OPTIMIZER_HIDE_VAR to inhibit this optimization since it can no longer
assume that the zeroing is contiguous.

Link: https://github.com/llvm/llvm-project/commit/90cebef1411617fc3eedd359bdf00cb44b1c2439 [1]
Link: https://gcc.gnu.org/onlinedocs/gcc-16.2.0/gcc/Standards.html#index-ffreestanding [2]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 lib/vdso/getrandom.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
index 2851afa9154f..d48d1fdb3351 100644
--- a/lib/vdso/getrandom.c
+++ b/lib/vdso/getrandom.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/array_size.h>
+#include <linux/compiler.h>
 #include <linux/minmax.h>
 #include <vdso/datapage.h>
 #include <vdso/getrandom.h>
@@ -83,8 +84,11 @@ __cvdso_getrandom_data(const struct vdso_rng_data *rng_info, void *buffer, size_
 		params->size_of_opaque_state = sizeof(*state);
 		params->mmap_prot = PROT_READ | PROT_WRITE;
 		params->mmap_flags = MAP_DROPPABLE | MAP_ANONYMOUS;
-		for (size_t i = 0; i < ARRAY_SIZE(params->reserved); ++i)
+		for (size_t i = 0; i < ARRAY_SIZE(params->reserved); ++i) {
+			/* prevent compiler from turning loop into memset() */
+			OPTIMIZER_HIDE_VAR(i);
 			params->reserved[i] = 0;
+		}
 		return 0;
 	}
 

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260916-vdso-getrandom-avoid-memset-llvm-24-74d45fa6031e

Best regards,
--  
Cheers,
Nathan

