Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11689221282;
	Sun, 24 Aug 2025 05:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756014314; cv=none; b=O97NifmW2R0kezRySXiemlQjP++Dc2IIeC+LM2/iF62u7TsesDaF3ufcxt5FdllFez84yX5TeaXtSN65m2Ei/EjK21G4+J7Ttfgxk32Q2pImrqg7aQksFotTnS4SYwGvjDxGqAMVAs5LYkDWKrWuJQ0oL2CzMmxB1co7EO5qFIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756014314; c=relaxed/simple;
	bh=X/vTFYC94hkW5oLPnNPbHBd0Zgs3VNMNFY5H5mrQbKI=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=g/IUZoNghjcEJBqfHFVVjtkxQ8WB9pikk7g04B0eiECYCj8agVGQKQ7eH8C92BFw27ZmJKk586OYh47vZVtmK+igD0Rwh/A4shWiLmur7+NrUYKWqqUqZQZJbrlfofkbH71mtl1fUCCsCRfpPSO/aGmvLga4lb6FBnf0xjQ3Xo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NXCR80cQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NXCR80cQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 867A9C4CEEB;
	Sun, 24 Aug 2025 05:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1756014313;
	bh=X/vTFYC94hkW5oLPnNPbHBd0Zgs3VNMNFY5H5mrQbKI=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=NXCR80cQm1WBd/qQb3ZKqD+liiwGHYASiBJVFNWgAIBDGiKPzegNMgw6aqBnQtzDL
	 Uh/RJmmofdXVFaOVMYNKyN5VyH/aqxLmZIlfcOyb0avTCZDRF0J/Dg1nJ7C7dQice6
	 s/z0Z14sQiaOwXHGzJKfv7hPm00ZXTvIYECONUgg=
Subject: Patch "kbuild: Update assembler calls to use proper flags and language target" has been added to the 5.4-stable tree
To: anders.roxell@linaro.org,gregkh@linuxfoundation.org,lkft@linaro.org,llvm@lists.linux.dev,masahiroy@kernel.org,nathan@kernel.org,ndesaulniers@google.com,sashal@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Sun, 24 Aug 2025 07:44:52 +0200
In-Reply-To: <20250811235151.1108688-3-nathan@kernel.org>
Message-ID: <2025082452-boxcar-paralegal-b328@gregkh>
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

    kbuild: Update assembler calls to use proper flags and language target

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     kbuild-update-assembler-calls-to-use-proper-flags-and-language-target.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-167083-greg=kroah.com@vger.kernel.org Tue Aug 12 01:52:49 2025
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 11 Aug 2025 16:51:47 -0700
Subject: kbuild: Update assembler calls to use proper flags and language target
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, llvm@lists.linux.dev
Message-ID: <20250811235151.1108688-3-nathan@kernel.org>

From: Nick Desaulniers <ndesaulniers@google.com>

commit d5c8d6e0fa61401a729e9eb6a9c7077b2d3aebb0 upstream.

as-instr uses KBUILD_AFLAGS, but as-option uses KBUILD_CFLAGS. This can
cause as-option to fail unexpectedly when CONFIG_WERROR is set, because
clang will emit -Werror,-Wunused-command-line-argument for various -m
and -f flags in KBUILD_CFLAGS for assembler sources.

Callers of as-option and as-instr should be adding flags to
KBUILD_AFLAGS / aflags-y, not KBUILD_CFLAGS / cflags-y. Use
KBUILD_AFLAGS in all macros to clear up the initial problem.

Unfortunately, -Wunused-command-line-argument can still be triggered
with clang by the presence of warning flags or macro definitions because
'-x assembler' is used, instead of '-x assembler-with-cpp', which will
consume these flags. Switch to '-x assembler-with-cpp' in places where
'-x assembler' is used, as the compiler is always used as the driver for
out of line assembler sources in the kernel.

Finally, add -Werror to these macros so that they behave consistently
whether or not CONFIG_WERROR is set.

[nathan: Reworded and expanded on problems in commit message
         Use '-x assembler-with-cpp' in a couple more places]

Link: https://github.com/ClangBuiltLinux/linux/issues/1699
Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Tested-by: Anders Roxell <anders.roxell@linaro.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 scripts/Kbuild.include |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -99,16 +99,16 @@ try-run = $(shell set -e;		\
 	fi)
 
 # as-option
-# Usage: cflags-y += $(call as-option,-Wa$(comma)-isa=foo,)
+# Usage: aflags-y += $(call as-option,-Wa$(comma)-isa=foo,)
 
 as-option = $(call try-run,\
-	$(CC) $(KBUILD_CFLAGS) $(1) -c -x assembler /dev/null -o "$$TMP",$(1),$(2))
+	$(CC) -Werror $(KBUILD_AFLAGS) $(1) -c -x assembler-with-cpp /dev/null -o "$$TMP",$(1),$(2))
 
 # as-instr
-# Usage: cflags-y += $(call as-instr,instr,option1,option2)
+# Usage: aflags-y += $(call as-instr,instr,option1,option2)
 
 as-instr = $(call try-run,\
-	printf "%b\n" "$(1)" | $(CC) $(KBUILD_AFLAGS) -c -x assembler -o "$$TMP" -,$(2),$(3))
+	printf "%b\n" "$(1)" | $(CC) -Werror $(KBUILD_AFLAGS) -c -x assembler-with-cpp -o "$$TMP" -,$(2),$(3))
 
 # __cc-option
 # Usage: MY_CFLAGS += $(call __cc-option,$(CC),$(MY_CFLAGS),-march=winchip-c6,-march=i586)


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
