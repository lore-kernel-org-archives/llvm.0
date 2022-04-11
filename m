Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61641865
	for <llvm@lists.linux.dev>; Mon, 11 Apr 2022 16:43:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14499C385A4;
	Mon, 11 Apr 2022 16:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649695419;
	bh=tRPzFrKi58iaON1GV7j101ky0tw14bbNXKSh/h7xHs0=;
	h=From:To:Cc:Subject:Date:From;
	b=gMN5IJVTiOiTqtw3IXDtQ7okdkb5Cs4BL3aY6sqKhj5NIAHkhFgfKjRt5dk2W13Ob
	 taJPv5icjPAgLUA/FajURaeTgI5wBWQQuKRuBzx21/UiT1idcpalVj9y6VSXOVQw1/
	 6zv0GSY6UlbIdrkUnhmMMgSOotzJdT+qIXXp4Jh7xd3+Sj7hdMwypzdFba7H4IRLl8
	 cz8MNMJnXTeHC1ovq4BKcEqqD4TFjs+5xMebSlidCl0W4z6vi3y4ggldvkgFJkQSVV
	 3yUj+qLeNXnrdwA9BBHFblUqbjnzxcSNZzoNmegVZH68ncvI+GopZliH0kAwRXcm76
	 NbTfN2TO5vLcA==
From: Nathan Chancellor <nathan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	amd-gfx@lists.freedesktop.org,
	llvm@lists.linux.dev,
	stable@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 5.4 0/2] Fix two instances of -Wstrict-prototypes in drm/amd
Date: Mon, 11 Apr 2022 09:43:06 -0700
Message-Id: <20220411164308.2491139-1-nathan@kernel.org>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

These two patches resolve two instances of -Wstrict-prototypes with
newer versions of clang that are present in 5.4. The main Makefile makes
this a hard error.

The first patch is upstream commit 63617d8b125e ("drm/amdkfd: add
missing void argument to function kgd2kfd_init"), which showed up in
5.5.

The second patch has no upstream equivalent, as the code in question was
removed in commit e392c887df97 ("drm/amdkfd: Use array to probe
kfd2kgd_calls") upstream, which is part of a larger series that did not
look reasonable for stable. I opted to just fix the warning in the same
manner as the prior patch, which is less risky and accomplishes the same
end result of no warning.

Colin Ian King (1):
  drm/amdkfd: add missing void argument to function kgd2kfd_init

Nathan Chancellor (1):
  drm/amdkfd: Fix -Wstrict-prototypes from
    amdgpu_amdkfd_gfx_10_0_get_functions()

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c | 2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_module.c            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)


base-commit: 2845ff3fd34499603249676495c524a35e795b45
-- 
2.35.1

