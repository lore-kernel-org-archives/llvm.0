Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38EEDDDB
	for <llvm@lists.linux.dev>; Mon,  3 Jul 2023 11:37:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00269C433C9;
	Mon,  3 Jul 2023 11:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688384264;
	bh=NWdm4COWp2k09VYLKv3/EMMJkaiYec6oWrtpHhnAdio=;
	h=From:To:Cc:Subject:Date:From;
	b=BUJp2I4tfvNJnQyBQ7mRS4r9bhjY6iDaZatDtPvGUGRSMTW+yTIuvFgIodu6nfukJ
	 Ir3sfcG1YlLLR9YZXB6YIKumcnsyEd1orp1XlNfFS9pcIYFUF7hYuu/PLv1gquQ+MX
	 eUbjrWhcdg89M2+/8hr9u8aM5D7jmRhg49yjetMcM2Yp8lbDHDfIxnBf8Xxqiul2LG
	 IQeQdjKFGFzUHJTaDSlprBM7iQ2e3D5C84bDauoUdzk5V7ZQxGBB9sGJMT7vjXYjv7
	 rLfln/mxaLdx0zGVrdVVW4hfbm7SV9AgnrElV5CGJ266xfcDdY/+71CCzEb+AUQUCR
	 G3sPgBRvhHiig==
From: Arnd Bergmann <arnd@kernel.org>
To: Chuck Lever <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Neil Brown <neilb@suse.de>,
	Olga Kornievskaia <kolga@netapp.com>,
	Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] sunrpc: avoid constant-out-of-range warning with clang
Date: Mon,  3 Jul 2023 13:37:22 +0200
Message-Id: <20230703113737.694995-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The overflow check in xdr_stream_decode_uint32_array() was added for
32-bit systems, but on 64-bit builds it causes a build warning when
building with clang and W=1:

In file included from init/do_mounts.c:22:
include/linux/sunrpc/xdr.h:778:10: error: result of comparison of constant 4611686018427387903 with expression of type '__u32' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
  778 |         if (len > SIZE_MAX / sizeof(*p))

Shut up the warning with a type cast.

Fixes: 23a9dbbe0faf1 ("NFSD: prevent integer overflow on 32 bit systems")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/sunrpc/xdr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/sunrpc/xdr.h b/include/linux/sunrpc/xdr.h
index f89ec4b5ea169..6736121ee6a03 100644
--- a/include/linux/sunrpc/xdr.h
+++ b/include/linux/sunrpc/xdr.h
@@ -775,7 +775,7 @@ xdr_stream_decode_uint32_array(struct xdr_stream *xdr,
 
 	if (unlikely(xdr_stream_decode_u32(xdr, &len) < 0))
 		return -EBADMSG;
-	if (len > SIZE_MAX / sizeof(*p))
+	if ((size_t)len > SIZE_MAX / sizeof(*p))
 		return -EBADMSG;
 	p = xdr_inline_decode(xdr, len * sizeof(*p));
 	if (unlikely(!p))
-- 
2.39.2

