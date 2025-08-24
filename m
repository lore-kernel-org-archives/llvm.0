Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9EB548EE;
	Sun, 24 Aug 2025 05:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756014294; cv=none; b=ImVD3Gv3xEcFOikGsBYyGzAK6AenOExPpRUkw7almGDBfSMK6mOjqjoAQ6F/sIhSNDEtAQqhjuSRsLOR6p3kB3qs7J06lQ3PqLQQtwEYHCItyT1+KjJykvS8f3hLCwHYwCrpNni4NFwTdBPkZC6+k0e6+KFNPC9C4ECFiwBznPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756014294; c=relaxed/simple;
	bh=Rvs38LMeYoGCszcKMzBaPllVGZ35Zdx7jA51sxr5sWc=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=jAPxD978akaXKBbRncRSQl6/Ou4wsU8xZ8SmK++kED26v1WrTJoZXaoBtxKrPOLU0GdKYctNUAWYvUtM8CvFVOsBVlmoITgNteSPKWfDnVXnAYgyBOeEvl356b/FS5QIbZ9YLW/EpBertiAfIA/1rhwKi9ThnhpIybNIiHIaaxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=j+G9bgHv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="j+G9bgHv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EA6DC4CEEB;
	Sun, 24 Aug 2025 05:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1756014293;
	bh=Rvs38LMeYoGCszcKMzBaPllVGZ35Zdx7jA51sxr5sWc=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=j+G9bgHv5EyY+6rpOGlXzcFuWlc3Z/tVTUVhpWA15freT//Xsmai1m8gllQfk3tEN
	 I6Ppii0+32NRuMoHUtbRJRV/3u+EuDqtZGC2Tq5tuU3Yjss48hYAbZm4hdZ3kVgSvs
	 51BXZ09jHzH3ReMcHGukNNj5qqbVmnX3ah7DHHF8=
Subject: Patch "ARM: 9448/1: Use an absolute path to unified.h in KBUILD_AFLAGS" has been added to the 5.4-stable tree
To: bot@kernelci.org,gregkh@linuxfoundation.org,llvm@lists.linux.dev,masahiroy@kernel.org,nathan@kernel.org,rmk+kernel@armlinux.org.uk,sashal@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Sun, 24 Aug 2025 07:44:51 +0200
In-Reply-To: <20250811235151.1108688-2-nathan@kernel.org>
Message-ID: <2025082450-startling-brewing-d568@gregkh>
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

    ARM: 9448/1: Use an absolute path to unified.h in KBUILD_AFLAGS

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm-9448-1-use-an-absolute-path-to-unified.h-in-kbuild_aflags.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-167082-greg=kroah.com@vger.kernel.org Tue Aug 12 01:52:48 2025
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 11 Aug 2025 16:51:46 -0700
Subject: ARM: 9448/1: Use an absolute path to unified.h in KBUILD_AFLAGS
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, llvm@lists.linux.dev
Message-ID: <20250811235151.1108688-2-nathan@kernel.org>

From: Nathan Chancellor <nathan@kernel.org>

commit 87c4e1459e80bf65066f864c762ef4dc932fad4b upstream.

After commit d5c8d6e0fa61 ("kbuild: Update assembler calls to use proper
flags and language target"), which updated as-instr to use the
'assembler-with-cpp' language option, the Kbuild version of as-instr
always fails internally for arch/arm with

  <command-line>: fatal error: asm/unified.h: No such file or directory
  compilation terminated.

because '-include' flags are now taken into account by the compiler
driver and as-instr does not have '$(LINUXINCLUDE)', so unified.h is not
found.

This went unnoticed at the time of the Kbuild change because the last
use of as-instr in Kbuild that arch/arm could reach was removed in 5.7
by commit 541ad0150ca4 ("arm: Remove 32bit KVM host support") but a
stable backport of the Kbuild change to before that point exposed this
potential issue if one were to be reintroduced.

Follow the general pattern of '-include' paths throughout the tree and
make unified.h absolute using '$(srctree)' to ensure KBUILD_AFLAGS can
be used independently.

Closes: https://lore.kernel.org/CACo-S-1qbCX4WAVFA63dWfHtrRHZBTyyr2js8Lx=Az03XHTTHg@mail.gmail.com/

Cc: stable@vger.kernel.org
Fixes: d5c8d6e0fa61 ("kbuild: Update assembler calls to use proper flags and language target")
Reported-by: KernelCI bot <bot@kernelci.org>
Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
[nathan: Fix conflicts]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm/Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -136,7 +136,7 @@ endif
 
 # Need -Uarm for gcc < 3.x
 KBUILD_CFLAGS	+=$(CFLAGS_ABI) $(CFLAGS_ISA) $(arch-y) $(tune-y) $(call cc-option,-mshort-load-bytes,$(call cc-option,-malignment-traps,)) -msoft-float -Uarm
-KBUILD_AFLAGS	+=$(CFLAGS_ABI) $(AFLAGS_ISA) $(arch-y) $(tune-y) -include asm/unified.h -msoft-float
+KBUILD_AFLAGS	+=$(CFLAGS_ABI) $(AFLAGS_ISA) $(arch-y) $(tune-y) -include $(srctree)/arch/arm/include/asm/unified.h -msoft-float
 
 CHECKFLAGS	+= -D__arm__
 


Patches currently in stable-queue which might be from nathan@kernel.org are

queue-5.4/kbuild-add-clang_flags-to-as-instr.patch
queue-5.4/wifi-brcmsmac-remove-const-from-tbl_ptr-parameter-in-wlc_lcnphy_common_read_table.patch
queue-5.4/mips-include-kbuild_cppflags-in-checkflags-invocation.patch
queue-5.4/kbuild-add-clang_flags-to-kbuild_cppflags.patch
queue-5.4/ftrace-also-allocate-and-copy-hash-for-reading-of-filter-files.patch
queue-5.4/memstick-core-zero-initialize-id_reg-in-h_memstick_read_dev_id.patch
queue-5.4/kbuild-update-assembler-calls-to-use-proper-flags-and-language-target.patch
queue-5.4/phonet-pep-move-call-to-pn_skb_get_dst_sockaddr-earlier-in-pep_sock_accept.patch
queue-5.4/arm-9448-1-use-an-absolute-path-to-unified.h-in-kbuild_aflags.patch
queue-5.4/kbuild-add-kbuild_cppflags-to-as-option-invocation.patch
queue-5.4/usb-atm-cxacru-merge-cxacru_upload_firmware-into-cxacru_heavy_init.patch
