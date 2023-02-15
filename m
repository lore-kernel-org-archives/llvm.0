Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8627C
	for <llvm@lists.linux.dev>; Wed, 15 Feb 2023 03:22:00 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id nh19-20020a17090b365300b00233ceae8407so684450pjb.3
        for <llvm@lists.linux.dev>; Tue, 14 Feb 2023 19:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uozkL3xyU3G7caCgtOyyGlq6bOzresRLxoE69s84Zbk=;
        b=FybY5LzLrYlMhdkVcY3Xh9A6ED9Tv2uUDUY7zaMbzNJnR73Ah6BndgMuNaCMBebZNX
         f2AdP9eYzhm1DLzm7sUBcdV/Tu4uYC+Cirh1o+bZnrEqmOH1ut0VTHKHLjfypVZWuKSq
         1jRi9Sy/5c17At9IYiauEfPKFHs4uSlrJNu8loeMtonZ6LPxdhI+h0jHL2zgcpceRcjl
         dvBuQVVcS4PfwiI1VgOIvSZr8028ZSF+s8zCE0IBsf2hYopwScHVGYnfh/BANHmVjFzd
         ccPXP+Br5YE4C0Dlhz3Yt4AYP8Ny/lgR4XBuYdqNxL5cWh1o4MmuwT1qOBLqiVZtEjo1
         MKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uozkL3xyU3G7caCgtOyyGlq6bOzresRLxoE69s84Zbk=;
        b=07xO2Tb546nBPtiGbDRPEnqqLNt5Zwbh97OsNxUxj8eCH8LO8pfXme5raemIWFm9ES
         W9h23Wb2L5sVh/0QSrSMwj0nQKdSDyHJxnmyMpF9frdb9lc6AVw5Cz+FJjkjsVP5n6BO
         kKmppOfL9+7NQE13uIJaSNGZh4ao/u8k2qVt/DXQcA45KLbW6OzXW1cz6TQzcTO700r/
         vIl9yISYEvhGWJDWyCrQYO1PquowSd5xJa9BLd9OaOXR79zvMOXjGj9hEfaT0kJt/xQ2
         NMqeCx3F/q9act1k8MgMtfDXgPuXNTjYBK4jEZpae4Dc5pFMyLwI7Ge/Z0S4V8cxn2e8
         o3Qg==
X-Gm-Message-State: AO0yUKVweKR1E89XLresAsR9LoKyRdScEcUI1xmDZ5MWDZNudQF716I6
	JHAT+IqYGIAzoHb0mSV0UnM=
X-Google-Smtp-Source: AK7set+Ll0z2TSlMH5Vb+ciEjES3FX/nCYg8mfiDfFTc0WKaBGWhYx5zMC1Jh7/Bc1dzPaNkSmoDXw==
X-Received: by 2002:a05:6a20:1444:b0:be:b4ae:eae5 with SMTP id a4-20020a056a20144400b000beb4aeeae5mr1187792pzi.20.1676431319501;
        Tue, 14 Feb 2023 19:21:59 -0800 (PST)
Received: from localhost.localdomain (arc.lsta.media.kyoto-u.ac.jp. [130.54.10.65])
        by smtp.gmail.com with ESMTPSA id f17-20020a639c11000000b00478c48cf73csm9330925pge.82.2023.02.14.19.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 19:21:59 -0800 (PST)
From: Taichi Nishimura <awkrail01@gmail.com>
To: rdunlap@infradead.org
Cc: andrii@kernel.org,
	ast@kernel.org,
	awkrail01@gmail.com,
	daniel@iogearbox.net,
	davem@davemloft.net,
	deso@posteo.net,
	haoluo@google.com,
	hawk@kernel.org,
	joannelkoong@gmail.com,
	john.fastabend@gmail.com,
	jolsa@kernel.org,
	kpsingh@kernel.org,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev,
	martin.lau@linux.dev,
	mykolal@fb.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	netdev@vger.kernel.org,
	sdf@google.com,
	shuah@kernel.org,
	song@kernel.org,
	trix@redhat.com,
	yhs@fb.com,
	ytcoode@gmail.com
Subject: [PATCH v2] fixed typos on selftests/bpf
Date: Wed, 15 Feb 2023 12:21:22 +0900
Message-Id: <20230215032122.417515-1-awkrail01@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <f8f3e8df-f707-28f3-ab0f-eec21686c940@infradead.org>
References: <f8f3e8df-f707-28f3-ab0f-eec21686c940@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Randy,

Thank you for your reviewing.
I fixed costant and it's to constant and its, respectively.

Best regards,
Taichi Nishimura

Signed-off-by: Taichi Nishimura <awkrail01@gmail.com>
---
 tools/testing/selftests/bpf/progs/test_cls_redirect.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/test_cls_redirect.c b/tools/testing/selftests/bpf/progs/test_cls_redirect.c
index a8ba39848bbf..66b304982245 100644
--- a/tools/testing/selftests/bpf/progs/test_cls_redirect.c
+++ b/tools/testing/selftests/bpf/progs/test_cls_redirect.c
@@ -610,8 +610,8 @@ static INLINING ret_t get_next_hop(buf_t *pkt, encap_headers_t *encap,
  *
  *    fill_tuple(&t, foo, sizeof(struct iphdr), 123, 321)
  *
- * clang will substitute a costant for sizeof, which allows the verifier
- * to track it's value. Based on this, it can figure out the constant
+ * clang will substitute a constant for sizeof, which allows the verifier
+ * to track its value. Based on this, it can figure out the constant
  * return value, and calling code works while still being "generic" to
  * IPv4 and IPv6.
  */
-- 
2.25.1

