Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A4C28EC
	for <llvm@lists.linux.dev>; Tue, 17 Jan 2023 17:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96A2AC433EF;
	Tue, 17 Jan 2023 17:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673976512;
	bh=2LdqyXJpT5P5ecE3clObEutt8QLKp6SjRR2Se4pAym4=;
	h=From:To:Cc:Subject:Date:From;
	b=bVn6i/mGFHrv/l+OTMcsK66ZkPjtpUGd55ZD4ZBUs6MkBqwtM/zl1QrLEY5Koj4KV
	 nMXvTJkY7iPFNrf3GG4Gg6nUTM0Xf0cR4up9BDI7HlHs4lU69E5BSw8hMeN0s6FIBf
	 2MVkbu+xbPlNW6Y+up/Fg82RbNh3sPZckH21iZQtO7URw+IKSSTeaeqo9dl7S9mKXD
	 K3HaxC94lzO/EBMVB7iQ6Z9UBUO/7UHqKtdQUfS+Q9nnMTqqZw3bDZUmjtUqO5ZlML
	 NroP83zqVumB8zadW4CFJJ6aJSWYVWZrAR4KevqFjCHRyj7eanqpmhjUHY9C3XKUYo
	 J5xUTq1d4jK+w==
From: Arnd Bergmann <arnd@kernel.org>
To: Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Maxim Mikityanskiy <maximmi@nvidia.com>,
	Gal Pressman <gal@nvidia.com>,
	Lama Kayal <lkayal@nvidia.com>,
	Moshe Tal <moshet@nvidia.com>,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] mlx5: reduce stack usage in mlx5_setup_tc
Date: Tue, 17 Jan 2023 18:28:11 +0100
Message-Id: <20230117172825.3170190-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Clang warns about excessive stack usage on 32-bit targets:

drivers/net/ethernet/mellanox/mlx5/core/en_main.c:3597:12: error: stack frame size (1184) exceeds limit (1024) in 'mlx5e_setup_tc' [-Werror,-Wframe-larger-than]
static int mlx5e_setup_tc(struct net_device *dev, enum tc_setup_type type,

It turns out that both the mlx5e_setup_tc_mqprio_dcb() function and
the mlx5e_safe_switch_params() function it calls have a copy of
'struct mlx5e_params' on the stack, and this structure is fairly
large.

Use dynamic allocation for both.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../net/ethernet/mellanox/mlx5/core/en_main.c | 36 ++++++++++++-------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
index 6bb0fdaa5efa..e5198c26e383 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
@@ -2993,37 +2993,42 @@ static int mlx5e_switch_priv_channels(struct mlx5e_priv *priv,
 	return err;
 }
 
-int mlx5e_safe_switch_params(struct mlx5e_priv *priv,
+noinline_for_stack int mlx5e_safe_switch_params(struct mlx5e_priv *priv,
 			     struct mlx5e_params *params,
 			     mlx5e_fp_preactivate preactivate,
 			     void *context, bool reset)
 {
-	struct mlx5e_channels new_chs = {};
+	struct mlx5e_channels *new_chs;
 	int err;
 
 	reset &= test_bit(MLX5E_STATE_OPENED, &priv->state);
 	if (!reset)
 		return mlx5e_switch_priv_params(priv, params, preactivate, context);
 
-	new_chs.params = *params;
+	new_chs = kzalloc(sizeof(*new_chs), GFP_KERNEL);
+	if (!new_chs)
+		return -ENOMEM;
+	new_chs->params = *params;
 
-	mlx5e_selq_prepare_params(&priv->selq, &new_chs.params);
+	mlx5e_selq_prepare_params(&priv->selq, &new_chs->params);
 
-	err = mlx5e_open_channels(priv, &new_chs);
+	err = mlx5e_open_channels(priv, new_chs);
 	if (err)
 		goto err_cancel_selq;
 
-	err = mlx5e_switch_priv_channels(priv, &new_chs, preactivate, context);
+	err = mlx5e_switch_priv_channels(priv, new_chs, preactivate, context);
 	if (err)
 		goto err_close;
 
+	kfree(new_chs);
 	return 0;
 
 err_close:
-	mlx5e_close_channels(&new_chs);
+	mlx5e_close_channels(new_chs);
 
 err_cancel_selq:
 	mlx5e_selq_cancel(&priv->selq);
+	kfree(new_chs);
 	return err;
 }
 
@@ -3419,10 +3424,10 @@ static void mlx5e_params_mqprio_reset(struct mlx5e_params *params)
 	mlx5e_params_mqprio_dcb_set(params, 1);
 }
 
-static int mlx5e_setup_tc_mqprio_dcb(struct mlx5e_priv *priv,
+static noinline_for_stack int mlx5e_setup_tc_mqprio_dcb(struct mlx5e_priv *priv,
 				     struct tc_mqprio_qopt *mqprio)
 {
-	struct mlx5e_params new_params;
+	struct mlx5e_params *new_params;
 	u8 tc = mqprio->num_tc;
 	int err;
 
@@ -3431,10 +3436,13 @@ static int mlx5e_setup_tc_mqprio_dcb(struct mlx5e_priv *priv,
 	if (tc && tc != MLX5E_MAX_NUM_TC)
 		return -EINVAL;
 
-	new_params = priv->channels.params;
-	mlx5e_params_mqprio_dcb_set(&new_params, tc ? tc : 1);
+	new_params = kmemdup(&priv->channels.params,
+			     sizeof(priv->channels.params), GFP_KERNEL);
+	if (!new_params)
+		return -ENOMEM;
+	mlx5e_params_mqprio_dcb_set(new_params, tc ? tc : 1);
 
-	err = mlx5e_safe_switch_params(priv, &new_params,
+	err = mlx5e_safe_switch_params(priv, new_params,
 				       mlx5e_num_channels_changed_ctx, NULL, true);
 
 	if (!err && priv->mqprio_rl) {
@@ -3445,6 +3453,8 @@ static int mlx5e_setup_tc_mqprio_dcb(struct mlx5e_priv *priv,
 
 	priv->max_opened_tc = max_t(u8, priv->max_opened_tc,
 				    mlx5e_get_dcb_num_tc(&priv->channels.params));
+
+	kfree(new_params);
 	return err;
 }
 
@@ -3533,7 +3543,7 @@ static struct mlx5e_mqprio_rl *mlx5e_mqprio_rl_create(struct mlx5_core_dev *mdev
 	return rl;
 }
 
-static int mlx5e_setup_tc_mqprio_channel(struct mlx5e_priv *priv,
+static noinline_for_stack int mlx5e_setup_tc_mqprio_channel(struct mlx5e_priv *priv,
 					 struct tc_mqprio_qopt_offload *mqprio)
 {
 	mlx5e_fp_preactivate preactivate;
-- 
2.39.0

