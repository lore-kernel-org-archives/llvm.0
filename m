Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB8F3FC1
	for <llvm@lists.linux.dev>; Tue, 24 Aug 2021 22:54:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C2BF861139;
	Tue, 24 Aug 2021 22:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629845681;
	bh=VRPyW1VeO7gfAN1WVH2HUQN9HNXvpNgT4uXN0dtpgSg=;
	h=From:To:Cc:Subject:Date:From;
	b=flB5TcWMNT76AKxh3XR22CrIVe8y0lorcQ+fmCHwlvsCWMEVcQfSoaPUhs+8NCd3s
	 w3n5+bOLR393xOnucjv1GYNkNNyLzyt0Tvn3ywytxpMLxGssKqF51mFz+pQwl6khSn
	 J/2ZWz5pS1Ny9jpFU/IS94ve1YYaJ3MW2ggL++ktqzgAl6F2s7Xkk1DFDm3ssrOcZ7
	 GAYAHHwG3Spard0hg/zFb3yOZuIJ3fhxZDHdulADHM7JXE5PsDXhxws+PTgpIFBQwz
	 pokFrA+TYRhrdFRHJWih4350aovGhGvJB65V3RUJIoSUzco2ZsoqslXX93lpvE3VKX
	 igBtg/5u03RCA==
From: Nathan Chancellor <nathan@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Matthew Auld <matthew.auld@intel.com>,
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 0/3] drm/i915: Enable -Wsometimes-uninitialized
Date: Tue, 24 Aug 2021 15:54:24 -0700
Message-Id: <20210824225427.2065517-1-nathan@kernel.org>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

Commit 46e2068081e9 ("drm/i915: Disable some extra clang warnings")
disabled -Wsometimes-uninitialized as noisy but there have been a few
fixes to clang that make the false positive rate fairly low so it should
be enabled to help catch obvious mistakes. The first two patches fix
revent instances of this warning then enables it for i915 like the rest
of the tree.

Cheers,
Nathan

Nathan Chancellor (3):
  drm/i915/selftests: Do not use import_obj uninitialized
  drm/i915/selftests: Always initialize err in
    igt_dmabuf_import_same_driver_lmem()
  drm/i915: Enable -Wsometimes-uninitialized

 drivers/gpu/drm/i915/Makefile                        | 1 -
 drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c | 7 ++++---
 2 files changed, 4 insertions(+), 4 deletions(-)


base-commit: fb43ebc83e069625cfeeb2490efc3ffa0013bfa4
-- 
2.33.0

