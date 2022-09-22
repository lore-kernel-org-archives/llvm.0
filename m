Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EAA1FD9
	for <llvm@lists.linux.dev>; Thu, 22 Sep 2022 03:10:31 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id q35-20020a17090a752600b002038d8a68fbso861401pjk.0
        for <llvm@lists.linux.dev>; Wed, 21 Sep 2022 20:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=qxVZgozpxUqw/OCmt2hiw12U/0MyvSZtu5qBBtiyWvw=;
        b=YceqUeE5vYLBI4ZX8VHDnLZLf4LI9m/umYwz5bsG0CsZBYwVRKID0Xij6KROSl4WW+
         /TrR0tpL0v+DF8mfo3NenZgJCDlxojKf81TDxbqYAGTS/Z+tsMmbhRNDYO79WP6ExIu9
         zC6fMXi3wRzqyMx5oelK9O9SszqI+SIirgmsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=qxVZgozpxUqw/OCmt2hiw12U/0MyvSZtu5qBBtiyWvw=;
        b=GZYtzqZ3fLMN85WSZqxZNr6o7qk0C90pg8StJSzCrUHGt4L3vw+rocqbsX/KEu0u69
         Hs74W4lXFxlgFvZ6Q0M/J+NOQG8InCYKSm+9aTe0N1qWK0LQpHED/81n/ce9Q+VYj85O
         0cKRW5KkYE79OVvXBKy5V7+UUEDoN880sHoRkNWSey9IPB/BvczGo49y3gNaRsK4kNB2
         tXYjebLjxe70fZ/uRpgK8LiERnm7S7n5Y/dmW41cRspczPeOuUm7jZ+4osoKCiG9k8Z8
         dzJARhVgei4s/k5RI3fKl6qMmBhzarJqZBHqydW6UD+BbUX9G36WA7QqQoSHlpQ8Eh46
         GNjA==
X-Gm-Message-State: ACrzQf1MrGAmIdR24i/R9hsxYqhCFWVNZ3+d8og37n73SXbgjEC7JSPj
	fbPkyG0B1zCknOJ+Zo6q3tAtnw==
X-Google-Smtp-Source: AMsMyM5eu+CoD5QA+YWTzFQPQA65ZAQe9wx2y8um8qAtQyx/81XSGYYdjISHnZdAlryk2cpvPh097g==
X-Received: by 2002:a17:902:7e83:b0:177:e667:7841 with SMTP id z3-20020a1709027e8300b00177e6677841mr1282723pla.18.1663816230671;
        Wed, 21 Sep 2022 20:10:30 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w23-20020a1709026f1700b001783a917b9asm673159plk.127.2022.09.21.20.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 20:10:26 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Kees Cook <keescook@chromium.org>,
	Pekka Enberg <penberg@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-mm@kvack.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Alex Elder <elder@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>,
	David Sterba <dsterba@suse.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Daniel Micay <danielmicay@gmail.com>,
	Yonghong Song <yhs@fb.com>,
	Marco Elver <elver@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Jacob Shin <jacob.shin@amd.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-fsdevel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	dev@openvswitch.org,
	x86@kernel.org,
	linux-wireless@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH 12/12] slab: Restore __alloc_size attribute to __kmalloc_track_caller
Date: Wed, 21 Sep 2022 20:10:13 -0700
Message-Id: <20220922031013.2150682-13-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922031013.2150682-1-keescook@chromium.org>
References: <20220922031013.2150682-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1539; h=from:subject; bh=OIiXewiJtJloKAX8DOwo5WpUjhu8p3BhQEgjb94POmU=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjK9IUphiC6b+jlnve6/WNpL7tI32u/OY+d1HLdPMo annUuq2JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYyvSFAAKCRCJcvTf3G3AJlTRD/ 9zGxikcJjFFHdBDIRC8el1bT8i8MIl1Oz2r6j4svUQE/cn0btongvxnGDbygRuZC43lwApaQa0M8Pt AvmL/hvvYmdFiuzN6An0FZ4ORvTCLn1uzH4EirSEKQxkllpH0r1YW2hqSLpqcaY86iquT8vB02Tv16 e13SWQA7nA1/QWGk0qUxi0YLrW0hOtkH2mg2fITcspULau1LHMsUmc37gU0TbvIrbx9hN87N2NnOzz alo6xwbNstj0cru/3QyQ5TJdhcVKP54qndI7drNEdhl8YWC7CNhwu0vFdbZ/LfLgxO2PtTl9nz23b0 fDmn0WywY/tJQOqhYvvIWsDN69+iEub68yvR3WWj2bKYgwuaZ89nPNObeP4LOThYNTFoEclKMY7Rja jkOQc8wAtgZmSKL9TVY3alYeLpe9CQJEnOq4oSVlfTwIftpgULM6xBq459EK/qrpUHyyV8vmzyoEjv Pz/49h7U3Q7bYxnoWIkIniYWWT6d9d1DH3MtHi4eCTaj2iVTLdQRLx7Zw2/KJ4VvLPA3/587G7zFdJ OzdFQo4VVfEuH6S3EaIPg5mtVX0AbNqQxBEV1EkPNU2qQK6x6coo691bRHOWqgucqydaoj3YDERK1B 3pAijp4vU8wsUovuHXrgjKcWnIuVw656YURrFma1ktTDOShGFqP+WQ5kIpqw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

With skbuff's post-allocation use of ksize() rearranged to use
kmalloc_size_round() prior to allocation, the compiler can correctly
reason about the size of these allocations. The prior mismatch had caused
buffer overflow mitigations to erroneously fire under CONFIG_UBSAN_BOUNDS,
requiring a partial revert of the __alloc_size attributes. Restore the
attribute that had been removed in commit 93dd04ab0b2b ("slab: remove
__alloc_size attribute from __kmalloc_track_caller").

Cc: Pekka Enberg <penberg@kernel.org>
Cc: David Rientjes <rientjes@google.com>
Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-mm@kvack.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/slab.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index ac3832b50dbb..dd50ed7207c9 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -693,7 +693,8 @@ static inline __alloc_size(1, 2) void *kcalloc(size_t n, size_t size, gfp_t flag
  * allocator where we care about the real place the memory allocation
  * request comes from.
  */
-extern void *__kmalloc_track_caller(size_t size, gfp_t flags, unsigned long caller);
+extern void *__kmalloc_track_caller(size_t size, gfp_t flags, unsigned long caller)
+				   __alloc_size(1);
 #define kmalloc_track_caller(size, flags) \
 	__kmalloc_track_caller(size, flags, _RET_IP_)
 
-- 
2.34.1

