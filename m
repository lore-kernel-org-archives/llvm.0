Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AF33E6DC4;
	Thu, 23 Apr 2026 12:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776947727; cv=none; b=S0f8A2G7iHDtHcHBM92Dfc1noAS/HyQh2r+1VQCSnb5xhKWFQYLKx1JFK1gyWO8Lz1es/S3Pjap9pf3bswncXOYZEmitpAWGkb/C0kk+yRvcy2eKrN0pwc6HwoYcVygVyN3OkaFicTFZVy6/hk9JHw2n0Q5llibzFkj54yQ/TaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776947727; c=relaxed/simple;
	bh=Y512Lp+aCd1q+GGPtG90KD7iKKkxfsyPd0izY2TQyjo=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=TVWxFh21VNTogOe52xakPxgY+zQdP5NI25TkpnzCm2VaWX9df3j3rcylteReDhvNHIlgF6w1G1cdpNLj406Srv6vTeH+Y+cSxHSzJyVn7g/yApuwfnCALQZGbkjw8vI9LGnHUlHbpJrHA+RV9qb4aTZe/JUIjtzwup5eyf/N50w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=k+5Y0+/r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="k+5Y0+/r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E18CC2BCAF;
	Thu, 23 Apr 2026 12:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776947726;
	bh=Y512Lp+aCd1q+GGPtG90KD7iKKkxfsyPd0izY2TQyjo=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=k+5Y0+/rK57iiMoRju4bRDvlvXOTem2gmzXY2200u0unvUm5+2RsVvX+mKVumtDQ1
	 02iWZr6wpo1iuRqP3G0+Nz59gQMtYl0SI93ZKJLGW3pUOSyT9BScAbo2T9To5rqYai
	 g6JhXo2WlCNfi7pZl1gOfwOAv0MkCWMg/wamB9Ek=
Subject: Patch "drm/amd/display: Do not add '-mhard-float' to calcs, dsc, and dcn30 FP files for clang" has been added to the 5.10-stable tree
To: amd-gfx@lists.freedesktop.org,gregkh@linuxfoundation.org,llvm@lists.linux.dev,nathan@kernel.org,ndesaulniers@google.com,sashal@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 23 Apr 2026 14:35:06 +0200
In-Reply-To: <20260406-5-10-clang-amdgpu-hard-float-errors-v1-1-09c4c045f848@kernel.org>
Message-ID: <2026042306-fool-ergonomic-bb0e@gregkh>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    drm/amd/display: Do not add '-mhard-float' to calcs, dsc, and dcn30 FP files for clang

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-amd-display-do-not-add-mhard-float-to-calcs-dsc-and-dcn30-fp-files-for-clang.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-233477-greg=kroah.com@vger.kernel.org Tue Apr  7 02:49:29 2026
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 06 Apr 2026 17:49:08 -0700
Subject: drm/amd/display: Do not add '-mhard-float' to calcs, dsc, and dcn30 FP files for clang
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,  amd-gfx@lists.freedesktop.org, llvm@lists.linux.dev,  Nathan Chancellor <nathan@kernel.org>
Message-ID: <20260406-5-10-clang-amdgpu-hard-float-errors-v1-1-09c4c045f848@kernel.org>

From: Nathan Chancellor <nathan@kernel.org>

This patch is for linux-5.10.y only. It is functionally equivalent to
upstream commit 7db038d9790e ("drm/amd/display: Do not add
'-mhard-float' to dml_ccflags for clang"), which was created after all
files that require '-mhard-float' were moved under the dml folder. In
linux-5.10.y, which does not contain upstream commits

  b4bab46400a0 ("drm/amd/display: move calcs folder into DML")
  27e01f10d183 ("drm/amd/display: move FPU associated DSC code to DML folder")
  40b31e5355ba ("drm/amd/display: Remove FPU flags from DCN30 Makefile")

clang-21 or newer errors with

  clang: error: unsupported option '-mhard-float' for target 'x86_64-pc-linux-gnu'
  make[6]: *** [scripts/Makefile.build:286: drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calc_math.o] Error 1
  clang: error: unsupported option '-mhard-float' for target 'x86_64-pc-linux-gnu'
  make[6]: *** [scripts/Makefile.build:286: drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.o] Error 1
  clang: error: unsupported option '-mhard-float' for target 'x86_64-pc-linux-gnu'
  make[6]: *** [scripts/Makefile.build:286: drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calc_auto.o] Error 1
  clang: error: unsupported option '-mhard-float' for target 'x86_64-pc-linux-gnu'
  make[6]: *** [scripts/Makefile.build:286: drivers/gpu/drm/amd/amdgpu/../display/dc/dsc/rc_calc.o] Error 1
  clang: error: unsupported option '-mhard-float' for target 'x86_64-pc-linux-gnu'
  make[6]: *** [scripts/Makefile.build:286: drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_optc.o] Error 1
  clang: error: unsupported option '-mhard-float' for target 'x86_64-pc-linux-gnu'
  make[6]: *** [scripts/Makefile.build:286: drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.o] Error 1

Apply a functionally equivalent change to prevent adding '-mhard-float'
with clang for these files.

Closes: https://github.com/ClangBuiltLinux/linux/issues/2156
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/amd/display/dc/calcs/Makefile |    3 ++-
 drivers/gpu/drm/amd/display/dc/dcn30/Makefile |    4 ++--
 drivers/gpu/drm/amd/display/dc/dsc/Makefile   |    3 ++-
 3 files changed, 6 insertions(+), 4 deletions(-)

--- a/drivers/gpu/drm/amd/display/dc/calcs/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/calcs/Makefile
@@ -26,7 +26,8 @@
 #
 
 ifdef CONFIG_X86
-calcs_ccflags := -mhard-float -msse
+calcs_ccflags-$(CONFIG_CC_IS_GCC) := -mhard-float
+calcs_ccflags := $(calcs_ccflags-y) -msse
 endif
 
 ifdef CONFIG_PPC64
--- a/drivers/gpu/drm/amd/display/dc/dcn30/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/Makefile
@@ -32,8 +32,8 @@ DCN30 = dcn30_init.o dcn30_hubbub.o dcn3
 
 
 ifdef CONFIG_X86
-CFLAGS_$(AMDDALPATH)/dc/dcn30/dcn30_resource.o := -mhard-float -msse
-CFLAGS_$(AMDDALPATH)/dc/dcn30/dcn30_optc.o := -mhard-float -msse
+CFLAGS_$(AMDDALPATH)/dc/dcn30/dcn30_resource.o := $(if $(CONFIG_CC_IS_GCC),-mhard-float) -msse
+CFLAGS_$(AMDDALPATH)/dc/dcn30/dcn30_optc.o := $(if $(CONFIG_CC_IS_GCC),-mhard-float) -msse
 endif
 
 ifdef CONFIG_PPC64
--- a/drivers/gpu/drm/amd/display/dc/dsc/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dsc/Makefile
@@ -3,7 +3,8 @@
 # Makefile for the 'dsc' sub-component of DAL.
 
 ifdef CONFIG_X86
-dsc_ccflags := -mhard-float -msse
+dsc_ccflags-$(CONFIG_CC_IS_GCC) := -mhard-float
+dsc_ccflags := $(dsc_ccflags-y) -msse
 endif
 
 ifdef CONFIG_PPC64


Patches currently in stable-queue which might be from nathan@kernel.org are

queue-5.10/acpi-property-constify-stubs-for-config_acpi-n-case.patch
queue-5.10/scripts-dtc-remove-unused-dts_version-in-dtc-lexer.l.patch
queue-5.10/drm-amd-display-do-not-add-mhard-float-to-calcs-dsc-and-dcn30-fp-files-for-clang.patch
