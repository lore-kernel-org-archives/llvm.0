Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE9514A8E
	for <llvm@lists.linux.dev>; Tue,  8 Aug 2023 17:23:03 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-5847479b559so76856657b3.1
        for <llvm@lists.linux.dev>; Tue, 08 Aug 2023 10:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691515383; x=1692120183;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tZSxNnusQnqM7bOFqjAX37IzOmPldIdsi1KW1Hkrx20=;
        b=gLEuK3W/Hv+DbvezYqwcXKPPzm0v+UaZRRvoEQwSNCZDV3EOZcOnN4vlXwJeDpnvXh
         s8oltOqG0CscYCPYoamYi+tb35p9Y6u2Kr00jR/Qf2uQ3j1JP2+GtuwaKe/dAbnmBXl7
         +67m1XYNQdu+B9KXTR/x4BD8Z0LiSBJe4ICocI4Qzs4dL0f+D2NbGdQJaWq+oaJOGMx5
         K1TvJxWgduvpTtU+Oh4ZopmEZHv9UjDYZQgsK7ODLEa2EPO7WwI9dIdW0Tj0VIWmXFff
         yTUuKcZlKvBCza9ZbLOZH7gHwVtE28WLEiNRraKxFJ3wOzsqt2/11jOCLGsZ+F5t9hA1
         xz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691515383; x=1692120183;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tZSxNnusQnqM7bOFqjAX37IzOmPldIdsi1KW1Hkrx20=;
        b=iB+W8o7Ey6COJgtkdiQbk7wvClYb0P2DOEJ1Xt6i1qrvq9Jmk7DcB0W9RnN3a2nu/x
         /rQIbm70oCV1sNNsFvGamvaaDRqt1de70WJJRvvPmZVgnG7eCem6V1lw5IhAsDgUaLuG
         vYGJY6+Vid4390px+6Wg+/aL7m5P38dMRT5pPZi0vgstJrNfRpZOG5x2QOcdVD3dmTrK
         8XR5uwQsheKDAlk11NxrUiRfYhIIrZJdFjlU99OlkuHLxpXcp64aV3XTxKjNE4IheLD3
         qFgqRHeISk0rSlRUBw5OLG2510VWDe5Sti24xlGsmI1X4SWCDJWuvGofuelkr0KxVyTB
         Hufg==
X-Gm-Message-State: AOJu0YxWn1Ic4H+WnQKyguNhyEexSpYXXeuCxX1s1Q8A/uSnaQIuDr9p
	odA+dMnzEa+RbVrFWQyE9QK07e/R+vXhhXTpOx8=
X-Google-Smtp-Source: AGHT+IGhKIYXbGqQFa3PNzDwZFStQZnz3B4JCOhZKzQz+zmk0c/LSgrF/1imHAfTp1q4woPyqeiNcjqwpLiSdZcROp8=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:15c:2d1:203:cc03:38d0:9718:e90b])
 (user=ndesaulniers job=sendgmr) by 2002:a81:4114:0:b0:565:9bee:22e0 with SMTP
 id o20-20020a814114000000b005659bee22e0mr4887ywa.0.1691515382897; Tue, 08 Aug
 2023 10:23:02 -0700 (PDT)
Date: Tue, 08 Aug 2023 10:22:59 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPJ50mQC/3XMQQrCMBCF4auUWRtJUqHFlfeQImkzSQZsR5I2K
 CV3N3bv8n/wvh0SRsIE12aHiJkS8VJDnxqYglk8CrK1QUvdyl72YpsfgdNqNksstLKdlp1Fgxb q5RXR0fvg7kPtQGnl+Dn0rH7rHygroURrL9KNqNyo8OaZ/RPPE88wlFK+RFUcXqkAAAA=
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691515379; l=1570;
 i=ndesaulniers@google.com; s=20220923; h=from:subject:message-id;
 bh=dbN32OaDa6wdBfpJqNjWVde/ve993rqcumzB7h2wQwI=; b=R1babvoEEcd3tWtPK5ZsMtf8Mc8xS6lV6vxwZrg5QTVql2nwCMa16rXoANn9viYqoiuKT+/3y
 BOzTAe2GtTnB9GLZpkUnwwSd3r/WXgVvAvyOoYa0yBWCeDGg7+FvhPL
X-Mailer: b4 0.12.3
Message-ID: <20230808-um_hostaudio-v2-1-000b4e5e3c35@google.com>
Subject: [PATCH v2] uml: audio: fix -Wmissing-variable-declarations
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
Closes: https://lore.kernel.org/llvm/202308081050.sZEw4cQ5-lkp@intel.com/
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes in v2:
- Fix kbuild test report lore link.
- Link to v1: https://lore.kernel.org/r/20230808-um_hostaudio-v1-1-3d40fbe1fb1e@google.com
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

