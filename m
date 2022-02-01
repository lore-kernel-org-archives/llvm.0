Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C5C2C9C
	for <llvm@lists.linux.dev>; Tue,  1 Feb 2022 20:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55FBFC340EB;
	Tue,  1 Feb 2022 20:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643749023;
	bh=V2UwD0MzRLDnF0+Omw6xViGV0ZfyIdZvB/8JfsHk8RI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mEdi5W0pu1xy3fSUhyc2k3oSBbX2/wku68zWw5kuze4gOkoLboNP+Nywp8Rpg/Tvs
	 paQ4JrmqnLN+Le1A/PPYrT6fWQ7/RvZlUwbRBWce7Z7JT4QaHNY+4QcXtv6+KJZDmK
	 ry4Ot3PPu8LVWLJRSA6X1vNqw0dciDri0ExKQXrtN15toUnPdpKA8ybVJbtZT2UTMU
	 67mghFuM8iyIEQg/xZt9IJuVXq61zIpX7xXa15a3eBl5OyJ3XoEXeliY70Gju3B7fV
	 ofUijaBPYkiIQQz6Fzqvr3oh6A8WSsmwfdh/IUqQpSYVrozAp5xNYEAzKzDtKB39iU
	 zOmbLZe9gIkcQ==
From: Nathan Chancellor <nathan@kernel.org>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>
Cc: Martin KaFai Lau <kafai@fb.com>,
	Song Liu <songliubraving@fb.com>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH bpf-next 3/5] scripts/pahole-flags.sh: Use pahole-version.sh
Date: Tue,  1 Feb 2022 13:56:22 -0700
Message-Id: <20220201205624.652313-4-nathan@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220201205624.652313-1-nathan@kernel.org>
References: <20220201205624.652313-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use pahole-version.sh to get pahole's version code to reduce the amount
of duplication across the tree.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/pahole-flags.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/pahole-flags.sh b/scripts/pahole-flags.sh
index e6093adf4c06..c293941612e7 100755
--- a/scripts/pahole-flags.sh
+++ b/scripts/pahole-flags.sh
@@ -7,7 +7,7 @@ if ! [ -x "$(command -v ${PAHOLE})" ]; then
 	exit 0
 fi
 
-pahole_ver=$(${PAHOLE} --version | sed -E 's/v([0-9]+)\.([0-9]+)/\1\2/')
+pahole_ver=$($(dirname $0)/pahole-version.sh ${PAHOLE})
 
 if [ "${pahole_ver}" -ge "118" ] && [ "${pahole_ver}" -le "121" ]; then
 	# pahole 1.18 through 1.21 can't handle zero-sized per-CPU vars
-- 
2.35.1

