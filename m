Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B062F46
	for <llvm@lists.linux.dev>; Fri, 25 Nov 2022 12:07:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F6F9C433D6;
	Fri, 25 Nov 2022 12:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669378078;
	bh=MoK1DQO20BcY9LoJfm+n7aQF0/HNoDNA8moMNciZNtI=;
	h=From:To:Cc:Subject:Date:From;
	b=n5tAbEzMxcV6gWMhqqKmliBOejuMMDMf+u1A29qQP3Pt9zU85bXC3mZQaELQEgQYn
	 MsLPUi3y2Qi8/DJSogMef1OFzML+RmjMIsK9GI7Ne8iqWcbJNpD1k0OHMhgGAnDiGN
	 5RKbtPiZCOR3Yq+GA9EkZ/Il4BMCA5oZ2DbHtBhPjBaY0Dy6VYGcfENzz55yeypRoG
	 cbWV6SL0xgjM0i0jKpxUNufdLwNqm0ma9Sb3At8+DX74eSAlIzEXd0KDA6GL6BZkKL
	 32CT1F4krTpmlTWl21W8UxJqD8Kw7GmJx73u98s8dt3wkXG5uG/DRndNfHo+T67hNE
	 z3JNNmY+Vikww==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	arnd@arndb.de,
	akpm@linux-foundation.org,
	nathan@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	ndesaulniers@google.com,
	trix@redhat.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com,
	Rodrigo.Siqueira@amd.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] Fix a bunch of allmodconfig errors
Date: Fri, 25 Nov 2022 12:07:48 +0000
Message-Id: <20221125120750.3537134-1-lee@kernel.org>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since b339ec9c229aa ("kbuild: Only default to -Werror if COMPILE_TEST") WERROR 
now defaults to COMPILE_TEST meaning that it's enabled for allmodconfig        
builds.  This leads to some interesting failures, each resolved in this set.   
                                                                               
With this set applied, I am able to obtain a successful allmodconfig Arm build.

v1 => v2:
 - Remove superfluous change (these two override it)
 - Mark only DRM_AMD_DC ("the new display engine) as Broken
 - Change logic to only *include* working arches, not *preclude* them

Lee Jones (2):
  drm/amdgpu: Temporarily disable broken Clang builds due to blown
    stack-frame
  Kconfig.debug: Provide a little extra FRAME_WARN leeway when KASAN is
    enabled

 drivers/gpu/drm/amd/display/Kconfig | 7 +++++++
 lib/Kconfig.debug                   | 1 +
 2 files changed, 8 insertions(+)

-- 
2.38.1.584.g0f3c55d4c2-goog

