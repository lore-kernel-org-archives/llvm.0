Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795323207;
	b=ZmBpeT6rYahtJ8yQhzDN3MyYmoZVEsbiWxJ6x941i2DRkP/Pslzhy/UcRBjirwq/FbA6
	 axqC/9OOvH2NkjSZjUw9t3dEj9jivhLWNEcd1kHGhzYpbFyXgqs8Zn3ICGpvvUFpvqed2
	 SgcAzz6MAhVp1fudVtJtAH0mjMrbALNx5RacqVaVs1Q5DMObgaJEVHz+nwfMTICN3VlPQ
	 ZthFV1mGAEzcPXotWxCBHeGKhYx7ZguUbqdAGX7gtRduILGfmjsE1kJCJzP98jkHTVDPI
	 kRqG56zQzhrXqg3EAcOYwLZ9j/TSVBRYbMVuqM+ZS6UiSDobnD4htj8oZwepU9wQEpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795323207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=R+8LakRjMdDQ9LrYjApbpVrM7y/vhgkxVS30t5HKZuE=;
	b=AHZE0GnD+31kAFl9BOAgyogKyLe3EpIWMV4D1QJeB62Op8/6kvSyAWbTLwI6euM0AItc
	 anO9xD9oCoh8c89a4Ykng8VGNhlOvZei4hUBpLsA6BAomA/1NwQla5tK78w6FvGim3xsn
	 3J/aP2nLhBUnhHJ5xZ036lkltStRocS+ASjjg/NWWh2ki0NEM1lok8EH7QzqAgSUWzHdy
	 MLwnxICc2SC7NIBEWfNoD/2pk5JKp5B4n7hfcYSF9LYNlo7PJhajbH+0okB3PWSw9U7Z8
	 L5RFOHJNcbbAaTSPnNMesrqJ12zHpHkZk2S/HJMY1MimIsitFlpTMOQNupwkAQ1zVTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gZ3O5IJQ;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D7C606A330
	for <llvm@lists.linux.dev>; Sun, 22 Nov 2026 04:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48D7C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gZ3O5IJQ
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386177b0516so6148293eec.1
        for <llvm@lists.linux.dev>; Sat, 21 Nov 2026 20:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795323206; x=1795928006; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R+8LakRjMdDQ9LrYjApbpVrM7y/vhgkxVS30t5HKZuE=;
        b=gZ3O5IJQniceCHZiwRdsLjuqjvTXmgRYhaZ9eo8oZX6hpvpB1ydRAUn7chjyzjKWtr
         90q9+HDpTud2IM/dd8Mnc+nDoui0ggT7B2ElEQVlhFpkCMLVnBTDd2FsuuHJgxHcPIWA
         DhuFfati5PV/qg/jpgTz4In0CQvuoyiABE8cpDaJ7JRw2vEoOZOM+Az/WygnVTOzvE0l
         FpJzyd6L5slevIau/cpFSrEqqMZGm5hM9+jQCJbNjRckElKyRaCHnfuMSaaIScZViXs5
         O0axvIgld2Jj+r908uiwCfxa/Z9Ncv2/qE4NeWF+S07OgBBVlbsMvLFyuxZkuMdpAuiX
         z4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795323206; x=1795928006;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R+8LakRjMdDQ9LrYjApbpVrM7y/vhgkxVS30t5HKZuE=;
        b=zOAfflkTAKnzTA4g5P7vS2oYSMnZzQ1Q+t2l0uHR4mjOFo6YZ9AkcSPje0RzXPDoJT
         Yv00lrrmC7721TnO3SPVhbap9tcCfnNzCljVYGZqEgMMS2wUb+AD9pwOMtZpVv1ho1XR
         /p9w8rHb++p6vM8hFSbotDqLANZod2Xd4gigLkE2/jnwrypRMWUxgDXhild5knJ6Lcsc
         rtHKrDzPBeMclBpuke5I9UIrJYyKpQ5sejPSKJ8esEbLkQKAma1MnI7COi7szeu/GjPC
         eiO1xMQZU6YljxxA6+mlePOOExvRGYIX0LjV+ryAshNnhrqWLFj/K6qVaNVGf14gxh6B
         uQTg==
X-Forwarded-Encrypted: i=1; AL+hErHo8P0JdlR6Alz42Kwj/bMVB8UqnG3p4fH1i1mTVfoUeHMtnAiqIHfDgmDUc8O3UiD7d7w7@lists.linux.dev
X-Gm-Message-State: APuU4Z+5EfLZEXSlamlBjaxX+irOt0MI9U1O5QPxuxg0mYX2Cfn+N+pV
	yCyL8otlJX09n4h4+Y+5x4pZgTWW0Lno1hp/OiWdgTc/QKXqGrpWezEJhOzC3xTRms52dAXmBRP
	AGnXUb3dnFw==
X-Received: from dyvp7.prod.google.com ([2002:a05:693c:8847:b0:386:9ad3:91d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:fd06:b0:369:f05d:6c5c
 with SMTP id 5a478bee46e88-3856f549471mr8286070eec.28.1795323206053; Sat, 21
 Nov 2026 20:53:26 -0800 (PST)
Date: Sat, 21 Nov 2026 20:53:17 -0800
In-Reply-To: <20261122045319.18651-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261122045319.18651-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261122045319.18651-3-irogers@google.com>
Subject: [PATCH v2 2/2] drm/amdgpu: initialize r in amdgpu_ttm_clear_buffer()
From: Ian Rogers <irogers@google.com>
To: Alex Deucher <alexander.deucher@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In amdgpu_ttm_clear_buffer(), 'r' is declared uninitialized. When
consider_clear_status is true (such as AMDGPU_GEM_CREATE_VRAM_CLEARED
allocations) and all backing buddy blocks already have DRM_BUDDY_CLEARED
set, every iteration of the cursor loop hits 'continue' without assigning
'r', returning uninitialized stack memory to amdgpu_bo_create().

Set 'r =3D 0' after the cursor loop directly before the 'error:' label.

Found via an x86_64 LLVM=3D1 (Clang 21.1.8) allyesconfig audit with
-Wconditional-uninitialized enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=3D1 W=3D1 (-Werror) and
-Wconditional-uninitialized; not runtime-tested on AMD GPU hardware.

Fixes: 23bd7e67961e ("drm/amdgpu: get rid of amdgpu_ttm_clear_buffer")
Signed-off-by: Ian Rogers <irogers@google.com>
---

Notes:
    v2:
      - Set 'r =3D 0;' directly before the 'error:' label instead of
        initializing 'r' at declaration (Christian K=C3=B6nig).

 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_ttm.c
index 0f86777250fc..693f25285f2f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2711,6 +2711,8 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_ttm_buffer_=
entity *entity,
=20
 		amdgpu_res_next(&dst, cur_size);
 	}
+	r =3D 0;
+
 error:
 	mutex_unlock(&entity->lock);
 	*out_fence =3D fence;
--=20
2.56.1.750.gf70dc682cf-goog

