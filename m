Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2343C3B56
	for <llvm@lists.linux.dev>; Wed, 16 Mar 2022 21:31:30 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id n66-20020a254045000000b0062883b59ddbso2958645yba.12
        for <llvm@lists.linux.dev>; Wed, 16 Mar 2022 14:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to;
        bh=3dsz5dbH5kEyW4axTTb+7KMz2gUw7wSKEz7pXvCGPrI=;
        b=ruNLN0QUwD2+P/9mZCFcDHrzi0ACCz+1MTWu1lIN6BlCsR0ly2aiNUo/Kp40a3AMeJ
         /AUHpc+OYELZsczBMIrwsmu34ZCChO0UYpeq4IJYA/tJeGdgBUzKrX/3TDX3tTTeQLGD
         p7HkXsxTU9QgSSDw6W8qSpv4+qNduinc9sF9GGrB97i2uexR2aMNoaYmlVdp0X2OprvF
         2X/oCyWd7u/ZWhPWF5T5kbF4qACt9+aPjNxcSQ+aKQzT3+XSQIbLV1SSB34suAM+Jsdp
         pxXqFP+lRP/VCkmPc4bLIY0vjKemGmUX8owFShWx3qArUJuQ325C0GcvzKGs+8aAnHOy
         daWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to;
        bh=3dsz5dbH5kEyW4axTTb+7KMz2gUw7wSKEz7pXvCGPrI=;
        b=DIOn9xWkQNn5DkPDwI3O+xzustfhnm4LdM5SKQs2dRSX3ua1SqSy1gJEZ6/SBoMdKI
         u/trnbZvYtO2ZsrV7bgD/BQOARWlZCTN4zwszudWFQ2F2wBTNd998rmDvSjsSgYmque+
         JLy73YQ7qnseCI4qyjM6YmHllKlvpYDeV+TbX6WgDebtgHr+GYIeSzAUuSqZz8x2sZxF
         dr02sZVwA4+hGYXj2ggwM8Zb9Oil3Lx3Ql2tgKUXEMyZxplH4P8tDq6/zKvf3PirrH5x
         HQBEtZQYAbiRf0ObL5O3KYC/CWTQDEJceR6Da//kQvsg6eYL+QaY68yI3icJxUPCQz4q
         OBng==
X-Gm-Message-State: AOAM533fO+W4g+gyb1rbYhCfgtkPRXL4LqehypelcZIMwbj+MG0mtmOe
	LIHoVSEYvBcZQ/xn/h2jkTC227/X
X-Google-Smtp-Source: ABdhPJy1RUm7WtIB242YqrV+NlR2c3Uq5jQuRSedyLxsPeiksy1rrgcfsuz3Cam2NAcioXpHWSZZ7tzVFw==
X-Received: from fawn.svl.corp.google.com ([2620:15c:2cd:202:7dae:6503:2272:5cd1])
 (user=morbo job=sendgmr) by 2002:a25:e78e:0:b0:633:9df1:9fff with SMTP id
 e136-20020a25e78e000000b006339df19fffmr1426122ybh.233.1647466289213; Wed, 16
 Mar 2022 14:31:29 -0700 (PDT)
Date: Wed, 16 Mar 2022 14:31:25 -0700
Message-Id: <20220316213125.2353370-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.723.g4982287a31-goog
Subject: [PATCH] vlan: use correct format characters
From: Bill Wendling <morbo@google.com>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

When compiling with -Wformat, clang emits the following warning:

net/8021q/vlanproc.c:284:22: warning: format specifies type 'unsigned
short' but the argument has type 'int' [-Wformat]
                                   mp->priority, ((mp->vlan_qos >> 13) & 0x7));
                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

The types of these arguments are unconditionally defined, so this patch
updates the format character to the correct ones for ints and unsigned
ints.

Link: ClangBuiltLinux/linux#378
Signed-off-by: Bill Wendling <morbo@google.com>
---
 net/8021q/vlanproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/8021q/vlanproc.c b/net/8021q/vlanproc.c
index 08bf6c839e25..7825c129742a 100644
--- a/net/8021q/vlanproc.c
+++ b/net/8021q/vlanproc.c
@@ -280,7 +280,7 @@ static int vlandev_seq_show(struct seq_file *seq, void *offset)
 		const struct vlan_priority_tci_mapping *mp
 			= vlan->egress_priority_map[i];
 		while (mp) {
-			seq_printf(seq, "%u:%hu ",
+			seq_printf(seq, "%u:%d ",
 				   mp->priority, ((mp->vlan_qos >> 13) & 0x7));
 			mp = mp->next;
 		}
-- 
2.35.1.723.g4982287a31-goog

