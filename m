Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C023F156D3
	for <llvm@lists.linux.dev>; Fri, 28 Jul 2023 17:29:32 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id e9e14a558f8ab-346434c7793so2056445ab.0
        for <llvm@lists.linux.dev>; Fri, 28 Jul 2023 10:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690565371; x=1691170171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TyD41TjCbmVuD3Q46FNMhjbjisbmz8hDWYj37AkUnHk=;
        b=hRWim4l1+IGA137PJlwexSNurfpuER9flcSAxOm4LsJLdw4LW3UU3afJMVs4uU00D3
         1Qt5g/3GnnH930VtMFyQBycmOwkuWCDxTkUfNRg36JNk6CjHSj/4FJQSx52zavvuSDms
         r8tm/WVlJJnSmLy94GGd+gUn1klK5b8ETym7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690565371; x=1691170171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TyD41TjCbmVuD3Q46FNMhjbjisbmz8hDWYj37AkUnHk=;
        b=D1rWuCrAxxNocCTYrzlnFgpHYmACbtiEi/e4Q476UOtVb6hFtNMmITqfXK+/Z97WMP
         f66rl+iKMrnuAPSwyMpVNk9gndDApfDXY4wf0p/GnNf/1N61sCkAUy99dOenS/vfJTRq
         VoJlyc/1TgLNRJvTlWLRdaIgSPw8C5dmzoIbHoqyQtwHZqz/dPC5lXtfQ+EDQLzIfr3U
         4MdPWq0aMf46Upb4hTW40x6jTP1nT0zHn81wcsVc6SGsX6j4kk1NgNO3/vK0iYZ30Xb0
         Z2AQxRZYguTQix/mJHblHKkDd+2hDzumyd+M6Eip7y/+Qb96k9oCkNFuDVFZfoVicoTw
         sBWg==
X-Gm-Message-State: ABy/qLbEfhXKKaq4lXRpT74roV19r31kX//RZ8Yi+tahnru/TSBGFSdg
	F6Ajg52ClQ85OBiPZXkZUpMSpA==
X-Google-Smtp-Source: APBJJlEG47QTZ1NoYk+U+Zk7I8oCNRRLU7ElqoKqeRa52rla1kFe15V3Xjtvfnln+NhSRMvp/M6PGg==
X-Received: by 2002:a05:6602:2b91:b0:77a:ee79:652 with SMTP id r17-20020a0566022b9100b0077aee790652mr339190iov.1.1690565371630;
        Fri, 28 Jul 2023 10:29:31 -0700 (PDT)
Received: from shuah-tx13.internal ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id b2-20020a029a02000000b0042b37dda71asm1181050jal.136.2023.07.28.10.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 10:29:30 -0700 (PDT)
From: Shuah Khan <skhan@linuxfoundation.org>
To: shuah@kernel.org,
	Liam.Howlett@oracle.com,
	anjali.k.kulkarni@oracle.com,
	naresh.kamboju@linaro.org,
	kuba@kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	davem@davemloft.net,
	lkft-triage@lists.linaro.org,
	netdev@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH next 1/3] selftests:connector: Fix Makefile to include KHDR_INCLUDES
Date: Fri, 28 Jul 2023 11:29:26 -0600
Message-Id: <d0055c8cdf18516db8ba9edec99cfc5c08f32a7c.1690564372.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1690564372.git.skhan@linuxfoundation.org>
References: <cover.1690564372.git.skhan@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The test compile fails with following errors. Fix the Makefile
CFLAGS to include KHDR_INCLUDES to pull in uapi defines.

gcc -Wall     proc_filter.c  -o ../tools/testing/selftests/connector/proc_filter
proc_filter.c: In function ‘send_message’:
proc_filter.c:22:33: error: invalid application of ‘sizeof’ to incomplete type ‘struct proc_input’
   22 |                          sizeof(struct proc_input))
      |                                 ^~~~~~
proc_filter.c:42:19: note: in expansion of macro ‘NL_MESSAGE_SIZE’
   42 |         char buff[NL_MESSAGE_SIZE];
      |                   ^~~~~~~~~~~~~~~
proc_filter.c:22:33: error: invalid application of ‘sizeof’ to incomplete type ‘struct proc_input’
   22 |                          sizeof(struct proc_input))
      |                                 ^~~~~~
proc_filter.c:48:34: note: in expansion of macro ‘NL_MESSAGE_SIZE’
   48 |                 hdr->nlmsg_len = NL_MESSAGE_SIZE;
      |                                  ^~~~~~~~~~~~~~~
`

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Link: https://lore.kernel.org/all/CA+G9fYt=6ysz636XcQ=-KJp7vJcMZ=NjbQBrn77v7vnTcfP2cA@mail.gmail.com/
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 tools/testing/selftests/connector/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/connector/Makefile b/tools/testing/selftests/connector/Makefile
index 21c9f3a973a0..92188b9bac5c 100644
--- a/tools/testing/selftests/connector/Makefile
+++ b/tools/testing/selftests/connector/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-CFLAGS += -Wall
+CFLAGS += -Wall $(KHDR_INCLUDES)
 
 TEST_GEN_PROGS = proc_filter
 
-- 
2.39.2

