Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0647E3
	for <llvm@lists.linux.dev>; Fri,  6 Jan 2023 00:43:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E992CC433F0;
	Fri,  6 Jan 2023 00:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672965823;
	bh=n5rn1ndDy0J4oMMVBUgSely0aXqBqrOyuJvdvAA+ycQ=;
	h=From:Date:Subject:To:Cc:From;
	b=Gp9fRbHrqw00tH8HiCAyeNOv4Ko0dqddK1n+wwPyB2pqgCSM69R6hVvrdeVbS8A1F
	 detZJXlnt6wI4qXyjtm1Ns+71kWGyr+oreDwxSm1iYNrLmOfexo8xY2LdQcnkCwgUD
	 ZYTHLDJk8vPtgNFciREX69CWap2IFo9JT+blgfCsTpwKxqjlovinJVLVnfscu0NLdX
	 o5f/CmaXbEtI8wSxNo9J7i7qItjnTJXxqAcCGWdz5dErQC9FyZIjDQ3zmhZqxVwDVv
	 +ha34635clrncSD5Cl50QP2pVU93gB4OlnRWm+xC2347w+KLh0eUUh6ERvbcdSUq23
	 IBg3FDorAj1NQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 05 Jan 2023 17:43:39 -0700
Subject: [PATCH v2] ASoC: amd: ps: Fix uninitialized ret in
 create_acp64_platform_devs()
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:
 <20230105-wsometimes-uninitialized-pci-ps-c-v2-1-c50321676325@kernel.org>
X-B4-Tracking: v=1; b=H4sIALtut2MC/5WOTQ6CMBCFr2K6dkxbrARX3sOwKO0AE6GQDuIP4
 e4WbuDyey/53lsEYyRkcT0sIuJMTENIoI8H4VobGgTyiYWWOpNKGnjx0ONEPTI8AwWayHb0RQ+j
 IxgZHGSVybVxF/SZEslTWUaoog2u3Uy95QnjVowRa3rv4/cycUs8DfGzf5nVlv4zOytQcJZa117
 meWGK2wNjwO40xEaU67r+ACeGIVvsAAAA
To: lgirdwood@gmail.com, broonie@kernel.org
Cc: Syed.SabaKareem@amd.com, ndesaulniers@google.com, trix@redhat.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.11.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1921; i=nathan@kernel.org;
 h=from:subject:message-id; bh=n5rn1ndDy0J4oMMVBUgSely0aXqBqrOyuJvdvAA+ycQ=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMnb8/Y1Z18MqTqn4MkcXGLMlX/gUGaQy6qkMHHB/51ME6vq
 eZ50lLIwiHEwyIopslQ/Vj1uaDjnLOONU5Ng5rAygQxh4OIUgImwOzAy/KuXiIoRbnWfsvhmu/SSGV
 IG/v8WejGxzg5iPn7k1CX77YwMi2//yg6VU3qTf/302g5B5VDlh/lnVLjdppzbpLO96ORqbgA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Clang warns:

  sound/soc/amd/ps/pci-ps.c:218:2: error: variable 'ret' is used uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
          default:
          ^~~~~~~
  sound/soc/amd/ps/pci-ps.c:239:9: note: uninitialized use occurs here
          return ret;
                 ^~~
  sound/soc/amd/ps/pci-ps.c:190:9: note: initialize the variable 'ret' to silence this warning
          int ret;
                 ^
                  = 0
  1 error generated.

ret is used uninitialized if 'goto de_init' is taken. As this is not an
error nor should the ACP be deinitialized, just directly return 0 in
this case statement, which resolves the warning.

Fixes: 1d325cdaf7a2 ("ASoC: amd: ps: refactor platform device creation logic")
Link: https://github.com/ClangBuiltLinux/linux/issues/1779
Suggested-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Changes in v2:
- Instead of setting ret to -ENODEV and going to de_init, just 'return 0' in
  the default case (Vijendar)
Link to v1: https://lore.kernel.org/r/20230105-wsometimes-uninitialized-pci-ps-c-v1-1-4022fd077959@kernel.org
---
 sound/soc/amd/ps/pci-ps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 401cfd0036be..64648b75de6b 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -217,7 +217,7 @@ static int create_acp63_platform_devs(struct pci_dev *pci, struct acp63_dev_data
 		break;
 	default:
 		dev_dbg(&pci->dev, "No PDM devices found\n");
-		goto de_init;
+		return 0;
 	}
 
 	for (index = 0; index < adata->pdev_count; index++) {

---
base-commit: 03178b4f7e2c59ead102e5ab5acb82ce1eaefe46
change-id: 20230105-wsometimes-uninitialized-pci-ps-c-3b5725c6ed31

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>
