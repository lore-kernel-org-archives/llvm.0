Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A88766683
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 18:07:50 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-692779f583fso10785348b3a.0
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 11:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696010870; x=1696615670; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZNuuPDo9it8tkX6qPOGwJo4GQ7mQ5hyHXJpkMAiaQU=;
        b=HuXwFxoQWOrHRfdSgDRhG41tz0eVsMWdXYOdvHqi04hRdcc5nZ6zu3xdBHsUr9fQsI
         UX7ekiVLps5qZr//syZIv4HqSD8s4TjGLA1Rwov5lHIz+hVDijPdzC+yVrErU9GPNo0c
         W/oh1ieCOQ40d0061zkB8tCLgh+yzRs8d0tIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696010870; x=1696615670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZNuuPDo9it8tkX6qPOGwJo4GQ7mQ5hyHXJpkMAiaQU=;
        b=MfLT98ixc7BOe/JAwqzLOQfgfhOj69cKy4zehptxvWzFX8Dx0dQwQQ9/omKPm+Ruk0
         S7HJxfarpel1C4km0i3YnXdA2ERp0LP4vn5RkBzkFj3BDAKa6vorGn9Vzw9dgxefRIdH
         K1pkLMrxF8ezfiS4Fv+TSO2iTk3CU3zq3k5uDgRaBe9Jxlvh0W8lDwywt5RfPMO73WGh
         Lg/AwU7E0tOuRD58r6tFOuNDJZz6sw3wdyNn3XQ47CG+nWKNzj2VTmJbkD80vRZWDpqe
         m6SbzqoMg7974ebE7Ruz8We11hIRYrxYWBoC8dlXtITOShsO0vWwovYmPnSJP5NA4+8N
         eGLg==
X-Gm-Message-State: AOJu0Yw2umh3XiJYcZOTghFFm4o/suUhaA1b7fl90RUAYW9E4b3sw6C0
	KizbmUdf+3DYk94CjNPUK6Nf6w==
X-Google-Smtp-Source: AGHT+IFJ95BU6niyoo2gApDZnCXcDkP0dSKiwEwps//qgcxM63JrZFlYbqCMoWXf0lhhCnJHW9sTvw==
X-Received: by 2002:a05:6a20:158e:b0:160:18d6:a3d7 with SMTP id h14-20020a056a20158e00b0016018d6a3d7mr5378517pzj.1.1696010868900;
        Fri, 29 Sep 2023 11:07:48 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id c13-20020a170902d48d00b001bee782a1desm17055007plg.181.2023.09.29.11.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 11:07:47 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Ido Schimmel <idosch@nvidia.com>
Cc: Kees Cook <keescook@chromium.org>,
	Petr Machata <petrm@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 4/5] mlxsw: spectrum_router: Annotate struct mlxsw_sp_nexthop_group_info with __counted_by
Date: Fri, 29 Sep 2023 11:07:43 -0700
Message-Id: <20230929180746.3005922-4-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929180611.work.870-kees@kernel.org>
References: <20230929180611.work.870-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1562; i=keescook@chromium.org;
 h=from:subject; bh=B8keI90TRW2q45uUonlCrEQKui4OLUvrgLBebVNQ9NA=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlFxJv3gQ2icCiNvzN2SrB6CO5vY/Quxy8Fmvkp
 MWA5zi05RKJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZRcSbwAKCRCJcvTf3G3A
 JlMgD/9KspItI7uRPQsQk5b1n6wj1VGlU6uDB/MzB8j7BFvYACH75tHJ6+EtAxCMs6WH2/1xOJB
 Zc//rKE5ME8cSKtfDy2yuCaWHFyuMkgN1a33v24+KmVjWOC8Z/QjFt5svRWte8710RTditYZOT7
 XKykSAvsTe4/HJALIvV4CYJjTF4uavOTyu5UlYB7ZHjBBe0+VR+xepIZPkEjOgCYBRLh7lX/MeG
 fr3kiTfV1+0L6p5GA+Jbl2WymK1k56AOkQZXyBngR74bpIruI0iJJdu0vJKwC30V3SHQujqCe2k
 z598oohT+Wnd0x8ojB3RKTl1Kd1jHRSPN3uXlaIEIr33yM8vKL4PaoYIRnE6ZAh4LB8XeMkhrF2
 AQjtjTNgvq05sJ/iwgNhIjSE0TzGlV8uwf6IBWDELikCMijBFN2BhQg5lXOlI9ZzjV39Pv6Ghbg
 IEa8dbjv8XLSyhtIAWT9wZq+uOFfvYMeRwC/ff+Qeqx7S0B97oA19xAfKE2Ug/0eKSAwybHM0Ao
 eEzDT1/Q9mpQFcEl0vrNwq17gJM2cUasPKjBnI1W7aqj+rez0GpJxzyho+3j2K9MSMxbW2cqrw1
 nPBe7q3r8weENye2KqEWW5tjD5rkm2B1ikBvcdhkjlR/5K3OlyydwoM7dgEWGY1p0uLg0xY5rcC kErWnebJxPj8H3A==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct mlxsw_sp_nexthop_group_info.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Ido Schimmel <idosch@nvidia.com>
Cc: Petr Machata <petrm@nvidia.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
index debd2c466f11..82a95125d9ca 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
@@ -3107,7 +3107,7 @@ struct mlxsw_sp_nexthop_group_info {
 	   gateway:1, /* routes using the group use a gateway */
 	   is_resilient:1;
 	struct list_head list; /* member in nh_res_grp_list */
-	struct mlxsw_sp_nexthop nexthops[];
+	struct mlxsw_sp_nexthop nexthops[] __counted_by(count);
 };
 
 static struct mlxsw_sp_rif *
-- 
2.34.1

