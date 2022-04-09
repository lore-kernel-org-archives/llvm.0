Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10E97FA
	for <llvm@lists.linux.dev>; Sat,  9 Apr 2022 10:20:27 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id b43so14307093ljr.10
        for <llvm@lists.linux.dev>; Sat, 09 Apr 2022 03:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n4Zl1IUxP7WaOSfw1jsy76q0LhMby1ouy62pDNc0Q4s=;
        b=NZfatcEit4I13GXA6crtJcqIr4+6S29r33mb2AKAvMrGcFGrKfAU6TKdufyWL1/cXW
         elC6jxN1EyMUCAofIOZa89HoflwTu69a4c0Tuf9IfYO1OWbjiSn+06Zvn87Cy/rVRGIa
         5eK5cF2VlZN2KX9R+ImdpNsOWTsvrqiYD0Yf90QZkVcx+5LLXh+alU4PAGRsc2wadPlb
         1GnHYpzZ+DKQAhIca/zkS6i5E+f/RM4Quw6s2JI8hnNdypgwVsCd8WNsLKzjyVMc0cEJ
         849a7Gp/pzOS2v+pnMBESbSNq0g6BVMDFtfhz7nV+SR0rHn+P4E9o4Ea77Q73nb/mQn6
         HzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n4Zl1IUxP7WaOSfw1jsy76q0LhMby1ouy62pDNc0Q4s=;
        b=ADWY6ol9oPfIKpaEAPpwyJeCFeeIGk8Vp05rK3sAb5txrFKirLoM59ecE/JhbJ68x4
         jh2x2JzsGSoH5F36uoBcEC+eK5mBxcftdnhRprl/WkgMRalFCAFicwg6hJwkERA9Q4LW
         qtA+g+rX2tAjfBCun1woXAVtsRandyBvPkMhEYATjFp9Z8RlRDnwkqUhev7unQKyhLrh
         a1OZyvYx5kw1me8nDu+eYf6ZKl2WXLe2TFNUIBBqlmV2Q1Tvq7r8RBa6Rz+L5/TlMFsY
         hK++GnkxoQMjT9JNykZJK5feGAbjxKcJb92YSEUwbXy/tNo4Q60n6JtccGz1Xdk/EsuX
         Hsrg==
X-Gm-Message-State: AOAM531sFVyNa55DvykqTwBukRxh+Hua09cu/C+mkhyf53C0t05ofNUG
	nAairl1tzr1lUje2aNgMkuo=
X-Google-Smtp-Source: ABdhPJznNYKp3fWw3ZrGe44GgmwcvXordVC1DLcpKpi67HvhXE6u5Cd+zk1zr/AfsLGcf3jM3L2e/w==
X-Received: by 2002:a2e:a596:0:b0:249:7ecf:606c with SMTP id m22-20020a2ea596000000b002497ecf606cmr14480320ljp.114.1649499625292;
        Sat, 09 Apr 2022 03:20:25 -0700 (PDT)
Received: from morzel-asus.lan (static-91-225-135-18.devs.futuro.pl. [91.225.135.18])
        by smtp.gmail.com with ESMTPSA id h8-20020ac24da8000000b0046b8a03301bsm363680lfe.137.2022.04.09.03.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Apr 2022 03:20:24 -0700 (PDT)
From: Michal Orzel <michalorzel.eng@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Cc: Michal Orzel <michalorzel.eng@gmail.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] ipc/sem: Remove redundant assignments
Date: Sat,  9 Apr 2022 12:19:31 +0200
Message-Id: <20220409101933.207157-1-michalorzel.eng@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get rid of redundant assignments which end up in values not being
read either because they are overwritten or the function ends.

Reported by clang-tidy [deadcode.DeadStores]

Signed-off-by: Michal Orzel <michalorzel.eng@gmail.com>
---
 ipc/sem.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/ipc/sem.c b/ipc/sem.c
index 0dbdb98fdf2d..38ef91a63edd 100644
--- a/ipc/sem.c
+++ b/ipc/sem.c
@@ -766,7 +766,6 @@ static int perform_atomic_semop(struct sem_array *sma, struct sem_queue *q)
 	for (sop = sops; sop < sops + nsops; sop++) {
 		curr = &sma->sems[sop->sem_num];
 		sem_op = sop->sem_op;
-		result = curr->semval;
 
 		if (sop->sem_flg & SEM_UNDO) {
 			int undo = un->semadj[sop->sem_num] - sem_op;
@@ -1430,7 +1429,6 @@ static int semctl_main(struct ipc_namespace *ns, int semid, int semnum,
 	if (err)
 		goto out_rcu_wakeup;
 
-	err = -EACCES;
 	switch (cmd) {
 	case GETALL:
 	{
-- 
2.25.1

