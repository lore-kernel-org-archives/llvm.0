Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B47E63B3;
	Fri, 11 Aug 2023 13:45:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA918C433C7;
	Fri, 11 Aug 2023 13:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691761555;
	bh=PrLAN+PGrV3ZLZn47Uvte1I9dCtyNavw8JBu8sftjNk=;
	h=From:To:Cc:Subject:Date:From;
	b=adDQjMQ4bDeU4DvWR3BNNYReZyacWrVEGHAOf1NpTtZYkICZo0mW2CLacA4z52QWV
	 u5ia/HrShnKJNvbsOOFedZQyFxju+oXGLOo7B1ejbIxqYBCawXfyqg9hRIMkiG+K6P
	 +RcwcbJquhdUDfxhPGd0lUkGPeVIk/C/9/waNI5HQVJTZYYJGvqDJd/dpDLZTW7UIS
	 TZdDJn3WWFq/BFlbRnmjZTr6R3pKDxuhGmvfTC6pwogHRiiVhCqI5A6NAjCksvGi1V
	 xd4nUp6GRvddc+Pg8ZJs5K8H8YW1PWhOzJJtuEMQjVi7SJX3hR7sCSqFfnCfLYZrxu
	 pXoQ4zdSbb+Dg==
From: Arnd Bergmann <arnd@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Tom Rix <trix@redhat.com>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Vivek Pernamitta <quic_vpernami@quicinc.com>,
	Carl Vanderlip <quic_carlv@quicinc.com>,
	Qiang Yu <quic_qianyu@quicinc.com>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] bus: mhi: host: remove unused-but-set parameter
Date: Fri, 11 Aug 2023 15:45:41 +0200
Message-Id: <20230811134547.3231160-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Clang warns about a parameter that is decremented but never evaluated heere:

bus/mhi/host/main.c:803:13: error: parameter 'event_quota' set but not used [-Werror,-Wunused-but-set-parameter]
                             u32 event_quota)

Remove the access to the variable to avoid that warning.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/bus/mhi/host/main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 74a75439c7130..dcf627b36e829 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -938,7 +938,6 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
 				if (!mhi_chan->configured)
 					break;
 				parse_xfer_event(mhi_cntrl, local_rp, mhi_chan);
-				event_quota--;
 			}
 			break;
 		default:
-- 
2.39.2

