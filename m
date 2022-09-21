Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240145C9C
	for <llvm@lists.linux.dev>; Wed, 21 Sep 2022 15:54:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B670EC433B5;
	Wed, 21 Sep 2022 15:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663775676;
	bh=YK4PKi78mPSYr1dez8eX75MboN5ZOy+NdJ94NHqrFdc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SkP5YzD62tde8GNbQ1T3RI2O6pwm8KpFbchGkOQQc2BB01Uz6IDYY6PZnkXAh9WGZ
	 iQpC4RM9ujWkWcUs/GlbprxvJKraS3bnXGqc1iwz+dETAGK+c/miLE58fbagwlphJn
	 aghEhqOS7gMaHKyuZnwPOj4mCAxhlBHwNuRlopV46hsjw4QMte2h8bc+N5/bkgKoi4
	 3QvDYIHTIUf2BstOSRr2wwfX49ryvk5RHPLAkXlGfoC9hRdvuH8K4L8XUfgBN1YeFN
	 P7XvOQTZ37VIb69JbENCuzcIZGz1OGm2YXK5dT6Z1oz8gzo7NG9rmoabraaUxFFXQ1
	 eZiXrO1A0yK4Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>,
	"Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Sasha Levin <sashal@kernel.org>,
	harry.wentland@amd.com,
	sunpeng.li@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com,
	airlied@linux.ie,
	daniel@ffwll.ch,
	ndesaulniers@google.com,
	aurabindo.pillai@amd.com,
	andrealmeid@igalia.com,
	Bing.Guo@amd.com,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	llvm@lists.linux.dev
Subject: [PATCH AUTOSEL 5.10 6/7] drm/amd/display: Mark dml30's UseMinimumDCFCLK() as noinline for stack usage
Date: Wed, 21 Sep 2022 11:54:24 -0400
Message-Id: <20220921155425.235273-6-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220921155425.235273-1-sashal@kernel.org>
References: <20220921155425.235273-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Nathan Chancellor <nathan@kernel.org>

[ Upstream commit 41012d715d5d7b9751ae84b8fb255e404ac9c5d0 ]

This function consumes a lot of stack space and it blows up the size of
dml30_ModeSupportAndSystemConfigurationFull() with clang:

  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:3542:6: error: stack frame size (2200) exceeds limit (2048) in 'dml30_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
  void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
       ^
  1 error generated.

Commit a0f7e7f759cf ("drm/amd/display: fix i386 frame size warning")
aimed to address this for i386 but it did not help x86_64.

To reduce the amount of stack space that
dml30_ModeSupportAndSystemConfigurationFull() uses, mark
UseMinimumDCFCLK() as noinline, using the _for_stack variant for
documentation. While this will increase the total amount of stack usage
between the two functions (1632 and 1304 bytes respectively), it will
make sure both stay below the limit of 2048 bytes for these files. The
aforementioned change does help reduce UseMinimumDCFCLK()'s stack usage
so it should not be reverted in favor of this change.

Link: https://github.com/ClangBuiltLinux/linux/issues/1681
Reported-by: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
Tested-by: Maíra Canal <mairacanal@riseup.net>
Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
index 2663f1b31842..e427f4ffa080 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
@@ -6653,8 +6653,7 @@ static double CalculateUrgentLatency(
 	return ret;
 }
 
-
-static void UseMinimumDCFCLK(
+static noinline_for_stack void UseMinimumDCFCLK(
 		struct display_mode_lib *mode_lib,
 		int MaxInterDCNTileRepeaters,
 		int MaxPrefetchMode,
-- 
2.35.1

