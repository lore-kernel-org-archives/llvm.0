Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107893;
	b=uhL6MyFXQlJWbXj1iuXATZZTjKfZGvWuNd8cD7Ni8qDMFpDbhMptNq/6i/G/rwUft/vY
	 A3o8HylTecclD0Cj3qMHcCs5Bv3DC5RU+/z0bsvaJxm/YgeUQ9p5dJpqLCyQGkKWgEpA1
	 zk1ymyGvAiC1xyzxvbfrhexgsAAYc7c3HrbHx6mVBSYnTjtt0t7VTNrvW2Z+RnLXMixuN
	 bFqtrBTPv7zYJhhpDIpVGrzry1LDKglZRCxYToylC0pVczb6XVOXWlfU/++ubKnAwSosR
	 mDvv2Svwj8BUt6mdRQkbOO5sF/rGdW9NI71b7nskKiCQRUGSajieMZL+2ZgFInrDynA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=9YrcN3VTHuAzKVwTFah/n0lO5UTQ+5t8mWxnZHt8ueo=;
	b=n2/h6JKVDPDlJHmPxkujHko3lpcm9f8lqkRGoYvhVn4UK6orL3Qbwm3Mv5wfbR7z+Umm
	 K4a+OMPeL9SZxB3DewfsJ8hMm83p4l0YWwlVvAv3lSZSjGDKoh5VYDT/XQgAZOMLoz5ef
	 cCxQNvycJRolCaqylgUuWT9TRkyG/2uKRyoPWPAuVAYotAqyo+TtDUecoeQiVRzUVHNsz
	 FLM3htH+ZGmAmsaxWw0XiO/q9jJxuQY2eyVC+qkVObpmuvsgcd+DcQGVlz2ucZbjPB2AO
	 bm5t66s+5UCA0rFW2xy8Rj3ho/t+mzWgF7C1Sz2KuE35CYM3dBeW+1pohmRiqQcAzGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=g1g9tsXA;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD4660A263E
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:04:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FD4660A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=g1g9tsXA
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3854627c1c8so243978eec.1
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107893; x=1795712693; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9YrcN3VTHuAzKVwTFah/n0lO5UTQ+5t8mWxnZHt8ueo=;
        b=g1g9tsXAWxu1AJe8RjQyINbf+Xvrl9S6YZ5Dl2S36gUycvh2WUqCK0SEIV6gy67B3s
         obcitb788zaacNeGd8MfElTjozhOr0xWJn0EVpg/nTAFNjHkLIpHF++tvmkFje4aYjbI
         A7TIVkypn3CoOD44aW7Gt3kqtJTxbf1jQQp8tJ93ZStiEeMDLT2wYzttxt7D+HcjG00h
         vBwqbce0sxyP4qd1pKtg+1CjDzy8ztGv7ARm7Az3AmXcJDKYwpz/f+rNp23IwU5GZ3gs
         9CVwEYK3Pd2zk+/U/U7V51DziZCF7CSClzboon3g3H3WpM6XFXiVrba5bChYnDR3I9Zx
         zWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107893; x=1795712693;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9YrcN3VTHuAzKVwTFah/n0lO5UTQ+5t8mWxnZHt8ueo=;
        b=0Yo4NbDVNy3MbmXD1sySb2W4rJSS4IVX8XG6Fjv90GIKN1ZKfx/KMNRbya0gORf60a
         mQCifMUj8g6RQ0OmC1gOaf57qLjAjihkPAsVjf8LrAOgOkrB9knUO90UE0hssqGFUzA/
         8YXq8+m/GxaFPFV2vschumEMmDt+qj8qwVrqsQzzw9xueQoT+fvWc2/rNlnyOXsuAdkj
         Rf7TKbXXOZiipMMJDAc/4uIX/voT5/psD66EsSedZYBMOe3GWpAkR0Fj/w9nWvJ1bMlB
         lFGY2s364uy09FcMbXzsx1YifIt719YS2RL/DNmPqR4iVe4PLL6QdLhx2cH+Kg8HQFcQ
         P1lg==
X-Forwarded-Encrypted: i=1; AL+hErH4IJt8xE/v3teHiuTpceA/WmUMfPNxiFokQzwr7gi5moylR+72GRj4ob20vh17IVQ9jN7n@lists.linux.dev
X-Gm-Message-State: APuU4Z8TiPMS8vyuLWHw8jTT0Aesbu3x9GiWOXf/a05xOWGxgNU6fdHo
	LLlVWkEM5OB3NunWvcII0ry8NS0/sG/YjQNV4LZ/Zm6Wlm7eAX1Unb0OY/LUvVBCJE7ViOHHC1P
	ZMZSBV1L3rg==
X-Received: from dycns21.prod.google.com ([2002:a05:7300:f795:b0:382:8cee:3808])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:881b:10b0:384:24d9:526b
 with SMTP id 5a478bee46e88-38424d953afmr2634367eec.26.1795107892359; Thu, 19
 Nov 2026 09:04:52 -0800 (PST)
Date: Thu, 19 Nov 2026 09:04:49 -0800
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170449.1513687-1-irogers@google.com>
Subject: [PATCH] xfs: initialize error in xfs_getfsmap_rtdev_rtbitmap()
From: Ian Rogers <irogers@google.com>
To: Carlos Maiolino <cem@kernel.org>
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

When xfs_getfsmap_rtdev_rtbitmap() was converted to iterate over realtime
groups with xfs_rtgroup_next_range(), 'error' was left uninitialized. If a
continuation or range-bounded FS_IOC_GETFSMAP query has start_rgno >
end_rgno (for example when keys[0].fmr_physical + keys[0].fmr_length lies
in a higher realtime group than keys[1].fmr_physical while both remain
below eofs), the while loop executes zero iterations and returns the
uninitialized stack variable 'error' directly to userspace as the ioctl()
return value.

Initialize 'error' to 0, matching xfs_getfsmap_rtdev_rmapbt().

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wconditional-uninitialized enabled; fix and changelog drafted with an AI
coding assistant. Build-tested with LLVM=1 W=1 and
-Wconditional-uninitialized; not runtime-tested on a live XFS realtime
filesystem.

Fixes: e3088ae2dcae ("xfs: move RT bitmap and summary information to the rtgroup")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 fs/xfs/xfs_fsmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/xfs/xfs_fsmap.c b/fs/xfs/xfs_fsmap.c
index 041bb2105ec6..3ccf3ce23332 100644
--- a/fs/xfs/xfs_fsmap.c
+++ b/fs/xfs/xfs_fsmap.c
@@ -760,7 +760,7 @@ xfs_getfsmap_rtdev_rtbitmap(
 	xfs_rgnumber_t			start_rgno, end_rgno;
 	struct xfs_rtgroup		*rtg = NULL;
 	uint64_t			eofs;
-	int				error;
+	int				error = 0;
 
 	eofs = XFS_FSB_TO_BB(mp, mp->m_sb.sb_rblocks);
 	if (keys[0].fmr_physical >= eofs)
-- 
2.56.1.708.g77570a6a1d-goog

