Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270927B
	for <llvm@lists.linux.dev>; Thu, 30 Jun 2022 11:31:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E1FFC34115;
	Thu, 30 Jun 2022 11:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1656588677;
	bh=1Ih98aPbDtu4VZUmkSDEzbOmq0ibacyDGmHIrHBXOeU=;
	h=Subject:To:Cc:From:Date:From;
	b=zCDodUMR85KMVIDX9s1QGEv6e2d76DGxJqo9OA5gccMotCbSxvHRG3+9UmKadhv8B
	 VMeIOMcPQNhIrIOGBWlD5upYgY7rmkp2shjNxc6dpePIamLb7LWFyIvVEzhMBB7IkN
	 l5R0+rfiMjjyXbWCcWBaggVtnWR8QadpECujJzdk=
Subject: Patch "hinic: Replace memcpy() with direct assignment" has been added to the 5.18-stable tree
To: gregkh@linuxfoundation.org,gustavoars@kernel.org,keescook@chromium.org,kuba@kernel.org,llvm@lists.linux.dev,nathan@kernel.org,ndesaulniers@google.com,trix@redhat.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 30 Jun 2022 13:31:12 +0200
Message-ID: <1656588672226142@kroah.com>
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

    hinic: Replace memcpy() with direct assignment

to the 5.18-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     hinic-replace-memcpy-with-direct-assignment.patch
and it can be found in the queue-5.18 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 1e70212e031528918066a631c9fdccda93a1ffaa Mon Sep 17 00:00:00 2001
From: Kees Cook <keescook@chromium.org>
Date: Wed, 15 Jun 2022 22:23:12 -0700
Subject: hinic: Replace memcpy() with direct assignment

From: Kees Cook <keescook@chromium.org>

commit 1e70212e031528918066a631c9fdccda93a1ffaa upstream.

Under CONFIG_FORTIFY_SOURCE=y and CONFIG_UBSAN_BOUNDS=y, Clang is bugged
here for calculating the size of the destination buffer (0x10 instead of
0x14). This copy is a fixed size (sizeof(struct fw_section_info_st)), with
the source and dest being struct fw_section_info_st, so the memcpy should
be safe, assuming the index is within bounds, which is UBSAN_BOUNDS's
responsibility to figure out.

Avoid the whole thing and just do a direct assignment. This results in
no change to the executable code.

[This is a duplicate of commit 2c0ab32b73cf ("hinic: Replace memcpy()
 with direct assignment") which was applied to net-next.]

Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Tom Rix <trix@redhat.com>
Cc: llvm@lists.linux.dev
Link: https://github.com/ClangBuiltLinux/linux/issues/1592
Signed-off-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org> # build
Link: https://lore.kernel.org/r/20220616052312.292861-1-keescook@chromium.org
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/net/ethernet/huawei/hinic/hinic_devlink.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

--- a/drivers/net/ethernet/huawei/hinic/hinic_devlink.c
+++ b/drivers/net/ethernet/huawei/hinic/hinic_devlink.c
@@ -43,9 +43,7 @@ static bool check_image_valid(struct hin
 
 	for (i = 0; i < fw_image->fw_info.fw_section_cnt; i++) {
 		len += fw_image->fw_section_info[i].fw_section_len;
-		memcpy(&host_image->image_section_info[i],
-		       &fw_image->fw_section_info[i],
-		       sizeof(struct fw_section_info_st));
+		host_image->image_section_info[i] = fw_image->fw_section_info[i];
 	}
 
 	if (len != fw_image->fw_len ||


Patches currently in stable-queue which might be from keescook@chromium.org are

queue-5.18/hinic-replace-memcpy-with-direct-assignment.patch
