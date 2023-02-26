Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0976D2913
	for <llvm@lists.linux.dev>; Sun, 26 Feb 2023 14:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5B48C433A0;
	Sun, 26 Feb 2023 14:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677422842;
	bh=peWE7c6T0gkLD8MeXmVZAA+YvFj63HxBDgB6XDz+WgE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VAmIM5VLnJ+vPHd77YAV/xfd+LtXE5BjEMZ4mFI8llMgKet38aKKuCYWy0mhZz5GL
	 48qg5WkCPmvbnw9n1CAsugXpSilMNWrjhfTKbNvJ82wVpxd+CXAWrpvvXHGuVFnmDM
	 tBSZdvRXcb+7oP7mbsNYALtB659Et4kVlsHAsXmlBm2rG1vguQxAsrdk6HirgpseMP
	 2MGpWM3t7u5iw4nGVlCC0aFDRHFrOWvuNNZfwVscThvKW0B6xopfGZuqWDwKsZD7KN
	 CW+k5d9mA9+cPuENgB45ox4/sopevF1s/2i+bFQlWGDOKN52/Nd0gw6kIS7U95ez5d
	 7aFgVex6eeSKg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Holger=20Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Quentin Monnet <quentin@isovalent.com>,
	Sasha Levin <sashal@kernel.org>,
	ast@kernel.org,
	andrii@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	bpf@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH AUTOSEL 6.1 13/49] bpftool: Always disable stack protection for BPF objects
Date: Sun, 26 Feb 2023 09:46:13 -0500
Message-Id: <20230226144650.826470-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230226144650.826470-1-sashal@kernel.org>
References: <20230226144650.826470-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Holger Hoffstätte <holger@applied-asynchrony.com>

[ Upstream commit 878625e1c7a10dfbb1fdaaaae2c4d2a58fbce627 ]

When the clang toolchain has stack protection enabled in order to be
consistent with gcc - which just happens to be the case on Gentoo -
the bpftool build fails:

  [...]
  clang \
	-I. \
	-I/tmp/portage/dev-util/bpftool-6.0.12/work/linux-6.0/tools/include/uapi/ \
	-I/tmp/portage/dev-util/bpftool-6.0.12/work/linux-6.0/tools/bpf/bpftool/bootstrap/libbpf/include \
	-g -O2 -Wall -target bpf -c skeleton/pid_iter.bpf.c -o pid_iter.bpf.o
  clang \
	-I. \
	-I/tmp/portage/dev-util/bpftool-6.0.12/work/linux-6.0/tools/include/uapi/ \
	-I/tmp/portage/dev-util/bpftool-6.0.12/work/linux-6.0/tools/bpf/bpftool/bootstrap/libbpf/include \
	-g -O2 -Wall -target bpf -c skeleton/profiler.bpf.c -o profiler.bpf.o
  skeleton/profiler.bpf.c:40:14: error: A call to built-in function '__stack_chk_fail' is not supported.
  int BPF_PROG(fentry_XXX)
                ^
  skeleton/profiler.bpf.c:94:14: error: A call to built-in function '__stack_chk_fail' is not supported.
  int BPF_PROG(fexit_XXX)
                ^
  2 errors generated.
  [...]

Since stack-protector makes no sense for the BPF bits just unconditionally
disable it.

Bug: https://bugs.gentoo.org/890638
Signed-off-by: Holger Hoffstätte <holger@applied-asynchrony.com>
Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
Acked-by: Quentin Monnet <quentin@isovalent.com>
Link: https://lore.kernel.org/bpf/74cd9d2e-6052-312a-241e-2b514a75c92c@applied-asynchrony.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/bpf/bpftool/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/bpf/bpftool/Makefile b/tools/bpf/bpftool/Makefile
index 4a95c017ad4ce..a3794b3416014 100644
--- a/tools/bpf/bpftool/Makefile
+++ b/tools/bpf/bpftool/Makefile
@@ -187,7 +187,8 @@ $(OUTPUT)%.bpf.o: skeleton/%.bpf.c $(OUTPUT)vmlinux.h $(LIBBPF_BOOTSTRAP)
 		-I$(or $(OUTPUT),.) \
 		-I$(srctree)/tools/include/uapi/ \
 		-I$(LIBBPF_BOOTSTRAP_INCLUDE) \
-		-g -O2 -Wall -target bpf -c $< -o $@
+		-g -O2 -Wall -fno-stack-protector \
+		-target bpf -c $< -o $@
 	$(Q)$(LLVM_STRIP) -g $@
 
 $(OUTPUT)%.skel.h: $(OUTPUT)%.bpf.o $(BPFTOOL_BOOTSTRAP)
-- 
2.39.0

