Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863F66100
	for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 20:53:23 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-33d9f6f4656so190015337b3.21
        for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 13:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc;
        bh=y+bRnMssrUj/6kbuuva6fXkHo2MrxrsD3o5Kbak+NiU=;
        b=eZwlVRJt892OWPFcvi3mSbbvEI013rOlwJ8QFYrdL6uKjYm2rCWX6K68pF3YCAeqiZ
         qgvPewGSY4+Gp/tXYr2XcFTkyewTDkv/8WPDwyCYAD678FgT1G45MEEmFFJsHyGNo9li
         M170u06nyQlYu659TVabIgtvqCDsqX5PyIVvdS8qYxzp8EvC5H38brNE3E2jYm5bePYx
         6UFwdh9z2Trb+JL9+RtcuaWjK7YLGRcbursv/mRBHLd5869bB7MYcP01QIc+7YNKXGp/
         2sr6/L9MsXDF55j4skMQAOaraXUefeIGVU7QPhKNyLAlR6x3dVZnNX+Bl2b88eQw/2FQ
         FaMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc;
        bh=y+bRnMssrUj/6kbuuva6fXkHo2MrxrsD3o5Kbak+NiU=;
        b=Y2svPKT+CBIuiew6krexGmpB2Z7tuWPXi30r/LH+eh5bEmy3v5d39eLoT6f8Qs/Gis
         YoUTJ2S5R9H93p8qiyDV3xC8YyL5L8uvoDzUjHDq8/HT2vvO+7+FrHKVYyd2MDXG85MH
         1X93d9DbIBJuiKzyUFs7FsYTZYObaKhefcFr5xtvndXl00eC7igr57NbaYCE7Zk3/kj2
         8Bux+TX1i/8p4XzjIWR1LMnZyauasUl3ZTXKukZpRuYTh+739eIpwejCzsuAonu93TH9
         EcEUyQu0zlDlHwORNYEi2SSZkHdzxvW0Rl4B9wrSGmDr4eXwvs9+xCuMhmWz1/AfauGU
         qAQw==
X-Gm-Message-State: ACgBeo2Jvboz2MX3XnuI/47BTn8nEN/oiWb1VgzmYjjJarjTsQaQqtQn
	mJSfy9HZYNNcHlORXuu7PsGH4XELcXBieIP9Vec=
X-Google-Smtp-Source: AA6agR6LzzDTJp8/LLgR2tYJHvqNLA1ncTKB/GwiQ/kK5y2JZRXJnpE70VKmyZAmXfDvIzDo4To3MyuHVPeXGdtOKfg=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:0:100e:712:422b:cadb:302a:7901])
 (user=ndesaulniers job=sendgmr) by 2002:a25:7cc2:0:b0:677:5a84:9f79 with SMTP
 id x185-20020a257cc2000000b006775a849f79mr13577501ybc.518.1661892802516; Tue,
 30 Aug 2022 13:53:22 -0700 (PDT)
Date: Tue, 30 Aug 2022 13:53:06 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1661892789; l=1211;
 i=ndesaulniers@google.com; s=20211004; h=from:subject; bh=zURt4cRkM9uRF4OuY2wV5cBpIhomPe0G2hadM5Q8amw=;
 b=bLH7JZthL0TsoZymjEI/Nxr8slOa9cg2x+NNHCAC3iV2z7Bk+diYAGjVVEJBHUWsrjvF7VXLCwc/
 a59b5uZjDMXpquiHqECzSVTdCS/k6DqsZi5T4Q7d/+nLj6TzLaa5
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220830205309.312864-1-ndesaulniers@google.com>
Subject: [PATCH 0/3] Fix FORTIFY=y UBSAN_LOCAL_BOUNDS=y
From: Nick Desaulniers <ndesaulniers@google.com>
To: Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	linux-input@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

With CONFIG_FORTIFY=y and CONFIG_UBSAN_LOCAL_BOUNDS=y enabled, we
observe a runtime panic while running Android's Compatibility Test
Suite's (CTS) android.hardware.input.cts.tests.  This is stemming from a
strlen() call in hidinput_allocate().

__builtin_object_size(str, 0 or 1) has interesting behavior for C
strings when str is runtime dependent, and all possible values are known
at compile time; it evaluates to the maximum of those sizes. This causes
UBSAN_LOCAL_BOUNDS to insert faults for the smaller values, which we
trip at runtime.

Patch 1 adds a KCONFIG version check for __builtin_dynamic_object_size,
and uses that in __compiletime_strlen rather than __builtin_object_size.
Patch 2 and 3 are cosmetic cleanups, they're not as important to me as
patch 1 is.

Nick Desaulniers (3):
  fortify: use __builtin_dynamic_object_size in __compiletime_strlen
  fortify: cosmetic cleanups to __compiletime_strlen
  HID: avoid runtime call to strlen

 drivers/hid/hid-input.c        | 13 ++++++++++++-
 include/linux/fortify-string.h | 15 ++++++++++-----
 init/Kconfig                   |  3 +++
 3 files changed, 25 insertions(+), 6 deletions(-)

-- 
2.37.2.672.g94769d06f0-goog

