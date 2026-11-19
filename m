Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107848;
	b=N3ZD5+tf/c7/bwDs87Qs/OBNtSe71A9S5P53PIRk1Aszg4D817dYmicrF3C+pIhaNhOD
	 LjU0ogwtCYwSmhRvxPzzVIAfMXIbn67MOsE4585L1vYiPjs4v126ioVZUTdg/yZeDPF17
	 KU0owOJLSccNU5KMYAroBLXbxug7pYEi1kxJqxcHDpoQ9gi2pBB/ertsZk5W3Tf2ZyhqJ
	 h/fjhtgWi8NE2+7bPum8SjxbxF0olw5X5n1EK0KYa+f+5zGXJzhprk1RLS2pYPO4opp+t
	 79XRfZfGuVbZoZNTcpEUmUkfVfM7ZxO0j91b9uLVIFFZO6MSoTTw1A1Ho+DYojiytVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=gP2dFp+nPAltPmlpy+sjF+Wz7tzVFG9r5/IcbCuHryM=;
	b=UaFKYyAeKiqKS7+MK0MQn576zdQNygYT2HnZECEvw5kUEyynXJLmIdQtXryjCgLh5jxO
	 gLZgi7yc+Q1FirKle962Bwte4tcxxBprwrVlFHAxnUemCiwhvgKgMNYtgmTDgzlYmW2Q1
	 0Bd8/zikScryhJMB6h+slz7S/cXc14eDPPNTkOhDA6CMwhgx5Jc1tZ6XbV/gXu41AKGEk
	 tkTfQ8umyg/nlBJRjWwuROrIOfapSsyn8lk7ObGW6833tUVhoCslxjlOfR8/q+EEE3XG2
	 Sv6J9pP9LXqmcYORZBqoEHEjdrDQcEld+Y3mz2V9OEUdbEej939sUdJog7vVRPMqiow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="V/Wq6l77";
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E33E606A326
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E33E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V/Wq6l77
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-383f2d05c73so3871375eec.0
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107846; x=1795712646; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gP2dFp+nPAltPmlpy+sjF+Wz7tzVFG9r5/IcbCuHryM=;
        b=V/Wq6l77aFtJMeDVey9WmrrUMUV/Hp/boJDwnNmLE29hE5gJy4KNimwAQZkS1eBWnn
         KkGK+e3obbE4vhMfkwnJh/sO1jWKqLfDpklEZLb06DmX6srOajIkpyGH71e/0fsVspxH
         VF3b7tppq4XP2YAaPz1snT+Gtk2nzRqWkCsA9EIJ1iP5g6KuUTSfOz6gUSQdWFLbIYqD
         N6622DbYyHk+rGgBeGEA+lgHFyvXnuYlqkVG9pBHRSid6vqi8OJxLU0Y4UoRB+VtqS2M
         D0rqfED0a9oTCsCdwATkxK3v5QqPAiFle9k2mQQKolP2b4zlzgn4t+Rk9y+lF+PiYKG3
         xfUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107846; x=1795712646;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gP2dFp+nPAltPmlpy+sjF+Wz7tzVFG9r5/IcbCuHryM=;
        b=FEdeQ8nD1fvwxj0F8fZMnZKy4jSQQ+qWZJUSRZbj8l8RXmwHNKS8euy++gV0RaQqcF
         WzFAfqK8hLjHbnPz6s2E9KD/WjIxCS66Ag/iO/+d5lSULkKkrQo/U7UEEoBqkd9Ncxkz
         KWRVpNFhVG4RKNADHzDIcDhc8OWcX6bBvNc0asH7f+tLAmvhIbbX4xtVPgz0nWGBbY2n
         wcpw3b3Uo2iDy3KGgmETTMDgq22Nm4gwjFkf/ePoUPfr8d4pAN8jV6o1aCmIo2W3jfwh
         9ECGndlYgu1fxbFlKa9uxlcTJGzgj+Nzm4SauaLXMBHRiSLLjT6q5c/CrwwocUJGgvUj
         KN0w==
X-Forwarded-Encrypted: i=1; AL+hErE+bJnVqFQWuVuV11N5vEHhT2QLZHVbMnJt6FHQRRnlmXA2JYb/JsZphzYQr9/Kd6w5fLgm@lists.linux.dev
X-Gm-Message-State: APuU4Z/XnaXhLhGm/UHvMYM348Xn2ifKj4tIk9sKPLrzJzM0X2Yh/bVj
	gdTh5+k0PQA3+WgQcSjtYBsnDG/QuQNzIwqfqRj8NGSm3JBwHJm280FS+oiZcJPX6Tlwz0LRqei
	4eQyQsUMs1g==
X-Received: from dlbur4.prod.google.com ([2002:a05:7022:ea44:b0:1a0:8cef:34d5])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:2649:b0:194:9e7a:3ba2
 with SMTP id a92af1059eb24-1b5567f682amr277048c88.2.1795107845817; Thu, 19
 Nov 2026 09:04:05 -0800 (PST)
Date: Thu, 19 Nov 2026 09:03:57 -0800
In-Reply-To: <cover.1795106937.git.irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <cover.1795106937.git.irogers@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <f0db7ca640d19d1021b4031b08be426532425095.1795106937.git.irogers@google.com>
Subject: [PATCH 1/2] drm/nouveau: Handle NVIF_CONN_TV and fix error cleanup in nouveau_connector_create()
From: Ian Rogers <irogers@google.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In nouveau_connector_create(), the switch translating nvif connector
types (nv_connector->conn.info.type) to DCB connector types omits
NVIF_CONN_TV, even though nvkm_uconn_new() maps DCB TV connectors to
NVIF_CONN_V0_TV -> NVIF_CONN_TV and the rest of nouveau_connector.c
handles DCB_CONNECTOR_TV_0.

Furthermore, the default branch returns NULL without destroying
nv_connector->conn or freeing nv_connector, whereas both callers
(nv50_display_create() and nv04_display_create()) check only
IS_ERR(connector) and immediately dereference connector on NULL.

Map NVIF_CONN_TV to DCB_CONNECTOR_TV_0, and clean up nv_connector->conn
and nv_connector before returning ERR_PTR(-EINVAL) in the default
branch.

Found by enabling Clang's -Wswitch-enum on an x86_64 allyesconfig build,
with AI coding assistant help to audit the warning and prepare the fix.
Build-tested with Clang; not runtime-tested on NVIDIA GPU hardware.

Fixes: 8b7d92cad953 ("drm/nouveau/kms/nv50-: create connectors based on nvkm info")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index cc3caf8de64b..51580824df36 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1394,6 +1394,9 @@ nouveau_connector_create(struct drm_device *dev, int index)
 
 		switch (nv_connector->conn.info.type) {
 		case NVIF_CONN_VGA      : type = DCB_CONNECTOR_VGA; break;
+		case NVIF_CONN_TV:
+			type = DCB_CONNECTOR_TV_0;
+			break;
 		case NVIF_CONN_DVI_I    : type = DCB_CONNECTOR_DVI_I; break;
 		case NVIF_CONN_DVI_D    : type = DCB_CONNECTOR_DVI_D; break;
 		case NVIF_CONN_LVDS     : type = DCB_CONNECTOR_LVDS; break;
@@ -1403,7 +1406,9 @@ nouveau_connector_create(struct drm_device *dev, int index)
 		case NVIF_CONN_HDMI     : type = DCB_CONNECTOR_HDMI_0; break;
 		default:
 			WARN_ON(1);
-			return NULL;
+			nvif_conn_dtor(&nv_connector->conn);
+			kfree(nv_connector);
+			return ERR_PTR(-EINVAL);
 		}
 
 		nv_connector->type = type;
-- 
2.56.1.708.g77570a6a1d-goog

