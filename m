Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4291865
	for <llvm@lists.linux.dev>; Mon, 11 Apr 2022 16:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2FF8C385A9;
	Mon, 11 Apr 2022 16:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649695421;
	bh=P6kNXqgtIDflfg4Owki6sH0KoN+WyNIeOO/oXvVxNXY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hjMixZcJDSS7zCDeVH5g93ATIMlm/0aJCdn3P1/8DHz7dRxQex90SRWnxT4c7IlKQ
	 iRrB0BcMPGNkCk6qIjnymacz1sEeBHpE33wfP9ABqbgVOSG7I4Ye76bb/z4dQdXefb
	 FtmBjfQVcy5gc5f15Tjnon4OA1MuJSJ99sZZ99kc+zXtUt9oc/5aSW9zDXX3TK7wex
	 vmmxmkBBnYt0v5MOrF2FDSFycHFcsTvP68hbQZyBO/PtTUB7HjY8QNVRYzRMhU4txm
	 T4ODrMOkwWNS8cV9L/Lehfk1eUbWtoCIBvgYRW4S2gZB7czKAuWPZi11uI3ynqJtLZ
	 5Q96qUL2vciBw==
From: Nathan Chancellor <nathan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	amd-gfx@lists.freedesktop.org,
	llvm@lists.linux.dev,
	stable@vger.kernel.org,
	Colin Ian King <colin.king@canonical.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 5.4 1/2] drm/amdkfd: add missing void argument to function kgd2kfd_init
Date: Mon, 11 Apr 2022 09:43:07 -0700
Message-Id: <20220411164308.2491139-2-nathan@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411164308.2491139-1-nathan@kernel.org>
References: <20220411164308.2491139-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Colin Ian King <colin.king@canonical.com>

commit 63617d8b125ed9f674133dd000b6df58d6b2965a upstream.

Function kgd2kfd_init is missing a void argument, add it
to clean up the non-ANSI function declaration.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Colin Ian King <colin.king@canonical.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_module.c b/drivers/gpu/drm/amd/amdkfd/kfd_module.c
index 986ff52d5750..f4b7f7e6c40e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_module.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_module.c
@@ -82,7 +82,7 @@ static void kfd_exit(void)
 	kfd_chardev_exit();
 }
 
-int kgd2kfd_init()
+int kgd2kfd_init(void)
 {
 	return kfd_init();
 }
-- 
2.35.1

