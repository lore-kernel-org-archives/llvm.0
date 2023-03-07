Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9D7AD49
	for <llvm@lists.linux.dev>; Tue,  7 Mar 2023 15:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678201998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WvISTS/f4ZrOg4Qn5jDzcftulng+Jaj+2XVbo0ebuCg=;
	b=gl4118t7XcZL/9Xrqkk0YAud0d+/qpufikK7gFBVAFax3d6yedUV+H7gEyqbVrmAzkJtBN
	8vsA412ooxHTomjBR3ED5tUgVFcI7IgbbdoKrttPSqfIqslsWJ9cCP6VrlsV1sUy9DMYX0
	Su4KnwWyn6LxBmE9/BJEzLl32P/JSM8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-8PgRA24MOWuu58BvVOxOkQ-1; Tue, 07 Mar 2023 10:13:13 -0500
X-MC-Unique: 8PgRA24MOWuu58BvVOxOkQ-1
Received: by mail-qt1-f198.google.com with SMTP id i24-20020ac84f58000000b003bfe3358691so7234267qtw.21
        for <llvm@lists.linux.dev>; Tue, 07 Mar 2023 07:13:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678201992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WvISTS/f4ZrOg4Qn5jDzcftulng+Jaj+2XVbo0ebuCg=;
        b=Cbasc9dsAJIMmx0O46Yu9fjbIc0/M65vHXFn+BUXQC4TCYHv6mod7XwBB6KgSyLkDv
         FoYYpcsOdPStbzKjey40THd2zqw8c7nr5jatmhZlHJ79O2p1tUqY1aU3XPOyJQ15O9ob
         3OTZg3HQyx/RB9VvR3TCzRCLLifyU27Aevue3e/zjdUu1mUO9CGENGlkZRvI4n+xu1Uh
         SF9RXxSwB+U+H4N3LfXqYHpYV7cji4+XqBqXARShrpYIiF+Jp9zsWIXxz5+CjnUstdiS
         xriUENXzRQBm/S3L/MePIPTVLQ1GGe/kneXDvjS+40DrWDfcPhDx+6bn3vJ1VTIz+hMN
         x7YA==
X-Gm-Message-State: AO0yUKUJd7tcK13P0Qp538RltMErz+/41NQqvQdCCBX6sLq+A4+c+wPX
	SSM6qmOktmb92rZdrKZeElsNqqbfSzjy9f3ZHeqWKkvfGMvRcb1hOUud1QoF9jVT8TER5RdUjci
	n9gI36ZGjc58Gqg==
X-Received: by 2002:a05:622a:1443:b0:3bf:c994:c9b6 with SMTP id v3-20020a05622a144300b003bfc994c9b6mr23589679qtx.29.1678201992402;
        Tue, 07 Mar 2023 07:13:12 -0800 (PST)
X-Google-Smtp-Source: AK7set9TmvzsR4HqKIqb+BcjJiWtp9AaRyGnpSJemAFjbkf0yUgxhC8H5Nq/lMkoHAF+O/d53/mIuQ==
X-Received: by 2002:a05:622a:1443:b0:3bf:c994:c9b6 with SMTP id v3-20020a05622a144300b003bfc994c9b6mr23589642qtx.29.1678201992132;
        Tue, 07 Mar 2023 07:13:12 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id d79-20020ae9ef52000000b007296805f607sm9712804qkg.17.2023.03.07.07.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 07:13:11 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: martin.lau@linux.dev,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	song@kernel.org,
	yhs@fb.com,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@google.com,
	haoluo@google.com,
	jolsa@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	joannelkoong@gmail.com
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] bpf: extend btf id list
Date: Tue,  7 Mar 2023 10:12:39 -0500
Message-Id: <20230307151239.1994179-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

With clang and W=1, there is this error

kernel/bpf/verifier.c:10298:24: error: array index 16 is past
 the end of the array (that has type 'u32[16]'
 (aka 'unsigned int[16]')) [-Werror,-Warray-bounds]
    meta.func_id == special_kfunc_list[KF_bpf_dynptr_slice_rdwr]) {
                    ^                  ~~~~~~~~~~~~~~~~~~~~~~~~
kernel/bpf/verifier.c:9150:1: note: array 'special_kfunc_list' declared here
BTF_ID_LIST(special_kfunc_list)
^
./include/linux/btf_ids.h:207:27: note: expanded from macro 'BTF_ID_LIST'
 #define BTF_ID_LIST(name) static u32 __maybe_unused name[16];

When KF_bpf_dynptr_slice_rdwr was added to the enum special_kfunc_type
the total exceeded 16.  Increase the array size to 32.

Fixes: 66e3a13e7c2c ("bpf: Add bpf_dynptr_slice and bpf_dynptr_slice_rdwr")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 include/linux/btf_ids.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/btf_ids.h b/include/linux/btf_ids.h
index 3a4f7cd882ca..166c387b48f7 100644
--- a/include/linux/btf_ids.h
+++ b/include/linux/btf_ids.h
@@ -204,7 +204,7 @@ extern struct btf_id_set8 name;
 
 #else
 
-#define BTF_ID_LIST(name) static u32 __maybe_unused name[16];
+#define BTF_ID_LIST(name) static u32 __maybe_unused name[32];
 #define BTF_ID(prefix, name)
 #define BTF_ID_FLAGS(prefix, name, ...)
 #define BTF_ID_UNUSED
-- 
2.27.0

