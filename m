Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486560;
	b=aYrV3YSDkGRwTjscCaYWnIb5xA1i3VgpmSUoJ7TWAAjlMWe6luiN9+A5kap0lKFYl+CC
	 KJU5eZoK+QP6H+Mv8NAbYevyLlz+lGjEW64G+m7I91Za9zzWxh7czD2SEj45VhuIaEo3V
	 zDBk3IsfiFo8H6xqVtsNrU0teGV0pdszFMwMQiJMK3pYH/H+3uOKWrM4HKALEWi3/+K4L
	 UQ1f0rAN83qeQ60W0sUnE/mb5wF6QUW6yI8Dz0XSgmwqxsl46q7a526TiSTtGD2BAQUuf
	 cu2GYLaEPUurukyz4qkW+/oWMJjzZFkkiLis9x6g/5rBqamS6OKBFlOIisl7tu/j4NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486560;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=sdNaoVSRuGZpGug/DK6AKDScm0L5vKpD110CMZcWZBE=;
	b=UR9hS1lRAwI/OYlUnEiy8QdFZW7GueBjuR3Vnx5CYyTI+eq+3rtJfXBR1uQvPXnHNJgk
	 5rB2o0riCT7irJ1Ugacj4ZSLqybOUK4UKwAfl14pi16giAMq3BfT/wJu3CU9Wdp57tsfa
	 rl02nf00PgEIsfWv2raGT0L9i1rH1YepvWlTTAA6eRx0mEIXancs+lw1gg802Fk+wCScG
	 DQB4uhsm6N63DL3zIh+fpmzEzU7MtWGhgOZh6ikncU6KT3Jfc05oYxvVxoiHkt6xrSEaA
	 PbSMEsvwZXdKKe0l+6aj6DanSfhLjueaUQqRYIORXN+KgrzOOeIxZEfsRL858Ffc/1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nmWgsbwA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3446606A319;
	Tue, 20 Oct 2026 08:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nmWgsbwA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 090AC1F000C4;
	Tue, 20 Oct 2026 08:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792486559;
	bh=sdNaoVSRuGZpGug/DK6AKDScm0L5vKpD110CMZcWZBE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nmWgsbwAIgJnmmPfeTwzZvOKWfuxsBYnYGAP4QVf+75YOZKM+R4nz74AbmledcGnK
	 gODFHcOXfzrNyZTjztWdT75yf2Naj7epndP0uzJBHLnvzYoZtNJXexcFLwO8paQ3Mm
	 9z78gclw9xIVRIzPv2aoPROmFXQfAjmpZt9pSIwsOOVmPfW8DLpd+OGE+8uMRiV6J0
	 Qmox650orB0WXCRXulBh5yMtyQARAcGbQdKoDH2B1L6hJ6Cxy2xVtudpoRpjWyy4eK
	 cWJcyWCzqgVprWsd/fMCQIpzu0J3mtJHUu3LmzgUelf26MtAYUxxPeM5i6cgCkm/6N
	 aWB4/OuuiiA3A==
From: Maxime Ripard <mripard@kernel.org>
To: Helen Koike <helen.fornazier@gmail.com>,
	Vignesh Raman <vignesh.raman@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] drm/ci: Add CI pipeline for drm-misc branches
Date: Tue, 20 Oct 2026 10:55:53 +0200
Message-ID: <179248655167.2849206.582866226743194201.b4-ty@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911-drm-drm-misc-ci-v2-1-1847f89585cb@kernel.org>
References: <20260911-drm-drm-misc-ci-v2-1-1847f89585cb@kernel.org>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 11 Sep 2026 14:18:04 +0200, Maxime Ripard wrote:
> The DRM CI infrastructure builds upon Mesa's CI to run IGT tests on
> hardware. Its focus is on functional testing on a selected number of
> targets.
> 
> The concern for drm-misc is different: it merges a large number of
> patches across many platforms, and build or unit test breakages happen
> on a regular basis. Adding build and unit testing for drm-misc has been
> on the back of our minds, and a first attempt was made last year. The
> feedback was to rely more on the existing infrastructure.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next)

[1/1] drm/ci: Add CI pipeline for drm-misc branches
      commit: d1025d345b21261ddc10e598ec736aa5875aedbd

Thanks!
Maxime
