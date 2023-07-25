Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9413A14AA1
	for <llvm@lists.linux.dev>; Tue, 25 Jul 2023 13:05:50 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-c5cf26e9669so4715108276.0
        for <llvm@lists.linux.dev>; Tue, 25 Jul 2023 06:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690290349; x=1690895149;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5tJzMlchMGvZ+T9JwV3tPym5EeZdFxlI9guvrrUmmhk=;
        b=jCFQ6Y4bYcEDzy/p6qgLw90rtdZ3Hh30FW2hjrlxQUImuaJ3Y26BClVajbvGVC5aEu
         em4SfOLA8oRLm9cAhXGV13PZnVwZB/Xzk9vBfyG6BiKsLPemx0S5PGa9jEqhJ5lLEpKZ
         Bgkqc0rAYTVXrwV+KOFqM7TqNWZMoT+hkq5y2eChtoxpwGFnwF0h74dfVzzfrM74Alvx
         zNqS+aVvR2eJsv85h8Y1S6sJWlYDfkyONrzU7R2OHOTaFrdp62n5a8gO5h27PuDDm8x6
         BXytROdQsd1QkhdtMEkePC2HhqZmmrWm+VALKrIRGZpg8iyHWxKMVyRuskWl6jU4geS4
         gaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690290349; x=1690895149;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5tJzMlchMGvZ+T9JwV3tPym5EeZdFxlI9guvrrUmmhk=;
        b=g1Iz/FCVZJ+6c4WH6U8HF74RVUi5V0i/znV85nmIvkRon8r+I0ma6wyt3TGp+0GCFR
         4LIX0uDfKwFXbB0zInSFtLECzV9s4ZIk5OyRciS4XvY7SIxyA24EDsGSxv/+3Ws7z/Bq
         v76n5Jr0cAMHuu8Xz70RR4reT41MzNcVU5w8aeKCNn03rkji35/oSSmRWhpx3YQl/ELb
         PQAKi1jpJhekT/+Z8fhAYdbPyyicCxi2sUcG1xBpW020rhpe2aVLfzM7aPKyEf/Q/XNE
         cfJJOScBuDut1xzFqe2o//Sgf0MF4cXjBRXha/JvRspq7VvGXXbfGCHgaX2lZW9BVSlz
         aY2Q==
X-Gm-Message-State: ABy/qLZHcoE1bo23Ka9X/gh0hO5KTg79He6u00sJsFDDl9K+heD2neUd
	ecEFHMhwOmkzStBrV/DBvJpBwluulxe1olunzGZvFQ==
X-Google-Smtp-Source: APBJJlHP4Y3P++g+2unMwlOMB60A5WtMws0pr+cPcYoFFKwMaorlYfI3QPWuUf7oTXPSwxNZn3JVr03TK2rithbw4j8=
X-Received: by 2002:a25:7489:0:b0:d10:493:f6e7 with SMTP id
 p131-20020a257489000000b00d100493f6e7mr5172136ybc.24.1690290349182; Tue, 25
 Jul 2023 06:05:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 25 Jul 2023 18:35:34 +0530
Message-ID: <CA+G9fYt=6ysz636XcQ=-KJp7vJcMZ=NjbQBrn77v7vnTcfP2cA@mail.gmail.com>
Subject: selftests: connector: proc_filter.c:48:20: error: invalid application
 of 'sizeof' to an incomplete type 'struct proc_input'
To: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Netdev <netdev@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>
Cc: Anjali Kulkarni <anjali.k.kulkarni@oracle.com>, Shuah Khan <shuah@kernel.org>, 
	Anders Roxell <anders.roxell@linaro.org>, "David S. Miller" <davem@davemloft.net>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Content-Type: text/plain; charset="UTF-8"

selftests: connector: proc_filter build failed with clang-16 due to below
warnings / errors on Linux next-20230725.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

clang --target=aarch64-linux-gnu -fintegrated-as
-Werror=unknown-warning-option -Werror=ignored-optimization-argument
-Werror=option-ignored -Werror=unused-command-line-argument
--target=aarch64-linux-gnu -fintegrated-as -Wall     proc_filter.c  -o
/home/tuxbuild/.cache/tuxmake/builds/1/build/kselftest/connector/proc_filter
proc_filter.c:42:12: error: invalid application of 'sizeof' to an
incomplete type 'struct proc_input'
        char buff[NL_MESSAGE_SIZE];
                  ^~~~~~~~~~~~~~~
proc_filter.c:22:5: note: expanded from macro 'NL_MESSAGE_SIZE'
                         sizeof(struct proc_input))
                         ^     ~~~~~~~~~~~~~~~~~~~
proc_filter.c:42:12: note: forward declaration of 'struct proc_input'
proc_filter.c:22:19: note: expanded from macro 'NL_MESSAGE_SIZE'
                         sizeof(struct proc_input))
                                       ^
proc_filter.c:48:20: error: invalid application of 'sizeof' to an
incomplete type 'struct proc_input'
                hdr->nlmsg_len = NL_MESSAGE_SIZE;
                                 ^~~~~~~~~~~~~~~
proc_filter.c:22:5: note: expanded from macro 'NL_MESSAGE_SIZE'
                         sizeof(struct proc_input))
                         ^     ~~~~~~~~~~~~~~~~~~~
proc_filter.c:42:12: note: forward declaration of 'struct proc_input'
        char buff[NL_MESSAGE_SIZE];
                  ^
proc_filter.c:22:19: note: expanded from macro 'NL_MESSAGE_SIZE'
                         sizeof(struct proc_input))
                                       ^
proc_filter.c:64:14: error: invalid application of 'sizeof' to an
incomplete type 'struct proc_input'
                msg->len = sizeof(struct proc_input);
                           ^     ~~~~~~~~~~~~~~~~~~~
proc_filter.c:42:12: note: forward declaration of 'struct proc_input'
        char buff[NL_MESSAGE_SIZE];
                  ^
proc_filter.c:22:19: note: expanded from macro 'NL_MESSAGE_SIZE'
                         sizeof(struct proc_input))
                                       ^
proc_filter.c:65:35: error: incomplete definition of type 'struct proc_input'
                ((struct proc_input *)msg->data)->mcast_op =
                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
proc_filter.c:42:12: note: forward declaration of 'struct proc_input'
        char buff[NL_MESSAGE_SIZE];
                  ^
proc_filter.c:22:19: note: expanded from macro 'NL_MESSAGE_SIZE'
                         sizeof(struct proc_input))
                                       ^
proc_filter.c:66:31: error: incomplete definition of type 'struct proc_input'
                        ((struct proc_input *)pinp)->mcast_op;
                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~^
proc_filter.c:42:12: note: forward declaration of 'struct proc_input'
        char buff[NL_MESSAGE_SIZE];
                  ^
proc_filter.c:22:19: note: expanded from macro 'NL_MESSAGE_SIZE'
                         sizeof(struct proc_input))
                                       ^
proc_filter.c:67:35: error: incomplete definition of type 'struct proc_input'
                ((struct proc_input *)msg->data)->event_type =
                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
proc_filter.c:42:12: note: forward declaration of 'struct proc_input'
        char buff[NL_MESSAGE_SIZE];
                  ^
proc_filter.c:22:19: note: expanded from macro 'NL_MESSAGE_SIZE'
                         sizeof(struct proc_input))
                                       ^
proc_filter.c:68:31: error: incomplete definition of type 'struct proc_input'
                        ((struct proc_input *)pinp)->event_type;
                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~^
proc_filter.c:42:12: note: forward declaration of 'struct proc_input'
        char buff[NL_MESSAGE_SIZE];
                  ^
proc_filter.c:22:19: note: expanded from macro 'NL_MESSAGE_SIZE'
                         sizeof(struct proc_input))
                                       ^
proc_filter.c:245:20: error: variable has incomplete type 'struct proc_input'
        struct proc_input input;
                          ^
proc_filter.c:245:9: note: forward declaration of 'struct proc_input'
        struct proc_input input;
               ^
proc_filter.c:264:22: error: use of undeclared identifier
'PROC_EVENT_NONZERO_EXIT'
                input.event_type = PROC_EVENT_NONZERO_EXIT;
                                   ^
9 errors generated.
make[4]: Leaving directory '/builds/linux/tools/testing/selftests/connector'



Links:
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2T3676HpK243gMBLYJCp4OXDmWl/

steps to reproduce:
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2T3676HpK243gMBLYJCp4OXDmWl/tuxmake_reproducer.sh
--
Linaro LKFT
https://lkft.linaro.org
