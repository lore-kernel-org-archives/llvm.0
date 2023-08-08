Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA39514A9C
	for <llvm@lists.linux.dev>; Tue,  8 Aug 2023 17:21:30 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-583c49018c6so69615477b3.0
        for <llvm@lists.linux.dev>; Tue, 08 Aug 2023 10:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691515289; x=1692120089;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A52RibxNLEy97VBVqOrueH6EOuxfxLmE/sIUm+aEQ+w=;
        b=uVZmnYoriE+9+Mq+YaugxJfh0MQ3WQB2B4J81xX5KW9BbHnW4WVpsihYMg+oVitArc
         dx2Qw47nhPdh50lsb/VLRbzhiv+TdKPdfWmhCkwr58jLsVwWiQHY0t1zutf3qfLgtZhG
         HhedOLVGzDFThVbo75z1hWiM+TCa5xtkbKT6GNy4MgmqFajMKu/HBRVKDcxoBQd+nwi/
         EgddBBgIs67pmSf8wQB90OD4iDNjLPBS5fFXz3c5Ac+8K3kImH9TwWvqh/lYgMQBzoJY
         Z6BHKA9s8oK/dPuSdLxZsgd0iuYaXfo0rXRGIHewy4wiO+Uv+SFo4jNVwHONPa6U3zC4
         YC0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691515289; x=1692120089;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A52RibxNLEy97VBVqOrueH6EOuxfxLmE/sIUm+aEQ+w=;
        b=XaF9rSCp25wVYar9FGby5LG5LXh2OG7l0kQkjtY9Rng9GzCLzCFyr8dabtLZIc/jmj
         OTWEHF0uCPcLE0n2HmbWoN16thSajAEVJOIqR5nLiyc398cypQXy3Riw3lxdPIG9c+NV
         dloDIe6QXJBbVCBZIwrMEOi1nl4n6dDYO25ieETlZcP5Ej3I98MtEeDVzx1PUzT+wpru
         ExA6Y6B2TrPXltvfVF/JKhN3S05Gnb7eDn2SPpZiqtzE0dDTesh0lb+b8Qu/rFimYlco
         cmAAg3flFk2xlNWH70wkIIxaeugzaY5hgRIYQP2HjSMk6OE8ApqJs5+W7VnOuJOHLFEm
         6nsg==
X-Gm-Message-State: AOJu0YxuX6blfx9d7kR0/DsBW4AAq0kN+cz2H3jTEAGqLkknN1XGd6mh
	ryehajlBEqdDmfCR34++qbSb1fD7yf7ezeNlOKw=
X-Google-Smtp-Source: AGHT+IGJqMAAiUXBHcdyYGpY4t2f1wB6tRaSHDofaAQJaQYlmWAQhsPJY+NqguyPoETN/GUldNNfV/ngPqHKxSm1btI=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:15c:2d1:203:cc03:38d0:9718:e90b])
 (user=ndesaulniers job=sendgmr) by 2002:a81:cb0a:0:b0:560:d237:43dc with SMTP
 id q10-20020a81cb0a000000b00560d23743dcmr5515ywi.3.1691515289533; Tue, 08 Aug
 2023 10:21:29 -0700 (PDT)
Date: Tue, 08 Aug 2023 10:21:27 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJZ50mQC/x3MQQqAIBBA0avErBPUFkpXiQhpppxFGloRiHdPW
 r7F/wUyJaYMY1cg0cOZY2hQfQerd2EnwdgMWupBWmnFfSw+5svdyFFohUZLg+QIoSVnoo3ffzf NtX53Zd2YXgAAAA==
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691515287; l=1420;
 i=ndesaulniers@google.com; s=20220923; h=from:subject:message-id;
 bh=EVNrQJhfphmof8sUAyFcvsNS+eeuJ4/HQslsOrxMtGA=; b=ZF1X+Fz/2ksGP4RCvzO1mQ60oyrQbavwKrExZxs1egjFcWlVZhzv2is/dJNtgP47UleLNYUpW
 mQqLD5mRDVyBSMNL6JDv1NR2+E9ZEW19aD5kwtN+l1Yqfv981OQX4qC
X-Mailer: b4 0.12.3
Message-ID: <20230808-um_hostaudio-v1-1-3d40fbe1fb1e@google.com>
Subject: [PATCH] uml: audio: fix -Wmissing-variable-declarations
From: Nick Desaulniers <ndesaulniers@google.com>
To: Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, linux-um@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel test robot <lkp@intel.com>, Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="utf-8"

I'm looking to enable -Wmissing-variable-declarations behind W=1. 0day
bot spotted the following instance:

  arch/um/drivers/hostaudio_kern.c:316:3: warning: no previous extern
  declaration for non-static variable 'module_data'
  [-Wmissing-variable-declarations]
  } module_data;
    ^
  arch/um/drivers/hostaudio_kern.c:313:1: note: declare 'static' if the
  variable is not intended to be used outside of this translation unit
  struct {
  ^

This symbol is not referenced by more than one translation unit, so give
it static storage.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/llvm/202308081000.tTL1ElTr-lkp@intel.com/
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/um/drivers/hostaudio_kern.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/um/drivers/hostaudio_kern.c b/arch/um/drivers/hostaudio_kern.c
index 5b064d360cb7..c42b793bce65 100644
--- a/arch/um/drivers/hostaudio_kern.c
+++ b/arch/um/drivers/hostaudio_kern.c
@@ -310,7 +310,7 @@ static const struct file_operations hostmixer_fops = {
 	.release        = hostmixer_release,
 };
 
-struct {
+static struct {
 	int dev_audio;
 	int dev_mixer;
 } module_data;

---
base-commit: 14f9643dc90adea074a0ffb7a17d337eafc6a5cc
change-id: 20230808-um_hostaudio-21d7207deaed

Best regards,
-- 
Nick Desaulniers <ndesaulniers@google.com>

