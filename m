Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A72129CA
	for <llvm@lists.linux.dev>; Fri,  3 Dec 2021 19:55:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10187"; a="223918216"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; 
   d="scan'208";a="223918216"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2021 11:55:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; 
   d="scan'208";a="541730881"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
  by orsmga001.jf.intel.com with ESMTP; 03 Dec 2021 11:55:31 -0800
Received: from newjersey.igk.intel.com (newjersey.igk.intel.com [10.102.20.203])
	by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id 1B3JtUVL022961;
	Fri, 3 Dec 2021 19:55:30 GMT
From: Alexander Lobakin <alexandr.lobakin@intel.com>
To: Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>
Cc: Alexander Lobakin <alexandr.lobakin@intel.com>,
        =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>,
        John Fastabend <john.fastabend@gmail.com>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>, netdev@vger.kernel.org,
        bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
Subject: [PATCH bpf 0/2] samples: bpf: fix build issues with Clang/LLVM
Date: Fri,  3 Dec 2021 20:50:02 +0100
Message-Id: <20211203195004.5803-1-alexandr.lobakin@intel.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Samples, at least XDP ones, can be built only with the compiler used
to build the kernel itself.
However, XDP sample infra introduced in Aug'21 was probably tested
with GCC/Binutils only as it's not really compilable for now with
Clang/LLVM.
These two are trivial fixes addressing this.

Alexander Lobakin (2):
  samples: bpf: fix xdp_sample_user.o linking with Clang
  samples: bpf: fix 'unknown warning group' build warning on Clang

 samples/bpf/Makefile          | 5 +++++
 samples/bpf/Makefile.target   | 2 +-
 samples/bpf/xdp_sample_user.h | 2 ++
 3 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.33.1

