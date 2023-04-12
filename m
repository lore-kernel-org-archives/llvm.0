Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E317323E
	for <llvm@lists.linux.dev>; Wed, 12 Apr 2023 10:09:28 +0000 (UTC)
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 12DE83F431
	for <llvm@lists.linux.dev>; Wed, 12 Apr 2023 09:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1681293566;
	bh=lPAnInjEPmYSXmdYizwbO/BNtnsYb9zk0SNDJiS3bTc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=wLahUtcaFHFDXoNn8BuQeWUpnpcfXs/Y4F+DvJ42pu6r3kVgm8rzq4We2lpvIQOQm
	 6PnC11Hdxj5cgkhfkf5DFnuzBdPHvtDypHkoVjA2dcKc/UVVNqeIbxrEHMpAK6qFia
	 Jr8FFAuXhXiaADcTlGBZtBOiXxCNHXYHLkYCqgH1UuaIYqylXknb4KSjyE3MJ58i7M
	 7V1cQhdSpJZJnRYLZC2sbFeFZhLCTj8VXrCFeKI0di9u5y+otMoEcTITc/Gs4seFeE
	 fTb55hnRdqtnTRRhq+Gnz9YMDvs8xUu9Tr55MaKJKaAyDKMiDpwjm9BzbKN5Rldnd8
	 0Z/RIM+W7EXeQ==
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-1843d69b22dso5300564fac.5
        for <llvm@lists.linux.dev>; Wed, 12 Apr 2023 02:59:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681293565; x=1683885565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lPAnInjEPmYSXmdYizwbO/BNtnsYb9zk0SNDJiS3bTc=;
        b=OAYiL6FKbIsihQOTwsIsBtLEVhrTlTbQQTh9g9+61MUA74j+BIX7rNXCRd9trZ3Mmr
         Gx1zbYLjYw4BhF1JtXtIx2leijaeknwCzL6GqbV8l0uaPD6PR2vGAg4HVeDZpC/hh6dl
         /i+MD0lwc3kcaeaRFoeDlsD/DMDs6C1whyHQh2LRNIIINwDHOP8nof8KvsajPPJwW8a3
         bnSPZ2pnip8biu1jTvc3EFqcrUAsRdyoRlC/TP7LNs1fHJc+W6M+V/vzMhhrxj4pI1DX
         w8NiWBlG1B3/NQUFhEHudtBUT4jz+xOyUgke77f/WiiSEMN7ncslUlCw0Ha6kGTIiuU5
         N5+g==
X-Gm-Message-State: AAQBX9dyys/CkRB3eMtOGyA5f99xeEQiQwjiVjXX6Fa0nOcsu0texIVT
	ZeQLNNVvajqoF4JGkv/IoEz10uTi1ztdATbituY+WM3vBByjo3e6Qa52lXr2bujOEXUL8b3TUyw
	k51c7T38fBPGYOJMBDh9RjzLKfiU3exo=
X-Received: by 2002:a05:6870:610d:b0:183:be43:c9b6 with SMTP id s13-20020a056870610d00b00183be43c9b6mr1118738oae.4.1681293564794;
        Wed, 12 Apr 2023 02:59:24 -0700 (PDT)
X-Google-Smtp-Source: AKy350Yke3E7dyjDyozy6CKNMRJ1yHALwyJpgUMrQxdhYZcZxJvUNLn3rj3fZX932Jte9GiiI4COFQ==
X-Received: by 2002:a05:6870:610d:b0:183:be43:c9b6 with SMTP id s13-20020a056870610d00b00183be43c9b6mr1118714oae.4.1681293564521;
        Wed, 12 Apr 2023 02:59:24 -0700 (PDT)
Received: from localhost.localdomain (uk.sesame.canonical.com. [185.125.190.60])
        by smtp.gmail.com with ESMTPSA id zr21-20020a056871ae1500b001765b2f6c53sm6045880oab.9.2023.04.12.02.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 02:59:23 -0700 (PDT)
From: Andrea Righi <andrea.righi@canonical.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>
Cc: Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>,
	Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Paolo Pisati <paolo.pisati@canonical.com>,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/bpf: ignore pointer types check with clang
Date: Wed, 12 Apr 2023 11:59:12 +0200
Message-Id: <20230412095912.188453-1-andrea.righi@canonical.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building bpf selftests with clang can trigger errors like the following:

  CLNG-BPF [test_maps] bpf_iter_netlink.bpf.o
progs/bpf_iter_netlink.c:32:4: error: incompatible pointer types assigning to 'struct sock *' from 'struct sock___17 *' [-Werror,-Wincompatible-pointer-types]
        s = &nlk->sk;
          ^ ~~~~~~~~
1 error generated.

This is due to the fact that bpftool emits duplicate data types with
different names in vmlinux.h (i.e., `struct sock` in this case) and
these types, despite having a different name, represent in fact the same
object.

Add -Wno-incompatible-pointer-types to CLANG_CLAGS to prevent these
errors.

Signed-off-by: Andrea Righi <andrea.righi@canonical.com>
---
 tools/testing/selftests/bpf/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index b677dcd0b77a..0d9ef819a065 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -356,7 +356,8 @@ BPF_CFLAGS = -g -Werror -D__TARGET_ARCH_$(SRCARCH) $(MENDIAN) 		\
 	     -I$(abspath $(OUTPUT)/../usr/include)
 
 CLANG_CFLAGS = $(CLANG_SYS_INCLUDES) \
-	       -Wno-compare-distinct-pointer-types
+	       -Wno-compare-distinct-pointer-types \
+	       -Wno-incompatible-pointer-types
 
 $(OUTPUT)/test_l4lb_noinline.o: BPF_CFLAGS += -fno-inline
 $(OUTPUT)/test_xdp_noinline.o: BPF_CFLAGS += -fno-inline
-- 
2.39.2

