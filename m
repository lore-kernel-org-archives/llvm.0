Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3520B3B2FF3
	for <llvm@lists.linux.dev>; Sun, 19 Jul 2026 18:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784484020; cv=none; b=k6YFSLZ03rQtZlPbnloWmQdLe2NSrTPqtpjQALo6djRdF5Bc93eIryE7ix3Xbs412FxbIyUeRuAshq4jLCwuyK35pgdygbQmyiPZ23Pyxt6+0S9vfaBuqpukUQqZU0BeYIb7N/jtazY5IZ/8HWcuu9yO4dgo3fUKT6AaTFKv1sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784484020; c=relaxed/simple;
	bh=IWl/rQwPGM5RLLR3ae5FmKgiapEO5Ii89mk7y4WpFec=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tFeXyqtn/qnRdq+oWeD4lOsH0g8j5G+OzzyTdNqvQdY8fVQJmylXvH+49ejQ1HXct0RTMHtiCPM5SczVMp1m4IPmYN7rJZzJYL2wZpZcz8jLa7iG6+MfFJZs0yHUS03IimXm2YnFFjsW01GF3K5DMvwoNogOp2uozQI5MzhuX7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CyW4P91/; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CyW4P91/"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cf50c6f235so9776285ad.0
        for <llvm@lists.linux.dev>; Sun, 19 Jul 2026 11:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784484013; x=1785088813; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OjFgwGrb1ClX/kve0vswPTA8/2SHmC5jDANL46Jtr8I=;
        b=CyW4P91/TC3cr3wvSSQvwHliTgn6jTxuq1AJhkX0RT8PPBJfO24Ar8+AVSAwsEXGFy
         mfdHvJrXVoPI+wI2mv68R5jjQhOcjaoOXiBbqVKTjHCVeoeayxv6vo45xahpKfMlB6R5
         gOVPblD0DnUA7AonyJglnj0hcpTOSP8kXAg8VSVGcvsjhhhqcIO5pmgkaB6t2F8r+u4U
         fYC0dTSqZPeLGFaV5EzGpi8he0835gxMNW4ibLA7HF343II2+HxFZsh/dhoeZ0xMmIW7
         PPCuHId4ElzEUJUwh5JhnXNIbQ55WSThgSdRtY+hB8kiC47UCWf0myB+lwECYV1UpBxs
         rLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784484013; x=1785088813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OjFgwGrb1ClX/kve0vswPTA8/2SHmC5jDANL46Jtr8I=;
        b=jeiRnmVUBsLG9Vj0o2l59M7of7ekqzegsJtoPah1v2IiKAajqbCjJiynJgkcODzn//
         BU9AaNSp2lxXLkYqMnxZOahSvEjZCB1RAi/BZpVaMPzGrElkGvxjAFFGMPNfDVwE96Kp
         /GwHThKHCscg6WjI2cGO3yc7pzIV2KQe5ApbqHFuBD1SKktY27DuDhaK3lZMOi2p7nm0
         x9hwvPMNJ947jGbGwPTMtE8jSmaq0yYx1M0EjjL7CcunZ4YmIqYzu5Xv7SWhND4unhx+
         3eN7ORC7BF3gp9J1iCEGjyHdvQd4J3GNkaKyx0AC7eFiblmT03CtMKdxeY8dVe8wZgzF
         xu0w==
X-Forwarded-Encrypted: i=1; AHgh+Rq7o5ucJz0YDXjuGkQUryaz7/r13eUIKuLi3rjHAry2l6lR5/ctqsvuVsagwh4hSWSCDm9d@lists.linux.dev
X-Gm-Message-State: AOJu0Yzxd/GXC4SE2KOPrg7XhDdaLKlPrzbPV8SvZpW9+9AAVBtHV1uz
	x+Jtos1oSvRnhtLiVUYleJVW7fDL0SctI1pztubxpdRs74aMSiQBWgWx
X-Gm-Gg: AfdE7clalvOxdJ82k0uRr7SFxsK2oJ390OfJ3R89ItBo0ILyjr4ahgbNtaDIS+wn2G1
	rWTjNQ0+jcb4ti4zpWeL1K658F7jp1zmD3Jc/ZwTWY516WqxakXd3US6x9/60509zHqMGw+zcA+
	9/puKu2cwU12svC9M3Q1rn2cgEgtw25t2evkUO0QrK+xinJkX09+Tt+gxhP30qG34faxBZf3J0L
	xlHWRwqF/40FLmtqCn1PITBw3AAZG1c13ujQqxaf9x1pgUQNxesk/uAKYmEY3+zgCLOJXEyb+Zp
	boRb/dna1cZx4PLHsAG6j7QVBoa13oiYzTkvLQl/sHBXeh5bFrzknoq08/JzmEIBZOYqO4/FB/j
	Qp04xi+c7ZcQxiPi/J7KUrnsMvpQ5mBpfcOZjm+HrcwWDfDqE4MdxYZF2QIBaA3k4lg==
X-Received: by 2002:a17:903:988:b0:2cc:f5aa:9513 with SMTP id d9443c01a7336-2cf34821a87mr130472895ad.10.1784484013524;
        Sun, 19 Jul 2026 11:00:13 -0700 (PDT)
Received: from ap.. ([182.213.254.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf34769bd6sm43511065ad.74.2026.07.19.11.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 11:00:13 -0700 (PDT)
From: Taehee Yoo <ap420073@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	Alexei Starovoitov <ast@kernel.org>,
	amd-gfx@lists.freedesktop.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Andrii Nakryiko <andrii@kernel.org>,
	Bill Wendling <morbo@google.com>,
	bpf@vger.kernel.org,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	David Airlie <airlied@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Donald Hunter <donald.hunter@gmail.com>,
	dri-devel@lists.freedesktop.org,
	Eduard Zingerman <eddyz87@gmail.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Eric Dumazet <edumazet@google.com>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Hoyeon Lee <hoyeon.rhee@gmail.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Justin Stitt <justinstitt@google.com>,
	Kees Cook <kees@kernel.org>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	linaro-mm-sig@lists.linaro.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	llvm@lists.linux.dev,
	Mark Bloch <mbloch@nvidia.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Michael Chan <michael.chan@broadcom.com>,
	Nathan Chancellor <nathan@kernel.org>,
	netdev@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Shuah Khan <shuah@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Simon Horman <horms@kernel.org>,
	Song Liu <song@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Taehee Yoo <ap420073@gmail.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Yonghong Song <yonghong.song@linux.dev>
Subject: [RFC PATCH net-next 03/13] net: core: add XDP_MODE_HW offload hook for knod
Date: Sun, 19 Jul 2026 17:58:47 +0000
Message-ID: <20260719175857.4071636-4-ap420073@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260719175857.4071636-1-ap420073@gmail.com>
References: <20260719175857.4071636-1-ap420073@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Route XDP program install/uninstall to the knod accelerator when a
device is attached, so BPF programs run on the accelerator instead of
the host.

Signed-off-by: Taehee Yoo <ap420073@gmail.com>
(cherry picked from commit 9689730acf7d6e4d34cd677e4615be10856c709c)
---
 net/core/dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index 7c21bc0a1e34..5ba1c969029b 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -10334,7 +10334,7 @@ static int dev_xdp_install(struct net_device *dev, enum bpf_xdp_mode mode,
 		return -EBUSY;
 	}
 
-	if (dev_get_min_mp_channel_count(dev)) {
+	if (dev_get_min_mp_channel_count(dev) && mode != XDP_MODE_HW) {
 		NL_SET_ERR_MSG(extack, "unable to install XDP to device using memory provider");
 		return -EBUSY;
 	}
-- 
2.43.0

