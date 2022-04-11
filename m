Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272CC1865
	for <llvm@lists.linux.dev>; Mon, 11 Apr 2022 16:49:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A2C0C385AF;
	Mon, 11 Apr 2022 16:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649695785;
	bh=LG6DEpN3nUetf6gTjXDS2as/MUup8+kN34+gt4XFpKk=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=rq6INqGBnL7HOZZYU+Wr5BGckVZHvkOK5cR+HZICu6W4qoOIJrp5wvdt5oDNcq+yj
	 b64Z1SYEeA8QcxhM+CVTxGwh81cdf+SvWzAY58hqA2YP8Y3NwpRrc+qtROXh8sMvis
	 kr6zTgrOc2uWXgZAkE/wy+xnmXVWcLKHG1cJP9+Q=
Subject: Patch "drm/amdkfd: Fix -Wstrict-prototypes from amdgpu_amdkfd_gfx_10_0_get_functions()" has been added to the 5.4-stable tree
To: Felix.Kuehling@amd.com,alexander.deucher@amd.com,amd-gfx@lists.freedesktop.org,gregkh@linuxfoundation.org,llvm@lists.linux.dev,nathan@kernel.org,ndesaulniers@google.com,sashal@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 11 Apr 2022 18:49:34 +0200
In-Reply-To: <20220411164308.2491139-3-nathan@kernel.org>
Message-ID: <1649695774208174@kroah.com>
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

    drm/amdkfd: Fix -Wstrict-prototypes from amdgpu_amdkfd_gfx_10_0_get_functions()

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-amdkfd-fix-wstrict-prototypes-from-amdgpu_amdkfd_gfx_10_0_get_functions.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Mon Apr 11 06:48:58 PM CEST 2022
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 11 Apr 2022 09:43:08 -0700
Subject: drm/amdkfd: Fix -Wstrict-prototypes from amdgpu_amdkfd_gfx_10_0_get_functions()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Nick Desaulniers <ndesaulniers@google.com>, amd-gfx@lists.freedesktop.org, llvm@lists.linux.dev, stable@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
Message-ID: <20220411164308.2491139-3-nathan@kernel.org>

From: Nathan Chancellor <nathan@kernel.org>

This patch is for linux-5.4.y only, it has no equivalent change
upstream.

When building x86_64 allmodconfig with tip of tree clang, there is an
instance of -Wstrict-prototypes:

  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c:168:59: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
  struct kfd2kgd_calls *amdgpu_amdkfd_gfx_10_0_get_functions()
                                                            ^
                                                             void
  1 error generated.

amdgpu_amdkfd_gfx_10_0_get_functions() is prototyped properly in
drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h but its definition in
amdgpu_amdkfd_gfx_v10.c does not have the argument types specified,
which causes the warning. GCC does not warn because it permits an
old-style definition if the prototype has the argument types.

This code was eliminated by commit e392c887df97 ("drm/amdkfd: Use array
to probe kfd2kgd_calls"), which was a part of a larger series that does
not look very suitable for stable. Just fix this one location, as it was
the only instance of this new warning across a variety of builds.

Fixes: 6bdadb207224 ("drm/amdgpu: Add navi10 kfd support for amdgpu (v3)")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
@@ -165,7 +165,7 @@ static const struct kfd2kgd_calls kfd2kg
 	.get_tile_config = amdgpu_amdkfd_get_tile_config,
 };
 
-struct kfd2kgd_calls *amdgpu_amdkfd_gfx_10_0_get_functions()
+struct kfd2kgd_calls *amdgpu_amdkfd_gfx_10_0_get_functions(void)
 {
 	return (struct kfd2kgd_calls *)&kfd2kgd;
 }


Patches currently in stable-queue which might be from nathan@kernel.org are

queue-5.4/drm-amdkfd-fix-wstrict-prototypes-from-amdgpu_amdkfd_gfx_10_0_get_functions.patch
queue-5.4/drm-amdkfd-add-missing-void-argument-to-function-kgd2kfd_init.patch
queue-5.4/arm64-module-remove-noload-from-linker-script.patch
queue-5.4/tools-build-filter-out-options-and-warnings-not-supported-by-clang.patch
queue-5.4/riscv-module-remove-noload.patch
queue-5.4/tools-build-use-shell-instead-of-to-get-embedded-libperl-s-ccopts.patch
