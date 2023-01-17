Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2C78BFC
	for <llvm@lists.linux.dev>; Tue, 17 Jan 2023 17:39:57 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id v3so22537386pgh.4
        for <llvm@lists.linux.dev>; Tue, 17 Jan 2023 09:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XK7xzdzdVe8CAOdpvnaMlGGiF3ESCl5P5F97tw3Hmvg=;
        b=Bo/fvXvQjMj2VkfNfsG2/XkizXgJueapBJER2ZI5hoyThFRdHPDLfDEWHax8kqkUnu
         rhCvjfeJBSJp57/LgGBStLlQ+V1dTU8CRMrnnJcZzQfNNN7wkkSBWdbeDwju5gDaXRZO
         snC0/uTv9HYHju7rfgUaDawdhqNzat1jwwJVA40UISoxLice8ydvtcgME3HWm8mNFOHD
         J/mPYbcBuAb5twGkIGywQTVK+jOkNQW2XVgTcn23nUTaORTUw4Kgpabow1kRDRWGzZPa
         A1S8ZV2KU9ogph6ebuVar0k7i1dyLkexssoW61wdfUIuOi+Yask/PtExCbqVPZ34sdZX
         RT0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XK7xzdzdVe8CAOdpvnaMlGGiF3ESCl5P5F97tw3Hmvg=;
        b=5bTlA93DfDMH8m+yjZd4hrvPuAvqMjzKZiphBUfotkLb6Vj01KEwUkLEqs/1PxatpR
         U6fmGsIR5P0URcPc7GpvsTT9n2k1dSBX4P4IAQnRv3uQb8ahLjK95IcHeN5loMHia6Z6
         QOZHC20iNKd5+Y9dnAqoeIy3yh1HPE0Vl7VTPKdjK5AX4bxe7iLe97fQnPiTZNyIfhyK
         OglHEdDVuJ2b1MhmktSJiftISb/UOyakmFEFDAOY4VGCDsYsO1JQKdbREo9C+WuJ7Jq1
         4gG8aYqsoQgAoKQlAnh6rblX1ZRxMYQ/oA9fHF03a73AoAe2gf22+KqZX9j1JAGM61dV
         Xo6A==
X-Gm-Message-State: AFqh2komMR7WP2RkuwXEyFf3iLZ6T6RgzEgYxV7Fx0/nOlmPB6MyEFO0
	1T/nZd/CbG5x9ttXhVlwPivQY6qy1QeMJiJwoCRooQ==
X-Google-Smtp-Source: AMrXdXveAFX9cyZAAbfPqAt2oTkm5zlLnLt9gJol5S7J+lqdFJfIu+5uFGMXlrnRISTw3fQbg7WhXp2PvPQreY1MuRc=
X-Received: by 2002:a65:6c15:0:b0:492:703:3f03 with SMTP id
 y21-20020a656c15000000b0049207033f03mr366761pgu.403.1673977196822; Tue, 17
 Jan 2023 09:39:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230117172825.3170190-1-arnd@kernel.org>
In-Reply-To: <20230117172825.3170190-1-arnd@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 17 Jan 2023 09:39:45 -0800
Message-ID: <CAKwvOdn5dubVN6qetnWJgHb-wektML_ptQ53M2JBgOeX_+r9Jg@mail.gmail.com>
Subject: Re: [PATCH] mlx5: reduce stack usage in mlx5_setup_tc
To: Arnd Bergmann <arnd@kernel.org>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Maxim Mikityanskiy <maximmi@nvidia.com>, Gal Pressman <gal@nvidia.com>, Lama Kayal <lkayal@nvidia.com>, 
	Moshe Tal <moshet@nvidia.com>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 17, 2023 at 9:28 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Clang warns about excessive stack usage on 32-bit targets:
>
> drivers/net/ethernet/mellanox/mlx5/core/en_main.c:3597:12: error: stack frame size (1184) exceeds limit (1024) in 'mlx5e_setup_tc' [-Werror,-Wframe-larger-than]
> static int mlx5e_setup_tc(struct net_device *dev, enum tc_setup_type type,
>
> It turns out that both the mlx5e_setup_tc_mqprio_dcb() function and
> the mlx5e_safe_switch_params() function it calls have a copy of
> 'struct mlx5e_params' on the stack, and this structure is fairly
> large.

The logic changes LGTM, but were the noinline_for_stack left behind
from earlier local revisions? Do we still need those if these structs
have been moved from the stack?

>
> Use dynamic allocation for both.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  .../net/ethernet/mellanox/mlx5/core/en_main.c | 36 ++++++++++++-------
>  1 file changed, 23 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
> index 6bb0fdaa5efa..e5198c26e383 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
> @@ -2993,37 +2993,42 @@ static int mlx5e_switch_priv_channels(struct mlx5e_priv *priv,
>         return err;
>  }
>
> -int mlx5e_safe_switch_params(struct mlx5e_priv *priv,
> +noinline_for_stack int mlx5e_safe_switch_params(struct mlx5e_priv *priv,
>                              struct mlx5e_params *params,
>                              mlx5e_fp_preactivate preactivate,
>                              void *context, bool reset)
>  {
> -       struct mlx5e_channels new_chs = {};
> +       struct mlx5e_channels *new_chs;
>         int err;
>
>         reset &= test_bit(MLX5E_STATE_OPENED, &priv->state);
>         if (!reset)
>                 return mlx5e_switch_priv_params(priv, params, preactivate, context);
>
> -       new_chs.params = *params;
> +       new_chs = kzalloc(sizeof(*new_chs), GFP_KERNEL);
> +       if (!new_chs)
> +               return -ENOMEM;
> +       new_chs->params = *params;
>
> -       mlx5e_selq_prepare_params(&priv->selq, &new_chs.params);
> +       mlx5e_selq_prepare_params(&priv->selq, &new_chs->params);
>
> -       err = mlx5e_open_channels(priv, &new_chs);
> +       err = mlx5e_open_channels(priv, new_chs);
>         if (err)
>                 goto err_cancel_selq;
>
> -       err = mlx5e_switch_priv_channels(priv, &new_chs, preactivate, context);
> +       err = mlx5e_switch_priv_channels(priv, new_chs, preactivate, context);
>         if (err)
>                 goto err_close;
>
> +       kfree(new_chs);
>         return 0;
>
>  err_close:
> -       mlx5e_close_channels(&new_chs);
> +       mlx5e_close_channels(new_chs);
>
>  err_cancel_selq:
>         mlx5e_selq_cancel(&priv->selq);
> +       kfree(new_chs);
>         return err;
>  }
>
> @@ -3419,10 +3424,10 @@ static void mlx5e_params_mqprio_reset(struct mlx5e_params *params)
>         mlx5e_params_mqprio_dcb_set(params, 1);
>  }
>
> -static int mlx5e_setup_tc_mqprio_dcb(struct mlx5e_priv *priv,
> +static noinline_for_stack int mlx5e_setup_tc_mqprio_dcb(struct mlx5e_priv *priv,
>                                      struct tc_mqprio_qopt *mqprio)
>  {
> -       struct mlx5e_params new_params;
> +       struct mlx5e_params *new_params;
>         u8 tc = mqprio->num_tc;
>         int err;
>
> @@ -3431,10 +3436,13 @@ static int mlx5e_setup_tc_mqprio_dcb(struct mlx5e_priv *priv,
>         if (tc && tc != MLX5E_MAX_NUM_TC)
>                 return -EINVAL;
>
> -       new_params = priv->channels.params;
> -       mlx5e_params_mqprio_dcb_set(&new_params, tc ? tc : 1);
> +       new_params = kmemdup(&priv->channels.params,
> +                            sizeof(priv->channels.params), GFP_KERNEL);
> +       if (!new_params)
> +               return -ENOMEM;
> +       mlx5e_params_mqprio_dcb_set(new_params, tc ? tc : 1);
>
> -       err = mlx5e_safe_switch_params(priv, &new_params,
> +       err = mlx5e_safe_switch_params(priv, new_params,
>                                        mlx5e_num_channels_changed_ctx, NULL, true);
>
>         if (!err && priv->mqprio_rl) {
> @@ -3445,6 +3453,8 @@ static int mlx5e_setup_tc_mqprio_dcb(struct mlx5e_priv *priv,
>
>         priv->max_opened_tc = max_t(u8, priv->max_opened_tc,
>                                     mlx5e_get_dcb_num_tc(&priv->channels.params));
> +
> +       kfree(new_params);
>         return err;
>  }
>
> @@ -3533,7 +3543,7 @@ static struct mlx5e_mqprio_rl *mlx5e_mqprio_rl_create(struct mlx5_core_dev *mdev
>         return rl;
>  }
>
> -static int mlx5e_setup_tc_mqprio_channel(struct mlx5e_priv *priv,
> +static noinline_for_stack int mlx5e_setup_tc_mqprio_channel(struct mlx5e_priv *priv,
>                                          struct tc_mqprio_qopt_offload *mqprio)
>  {
>         mlx5e_fp_preactivate preactivate;
> --
> 2.39.0
>


-- 
Thanks,
~Nick Desaulniers
