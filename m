Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAE8220F5C;
	Sun, 24 Aug 2025 05:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756014311; cv=none; b=q9yMjvISg8p44KdqQ9Mup0GOnHvMU/TURX8vbj+ozGYpipGRxoynnZj23TCjS4bs+HJD/Ew5pjvTnSBa4HtLMiMDoUqfpHELIlBanlX84wwfNGxVellPKHCcTqS5jsj96ynJMvPd2FSuWFxq+7X922uvgb38b0MCACFVZ2CM1NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756014311; c=relaxed/simple;
	bh=04WmZJ86IXQhKBEPECJqN4W+Cznb0ZlZ6iT+fPkJNK0=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=IXI9+J9WmsBbGE7yCYvR9u5dBWUbsPDi9k8WKdOdSxVIgBBqxEVIXesADvJHdOqxzyyhjjiSljQ/tnvJOBo49yR7Wm9LW6Swe0nqeOe0fQ4Yw4C6pRAbSjLuGB95S6bQnaGhYslJfi1lKUXcH9D6IJNC7NcQTKHULpxc8u/Lthc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZrBMiww3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZrBMiww3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D31FC4CEEB;
	Sun, 24 Aug 2025 05:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1756014311;
	bh=04WmZJ86IXQhKBEPECJqN4W+Cznb0ZlZ6iT+fPkJNK0=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=ZrBMiww3cpumzI3SRHY/tVc/YOC8zbkOxPeB2NPvwARmLQLDFpWXpZMHSLEyTD/Yb
	 dfyiJbyQ3Un4xQoDKMzsSOiH2HwIU8JvBOhJ4/r+QgeD5oVAK+neHy8giIEIbVOiz2
	 q34Eiuym3LE/yMzMtXLEMAhpnQzbDopNxLuGL6Ng=
Subject: Patch "mips: Include KBUILD_CPPFLAGS in CHECKFLAGS invocation" has been added to the 5.4-stable tree
To: gregkh@linuxfoundation.org,llvm@lists.linux.dev,masahiroy@kernel.org,nathan@kernel.org,sashal@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Sun, 24 Aug 2025 07:44:52 +0200
In-Reply-To: <20250811235151.1108688-4-nathan@kernel.org>
Message-ID: <2025082452-graves-ludicrous-f63b@gregkh>
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

    mips: Include KBUILD_CPPFLAGS in CHECKFLAGS invocation

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mips-include-kbuild_cppflags-in-checkflags-invocation.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-167084-greg=kroah.com@vger.kernel.org Tue Aug 12 01:52:33 2025
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 11 Aug 2025 16:51:48 -0700
Subject: mips: Include KBUILD_CPPFLAGS in CHECKFLAGS invocation
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, llvm@lists.linux.dev
Message-ID: <20250811235151.1108688-4-nathan@kernel.org>

From: Nathan Chancellor <nathan@kernel.org>

commit 08f6554ff90ef189e6b8f0303e57005bddfdd6a7 upstream.

A future change will move CLANG_FLAGS from KBUILD_{A,C}FLAGS to
KBUILD_CPPFLAGS so that '--target' is available while preprocessing.
When that occurs, the following error appears when building ARCH=mips
with clang (tip of tree error shown):

  clang: error: unsupported option '-mabi=' for target 'x86_64-pc-linux-gnu'

Add KBUILD_CPPFLAGS in the CHECKFLAGS invocation to keep everything
working after the move.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/mips/Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -319,7 +319,7 @@ KBUILD_CFLAGS += -fno-asynchronous-unwin
 KBUILD_LDFLAGS		+= -m $(ld-emul)
 
 ifdef CONFIG_MIPS
-CHECKFLAGS += $(shell $(CC) $(KBUILD_CFLAGS) -dM -E -x c /dev/null | \
+CHECKFLAGS += $(shell $(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -dM -E -x c /dev/null | \
 	egrep -vw '__GNUC_(MINOR_|PATCHLEVEL_)?_' | \
 	sed -e "s/^\#define /-D'/" -e "s/ /'='/" -e "s/$$/'/" -e 's/\$$/&&/g')
 endif


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
