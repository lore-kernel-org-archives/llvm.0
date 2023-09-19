Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F45C1EA78
	for <llvm@lists.linux.dev>; Tue, 19 Sep 2023 20:38:38 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-d81646fcf3eso6714133276.0
        for <llvm@lists.linux.dev>; Tue, 19 Sep 2023 13:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695155918; x=1695760718; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tbuv3yAsMwGHjewKzCIjCL5MGM7AzGA9bemOVcUbEtw=;
        b=gSou9U2+/4fQVcQd6Br/2pK94KtZ+MTFBi+4O2yrnvihcYysAm8TYEyci494gjhJc4
         ytvS61PgeyVjQLLIqysWg+VggAb8cav74DPBUtp3SEKeizs1YICUzsY6HhFkUs7Mj1H3
         FcajUDJ/Kao4nznDEJZjxXoGD/XkAPUdewddMItXfN8ElDFG/azqoqi/0P6cO6KekrfX
         0Qpi9N7kQTdwQi7Vk+Y4B5jKHlUGkpQmezRGjltHb3zL2y/z2mpptNVbh3xgxP4kz0+v
         aEs7dbKYfiiW3a7hD+hqJcfFgSDj4GDs/W//kRHoI62ujIksfo141Fr9+cRWRvKwrP7i
         T2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695155918; x=1695760718;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tbuv3yAsMwGHjewKzCIjCL5MGM7AzGA9bemOVcUbEtw=;
        b=LFg9CmpPzqDDjsksNVqU+eaBd1LfV0X9Q1HPksS2YZHr4+gg9vzOcwJQfOhtM42/4i
         j17gkJgMSUMOBEzqpOS4Z/85wNH843JnhTVA2gHbu6AZwGhEv/Fs/I2e0uwW/KilWkS1
         YyadcqUWz81WkeFlzWRxPTX7dUe18qdphK7O9AO5wh+KMVjxGmj4qoRi/F2hF5gIEBf4
         lMJTvCxnZz7leYpdesGzYaRMU7NUdXvfC2OICbSfJMwSHaE5eIOIgqnsg8hxKsQd6G3P
         i1FSZMjXsAoRKDGAO0KLthY2jdFPWhZYmHRyx5cYsjCikanJqsyoduBwOypQxDbeUwTT
         Dt+Q==
X-Gm-Message-State: AOJu0Yw/dmbDL3Q2DUBKet60ZnyBQNOeJefnxyXnADKIZS45UW+uOIUD
	CYQngq6ZPbfy9bD86O/INO/fGgidsyK35UgqqmI=
X-Google-Smtp-Source: AGHT+IH1qq6nUKqNZAK0YbjQJqKgVehqq9+7WX6fVL5KBywAr2lAwKAHSABqQpymxSSriK5MEDbTCsc7ZmInmh67k3U=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:15c:2d1:203:118e:eaf2:1433:f9fe])
 (user=ndesaulniers job=sendgmr) by 2002:a25:4109:0:b0:d35:bf85:5aa0 with SMTP
 id o9-20020a254109000000b00d35bf855aa0mr9310yba.4.1695155918049; Tue, 19 Sep
 2023 13:38:38 -0700 (PDT)
Date: Tue, 19 Sep 2023 13:38:31 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMYGCmUC/x3MMQqAMAxA0atIZgu2dVCvIiIxphqQKg2IULy7x
 fEN/2dQTsIKQ5Uh8S0qZyywdQW0Y9zYyFoMrnG+6W1vFkLaOeisfIQZVWWLxiG13rYeOyIo6ZU 4yPNvx+l9P2dmiUVmAAAA
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=eMOZeIQ4DYNKvsNmDNzVbQZqpdex34Aww3b8Ah957X4=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695155916; l=1046;
 i=ndesaulniers@google.com; s=20230823; h=from:subject:message-id;
 bh=Co/d3mAUVcLoGAAxSpLDv73hB10uZG4S2eLmRtrW6TY=; b=55wTFO4UFDKkYg4VeCIdNLlPDaZUcDJbyBYyI/JJ4cuZJm02dpFVSLxRA8IvgcWjAN7a9rKfD
 p9b/a62WkELB2UmQHLhRA+StthSwDn8/+l73C3FnJQvt2yXqZP7PRIC
X-Mailer: b4 0.12.3
Message-ID: <20230919-bcachefs_self_assign-v1-1-830936792fc9@google.com>
Subject: [PATCH] bcachefs: Fix -Wself-assign
From: Nick Desaulniers <ndesaulniers@google.com>
To: Kent Overstreet <kent.overstreet@linux.dev>, Brian Foster <bfoster@redhat.com>
Cc: linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="utf-8"

Fixes the following observed error reported by Nathan on IRC.

  fs/bcachefs/io_misc.c:467:6: error: explicitly assigning value of
  variable of type 'int' to itself [-Werror,-Wself-assign]
    467 |         ret = ret;
        |         ~~~ ^ ~~~

Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 fs/bcachefs/io_misc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/bcachefs/io_misc.c b/fs/bcachefs/io_misc.c
index 668493bcfe36..32432bdddac4 100644
--- a/fs/bcachefs/io_misc.c
+++ b/fs/bcachefs/io_misc.c
@@ -462,9 +462,9 @@ case LOGGED_OP_FINSERT_shift_extents:
 				bch2_logged_op_update(trans, &op->k_i));
 	}
 
-	fallthrough;
+	break;
 case LOGGED_OP_FINSERT_finish:
-	ret = ret;
+	break;
 	}
 err:
 	bch2_logged_op_finish(trans, op_k);

---
base-commit: 29e400e3ea486bf942b214769fc9778098114113
change-id: 20230919-bcachefs_self_assign-2ac43143a8cc

Best regards,
-- 
Nick Desaulniers <ndesaulniers@google.com>

