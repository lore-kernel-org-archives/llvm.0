Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2662F1A23A9;
	Sun, 24 Aug 2025 05:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756014305; cv=none; b=MWdamd4XfSm7L5P572eoO9Mu9fuh0iv1nKr34Ddw2gANxD8FKeXEqCEOaYUcSIl9FoUnE5UyYj/wmNcRitTON7oX/Kp2nFNiV2d5/bMrR72qNk0MZ/rYRcxdvh3YlTgeQnJyog0PHfSB1TEAm/1iKmP6d14DqQdL9Qlj+R/s0Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756014305; c=relaxed/simple;
	bh=zCJhtsTcPsGd4zzQS+fydnXIZYzD0wwFuXzXq4/6lWo=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=nggRnWUn8GrM/+8HXCdWQjqQqonuurwc+mbQjExhkFFHihmqN16Yu2HzYfhHCNdsIkaseL4VjzvibvdJZtIaKUZpmIg7/5s69lqt8qio9YaZabSFvI1W9KP38SAHKi55JAR4lQ3/jq0qXXgfbCzt+CHQksIdAHlvp6zBlyEneG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZTti+Jye; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZTti+Jye"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3DE8C4CEEB;
	Sun, 24 Aug 2025 05:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1756014305;
	bh=zCJhtsTcPsGd4zzQS+fydnXIZYzD0wwFuXzXq4/6lWo=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=ZTti+JyebFEYXnKUtsC48BZx9lXqE0SZTr3mrRRrBZDgfeSj3Ca7vglUnyLTy3mhi
	 yikT4TNXawhV/WDEQ8w86nNCM09iy/28uP5ZRHF8+E/q3QZaSHMLtXucwxNNq0QvYG
	 8sRK7sD9YoiSwnNrxeINAcBqc4R8rRm48peaK/lM=
Subject: Patch "kbuild: add $(CLANG_FLAGS) to KBUILD_CPPFLAGS" has been added to the 5.4-stable tree
To: gregkh@linuxfoundation.org,llvm@lists.linux.dev,masahiroy@kernel.org,nathan@kernel.org,sashal@kernel.org,trini@konsulko.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Sun, 24 Aug 2025 07:44:51 +0200
In-Reply-To: <20250811235151.1108688-6-nathan@kernel.org>
Message-ID: <2025082451-uninstall-petticoat-6f8e@gregkh>
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

    kbuild: add $(CLANG_FLAGS) to KBUILD_CPPFLAGS

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     kbuild-add-clang_flags-to-kbuild_cppflags.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-167086-greg=kroah.com@vger.kernel.org Tue Aug 12 01:53:32 2025
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 11 Aug 2025 16:51:50 -0700
Subject: kbuild: add $(CLANG_FLAGS) to KBUILD_CPPFLAGS
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, llvm@lists.linux.dev
Message-ID: <20250811235151.1108688-6-nathan@kernel.org>

From: Masahiro Yamada <masahiroy@kernel.org>

commit feb843a469fb0ab00d2d23cfb9bcc379791011bb upstream.

When preprocessing arch/*/kernel/vmlinux.lds.S, the target triple is
not passed to $(CPP) because we add it only to KBUILD_{C,A}FLAGS.

As a result, the linker script is preprocessed with predefined macros
for the build host instead of the target.

Assuming you use an x86 build machine, compare the following:

 $ clang -dM -E -x c /dev/null
 $ clang -dM -E -x c /dev/null -target aarch64-linux-gnu

There is no actual problem presumably because our linker scripts do not
rely on such predefined macros, but it is better to define correct ones.

Move $(CLANG_FLAGS) to KBUILD_CPPFLAGS, so that all *.c, *.S, *.lds.S
will be processed with the proper target triple.

[Note]
After the patch submission, we got an actual problem that needs this
commit. (CBL issue 1859)

Link: https://github.com/ClangBuiltLinux/linux/issues/1859
Reported-by: Tom Rini <trini@konsulko.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 Makefile |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- a/Makefile
+++ b/Makefile
@@ -568,8 +568,7 @@ ifneq ($(LLVM_IAS),1)
 CLANG_FLAGS	+= -no-integrated-as
 endif
 CLANG_FLAGS	+= -Werror=unknown-warning-option
-KBUILD_CFLAGS	+= $(CLANG_FLAGS)
-KBUILD_AFLAGS	+= $(CLANG_FLAGS)
+KBUILD_CPPFLAGS	+= $(CLANG_FLAGS)
 export CLANG_FLAGS
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
