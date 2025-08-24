Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6271F099C;
	Sun, 24 Aug 2025 05:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756014308; cv=none; b=FDHfTw+ucfKpc7ApKi4QFEcuRH15OW8ZRvLFKIrKleD1Vn/a797NaC65LCijXgjw3J71btDZL6lbV1szvx6EIHprZXY4G1zkndo8UK2zNPSAKBMWy8ZxghEQQFJ4B8177Qorvs9kRwM3yrTKj4wEIg2BzHMxsefrwwBhtNRsGKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756014308; c=relaxed/simple;
	bh=fGG8PJ918QyrjnbCbWE9zuifjC6R6P510Q9GVcRX51g=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=BcBOosFlan8EO7bkn5nlGcf0Hf2HOX/XN9/6iR23t8cCRKDd9ax2n0V6iRGzPk5LMbdtH1AgvpO2guODLOibxWiirV/Y0ejpNibZx9Z86PJZpKr9waJdtPuPDXoSGDuwfQ42hZ+PQ75+viZdx1S0SsnB9IL5gXNnTjtEIoiAyV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Jk/fB1np; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Jk/fB1np"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 991D3C4CEEB;
	Sun, 24 Aug 2025 05:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1756014308;
	bh=fGG8PJ918QyrjnbCbWE9zuifjC6R6P510Q9GVcRX51g=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=Jk/fB1npj+4GXgkWMNzq3wkHvHc7lsFR/YQR3YgNbQW1ZPp09AyccKvxXD18m96vc
	 mRWXQ4xciFPGWdRNf1zr2QHn7Y41DS+6FPTvh7Dvr5OKWHms46Wb59hSaCp6FaMgZh
	 rWt2EUTdxH9myQg8ZiaZoTgdWmIMiBEa0Ot8SMhs=
Subject: Patch "kbuild: Add KBUILD_CPPFLAGS to as-option invocation" has been added to the 5.4-stable tree
To: gregkh@linuxfoundation.org,lkft@linaro.org,llvm@lists.linux.dev,masahiroy@kernel.org,naresh.kamboju@linaro.org,nathan@kernel.org,sashal@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Sun, 24 Aug 2025 07:44:51 +0200
In-Reply-To: <20250811235151.1108688-7-nathan@kernel.org>
Message-ID: <2025082451-gangly-document-59c9@gregkh>
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

    kbuild: Add KBUILD_CPPFLAGS to as-option invocation

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     kbuild-add-kbuild_cppflags-to-as-option-invocation.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-167087-greg=kroah.com@vger.kernel.org Tue Aug 12 01:53:34 2025
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 11 Aug 2025 16:51:51 -0700
Subject: kbuild: Add KBUILD_CPPFLAGS to as-option invocation
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, llvm@lists.linux.dev
Message-ID: <20250811235151.1108688-7-nathan@kernel.org>

From: Nathan Chancellor <nathan@kernel.org>

commit 43fc0a99906e04792786edf8534d8d58d1e9de0c upstream.

After commit feb843a469fb ("kbuild: add $(CLANG_FLAGS) to
KBUILD_CPPFLAGS"), there is an error while building certain PowerPC
assembly files with clang:

  arch/powerpc/lib/copypage_power7.S: Assembler messages:
  arch/powerpc/lib/copypage_power7.S:34: Error: junk at end of line: `0b01000'
  arch/powerpc/lib/copypage_power7.S:35: Error: junk at end of line: `0b01010'
  arch/powerpc/lib/copypage_power7.S:37: Error: junk at end of line: `0b01000'
  arch/powerpc/lib/copypage_power7.S:38: Error: junk at end of line: `0b01010'
  arch/powerpc/lib/copypage_power7.S:40: Error: junk at end of line: `0b01010'
  clang: error: assembler command failed with exit code 1 (use -v to see invocation)

as-option only uses KBUILD_AFLAGS, so after removing CLANG_FLAGS from
KBUILD_AFLAGS, there is no more '--target=' or '--prefix=' flags. As a
result of those missing flags, the host target
will be tested during as-option calls and likely fail, meaning necessary
flags may not get added when building assembly files, resulting in
errors like seen above.

Add KBUILD_CPPFLAGS to as-option invocations to clear up the errors.
This should have been done in commit d5c8d6e0fa61 ("kbuild: Update
assembler calls to use proper flags and language target"), which
switched from using the assembler target to the assembler-with-cpp
target, so flags that affect preprocessing are passed along in all
relevant tests. as-option now mirrors cc-option.

Fixes: feb843a469fb ("kbuild: add $(CLANG_FLAGS) to KBUILD_CPPFLAGS")
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Closes: https://lore.kernel.org/CA+G9fYs=koW9WardsTtora+nMgLR3raHz-LSLr58tgX4T5Mxag@mail.gmail.com/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 scripts/Kbuild.include |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -102,7 +102,7 @@ try-run = $(shell set -e;		\
 # Usage: aflags-y += $(call as-option,-Wa$(comma)-isa=foo,)
 
 as-option = $(call try-run,\
-	$(CC) -Werror $(KBUILD_AFLAGS) $(1) -c -x assembler-with-cpp /dev/null -o "$$TMP",$(1),$(2))
+	$(CC) -Werror $(KBUILD_CPPFLAGS) $(KBUILD_AFLAGS) $(1) -c -x assembler-with-cpp /dev/null -o "$$TMP",$(1),$(2))
 
 # as-instr
 # Usage: aflags-y += $(call as-instr,instr,option1,option2)


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
