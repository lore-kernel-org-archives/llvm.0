Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBBE23B5
	for <llvm@lists.linux.dev>; Tue, 15 Mar 2022 15:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3631C340ED;
	Tue, 15 Mar 2022 15:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647358252;
	bh=KZKmrba8eRL+XKQVvxcQv8pWiae32P/l8rRrRIJrdPM=;
	h=From:To:Cc:Subject:Date:From;
	b=TSV+fY+CreyEy7BE/Z+rkW57+Pvr/EeSpKv0WFWIxeLDqKF7AIe/uSVPzDSc9WDci
	 4SAsG4i42t2BIIdu9EsEKzlDU9R0UBb0qeB09UpsVcnlwiHZHR446T5kYXhv7teFLW
	 o95n//60GN3R4HT7pUSlNxaD/+eBJJ91RbHN+/0OPFkxEwFtGChwpYagCYlWpOBizH
	 pgLHDG+EeihklaFsFfB9qR7OCkdvNZLJu2Lj5taXELGZiNjDeDuICkqzP7nSrDcXZN
	 OFErpC3AqPVm3Fhi9fPvJK5bXiXYjIBT3HMOtr9ILV97zL5OXGFqJmSEtQ1H/5+TQw
	 5O+CJ3KPtBFbQ==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2 0/2] linux/types.h: Tidy __bitwise, add __CHECKER__ hints
Date: Tue, 15 Mar 2022 10:30:46 -0500
Message-Id: <20220315153048.621328-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bjorn Helgaas <bhelgaas@google.com>

- Tidy up __bitwise__, which is unused except in the __bitwise definition

- Add hints about what __CHECKER__ means


Changes since v1:
  - Also remove unnecessary __bitwise__ in tools/include/linux/types.h
    (thanks to Andrew for pointing this out)

v1: https://lore.kernel.org/all/20220310220927.245704-1-helgaas@kernel.org/

Bjorn Helgaas (2):
  linux/types.h: Remove unnecessary __bitwise__
  Documentation/sparse: Add hints about __CHECKER__

 Documentation/dev-tools/sparse.rst | 2 ++
 include/linux/compiler_types.h     | 1 +
 include/uapi/linux/types.h         | 6 +++---
 tools/include/linux/types.h        | 5 ++---
 4 files changed, 8 insertions(+), 6 deletions(-)

-- 
2.25.1

