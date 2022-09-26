Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80ED7B
	for <llvm@lists.linux.dev>; Mon, 26 Sep 2022 10:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0484AC433C1;
	Mon, 26 Sep 2022 10:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1664188822;
	bh=ayO3WIFiJihs2MM+opQbImdBIj0AnX09GvLi7XT6pkk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=scEmFJqAcLIYWsS2SCHfhUVuH8Z+ct9Ip+VRYhr2XB4aaLWrXIk7CQrAhFlGJkVtj
	 os6EQtah027ZAvpyTer3EKwdv18kxViPJCbS4pJytcc0Argr/sL8+C4EuYBqpQbQSk
	 VV+/vwYfMzw7lo90RhFLghJokJBb6Ouxj79EkunA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>,
	llvm@lists.linux.dev,
	Nathan Huckleberry <nhuck@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.15 133/148] drm/rockchip: Fix return type of cdn_dp_connector_mode_valid
Date: Mon, 26 Sep 2022 12:12:47 +0200
Message-Id: <20220926100801.201481338@linuxfoundation.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220926100756.074519146@linuxfoundation.org>
References: <20220926100756.074519146@linuxfoundation.org>
User-Agent: quilt/0.67
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Nathan Huckleberry <nhuck@google.com>

[ Upstream commit b0b9408f132623dc88e78adb5282f74e4b64bb57 ]

The mode_valid field in drm_connector_helper_funcs is expected to be of
type:
enum drm_mode_status (* mode_valid) (struct drm_connector *connector,
				     struct drm_display_mode *mode);

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of cdn_dp_connector_mode_valid should be changed from
int to enum drm_mode_status.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20220913205555.155149-1-nhuck@google.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index 13c6b857158f..6b5d0722afa6 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -277,8 +277,9 @@ static int cdn_dp_connector_get_modes(struct drm_connector *connector)
 	return ret;
 }
 
-static int cdn_dp_connector_mode_valid(struct drm_connector *connector,
-				       struct drm_display_mode *mode)
+static enum drm_mode_status
+cdn_dp_connector_mode_valid(struct drm_connector *connector,
+			    struct drm_display_mode *mode)
 {
 	struct cdn_dp_device *dp = connector_to_dp(connector);
 	struct drm_display_info *display_info = &dp->connector.display_info;
-- 
2.35.1



