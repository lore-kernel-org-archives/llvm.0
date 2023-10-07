Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4143171AF
	for <llvm@lists.linux.dev>; Sat,  7 Oct 2023 09:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zX/Hk/aW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB1E3C433C8;
	Sat,  7 Oct 2023 09:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696672561;
	bh=nkhNxslDrxRmqtD0Efb+DAIcFT8i0IMyLqM+tqRxiN4=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=zX/Hk/aW+4iszM5flJ4B3nmx02fVwMGaf3PtYb78QUaPp7SDskHP2deUJCsPW1r69
	 cJPmRzJR1LDmSG/lsj9yZCcQ6u5WEI1eOHkFcQ7YYlcI9hxTs+kiKgzs4htR6cVG2x
	 efeUHRsaJ9CRMeSqBT2mDsPNhCfk29Azu30bbhcQ=
Subject: Patch "drm/mediatek: Fix backport issue in mtk_drm_gem_prime_vmap()" has been added to the 5.10-stable tree
To: chunkuang.hu@kernel.org,gregkh@linuxfoundation.org,linux-mediatek@lists.infradead.org,llvm@lists.linux.dev,nathan@kernel.org,p.zabel@pengutronix.de,sashal@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Sat, 07 Oct 2023 11:55:58 +0200
In-Reply-To: <20230922-5-10-fix-drm-mediatek-backport-v1-1-912d76cd4a96@kernel.org>
Message-ID: <2023100757-endnote-problem-a13b@gregkh>
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

    drm/mediatek: Fix backport issue in mtk_drm_gem_prime_vmap()

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-mediatek-fix-backport-issue-in-mtk_drm_gem_prime_vmap.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From nathan@kernel.org  Sat Oct  7 11:52:29 2023
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 22 Sep 2023 08:51:17 -0700
Subject: drm/mediatek: Fix backport issue in mtk_drm_gem_prime_vmap()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-mediatek@lists.infradead.org, stable@vger.kernel.org, llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
Message-ID: <20230922-5-10-fix-drm-mediatek-backport-v1-1-912d76cd4a96@kernel.org>

From: Nathan Chancellor <nathan@kernel.org>

When building with clang:

  drivers/gpu/drm/mediatek/mtk_drm_gem.c:255:10: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
    255 |                 return -ENOMEM;
        |                        ^~~~~~~
  1 error generated.

GCC reports the same issue as a warning, rather than an error.

Prior to commit 7e542ff8b463 ("drm/mediatek: Use struct dma_buf_map in
GEM vmap ops"), this function returned a pointer rather than an integer.
This function is indirectly called in drm_gem_vmap(), which treats NULL
as -ENOMEM through an error pointer. Return NULL in this block to
resolve the warning but keep the same end result.

Fixes: 43f561e809aa ("drm/mediatek: Fix potential memory leak if vmap() fail")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_gem.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -252,7 +252,7 @@ void *mtk_drm_gem_prime_vmap(struct drm_
 	if (!mtk_gem->kvaddr) {
 		kfree(sgt);
 		kfree(mtk_gem->pages);
-		return -ENOMEM;
+		return NULL;
 	}
 out:
 	kfree(sgt);


Patches currently in stable-queue which might be from nathan@kernel.org are

queue-5.10/drm-mediatek-fix-backport-issue-in-mtk_drm_gem_prime_vmap.patch
queue-5.10/bpf-fix-btf_id-symbol-generation-collision.patch
queue-5.10/bpf-fix-btf_id-symbol-generation-collision-in-tools.patch
